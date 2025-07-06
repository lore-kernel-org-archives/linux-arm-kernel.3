Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07CBC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onJ/SiPYut3DmOwlVXhMRtyJ+CvjIISGxDqve7qmTAs=; b=5F3a7D2CgJDZ38gI8eKEHE3rCb
	8RhKnkL5Uwlyrx8zzpgeU7fMiaYNB1ZMUXkn+G1avAH2aHerefzVK6t40TCgFYby91f1ofS/WDs+c
	v72JvT/urU5Dv8yx/c2NEsBbR1uDtSWik6o8nOfnq21LWwMjQh7JfKirF6D9Os+gbyp+ClP1NA5z8
	044ttp9Heg4KaqclrDWgKrXraJ8Q0YjnSfmAdlrzTrN/fDxh/qpYTcAisg8PYJQSBdb2jIfpBCit+
	JGPm+QvXjKfHRJgnVU2koDTyZas9+AC8l8bjtZ4wWbepdI19rErBs0topu6MHNtH9+jd0mbYBDkTu
	aGZZIGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGzu-0000000HMH0-2b8T;
	Sun, 06 Jul 2025 04:29:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvD-0000000HLgi-2fhq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2594767b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775851; x=1752380651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onJ/SiPYut3DmOwlVXhMRtyJ+CvjIISGxDqve7qmTAs=;
        b=HfGhxwoLbzJkoeMSL0bOUhQkN93m7BYfCOJ/dSdStrOd6YkJs+hJZn9+ZpSZFITQ3G
         eWi0d94JO3Cy54lvl5+S0FrjqtkeIhdFyuS2jj9ifsL1nkLO4vuI0H5qUSMntW+Mqego
         uG4QD+DrnnLZ/SfrxLViFoqkuNoXoOj5ZVqzDyuuVNHQRa6VH3CMy5fDD734g4cnuZs0
         VW1J0fKCwEki7MO8dGGcF+rVsJEH78bZ1NeftpA0Qd4qjVOkqKi8on3VzzVpf7ldt6Jl
         hpX1zmyRntoBEmlyroGJuzRqnI6Redta6VZN13c1j/GtCgtsxXVmzQ839EdWZqkPP6CL
         03ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775851; x=1752380651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onJ/SiPYut3DmOwlVXhMRtyJ+CvjIISGxDqve7qmTAs=;
        b=dzelHV4Gr77TqPFG26qxPmSov7N7TGTQlXfwrjPFLi5qVPd2TQd5KDC9XdQaqvmojh
         vRbo9v18G0WT2K+Qfh9Ln9fIb4FpOWwDtWRbO4vCH1ALf6sJOwvQzNp3jneoDaHU2+pU
         EQTfKkDTi+axaDmTgRaPhScdt3dCOH1CuO1q/VU8BtwfzSG2bz7i59MHVYHzJj7W4SKg
         xt92n1xzlBbdBTrSuXoPWkKlWwg6NBHaSAARavVBhtT/jKmtPTyGNNlDKm/Q0SieJ+gC
         nj4rnoN7yCJQvXcGp1NmaHx2TOQatAaO56prPAHqy/VK4QyOr/Zg5pzJgbC6Df9nuUnS
         tsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXdNXtnCC5CKxSd60renfXdVkQ/qnZfxW3ZdV8ZKxCd6DIMzSoMlcE4DVpJXXQVDZ0F3NH7Z1XQ8935zQ7BKhc@lists.infradead.org
X-Gm-Message-State: AOJu0YwmKUF6AtYEr5KumP5mGJIj4vUYmK8OGR/vhZ53pxAl38TczBQH
	TjP7PxDxJFpl3AwKmcdy4B2fotnj+o3jFzdM63aP8CR0gQGgDXKjczpk
X-Gm-Gg: ASbGncsHa6/lITrA/+MshF5865SBlqAucub+J/fNxzPM/dbeIL3pWL3Mnr0zSz2d9gH
	OmXpcrlhviZjohyxNH/pobsNmKSrXkNEsUNAr2tXZ6kGJ189TfQgR6MDt29wxcFYAykivPHjTsm
	Erw0hlDertF5zl+8lpX10vGLrO7y8NhN04sYHMDDFgBoc27ybkSWP6s/FJKl8dgbxX2f6Burfgb
	DyHfCp9P2XTqG/zvMEAtCJIJNpPRnG4Y7libvCeo9EXvql4RnlpYTDltOPHnG9JNkEXsjGUrzIK
	W9pfGc/KgIJfbk0S4Q/mbgh38TNmgHhgLCMvjwjJip7iwqAxMQEws9ZUY95MXHbq02IAQb+Vj3D
	lcHZlR+TviC2HwGM82ay16ELYkqkPwqpLyRP3zPA=
X-Google-Smtp-Source: AGHT+IHvMM2cUvioZG3LBq/FM/U+WNpT82w7MGHWKcdsUztGTKRn4oRqsD6DH0I/+oFoaIi0vt+LAQ==
X-Received: by 2002:a05:6a00:130f:b0:748:2f4e:ab4e with SMTP id d2e1a72fcca58-74ce66697a2mr11229443b3a.11.1751775850900;
        Sat, 05 Jul 2025 21:24:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:10 -0700 (PDT)
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
Subject: [PATCH v2 1/9] ARM: dts: aspeed: wedge400: Fix DTB warnings
Date: Sat,  5 Jul 2025 21:23:51 -0700
Message-ID: <20250706042404.138128-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212411_674681_B2BC9784 
X-CRM114-Status: GOOD (  11.31  )
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
2.47.1


