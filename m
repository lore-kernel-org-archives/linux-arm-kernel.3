Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FECD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTwtfjJxiG5XiQao6Dw52tTzNJ3iblentrS+SK7lwWU=; b=2oEu34iWynUeue
	AmgD2MHRLlA+rYdpbbytIh+cMJjFZpI6SgpI3eYCmiY4hpgw8lUT+UDw+dMU75o/rgvK8GcEeygHX
	580WplY01RJSDBt1YOW/697+SdAddC+8hE2LAKuzXHpkyeY9nmrYxI+Rm7Vp+eQouoDX+TUMQvG1v
	6ihX+oMp73QRq6SkIcy2p2I48r3QvcqlBrAeUbXZUE9yCl0CikgT3c1/joqmKEuILtZ5S6d+A5t85
	U7NFPY7VyhOhIG+fckR3JYekfazkXfZtgR5Izt4NIPtXcQNWkIs345icrVdrRAmsQFiW7wBAhV7kR
	jEyFDZCffXNFJR/O0yLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0W-00000007uUG-09HB;
	Wed, 10 Jun 2026 14:34:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0S-00000007uQJ-40rG;
	Wed, 10 Jun 2026 14:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102048;
	bh=nncoYMbLy5u1NQPFDhSMLiKTiqSyPaMakLjfc9HXMHE=;
	h=From:Subject:Date:To:Cc:From;
	b=eqNHc+Z816CnZPB+kGHXUypknfDDcDi+dCk1whzPCqdZEPZU35Xlu3WquMj/oqJj6
	 PjSBMs8JfaI+BUCAFITZCzMd3mb8B+C1GR96o6LR+cmaO36tvQrvp7uXAzA/8OQ8YI
	 K06mZrhkCU72A+q/GwUKV0R3EvrjhIz0W/k08c27cWWX97elfW0xqTEcX4CvZ3fCwm
	 1cmETf2EPPKyMDPeRN6ATY/XnOzLYg5k2CzMS2X1kS5BuBtV68t7QOWzn3GyYB5NkF
	 4n3OHmMZ2DVyloszABmWeeCuHQaQ0HBwQ77GDmqKdaRbkuYd8CP3kAojwXn3BwyotN
	 7xujcPd93rnXg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA9C017E0416;
	Wed, 10 Jun 2026 16:34:06 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/9] v4l2: Add tracing for stateless codecs
Date: Wed, 10 Jun 2026 10:33:30 -0400
Message-Id: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTsQQhnFq4iL6eSPjkhbklqE0
 rsbdfkt3tuoojgqnbuNClavPo0N8dCR3XW8gT01UwxRgoQTr/0zsqbEeSlqYIUJjlmCilGr5oL
 s79/xcv27voYHbPluaN8/68O1uHMAAAA=
X-Change-ID: 20260608-v4l2-add-ftrace-aec6e7f60a6c
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_073413_169869_512E7CD4 
X-CRM114-Status: GOOD (  13.52  )
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
events.
They are adapted to trace each each field separately and not just the
whole struct so that userspace can filter on different fields and
libraries like libtracefs and libtraceevent can be used to list the
fields instead of parsing the trace printk's.

The trace event templates are also reworked to avoid long lines, but
quoted string splits are kept as they don't cut words.

To each trace event are also added a tgid and fd fields, helping
userspace track different decoding sessions (contexts) based on the given
file descriptor used by the given process id.

Also for better tracking, stream on and stream off events are added as
well as HW run and HW done events to track decoder core usage.

The main focus is to be able to generate perfetto traces to show VPU usage,
a perfetto producer using this can be found at [1] (it will be renamed to
match the more generic approach than hantro).
Other controls can be traced later as well, this patch set only focuses on
mem2mem type drivers.

[1]:
https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info

Changes since v1:
- Don't modify the printk format
- Trace all fields of the structs instead of the whole struct as a buffer
- Remove fdinfo patches (they will come in another patch set)
- Fix long lines
- Rename v4l2_requests.h trace header to v4l2_controls.h
- Add basic documentation

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (9):
      media: Move visl traces to v4l2-core
      media: Map each struct field to its own trace field
      media: Add tgid and fd fields in v4l2_fh struct
      media: Add tgid and fd to the v4l2-requests trace fields
      media: Add missing types to v4l2_ctrl_ptr
      media: Trace the stateless controls when set in v4l2-ctrls-core.c
      media: Add stream on/off traces and run them in the ioctl
      media: Add HW run/done trace events
      media: hantro: Add v4l2_hw run/done traces

 drivers/media/platform/verisilicon/hantro.h        |    1 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   10 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |    1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |    4 +
 drivers/media/test-drivers/visl/Makefile           |    2 +-
 drivers/media/test-drivers/visl/visl-dec.c         |   76 -
 drivers/media/test-drivers/visl/visl-trace-av1.h   |  314 ---
 drivers/media/test-drivers/visl/visl-trace-fwht.h  |   66 -
 drivers/media/test-drivers/visl/visl-trace-h264.h  |  349 ---
 drivers/media/test-drivers/visl/visl-trace-hevc.h  |  464 ----
 drivers/media/test-drivers/visl/visl-trace-mpeg2.h |   99 -
 .../media/test-drivers/visl/visl-trace-points.c    |   11 -
 drivers/media/test-drivers/visl/visl-trace-vp8.h   |  156 --
 drivers/media/test-drivers/visl/visl-trace-vp9.h   |  292 ---
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   10 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  114 +
 drivers/media/v4l2-core/v4l2-fh.c                  |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   37 +-
 drivers/media/v4l2-core/v4l2-trace.c               |   48 +
 include/media/v4l2-ctrls.h                         |   19 +
 include/media/v4l2-fh.h                            |    4 +
 include/trace/events/v4l2.h                        |   77 +
 include/trace/events/v4l2_controls.h               | 2708 ++++++++++++++++++++
 23 files changed, 3033 insertions(+), 1830 deletions(-)
---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


