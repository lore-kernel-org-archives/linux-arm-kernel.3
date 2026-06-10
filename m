Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C29CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ryckc8T89O4CBJPFRhzNvRags6YVIQhSdyPAOsMx1do=; b=y9fEtw6oxRJmkpNYESwQyLhoCB
	hg3W5fAZKTu/HPSfCKc29jNJdj9/24K1Vmusmnso/QmNsxIIhvM7n0/lOfHeQ5sojkFQ8Kp8hfJdm
	oQR+qPZyn6eVfZHqEn1y5k4SsQ3aiN0BQf/GteFaTlBCl7+M7myBKIkeJCVlDRvtI5mWTalHbnHOu
	J2FjhLR79Pjg+4zVb666DY7+IgAti+GhUJxCgT5rg6hZ3dX/kLkNi9uszC2BkBbCcv3ZdAdRcjMoR
	ywe+qmK7FP8UySimDfGgzJWZST+DqIVUEvGWhQK5n7lsy6+I8hQmVXnutGrzSU1l5xsGHkO3I7RID
	Tn3P4kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0e-00000007ucH-1cE2;
	Wed, 10 Jun 2026 14:34:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK0Y-00000007uUn-0rSB;
	Wed, 10 Jun 2026 14:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102056;
	bh=HyWTbyGJ/YxiyOxTmP3CmKvqM9AIBkFvj7FncysHdAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IfVmDkwAqc9AuJSpvM75+MHT2eLaD4v72NesicHD/NAj39vPLvXfSntFvPn/0OjWA
	 PvQPGi8wjaZDg4mTJbkCtEkZGAYoROBbbRdggn3o2KRu7E6Tupgb1p+d55rryYzTCD
	 4KAoGF4R1pHSCm2PagoxV1d1IE8D9tLK1E/5d3Lxt326Kxe5a0R8+NN7QN1VoZ6wph
	 Zv2QnG6qiuqsQYu+NweViL0jSM+rgtivGGbUSGAm1vaLDLeLVl1sOHWLcXuw9T6siO
	 74F2J7JEgp3jriSfTkLtt7Oj6xRcO8n6znQHdxJHY3pOHz7k+PhyLbpkj6Bldvgg43
	 liljoxado1rQA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3996F17E0DE1;
	Wed, 10 Jun 2026 16:34:14 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:33 -0400
Subject: [PATCH v2 3/9] media: Add tgid and fd fields in v4l2_fh struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-3-9756edf72ac1@collabora.com>
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
X-CRM114-CacheID: sfid-20260610_073418_424312_E56E7A5C 
X-CRM114-Status: GOOD (  18.44  )
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

These fields will be used in traces to help userspace tracing tools
identify streams.

The tgid field will keep the PID of the process that opened the video
file.
That is needed because trace calls can happen in IRQs, for which there is
no current PID.

The fd field helps identify the context in case the same process opens the
video device multiple times.
Note that the fd field is set in the __video_do_ioctl() function.
That is because the file descriptor has not been allocated yet when
v4l2_open() is called.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 17 +++++++++++++++++
 include/media/v4l2-fh.h              |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..9c2ddd1c2137 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->available);
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
+	fh->tgid = current->tgid;
 	mutex_init(&fh->subscribe_lock);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..c8746a1637f5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/fdtable.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -3061,6 +3062,16 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
 }
 EXPORT_SYMBOL(v4l_printk_ioctl);
 
+static int _file_iterate(const void *priv, struct file *filp, unsigned int fd)
+{
+	const struct file *fh_filp = priv;
+
+	if (fh_filp == filp)
+		return fd;
+
+	return 0;
+}
+
 static long __video_do_ioctl(struct file *file,
 		unsigned int cmd, void *arg)
 {
@@ -3081,6 +3092,12 @@ static long __video_do_ioctl(struct file *file,
 		return ret;
 	}
 
+	if (unlikely(!vfh->fd)) {
+		vfh->fd = iterate_fd(current->files, 0, _file_iterate, file);
+		if (!vfh->fd)
+			vfh->fd = -1;
+	}
+
 	/*
 	 * We need to serialize streamon/off/reqbufs with queueing new requests.
 	 * These ioctls may trigger the cancellation of a streaming
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..4ef4e58ab8d1 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -28,6 +28,8 @@ struct v4l2_ctrl_handler;
  * @vdev: pointer to &struct video_device
  * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
  * @prio: priority of the file handler, as defined by &enum v4l2_priority
+ * @tgid: process id that initialized the v4l2_fh
+ * @fd: file descriptor associated to this v4l2_fh for the process id in tgid
  *
  * @wait: event' s wait queue
  * @subscribe_lock: serialise changes to the subscribed list; guarantee that
@@ -44,6 +46,8 @@ struct v4l2_fh {
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
 	enum v4l2_priority	prio;
+	uint32_t		tgid;
+	int			fd;
 
 	/* Events */
 	wait_queue_head_t	wait;

-- 
2.54.0


