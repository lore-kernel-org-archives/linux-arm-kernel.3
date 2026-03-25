Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F093106B502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cYK6VukAUFwUG9qiCv9bx0CEP1mO4MxgekBvWA2vYHk=; b=kPNrpTEDSQNE/7c8uq+0joz8d6
	jyIu2LBpCj2HMIegWr1KREBjV2k5OAyP4thJiM1x5j6vHv+s5pDWSqWfLUcids+Izf9Ec4t2R3nTD
	vUT957nkvHj4h+1oddkpMFDKw29Gqw+p6Ln08qR39ITv9i0/rxILWit41VH7ZqBtScpQ7FBO+YB0g
	lMap7gzWPyGa/W7NxKuuMiWvxlLSgPdzkhFXaZNP7F24rUuWoQbMK3CQDVtOVxT7aP6kP6X+NoUPp
	045+4mdJpvvAhI5SKgoCv5kdhQSnfLyqUaaRw3ILhI7W9H/WwkQRaAAsw7V8fwbf2tC2hWwKN5Q6l
	I5adpnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mlk-00000003JDt-14zF;
	Wed, 25 Mar 2026 11:51:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MlR-00000003J2Q-3pQL;
	Wed, 25 Mar 2026 11:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72154437C0;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48459C4CEF7;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439469;
	bh=vbZLOt7EIgfb8wzXcMEkH5OJviNmVkjkd3ow5gAmiUc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ChzzqUrHVU6GyHTOmPX33SKOaGk1a5VWSccncEADbxfeGxCfBCy+oguVt6zv2HxX+
	 dscc9wRtZwzlZiGO2j8CHL+vsr3ZYQkLVkyvsJ8ZeichXu3UfWHyo8r2H9QsCXa+M1
	 YTPKrNgK+gj8KXvafhvthJNlXk3aDGsSX9yD2h0Imgbb+E1sb/gupHoAZjnFxsRTTw
	 sYeMx+7pZbjyHbRC4K21Yu5h5pnTKcI9fbKHWJULCTzGPVEp/EL7rQzoqarrShiTLP
	 CTOSez2yJJzPNAVEnYsZTPOtnxSKfOz7K+pncwAS/p568PDeC8ZssbY/IGNpnNGHxM
	 PUtNZljHE1CSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3110DFEC11B;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v3 0/9] media: rockchip: rkcif: add support for rk3588
 vicap
Date: Wed, 25 Mar 2026 12:51:05 +0100
Message-Id: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnMw2kC/33Py2rDMBAF0F8xWldBT1vyKv8RutBjVIumkSOlo
 iH436vYhJRSurwDc+7MDRXIEQoauxvKUGOJ6dQCf+mQm8zpDXD0LSNGmCSCE5zfuVQK1+jMjLW
 nvXBKMmUG1FbmDCF+rdzhdcsZzp9NvWzDJzp2jRSEsY3sH6TVlgetmQxCjFWhn4esO5L0tH+c4
 UrEfp6u2GnwzHjhvA5jpejePsVySfm6/tZG9/q/36gUE2y59T4MQmsq9i4dj8ambHYufaxYZf8
 BrAHD4EECaCIU/AaWZfkGYXCQwWsBAAA=
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774439467; l=4230;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=vbZLOt7EIgfb8wzXcMEkH5OJviNmVkjkd3ow5gAmiUc=;
 b=J2s0+HJP6GwhPiHb/6T3kiNxUwA7owRv7p6n2lIShYxe0OZPdqFw3RozfsnzKdXDUJO3dri3o
 B0CPaB36R0AA5amYbV4IbZj/fAVxzt+6utvdrDvgV06SEbg6T+AIH2v
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_045109_997241_BFDB2F61 
X-CRM114-Status: GOOD (  12.82  )
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

The RK3588 Video Capture (VICAP) constitutes an essential piece of the
RK3588 camera interface with one DVP, six MIPI CSI-2 receivers,
scale/crop units, and a data path multiplexer (to scaler units, to ISP,
...). This series introduces basic support for the RK3588 VICAP unit
to the rkcif driver, thus paving the way for video capture in general
and for camera sensor image processing in particular.

The changes have been tested successfully on a Radxa ROCK 5B+ with two
Radxa 4K cameras attached to it. The raw images from the sensors can
be streamed after configuring the hardware pipeline with

media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd30000.csi":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"rkcif-mipi2":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"dw-mipi-csi2rx fdd50000.csi":0 \
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'
media-ctl -d 0 --set-v4l2 '"rkcif-mipi4":0 \ 
  [fmt:SGBRG10_1X10/3864x2192 field:none colorspace:raw xfer:none]'

and using e.g., GStreamer

gst-launch-1.0 v4l2src \
  device=/dev/v4l/by-path/platform-fdce0000.video-capture-video-index0 \
  ! video/x-bayer,format=gbrg10le,width=3864,height=2192 ! bayer2rgb \
  ! ...
(or -index4 for the other camera sensor).

Note that this series requires the RK3588 MIPI CSI-2 receiver patches
[0]. I included them here to provide the possibility to test the changes
without any nasty merge conflicts.

Looking forward to your comments!

[0] https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v3:
- fixed copy-paste mistake "RK3568" -> "RK3588" in docs (Charalampos)
- fixed reg properties of ports in dtsi (port@10 <=> <16>, ...)
- added comment w.r.t. RKCIF_MIPI_CTRL_CAP_EN bit (Mehdi)
- removed redundant minItems and maxItems from dt-binding (Conor)
- revised device tree overlays for the Radxa CAMs according to the
  schematics that I recently received
- Link to v2: https://lore.kernel.org/r/20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com

Changes in v2:
- modified rockchip,rk3568-vicap binding instead of creating a new one
  (Conor)
- aligned clock names and reset names with rockchip,rk3568-vicap
- Link to v1: https://lore.kernel.org/r/20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com

---
Michael Riesch (9):
      Documentation: admin-guide: media: add rk3588 vicap
      media: dt-bindings: add rockchip rk3588 vicap
      media: rockchip: rkcif: add support for rk3588 vicap mipi capture
      [DONOTMERGE] media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      [DONOTMERGE] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: dts: rockchip: add vicap node to rk3588
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0
      arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../admin-guide/media/rkcif-rk3588-vicap.dot       |  29 ++++
 Documentation/admin-guide/media/rkcif.rst          |  32 ++++
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   8 +-
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 187 ++++++++++++++++++---
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 143 ++++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  99 +++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  99 +++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 141 ++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 ++
 13 files changed, 740 insertions(+), 27 deletions(-)
---
base-commit: 882ac913e67d2462a18bdc2958b496c0f51d1647
change-id: 20250430-rk3588-vicap-9d164c8528a7

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



