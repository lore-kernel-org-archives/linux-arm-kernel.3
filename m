Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC76CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA/7FABn8a7pWXMpM2xcA7gy/SjjJShwWBDUuziXWHI=; b=kOwNGvjcpBDSX1gl8iITeoMr6z
	mrOuaSS1JLxw9leL4ZF7/WvY6zlne7kLQR0YBBOtG//IiKaVnxL2Skgh2P3mETPLKCKrfl6jR9Xje
	OSKViaUeWZofFb5rg5OO1t9QLojOgyEP5SxIr4V6PpzFQPWsQVjXn9jF1JGXxMWFayIqBUOrODvqc
	oU0CmuULEE0SdU9I1fR8PXeYHmliBdLvODmFPZD/5PlJHLFrwW0YCTHTEPWyXOFWtmFbkuBV3T/zn
	2OsvP0txfk8dAI6PqPjHkZTQw6tVhKdN9Fl6uu1aebsoFKtUREdWa4+5zAT4ZXZbjTz8duqgjSFxN
	bNeo/Xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu98-00000002EkV-06KX;
	Sun, 14 Sep 2025 21:20:30 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu94-00000002Eg9-0Nfr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884823; x=1758144023;
	bh=bA/7FABn8a7pWXMpM2xcA7gy/SjjJShwWBDUuziXWHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=G6M2UqUGp7EYBFZAHUDRc++hqW3Ox5Ltcw5epvx0gpK6njbhd3EiTD0fL3lRNyCTE
	 RAX6rafNS3uLuqmD8kZ/FjiWT9V/TtS3Xy5mmR+h7V86nUavVjdfmpvN+gU2FZlkFr
	 hJx6mWdn6KWWA30voFzRtRE3aAv+6GqCqwT20zGlwl6LbNu/ZTuVKEKZ8rcyU1s7bG
	 nUo+GBxLux5+pUS0KBpvpjKNYiHyJNXNxUmewO6x5Tygjsf+Sa25+eFol2QC4FacJl
	 +7OEnwrzKWcDlYUHUxYr72DKGagdNtgoXagdeKp2JfEt6k3Zo1YdWUXYau/K9YKFWM
	 6rp03y9DJEz0Q==
Date: Sun, 14 Sep 2025 21:20:20 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 6/8] arm64: dts: exynos9610: Add SYSREG nodes
Message-ID: <20250915-exynos9610-clocks-v1-6-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: a999af5f5abde04ff6dc9488d0fec36982f1cc2a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_142026_286283_05573F7A 
X-CRM114-Status: UNSURE (   6.28  )
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

Add nodes for:
- apm-sysreg
- cam-sysreg
- core-sysreg
- cpucl0/1-sysreg
- dispaud-sysreg
- fsys-sysreg
- g2d/g3d-sysreg
- peri-sysreg

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 arch/arm64/boot/dts/exynos/exynos9610.dtsi | 60 ++++++++++++++++++++++++++=
++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos9610.dtsi b/arch/arm64/boot/d=
ts/exynos/exynos9610.dtsi
index 2a15986c459d6af9f83362c27cdcc3a2646c256b..8ac113ceddacc30b52fa35954c8=
5e1b8c320057d 100644
--- a/arch/arm64/boot/dts/exynos/exynos9610.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos9610.dtsi
@@ -210,6 +210,12 @@ chipid@10000000 {
 =09=09=09reg =3D <0x10000000 0x100>;
 =09=09};
