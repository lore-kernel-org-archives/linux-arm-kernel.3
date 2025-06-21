Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C69C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=; b=ZpHlDUCZaGEzVoy5MogWJYLmTG
	WyNnMCtRgOuKpg4buuLwGrsIU/IJLOIVHq/53MKA9edeipnm3jTIM2Uy9cQzDMWpRKlIbLqGM8i18
	OCkHqvQpq1ynvl6zgEBECLN84PjqEJ/QMv7guGyH0mf538/DwoJQdh1y3sWQJf7sXp4SeA8yzFS5U
	gn4logyiSQYffgsLkgUWCse2If1RzOfRmVJuU4/2Xqt5xutabP6ZUxxQiE5CxusdP1heAATPko0mY
	7SeNNKolzoYygbL58e4WzkCg6E8AadbXGvha7wIt/DMv3VqZi8Eo6XD3CB++oX381eCXPvlfBPMp6
	u8t8gyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSt54-0000000HE2u-2ors;
	Sat, 21 Jun 2025 07:56:06 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSt0g-0000000HDmE-3i7g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 07:51:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b31bca0a32bso1845722a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492294; x=1751097094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=QpqvvdbL1au8BMAUs93xsZCMcITzLSieMFxZ7nOcYmtEam3Ay5RlsprShOB4hS8UzW
         91Fi9n/ndwvUVYUsYOA/nzZxwfV7/5VfNUnycQcaRtix1Kx9Txk0wPGpk9NL0WBALcC3
         CIYka6s/yfVCf8lRK9KERCBGI43lnG33cEh4mjNJt8Nt7vw3Arr2wD2Re4eY6/GBztTv
         C8w5wI4rSz9/VGgClvig+4aYw5e5T4JBZDz49cW8uAVY57U6Q8w8oiiHzC9sIL0TnbE4
         1P8tfmOnDkcdz4U1NVP235uV4QsgI5H8PlOmUGDx9Xoklvk8Lx/+jrF/dTi5kG+XFAD7
         Zgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492294; x=1751097094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=WeYeGcrZmCKAby0WUHmUzgNge5Z7hXRTCKs1KS8TTmGld1RABOI42vNiDoIZ6HJTQR
         UlntPNmbusHbeuBOmV79g0qxoclHnirLdJcBEWWIGxm32PeAU5TbqvLsCb4shCIOh+Y+
         4jD7ockjZcDgdpbXZAFIlTJ18a1UXQ9+LLgzO17GQ8FkSWcPsMD+TDBJn+nXqqeAZftM
         XqJZr/amJZWkrmQ1azS/10IRMYTuWKy9jy4WaPh3wBfNt5QO0fcnkPWVl+PzMhKSOF7q
         2tf8ZYk/H0+bpmZ27OWqK66sixdmx8UpVEx7fxSzMG57J/PdVVPZO94FCu10zs53akLf
         f5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCViETUyTsaW5uLCDeYxE98DdPD9sUnKR7z0tYadVhiJZqhh6GWCQetWWccNHei6TBO+N6vOdjMYQ6er3Q7amfmk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6+x7gWsYaNObS7YAdR+h55mcuKMxg4oUWeBeVT5Q/NcDri1mz
	x8+dx8I35K3VFH0MKVhVIcecgd0jG8+v82T6yHM3BEwEBqNlr9Dq7EXF
X-Gm-Gg: ASbGnctVlpx7CuTIBtVu8dyNGFsdN9s74kBKzZUoxXM9R/FhDSUPmkD6I6iLrqsw8XZ
	dR6FE5niWSKTlZw/UBw0VRQlT6YBo2zUGADNzMVjeJjcDXm8mV6O9tZO9y5I5ScRxNUVl/YA/ME
	mqD3qSilqJhSvOgSEgfavwF1Nz0VvxbwnZJlXSRgmY+W9ZkByKO9JYyO74Df2ZrB/3YXgRDHIpb
	JHcpxRjtk0r2ClsrexNZ2aLrrekQv5Hh9cvQz1zDHfD19T4s7muVhH86C3Jg5MYd3S2c3LP3TPN
	nfsmbOqmXSHXMoI4uMINgge+R4/5SAZebcrOE3062dLgwjQVwW1wkUdTrcofk1oGwTH8xnXNSO8
	zCE9I4n7NSUIzoliWswrNRggzOsRva4g=
X-Google-Smtp-Source: AGHT+IE3lIj/203gOa8XTRN8xFQrZ8cA/HMSLP//zwl4/K0OX3xxlSIn7UAWFQ85jKtLSnVzoak0LQ==
X-Received: by 2002:a17:903:4b4e:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-237d9954dbcmr99624285ad.29.1750492294103;
        Sat, 21 Jun 2025 00:51:34 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ee9f6sm34823025ad.73.2025.06.21.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:51:33 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Sat, 21 Jun 2025 15:50:59 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-add-support-for-meta-clemente-bmc-v2-1-6c5ef059149c@fii-foxconn.com>
References: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
In-Reply-To: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
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
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750492287; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=o/ivUb3h2VmdUZCsXclswk/7ebeMr2ftIKUaS3uY5YVto790ke/jBbOCn9b1TS6JW3H83cREG
 xmBm5Tfnhn4AVTGa8+huWqdiYOWDEsu2x9mowKz9yGkID3sl/9dRRQf
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_005134_928498_439D1ED6 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

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


