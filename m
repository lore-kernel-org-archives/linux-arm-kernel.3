Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEEDC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxyNJvaFnNxHerMMufs0K/uUcVxpSEfQTxbEEXxGd3U=; b=I2ElVzsCwjA0Z9ts1/ZqlfaCsT
	N0/albbXYmAHIp6L8FPsq0N0IuffgEc9JbWNtIYZh7/X0OeqhVtvgmxcHhBlkhcb9mzOipdNZrONY
	cp+YTKu5cB2MJY+xZweg0uprPV0xVl6u//WDuu1e6nyGMCTwEIjaLIp3V2bGlnUhITDUGtwbmv2Am
	WtIKbGjRGZC9uB+lPL/UbNdYYX38DNLSQcv6aobYlaEU1sS1ql/VRL93HlXaFhIO+6uOYROcQoHsc
	PimI7bySSzew1NPZPBBFrj6EyNM26G7s0Uci7PnfF8p42KNM0oiGXLAUjq9opZxypndmHl57XlYd3
	FsEOiFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpXi-00000009g1w-007E;
	Wed, 18 Jun 2025 09:57:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpHO-00000009d9m-1Xhz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:40:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-747e41d5469so7051575b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750239625; x=1750844425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxyNJvaFnNxHerMMufs0K/uUcVxpSEfQTxbEEXxGd3U=;
        b=ic38AuDLDuCr0ouhWP4WwtX1ZILjvFI6FHYXX2eTZNdfKNyag4++mFiq06L1FvqipM
         FReVzGs4boWd/6pMwIRhr757QYElee/HG2LRAtAqru7i8xADSHpwP9Jqa5sAQD8SDrHz
         +avQGIsSJiR2cDAe9a9Y5P39nr/dL/FUSKmUFtJuUonA58abbI2WKlqaADvGwiNrtCjS
         DaXZfw/nWvOG14I5IYnQtuiO/XWNEn9vJCicPaq4R3P47yVIrByG9i+z5EMlOqKVZDQn
         i8s+YO40qgSwYCo+zIXIJaacMPzu3NCrYkN0ODBhVzzKLoT+9yJMZburzIpVgnHmyQa1
         89WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239625; x=1750844425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxyNJvaFnNxHerMMufs0K/uUcVxpSEfQTxbEEXxGd3U=;
        b=LCQJ59B3JcBSBqziRuS4RnX+3pdmuf3GC9yfsEknnVS0kKjNdhQ/ytXmlO9CP1Zoci
         NQj5aF4TlCRC7L07bm6uyGGv8CPQQ6ncPragGVxjlMhqBqsSX7JEhR3kEjXo/1YET2MT
         uehJXN+gs+kCROGNJHhgDydX1Ma3W3LyFEg0O/DL6UPdWaa0RG9a6TlwwHwOyh5d1OKt
         oO9osJHSkIUW9RlOauLJX6eu4WI3+an59XoJ6ugTPg6mj7R7H12Vzve26uSRvN7b+l3y
         ztRlcSj2oYgtF32h5bmxoLLi4dKXn1rz7HbG/9hjKShy1fzd47iMJI3ubNGoQ2kpPbDn
         7Eug==
X-Forwarded-Encrypted: i=1; AJvYcCWE4Zmo0ImCN4hep4fNxuKHAArfu+jdjA8HaYmUCT3jAH9EvguaFWsOZ3sksNMiTK+MShoyxLyOLq2aJEl69eTq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv90SAeHeyXvavcEKBPwoP0FaZm/sQHOlBGHgd83OiQzIi+txS
	4OlKT10vyXF1Zb9M0YwqKvuL5vOzRuKcjYXDmtNKKZ2twUzP9y2tYUyV
X-Gm-Gg: ASbGncugg4znGiRd7e5NVj7hxib8Er0+LdcnsWfPILW+BR6NPbV9M4SmD0wDgQdQY8d
	uguic7anexoEiLTMzpyCs5TxqZqeCz3RKzaN8Na6jJkpn0dh48Pd0WAoFeHEsiz6+PempOztLj2
	y5kEXHqvdkRSyGMOEerMQeTQTJ/9/ykIzw9iJ5neYHgdt/AfEeMNSOu2tuQ8BM+aT6zE+ayCkSU
	Xzjor+bowjSbATeKgdknGOTIiSuJD7BtRcFD9RbyXQWxqyaQnTDSorEU6zoWfuY/vbZyBzwHZ0u
	YPToO5Qtmqa8yGPhWbiT2SDK2Ik/3XFTwyi2Aqg0MCXRCgAQHc/aQIYaX24yR7jnFY65aHsMQYL
	qvscGgY4z9IdpbtkwNM77JM17zeMEcM8IN+RVDBVExQ==
X-Google-Smtp-Source: AGHT+IGIFkT9F9++RE5EjOQYpeKdGxSShR/I1mIh5GQ/Kl0wHl2IVWy44QjHga7/1JaOEFqYchwQqw==
X-Received: by 2002:a05:6a00:893:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-7489cffb9ddmr25901716b3a.24.1750239625553;
        Wed, 18 Jun 2025 02:40:25 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee2aesm10527123b3a.24.2025.06.18.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:40:25 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 18 Jun 2025 17:40:02 +0800
Subject: [PATCH 1/2]
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
References: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
In-Reply-To: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750239618; l=939;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=GnJuV3HZHZ5dsfk5omBq556B4S6C3GeRW49ZlxKiQm4=;
 b=kKncC1/JfGB/N2IhW8rVIODlEvFaJAyarQUMd5sSJNJUJOeW9FTUDNZ+HazhqmrGqkNcIPgk7
 1Pq8/J1gtwtDKVQlAfgt2NZ9yC/3HZC2ixJ9zGBeriuVgFpHIe0dvQ1
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_024026_406920_12391A26 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


