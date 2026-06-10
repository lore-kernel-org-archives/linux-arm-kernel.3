Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D84CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2a9j9tc0vdTIn0r3QRLHmWfB8XhGCUxqt7/Bnyq/as=; b=nRUPhpb/s/CzElsuC+x6ayEf65
	bKlbzLhmb4wHuQh1HqNThtvqDKRp2azC9MuxgiQgVPJJ/XkncXYDlRtE0fobgiXZP5kL3L83rn+8L
	Ad90jQB5Np2Z+Nry1jOgHslsteRsdVk0POOp1HKp1yDmztaXNQXtEpaxhfbnUIymxTtDfZgLZm1Rl
	F2h1l2FnLIq4ZZD5AKvmFx6fyCa37Gwpixt+PoHOSxxDAmjBS2gg4eUp466OV3tTliQJZnj5VUM6V
	AJA5gofYRCsbvOa2jxZZFs1REHDI25bi3NfF3OL9HwLMttxy+BNylvsslRq0tKeme/CV+4VaB3YMd
	/il1u6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0m-00000007us4-2m7j;
	Wed, 10 Jun 2026 14:34:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0i-00000007ugS-1LUh;
	Wed, 10 Jun 2026 14:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102065;
	bh=imIJfpRcOAXZkKMN35QT7SUgXw4VKmoxeFQ2uczhIcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fFW6RbZSPilm5GxZYrBFfAt7g7lwLPUUIKf0dJGMrgXVngRFn6RzJdpzpkcLEQdjb
	 N2jI1RbHnxKhNNtHPZR2+nMFAFOzwnDBs6yjZK7WALOmFEecwGDmVH0eptfAXp5vab
	 63CrE6aYFmJvlIZmGb3YEjXQM2pV0tQLIQ/umgRXVQE2v5vtcBiwTcY7zMSOyBoydi
	 N3RcHJH68fS4LjplhVUI8b3Rnv7oebKJ+cZ+h28nkl5gY8WqK3D1AEPWZ86OghOXms
	 hUyCRrVk9AvaK3eDG1CgF8+8JlnxwkvKmfr8W09O0/Dcd3coq1S87glW8OYgVVmUPE
	 sb0CXxPppt27Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A2C017E1168;
	Wed, 10 Jun 2026 16:34:23 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:37 -0400
Subject: [PATCH v2 7/9] media: Add stream on/off traces and run them in the
 ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-7-9756edf72ac1@collabora.com>
References: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
In-Reply-To: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
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
X-CRM114-CacheID: sfid-20260610_073428_595946_107DD445 
X-CRM114-Status: GOOD (  14.04  )
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

This will automatically add stream on/off tracing for all v4l2 drivers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 20 +++++++++++++++++--
 include/trace/events/v4l2.h          | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index c8746a1637f5..b09489baff3e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1963,13 +1963,29 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
 static int v4l_streamon(const struct v4l2_ioctl_ops *ops, struct file *file,
 			void *arg)
 {
-	return ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	int err;
+
+	err = ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
+
+	if (!err)
+		trace_v4l2_streamon(fh->tgid, fh->fd);
+
+	return err;
 }
 
 static int v4l_streamoff(const struct v4l2_ioctl_ops *ops, struct file *file,
 			 void *arg)
 {
-	return ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	int err;
+
+	err = ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
+
+	if (!err)
+		trace_v4l2_streamoff(fh->tgid, fh->fd);
+
+	return err;
 }
 
 static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 248bc09bfc99..e5b80aeecc30 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -262,6 +262,43 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+
+/* Events for stream on/off.
+ *
+ * These events will be fired every time userspace starts or stops a stream.
+ * tgid and fd are used to identify the process that opened the video device.
+ *
+ * Note that this even can be fired multiple times for a given tgid/fd pair.
+ * E.g.: mem2mem drivers expect stream on/off on both output and capture queues.
+ */
+DECLARE_EVENT_CLASS(v4l2_stream_class,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd),
+
+	TP_STRUCT__entry(
+		__field(u32, tgid)
+		__field(u32, fd)
+	),
+
+	TP_fast_assign(
+		__entry->tgid = tgid;
+		__entry->fd = fd;
+	),
+
+	TP_printk("tgid = %u, fd = %u",
+		  __entry->tgid, __entry->fd)
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamon,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.54.0


