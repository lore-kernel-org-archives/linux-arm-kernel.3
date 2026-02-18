Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E7AE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hLWHawfUnZuiQ3TDhSdC1bL32uOxcaH5z4XCL/rXWbU=; b=E4ZdyXOv0UUY/q2hBIbyOgG2Hh
	a6bqVtuJx3UkY6fMgItLjpDUXCaOEUQEdx1PRTB4T2cPGl1Vc3/VLSqypLuqbDLRwAAHCCiXCmCLR
	oEWw+LHRcaqRBvoEc18isguIgXd22MOtuXjALDy/Si5/DE8Yknca/ENRpchw9Yk97k5j+N4FZ2guu
	rkYK5DqrVuwDan48Z73N9Rhk0Qr590kNyIIVQucJS6eXmwXl+c5ZM4j3ixz4iTquCuE+ZLruWmxQ+
	/Azlth8wXTF70bG97+4Nm8ieFVq0HZxtTYmlmlVfNjRsMBakPDElmn3f3PNe0bocnqbONeIKryNtH
	LFNhRYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoKp-0000000AO9O-0XzB;
	Wed, 18 Feb 2026 20:39:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoKl-0000000AO92-0fHM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 20:39:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-481188b7760so2314665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771447179; x=1772051979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLWHawfUnZuiQ3TDhSdC1bL32uOxcaH5z4XCL/rXWbU=;
        b=s2WlwqD1tGFW693a+TkQCnLlUB5/sfUqgsG9U2ZPIcfitgEOZ+MmuvGdZuNradiokz
         yUEvIkiUhKnvIA3iXvpT1r2q7s5Zyk12xDGl/OpezooAwkVI74tzW0GfKzU3qwA43v4S
         jr1RTDyvfsLA9o4yOEPSxiRnYFz5RilCXnrjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771447179; x=1772051979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLWHawfUnZuiQ3TDhSdC1bL32uOxcaH5z4XCL/rXWbU=;
        b=R4kH2g25IVp/7rPnu4SnVtt/sCATFl5ZABiKzDzHAufImd+TH/0Rd0aTcEhZo+7+xu
         6MjeXDCKx0IPau92sSteu9sDYZCZpZxmB1LlX978uSe6TlLmKTXuUTwOzsM18zFCj9qe
         OWJTNK4b9EOmz1Wz3dSRopB+IcGBfUJeeYcj/RI/g1uFfRbHwe6twCERoIydcjQsWmGy
         7GiiGDtXLeeiFMbep0SBXnLpzDGjQDeRMIjSsBupkqy9qVyu23JTU5nbuOUetqYiDqod
         oRg+o/nJ/io6g8UP5XRcXdPjh7IWT/iAU4QDX5XiLkCEDPuRxfZT8Bw2g3p/AU3uGUAG
         JH1A==
X-Forwarded-Encrypted: i=1; AJvYcCWC/vvdsrtuwkX7gZfq6DQnCR9d6CK8m5A5n6FAALQZv+EYqUR8LrRtgB5xJLI0Byd/jndnV2XtdJcLq+5Dp29b@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+0A1GKxZxoqbOEdWd2ygAgvrmL9mNdA0Yyxk4+xRrqarGY6Bw
	1DMd1nMbLGHxNNUYJ2l7kX6eI8L2qq/AJVBRzSPPMppXzRkifVK3Oop3CXI3Ho4T9x8=
