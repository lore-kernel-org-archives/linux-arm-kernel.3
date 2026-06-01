Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C13CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuTeNvgytd5DXSE+aALIJm7Hb07s4LTBSmvksBZA7tU=; b=yDjsRZDNDYT6EpiRaEg1t8xOtB
	YTNgrvzXRCOcEZ1UfrlSbt8Bml6jcMYnO6SiSS8C/HtMX1NDhTMOqyhtJsf1eYj+kYZ8F4dfAorQi
	lL47WKpEegxkxaF/N9fUCiN+0uLOBFVz+o47iMm/PZD7NVnwKsBuWU3d+1KYpXDPJl9sTAAZLyI5p
	Afnn0kcBsHN38khHv2O/fKd43yQrjntJiRdXQJlk8lzytfvzTtVTd1fCmE6MZbnFXyIeIHnxdqBJI
	jHM/SEBecxDXN5ItC4PqE9NJxtzqFAZoMF8elUTKUCWHBuKPnS1OI8NMDoz0PdlwEekwbEsM9JQr2
	Y269nFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fL-0000000BHXa-0S9E;
	Mon, 01 Jun 2026 14:30:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fI-0000000BHWs-0tSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:30:53 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8423f626a65so514187b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324251; x=1780929051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuTeNvgytd5DXSE+aALIJm7Hb07s4LTBSmvksBZA7tU=;
        b=dfxbOI6col/LRfbcCBVzAaR8iDjhbyHYN2HitzlvuP0DxcalAk4T07EsCFV/g4288y
         01zsOdvxRN3D6t4SV3OOjhrJ6GbY1lgT75kYp3wxk+1e+Z5CtloC/+18ryCtaM9Ead0c
         NCOKxe6+YQq2ZjJR5/pGbm7+Xf2+tZVnPHPeL9c0uQiAW5Lius2ZItQvsagtXi4wW9TO
         Qyyyp/dyRdqJf6vz9Kv/ZMPzNomgfoYhZ+qy6A6ff3CCV3XDEr2SP0kY65gDzEdofm4A
         S+aM1ln5q8KugNwP6NDJEbgRFMSCcrDPnY4HEFemvw6cRt+iPd0j82yN52k2s/KpvdQp
         N2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324251; x=1780929051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuTeNvgytd5DXSE+aALIJm7Hb07s4LTBSmvksBZA7tU=;
        b=CEfBBub7qfQEEkvD3ieG7Bhmgqaf6bP+t/4BH16sxgK8smzB+c9oA2wQqYyZ4Tmkff
         qKERo8hq+YE4fbbkl9NRQMe15lUr9tXnuiLXEWzs2bLDZsDcvVyni1XZ6leJsOoZwIO7
         uFKmE/Wot1RB+fmmqTILYB+3KbURlKfdtcHvSWm+v/VQr45YnBLeS6bluP9kuzWAsnoe
         9DRFI1u768rm2WuL2MaSUmhCgBt3Axy46lATPLNSBjPlOorA6T7xduaUhQfHmGcrivrR
         fHMQdZYTNicfsyberBBeN5FRejJAD0SJ/QD1ysCSS9iVqELjzJIU5raCh/SWur3HtiEL
         yY7w==
X-Forwarded-Encrypted: i=1; AFNElJ/emoSk43IG/ntJ67OYqvntesVIX2Ba6VGxZ02/eHzCL9hfio8VXLUA8bMv/GfOh52Y5mimlbngdQTOIv4QH+3K@lists.infradead.org
X-Gm-Message-State: AOJu0YyRcNZGsj2LchkrmNQe5NTqkfO9gcqVNSRBVHZ+VW4Z4RGF9bW5
	1Amfvdl+I5o2g3a4g7nfEQZHfzZHLwre9oYL7motouxDqrrBxV3i0PbD
X-Gm-Gg: Acq92OEcuT/oMS0ziuaU7gkN9vv0v7R2M4v4eO+oUl6NKsz0xr3Z/LEUQL+jteXH+gf
	sLotSvwHAfZmulN6Lu5gMUDWrDU2XmxtKk2Gc4JTSldwuE4KhK+4u7h3X9+JW+xw/NRXEUpffGm
	XGNjv02SisyN6R8pTp1izfFuYOXNw9nOWF8Rny81xAs2ngcJLIwt6t7ueuCR0Qwqe24tlnoM7oW
	h7y0E+9AU/Nex8F8HGO/3F+MU+D34adYU6qYP8TGwCUlKOwRYAnenHl7NTSNrjekgnn647lfnVd
	5ASIoEswDNA80GNYvrdPJhHEonJ4fnT069G/x3yzXkDWx94HdjX3Ad8i4TFzbHNQb9Fc++Flr9P
	zn5zHIaJ1fzw7iqvN9jwew1F1ok7R0vaSHy5Qt5FH/dRTupEw84/kqvoLSWRI691Km3DWH4kJux
	2hK8C95cIHt+z3eK+3OgawHXJPE9GW+JUbSKPEpco/
X-Received: by 2002:a05:6a00:3d0c:b0:842:51af:b3af with SMTP id d2e1a72fcca58-84251afbb8fmr4269863b3a.3.1780324251185;
        Mon, 01 Jun 2026 07:30:51 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:50 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 20:00:19 +0530
Message-ID: <20260601143022.153941-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_073052_244610_765A8F72 
X-CRM114-Status: GOOD (  12.14  )
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

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - SDIO Wi-Fi
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

Changes since v2:
- Split the dt-bindings patch into two separate patches: one for the vendor prefix and one for the board binding as requested by Heiko.
- Removed invalid `enable-gpios` property from HDMI nodes (ignored by dw-hdmi-qp binding)
- Fixed copy-paste error in `rk806_dvs1_null` pinctrl node (gpio_pwrctrl2 -> gpio_pwrctrl1)

Changes since v1:
- Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
- Added binding patches for the board (rockchip.yaml) and vendor (vendor-prefixes.yaml)
- Renamed regulator nodes to the standard `regulator-name` pattern
- Removed `mem-supply` properties and phandles from cpu nodes (vendor-kernel specific)
- Fixed pcie20_avdd0v85 vin-supply mismatch
- Removed obsolete `regulator-compatible` property
- Removed invalid `regulator-init-microvolt` property
- Removed dangling `enable-active-high` properties from fixed regulators
- Cleaned up unneeded i2c3 / es8388 nodes
- Added missing `vpcie3v3-supply` properties to PCIe nodes

Hrushiraj Gandhi (3):
  dt-bindings: vendor-prefixes: add vicharak
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 1036 +++++++++++++++++
 4 files changed, 1044 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3


