Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DDCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcidvqHM0DTpowb0GHOMB/24jrUCyn/KdoJtskIHTFY=; b=aAwjlV+lGYu/FuTCCJJOpdCJHq
	g+Vj1wsmwsZeJ9HnloOs64Cwch2JlzZlv8bhIynL4f26np0u2A7qIjfCHM011ZIBYKGSvfqXJMavp
	Ls44WM2c6D5TA1l7l8wlR0Bg6ctxX1MwgREWyIlMtPo+xgCtT1KQznuvIU3Ylu+QlGg7ZkAybjnxE
	BZeS/fACh4Q1vHu2wsrnKIKLR5T4z4XZi1E+xXX62sdbOvAreyHqhAULGNqLjI8nUNr2Cekjz4bj/
	bv0A4f22Zm811dDLoU+VjM/dbmIdy/vZGc8gi8pB1jreYgtHG5gQFhFAwygnshIyv3ZCmiGEy8y6v
	OY4M5TnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWN-0000000ETqE-2C44;
	Mon, 13 Oct 2025 20:51:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWL-0000000ETgE-0R4c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f0308469a4so2471412f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388711; x=1760993511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcidvqHM0DTpowb0GHOMB/24jrUCyn/KdoJtskIHTFY=;
        b=dxAYgUSnl6yC0HtMFP5cMHKnxsd0LDEOTGr5iPejfxmpKkIutCycRvwpwr8lQlt8HB
         vYWHnZNKWmodjusmIBuaFhySjH7eKne2TuvzR6y/vfGHPYfAoJuwGgkrznPhc1uM/JuL
         /w6VKgAjnyn/GmAvFy+0LXhqXzG1UHCVddhvmxyBfW8+ATHuZST5ElrjyXXpl3ntOSxR
         kvaKB57fwC0kGY37orzB5JXrIl7A+EmrFTI0FOgzeW6jf1P0lYeAHQ5pZA4gOJb9q51+
         vR7oolSi+9xlneyVoM4RknHLsCLO3F1g7rg++zzSPw64TMNrcQjIGpA5awwsJ2A8JUy/
         qGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388711; x=1760993511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcidvqHM0DTpowb0GHOMB/24jrUCyn/KdoJtskIHTFY=;
        b=OwJ0ANZhj3DDx7pJ2ujgEOwVEdkDosGBhxXr/XXAADBBD3aboLp+PNSSKc/JbMwyIU
         gLEvazI+Xp/H/pVjuA8rK851yDS8vMsTagLGmjjXSgORBXsF7LXMRb05c53FpYzBFiXl
         ge62J1JmhHq931e2vmj+pmZ48jsNyuoW4BBissLaAL/j7Zbs7Fnprzcl3/zq/kJAmAvn
         7usAKzDjRx6kAt7Ije/9W5yZetxerj234EaPJu2HDpd3wCDa8U9KErXRViStseYUiBls
         vZcY4hx3VhD6GB9b9dCXOihb7151bpnTQPye/fHXsyaeN1snaZ3Nn6EkE1bcKokdRAWq
         jhZg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhoWiofSnftEFMsXcdrxJLRxyKWUxiTb/X1C16tHBGf6atpJAd4EoP8iaM+AR4dT9/3bh/V0zRssmYHbZTFsN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh/DmsJia/Xdr7r57ZLSoVdPLOaxd3jStHhGFxWowX5B+OLjdq
	N+lPoxR4JSSAHucVPRdG0x2Kn+7vyoW8kizuNFanQg4xKCPZoeUQ7Dntg6yUATNMzQQ=
X-Gm-Gg: ASbGncv61DFu+7xuJmZsGKJZYgdhPJ0N9bEPs/b/twl7pO/f08uluXfciI2GNjV4sTf
	7+bjjlNBdqSofKMpX097H1bvB40LGufv+1Ir8V6VfmmEWkrts74OPlmE/y+psYETBDFoiLB3awO
	9vFX991uts34q/48ct09lJ9r/yufUVfk3UVk0JaQ7f905OXktg8O62v5NxTftoIxswpLAqL96i8
	Xz89Gws66jbWuuNjxT98JTZUvFWvnVqYEuK6ipfKTRqfUFPtZWfEDSOM6AI/DIGIC57WvG7LXkn
	zYAgdCXg9YC3gTVcWBzqGzVSF3au4bIh9eRmQla4Hsyq1SZfyNIjen2DKipeMVuaA6Kj7+FBTkG
	hMBDOy8+sgNIRSJNA4seiZ23ZYn1xNik3d5OSg/6pY3K53PmBqYrOrKHxgbhxx6oGkyuyydMhQS
	DaE7yVktRf7g==
X-Google-Smtp-Source: AGHT+IGR7na4kqfqbnnRja9gaL+GPCruM+aq2vYMgg3ZztoY/GsoH+Vl1WubHAu4JJbPtq9P4Dwh1g==
X-Received: by 2002:a05:6000:2010:b0:3e8:ee5d:f31e with SMTP id ffacd0b85a97d-42667177f63mr13981151f8f.25.1760388711219;
        Mon, 13 Oct 2025 13:51:51 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:33 +0100
