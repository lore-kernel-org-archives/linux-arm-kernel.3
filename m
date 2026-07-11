Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED06C44507
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=; b=ED5MJbExFKsx2QEIwxdmCxN6Y1
	lYOVz2c2TcjQY4O4Xuy7VnSXP3G079pErTB+SW+kBYWuOBfIZPNMScdPI+B0+1YaIZYBhm7kLVb7J
	q9T4RhEQK/MFNzi0h8lQgmuVnVitn1YozczskFuhppYhC+9bt3mDoK1X9RZfOBMTe9VcdXnDGOyXe
	tWx6OucZfSp+dcNSl5wk5Uq0iEBLrW/KkWJAfOAH8drqHOzxJZB8nnW/qsMeKFFmGb0eN6OD8ma+r
	Ml1PUG/WLtVT6Hxgpql0LlTSvW/i/zlnAfdkw54TN1GEYFQdZH1hJD/0PoZaKsyTae2Yjh8tawVbb
	XtiuUeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnb-00000006Eu3-3bEQ;
	Sat, 11 Jul 2026 06:02:51 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnT-00000006EgL-26XC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749744; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PR1nHFc/QTqY+8hJVt2n1XSc8RSndpL3dJcVeJbTVYupGbSxEx8+IdKq0jW851lDMy
    Fb1OL1qYyjm0rry27iYDx9oVVr8WJnH+FGZOEfp10EKfLPK08+y2D7arl+tOfsWuyiHM
    MuKxA1uEbFgRTmC+NKcZiX9ujqAzDf633fe9IbE8lAJnk8oyn2NCUP5L65LcSHBFb7tp
    LTIzJ3aMk84+yc2Qsiw6ll+fFzZiXGjyv3Fv4Fxri4VduNcOI9pUX4soGBjusB8E3jLF
    BjlczD38d/LpCsHCoAOa9i3Kx3birvPMIFhJu3zTukod8E0rasrztihvczZIJskOec1B
    j4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=B55AYc3/CiWoSmm0ewOMOylZKiox5tJZ8moAzxu1QA1GxA3jlJL7N4AeHBmi+WEUfv
    0G03dm8zIi43QpfwfO4q1XBsT9NNYsYFTwkKNjp8QFaN3XDdyYO0TUmj33vvPzwmlx0e
    RHuwcAEQVIW43CZ7v1Ctdo+IbGaFDH1ff+5ibVwjjh0DEINqNw+hvrk7OUyUw0qgIiGR
    4bc6h9D4teQ5MMIudFPdAgJAiuYHb3Tgob5Okp1FmgN/XFizAiCA3lonc583jKPssjwk
    /eyvrQlsIxw0EWMJTS5mNMj4r0ts/V+EdreNDaffHhsVQQNVenJBF1KDwuA5IRAXdMbU
    NVgg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=Zhji+FruYjtrExERO7SrSZF2ktV6BXHMG6nFLQw6JxfER1ygmuRuKHQ8W4GWjh8vrU
    sZLSgQy7qmu4CU3KTW2L/JgZ1+wzgoI8W3r8xSqIkKZK31vghaSHjMRWAP86FcUopR3r
    uptdedwaZu9HcOgEgoYTUxQny1XML+MsoOkX69rG6xD6O1a1ZMibAdn8alk/PypHD9AD
    gJqcbXhcnoAUkI/ifROQtV/IMzkebsvdvuFGP0vn9B3ywlkeLtwfe69zqlKa3CG1qaWb
    oG3g5Dgss/7Lxsu2iJIzU4y96cCXnYeZhtOwqWMZA6ckg6FWxrnSaGvlBgOVCPvWyVJV
    +zZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749744;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hz7dWutT/qhmVRNalsYplqBc+0PlAjZb59MfOBNTMdM=;
    b=zCuCf5AQ74RZRR3454ckpV2ZuySuLSyvn2wqrvlKki4HgJirIrNwTdc7KDvLkpElY7
    T1I+KXo3MgT3AXba0YDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62MGhy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:22 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 13/16] arm: dts: omap3pandora: create new DT node for the sound card
Date: Sat, 11 Jul 2026 08:02:00 +0200
Message-ID: <e21be70f6ac6691c4a42808693215ed2f58eace2.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230243_717807_4B18755C 
X-CRM114-Status: GOOD (  12.20  )
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

From: Stefan Leichter <sle85276@gmx.de>

This means that the sound card driver (snd-soc-omap3pandora) will get
loaded by default.

To make this work, we also add dac pcm1773-codec and widgets and
routing as needed.

Signed-off-by: Stefan Leichter <sle85276@gmx.de>
Signed-off-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../dts/ti/omap/omap3-pandora-common.dtsi     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index de9860526b323..13821d926afb0 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -47,6 +47,45 @@ dac: pcm1773-codec {
 		vcc-supply = <&vsim>;
 		enable-gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>; /* GPIO 118 */
 		status = "okay";
+		#sound-dai-cells = <0>;
+	};
+
+	twl_audio_clk: twl-audio-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+		clock-output-names = "clk256fs";
+	};
+
+	sound: sound {
+		compatible = "openpandora,omap3pandora-sound";
+		status = "okay";
+
+		label = "OpenPandora";
+
+		amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		amp-supply = <&regen>;
+
+		widgets =
+			"Line", "Line Out",
+			"Line", "Line In",
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic (internal)",
+			"Microphone", "Mic (external)";
+
+		routing =
+			"PCM1773 DAC", "APLL Enable",
+			"Headphone Amplifier", "PCM1773 DAC",
+			"Line Out", "PCM1773 DAC",
+			"Headphone Jack", "Headphone Amplifier",
+			"AUXL", "Line In",
+			"AUXR", "Line In",
+			"MAINMIC", "Mic (internal)",
+			"Mic (internal)", "Mic Bias 1",
+			"SUBMIC", "Mic (external)",
+			"Mic (external)", "Mic Bias 2";
+
+		sound-dai = <&mcbsp2>, <&dac>;
 	};
 
 	gpio-leds {
@@ -724,6 +763,9 @@ &mcbsp1 {
 /* audio DAC */
 &mcbsp2 {
 	status = "okay";
+	#sound-dai-cells = <0>;
+	clocks = <&mcbsp2_fck>, <&mcbsp2_ick>;
+	clock-names = "fck", "ick";
 };
 
 /* bluetooth */
-- 
2.50.1 (Apple Git-155)


