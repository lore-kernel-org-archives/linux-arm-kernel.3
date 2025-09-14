Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9FFCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuYJPjqO369cLtT78pu4q0h8jWBIkb6EelOSKhjt1So=; b=VGVLfKcTT6UEWCLCFUeZOGZdi2
	UKoACIeXk2gi/3b1UHAmglUN/6M9xff7Hl0csunNZV5ezkFGwf8mafV3MlWcntTtXvEFrzuRiPSRP
	7nl3JHjZn23fQn/l7GSsBxZPrcp5BQnOV8mLM+yZc44xuTrpr522ykKbzbSqgZ8aSFCPsrxNTKzwy
	03sLEA4PFZOPF3IzHyF3yk1Zrlu9jg8//BkaHv7q1ypytW0c5c3LCL+G1XcCmIsCvUuKQcf6BF37N
	y2mSDwLv40HSt2kEGNyPOxkHYRpCZSwthIR1HgA4FgcIdzoS53Id5ZGKZZQD3xZJUPkcXjGyajgIu
	Uv90i38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu9L-00000002Ery-1t6M;
	Sun, 14 Sep 2025 21:20:43 +0000
Received: from mail-24422.protonmail.ch ([109.224.244.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu9I-00000002Epg-2MEw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884838; x=1758144038;
	bh=MuYJPjqO369cLtT78pu4q0h8jWBIkb6EelOSKhjt1So=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OHpyasHghddSwMxti/2xQUmZSn7VMYXCUj52PeyQLUMrRnDjQYcWTuTCKXVe3q73c
	 1IpUZX//AYFSlgXkzytlRMk1ku+JZDmx7NOTnEwlC72RNdGbSJ2O7n6CrRY/mNXJvJ
	 nLNKJigFdwnzn6dtMzwyCgFkEGf/wdwjxBFDFRlz34uQndkozZz8NFJa96ZbpjXBn9
	 cGUtrCGLokviFilbNkm4dHCrIFhZvgVY0rfSYUatgfbj4seZQbmySFqRtC6ztpnXX5
	 hM1jgxs+U3gRzhHoTxDFx+M+SzjqNkMq7WqJ3DSFY3qL/QhuGQx6jx0HLtBYEsF37X
	 ugl8FYyUgpXng==
Date: Sun, 14 Sep 2025 21:20:30 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 7/8] arm64: dts: exynos9610: Assign clocks to existing nodes
Message-ID: <20250915-exynos9610-clocks-v1-7-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 4ccc2d5e2d6824a04c8c279d5349b2744e279e32
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_142040_763728_0A76AC54 
X-CRM114-Status: UNSURE (   8.22  )
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

Required in order to have these parts work while the
clock driver is enabled (without clk_ignore_unused).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 arch/arm64/boot/dts/exynos/exynos9610.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos9610.dtsi b/arch/arm64/boot/d=
ts/exynos/exynos9610.dtsi
index 8ac113ceddacc30b52fa35954c85e1b8c320057d..2dc7cdda83d9357cb2a44d58d66=
6a75674c83ec4 100644
--- a/arch/arm64/boot/dts/exynos/exynos9610.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos9610.dtsi
@@ -319,6 +319,9 @@ pinctrl_alive: pinctrl@11850000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11850000 0x1000>;
=20
+=09=09=09clocks =3D <&cmu_apm CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK>;
+=09=09=09clock-names =3D "pclk";
+
 =09=09=09wakeup-interrupt-controller {
 =09=09=09=09compatible =3D "samsung,exynos9610-wakeup-eint",
 =09=09=09=09=09     "samsung,exynos850-wakeup-eint",
@@ -342,6 +345,9 @@ cmu_cmgp: clock-controller@11c00000 {
 =09=09pinctrl_cmgp: pinctrl@11c20000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x11c20000 0x1000>;
+
+=09=09=09clocks =3D <&cmu_cmgp CLK_GOUT_CMGP_GPIO_PCLK>;
+=09=09=09clock-names =3D "pclk";
 =09=09};
=20
 =09=09sysreg_core: system-controller@12010000 {
@@ -385,6 +391,8 @@ gic: interrupt-controller@12300000 {
 =09=09=09      <0x12306000 0x2000>;
 =09=09=09interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
 =09=09=09=09=09=09 IRQ_TYPE_LEVEL_HIGH)>;
+=09=09=09clocks =3D <&cmu_core CLK_GOUT_CORE_GIC_CLK>;
+=09=09=09clock-names =3D "clk";
 =09=09};
=20
 =09=09cmu_g2d: clock-controller@12e00000 {
@@ -434,6 +442,8 @@ pinctrl_fsys: pinctrl@13490000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x13490000 0x1000>;
 =09=09=09interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09clocks =3D <&cmu_fsys CLK_GOUT_FSYS_GPIO_PCLK>;
+=09=09=09clock-names =3D "pclk";
 =09=09};
=20
 =09=09pinctrl_top: pinctrl@139b0000 {
@@ -489,6 +499,8 @@ cmu_dispaud: clock-controller@14980000 {
 =09=09pinctrl_dispaud: pinctrl@14a60000 {
 =09=09=09compatible =3D "samsung,exynos9610-pinctrl";
 =09=09=09reg =3D <0x14a60000 0x1000>;
+=09=09=09clocks =3D <&cmu_dispaud CLK_GOUT_DISPAUD_GPIO_DISPAUD_PCLK>;
+=09=09=09clock-names =3D "pclk";
 =09=09};
 =09};
=20

--=20
2.47.3



