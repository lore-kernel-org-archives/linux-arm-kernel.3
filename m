Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62574C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H3V5FgGnfI2OR7h75jMZtGutaED3zqMBGkEDvm039/o=; b=GdiBEcLYmTrNFOkEF1iu4e4Da7
	EVelYKo8ZAWDbH+jjA0Jiymy4n4CbD7mNM6zv81tU6ZXEX9EbUWwRp7Lk1eTwPWB+zwjiHyI4pqZ4
	lpivj2Q4KF92NU3/2Fb04ajySku8uBhSl1dxCdBGTMZDbi0oKZkKu0+6LXHxTrPNclbeKAnLlEywT
	L6s1fMaKYAltegIrFPQmu9rMJ//9iKxlLfLYTkVN921ugJErOtZ2YXmxrXgHoAmo3jOj23FPgb0dW
	jWaOYRqdWwFfKdHW+hLK0aPgTgxQI6O7pryFCc7Bi9j49nEJYoy754oErfknbkJDM6PrcjbysmM2D
	ZwRTLIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyC8-0000000B9bE-1cHU;
	Wed, 18 Jun 2025 19:11:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3z-0000000Ae4i-1SwM;
	Wed, 18 Jun 2025 15:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=H3V5FgGnfI2OR7h75jMZtGutaED3zqMBGkEDvm039/o=; b=osMxuxXVaX81+fdky/xWrRcOH+
	WVJr4kj9H8l3POxmsD1txX5h1Fo8xckIF5IdX/8iz8Es5PgKCePr8GIsBtY4iBQ0HF48Y1ajq/4vc
	a2cXNpDhjQLiMqUk1BPegPKEANRjqoxbPT451sy1dwU6SuSOwEyA4OsYZ59w77gtKrOcIKsIfqmoI
	nrRb2CUy4xexPWQ31PGlKQd67EtDLuJIdDfvyFt55WhkXBHYPruMJqSmxbJr8r09JRs1QC+DvlkZy
	vrysj+l6YpaIHcn6HAyiTCGcxSii0ryycNHiV3dcm8fgqVNd96zbsrUMpmVufoh1AGmmqVb4hwTn6
	t32FSiEQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRv3u-00000004A1C-0IL9;
	Wed, 18 Jun 2025 15:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD3505C3B35;
	Wed, 18 Jun 2025 15:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0468CC4CEE7;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261849;
	bh=y53kvWV7QqEcMZEoH4/QgamjctoJTGOUURowRTdr7NM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rzoL/OwhHNa00yBwFz2KxZJaxP4JVe2bdYPqdqEzxhhx0jITDSb7g9uAJH3bAcKC4
	 d5BMsGypI5u/CzH2FCvF7kJ14U9t+otyb9AktFEpzpjdrTky5rrsZFawawpWQkNnjR
	 939uRMc2aYffeX1O6nePTnDvYLm3gVJYFh8AGqIclrdPd8QDE+CM0FvN7xzCCfFvkp
	 HbeOU+3PARJT9VSwRjv2YE1iuEMWdH0HCk1+k9e0H08/97evAgRbpXodUsfYY8n2iC
	 VPrfG51ErwtuFQZnWS29GE5FrsXCio/R10LszB30kI24iJ+P2LO6Z8EoIlv6EgOAE5
	 cK2Kqkh5pDSHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFA7C71136;
	Wed, 18 Jun 2025 15:50:48 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v9 00/13] media: rockchip: add a driver for the rockchip
 camera interface
Date: Wed, 18 Jun 2025 17:37:55 +0200
Message-Id: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFTdUmgC/33Ry07DMBAF0F+pvMbV+BmbVf8DsfCTWLRx5VQGV
 OXfcVpBCUq7vLbm3JHmjMZQUhjR8+aMSqhpTHloQT9tkOvN8BZw8i0jCpQDpYDLOxNS4ZqcOWK
 rLYtaUxE5R23EmjFgW8zg+nnoEHqfcCVs/juWENPnperlteU+jadcvi7Nlcyvt5IqscKnfExu2
 VcJBkylAkOikRzs7iPv43Xr7RBOaIYr/cUIJd19jDbMEs+Vis6BZ6sY+8EEUJD3MdYwqT2JRAf
 hOKxi/A9G9H2MNyxokBLABGbXMXHD2KPNRMNi6xNUMB6ZW8Xk8gBLQTbB0yiiDYEIQXYu7/fG5
 mK2Lh+uQPcI6BrQCUWi19IwZtYA9QhQDdBeO+u4FZT7/8A0Td9VUbuwywIAAA==
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750261092; l=10841;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=y53kvWV7QqEcMZEoH4/QgamjctoJTGOUURowRTdr7NM=;
 b=8GLCLpYsjHnVwHGH4KDZqFxnHGvf88smYZX3g9RyjpJllYzz4RGy9gFgYEGS5YKvdG46G7jrd
 aUsY45h4qhpBfTorSVKFKG0tOPXfxLvqKN0g9Wo7/RIcXfVoU2B0Qp1
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_165054_560605_1B6D5F5F 
X-CRM114-Status: GOOD (  26.12  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
For example, the PX30 Video Input Processor (VIP) is able to receive
video data via the Digital Video Port (DVP, a parallel data interface)
and transfer it into system memory using a double-buffering mechanism
called ping-pong mode.
The RK3568 Video Capture (VICAP) unit, on the other hand, features a
DVP and a MIPI CSI-2 receiver that can receive video data independently
(both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the
camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
units, and a data path multiplexer (to scaler units, to ISP, ...).

The v9 of the series adds a media controller centric V4L2 device driver
for the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP, including
    - capturing frames from the DVP
    - capturing frames from the MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)
and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver and
the Sony IMX415 image sensor as subdevices attached to the DVP and the
MIPI CSI-2 receiver, respectively.
The IT6801 driver still needs some loving care but shall be submitted
as well at some point.

However, several features are not yet addressed, such as
 - support for the RK3588 variant (-> first success achieved, patches
   need some cleanup and shall be submitted separately)
 - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
   provides the base for image processing on the RK3588)
 - support for the scaling unit in the PX30 (-> cannot do due to the
   lack of HW)
 - support for the interface to the Rockchip ISP in the RK3568
   (-> cannot do, latest information from Rockchip points out there
   IS NO HW CONNECTION BETWEEN VICAP AND ISP ON RK3568)

