Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8F1EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=164kTZ+5PCQ/zzneUZDSSUSSxvTKvPgWLza7q8izZyY=; b=Mm8BXowJxljIqLc4Td+KH4/Ijb
	kNXqw7kXxkX8BKeN+EJNfcGrrWSOyuGr1yzIoHP0eeMx9hUafglo2Onw8gYsp5JvYNa8E3KAcnujK
	QeULwMNrbksLUIOBH0wpkBbrEJ6PB9Vb1i+jcj5yDkxLK9IPUx2SB3rS4zMa2dua2Zawkg7gsnT6V
	mxOPGbMdzjyweDrdctfxQkJbnWb9oiiL8ieN69wbvxxKag02uL2T5qB5zGDD41g1xdEFqIYoChGlb
	BV4DjgLbjtxDDSfLa1kZu2R+wX/771SonaaDfCrGK+ecs99N6QQLQu0hhidjMw9RTgpOC9+/cVReg
	qlz1+Ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZTk-00000002L6e-2ddS;
	Thu, 12 Feb 2026 16:23:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZTf-00000002L53-2uDp;
	Thu, 12 Feb 2026 16:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913415;
	bh=vKHba+1je6XUmekM9HNLXtq/mx/vqDtmehn8UfltiBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BV6L1RM7tudUID6t9OgTGsWiwr2lskE7NWHxi4W6Lr6n2nSvM4wVO4E9CYC132khh
	 ARFAh1JU/HM3Nz6eXUPe+9/PE5n6NeDpRVpWiR1XCNJoA22t+/c1AiCLNTVZv6TvDq
	 Yo6kqhtRdOzeDmJb++jYN+e9Hnw03YumVzdL3kSA8zlAeVv8Fx2C9fvq+8mzcDRN9c
	 4KXiOIcxy1h3GkgJFyhXGKBGVKEqrOIxjANCL/wK4Mqv1lEZI+FIwa9BJHbcVn/eHI
	 71DLd9qVpeNng3sCRbONSgBhL2GcId/ixi6DGWNHt+VsdHV7wWmkOMJaAzi03sppug
	 WuNobTvOZOjXw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 285EA17E0E6A;
	Thu, 12 Feb 2026 17:23:32 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 00/11] v4l2: Add tracing for stateless codecs
Date: Thu, 12 Feb 2026 11:23:17 -0500
Message-ID: <20260212162328.192217-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082339_877076_E80252A6 
X-CRM114-Status: GOOD (  14.45  )
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

Hi !

This patchset aims to improve codec event tracing in v4l2.

The traces added in visl by Daniel Almeida are moved to the global trace
events and slightly reworked to be printed in a more consistent format.

To each trace are also added a tgid and fd fields, helping userspace track
different decoding sessions (contexts) based on the given file descriptor
used by the given process id.

Also for better tracking, stream on and stream off events are added as
well as HW run and HW done events to track decoder core usage.

Finally, add a show_fdinfo callback on video device files, allowing drivers
to expose usage information.
Currently only used for frame buffer memory usage.

The main focus is to be able to generate perfetto traces to show VPU usage,
a perfetto producer using this can be found at [1].

[1]: https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info

Detlev Casanova (11):
  media: Move visl traces to v4l2-core
  media: Reformat v4l2-requests trace event printk
  media: Add tgid and fd fields in v4l2_fh struct
  media: Add tgid and fd to the v4l2-requests trace fields
  media: Add missing types to v4l2_ctrl_ptr
  media: Trace the stateless controls when set in v4l2-ctrls-core.c
  media: Add stream on/off traces and run them in the ioctl
  media: Add HW run/done trace events
  media: hantro: Add v4l2_hw run/done traces
  media: v4l2: Add callback for show_fdinfo
  media: hantro: Add fdinfo callback

 drivers/media/platform/verisilicon/hantro.h   |    2 +
 .../media/platform/verisilicon/hantro_drv.c   |   25 +
 .../media/platform/verisilicon/hantro_v4l2.c  |   10 +-
 .../verisilicon/rockchip_vpu981_regs.h        |    1 +
 .../platform/verisilicon/rockchip_vpu_hw.c    |    4 +
 drivers/media/test-drivers/visl/Makefile      |    2 +-
 drivers/media/test-drivers/visl/visl-dec.c    |   76 -
 .../media/test-drivers/visl/visl-trace-av1.h  |  314 ---
 .../media/test-drivers/visl/visl-trace-fwht.h |   66 -
 .../media/test-drivers/visl/visl-trace-h264.h |  349 ----
 .../media/test-drivers/visl/visl-trace-hevc.h |  464 -----
 .../test-drivers/visl/visl-trace-mpeg2.h      |   99 -
 .../test-drivers/visl/visl-trace-points.c     |   11 -
 .../media/test-drivers/visl/visl-trace-vp8.h  |  156 --
 .../media/test-drivers/visl/visl-trace-vp9.h  |  292 ---
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   10 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  114 +
 drivers/media/v4l2-core/v4l2-dev.c            |   10 +
 drivers/media/v4l2-core/v4l2-fh.c             |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +-
 drivers/media/v4l2-core/v4l2-trace.c          |   48 +
 include/media/v4l2-ctrls.h                    |   19 +
 include/media/v4l2-dev.h                      |    1 +
 include/media/v4l2-fh.h                       |    4 +
 include/trace/events/v4l2.h                   |   58 +
 include/trace/events/v4l2_requests.h          | 1836 +++++++++++++++++
 26 files changed, 2178 insertions(+), 1831 deletions(-)
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
 delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
 create mode 100644 include/trace/events/v4l2_requests.h

-- 
2.53.0


