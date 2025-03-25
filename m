Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66795C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lg+fOPIX6fduWq65DPpbNeR2J8Ffo8pRHeDdnUDj7OI=; b=vIGLOm/CVR5T3BmLCCaB4euPE/
	h/bMbJnlIwvo7rEJb5ljTO6jfpUR7i22eigfzIDXeCouifiv7srjP8r8hQrBRMZP07Qhix336O7Fj
	Mfc/vDxG8odMW4ODIzf0f4E1fx3uzWuOl8TcSbxOeoDP6lWrHNsmMtS94NPDR2RfooJoYr4YAecSq
	1ZB+j2C6185Ln9C2mKtwdRtkidYBCCAIATP5fbQjZAycC3EYBZVu+eb2W/fcjcC+/j+OHZeUZODG1
	AOPt1AhJ1G3c9bSvGstcWxrlVly0PjVKwXCWPduha/WKuxqXHGUgWBHhRmDEszXmCpyJ8d5RGC46L
	x7RJmLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBvM-0000000746p-1RDV;
	Tue, 25 Mar 2025 21:35:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBtc-000000073oN-189Z;
	Tue, 25 Mar 2025 21:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938393;
	bh=8NRPCHR6JNw369gLermxb0yx+vv0DC6gM487kHYtqlk=;
	h=From:To:Cc:Subject:Date:From;
	b=lRKqKZyBfdIpiAdYDEHHRp99ohsi2LRzkt86NuZc3zI6pKFL/7d5jJFyBeUQJGVvf
	 vSIdiSoa7padRTxzqbWVAq40AH5CuytZiAFMSUlJhnxx0laua3hMDRVfCMkkDO7Jwl
	 N7J+fIPW0owpoK2FZom6WjCOjNJql3KW/EmDPnEkwwrrXlcN5AEwPQp+dPS8i723Pf
	 IiGp0zeU/C32jZip+0sBTF2q6BYgsbLke0SdmRsXKJ+VG+TZRRgv6TdPLlZWB1HG07
	 wl+jS1xy6i5MFjdco64pOgUQOrghKtujFgnqRaqf+AdqrXq5OTDibvG0j+6WKuQ5Vt
	 fUaYp8UYroQOg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87C2D17E0865;
	Tue, 25 Mar 2025 22:33:09 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 0/6] media: rockchip: Add rkvdec2 driver
Date: Tue, 25 Mar 2025 17:22:16 -0400
Message-ID: <20250325213303.826925-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_143316_461878_F7458080 
X-CRM114-Status: GOOD (  18.02  )
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

Add a rkvdec2 driver for newer video decoder found on rk3588 based SoC.

It is also found on other hardware like the RK356x, but not tested yet,
so it will be added later.

It only supports h264 format only for now, hevc will come later.
Yuv420 and yuv422 are both supported. 8 and 10 bits format are also
supported.
The NV15 and NV20 pixel formats are supported in v4l2 with the first
patch of this series. It has been picked up from [1].

The driver supports using the IOMMU through the rockchip IOMMU driver.
Because the IOMMU HW will be resetted in case of a decoding error, the
IOMMU mappings are rewritten on the HW by switching to an empty IOMMU
domain, then switching back to the default one.
This is one of the ways that has been recommended in [2].

[1]: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_422_support-v7-2-7992a68a4910@collabora.com/
[2]: https://lore.kernel.org/all/9bd56bd6-ce7d-495f-9bb3-ce7f07975f62@arm.com/

Changes since v3:
- Add IOMMU support
- Add 4:2:2 and 10 bits support
- Move cabac to v4l2 header
- Imported improvements from [1]
- Improve timeout value computation
- Improve clocks handling
- Always write scanlist buffer address in register
- Rebased on latest master

Changes since v2:
- doc: Disable resets and sram for other platforms, add maxItems for
  clocks
- Fix h264 spec equation number in comment
- Remove superfluous status field in dtsi
- Add TODO item for IOMMU

Changes since v1:
- Add support for RCB in SRAM
- Move bindings to rockchip,vdec.yaml
- Add resets bindings
- Add second core and enable them from dtsi file
- Only expose one video device to userspace (but don't support multicore yet)
- Share CABAC table with rkvdec
- Fix iowrite32 call and add preliminary support for arm
- Remove unused code
- Improve registers naming and code style
- Remove DMA_ATTR_ALLOC_SINGLE_PAGES flag


Detlev Casanova (5):
  media: v4l2-ctrls-core: Set frame_mbs_only_flag by default in h264 SPS
  media: rockchip: Move H264 CABAC table to header file
  media: rockchip: Introduce the rkvdec2 driver
  media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
  arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)

Jonas Karlman (1):
  media: v4l2: Add NV15 and NV20 pixel formats

 .../bindings/media/rockchip,vdec.yaml         |   73 +-
 .../media/v4l/pixfmt-yuv-planar.rst           |  128 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   74 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 .../media/platform/rockchip/rkvdec2/Kconfig   |   15 +
 .../media/platform/rockchip/rkvdec2/Makefile  |    3 +
 .../platform/rockchip/rkvdec2/rkvdec2-h264.c  |  778 +++++++++
 .../platform/rockchip/rkvdec2/rkvdec2-regs.h  |  347 ++++
 .../media/platform/rockchip/rkvdec2/rkvdec2.c | 1424 +++++++++++++++++
 .../media/platform/rockchip/rkvdec2/rkvdec2.h |  150 ++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   13 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  500 +-----
 include/media/v4l2-cabac/rkvdec-cabac.h       |  509 ++++++
 include/uapi/linux/videodev2.h                |    2 +
 17 files changed, 3522 insertions(+), 500 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2.h
 create mode 100644 include/media/v4l2-cabac/rkvdec-cabac.h

-- 
2.49.0


