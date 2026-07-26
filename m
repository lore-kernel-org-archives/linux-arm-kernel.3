Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F2FC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=; b=o4POTwzQ5LtVxA
	3tHKAaRDbUeR0oOV8hbhzR5/oM9un0aVRNy2CM5GVjtovuAS/0QNoU9AiBHFN/Wst4uxPSFuI3Vko
	Q30YKtz8Ky6I91O/0WSyOhvPatEYsdlie2XP7a33q1yavAm+rnsxdAadNCH1J0CgGJ99l4B499cPM
	vB4pGUZ/nIphllggY/e+t1PsIoGJgjo/Em4BiBjq0GRoamiG1x7VuuGq/wObM7w8qM/nb8mUsmpa+
	vL+WcM10SNOpuvdqcXzARcsOuMykQ34vP1kXyRt5b6zrP/5rdfSIx0lfuUikGgcWdVAYFEglaIRmk
	tqCqqFqqdxii4+Zt1Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UF-00000001Tlp-0z27;
	Sun, 26 Jul 2026 18:22:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UC-00000001Tl5-1q9W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-495590dde14so21401585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090122; x=1785694922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=arPOcQeJvIZr8N52LXknlNNMHbbvuBMOZCL7dR9OZl9PEN2+Jc2voynaProwKNTadW
         tbbTkyhIL3OwAwYL+W+5mmbWaZ3G1hYhe0X5zeSOCCYdbSHG8t3vOAadkqXCYy/t8DPW
         tH7k4MC6oPJqGgYSAXV5huzK8swUQ8juLv+FDHYx6d/YWnSjazODQLKopoRNAMVfQT5m
         WhbIXAbNm+ykWaRAPPSeo/zZnsP0cELgVzVrQBME42fbCE/EVKZmY4+AY33xYCHPd+GX
         qQlJVLmBDir44a5UUpDL645SDEScgWHr6YBA6nYnHs03xkkoqLewnSHV+SvGb6vi0KPm
         FtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090122; x=1785694922;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=erTDLePV3VLsuN8K9+mwv1Xx80GdcgG2u1OOFRJ0PDOLkE+6tZZWSMXWAW9L8+F7qQ
         L0eZoQky8fXkuyvYb7nTV9Z0P2tiVteksSoHrmuu9SE6y8XB8SVw5qS4bQYCK/aKEvK7
         kZQWRnIKqZWirqt45PrThUkCNVXW5hifURa2lCoZuELPMPOdg2kSHPzGvEIaxioJFRX9
         IXeL1Gm9fl+zfk2Yvj4rlTnJoZzGgze/k7PXdk2GYU79cp5FPhrkf0n4+GrSW8jSCHG4
         lsQP5vDpToNQkQRKvJnNRdgM9qX/SBvr2eNYt+TQxK98XwmOhHRtylJwE/HaPRU2UO03
         AXZA==
X-Forwarded-Encrypted: i=1; AHgh+RqxwevF7hLS04MdEVKNAg7FnjAYSkAjsi76O0GSbmACcPjJF6qcconfX2orCG+sDgHIVWUovv01nQTvD2tSsC0h@lists.infradead.org
X-Gm-Message-State: AOJu0YwGm7CS7vzx6vkpAPrAcV6LPlzQFcIOxNa1Q05Srj0S1NekqKz4
	0bVi49djLpggsw9russtHO0TjLeYCEfxreIqkoOwUE+i8P6OPmZlgOYS
X-Gm-Gg: AR+sD10IhuU1TCj+ym3lhfJpgn4WIQSJKwEO7iIe8Z7Oz87J5Gc9nAf5YeNuN9ntKDI
	xsPDjiHKn1t69+z+noBHyfj6U33urnRx3HyT/Oyi250ZniI1LE2saskvnTbuqcu8Ga4cz+dWeiG
	Z+rhXo6KO25PTsA8L/T8+9X0gwsa/g9rTT/NVwrXxMm12wxeXhqkhwv14ii0zK5Z10KiLFxn0lU
	S3OW9BD4BKnQAblrdW3eWt3V2en7q7TIyJuD2T3lLtEibmRhvf+IvTXF202aah2vTjCmQN9ea6S
	VOjnwScXen8TNstd1z54c4LakOJKiiz7QdJhrLEEj3uXOCFLSH6ik6CUBpugmQbAetU0/3qKT7c
	Ow+i1y+EQZR2lDOcSL2XImHSHwBQpdGRyJQHb3CKIIb1Bmkk/tYxQI8G2EOsqfuwqsg20TZ8xSP
	SCUhTQPPPC+I6AbA2i8fD2haF8imz1Z0YCgdJBOQ==
X-Received: by 2002:a05:600c:8b75:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-496b56e6efemr88359835e9.2.1785090121922;
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:55 +0200
Message-ID: <20260726182158.249449-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112204_500260_D0ED674E 
X-CRM114-Status: GOOD (  11.95  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2/4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to specifications and how it advertise itself in the original
dts configuration, the board is a revised version of the ODROID-N2 with
WiFi/BT and Amlogic A311D instead of the original S922X, so the device
tree builds on meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi
(mirroring meson-g12b-odroid-n2-plus.dts), extended with the
board-specific GPIO wiring for the AP6256 managing, the status led is
green instead of the original blue of the N2 and polarity is inverted.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTW was built, validated against the amlogic.yaml binding
(DT_SCHEMA_FILES), and the resulting DTB was boot-tested on the board.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


