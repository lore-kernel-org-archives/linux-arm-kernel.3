Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F2ACD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QPGVYKqn3FQ80LKzOq7xEivdqWu7ECBxaeXMtXQgpig=; b=a3bLlU25cDvJMSSy4/Vk9BWd44
	PY62em4zzKg19R9GXL5Gjl9WOHQaZypzXcieRT2B4oDB9xPcTeIGGKOUKluYNcQH/Gh9puiofnAJb
	c49E3iQMOSst1ZRLfvlQHATg+EOydvIxLG9uPLxPVYUaHlH5M5a5HLvfGC67M4AaKN4LTBoJOdKnC
	I0ZMlMF8Un8jGH9B/pBRS5m8G3mPUqlTMBIIKRp7WGLhpXAFZ6wHbm4aNS/TvAQpHi5LU/wNjQPl+
	4QkcXqizGArN/IB1QpAPM7AO8jBr4DsZnSCOoN6l6nSuZlupBvE4kxgIQQnB6FndsYX2ya898PQiY
	FieAPGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTQ-0000000BNi2-1Fp8;
	Fri, 22 May 2026 16:11:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTO-0000000BNhH-0dTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so2027125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466300; x=1780071100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPGVYKqn3FQ80LKzOq7xEivdqWu7ECBxaeXMtXQgpig=;
        b=pxSAiPs2eQayWo/OiMqNgreg4WIdt5ziglGy/C3PkpY7JUczTJI3DgLZqLdpI9u12D
         Gka9A4OFSUcnBZvu1go6GjgdDqZeAS7ryVktK/WEWY/lxBFlEtaLYp73A6iSdWW6Z7Tf
         uUFSKUHCZOF0NwIWiGxKl+yqQJog21bNc/Vt+RWu+OeKUVzG8G+W20pMLum2mN6QSBqA
         eyNqM2vq1X4he0FAb0wYMHlSa/qsW1sLrcNDqTEHXhoYxktNV9UVc6AjqLdCpO7PuPnv
         vru9LPcWWKkU8tJubz6bDb48WZh4G10uQu9cgIej9yNDU7YFWA0V8giL7vf5q+LQkw+k
         vPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466300; x=1780071100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPGVYKqn3FQ80LKzOq7xEivdqWu7ECBxaeXMtXQgpig=;
        b=CPnhTTg9YRUkvUZPSTkIZYYAU3rWBFDqQKJ+xv24MYHYr5PvJ3/q96vh8Bh3TARDfy
         +akCBjUlqV4Ru/gRwyysuiCsr6A+aQAlwd/o6s3iRqYqs8k+y36GeRM6U6pWAj4YZ1c7
         wfqH6ovbayizAFbHbUSXZaajVC+0s/6f4kkDEWF7463LgaII2HfvR2GwEli+ymGKFtVz
         FbRhZ4eONSQnH2nBn+tBQmiwlDHSP9j0PMoUXjQjUCczh4qUX43w8WDV7+VD8Q+D0OMO
         IsxEfRk8jq8QLwqnxmC4vy2FYY5SLzOlqvANJiG6kpItBwPgwvz0ITF2C80h5KQNIy0V
         tniw==
X-Forwarded-Encrypted: i=1; AFNElJ/w+qGj9Hwv4VI2P0XaIqKBXYDmG1aIyYWgDZJIHl9Bxg3iF4uRLn9ZIHZwhwUrxnmUbUSaZwP/4DdZem77kjHd@lists.infradead.org
X-Gm-Message-State: AOJu0YxZAxf/7SqDMS+9z3B44YXQv0XYDBN2SPlNxK/yVY8XtltLydC9
	T/lyjRMP3yDMQck8lfYC66LEBT9qi9JxHkfgwIqUAmyqjjU6dHYUacdz
X-Gm-Gg: Acq92OGmnaSMRRfrcljpU8KnCekXpI99LeNtHu6c2alE/M7FQ7CXxjtotDUf3gc4bzU
	ndlFGC2R9S7LdqG6frDW4ClVhAX0inooJhR9HODEIDMgVFWBflm6FzBMgQ15GKvHciMjg0qp9sb
	kLXL9QEhikj8a7yhGrOt/pSIijK5ds5WVjlukkEml2QArnhz4hNXPxl+LB1Ttahkk+LQSS6IV1Z
	GT8bnfNej6/l4f45hErr8tOHFxKTEt7He1YqtSzrlrfCYRRDn+gSfx7aE78k5J+P1HU0q2LfudX
	D/wi/C+Hp1soCQrTqdM/uDWCm0OESD/DNVIa5hHXEqpaxYEZXVsvrugOk54sNuxHzxCy40G3CIC
	PIBrU7p7M4awVh0snl+XfyII+PnOrI6THluXP8T+xQvpzcsB3EsJzCvRNlXWI0Fa++/LuaetSXK
	IDugiIq9H3cLXn2ItDqJxP2UH2V4zYjCTqKURpSiFPXg==
X-Received: by 2002:a05:600c:1c0a:b0:490:402f:324d with SMTP id 5b1f17b1804b1-490428e03admr60430125e9.29.1779466299935;
        Fri, 22 May 2026 09:11:39 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:39 -0700 (PDT)
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
Subject: [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Fri, 22 May 2026 17:11:04 +0100
Message-ID: <20260522161105.277519-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091142_224523_7722CEA2 
X-CRM114-Status: GOOD (  13.05  )
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
Development Board, MCU_MCAN1 on the Mezzanine board low-speed header,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix and panel-lvds
bindings are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

---
Changes in v3:
- Add missing regulator-name property on fixed regulators
- Simplify regulator labels (reg_3v3_lvds_native -> reg_3v3_lvds,
  reg_3v3_lvds_bridge -> reg_3v3_dsi)
- Rename touch@ nodes to touchscreen@
- Link v2: https://lore.kernel.org/all/20260522132014.226721-13-ivitro@gmail.com/

Changes in v2:
- Add Ab tags
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
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  98 +++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 124 ++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 ++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 120 ++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 14 files changed, 822 insertions(+)
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


