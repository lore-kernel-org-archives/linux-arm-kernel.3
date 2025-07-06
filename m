Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31544C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvHmWGMNafItbzs5EJlmTvxiwq8MkDpapWuWormfitI=; b=io8QifLLN/qvbSTlv6BH1viAsd
	b1I2OWuvO49ydD4SZq5ICqEwJKrZQkyJ3ZQ4zRbmo0JU8huDthiMrT+X21nVtxdc/soLZNgvUTkSV
	yN441syKTJerv0kGreQBTOHsjVvHgb7d7oEwz1C9cS87tqlDv7urheJLgvb0SDRKmYrLLVJbRWE3r
	AHW3qwDU/FNKc2A5etSUnRQbNxAe0lJdxuyr36AcUvcFWAfw/v6Z9Wor+QZZe1Cwy236ljwFLh9Yi
	jbXHvRVEW9nxB/si2d/QYdeEBGC6VBhWJWbFQLRo25KynpoWZRwQKYwiOC2PsVhG49DpkCWHgITzT
	hH+i2Tmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHDj-0000000HNiq-0QCH;
	Sun, 06 Jul 2025 04:43:19 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvN-0000000HLjh-1Mus
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso2046667a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775860; x=1752380660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvHmWGMNafItbzs5EJlmTvxiwq8MkDpapWuWormfitI=;
        b=NlLpivDBL6PmqigrXVSwZlAjNqNxZ1u1T18t3t9neAU9L5aZ79D/4j9UdZswiJLcV8
         XIpGUb+VA9c3r0hNY5U1I8z3eaEgu/35NA50udRxK2Ft3GI91uc5Ivpp0X98PVsY7Q3T
         hO7PZqGCe3pkPNa8TrV1dWqR/Np1xXO3wgmsi0hdoPZz363lxqZ604rIWMLLQJewSdks
         e7+0wsypc5T1HL4jwhIVOPVE3l1mAdFjSn0SIw1E+Ux4L04z32s7jjFf7jbpVszM+JfV
         F8GM64bu+7ZImbWjHLPq/5cm932k48y+SEFCiN6NSoqtMnGkju+jzPYlDQvnugFP5xgq
         bNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775860; x=1752380660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvHmWGMNafItbzs5EJlmTvxiwq8MkDpapWuWormfitI=;
        b=w+P4nc06ie1R5jtx14dUr/c1jlhIhgXCSlkX5d33J4S8gy/lpRKAxvMkdkPWcbj04y
         XeAYCOcx8boj2o0FiW2UyESjuuBeNNS5FBgCQLa2H7xv3+pcCGml6dnWoajXNjUeEVRy
         GTsj06uBol7aHYxdHgNEj3U3hH2AQzIDaRqBE2SZowFpvPpyYCJxYXsBOw2MA+1/vGxZ
         ErmGnvaaY8/j0NpJzG2upzfujq/WFAy8GOGz9TgJImIG03NnFb+qtpOhV2EfWAynLaTY
         hPBJqyRDrpkZy3AFg/JYdPAKAJdXU66Vj/3xumTijmnnVJ5wrfj/TW7jvuNccpmZbpcv
         vohA==
X-Forwarded-Encrypted: i=1; AJvYcCUQtLJ0FBfBO0YpR+Dv9TymIMhUeXo8Vh/LvCcRDn7Uw/+L29L/j5NHqZCx+n+x3Zc7W2gdJMQ9FFmev8bsNVeR@lists.infradead.org
X-Gm-Message-State: AOJu0YyzZsb7XJX8/QheZnsU6tAbVQ/mE7D4Duqni2CidX76YqO/Konq
	f17t+SzK2FNW2jJLWAuGlxvkoTFQC4SzJGRpfvEp4dntICHoEXBvOaEXXAOxa41+
X-Gm-Gg: ASbGncv82dnBmyFPdPPEszcX61zqY3QnNmlAoVfZiPoq+EfAfftbkCRS8oZ9t1BjwN+
	LQODHkE9MzkqUvUQhRaUpYMGDKxq24PmnCyxZwFUaaSfNE2ua7lGX8ljcveODfDGeJ99HGJQerZ
	JMD3wZ5w/fIsGdYxln/NiaOww+a/3EZUCdg+5MYLiy11YrqucAyjEOlSur8weHtUwcVmn8yQsF+
	G2xEsu7cQ1wJdKhg7L/H55DzFVO/qQrlw/ws6AmHjAmIbexj7bDvZrTmK+Wb4m6MmQ2y8sjhHVq
	Q0VwD9vSDeYhvF553MD94JcZeAPUCSdYOkal1AIqDqRFVHjNmYmY2SRG7rIYI2qSuLkfQcUSzQu
	UBVUsBdWIiW+8YFYV8xlXSn6Bbv+Iv1xXW12j7M1kxxYLPUekJw==
X-Google-Smtp-Source: AGHT+IFq/DBo7mhtDc8JK2bnjTn0hYcALs6HE7/1Y9UZXQosY+9RqR3fwqBI4vPkehE6vG/rQihI9g==
X-Received: by 2002:a05:6a21:618e:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-22720fc395amr6562762637.29.1751775860542;
        Sat, 05 Jul 2025 21:24:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:20 -0700 (PDT)
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
Subject: [PATCH v2 7/9] ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:57 -0700
Message-ID: <20250706042404.138128-8-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212421_369771_D9AE200A 
X-CRM114-Status: GOOD (  11.78  )
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

Move eMMC entries from ast2600-facebook-netbmc-common.dtsi to each
platform because eMMC is removed from future Meta/Facebook AST2600
Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - The 3 emmc-related patches in v1 are squashed into this patch.

 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 673cabbec92e..a21742daf899 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -207,3 +207,15 @@ fixed-link {
 		full-duplex;
 	};
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index 71f58ad1ff06..0890b1728658 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1249,3 +1249,15 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 4f819bf8c909..d19897ba5dbc 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -154,18 +154,6 @@ &vhub {
 	status = "okay";
 };
 
-&emmc_controller {
-	status = "okay";
-};
-
-&emmc {
-	status = "okay";
-
-	non-removable;
-	max-frequency = <25000000>;
-	bus-width = <4>;
-};
-
 &rtc {
 	status = "okay";
 };
-- 
2.47.1


