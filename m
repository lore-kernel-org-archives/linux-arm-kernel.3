Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FFAC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDy347pg8N8wfmjLyPvqtc0CoZcNifHTOarGEkQ87vY=; b=k56Et+KNxmpRrEN6JgcQLlLZ1g
	dGm9N9Cc3wNafmRvfBwAv6AnOiJLUKEPObY/hvkJ7oRKdRrUTBuCO4yp364LrmOsLjbUtgdu9Ke8v
	88OVzif7+luv0XpxtW3BPIHlD2RZ9H2uGB5LK5+nzzSysKvLjfcgcDXoX+CVhSMRE0OjGg387qELd
	Z+A9IyKP7abSKqf4U4lcbot0hdJQ7Od8uG0P+twUhmEcMrXZs9WSJhwnqmTh6q4gqNqU4g0lcOC8L
	MqTBL/e7rJceo6CDVjdzDuzH8Yn2JC1WuFZCq2f6IMvE4yTEUoqHKGy3g6g3IxibfzyjxUoKAH3t7
	8ulP2GnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAR-00000006NBt-2gFA;
	Tue, 08 Jul 2025 19:39:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCRc-000000069sy-2Lwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82CD043405;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F70C4CEED;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996967;
	bh=vyzr1Cp3VW/MJrLr8Vd9Cd8+qdk5yXeJaAIf72BHAvA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f/1V9YvyC2EW+L6Mxc4M0MhXUJTqttVoenXw/ArXE3Kvo9+N7vEslLPkiq7XFTDBx
	 UWbULbPDC2z3qG0H3fLf7RrA5c1XU8s5JXA9X5AVAGyC3WI2mdktw0C7+PXLxoT2wr
	 6EyynAep1E0W0j3v7n/R9jdW02zVjfqYDsN1r7YrUMhjCSF8/V+rc9qxjVo+P9Unk0
	 8QmiB80uE5culX+3OKtXs5WcEApJVrLKeXfexl6UlR/HWD7WHoXckfaiwCwmwsGBEt
	 Ls9mkN9SHyCzwHaRwKPt8pS1YTIKkFkTd2iQFWSVR5oU8bOAAqPW8p2pZlK42CIo3m
	 8kayPyDrYoLcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D19FC8303C;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH v3 0/4] media: imx8qxp: add parallel camera support
Date: Tue, 08 Jul 2025 13:48:41 -0400
Message-Id: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpZbWgC/13MSw7CIBSF4a00jMUA11bqyH0YYyrc2jtoi2AIp
 unepY2Jj+E5yf9NLKAnDOxQTMxjpEDjkAdsCma6ZrghJ5s3U0KVolIVpz7pe3IXZ5qeW11KBRp
 2YIDlxHlsKa3c6Zx3R+Ex+ueqR7m8bwjELxQlFxyNsaBtXSshj0NyWzP2bGGi+qR7AX+pyqnU+
 oq6bEXVfqXzPL8A8gzFXuEAAAA=
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751996966; l=2236;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vyzr1Cp3VW/MJrLr8Vd9Cd8+qdk5yXeJaAIf72BHAvA=;
 b=pLkoCOPxcG5H2BqKndFzFcZrU81lbL29lhmoCGOa3QjiD2Tf8/6ldvTR9I4iEwUT7ta5zz1ZQ
 ecsvl/wP0NWAkHAFqjn2k/TZRc4T3nFIINrcvgp3Okk/Elz+pyPwJk0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_104928_655266_611B4D0F 
X-CRM114-Status: GOOD (  11.61  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add parallel camera support for i.MX8 chips.

The below patch to add new format support to test ov5640 sensor
   media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes

The bindings and driver for parallel CSI
   dt-bindings: media: add i.MX parallel csi support
   media: nxp: add V4L2 subdev driver for parallel CSI

DTS part need depend on previous MIPI CSI patches.
  https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/

  arm64: dts: imx8: add parellel csi nodes
  arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (2):
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  82 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 920 +++++++++++++++++++++
 9 files changed, 1185 insertions(+)
---
base-commit: 93355cfe8aec9e47fc93fbc940f1bbeedd62e249
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--
Frank Li <Frank.Li@nxp.com>



