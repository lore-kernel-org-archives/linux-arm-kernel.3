Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC562D66B80
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ywb7mNuxXy4VLYKnEWqXGcHnlcgvZonTP/TagNMbPCo=; b=ldslIHEFNW7PFTlZkzaLkifgrv
	Ad5VCZSjOD5+LY4g+qYkRtrw79Ng8FCyV7OVjoVKfu4WHxd6E2EwJCzz/Efzcc2lYkIwtGrRAjo4T
	8Ajhjdb9StEw9EbXW6RROhxrIGC0jaMEriK3C327YsXe/9ByBFOZY9W+LS+ei75zVzDOuEs6y57OV
	i39nWufEHfAwj2MDZcw0GRle3NUpYPC13NiA8kRyeCCtyjSJo6xZ8+cSu1qxqEoNOLtxJSRrJI5s+
	3Vl3VQtWzkl+3/NJG5Qc9VWnZChsVFNwdxjfAdBHcZL46356XqsrSG/LqkqZnosqhPycWCLJWSiPY
	3O4FZ77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvX4-00000007BnW-4B5o;
	Wed, 17 Dec 2025 17:41:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvX1-00000007Bmj-2tJb;
	Wed, 17 Dec 2025 17:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993304;
	bh=uIx6rpuY349cjHZs9AppHINVb5Am8ttDplbT+JXUw2o=;
	h=From:To:Cc:Subject:Date:From;
	b=prUebE5K7LuqqRwFXAkRvqbt5ufMeQZR2EgSBoZbtiYg6ZDgiscpoN27cfSQDUYvT
	 DFyy4zcK+caT0xRqQ2wrXjLwYhxUBICVDrjQzb0gmB4+e6j0pg/mnpGFa8zlo8CLJb
	 /oD1hJE4RQQdX6F68RNj6dkeUsTV4CqkNBk9l9EFdWkJhSF64PFFj42O4mFjcWSBwj
	 h1orBUGtj6qbmtCsN4oNBj889NSVEpDQuTWL0o7yjdK1XMsr0yfdqbRF1tSJE5D2t0
	 /4vFY6dcCvn35BNnWTNbHc2TJNYQnErjne0uO4jqH7nxyF4N43OOEEvPsTDJiKePon
	 /8EfOOKOu1sYA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF04D17E1321;
	Wed, 17 Dec 2025 18:41:41 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 00/17] media: rkvdec: Add support for VDPU381 and VDPU383 
Date: Wed, 17 Dec 2025 12:40:37 -0500
Message-ID: <20251217174059.1341784-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_094147_902298_9E30EF97 
X-CRM114-Status: GOOD (  19.78  )
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

These variants are found respectively in the RK3588 and RK3576 SoCs.
This patch only adds support for H264 and H265 in both variants.

As there is a considerable part of the code that can be shared with the
already supported rkvdec decoder driver, the support for these variants
is added here rather than writing a new driver.

This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
controls for HEVC.
Therefore, a patched version of userpace tools is needed for HEVC
support (added for GStreamer[1] and in an early stage for FFmpeg[2]).

The DTS changes can be found in another patch set: [3]

[1]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[2]: https://gitlab.collabora.com/detlev/ffmpeg
[3]: https://lore.kernel.org/all/20251020212009.8852-1-detlev.casanova@collabora.com/

Changes since v5:
- Extract multicore management in separate commit
- Move variant specific functions to an ops struct
- Fix a typo and "h264" -> "hevc" copy/paste mistakes
- Move RKVDEC_*_PIXELS to rkvdec.h
- Drop VDPU383_*_PIXELS, use the the RKVDEC ones instead
- Change RKVDEC_1080P_PIXELS value to 1920 * 1088
- Long and short term ref sets extend controls:
  - Add them in visl traces
  - Reword documentation to specify SPS extension and use
  - Mention Vulkan Video API similarity
  - Specify behavior for empty array values
  - Reorder struct fields to ensure fixed compiled size
  - Remove the mention of V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag

Changes since v4:
 - Add basic ext_sps_[ls]t_rps validation (flags only)
 - Add missing copyright in new common files
 - Rename num_coded_fmts, rcb_num, clk_count
 - Avoid allocating RCB config when not needed
 - Merge rkvdec_config into rkvdec_variant
 - Keep rkvdec_hevc_get_image_fmt per variant

Changes since v3:
 - Rebased on latest next (ea299a216426) + HEVC support for rk3399

Changes since v2:
 - Rebased on Kwiboo's HEVC support for rk3399
 - Include hevc_ext_sps_[ls]t_rps v4l2 controls commits
 - Remove empty lines at end of files
 - Rename RKVDEC2_ALLOC_* to RKVDEC_ALLOC_*
 - Set min_with and min_height to 64
 - Remove vdpu38x_fill_pixfmt_mp() function
 - Handle userspace not supporting hevc_ext_sps_[ls]t_rps
 - Make all config structs static const

Changes since v1:
 - Add parsing of the short and long term ref frame sets from the new v4l2
   controls
 - Add RPS cache to avoid parsing the same data again
 - Fix HEVC pixel formats selection
 - Fix multiple indentation errors

Detlev Casanova (17):
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
  media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
  media: visl: Add HEVC short and long term RPS sets
  media: rkvdec: Switch to using structs instead of writel
  media: rkvdec: Move cabac tables to their own source file
  media: rkvdec: Use structs to represent the HW RPS
  media: rkvdec: Move h264 functions to common file
  media: rkvdec: Move hevc functions to common file
  media: rkvdec: Add variant specific coded formats list
  media: rkvdec: Add RCB and SRAM support
  media: rkvdec: Support per-variant interrupt handler
  media: rkvdec: Enable all clocks without naming them
  media: rkvdec: Disable multicore support
  media: rkvdec: Add H264 support for the VDPU381 variant
  media: rkvdec: Add H264 support for the VDPU383 variant
  media: rkvdec: Add HEVC support for the VDPU381 variant
  media: rkvdec: Add HEVC support for the VDPU383 variant

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 +++
 .../media/v4l/videodev2.h.rst.exceptions      |   2 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 +
 .../media/platform/rockchip/rkvdec/Kconfig    |   1 +
 .../media/platform/rockchip/rkvdec/Makefile   |  14 +-
 .../{rkvdec-hevc-data.c => rkvdec-cabac.c}    | 506 +++++++++-
 .../rockchip/rkvdec/rkvdec-h264-common.c      | 258 +++++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |  89 ++
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 891 ++----------------
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 488 ++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 108 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 257 +----
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 178 ++++
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    | 571 +++++++----
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 641 +++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 424 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 582 ++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 736 +++++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     | 281 ++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 231 ++---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 542 ++++++++++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  43 +
 drivers/media/test-drivers/visl/visl-dec.c    |   7 +
 drivers/media/test-drivers/visl/visl-dec.h    |   3 +
 .../media/test-drivers/visl/visl-trace-hevc.h |  59 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  28 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 +
 include/uapi/linux/v4l2-controls.h            |  61 ++
 include/uapi/linux/videodev2.h                |   2 +
 31 files changed, 6230 insertions(+), 1413 deletions(-)
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c => rkvdec-cabac.c} (86%)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h

-- 
2.52.0


