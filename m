Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20964103E300
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIgNAqLr07WaG8vjfJrqkvsGoD1ItqhD2t/PvKCEK7c=; b=G/O5+BjXfmT+maf8lcr6p/3iwI
	eo1rWpEAWz+W1V3V9lULF8GstrOn5bFZfqz3MiGVZhqSWeoDvp88Z7Q3SPyBpORyuEQhbCuuonoZw
	F7AGHZu9TtePZ/gv8eSmUruW6Pln9fRd2Mm3WBPO51/OHgn0HPwJ/QOo87kA5oPwM202Ih/fbQ/zc
	Qd31SYKy9CwH7z8uHD2HYUm/7nrU/70TiQA8VC04seOEXilwc0/Kkm4BkUMOI3oSiZ9WroEjTOqla
	Qxzy6yGMoZxIZN7C17NBKaf7HUbzWO123mK5Xrn1w8CGRn9oZwbaAS9mC0+IRFCCQIvQAYOzQRjXM
	Be0Ip+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jq-00000000WVN-02ba;
	Fri, 13 Mar 2026 15:20:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jj-00000000WS7-2ghu;
	Fri, 13 Mar 2026 15:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F4CC6184C;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28715C19425;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=fA0XSaPbu/0YVoBoDhWzlwA8+Y4Naq/u9fbi/LssJ1k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nplko2XCiIw0eOEIC92USwdyGSA2Fg0nIOoiGXkClS+0GGcDaITXTw/4s2SkB6xC1
	 Yn0hBJTP5168aC4S/Oks7jbRG/v+OTv9xWeNzALVrLmnfHO8RU3pQuxOS9girvnBjY
	 nQYIjs9hQL/WJWdLlpI1suZhpem3lXXq/+w/nWMJbqD1ussnxvb9ltJtkRROAcK0bX
	 /MN1TK4e9A19LV5+PzZ+4NNf+Y5daCd4/PUI/2UmpCWsY84HOTFEf1rKZybypaa8uU
	 mCdXx8pIl0omLhBzUlzI9I0otdES+ZxnuvkEreb8QcjPwqvu95HpvajuSxyGOgsTRI
	 SKpwmyHMePZ8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180E3105F797;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/9] media: rockchip: rkcif: add support for rk3588 vicap
Date: Fri, 13 Mar 2026 16:20:42 +0100
Message-Id: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEortGkC/03OSwrCMBgE4KuUf20gb5NcRbpI87BBqDXRoJTe3
 dBSdDkD8zELlJBTKGC6BXKoqaT71AI5deBGO10DSr5loJgKzBlG+caEUqgmZ2ekPZHcKUGVPUO
 bzDnE9N64S7/nHB6vpj738oearpEcU7qT8iAHPbCoNRWRc1MV/B/ZNgJLIo8briTk5/GDnA6eW
 s+d19FUAv26fgFrtVKh3AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=3521;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=fA0XSaPbu/0YVoBoDhWzlwA8+Y4Naq/u9fbi/LssJ1k=;
 b=R9TyBuoWMeuKHTcCTnYQAdIjt4L+FqBVAqLReZVZ04CZPxf7YF7WEkLaxO6+RTTc7EM95LdhK
 MdjNRTJb8tDAzBAXlhLFCw43vJHfbbx7/tzAmcfDn1QpNvAAbX9M1AL
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

 .../admin-guide/media/rkcif-rk3588-vicap.dot       |  29 +++
 Documentation/admin-guide/media/rkcif.rst          |  32 +++
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   8 +-
 .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 139 +++++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |  89 +++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |  89 +++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 136 +++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 ++
 14 files changed, 805 insertions(+), 3 deletions(-)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20250430-rk3588-vicap-9d164c8528a7

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



