Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127B6CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OH7BCjjdxq2DLB6fo/wyUar0j55aA2dc57uz4YwkDi4=; b=O6V+7HxF72QgGHWv3m6yoWmaJe
	Ekh9rK8bucqlTBhA/49fSzDOFv8SVz40d37nzJq74W67iuy6U+hQppTvuRfhLwt78U5txdZTy28Gf
	8SbHMQ3HuDB4hURQDgnbTdf/xhykNGqU69X9nCGn+BTuqr0udJ8q8Df9TpNJ21Rzt/mc94zW2naPT
	pMXjOigmPIjpTG+ZlPf5hEzDIPaVdKsuRxdYpgzWp7rlIfzSd5+UDtGz3NdjfZHR7bM7SddNZbsfi
	Uop/X3NvJ9JITAemN1bENCB4ga8I9jpvVdNOWe8FZJw+s+W3jkWKb2jqYlXt+ePEaLfOfAWJAj+ff
	9XeYItTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tV-00000008DLg-2NR4;
	Thu, 21 May 2026 15:01:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tS-00000008DIx-0Vck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so67658225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375660; x=1779980460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OH7BCjjdxq2DLB6fo/wyUar0j55aA2dc57uz4YwkDi4=;
        b=jTc4SIYMefJTe9rCdWEO0uigFiL8dm+LDOCQLh3H+z7MfOZ3vode8AIHriji2vZqkE
         inROUuRsgAt90HrzHZvXu5zCKTaQVeK36WO3OrBO81jsB/ItdWe8KqBbN0ZnFlefWnGQ
         9I7zaSbJbTYOVbgcPhCHOuX4dcKYLhucipFC3vKxfS4evVM6H6Yfwn7GOf/Hq7ToSdDR
         DpXB7e6dTnIgOmnrRoKVUBgUdfJHaWFQuRLnQbmn3Ubl14/h2YmrxrNT8WRE5+x0T3ae
         OtSBy0a9YR0SqHylQC45tOo/5dULyXAm8b11r1gZL0GyO8kAAEU/A3Ix3186XUdV+Yy0
         K8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375660; x=1779980460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH7BCjjdxq2DLB6fo/wyUar0j55aA2dc57uz4YwkDi4=;
        b=mX7XH5YArLTQylFVlOA8aucCZ4OVsFLjksZGTEgdvdyiIOq8N/AuAXR0pdoZgbHtJe
         4gDcWkClzvjx76Z+U+0jDxweN2PFrOtAreWUenCJQTHokW4XpYynVjQ/poqzf33C/eS/
         /Hon7OD2jjvKwX8zWiG1eXYMLFZAfH5OoKtm7gVR7/wnwKUXFkqu7aIXV7vGMjDkUlds
         4c4z8AdUex2rveEghAGJX/9WIjfslEFG7VpCraemPIP4GelkkhVciVV2MchEf67ibUZg
         KSjRbecfHkPYEHXszg+gkkZA9Uxf5k7wKkheBy/8oQ/Ij7Govjk7MyFUq5mJbjHo9GWu
         oVig==
X-Forwarded-Encrypted: i=1; AFNElJ8ErOpnn/a18gciWaNN/yVHaS2o+Vwz4ovb6n1Hyfi7p4nmai00ovgnG8ny8vEyD6pTFOLBaLQxusDTzNp4wytG@lists.infradead.org
X-Gm-Message-State: AOJu0YwnZhq9zGw45hWhw+RGdINMW4S2MPJhbQJRST+AbpbISaBNENlq
	+8KtS7OogNCcwFP8m/l4S6CBVdACxhxNrIfyB3fTX4biLi/RsCsqyLv6
X-Gm-Gg: Acq92OEvIBDk34BJz+YuAiL7J8odg9/zxLMwagBlc56ETsCU1drUVxAFqy5f1zbXCp/
	7ekjZuqUKcIOQAFeYhH+Wlv1kFgH3YgwcAMm4V5BR9/4UTqCq3AzYTGzqN3ONj2Jv2DoqlGF0Ab
	uFOC6B02XBWvEqLB1ooVuJ5CWZalXvrZIc5a99SqprGEbdJTlxpFDdYe9gQFdZs2mLj4BcGLJS6
	MBRgYRFvN06RUFrzFtmWOYx73aC0H2QBW6PVqMpslYpOAeiDDF7fPDmPq6y6qp/P8qvob0OFJLJ
	Y1XQ92AYysa2RC4TAhBFrSULcyPe5zCvPUE5xmGZQwJkPqCR7mPCBkvseRicLlJcGz547hEu+p4
	ZyftAEqGfn0kKcfDUrPa3lGO0nQZQNu4ctZO8aG8sYCb55gxtp/RSdsjomKdTW6ei5l7nMEmwdX
	2MxPUe1+UdBwIjy0FohwktdBNXDlaDRiV26O+Swnn9Hw==
X-Received: by 2002:a05:600c:32af:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-4903605e3damr32117115e9.10.1779375659006;
        Thu, 21 May 2026 08:00:59 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:00:58 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 00/15] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Thu, 21 May 2026 16:00:36 +0100
Message-ID: <20260521150038.103538-17-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080102_197266_0B6D3A21 
X-CRM114-Status: GOOD (  14.06  )
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
- native OLDI (LVDS) with Toradex Capacitive Touch Display 10.1" LVDS and
  LG LP156WF1 15.6" FHD dual-channel panels
- DSI-to-LVDS adapter based on the SN65DSI84 with Toradex Capacitive Touch
  Display 10.1" LVDS
- DSI driving Toradex Capacitive Touch Display 7" and 10.1" DSI.

The Riverdi vendor prefix and panel bindings required by the DSI overlay
patches are also added, along with an extension to the panel-lvds binding
to support lvds-dual-ports for dual-channel LVDS.

Non-display additions include OV5640 CSI camera support in 24 MHz and
27 MHz oscillator variants, NAU8822 Bridge Tied Load mode on the
Development Board, MCU_MCAN1 on the Mezzanine board low-speed header,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix, panel-lvds
bindings, and dual-channel LVDS support are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

Vitor Soares (15):
  dt-bindings: display: panel: Move Logic Technologies LT170410-2WHC to
    LVDS
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
  dt-bindings: display: panel-lvds: Add dual-channel LVDS support
  dt-bindings: display: panel-lvds: Add LG LP156WF1
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
    panel

 .../bindings/display/panel/panel-lvds.yaml    |  21 ++-
 .../bindings/display/panel/panel-simple.yaml  |   2 -
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  54 +++++++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso |  28 ++++
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 129 +++++++++++++++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 109 ++++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 135 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 +++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 +++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 131 +++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 +++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 16 files changed, 1005 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
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


