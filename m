Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1097FF3382C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KtEVLraxNpKVM6JbErvMKUB+qLyDrgGUVuu4AnHU/Ec=; b=FNnWLtJ9Bg8OOnEp+//SLY7lUW
	txme04X95NmflvgAN5kjXyFVtpViVJpS3w24LWUeA5kFqLGoWq+tEVRCWybmnhP+bHhOrYMuegirI
	wOKgRH54xCkV6ZB3TCJ1lNzcIOaHmB5YCwQpC7kmzRrtSwu8vDmurOv29Xkeom7nwC1Yf0b1ZIGkd
	tteaToMWPQmYo4r3F2fpt9t54YqaR8a1KIuzZI925G1W+JrmEh+fo50E1QMc1AU0e3HePnG8niRWM
	zFd31MzEVeTJw5ByWLXCpV3Qxbq/HQmunrXA3RXyBHD4ggroiRNExHdTFPz8nsmtkkZkcpWVajC42
	6SyfOGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmo-00000005sf4-2rVv;
	Tue, 17 Mar 2026 09:32:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmn-00000005sde-16l6;
	Tue, 17 Mar 2026 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A92260008;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE66DC4CEF7;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739943;
	bh=OScWDJNVIXSkH9JdH7eb/Xp1LXka3za6IEC5iCx5Yj8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kJjgu9C/3XQjSgBKhqcn5HczX0zhTm17yn5XD78OkbJJ8svjOds9OIt4MsbCkCn0n
	 7i1/aBggUjlOddzTmk0jb4bFyLWiQQNba+sLWoOuWJAeDbOb7SutPr2YUFC5liiiMf
	 kk41B4T84ofC3tvHm6oXhWKEbMsESq2o2V9DRwQiSiGqhek9B0T406jpjdtLf8E8L4
	 nWejI5Z/OjBeHKG68vefR4AhvEom9jJ8yD77zPpJi9A9qQicwweE4ikuCdGQDAOFy4
	 iZMmodQn4AVVFkOIls5gcBKakrdG9wWBcKhO4S0lW8FkNlnh2rSVp5JibpB+dMGIp3
	 gjBb2lmv00gfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF397F33825;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/9] media: rockchip: rkcif: add support for rk3588
 vicap
Date: Tue, 17 Mar 2026 10:32:18 +0100
Message-Id: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIfuWkC/22Py27DIBREfyW661DBNTjgVf+jyoJnjPLAhRQli
 vzvIbaidtHljDRnZh5QfI6+wLB5QPY1lpguTeB2A3bUl4Mn0TUNSFFQ3lGSj52QktRo9USUYz2
 3UqDUO2iRKfsQbwvua7/q7L9/GvW6mr/Q1kGRU8QV2b+RRpkuKIUicD5UCX+HLBlBe9a/Z9gSi
 ZvGO7HKO9SOW6fCUBm82sdYrinfl2/NetX/f6MyQonpjHNhx5Vi/NOm00mblPWHTWfYz/P8BA0
 k94QqAQAA
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=3744;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=OScWDJNVIXSkH9JdH7eb/Xp1LXka3za6IEC5iCx5Yj8=;
 b=6PadDWPx3oeafAOPBjI+855zmsp4/DBpg0970EhEGcI3wlC9fw5+HzDA3AnGkhnt4ql5h4cfj
 SdE9UDjYeWLCnksoiXzSUbGSndDfQDbNMeo/k4kinKfvi6+jc20ffeY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 191 ++++++++++++++++++---
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 143 +++++++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  89 ++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  89 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 136 +++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 ++
 13 files changed, 719 insertions(+), 27 deletions(-)
---
base-commit: bb2a3912549d3b5cef5ed27200402fe8f6fb0694
change-id: 20250430-rk3588-vicap-9d164c8528a7

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



