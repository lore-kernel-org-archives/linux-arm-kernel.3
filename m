Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA79CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLwc8SsDUelcDZcdX3ZDChsYIIyAm1V545qEQKs3SFw=; b=A5whlTTLYN++HvvwVfmtRz6mxZ
	KfjYtSw3vC/8ps98ulOAB/4I9W1rZ2Bpnov6OFM348y6SPHW+gheUxh5/Yb6iu5RQ4DjnZtOAe8aA
	eAR9tTXMIONMRF0G7DCRMg4X5WXhk3ZdedSr3BYhF/GptQHpvTW7R8J0Y75gXauAVEYuctltJ0zhU
	KlNlVjn0cjuOiUtLyOphFR14vXlEiBEmdkAE+Ifr2FFzG9Lprya0M4tjNHo64Uu1y0ZQCPv/e7MaN
	vH64GljsCbow8x0qCDTAZYJxEKguQ/lZBOJ/Fw1okHWHjLvGicqKxyyKxgFRGuhm14g/78nVtQYHg
	S6bnpxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMwJ-0000000AT5p-1zUQ;
	Fri, 22 May 2026 10:17:11 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMwG-0000000AT4j-0USf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:17:10 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E9B193700292
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:17:02 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 61F48B408CF; Fri, 22 May 2026 10:16:58 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 311CAB408C8;
	Fri, 22 May 2026 10:16:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
Date: Fri, 22 May 2026 12:16:39 +0200
Message-ID: <20260522101653.2565125-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031708_512897_006F643E 
X-CRM114-Status: GOOD (  15.18  )
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

This series introduces support for the V4L2 H.264 stateless encode uAPI,
core and support in the hantro driver for the Verisilicon VC8000E.

While this is a first version that will likely need some level of rework,
it is already usable for most common use-cases and supports constant
bitrate rate-control.

A GStreamer tree can be used to test the series at:
https://github.com/paulkocialkowski/gstreamer/tree/v4l2codecs/h264enc
And an example pipeline would look like:
gst-launch-1.0 videotestsrc pattern=smpte num-buffers=25 ! video/x-raw,width=640,height=480 ! v4l2slh264enc rate-control=cbr bitrate=8000000 qp-min=8 qp-max=42 ! h264parse ! matroskamux ! filesink location=encode.mkv

Note that documentation for the new uAPI is intentionally left out of
this series since it has not yet received approval.

Marco Felsch (2):
  media: hantro: use hantro_decoded_buffer only for dst_vq
  arm64: dts: imx8mp: add VC8000E encoder node

Paul Kocialkowski (12):
  media: h264: Add a more generic reflist builder init
  media: uapi: Add H.264 stateless encode support
  media: h264: Add SPS video definitions
  media: h264: Add stateless encode core
  media: h264: Add stateless encode rbsp
  media: h264: Add stateless encode reference management
  media: h264: Add stateless encode rate control
  media: verisilicon: Report default pixel coding for non-JPEG and fix
    JPEG case
  media: verisilicon: Cancel job with runtime pm put/clk disable on
    failure
  media: verisilicon: Add common encoder parm and frameintervals ioctls
  media: verisilicon: Add support for the VC8000E H.264 encoder
  media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP

 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   11 +
 drivers/media/platform/verisilicon/Kconfig    |    1 +
 drivers/media/platform/verisilicon/Makefile   |    2 +
 drivers/media/platform/verisilicon/hantro.h   |   17 +
 .../media/platform/verisilicon/hantro_drv.c   |  180 +-
 .../media/platform/verisilicon/hantro_h264.c  |    6 +-
 .../media/platform/verisilicon/hantro_hw.h    |   28 +
 .../media/platform/verisilicon/hantro_v4l2.c  |  123 +-
 .../platform/verisilicon/hantro_vc8000e.c     |   68 +
 .../verisilicon/hantro_vc8000e_h264_enc.c     |  883 +++++++
 .../verisilicon/hantro_vc8000e_regs.h         | 2129 +++++++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |  113 +
 drivers/media/v4l2-core/Kconfig               |    4 +
 drivers/media/v4l2-core/Makefile              |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   62 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c  | 1173 +++++++++
 drivers/media/v4l2-core/v4l2-h264-enc-rc.c    |  558 +++++
 drivers/media/v4l2-core/v4l2-h264-enc.c       | 1322 ++++++++++
 drivers/media/v4l2-core/v4l2-h264.c           |   69 +
 include/media/v4l2-ctrls.h                    |    2 +
 include/media/v4l2-h264-enc-rbsp.h            |   72 +
 include/media/v4l2-h264-enc-rc.h              |  108 +
 include/media/v4l2-h264-enc.h                 |  135 ++
 include/media/v4l2-h264.h                     |  146 ++
 include/uapi/linux/v4l2-controls.h            |   33 +
 include/uapi/linux/videodev2.h                |    1 +
 27 files changed, 7231 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_h264_enc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_vc8000e_regs.h
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc-rc.c
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
 create mode 100644 include/media/v4l2-h264-enc-rbsp.h
 create mode 100644 include/media/v4l2-h264-enc-rc.h
 create mode 100644 include/media/v4l2-h264-enc.h

-- 
2.53.0


