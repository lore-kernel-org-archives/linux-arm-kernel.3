Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD37C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZE0ukJ6bQ6a7O3hQA/ihz1VgijeMNRxCp7w3+5a93pY=; b=BmUmFKeIbpEImX2AUgiPqqOiZl
	EZchFoe2UFeVTCyZrrqfQjODPuZ+Ecs3PpzF37j53pXwRDyIYG4iQ7L6rdjHaMKIRiiQFHg7eYrST
	fCEJPsREFydYJlNBqkDjes+8Prumg23te+DVhkBSuluwOCoK+Eitd2zfRbjt3n1fKVP0yvBVhmU4e
	t+TpGN+uwTHE3Nz5ysjcYCQHvVCK4Txx3qxqxPmEcXIhTL1pr4vJ8EC23ICcRZ56kMyajEc+arKqr
	m34eo4fP4sPkjEL/TBZFOKLQQSqElrq6/VIIDFYFpY3XWtIRF6C5x3ceHieL4uy7GjKfwS2AcjTfq
	N1lRTSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cfe-0000000BUDg-22Ec;
	Thu, 17 Sep 2026 14:01:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CfW-0000000BU9F-0Xli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:00:57 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id A98911FA20;
	Thu, 17 Sep 2026 16:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653650;
	bh=ZE0ukJ6bQ6a7O3hQA/ihz1VgijeMNRxCp7w3+5a93pY=; h=From:To:Subject;
	b=hg6ytkSatcyVRBIFf0+qOmXksXOYEzMUNicqkdTjkleFTzRvaIK69+/rGFafO0Lt/
	 oI+p9mDSESRLq6s/kmc+PhTcrcwTEKNpWOjN/SoAeix7BeVa8VpJL8aNw+dklShVlQ
	 IKxwnS+LAZapdfKGJU6KMpbrrocwieEBYeUD7plD/pE9teLSJheRoGj0tiOO3QQJ0F
	 /owdFFNnY3NKSKelHRF4ngLQSE5Qe4lZz+C1iq2+2wF6SRzCXopGn1X7Sj0WUVb8Ud
	 oVULFMTdJlLZY3qp5U2O9YOgH11JEVMdOzUO4sMXpkgPOtw9rdFIQeKb5lgJbaqlWV
	 kELwHilgQmfyg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Subject: [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface bus width
Date: Thu, 17 Sep 2026 16:00:35 +0200
Message-ID: <20260917140042.118181-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070054_956886_753DB3A1 
X-CRM114-Status: GOOD (  10.71  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The width of the physical LCDIF output bus can differ from the input bus
format advertised by the downstream panel or bridge.

Such a distinction is required when the LCDIF bus width does not match the
width of the downstream display interface. For example, an 18-bit or
16-bit LCDIF bus can drive a 24-bit display by wiring the available color
bits to the appropriate display inputs. Configuring LCDIF solely from the
display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
mode, changing the color-bit assignment on the LCD_DATA pins and resulting
in incorrect colors.

Use the common OF graph endpoint bus-width property to describe the width
of the physical LCDIF output bus. Make the mxsfb driver derive the
corresponding media bus format from this property and use it in preference
to the format reported by the downstream display. When the property is
absent, the existing behavior is preserved.

Set the endpoint bus width for the Colibri iMX6ULL and Colibri iMX7 boards,
which route an 18-bit LCD interface.

v5:
 - add a-b / r-b tags
 - fail probe if bus-width has an invalid value
v4: https://lore.kernel.org/all/20260813092836.38367-1-francesco@dolcini.it/
 - use /schemas/graph.yaml#/$defs/port-base
 - add r-b and t-b tags
v3: https://lore.kernel.org/all/20260812132954.148571-1-francesco@dolcini.it/
 - use video-interfaces.yaml
v2: https://lore.kernel.org/all/20260723093813.180089-1-francesco@dolcini.it/
 - use the common bus-width property instead of the legacy interface-pix-fmt
v1: https://lore.kernel.org/all/20260717121847.488148-1-francesco@dolcini.it/

Francesco Dolcini (4):
  dt-bindings: lcdif: Add endpoint bus-width property
  drm: mxsfb: Add optional DPI output bus-width configuration
  ARM: dts: imx6ull-colibri: Set LCDIF bus width
  ARM: dts: imx7-colibri: Set LCDIF bus width

 .../bindings/display/fsl,lcdif.yaml           | 12 +++++-
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 43 +++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  2 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 12 ++++++
 6 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.47.3


