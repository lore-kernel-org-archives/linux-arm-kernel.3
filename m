Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkVzo5NE0GNCbJSinTR7TyExPK/C8GmZwMd+EFgVEoM=; b=qh/MDuT0/BhvCzuEYzMqY2SmCi
	Eafh9ASKCiKhJAD+gDXpIaogdGnFxvvFN/ii79d/4CwkmM7LjtkSuQlolNhCRkcsyL3RNC0Tj57m3
	u8LqvAhi8AUqkR4q4gGYpE1itMkNZFO4S7GmsAbEySvs2rsb5jG8/j1n4VNXes2Oe9npCRHuy1ZUf
	FPK4A5aMsz3yn0/FtiGfmp87KFd11ULP+SiaGQcIZQYe4XX+r7ZZmUb1obCTxHqQVPl424gRZYI6Q
	RVCoYTvUZ+KpRZ6vRKNI9jhic1h7MELUhTGlQEbvTxO+jeLGX7irrIKaYV+f7+kbEpFk+PEQBCHxB
	RbesnjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej6o-00000006AaJ-1trj;
	Wed, 23 Jul 2025 23:42:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiup-000000069Ix-1Jty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23f8d27eeeaso3074615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313426; x=1753918226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkVzo5NE0GNCbJSinTR7TyExPK/C8GmZwMd+EFgVEoM=;
        b=bsgGMI2PXEhrVEFhgON+VHOl1k9Lav/3ZBDchE+K3MwCZieGa8+GQqZMRfBf5B8qBv
         gswYTGvTr4LXg0WKk0s4phUELLL2wPqHlARIfF237VGpRXr2PU5pef2WbjhWPziCw/M/
         aEbkVsBuI1CTMet3QF2tdtdHVigk+udNiOon8njiIMPS59A+e4fepCHqU87NOaobFg3I
         b1u079GZloUrimeIdnGFHZpidpNpdSvbcvKq1UnJh6skqc0OwDXJRPv5eclGKskE+O67
         Zrcy8Po1ZXY8gQlSHibz9XpbY2DUFoho4EltnhBgqmvgUGV6gBIA9ilHUstG+HdRKlRf
         BGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313426; x=1753918226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkVzo5NE0GNCbJSinTR7TyExPK/C8GmZwMd+EFgVEoM=;
        b=XSFEhwPnvZC4JBEd2O5br8PQ17Ay29TC07RayEnj9cxewN+qlRkK50TvNiRVScTZBd
         hrAzwxptZa1SsUgOAk6I9vOvN7SGAYjgEt32uPjTn/zdk63CjIo71/eK0U3XGEdISNVy
         Y4ATNfR0bpty0kYJyZwqvQ8dxJHNyZTg+G7PfkmYmRGFvU5feXLC26gMBCYC8kxCuUH8
         umRWHokj9+Uzw00+GC82Mb4lkpS8uWgkiH1fJTUbujRoManKDzFX65MM2Z9dgNZDt7BD
         XXbQR+dlY4Wce7G8mVAFiebt5pMqSnoPu4LfoYd6v3zpVpQWOZ/K1qVs5lVXde/iv2m2
         DEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBwwuHz0EHL3cmfQrxFw/4kw5s7ve2P4MMcs55RylFcy61O1FVbFXtv3mtyhZbQ+PMcK07jyT6OHNdHHiL52a@lists.infradead.org
X-Gm-Message-State: AOJu0YygQBQBvYb7mtULrZyuDVmNmCxQxZRucHYppzqx3U6hcLpW51xW
	2C9Pj0YcLJ8vH4pV3Rnf4mLwWy48YtNG9pSI8VwjVxL2hT8O4OcPUv5X
X-Gm-Gg: ASbGncvwN3zzIkOULp/CsYVfqjCjno/iK25dGaFXB37VblaTiUZrkkEoPAUcuIInuy+
	OvB261caAvY0O4hmla7eF3jFH73Zkyvo2leAYZXAasGisu9Uuz6TApbDxPhKrlebQLzZNmi1liC
	ZY2jv/1prn10I0sluvyOxn6lpbJgnMf5rMUV7BEXjEgHmQoNSorC+QC1DgbQdi4nMgN6P8Y0ABz
	pspahxIXXzIEYXQHL5m+zPdRBBhNtJtwxLv/wPzu6nAcDCganJiESt3La6QvoP+6JBpC6XA+N2f
	G+p/kFGohdCUf6aAFnF+SQVJdUqdU7XA7MBabrUjR0YPOoBMYlvsm5NCjkqN5bf3BTOULVtVSM9
	aOI+V2BBKPYRqiH0pVtFaUGbDWAYM5kLmiXVS2Y5ad/cFcBbPAsck5MHYAHJixvWLsBd2O2kZUV
	U=
X-Google-Smtp-Source: AGHT+IHzWqipQFV1rlMjfGMj2ZYctdbfed8wRJ1YF4iYb6xdbsKUiD0L697jJ9ynyQV7v99kSM5TEg==
X-Received: by 2002:a17:903:2b03:b0:234:c549:da10 with SMTP id d9443c01a7336-23f981d2e75mr67924515ad.47.1753313426507;
        Wed, 23 Jul 2025 16:30:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:26 -0700 (PDT)
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
Subject: [PATCH v3 04/13] ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
Date: Wed, 23 Jul 2025 16:30:00 -0700
Message-ID: <20250723233013.142337-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163027_360521_56CCAD08 
X-CRM114-Status: GOOD (  12.19  )
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
Changes in v3:
  - None.
Changes in v2:
  - The 3 emmc-related patches in v1 are squashed into this patch.

 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi   | 12 ------------
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..ff1009ea1c49 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -201,3 +201,15 @@ fixed-link {
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
index 840d19d6b1d4..d0331980d082 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1243,3 +1243,15 @@ &mac3 {
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
index 208cf6567ed4..0ef225acddfc 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -156,18 +156,6 @@ &vhub {
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
2.47.3


