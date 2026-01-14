Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61223D38FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLZ+PvAjnR7DEP7BUAREJ2OVzk7/JAMCQdO1bdqxiqQ=; b=cQ2My73nf4WFOtcpWg8Dg0niFc
	lTuOIlexjsUxr6bRlQrYJHBm6hD8XROrsq7Xa4WQ32GvREfpT1gs6r4rwhbJAmkl1mO62CYKxx6FV
	e0ocmV+fieO7bXCAj7uNbAXoWHRDpWgwbFe4ERv40GixHkZXoxAmIM9WY9bL2NGtAgVN8xZBsqc7U
	ynY4SJLgUoH002lGNywNSmui7HcqLC87r4lmSrMVc4/9hBrAZVaAuhXWb3jvYS1mNRV2LBV81XsTE
	j/+PieFipYJo7AiZ3pD2zQaslWobYk5/NTxId5K9RmdVlOQSiF8XgwMnjC3UAGwPnxsTv5sOrbQ5h
	4UYhmvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NJ-0000000A3dv-2kML;
	Wed, 14 Jan 2026 17:09:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N5-0000000A3QE-3J0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-42fbc544b09so52361f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410566; x=1769015366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLZ+PvAjnR7DEP7BUAREJ2OVzk7/JAMCQdO1bdqxiqQ=;
        b=ysMqd2QjGvujjCSUXh3cIvc7rcGo9faR/uViY7TXGV371ZBvJcx0k7BysEadjjWDgX
         FUCkBNk027yCXGk+ULNro7ogvPm+ivPzW3DtUoEH3JGSL2Asl0JDCrnjf6W9pnvWEsk0
         2DjalY29dU013ZUlAp0t+2ARlbq2Avp13qx7Pr4HB/HQhgMBnCSpwtW0ilO9o9oj+lGg
         I94tOpZZeoqwYNzYbissgNE337pGbNbb8SYEjgNT2cnSbe1+n64weYwrTeK61SF2HKuN
         4Iw8HQ3uC6zZCFOC+o0y2plnAEpwpP/iMkmkarGoDkqdf1i+kxDphs3YpzClipYfNbP0
         AnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410566; x=1769015366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLZ+PvAjnR7DEP7BUAREJ2OVzk7/JAMCQdO1bdqxiqQ=;
        b=E8L1LzzlOM/hZaPSzIsTd8nDAPATSourpRMq9f9VTB+Dy2aH3sInz6185tjnreXn1g
         15+h7ZHieh3QKiYtCGAD3LL+594n42TpOKEpE6CzreMMeJojStC+VJ/6rgU2goxAukLU
         bwtIRd/e0rrqc+wvubb5V7FtsBzd8s8/zTz7yBd2SMwql0CSCbjrQHtmaOMOfgqT2ueU
         jgSLCczo1yanRtKmvb65uAdFXuEXnRqTLdhPc6dqf+h6qDi2nB3gCaGnUAOCV7nIk3uj
         iVXyGszW/R5GVf4iPZ6Wc5cwLVLtzEh9vGYhcJ3UJl1Ev3SPZpi63jllshxXKtnWCFxM
         kC2A==
X-Gm-Message-State: AOJu0YwVPfelrItkCwC0uWsTQXClsPa7m8HiOUGAk+9mFqtuCOtevFRs
	P60YvQVp6hFT8KJRxCKR5PLaYxJkL46M3d4h1DdEbIVUG+H3uHUlkTzPywcPjuGSfyg=