Subject: [PATCH 4/9] arm64: dts: exynos: gs101: fix clock module unit reg
 sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3223;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HcBB/oM5Ltz/b5+IlSDZKmKzoXnPjplO+rzlk0nxCpU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZYfzLRdL8VJOj7ItKK0VzjwnPjmQkF16AAH
 EN/3nR0woKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWAAKCRDO6LjWAjRy
 uoxdD/44noFGVAg6H/7t8IFFPSjfN+O063aUxB39GsQU6dPSmhatkdJzGV8lDDFiiYjGFaqPh0I
 IuZJX11glmxeVQx9aDqlgiBbHSsm+Xy91xkNhkB/KiTxCywWz4m+NBcY/x3/2bF4UkKSC/1Xwgm
 XPLBWejL5wGuXpcWfTIcouVM/rn6wV1alCTTovdVfDaNNv8p+FL0lNAp++yZ0ds1cZsy5pM+yTi
 yMDQvEaI2SxuM7+zrrg1424YtvrWlGQQDUpRV1YoR+Z+v6mVvZ9/WLUJDasiTD23mKjXAyRyHgE
 AngzcWNnqWf0/Rdn95v4cnEfG62y5MHNIJSyNSGAURkAWT1PAg1/KbaoGBYcxTVG7cy3vY65cBN
 5azh4Egd/9JJBmiz3Uu9zu1TQ7El2hXtUEDYS1/l8cO+uh4PbZ3M1nuJRnjEtISs7RVA2d4a770
 gVeeMgK03WU2FjN1oxD3D5V0ImspjGS5GbqMnc5qsGJ2ke4oqyq0E70BjhTCuT/lWjq1YIKF5fc
 xHH4r2EGa1yJBXGwFqu4Exsahn+QcKRg6qsAcOVsRm5XWqK0ChbTG2FRiPAhDHkhIvQq7RsdDxj
 Vt4MF09WvjQje8CY/aUrzvj4EdLctignBH+l9lz8ZZhJJ+Ftv91R9PTobZp5MRV4ehYmvC0Q/Li
 ViqnyfmXgo8kBQw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135153_177881_139507DB 
X-CRM114-Status: GOOD (  10.97  )
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

The memory map lists each clock module unit as having a size of
0x10000. Additionally there are some undocumented registers in this region
that need to be used for automatic clock gating mode. Some of those
registers also need to be saved/restored on suspend & resume.

Fixes: 86124c76683e ("arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller")
Fixes: 4982a4a2092e ("arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller")
Fixes: 7d66d98b5bf3 ("arm64: dts: exynos: gs101: enable cmu-peric1 clock controller")
Fixes: e62c706f3aa0 ("arm64: dts: exynos: gs101: enable cmu-peric0 clock controller")
Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d1e3226da6472bb9db766926100a6b9855d7a30c..1ae965e456665bf05aa1b08269b5dd66b46d200b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -288,7 +288,7 @@ soc: soc@0 {
 
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
-			reg = <0x10010000 0x8000>;
+			reg = <0x10010000 0x10000>;
 			#clock-cells = <1>;
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
@@ -371,7 +371,7 @@ ppi_cluster2: interrupt-partition-2 {
 
 		cmu_peric0: clock-controller@10800000 {
 			compatible = "google,gs101-cmu-peric0";
-			reg = <0x10800000 0x4000>;
+			reg = <0x10800000 0x10000>;
 			#clock-cells = <1>;
 			clocks = <&ext_24_5m>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
@@ -917,7 +917,7 @@ spi_14: spi@10a20000 {
 
 		cmu_peric1: clock-controller@10c00000 {
 			compatible = "google,gs101-cmu-peric1";
-			reg = <0x10c00000 0x4000>;
+			reg = <0x10c00000 0x10000>;
 			#clock-cells = <1>;
 			clocks = <&ext_24_5m>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
@@ -1271,7 +1271,7 @@ spi_13: spi@10d60000 {
 
 		cmu_hsi0: clock-controller@11000000 {
 			compatible = "google,gs101-cmu-hsi0";
-			reg = <0x11000000 0x4000>;
+			reg = <0x11000000 0x10000>;
 			#clock-cells = <1>;
 
 			clocks = <&ext_24_5m>,
@@ -1344,7 +1344,7 @@ pinctrl_hsi1: pinctrl@11840000 {
 
 		cmu_hsi2: clock-controller@14400000 {
 			compatible = "google,gs101-cmu-hsi2";
-			reg = <0x14400000 0x4000>;
+			reg = <0x14400000 0x10000>;
 			#clock-cells = <1>;
 			clocks = <&ext_24_5m>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
@@ -1407,7 +1407,7 @@ ufs_0_phy: phy@14704000 {
 
 		cmu_apm: clock-controller@17400000 {
 			compatible = "google,gs101-cmu-apm";
-			reg = <0x17400000 0x8000>;
+			reg = <0x17400000 0x10000>;
 			#clock-cells = <1>;
 
 			clocks = <&ext_24_5m>;
@@ -1509,7 +1509,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
 
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
-			reg = <0x1e080000 0x8000>;
+			reg = <0x1e080000 0x10000>;
 			#clock-cells = <1>;
 
 			clocks = <&ext_24_5m>;

-- 
2.51.0.760.g7b8bcc2412-goog


