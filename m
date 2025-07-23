Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6063C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hexKS3OBdUuka6mz2tsiA5AZ62DQZfbT13EVs55U9NQ=; b=f7994MzxK7xz0nPm6nyhgkLRNb
	D0o9m19wiAslxxAFeQXpHUc5S0cggOtal/+zhOpJHI0u8ZvlHfI2sTEPnUWqs3HjhYiEnhI/2KQCw
	7sr0O5n9oWAfMtLqNXyufmL4lx6HuWYa3rwjLa5kaGjXLp8lxdtoFrVHqNgsr1zjEYTQpYK9+tTGk
	ZQPdT3CXzxxdvEtZoSQr59ztUbsUNQL4CuuoC5sNfmYT+9hoWCybuXEKe5nxU8FL7APjlb9Ltwp/5
	gYuzkDKa8Nq3RaVdVVECJcRG7y6Je7uopdUf15KZAN7/wP9TyPpH774287jvKzlR24wiDAzMICSbu
	yBbAy+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej4P-00000006ARv-34TW;
	Wed, 23 Jul 2025 23:40:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiun-000000069Ib-2w4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235f9e87f78so3704765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313425; x=1753918225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hexKS3OBdUuka6mz2tsiA5AZ62DQZfbT13EVs55U9NQ=;
        b=Ib4EZLWriAQH+PV5bMZaJmS8BWjcnwxVuNBdBMhfc3Lrt76NFjfeQMJK+B2/r2wwlU
         kChzPyPJz1P/ZGxxVbPIlDuwIsPNPFxSukimwvSr1LYOU6LFmULNiEQ8DnmaKGyJ4sgv
         APBmpKmX//BVyKrMBkmvP6RcBLGmWh4HDnLRnPTVv5LraTVAIFo9YBnJSfNEzoZBNig1
         EmT/5o27ysFfZXQlr9cW4NWfF5UivKOEf2Sly8n5clcgUTPdF9ftSLhCvX6TGTQc2cF9
         A0Z8jRmEGIwNtLwwQuIStQLfAH4FB33VvM28iHDEsARSxWPfC9VPXRn/vSMgvv73NTIl
         Sk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313425; x=1753918225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hexKS3OBdUuka6mz2tsiA5AZ62DQZfbT13EVs55U9NQ=;
        b=iIzwPPUsJLRmE768psIvcSpqBXus5E0gtLONVOYz0wFYgPrVH2JGns/Zv8K+kcUbL7
         4BpXt9DKfWWXgpaN1XRy9Zyh1cy1Ja1P5WvqWGohtiO3zmtA1FC6l/VDV9On6/vVNW+w
         nzqdV9XWF3JSxY8kgUfx9WbyxfVxPf+ZTiBSEGgRkjj6/2au6fZfgOZlL3pmFIh8Wyhj
         YFYC+YZuDJJ9OVt/LkyMH219ZqSf1wwwvKq5nKgCFSY1l93BNeGLA4rmXcyimkZ7CtQS
         1pxfT7OGduzgeTzb+4NfqufVAVImGR4ZKAn0An8PgEWugq81vS9ITwjki+/PFXlO1XNo
         5vdA==
X-Forwarded-Encrypted: i=1; AJvYcCVyXHSTdV/lguIAiVL9R4MI2n6LP08jPPliQABdIMCqCDZ9QlnpZhnKTaqSv1gaH1nnDKIWKPVkKPyQ9oVmmXnQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6rpBAJfSrVqzI9X2VsL1tHSlUV7mMPXyqkYa0DPqxrsVAVvWa
	dohW0T6cQodWKsci6gPm1BmvIPX6JM5DcqAxLVwX9z4tiIhkgTCAlY7o
X-Gm-Gg: ASbGncuS2wxfhrexsQ6hMBVVwfjtOlZrBc3BEUCEbFuojfASmOcNxWSWH5uDSkbqSMq
	wEt0GXsKPqr6fJpPIiVNDLK2pKG8F4boemz3bpAxAS2nVqaSivPqcA12bAPqQmb/dZU4PuQe7RR
	gPOnL2NxR4qH2NG/0FR/QJjcJ9g9FhLXHoE4gia9SXhq+r4RN5HS5bINJaFxD8jfbMAUnfDTgk4
	p/5owHDSpgKqS+0GADRI+WXCfrZgoEQEwSAgCgIDKDyIAKdiEX4ThMQYwDfQlhbwEhacxenuume
	M3RKUWDxibLb3OqOjUOrZYxPUTJbGBM3abqEudN7qlPczyXK1xOeBpawLsfUR2+6wr6bXvPmkgJ
	0Xhc5mYqY8h9ZTmDWq64WOWNrkTwdvg38VJ4GiS/l1M/t9PTJq/a98yVN5FIQF4klJkSHtZaNWL
	c=
X-Google-Smtp-Source: AGHT+IGI7TnYck3w9Hntb7EBGOSxlq7HH1YPFTWNRaeivNj40fXsheG0i19dTMp3Dq/70CdQsBEbvQ==
X-Received: by 2002:a17:902:ce11:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-23f981da200mr67178985ad.46.1753313424830;
        Wed, 23 Jul 2025 16:30:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 03/13] ARM: dts: aspeed: Fix DTB warnings in ast2600-facebook-netbmc-common.dtsi
Date: Wed, 23 Jul 2025 16:29:59 -0700
Message-ID: <20250723233013.142337-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163025_738729_4266F8FC 
X-CRM114-Status: GOOD (  12.18  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Fix deprecated spi-gpio properties in ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..208cf6567ed4 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -31,9 +31,13 @@ spi_gpio: spi {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		/*
+		 * chipselect pins are defined in platform .dts files
+		 * separately.
+		 */
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
 
 		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-- 
2.47.3


