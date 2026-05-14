Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE75CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=; b=kU/PgqX7ZkfSZPuyc9SPl7UKNC
	vyCRuBq2xIoP1jSqUX60RAwI5PntLYTvi80qwDZ2S62UGtapLpuFNu1qrPRWuDXq9P/Y9fCN4bPRn
	sCyOI84X1O0oiRTbug8IktcWULj6Zi8/XeLydT696iW2REcS0VfNEZUgxjSDDxPbOWgIN2DHusNpJ
	1BKjUCMSlUojX4XKwjq82Y3hAdXEZzEvemuTFfsKtLqfXvh1f3G+vQJO2lkLXNbnp181mF075wScl
	btOwhgqAPGZ5xISlP/YHxDmbNedWspT9UaP/Zwzxeo0pv+SAAgOF19QxzUuqnSCHJsil8GlKdAIJH
	a70ylHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4A-000000059ty-10ps;
	Thu, 14 May 2026 10:13:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT42-000000059mn-1zCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so1946145b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753590; x=1779358390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=;
        b=FPhjvyJAL3AcrtbYMU1zyuZOlPWSpU79w7XQqBExmwuVwuMmqcinhgq3kA5VV/pf4h
         FS/fl5cR9UiSrql4G9b//HxGsOJHXMU46vSqzHrlGRcIvsIlxLrSjct/vZgAOsEb68d5
         cNmQa4o/CltwSwRnoSLMT9jtLdA/XiYr/KBPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753590; x=1779358390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo+sSnnnw2cgQ7ZHbjxHFE6KPW/XWkxC49iilF+VEa4=;
        b=JP8Cp8DgSonZtBJny0Q6Ps2CkJY6GDrMCKAeJUSFKiAbZyfbYWNmylLRcEIj53z2qi
         kbNZzO081NMdWT/ck4lCPztkZZ0fuRc4dIf2hBFqpbpnb0tnAnCeozCu0DM6S/xzWi6v
         EQznNbVQvJT5s1rAfs6CRjMup4XU44irWqGqByMbZJDUM2ugDWvqoOIY5+mcNyWCW0rf
         Pmfs85Nq45o1n2UOrYNTEsQ1hDxSpZ6cwWuzYVdzPUsKJadsUbLmCA90fb/aL4i3Qi5K
         Pl+WieQEircHlxc3+xNErCVxexwBcysLTfQqVqG6NGuGhFwOsDO/fjXsh2EGZ84QSfJ+
         iu0A==
X-Forwarded-Encrypted: i=1; AFNElJ95dfSCkN/ahflFwSlca+EQitT1dgHkrDD8frDDz6TKNSyktPKLEF/XPtNtc5AChejmLxqVmcDv2vgUlQRKHmiP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0hKYHUpmOIfirHFovXTLqHaTOssG47wkeVT4sNL4Vy/ljBHBu
	kuRT00NOOrTYclYdimMLAnt15wDFaSiH6+3FGCm4ECBCqZ8yfeYPtbt7Qos0DKmNGA==
X-Gm-Gg: Acq92OFfe2V1DYH/oea5bPR1n3x9KSQXLxeKhKPB9agmBLKlT3TwWHkC0E08sOfFsDx
	LoDQAdWRbomuRHvcyURn1PlhuReAv1wOmLDGSav59lqg7q1letgBpqJnKszyN19hUHqMkjM4ji7
	3J3tU0nfvi6nm5SjUIhFaC2FcIVm9n6qgTMSqJNchZ81Swd9PS7Qa3DJCq0b0NyxVsVcIUkPAGo
	FRPvlx3YDiCN3OVKtUw+sQQ4oJHn1ckZaDROZyDP/BZZ2AClwsxEJfhxIYxBT+ANnf5hCCOALR3
	DJSMPJHi+3iPgRAEDoPvTHGnHCNX+eRWWS1eWaLHG7XxXMi2NeuWzFoB6IcIbDLS3XeFHByaDDj
	VXf6SMhr2geoO6v1qW9tVc1a/u3gm+ql6Nzz89tX6AgIoasY1YRVrjId/G0NBFNjVJgM0/5buE7
	AIPsB/uxgiuHUr8ZaCTHSoZDm4afQIRk7LQqUz4i8jxu5DTChZsfZW1bbr3Anmyrgb5c7WSRrS3
	K6Bq1Tw
X-Received: by 2002:a05:6a00:3990:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-83f05bec752mr7365461b3a.45.1778753589741;
        Thu, 14 May 2026 03:13:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled regulators
Date: Thu, 14 May 2026 18:12:51 +0800
Message-ID: <20260514101254.2749300-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031310_520706_72BF3798 
X-CRM114-Status: GOOD (  12.92  )
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

The names currently given to the EC controlled regulators do not match
what is used in the hardware design.

Fix the names and the labels.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ca2bb367ee68..538c46ada32b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -717,8 +717,8 @@ &mmc1 {
 	pinctrl-1 = <&mmc1_pins_default>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-	vmmc-supply = <&mt_pmic_vmch_ldo_reg>;
-	vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
+	vmmc-supply = <&pp3000_sd>;
+	vqmmc-supply = <&pp3000_vmc_pmu>;
 };
 
 &mt6359codec {
@@ -1436,19 +1436,19 @@ i2c_tunnel: i2c-tunnel {
 			#size-cells = <0>;
 		};
 
-		mt_pmic_vmc_ldo_reg: regulator@0 {
+		pp3000_vmc_pmu: regulator@0 {
 			compatible = "google,cros-ec-regulator";
 			reg = <0>;
-			regulator-name = "mt_pmic_vmc_ldo";
+			regulator-name = "pp3000_vmc_pmu";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <3600000>;
 			vin-supply = <&pp4200_z2>;
 		};
 
-		mt_pmic_vmch_ldo_reg: regulator@1 {
+		pp3000_sd: regulator@1 {
 			compatible = "google,cros-ec-regulator";
 			reg = <1>;
-			regulator-name = "mt_pmic_vmch_ldo";
+			regulator-name = "pp3000_sd";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3600000>;
 			vin-supply = <&pp4200_z2>;
-- 
2.54.0.563.g4f69b47b94-goog


