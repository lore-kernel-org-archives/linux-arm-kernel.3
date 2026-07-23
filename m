Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B67C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JJLBjhTwK9Uo53TmNSc/cJ9oL3cSqYdaSEVBlK9j7mw=; b=y27NaGgq23ETHuD9hnzkcr/E/Q
	E/fF18keITtrikX8DpBFnbYymqI5GrSBa680e5xgmx51cO0a95D9kJpo2dN1NV0Eo514bOgDOPT1J
	bPgynbGw7kGG7FxUshxvrDj6igupbINQGlKwad+uw1Ln/lKGh9AHGDts1Kf37Q0mFYAz+34xFUDuX
	NQhe4w7p7W487f1RtIGLVv1Ni38SUYbY3xeFlSeHB6VAkMZ3XRUHyBIMB0GMbEoPYKeWnfOxYSiUU
	mqny4UVNrsZ2kjP2T7MUffI1YUIzipfXKZPjW5+XP+AIJuILEBs5bhVkGmnN9e9PTCU309U4jLMsu
	eNnPLlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpsv-0000000Du2p-2QoJ;
	Thu, 23 Jul 2026 09:38:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpsu-0000000Du0i-0CCV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Jul 2026 09:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JJLBjhTwK9Uo53TmNSc/cJ9oL3cSqYdaSEVBlK9j7mw=; b=jZAhCXIV3qjAHESZbb+jS1xCh0
	Hg93ZfR6RI8nF3QOW+WE7FIq8FhphBDxrc4P+6lkb+lcWGxOyyzcO7rzO5R6fE/vsMTNrdK8MEjsX
	a6isKDqTdprFKKanA0qxOUd3a7S2P5kMKnpUYy4EgPCPAaXD0pA+eVtGe0800U0KKSrk0z/S07faS
	es3kIha/e9QvsLWYzGZQLMMLdOf6deiiRb0aJWjz+T60WeqdLLI1no4cRMZdd0H1aBmc9Jsz/kpVl
	AyKHRD28rjm1HPtgXE1pA67D+zs8xPOJWu6QmlnswXRHg2oKASxC5BteZSzRAuDk6AfMz+Yf4ZL21
	yVEov/CQ==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmpsq-00000001c34-14G7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:38:30 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 583621FB1B;
	Thu, 23 Jul 2026 11:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799502;
	bh=JJLBjhTwK9Uo53TmNSc/cJ9oL3cSqYdaSEVBlK9j7mw=; h=From:To:Subject;
	b=KmZioJc9sYaepD7gYtFjjcIDXj72DQt0fCOxDqITgrd6g54GW5QKCMnSvFzi84PDi
	 1R47KYfSgyI46cU3MvkLhIR+b3Inj9CYnkCPaJ9ep6d1YnoHHkILF8kYy0s435I2gT
	 ClzG4DWgzGY6gY1GAgcw6JSG0aWWZ0zi/fOjCnxbo5+9NmoPFQeRSZsTXHSMLv8kCI
	 +2B80fYvR2pfu+CnFN0/VaFjEPhynDnK7HLoE7HaGBsiRn96wpafF/OU/4zHZiq4Re
	 21TFqmkVaHDyDwqTBdz4v0+esdjq7GsbMVxk5UVLxQxO/D1qZCRkMcOE1Ce4LID/1V
	 u5yPp/5ZHaRug==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] drm: mxsfb: Support LCDIF interface bus width
Date: Thu, 23 Jul 2026 11:38:07 +0200
Message-ID: <20260723093813.180089-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_103828_491367_E4E46582 
X-CRM114-Status: UNSURE (   9.80  )
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

v2: use the common bus-width property instead of the legacy interface-pix-fmt
v1: https://lore.kernel.org/all/20260717121847.488148-1-francesco@dolcini.it/

Francesco Dolcini (4):
  dt-bindings: lcdif: Add endpoint bus-width property
  drm: mxsfb: Add optional DPI output bus-width configuration
  ARM: dts: imx6ull-colibri: Set LCDIF bus-width
  ARM: dts: imx7-colibri: Set LCDIF bus-width

 .../bindings/display/fsl,lcdif.yaml           |  9 +++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 24 +++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 12 ++++++++++
 6 files changed, 49 insertions(+)

-- 
2.47.3


