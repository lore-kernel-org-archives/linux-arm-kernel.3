Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E308C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJcZT5sTnEC+iZOaFw42qNp6Oam8rPA+kK5DmNYfLB4=; b=d9yG3Uv/AhjzGLQZF062w4KIfm
	On/FX2dt2tMQZ4URVCauq3DxkH5mI92+WNhsXxANUSxaayECbmKWY+TNjj4ruC71m1CmFJibL8pYY
	U6MUMJm15W0mc1FNwZY4W2uGWxPnFksShgaXiwq3c/lnf1/tMo0jaA5fBKZmq2J4B6S+QNaS6bRdG
	zWbudiN4mFJSwlHXocdyBmeMOSb2y9PL2oXSNcY4V043KYUfudF6ZDjYzAos+Jkqf3eCL1le3eqTo
	701vFEVfIRz6ehLhVuxkEtp1/tN4AfVZ4W+RprakUAQ54neYxnJBH5dWpHLaPlxJyQnNAN2VTSZY6
	bVdaL67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueizb-00000006A7R-0qRV;
	Wed, 23 Jul 2025 23:35:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiuk-000000069Hn-26Ac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:23 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so554966a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313422; x=1753918222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJcZT5sTnEC+iZOaFw42qNp6Oam8rPA+kK5DmNYfLB4=;
        b=JmTK7WBkMReOCiEKzNWKX9Lnb7ilBMgP+Ieudvy1tHP1SiKjGTMbv9WXoaX1kSOq8S
         9eil2bN9xTvtMdJSrJDNHwqH7iRLQRL4DNTWcxQ86z1np1+5G3BxF74DsgIQHZUqH+X4
         vq5d8W97plUX6ixF5Bhb+j+OFGHLPM8n/YGVI/1wyK1iuYYUkivgxOb9CsU1RY6q2nIB
         WthMbS0tX7f1t9aqq5Jv+bLwAn3D1J1RIS80WYQD1wgg7SSbtOD8zY94T85RAtbAf7Ci
         Y2oMxfCNV/z0ZEYjX1h9PPYcyo2SBuK0s/KEgHsyAoafMFovN5P7heADs4Or6X0ajvMa
         eM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313422; x=1753918222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJcZT5sTnEC+iZOaFw42qNp6Oam8rPA+kK5DmNYfLB4=;
        b=H25G/TPivn6xBTDGL8VjQVi7BuFcH+VEdTiGEe0+3iceb6F9x8GQ22JqA1c9E/F39i
         /cpd2XQJr+rxhsjrGgi8HguTkpAT2ew+KTdlEBzTkMuIMBjFeTidqDjYgFTwkSVhokDG
         pdEHnGGSUtWwpU0bI4drCYzoZNXYjQb6BlqVFB3On1Zplt9rmThGPrIdwK0e9jlqmIyF
         DMBJctnHapqDMzS1fLijLJF3oStngY55V8My918xB2tAEvOrJS23VZgcFMyzlvSV72eo
         Ekj+pNLsARdQCdaEpxzp4psf86VPXXA4hEB5xwkcIGGTSmPMtL0+XFaLsL+0Jd+QnN1c
         yWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW93ZdT5F3jYUEIhTiiXSdpZGU1aBsQnW+1U3dIvw24INgK6zbU/N+s/38TCijB2YgWFANaCGDg5QFjY8pn469F@lists.infradead.org
X-Gm-Message-State: AOJu0YwjcJRazfX9b6SilzAb3JgM5z6IhzwqXwR9bedwZcV55JaCDVsK
	PoW2sHvnD+lQgEadnZUPuVeyqkbyJvTv8jrk5J3xXsf5GO6/j/rbE+MQ
X-Gm-Gg: ASbGncsi229E/8FB8NhWX85TGn096mocsyS4ebul0/aWKYz9/KEgffH9vmUJwe1Wuds
	XXLYCZnvzTIHG/9n5wkSXs0q6w0/MghWNuWSCUrLHt4Tuf0sC3yUaIEOIPCn4Yh5xR+NSyZrMjm
	RKCvUFAjd096ONzOHglJ4h4kpSbtKH6o6A/KqzdrZZEARrhwApT7utVnbknikdfiOutXpET/PtF
	7ZnnNSZYOAiA6BVOIeEKkGAc4rv8pWqKnjTqjYGJ8vIn6jq3M1uqZhpXtQA+iklWpdpxnoPpzIS
	/pJ9TERKH7VinyHWTcI2IDPZqHXGvYtXF5v/LWBTK5E3C3yNuQI4lU3pMEqqWJR9AOVTRDJRWE8
	oUFstqkJPFx+GRHDI6lUIeOiI0UmjSr5pX0/z3BL9L2Tw4k61kVkqLjr6C/0NiiExXHWQzulXCi
	w=
X-Google-Smtp-Source: AGHT+IGSyr5vjHqYvqddRwSQUnOAlvyDwmDPLuFwE/6U7+8I2PtDzuTJhVb5R5FfzxoEVDx4YT0l1Q==
X-Received: by 2002:a17:902:f151:b0:237:7802:da30 with SMTP id d9443c01a7336-23f981a83e8mr46507505ad.31.1753313421521;
        Wed, 23 Jul 2025 16:30:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:21 -0700 (PDT)
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
Subject: [PATCH v3 01/13] ARM: dts: aspeed: wedge400: Fix DTB warnings
Date: Wed, 23 Jul 2025 16:29:57 -0700
Message-ID: <20250723233013.142337-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163022_544548_44624632 
X-CRM114-Status: GOOD (  11.63  )
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

Fix the deprecated spi-gpio properties in wedge400 dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 5a8169bbda87..3e4d30f0884d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -75,9 +75,9 @@ spi_gpio: spi {
 		#size-cells = <0>;
 
 		cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
-		gpio-sck = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 
 		tpm@0 {
-- 
2.47.3