Looking forward to your comments!

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Collabora Kernel Team <kernel@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Changes in v9:
- added compatible for RK3588 MIPI CSI-2 receiver, thus dropped
  Krzysztof's R-b
- added interrupts to rkcsi DT binding and RK356x DT
- added variant specific callback to rkcif-capture-mipi that puts
  together the CTRL0 register content (which varies between RK3568
  and RK3588)
- fixed v4l2_fill_pixfmt_mp() return value handling (Mehdi)
- Link to v8: https://lore.kernel.org/r/20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com

Changes in v8:
- rebased onto v6.16-rc1
- fixed RKCIF_MIPI_MAX value in rkcif-common.h
- fixed rkcsi Kconfig (kernel test robot)
- sorted rkcsi DT bindings document properly, completed example
  (Krzysztof)
- squashed the defconfig patches (Krzysztof), dropped Bryan's R-b
- Link to v7: https://lore.kernel.org/r/20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com

Changes in v7:
- moved MIPI CSI-2 receiver driver into separate directory (Laurent)
- rkcsi: fixed return values (Bryan)
- rkcsi: fixed v4l2_get_link_freq to use pad instead of control
  handler (Sakari)
- rkcsi: added data-lanes property (Mehdi)
- rkcif: fixed formatting (Bryan)
- fixed "int" -> "unsigned int" in all for loops (Sakari)
- rkcif-stream: fixed minimum number of required buffers (Mehdi)
- rkcif-stream: used guards for the spinlock (Markus and Mehdi)
- rkcif-stream: made driver less noisy with dev_dbg (Mehdi)
- rkcif-stream: fixed issues detected by v4l2-compliance (Mehdi)
- rkcif-dvp-capture: fixed return value propagation in _register()
  (Mehdi)
- removed stray "phy-names" from required properties (Rob's bot)
- Link to v6: https://lore.kernel.org/r/20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com

Changes in v6:
- rebased onto v6.15-rc1
- renamed "MIPI CSI HOST" -> "MIPI CSI RECEIVER" (Laurent)
- s/@wolfvision.net/@collabora.com where appropriate
- renamed DVP delay property and moved it to the endpoint (Sakari)
- implemented DT review comments (Krzysztof and Sakari)
- implemented driver review comments (Sakari)
- fixed issues raised by media-ci (yet again)
- added documentation including a RK3568 topology (new patch 1)
  (Sakari)
- added patch that enables rkcif in the defconfig (new patch 9)
- Link to v5: https://lore.kernel.org/r/20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net

Changes in v5:
- fixed issues raised by media-ci
- fixed dt bindings (comments by Rob and Sakari)
- fixed probe on systems with no DVP in DT (comment by Alexander)
- fixed error path in register offset calculation
- split off MIPI CSI host driver into separate module (comment
  by Mehdi)
- added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
- Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net

Changes in v4:
- added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
- fixed asserts on stream stop
- fixed register address lookup
- fixed link validiation callback
- fixed issues raised by Rob's bot, kernel test robot, and media-ci
- Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net

Changes in v3:
- renamed the driver "cif" -> "rkcif"
- rebased onto v6.14-rc1
- abstracted the generic INTERFACE+CROP part
- addressed comments by Rob and Sakari
- added V4L2 MPLANE formats to DVP
- added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
- fixed formatting issues raised by media-ci bot
- Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: add rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (11):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
      media: rockchip: add a driver for the rockchip camera interface
      media: rockchip: add driver for mipi csi-2 receiver
      media: rockchip: rkcif: add support for mipi csi-2 capture
      arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
 Documentation/admin-guide/media/rkcif.rst          |  83 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 122 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 ++++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 ++++
 MAINTAINERS                                        |  17 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/media/platform/rockchip/Kconfig            |   2 +
 drivers/media/platform/rockchip/Makefile           |   2 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 770 ++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 249 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 302 +++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 425 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 735 ++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h       |   4 +
 30 files changed, 4965 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20240220-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



