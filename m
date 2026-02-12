Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843BCEE36A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/C6mP67+SBsgEhwxi9hRwzEHH/gh4+VXt6OR51fMwA=; b=11m1h1l3shAwmyL9qTWUI74RLi
	KjYJSmQltjoDNA9pDksXT5qzgpcSJCvS7oeNCTzluEy0qAyOCOY+AH7f8m5wde1fYZ21+i+sftJ8H
	zwtTmgYLw6tc3Vxlo3XcnqtnFKImQBDa/L1E6qpgEevYuaV0DWUKIau5Irf7u6/1+B5WvwXGgERV2
	75WZ4G3Eh2c1+o6DM9EMF+cwyn3erAZvE8tWoEo4vPdEVe040T/v1XZGP0y7JNiylxPfiWdbtG7BL
	KJIQyYF0t6LZGT/UuxnPWZsGd0HHgNb3dPFw/G1G2u4sWJxxpvHIUIXbEq1pLpOFHMZTM406vvbk/
	A+E7Wu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZUA-00000002Lb9-3vTh;
	Thu, 12 Feb 2026 16:24:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZU5-00000002LRa-17EZ;
	Thu, 12 Feb 2026 16:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913443;
	bh=kuaeeU6LpMHASQxhXNRqsVcHur7yHgGgjDZb5xy+6BI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DalFuv4sw1iBmN+oew0RmVeMydia1jt2wNpk2m9oxceoQE2DFFIydqvYa18h8KbbF
	 kVFzRKs8tupT9/1CikfUvwpjm97aeUani1+k2mXN/KapaYjyK5lZeL39Kv1RWWA2Cd
	 IQZXnsTN1pO4fa+HS8B3YG5ObduMQ+KMKo2JpMYOetX8+sWzKw/qbcRfvx6Muv4htC
	 yc19QOkMYoRwKmUla4CDygVtMD/aQyZZv+Kw9GCUADyztr+fAARjrxZ0jBHkuahrka
	 5HsaisjI79vg7Bpp0YDyGVVUYpjsbgBb/QQfSJ+VwEVeS3wbcTEw9O2LhuBueGJHS7
	 AtAIQbTDBBwnQ==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 318EE17E0A49;
	Thu, 12 Feb 2026 17:24:00 +0100 (CET)
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
Subject: [PATCH 08/11] media: Add HW run/done trace events
Date: Thu, 12 Feb 2026 11:23:25 -0500
Message-ID: <20260212162328.192217-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082405_459728_B566FE01 
X-CRM114-Status: GOOD (  11.30  )
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

The events can be fired by drivers when the hardware is run and when it
is done.
That can be used by userspace tracers to see HW performance and usage.

The hw_done event allows setting the number of clock cycles the HW needed
to do the work, to help tools evaluate performances.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-trace.c |  3 +++
 include/trace/events/v4l2.h          | 30 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index 9ce54c1968ef..2fbc05dde346 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -12,6 +12,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_run);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_done);
+
 /* Export AV1 controls */
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_sequence);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_frame);
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index bec310eaedc7..4a9dcdbea22b 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -290,6 +290,36 @@ DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
 	TP_ARGS(tgid, fd)
 );
 
+DEFINE_EVENT(v4l2_stream_class, v4l2_hw_run,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DECLARE_EVENT_CLASS(v4l2_hw_done_class,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles),
+
+	TP_STRUCT__entry(
+		__field(u32, tgid)
+		__field(u32, fd)
+		__field(u32, hw_cycles)
+	),
+
+	TP_fast_assign(
+		__entry->tgid = tgid;
+		__entry->fd = fd;
+		__entry->hw_cycles = hw_cycles;
+	),
+
+	TP_printk("tgid = %u, fd = %u, hw_cycles = %u",
+		  __entry->tgid, __entry->fd, __entry->hw_cycles)
+);
+
+DEFINE_EVENT(v4l2_hw_done_class, v4l2_hw_done,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */
-- 
2.53.0


