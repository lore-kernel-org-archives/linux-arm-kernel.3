Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D80C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TaRTagZbFhqnzSru9GOZg1aXsfjtQVibggcHxgobdvk=; b=Vk8YqOy+padE1lS8GrQA+pZ81C
	lCOYQ41pV0krSd8vlUostxx0yHIHResXBjCC5O8r69RXM1cUhv5ks18RHPXyf0NSkyjui2zXWVJdF
	+wzgZTe4hQRsDSFMQLxmuktWk69InjIHD2JjzmQZvenQtBMiBrsF1cWp/bOMEr7/R8jnVqnvGnnib
	DQDF/Sgotm7LUlyPzVQhP8MpOuKTvfmwZ8dftOl9vEcP1ADldzgGmg3DhKQAGEDOyvvzph5oEu2TR
	/dXOXhXw2VFe1YfrWIPCSF2LIPXmRQf1BSsPKDHCwsMv3ICrK5WsI+K9PF8Oh3KEiQHFFKDb+PIJJ
	P7s3VlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTMB-00000003abL-0lBt;
	Fri, 08 Aug 2025 20:06:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTJe-00000003a4g-00Fq;
	Fri, 08 Aug 2025 20:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683428;
	bh=8Hxw2IStYv/MEOzfgY792r3eSVsz/GkseQLYrGILriA=;
	h=From:To:Cc:Subject:Date:From;
	b=g9wsNghNoNuXbDOEp8M9JNUVlKfFqjuTkQJjuEHpDN0mO+rvxmzTOsecohCmz1Y1/
	 g+mut7bQ7EwopiVbRJsBHDaUavF4q+/8ZOpL2p9oSffw5V+gGaPgu8IwX8Ja37eMHg
	 HfU4FtDwmuC016BL2S31GfapVAtKi0g/wJbVVMGTulWfs7jMtmAAwce3zsYPCgUbJn
	 Ibq4ssDQahNwxVJzd0so3xVx8ppCJAgcoaiv/sjvLsfpOpSrPMMI4Ug08VXt1vgYtV
	 Efd0x+Ba1soExskMGJ2ySDmyTYNyNDhKG1/uktzxAGCeTpcjghD+q0JtpE+736UqHi
	 AYPL8eVO+q7Sw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3320B17E0C8C;
	Fri,  8 Aug 2025 22:03:47 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Fri,  8 Aug 2025 16:03:22 -0400
Message-ID: <20250808200340.156393-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_130350_198664_3F1B6D33 
X-CRM114-Status: GOOD (  16.28  )
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
controls for HEVC [1].
Therefore, a patched version of userpace tools is needed for HEVC
support (added for GStreamer[2] and in an early stage for FFmpeg[3]).

This patch set also depends on the preparation patch set sent earlier [4]
as well as the iommu restore fix [5] (already merged in linux-media) and
Nicolas Frattaroli's bitmap patch [6] to support setting registers that
uses upper 16 bits as masks.

[1]: https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@collabora.com/
[2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[3]: https://gitlab.collabora.com/detlev/ffmpeg
[4]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabora.com/
[5]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@collabora.com/
[6]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com/

Changes since v1:
 - Add parsing of the short and long term ref frame sets from the new v4l2
   controls
 - Add RPS cache to avoid parsing the same data again
 - Fix HEVC pixel formats selection
 - Fix multiple indentation errors

Detlev Casanova (12):
  media: rkvdec: Switch to using structs instead of writel
  media: rkvdec: Move cabac table to its own source file
  media: rkvdec: Use structs to represent the HW RPS
  media: rkvdec: Move h264 functions to common file
  media: rkvdec: Add per variant configuration
  media: rkvdec: Add RCB and SRAM support
  media: rkvdec: Support per-variant interrupt handler
  media: rkvdec: Enable all clocks without naming them
  media: rkvdec: Add H264 support for the VDPU381 variant
  media: rkvdec: Add H264 support for the VDPU383 variant
  media: rkvdec: Add HEVC support for the VDPU381 variant
  media: rkvdec: Add HEVC support for the VDPU383 variant

 .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
 .../media/platform/rockchip/rkvdec/Makefile   |   13 +-
 .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3944 +++++++++++++++++
 .../rockchip/rkvdec/rkvdec-h264-common.c      |  253 ++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |   81 +
 .../platform/rockchip/rkvdec/rkvdec-h264.c    |  891 +---
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  511 +++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  101 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     |  174 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |   29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  567 ++-
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |  469 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |  427 ++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     |  582 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  688 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     |  284 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  230 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  569 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   39 +
 20 files changed, 9260 insertions(+), 1189 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.c
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
2.50.1


