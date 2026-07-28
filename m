Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6600C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=; b=oWy/2cKolEghwS
	Cxmix+dRQ49wK+Y+JdCFjN/2dDD+aEmWXdy8ASZRNqVHfrYhipQj7qzISSmYHdoRSpEAgXV8b3PwA
	mZ2kHPaJN8fA3rFbGejxVmmfGTVdp+GAHWOhEXS214Rk4RC4O5O+FC4vbT8nlZAEGpUsueKaTaSL9
	14ExRllpXyGOVx2/BvFj0F8A7tSapQl0Q8JKSVwP2wsbIjSABjXI+bgubKKfTN2hOAjJNTVfstlxd
	ouRnV5aw8fjfIxqRAfUlkMlwl6Q5vfMGWQeeSNiHK1J/dR+8LXKtNJiYqZ2Aslhx3ThBl9YxDiCtx
	erlj3PLET8CvQxRIfVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojY0-00000005c7J-1dNH;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXv-00000005c41-3tb6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f6609c657so1930100f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251802; x=1785856602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=f3TK6vDf30x+u7NRRk5giMe8/0l2zNGlD2izVpVEPMVODGXR2SqpPoeaFB5Cc9i6+J
         NBQ1Xzd/iMkUqkRonWPxjuNze+nkKaw6XJ1osIk5KK848gfWyeEoeAsKgHPt7PXtLNpx
         I/Dr5M6YfQcIsy8d7kP7hPEwSGVOlCaDNUss/HrORVJdkSY1n/40KQNF3bKWdIydaRJJ
         aF51tiS8XXzc5eiGB2ojSgN3woK9Fvy/L+rqO4i050KGWyQuG6Jf2x0W9owA3PRBEbXz
         NHm0NdHy5Ht7wRLlcbWwgNGuc9qdNG1ZM5T5kju9OrfDp3Ppxu7ZSjDw/WMUPbma4zvw
         kB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251802; x=1785856602;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TYvBUpeT2RltElx7WsXqQl+6E8angCl/PINS2CX8a8=;
        b=Iic43a9jO/m0ZySh9CIqWObEjD2trXkMpDwKb6e065otcz/Jir9wPKaCJW5MI9lQ1A
         ojJ4F4ynAbZGIJD+LRYpGcjvzOKqZ5gvCJlSdBbb6g2A9x5MwcKYXdp2KbjW+5uTVuYD
         4tFQ5DNllO3bKZH/VKy0/+hVTeF3dp+kY+7EeXXPC+yoLG87smPpcNz/IHmKsab1WIPg
         IT++NxkZw4YgyfHIlNeXZ7rOhuscKvq0Sf5Cva/Pbsc2hZLMJSjhgKdCGovY/v7udV9J
         u8aI+114goi0wLCgh2l7uGt19bP/p2pbqk8+QV1KeXUIQq2TvpPicpfFWay7BlC+fNDU
         drLw==
X-Forwarded-Encrypted: i=1; AHgh+RoKleT50qQI/VhnNMA3ZdtK2VsgZCw1yjXk6YAnKOtinnZq16rigYYLdSOUph1sK7yJPr8Z+kM/2E45bGWuiY5r@lists.infradead.org
X-Gm-Message-State: AOJu0YyZceMDpkyn8nDzwNLOiXqMRzmrMJ0jqqx5sRfQcERrZEnqIaaS
	UlZz/PmU6GgwPeD71b9ODNMllENX3G/zGR7m250ZxsFR0AIdABBiL7DW
X-Gm-Gg: AR+sD11kBPKexXGMo+zkBoWQss758S8U+0koEoivzYygmVTOAOW7QxAmu0Ck+fODnSK
	xPJfHtOo3vXlxTx+xZj48m65S+Fbn7eIuE1mjNwdKzytKL/UU3O/3bxys4J5H7cbA6I/vUnklID
	M91iS1T51d8w9RoGjTmWHtNSEZOypX2Yf5vG4KdWJX5QtCT+Cnle7nX7vLT/D+ZjYjvMKoZwhts
	qE9UmZ+WRBgt7+IjcDfWB20UuRagU9CkeoHifRScoi2N+vNPi8yparFqUe/fkRiZ5oxrBlOEK8f
	orgzHjg8LkbvcthGE/e5rYwK0Xn13ap+zGYP+i25AAFMtW/CpH0Wmd8GmXjgEAuoaCxi8LsXLRF
	uexYrwTBwjysIDPUhYVqGU79eGffHY7DfOHBOubikVY3vZM4DwWxj5LZHMjmKzKjb/YA4p/sbX6
	1iGH/7sSsliXGWYcadHvKlLwjttKzF+aaMWKTxEqSa5F6iNA==
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr3577209f8f.11.1785251801287;
        Tue, 28 Jul 2026 08:16:41 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:40 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:33 +0200
Message-ID: <20260728151636.236393-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081644_011288_28F35159 
X-CRM114-Status: GOOD (  14.45  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

---
Changes in v3:
- Polished meson-g12b-zora-p1.dts
  - Use proper comment with /* and */
  - Use the new bindings with function and color properties instead of
    label in leds node
  - Include dt-bindings/leds/common.h

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


