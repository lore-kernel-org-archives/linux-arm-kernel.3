Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=; b=u8uUyNCLb46xnMEICZlNpP0RnR
	PeTZPIK9k5cXx+G590X6SGsiUJnPFOfx9Sbcx5ZjN8Cf2P34RJ0/CDwcWYd/0ZsDWzywitaNlXd6X
	LN+6bfg1jt4oyeEp37Gki7KskDN4fMj2gLVpcj7y23YtvD5rrqWI/vqWS3Fh4mpTtrUpL3MopNzho
	99VBqVwVu2QBNO7YQB6jYxhBKr+2B1cJBWnkapYAvwmQmDikJWqcKnXdibwhRcNLkeTz+B3dZeKhf
	gVJILhuGL6t70qM4YDCTfg1wjrq3f70xX04zUf44t4E5gbzQ3zo3rex4dpUI4aY/PpMmB+G/LokpE
	NfpUbIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTN5-0000000H4X3-3Sot;
	Sun, 05 Jan 2025 16:20:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGI-0000000H3V3-2txv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:13:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso90214695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093637; x=1736698437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=;
        b=LoWNrlFd42c82cBGDKRZN5vfP1HIdl06D9YFR9jydMK112+xt24ING4VDC18IMVZAh
         dpxY8fWqmhr7uD9hc+lA3XxryHWs0siMsRmdpua9YzoGPZeiM7zKGSE+bnj9rXgck7+B
         8ye29L9xGdwChKKWD6ut09diD45v+2qmkx7+c/Sf2Yv2Ofb25yOcvY14Ad1Xw2w0G8Jl
         RC2O8sdWnTMm/m/IDMQvEa67o4IUjNYoRrFBDkLds41SK65BvwcNuIaPzo1IMHbsa6x4
         Toa/HfZk/rpVFZI93e6VOXWmPwPNz1Pho4YnTS/gT6M84y74d2X3D2TsMk7waEHx30i1
         giJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093637; x=1736698437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpWoGBpI5JjtqZNRK0ytQyJ2WYZd1lAvc/QlVyBoHrY=;
        b=VlQZrW48WrF5ltqq8k1w11v6PSEfVyLWPbe24FXXy8tV0QFVQ4oUjYxp8hZBoYYbXx
         JypvVygjpJBhoSF9RNTECUptw61H4dETXGSrDE8zeVAnfST/BP5ob5eGBoW45yros4fE
         46ExRhPkNHRdI2cCFIkO0EPhjO0gtEVplpBzaMXNdqzpyoTUeKAOxaWyi6ITfd2HCkEe
         ykCxkc3/odsvx3TKB9L4dxiEjYexZ76v+mhLU0Th7gRKgS/WAKaBlZKCXavmcrmhql1G
         USdA2EVhaDIKtYpniUu9yIgPjUvrECgrF3EGiCXeMmHXRCYeq47rRxtjlahoBRm66mRc
         VFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtypCEi/KgaH7AsU5enR3chG3k0uZcUfwc4QalL8Yi72c5jsr5AlnGWZrJuwL++p+fFrpA5OWR8PGjeOsbl8Pn@lists.infradead.org
X-Gm-Message-State: AOJu0YzhpEQPtF7KMcUNSdiFQs/CsKxhQVzB+T+7w4UQA/QnJZMHNHgR
	As81rwnBaQ8W35q5cI8B1wk+3oouSXY1l7cvGPE1hO+iMKSvpSJQ
X-Gm-Gg: ASbGncvJyi60ep64ASxQySz28MUrOW0BKu2d3N1fi8pFxtNG8UlfPVngpXJmt8Y9otK
	S+9oBj9TKQa4gTFdhK8f9OcLQ6Z3DOFAjSlnBFGLGsQSubOqFjOjG/ilxy+xVD1oMqry1yEp1Cr
	VBbw/IHg9T9IWYisxyEfFTDGMP9quhqPwg1BDAc9Ch8dvLkIjNozPlOOGWfxK1Ag/rJ7rKKWgVT
	OixxPlk1QVroo6onbgspBQFidmEhkIkt2ysatbVcYOlCHvXH2vIrGpkEgIbSrAc2PSRDQg=
X-Google-Smtp-Source: AGHT+IEIahAIdxXweRtn/KVasdlzqOJYFx1e5QhZ6PEatCcqDd10ca2+6lURrpEXAyef4HXhqfrY2A==
X-Received: by 2002:a5d:6c65:0:b0:386:1cf9:b993 with SMTP id ffacd0b85a97d-38a221fff31mr46175844f8f.26.1736093636843;
        Sun, 05 Jan 2025 08:13:56 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:13:56 -0800 (PST)
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
Subject: [PATCH v3 5/6] arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD storage
Date: Sun,  5 Jan 2025 18:13:43 +0200
Message-ID: <20250105161344.420749-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081358_734479_12D61181 
X-CRM114-Status: GOOD (  12.13  )
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

Enable MMC for the Samsung Galaxy S8, used as external microSD card
storage. Since the main PMIC is currently not supported, assume the
required regulators are enabled by the previous bootloader.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 3a376ab2b..6c4f8d4a9 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -16,6 +16,10 @@ / {
 	compatible = "samsung,dreamlte", "samsung,exynos8895";
 	chassis-type = "handset";
 
+	aliases {
+		mmc0 = &mmc;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <1>;
@@ -95,6 +99,27 @@ &oscclk {
 	clock-frequency = <26000000>;
 };
 
+&mmc {
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &sd2_cd>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	card-detect-delay = <200>;
+	cd-gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+	clock-frequency = <800000000>;
+	disable-wp;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+
+	/* TODO: Add regulators once PMIC is implemented */
+
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+
+	status = "okay";
+};
+
 &pinctrl_alive {
 	key_power: key-power-pins {
 		samsung,pins = "gpa2-4";
@@ -123,4 +148,11 @@ key_wink: key-wink-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
+
+	sd2_cd: sd2-cd-pins {
+		samsung,pins = "gpa1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
+	};
 };
-- 
2.43.0


