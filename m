Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9705EE3695
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlZeOAlBdIWMXqoyMC8b0Kuyy+WaZNBkG6skws/Elhk=; b=t9cpdJfnCph8BRmdLoMr5Jze2e
	WXKrSXAlIXhRo6n+KDgi/Zkt5YvW0qyQNfMPJVesnrxpF7Hv7ywhGJV5lP1a+pB2Sdnh4E3yrfEfb
	OwSVCFPS8BDRLXCR53AOVeVnY2bTWn1NCG8vtdaZr+d5wPoNjvwFyhkh38yfglwyAOaEb2gaKyw0r
	CxXhhLXkHFVL6hg1ax4iMC4UeUZMMqFoBK9pYWszKJ3O/yuwGunMEuajhJTrXLXXf8K9g4Jf16zLR
	VH+rlSzKDKVFfEwWfLcgBmZDbz8kGV+VRRE199mXDByUusLBTH8ng8rJts7N7HWkkLxMNtVaPPkwm
	MMmfTDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZTr-00000002LBe-2cS9;
	Thu, 12 Feb 2026 16:23:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZTo-00000002L7S-1HsB;
	Thu, 12 Feb 2026 16:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913426;
	bh=b6iQGMkGcjBVVv0K+5rsTGEPunZ8R76rYg3Zy/SqlNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ruq7eDmdRq6+pPoP/6THf/N7FxwquhpvR0F6ZOqwcjxTrCvNXl4cfUjHQ4/4pSnya
	 ihWJ5BOEX92zJwzUHp83k0WClx4/2FNpzXdf2Z8uY+hday6c5vl99DjKnKigSVFvBJ
	 kUigE+Pjv0zx++qygsib2v8kp62t4XS+/jgjDaW2ceUu49FRffvGafaZI897jzI+tB
	 UedZlTCmobQWtYeql/qpNV8HtPA29MCbn1ICKleaTQ9X8lbp71d6AFepEmDIxWmYJ5
	 3gA+NiDmRYcRh0/MmS1DmjD8I1uDkAmNG+VRbzMR1Guiq9OyEVdzrH7wykwJlNLB+4
	 +susdeBZdtWBg==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D1C0217E1144;
	Thu, 12 Feb 2026 17:23:42 +0100 (CET)
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
Subject: [PATCH 03/11] media: Add tgid and fd fields in v4l2_fh struct
Date: Thu, 12 Feb 2026 11:23:20 -0500
Message-ID: <20260212162328.192217-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082348_489969_321B202C 
X-CRM114-Status: GOOD (  18.32  )
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
---
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 17 +++++++++++++++++
 include/media/v4l2-fh.h              |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index df3ba9d4674b..86e8223b46cb 100644
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
index 37d33d4a363d..a3b6df0571d6 100644
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
 	 * We need to serialize streamon/off with queueing new requests.
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
2.53.0


