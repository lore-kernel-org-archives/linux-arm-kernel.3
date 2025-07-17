Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55151C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=; b=q+T/WzBA4uXriT8pyawSLfLo6w
	PJ7XV5skQm7/VFJLmA9aVkObdCie3bIE279P+L9TvtBRt52pTWIDwkGSUVIkKBq/sd2ykPyDXhN7p
	bbaOAcqHwf8d8e2VbjhRmdjUtswfud4o3MUFIj8F7SqoxYHod0pO1YUOLrDq9rz5LLY3q3yMOCP1c
	cRN24qqtj/f/NruXtJG0Y16zRIC1DUOROSOTD3+NhcJcZVKiRTABbpuysQTipQeZq1Kqv8QoqQOwT
	+NgVrFPQjYdKPEA1MUfSZf2UQxEQtSlmnP3y0MIxls/NB76g+Q7IitAAYIDxpLfH38UcSGFHNlPtV
	GcMuNeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQLb-0000000AUSO-1mXg;
	Thu, 17 Jul 2025 15:16:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ51-0000000AR1w-36NZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:59:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-236377f00a1so10062995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752764367; x=1753369167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=Ho/JwqJ1YI96FqFzEmFkAsH5lYcLosJQknIy4xpVSqq3Xx/2C5wtFmt1cuc9g3/Rwl
         x9IbHwx+YFMLwa8Cx/tFnZVEzxgSd3d64yYpFWQHIRFruWc3LD/dorq62aTYvA2YFcy9
         IxZJE+t3Hq+TYDXg4XDFJqSvyDPBUNDtLAIpPmasfuqWxM6+gQj0+ZoBez/jw/UyR1rN
         z62lnuZEnC2hBSZ8ocfWqlY3mtaH7FCGNs5OupH+bhPoEw4vWmNqsBcPStoNvKUpc3oj
         vs+EbsFv49oXFHhA/ss5W72R92rGGv6KkXDC51A1Z6si6h17PuAOJoK7SzMGVKUDF2i2
         DFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764367; x=1753369167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=hexhSjFiNPtID//EcJ0x3AHSwjnnHGWnbkXjYpfpKpq1OI1HZZb3GATwZaMxJPYI8P
         jIWtHjf0JetssN5mNhui7gc3+ReXvhzpxQhYtAuydfLkeVSkt+FsIOBEdNmJV3rbWumJ
         iuKf1CdJLJBD0U3vsilLTqQX6Wcyk3X78eL8Q2Pm6sGnGjW5emjdZKJfELJuhQ07WQ7a
         Azzrqs204vAe9P3KVL2YLpVLDs8CeNtOOSeeiqZu1oIi6iGQE5YuE9ji7sZ9dx5MOMJY
         xwaqxoW3HvWBkr4pQT3NZzc4vMFyOhsfHDIa8IeQnt4z8wAJBlUFl/VWG1yd4JGM/TE2
         CgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVmb/vwSszoUA27+9dvDn9xfLIQ3j59SYe4YpxSrNsi+ny6kQq/11UgR5I3dRCsZBssfobiLCETx4qhybLyO2J@lists.infradead.org
X-Gm-Message-State: AOJu0Yxua5kRroIsYHEkRrnP11SnO1U3RXiTgUr3mUf6YBuc+Cp8gxo8
	1RXbjNTCOJDO3vWtKn461u/mAx4eevMED0xQ8aV/2unpTDw2BhK+WLc1
X-Gm-Gg: ASbGnctbiBsSQP8yqDyjScDkLpI2P+ND/hR0EdYkPaQ65fBzimXkEA+GwXYrrl0RMR9
	ld0HBHf+odWrVNxL9Uf1O2KZrZGGzHLCSTH+JHSLyIZKA2eUck5HP+O1ptXDjaTsNGAOeTD2vRT
	7iGdFMZGIJS3pLn2k0qhSnIFSUTWwOymb3TamMbv9Xnrh2czW6byQ1nZkiaoMxYh+L/ZGKwnnpN
	tTM+7QxLB05xubRIaNeUxGRrNrtbsdtesxq1SKjRdD4AOEacu5L3sYGQRaAN9qVMT81C3qzNwnC
	tB+KuEWenuDse0+YxZcYnCHrFgs+SieFSoA589szRmsUpTlcww7hAWbm/xYQxdYwwr/wqNNBy1B
	L+IfOKdIly1yZN90jF7+RVG+DGGt5O79Fy5oJg05F4ygZBTDiT/6z9P/JyVe03tiqDO8=
X-Google-Smtp-Source: AGHT+IFH71SO9TWQIjWcDvGZVaf8c0bfz40+DZK0ynM687AwY01e4hF6qPVMkaNoG3Tz4KEJj9XPFg==
X-Received: by 2002:a17:902:cccc:b0:232:1daf:6f06 with SMTP id d9443c01a7336-23e24f94735mr87868625ad.47.1752764366837;
        Thu, 17 Jul 2025 07:59:26 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aea81sm144603915ad.82.2025.07.17.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:59:26 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Thu, 17 Jul 2025 22:58:59 +0800
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-add-support-for-meta-clemente-bmc-v8-1-2ff6afb36b0e@fii-foxconn.com>
References: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
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
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764359; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=IJJvmEuw0NMsZbR0pvDfxaXzgRUhvDfogvZ87vBwQarC5NYmD/jvO1en40LOFgsjikc3duK7Y
 KQ4xpm2evtkA/KHguxccp4vll1YN5VIB5UoeBTJf1adwFrZSpItUR9K
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_075927_775567_A292B40B 
X-CRM114-Status: UNSURE (   9.43  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
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


