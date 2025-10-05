Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ADCCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sVsFTFjEv9kM8rDChOfPUs/cIN5z2bUzO1qk6xeCpWQ=; b=2ALAXfbVRJxTytliLu61jg6dSm
	58pztajV+Pr0DiSE0R1p6tWYK2HmmyTKn8zfFixp+309XZLaleeeVTybLE1Eaw6NrZALab7bATze5
	JtyvpSa7+RvxcB4rsU+Z6jdhZ1CUmaGkOGdxlsEsbvq62jaPIQ5qTycv0U72576tcbe/lSya3yWh1
	+EeDMMVWLhHjk1mtWQdGpCFtBYTdhWERANyAsMosRjFewxs2El0gJWY5gZkWxXTkxRcO4zxWuaCSa
	LQ8ZIavDaOnSG7FZoufiFnQ8peKuE1ukAa5IwLjQDNx9uvlFQ6AvUU9VrzuCzOOtdcDZsyXYKSoZ+
	H8/oQvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5N4S-0000000Eu8C-21hc;
	Sun, 05 Oct 2025 11:38:32 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5N4P-0000000Eu6b-1dTQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 11:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1759664305; x=1760269105; i=wahrenst@gmx.net;
	bh=sVsFTFjEv9kM8rDChOfPUs/cIN5z2bUzO1qk6xeCpWQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NiGpB2nApqlZ7Hi+sBV9hjYpNAmMrwsXu6WdzWd2bq+ZRjrghzBTOec7ZJMOSLcL
	 Fnzw3COy4T74sSODZBjWjj1U1zoy6Wv0oQ+uVHR1+CGGgomP4RXZ9egxLTJo+/SxB
	 JX7MFW0HIC5qrPwIuR0m7qml3E99eJbFEEApK6/GYtwy1VVT7+FUp/y5LV55a6WI6
	 pG9yKuUDPS4VukKeR6IE7KZ3xV44EBgN1Dq0474SttYMPQg2GwktXNX2C3SDuG8Sf
	 K6pyySCNeI9sUsUHT51EHpUzi/nror3gR4tkEp6GB8KdnWMYRWY9OadI8i9NzGjGT
	 LILWUhQrMPb+y66i4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from schenker ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1vB8MO11s5-001Ke5; Sun, 05
 Oct 2025 13:38:25 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Date: Sun,  5 Oct 2025 13:38:16 +0200
Message-ID: <20251005113816.6721-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tl2pUraJCzJrGS08mP2ZU3Pj3wzwfPShp3iheV8jKEDC6OT3tK6
 8iQxZ1vm0wBnmOlCr3G8RsD1B1SIb97ye6MSi50KwgCe8UmRoqLZ6EVvMwQsiuzM+heTH9d
 CTC7ID4i5L51xqseL4hIvbs9qP7heJpj4QacYo72ggM09tKcmGKyMT7cuLTvOUJjGrcLSdD
 rMcNIKGaawaEJPjrB6s0g==
UI-OutboundReport: notjunk:1;M01:P0:eS7tb2uXEV4=;h2kG05y5iWOJF4HcaDjRZqBLdoQ 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 bSDFfYPJzvFzuZ4LZ32HuHhVzIduPT2mlNkcS9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_043829_798993_9EB312C1 
X-CRM114-Status: GOOD (  11.06  )
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

Until commit 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off
when preparing/unpreparing") the clk-raspberrypi driver wasn't able
to change the state of the V3D clock. Only the clk-bcm2835 was able
to do this before. After this commit both drivers were able to work
against each other, which could result in a system freeze. One step
to avoid this conflict is to switch all V3D consumer to the firmware
clock.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-arm-kernel/727aa0c8-2981-4662-adf3-6=
9cac2da956d@samsung.com/
Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when prepa=
ring/unpreparing")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        | 8 ++++++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/d=
ts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..1eb6406449d1 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -77,6 +77,14 @@ &i2c0 {
 	/delete-property/ pinctrl-0;
 };
=20
+&pm {
+	clocks =3D <&firmware_clocks 5>,
+		 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+		 <&clocks BCM2835_CLOCK_H264>,
+		 <&clocks BCM2835_CLOCK_ISP>;
+	clock-names =3D "v3d", "peri_image", "h264", "isp";
+};
+
 &rmem {
 	/*
 	 * RPi4's co-processor will copy the board's bootloader configuration
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi b/arch/arm=
/boot/dts/broadcom/bcm2835-rpi-common.dtsi
index 8b3c21d9f333..fa9d784c88b6 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
@@ -13,7 +13,16 @@ &hdmi {
 	clock-names =3D "pixel", "hdmi";
 };
=20
+&pm {
+	clocks =3D <&firmware_clocks 5>,
+		 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+		 <&clocks BCM2835_CLOCK_H264>,
+		 <&clocks BCM2835_CLOCK_ISP>;
+	clock-names =3D "v3d", "peri_image", "h264", "isp";
+};
+
 &v3d {
+	clocks =3D <&firmware_clocks 5>;
 	power-domains =3D <&power RPI_POWER_DOMAIN_V3D>;
 };
=20
=2D-=20
2.43.0


