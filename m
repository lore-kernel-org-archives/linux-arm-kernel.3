Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87EF013C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQQeZONwKwCdPNSwQyhXsapOBL2pKbGdyOesouYcZjk=; b=2YnWQyTem+6SX0+Uy6QqEBHE4K
	25pgCuuGkaa+fucNezJQ7aCLzgmLUjiynGFkY7vmfqdO5pJnNwTcwf36bXCih/wk8e8tV3JECAn1z
	HitwSlGKbhMYtE0ToYpi+jpIf2nTBB6TzeYTRoKenk9sXntudmGJDvobxq/eyYhUHiD8xx1nSkXAD
	1ralnFAQUXdkQ01jZVqOKQxLE9+HM30lgYkZHauWeFcSI6byeBfJ3I831ZQWX6Ci491NrdXBPgBUk
	Q3rzuc8WSZkUm6K9IlpLLfd5WRobEaWCmaVs2lgwLZBpajEDEvORy8Y0zMYas6JgDPB/2/o/c2GKx
	H4SW2rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22VA-00000003UWh-2eCu;
	Mon, 16 Mar 2026 07:36:37 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22V7-00000003UVs-2B77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:36:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82a15b44c3cso1519862b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 00:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773646592; x=1774251392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQQeZONwKwCdPNSwQyhXsapOBL2pKbGdyOesouYcZjk=;
        b=R2NpH97i6EeEdmM40mgjfNmQ+TLDKNv5YO8AoLMQkJh6JrFiqkH4pVyrfqBAxBHRzr
         yfr7YNhZcX5DMf+ilM52ufsWnJ0Fup+jKKRhIP+Jg1WlXH5eA8dEY1zrP6E99bZvalY6
         jhQ0CgXcQARKfOyeAfYnwE+NrhJqXPoS1dF2cJ2AS24/B8k8ztfMHKjBwEI+op2g+phQ
         9ENltTPQ7BtLdPAanebcDyWNSbRR1lf1H6NxV6VUG1Gis00UJ8jsFsOkGPNmYsjpuJO3
         ExznVWVhcZeowQrO/mGx4vs1jCbRPOa5QCZLcargfYfEUq6fRHL0TSgr1aQ7pJPR3Wrl
         lANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646592; x=1774251392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQQeZONwKwCdPNSwQyhXsapOBL2pKbGdyOesouYcZjk=;
        b=D2CjZzOdXmiEI9zPB3J0xVEcekKM2v8FiTWntar1k3Uehjkbxb14ne7lXU3vogBQWX
         zpVuVEWuYswXkpCR3w10ZrnnV0x4HZVCsJti3mtV92duidJ6eYEMCVWTPs0xE75A81Zw
         9l9puVl/6AhUDa+9Os8qZbg9gtkpaMtfsgaj+G3ktfUFnpO0kdFmfqY1+lBnRLKwdUiz
         lDHqcSfWxVy51nWNRVT2jBX4uvnXcuhpAOdcZo/5y/JZmHGvFEhfuZyRke7VATlE1Dbm
         4wXlAvlRy2/JlG+tcXRryf1W4XGgcy1IC2hEoVPAtC/x+Q3LHL2gzbS0BKWBau5rkQ5r
         e5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUMvZsPQbxkDmYFEnqQFNG5c9oKbWi09QNtd8aINR/lYVw4McQB+Ct4gkqAzu0K8gyg5GhhuvzVetZD4g9NLu4d@lists.infradead.org
X-Gm-Message-State: AOJu0YzABKfkhyU2/rP4HFcaHAXRcdbOfiOgwMPfmOX2Jz5SE7GMzdcI
	8xJ0osIfQm80KOU6EcrdvcltrWo6/GYSeNBYWZSpcNWlTZNcRXq16CKH
X-Gm-Gg: ATEYQzyNYI8hu4U+eefXtzYI2a2XenNM2H5q4Jkh6/REjzv6xvsqkLxv8bMC2xAA1jO
	iJhW5k9p1Vph2MBEfr2BzZ6DX3QNyEepUe9Q+ye3by1coDXrMROYUG9Bx41DfurloVkXulvW/YA
	qWxwpemz6jOFuMhEpjgtYBp2YnknadByZn8gwSMIuZiuPYUZIozWz7a+IW5ySrsnWES2bqLe0LB
	oPMJYv5m19Aasz6FQLO2ja94gUG38Tj4Q4WxwF9Ki0sOG+qQvzTfKLiMTW/C6xX4DlYFAxUseL2
	47V8gTNtMq0AB/XqmDCexP2RmrsdM7yA9NamO4d4kPOwxCe4AUji5qAE7uoqsb8dc0iKoAGvxM8
	bGquHJKPcd92llGGERJyK8w7X9LL2rtwTA2LUz/XF9eCLVwUBB30JhhkjPmmpkOZY3X1jGVcJTI
	S7Z2GwqunoezmfDt0KkrpM
X-Received: by 2002:a05:6a00:301c:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-82a197046d3mr9943668b3a.10.1773646592298;
        Mon, 16 Mar 2026 00:36:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07244071sm12933375b3a.6.2026.03.16.00.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:36:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
Date: Mon, 16 Mar 2026 13:03:55 +0530
Message-ID: <20260316073621.39027-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_003633_562482_4B2CAE98 
X-CRM114-Status: GOOD (  13.03  )
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

Add supports-clkreq and the corresponding pinmux configurations for PCIe
ASPM L1 substates on the Rock 5B, 5B+ and 5T.
The supports-clkreq flag informs the PCIe controller that the hardware
routing for the CLKREQ# sideband signal is present. This enables support
for PCIe ASPM (Active State Power Management) L1 substates, allowing for
better power efficiency.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Rock5b schematics.
[1]  https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf
v2: drop the clkreq pinctrl for pcie3x4 as suggeested by Shwan Lin.
[2] https://lore.kernel.org/all/20260311115502.7353-1-linux.amoon@gmail.com/
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b3e76ad2d8694..bf4a1d2e55ca3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -468,7 +468,8 @@ map1 {
 
 &pcie2x1l0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_0_rst>;
+	pinctrl-0 = <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
 	status = "okay";
@@ -476,7 +477,8 @@ &pcie2x1l0 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
 	status = "okay";

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.50.1


