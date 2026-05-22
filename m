Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85850CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1qLGD+d59NtgQVVpwJfCXZu6HhFLlAFnjmTwdInD0HI=; b=AR1SIgv0XQxX1+WoTO9asuXM9J
	EkFUHoN2DeyjDPoGEjfNcnZtRsSn5+sS05ii0ZzhmHSawvQ7eGHWPLTtAJ8CJDwgYQd4DIjMZ10Ls
	eqfs59MpiwgjthypIQJKhbyDN50y9F+/e7SPgdEXVrCvBXrWrHBp5c9MuhiTkwRyBuwYDRC7zfEV/
	BpP/wBmHu2VpRXEvWhZwQeG7UQgi+7+m+Xk9DfhQhE9EBAke+1kIeU4pXNnRVimI/+Yw3I+5q6Esd
	GojmbngETBiS3lUqYpISyO7pdG3M3W1/34Pe09qhK8JvxyF145Lj35pywtMOGFjpR99B+FH5IB/8y
	KISHrUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnv-0000000AwIp-2QmT;
	Fri, 22 May 2026 13:20:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnp-0000000AwGG-2oQi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4903974854dso16842775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456036; x=1780060836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qLGD+d59NtgQVVpwJfCXZu6HhFLlAFnjmTwdInD0HI=;
        b=WzKigdUaie5TFGDQA5iUYSXC055lalqkavogHVJaYmGWAVS9VENDt9S2YS5LcDibG4
         EK7QOzJ+qKh4cjtVJgDBuvZz2w/Jp5Pdp1iB3RKqNng6XU12R/tDbK4iXEsjOdGLu+qv
         nbSpNhTwXRBzpmpP0ud33SwYu9pKDTudDcMrGolxURZ2RhiLORz2vflzfH0yzZxqHz5J
         EbQyXywoCda3m0SVrgK+vO0zgP6GXts15HTEBotKqLJNDnfl9e0PatQjarTuwJv4bRKm
         gv5ueyhfGgeEiC1HlR61miouKDk/5bgVGdL0kkzZjdHm3vSsx2fXQ5+6/VJ9cCP0Ql+b
         mg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456036; x=1780060836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qLGD+d59NtgQVVpwJfCXZu6HhFLlAFnjmTwdInD0HI=;
        b=jETkV6hSxJuk/SMG91J9Qb9aEqRMsOnxUFIJN+qHCIVcx38hxjDNgwpDNbRyvd2UCR
         CyX6tcYVh5mDZay6Ibl2xPziRMCxwRid6NdfNxi48vTBV3tUhCI7IapC7/KavY/pFeqm
         UqEUY7P44JLkp8EiFY6KOPssFaTHTHi3a51R2gPKujkuPTjWTzJdDd1NNrzZCHVI2xvi
         hXGv10JgCzKG48NTsadLrV2Ydasx19vVnZVBV1ywF/oBC2O5LmaYDC4cLaSqnIRDsjEU
         oOlkvJuBehyTQg4GvQmOhY2bxaMTU74etd4RjXsb1pBkwozL+UWp2MmrQrtBmHC75jnQ
         ReGA==
X-Forwarded-Encrypted: i=1; AFNElJ8KzAWwIJOWUYVrerSMc7+i4Mix8qS+bgwB3G26S3aiZ9tdh8i2L+5enEXql3YujjekptclpbKSOGc1PXqex306@lists.infradead.org
X-Gm-Message-State: AOJu0YxYHbix4goOS2j9MQZOTIzeujBKU1mn2NXJVWvMkaws49NgpSOA
	aurRnxR9d41jaJy+3T9NfUvir/9xBn8UGbiX4pESn03hXKa9rKJKz7IZ
X-Gm-Gg: Acq92OGFnh4EE1rTu49eTKRo6mOF7oOOr0WJDwaeSiAg1dKCCx6UiyM93T8zGVZfOrh
	MT2WVaJJlvjxwqlmRQXt0H69VO2Eyz7e7LVxbpOpcZn3jGIvfnCgO4ZLANA+NwZjvUOh6bi1iTV
	DuuFOlQdEfugvXp9NmmGBQVyFatc/yMXS04bF95r3wp9GwWlLCjrYDIw1GKqvGUDTLBDnuHq1rK
	st1oAOE7xJ/6HQi7dFHDUzjuH/ScYe4f0rqjFQSvkNAau1UjtwKb2v9PSTpDtQ324mXi/44YKAi
	h+a+Dfl9G59mgtHElFMgEV1kqkgmFD7fUS/wjX/GyelrYQ4m9b4YK9zLFPuM9YYi119t63w3UcQ
	sgyCmAlAer6joeFd82N/aZ2w46ekKmQ3eVXsMatFrCCoPI2QLiHUPHUwjbxQLHe9GyK4ofo/lJb
	M7uqfmJLPlALuYo9KHy3KJ4V0RFAjBAGDJ4SHb20xeZ0NK4tL/Tm20
X-Received: by 2002:a05:600d:8494:20b0:48f:d1b8:9aaa with SMTP id 5b1f17b1804b1-490424a1628mr37558685e9.6.1779456035429;
        Fri, 22 May 2026 06:20:35 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:34 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/11] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Fri, 22 May 2026 14:20:13 +0100
Message-ID: <20260522132014.226721-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062037_742547_CCB9961B 
X-CRM114-Status: GOOD (  12.96  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays, expanding the hardware support for
the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
and peripherals available through Toradex carrier boards and the accessory
ecosystem.

Display additions cover three interface types:
- native OLDI (LVDS) with Toradex Capacitive Touch Display 10.1" LVDS
- DSI-to-LVDS adapter based on the SN65DSI84 with Toradex Capacitive Touch
  Display 10.1" LVDS
- DSI driving Toradex Capacitive Touch Display 7" and 10.1" DSI.

The Riverdi vendor prefix and panel bindings required by the DSI overlay
patches are also added.

Non-display additions include OV5640 CSI camera support in 24 MHz and
27 MHz oscillator variants, NAU8822 Bridge Tied Load mode on the
Development Board, MCU_MCAN1 on the Verdin AM62 Mezzanine board,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix and panel-lvds
bindings are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

Thanks,
Vitor Soares
---
Changes in v2:
- Add Acked-by tags
- Drop introduction of the LG LP156WF1 15.6" FHD dual-channel LVDS panel
- Drop migration of "logictechno,lt170410-2whc" to panel-lvds.yaml
- Link v1: https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com/
---

Vitor Soares (11):
  arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with
    10.1" display
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" LVDS
  dt-bindings: vendor-prefixes: Add Riverdi
  dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and
    RVT101HVLNWC00
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
  arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
  arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display
    10.1" LVDS

 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  49 +++++++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso |  28 ++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  97 +++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 123 ++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 ++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 119 ++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 14 files changed, 819 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

-- 
2.54.0


