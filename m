Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E312E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=; b=t2LsRKj56XGG41ilkqc508oZ2P
	YwPPemy7Ew/NVnDVjk8739afliZ42aZ/WVHP63HS0JtNcfhtyzekhoKNFeR5KGv5JyETF+aDwvksX
	7YOE68uhHHovfOQGY3ucU0N4PupLsoPJ9LgmYH2aHLP32AOSkTlmKjj0yTNE3S4t4gpMF5QshLr3L
	19KqhxGuaR/YpuOLeI9yFNw8xxuJChVSrzeGAmigTRUmdwIClz10XS+bwp6GXKYomYqULV400F4XV
	oM/miZFEtmzLdA0/z6q6XmKSbt38Us5xeFIT4m9ZFJuKoXJc/+xotttJ+9eHJKDYJN2sncAKgFJ5X
	M2/tnTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTJe-0000000H45F-2U8P;
	Sun, 05 Jan 2025 16:17:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGC-0000000H3Tz-49GC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:13:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e2880606so9954578f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093631; x=1736698431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=daIta0cRCF+ie4jLFs5uKVTYhLp4e5uuTuSMNQNVGpdZOFyK8ozNooGV82Jh31SS0p
         D73G+FcKhTZdYtb+lny50f817O5cUN/5Z/3sagpfcR73G9dM5WJRgDgTQtDrG3iO/9ju
         1DQOkDiGKg7otSvTTnCk7nafz3dTyZaPOGxO0WYEk6pdgjPtbB7SLXC3EMsE/dBLdh+h
         GP3QDOlRzNbIxTkMYcjHMjX3R3d6U7ZRRyu+5LniaZpTuEyMo61lU15Z1p9ZOU9roi6u
         K86+W8nE5RV+7J9hFwitAPttl1mAVgRh3PrboD2gddYBEAx5qlcIZjZzaB/ECvTFgaQ5
         qqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093631; x=1736698431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=kywrOwq4LoLMyneyLDwjgmcd7ix9sKbRihHpi1X1PMVIZQTVhdbVuI03cLgrs5rfo2
         +QECfhT+m7Xz76j6mI4pWW1jbc8QkCY5bmpyB0n34QjDmJdEkaCJA7Nlrxl0Ml61lrjI
         NfO0hmPUy4959eOraknsSegaMzv7kOtcq43RjwXZHwXaY8oxHKR6daB/Us+ipLzSZ1sQ
         XxVX+jjmO245lC1s7zltc3aSh+O44Qy4om5fu5eoyB5EQ4uNBt4XNeh3ro0yf/2LwGlF
         F1hT4q4zLu1wrsQF1HkPjuGPcTsLummSLbmhqyh7CU9T5HAdUYgsVNdIPEW4QNiyg9D1
         1Ahg==
X-Forwarded-Encrypted: i=1; AJvYcCXwTa30qvb//u1W5R8U/D386q4nqr+1/dqVPMIEyKAihxbtdA2VqWfVZDCqIzyNpa7V3DmJkjLuwdKLfqZL6MJE@lists.infradead.org
X-Gm-Message-State: AOJu0YzPH3uva8/lgKYWHuM88OnCKf6PDWENYAjYZXp7uqDxbg3W1qtj
	2i0wwoLfhKEub9zdYrmieBxAZ6TLVSKq8jmoqqY8WmQO9lNZw/1+NCRnxg==
X-Gm-Gg: ASbGncsiCa9XEQA5H3uKyM1HEpnF21+Ihpojh3szPLCY0h8vjGS6Bxw66/ULvb07CpD
	XfKIaGM0QQmXBdHmO9Fl2skbpfiQsV5/qWj1Mnq15Q52spvsVyvmWg94wLXF9rhU9g8iB5G7TWR
	M+0mpxKLkvwpH+xHGj2NCIYhRWBvu6DSmva9kN6CzD2w9siXk1nvWewNbTuux3IoGVYYNHyLHMe
	jkmzndj6uT6cmKFQ0lPNHRNqqfMY4RdutV+HsMV4vUDW94m8eqzLdWeG04srEPHW+DN1mM=
X-Google-Smtp-Source: AGHT+IElWpw8jxQDyyiJxo1dY4VhDLw3/bf2P58k7qgXzAV2/4jbTT0bokTdMmSCUOaDdN+EYIHAEA==
X-Received: by 2002:a05:6000:4028:b0:385:ded5:86ee with SMTP id ffacd0b85a97d-38a224069b1mr47329933f8f.57.1736093631481;
        Sun, 05 Jan 2025 08:13:51 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:13:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
Date: Sun,  5 Jan 2025 18:13:40 +0200
Message-ID: <20250105161344.420749-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081353_036827_2B05F697 
X-CRM114-Status: GOOD (  10.52  )
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

Add syscon nodes for peric0/1, typically used for USI, and fsys0/1,
typically used for PCI.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 4fb9be850..5302a8c1b 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -228,6 +228,12 @@ cmu_peric0: clock-controller@10400000 {
 				      "usi1", "usi2", "usi3";
 		};
 
+		syscon_peric0: syscon@10420000 {
+			compatible = "samsung,exynos8895-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x2000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK>;
+		};
+
 		serial_0: serial@10430000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10430000 0x100>;
@@ -273,6 +279,12 @@ cmu_peric1: clock-controller@10800000 {
 				      "usi10", "usi11", "usi12", "usi13";
 		};
 
+		syscon_peric1: syscon@10820000 {
+			compatible = "samsung,exynos8895-peric1-sysreg", "syscon";
+			reg = <0x10820000 0x2000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
+		};
+
 		serial_1: serial@10830000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10830000 0x100>;
@@ -380,6 +392,12 @@ cmu_fsys0: clock-controller@11000000 {
 				      "ufs", "usbdrd30";
 		};
 
+		syscon_fsys0: syscon@11020000 {
+			compatible = "samsung,exynos8895-fsys0-sysreg", "syscon";
+			reg = <0x11020000 0x2000>;
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_SYSREG_FSYS0_PCLK>;
+		};
+
 		pinctrl_fsys0: pinctrl@11050000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11050000 0x1000>;
@@ -398,6 +416,12 @@ cmu_fsys1: clock-controller@11400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
 		};
 
+		syscon_fsys1: syscon@11420000 {
+			compatible = "samsung,exynos8895-fsys1-sysreg", "syscon";
+			reg = <0x11420000 0x2000>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_SYSREG_FSYS1_PCLK>;
+		};
+
 		pinctrl_fsys1: pinctrl@11430000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11430000 0x1000>;
-- 
2.43.0