X-Gm-Gg: AY/fxX5vYedNh5QSJOmik5jpUTrsjhAkkE5tBQj1NzpIpKXM4zLoyTwSvljIkYMktGk
	Arxx9tCVcKQIe/rN2+HPxDm32CsJamZ5yQhee1t9+/UK2otM3An1sYk3GSNIS3REZclmm2ZZ2xb
	FrFybV0/13qHqRQCfn3hyNMqkmR/z+Lvu0rJA8EQNsVgvXX0SN35z9S+e+DPtDR0nGT8uGsCYJq
	PRgBqT6yJwSka5XSTLWo23fBsxeS7zWWKLZStIMt4sbrCPSYzFdkRjN4Yuj0oSepYNaexeHUSgX
	EUOpdTTfhuDomwHHSxI5tScFjB3X4Y35YxBuNc9D8TCy0+Oc/fCznMSNwVmgq0HAFm/qXMSr2AU
	5yK4uHeQz/psinx9nbenP8YKZ9LaHh1pFMt8v/Swy3VY07lQf9Pj3GWNOnUi43LZCPsfu+ItRde
	RXgDcRzEtf1A==
X-Received: by 2002:a5d:64c5:0:b0:432:84ef:715b with SMTP id ffacd0b85a97d-4342c3905dfmr3372260f8f.0.1768410565786;
        Wed, 14 Jan 2026 09:09:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af6d909fsm356157f8f.31.2026.01.14.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:51 +0100
Subject: [PATCH 4/6] arm64: dts: amlogic: gx: assign the MMC signal clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-4-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9p95wrx4RVIpeGNcY2S7+iJZeATm0jJX+K1/uJDs0y4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ825kW94g5pcZvsr+i9/i6GRnLfGgNa7pFFhK
 lmKhfwUVT2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNuQAKCRDm/A8cN/La
 hZVBEACqMuM881Nt8EJivf+CishVsuj4EC53+9mHxQCCW7WYXZtVp7tlD2DS5+2RAgJoYqTkLOl
 qCtSY66mv8M3w6UF8gdlisZrLCpDIQ34bZcnowKSd6NZESLyM/nv5jCqOwTNjjPqoATxHoH0JBD
 nZHtINboSwbmn8feJyOdDaZ71nk7evUI2FIZmXUr/dsMW+vs0X37K0blL42/6kBt8HDWV63J1Y1
 IVacEkKDMqfjHBxz4uvWbl0uG8KOur1oElrsC5JA08kVl0FQ1uSBJJylIf26fq/Hj2ULJjUcDTi
 0rz7EqE35lpGWYwa6b78hrixY3LWSYVWPVZkJb61lJ4QpqRc68N8pa0SmScoXw24oVF4FJRe5tO
 jDIq7hfL1XquYyKg8vVpRsUqxFl5B4uLP7hrHiRRzCTFTVbm9ncUsV18UaNGHSLN97Ix1SH/yev
 CSfSi9n4HtaOa1hbgQFUlFOT2hA+hQdky626J/D4NHNUsyyRXm46TP7QMqTaKDfnmYr4U8Cjr2a
 fQmnGevOmt4L5R2jqr3h1l6pctbu1STvfSVHagoyzVlxl26Tkln4YZQsdcB+YpSSt00Ee91jhzr
 7l8plfEx05/qUlV+VuqTEBNuozgSTCtlCmRaF33Av931U4wTvOvb3y4NMGFGrH5SYn2LXKlNZ3r
 897NydBJCJWlL4g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090927_901150_C0F64D1C 
X-CRM114-Status: UNSURE (   9.27  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 50662499f911 ("ARM64: dts: meson-gx: Use correct mmc clock source 0")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index f69923da07fe..a9c830a570cc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -824,6 +824,9 @@ &sd_emmc_a {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_A>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_b {
@@ -832,6 +835,9 @@ &sd_emmc_b {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_B>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_c {
@@ -840,6 +846,9 @@ &sd_emmc_c {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_C>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &simplefb_hdmi {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ba535010a3c9..e202d84f0672 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -894,6 +894,9 @@ &sd_emmc_a {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_A>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_b {
@@ -902,6 +905,9 @@ &sd_emmc_b {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_B>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_c {
@@ -910,6 +916,9 @@ &sd_emmc_c {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_C>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &simplefb_hdmi {

-- 
2.47.3