=20
+=09=09sysreg_peri: system-controller@10010000 {
+=09=09=09compatible =3D "samsung,exynos9610-peri-sysreg", "syscon";
+=09=09=09reg =3D <0x10010000 0x10000>;
+=09=09=09clocks =3D <&cmu_peri CLK_GOUT_PERI_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_peri: clock-controller@10030000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-peri";
 =09=09=09reg =3D <0x10030000 0x8000>;
@@ -238,6 +244,12 @@ cmu_cpucl1: clock-controller@0x10800000 {
 =09=09=09=09      "dout_cmu_hpm";
 =09=09};
=20
+=09=09sysreg_cpucl1: system-controller@10810000 {
+=09=09=09compatible =3D "samsung,exynos9610-cpucl1-sysreg", "syscon";
+=09=09=09reg =3D <0x10810000 0x10000>;
+=09=09=09clocks =3D <&cmu_cpucl1 CLK_GOUT_CPUCL1_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_cpucl0: clock-controller@0x10900000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-cpucl0";
 =09=09=09reg =3D <0x10900000 0x8000>;
@@ -253,12 +265,24 @@ cmu_cpucl0: clock-controller@0x10900000 {
 =09=09=09=09      "dout_cmu_hpm";
 =09=09};
=20
+=09=09sysreg_cpucl0: system-controller@10910000 {
+=09=09=09compatible =3D "samsung,exynos9610-cpucl0-sysreg", "syscon";
+=09=09=09reg =3D <0x10910000 0x10000>;
+=09=09=09clocks =3D <&cmu_cpucl0 CLK_GOUT_CPUCL0_SYSREG_PCLK>;
+=09=09};
+
 =09=09pinctrl_shub: pinctrl@11080000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11080000 0x1000>;
 =09=09=09interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 =09=09};
=20
+=09=09sysreg_g3d: system-controller@11410000 {
+=09=09=09compatible =3D "samsung,exynos9610-g3d-sysreg", "syscon";
+=09=09=09reg =3D <0x11410000 0x10000>;
+=09=09=09clocks =3D <&cmu_g3d CLK_GOUT_G3D_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_g3d: clock-controller@11430000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-g3d";
 =09=09=09reg =3D <0x11430000 0x8000>;
@@ -285,6 +309,12 @@ cmu_apm: clock-controller@11800000 {
 =09=09=09=09      "dout_cmu_apm_bus";
 =09=09};
=20
+=09=09sysreg_apm: system-controller@11810000 {
+=09=09=09compatible =3D "samsung,exynos9610-apm-sysreg", "syscon";
+=09=09=09reg =3D <0x11810000 0x10000>;
+=09=09=09clocks =3D <&cmu_apm CLK_GOUT_APM_SYSREG_PCLK>;
+=09=09};
+
 =09=09pinctrl_alive: pinctrl@11850000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11850000 0x1000>;
@@ -314,6 +344,12 @@ pinctrl_cmgp: pinctrl@11c20000 {
 =09=09=09reg =3D <0x11c20000 0x1000>;
 =09=09};
=20
+=09=09sysreg_core: system-controller@12010000 {
+=09=09=09compatible =3D "samsung,exynos9610-core-sysreg", "syscon";
+=09=09=09reg =3D <0x12010000 0x10000>;
+=09=09=09clocks =3D <&cmu_core CLK_GOUT_CORE_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_core: clock-controller@120f0000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-core";
 =09=09=09reg =3D <0x120f0000 0x8000>;
@@ -365,6 +401,12 @@ cmu_g2d: clock-controller@12e00000 {
 =09=09=09=09      "dout_cmu_g2d_mscl";
 =09=09};
=20
+=09=09sysreg_g2d: system-controller@12e10000 {
+=09=09=09compatible =3D "samsung,exynos9610-g2d-sysreg", "syscon";
+=09=09=09reg =3D <0x12e10000 0x10000>;
+=09=09=09clocks =3D <&cmu_g2d CLK_GOUT_G2D_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_fsys: clock-controller@13400000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-fsys";
 =09=09=09reg =3D <0x13400000 0x8000>;
@@ -382,6 +424,12 @@ cmu_fsys: clock-controller@13400000 {
 =09=09=09=09      "dout_cmu_fsys_ufs_embd";
 =09=09};
=20
+=09=09sysreg_fsys: system-controller@13410000 {
+=09=09=09compatible =3D "samsung,exynos9610-fsys-sysreg", "syscon";
+=09=09=09reg =3D <0x13410000 0x10000>;
+=09=09=09clocks =3D <&cmu_fsys CLK_GOUT_FSYS_SYSREG_PCLK>;
+=09=09};
+
 =09=09pinctrl_fsys: pinctrl@13490000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x13490000 0x1000>;
@@ -405,6 +453,18 @@ cmu_cam: clock-controller@14500000 {
 =09=09=09=09      "dout_cmu_cam_bus";
 =09=09};
=20
+=09=09sysreg_cam: system-controller@14510000 {
+=09=09=09compatible =3D "samsung,exynos9610-cam-sysreg", "syscon";
+=09=09=09reg =3D <0x14510000 0x10000>;
+=09=09=09clocks =3D <&cmu_cam CLK_GOUT_CAM_SYSREG_PCLK>;
+=09=09};
+
+=09=09sysreg_dispaud: system-controller@14810000 {
+=09=09=09compatible =3D "samsung,exynos9610-dispaud-sysreg", "syscon";
+=09=09=09reg =3D <0x14810000 0x10000>;
+=09=09=09clocks =3D <&cmu_dispaud CLK_GOUT_DISPAUD_SYSREG_PCLK>;
+=09=09};
+
 =09=09cmu_dispaud: clock-controller@14980000 {
 =09=09=09compatible =3D "samsung,exynos9610-cmu-dispaud";
 =09=09=09reg =3D <0x14980000 0x8000>;

--=20
2.47.3