X-Gm-Gg: AZuq6aJbx/P4gehdtCHjNmBUj44wVqgj2NjrY9dEe8SzeY/lBOdHVJROM2LFTCs/yfQ
	E2CXbnKmdyKxbzZ1AusT2Mq+GBfS3aQ8DCuQLtUn8WLRrwr/Wy7jcoo8R9K4YjOfTg+jzsSLJ7v
	s+CCEt2WDqx9p8i0h5L2vn9jsldBu/3LQGgfZXs0jOfEsKyv2QBnGFPkwddxCGpDDrLNs/WWcey
	K1XrLQinHPBOrb7B/gdWnJx0Cy1S33MNAoFgXVwOo9Mlo1HnDw1uNevNiQannGOrw/Sr8f8CKF7
	PU2h1TYZBw5USarvIdrBXDHIQInSeMti+YSXLCqRUY6OkmC9BuHmrfUpCBxYzh0JjUSKfvW8uP7
	2x5akAA3YZ3gzxZzAMFXD0dSWhNlv8Z2tmgzPbPG0lxejfUbycQysodhQPYopiCPf46fHgc7vWH
	Xnt6jaOYBiLmjtn1CrchoKdMoagaoPAtXwjqlLmMVAQQV4mguO/oHjchKgT51Lo6EPll0QC1yHJ
	XSqJIMVu52CaIy2cry7fbdu0KvHUyBMmBRi
X-Received: by 2002:a05:600c:6091:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-4839e661d1bmr6597615e9.18.1771447179348;
        Wed, 18 Feb 2026 12:39:39 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr. [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm620432895e9.14.2026.02.18.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:39:38 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@smile.fr>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-j721e-main: Update delay select values for MMC1/2 subsystems
Date: Wed, 18 Feb 2026 21:38:23 +0100
Message-ID: <20260218203823.1825554-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_123943_593673_B4B53414 
X-CRM114-Status: GOOD (  11.72  )
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

The previous SPRSP36J datasheet recommends to set ti,otap-del-sel-sd-hs
value to 0 for MMC1 and MMC2 interfaces. These values were updated in
kernel 6.5. As a result we have some occasional regression with ultra
high speed DDR50 SDXC cards while mounting the rootfs:

  mmc1: error -110 whilst initialising SD card

A similar issue may occur with u-boot after a reboot while
initialising the SD card:

  mmc_init: -110, time 67

Update the delay values for legacy and high speed modes, based on
the latest revised datasheet SPRSP36K released in April 2024 [1].

  (MMC1/2 - SD/SDIO Interface): Updated/Changed the
  "OTAPDLYENA, DELAY ENABLE" and "OTAPDLYSEL, DELAY VALUE" for the
  Default Speed and High Speed modes from "0x0" to "0x1"

[1] Table 6-86. MMC1/2 DLL Delay Mapping for All Timing Modes, in
https://www.ti.com/lit/ds/symlink/tda4vm.pdf,
(SPRSP36K – SEPTEMBER 2021 – REVISED APRIL 2024)

Cc: stable@vger.kernel.org # 6.5+
Fixes: af398252d68e ("arm64: dts: ti: k3-j721e-main: Update delay select values for MMC subsystems")
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d5fd30a01032..418e6010ef1f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1643,8 +1643,8 @@ main_sdhci1: mmc@4fb0000 {
 		clocks = <&k3_clks 92 5>, <&k3_clks 92 0>;
 		assigned-clocks = <&k3_clks 92 0>;
 		assigned-clock-parents = <&k3_clks 92 1>;
-		ti,otap-del-sel-legacy = <0x0>;
-		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-legacy = <0x1>;
+		ti,otap-del-sel-sd-hs = <0x1>;
 		ti,otap-del-sel-sdr12 = <0xf>;
 		ti,otap-del-sel-sdr25 = <0xf>;
 		ti,otap-del-sel-sdr50 = <0xc>;
@@ -1671,8 +1671,8 @@ main_sdhci2: mmc@4f98000 {
 		clocks = <&k3_clks 93 5>, <&k3_clks 93 0>;
 		assigned-clocks = <&k3_clks 93 0>;
 		assigned-clock-parents = <&k3_clks 93 1>;
-		ti,otap-del-sel-legacy = <0x0>;
-		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-legacy = <0x1>;
+		ti,otap-del-sel-sd-hs = <0x1>;
 		ti,otap-del-sel-sdr12 = <0xf>;
 		ti,otap-del-sel-sdr25 = <0xf>;
 		ti,otap-del-sel-sdr50 = <0xc>;
-- 
2.52.0


