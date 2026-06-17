Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61DCD98F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqp0D08wKwNqBYg3WSXhPKdH/yBbBzFozANWUcamqsQ=; b=NDXTY59hKVUS2rfxiir0Nly29v
	MdpQYfApo/QJhn6Wd8c39GXda/SArRPjK/ekFdrUs1zTAOooEZE/ytobKbvcGDn5qOErpHKWBEHWY
	tPZU00nk7FbqORhjcutC1FyFFclr0G7gMo9TIi8tLuG0Xnsor0emZcR4Ql67Mbqmvn55cH0UcT5AU
	jaWiqLOzgYK8gDOtPtTKsk8L4Jb7qmgIMCzWmoI2qjulVwYzyIBeTeTjlS7aewSVe6c2UzSg19cNe
	D87pN6yNZuXz25TTfySV/fkFurT/U+dx8zIxM6/V/LiO6bIWPchJh3HZFKQX5I+XfZLA8LHGOuTE9
	7BS46zfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujS-000000009Hl-0GyK;
	Wed, 17 Jun 2026 18:11:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujN-000000009Du-3kWk;
	Wed, 17 Jun 2026 18:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719875;
	bh=YnqoAsM+n7/rUu05Sgxly+qH8JSizCmB9lhmFd3tT2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gOqVGTrkfd23DUjiBDe/loQZbClcq/e4CcjS/0n4LbNsGdqsF0eJPm4GPV/r1y211
	 YMUk//TSjNgrE2MZ/uw2GRFTG0w5Im5L744yigFL7lLkaYsiK4iASCkMxb63Lo1zDr
	 IhWq5ar5m8HZgkojnxEtYHDWncmbRPBVw+P+iu/3ugbLANI8dl6LF2Ypz/5aFgN5y/
	 rVeIPRqkHIzVHLxIhxitFP3YtmfjNih7RBEFxvGlVDdpesg1A04m4L3Zv5fuDcGcmw
	 Go6ItiY3WUxe/LA+Mjkl1xJhqVdq030m8g8SqSM/Kq5oJD47AbiG9TtWJ3uguoOtHu
	 mG2kvMnBCyRmg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2374117E0C54;
	Wed, 17 Jun 2026 20:11:14 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:58 -0400
Subject: [PATCH v2 3/5] media: v4l2-core: Add v4l2-stats interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-3-d298e98ce06a@collabora.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_111118_115159_AED71D61 
X-CRM114-Status: GOOD (  18.66  )
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

Provide helpers for media drivers to set fdinfo data and print the
key:value pairs in a standard way.

User drivers can set stats values with helpers like:
 - v4l2_stats_update_hw_usage
 - v4l2_stats_set_media_dev_type

And also call the show helpers from their show_fdinfo callback with:
 - v4l2_stats_show -- Shows the values set previously
 - v4l2_stats_show_clock -- Shows the main clock state.

The show_clock helper is used instead of updating a clock value in
v4l2_stats for the following reasons:
 - Clocks are at the device level, this is not a per-fd information
 - This avoids having clock references in v4l2-core
 - Drivers can use different approaches to manage clocks
   (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
 - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
   want something close to what DRM does and centralizing information has
   its advantages for userspace tooling.

In DRM the key:value pair format for clocks is documented and each driver
can write them directly based on that.
In this case, provide a helper and document the format.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/Makefile     |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c   |  2 ++
 drivers/media/v4l2-core/v4l2-fh.c    |  3 ++
 drivers/media/v4l2-core/v4l2-stats.c | 65 ++++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h              |  2 ++
 include/media/v4l2-stats.h           | 44 ++++++++++++++++++++++++
 6 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..20e1ab74ac09 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
 tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
-			v4l2-event.o v4l2-subdev.o v4l2-common.o \
+			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-stats.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 3878fa2ff73e..3e7a6876dffd 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
 
+	seq_printf(m, "media-driver:\t%s\n", vdev->v4l2_dev->name);
+
 	if (vdev->fops->show_fdinfo)
 		vdev->fops->show_fdinfo(m, filp);
 }
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..1b655672c718 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-stats.h>
 
 void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 {
@@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
 	mutex_init(&fh->subscribe_lock);
+	v4l2_stats_init(&fh->stats);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
@@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
 	v4l2_event_unsubscribe_all(fh);
 	mutex_destroy(&fh->subscribe_lock);
 	fh->vdev = NULL;
+	v4l2_stats_exit(&fh->stats);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_exit);
 
diff --git a/drivers/media/v4l2-core/v4l2-stats.c b/drivers/media/v4l2-core/v4l2-stats.c
new file mode 100644
index 000000000000..93e64ef2e7bb
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-stats.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * v4l2-stats.c
+ *
+ * V4L2 statistics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <linux/seq_file.h>
+#include <linux/clk.h>
+#include <media/v4l2-stats.h>
+
+static const char * const dev_type_name[] = {
+	[MEDIA_DEV_TYPE_V4L2] = "media",
+	[MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER] = "encoder",
+	[MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER] = "decoder",
+};
+
+void v4l2_stats_init(struct v4l2_stats *stats)
+{
+	stats->hw_usage_time = 0;
+	stats->media_dev_type = MEDIA_DEV_TYPE_V4L2;
+}
+
+void v4l2_stats_exit(struct v4l2_stats *stats)
+{
+}
+
+void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time)
+{
+	stats->hw_usage_time += usage_time;
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_update_hw_usage);
+
+void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type)
+{
+	if (type >= MEDIA_DEV_TYPE_COUNT)
+		return;
+
+	stats->media_dev_type = type;
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_set_media_dev_type);
+
+void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m)
+{
+	seq_printf(m, "media-type:\t%s\n", dev_type_name[stats->media_dev_type]);
+	seq_printf(m, "media-engine-usage:\t%llu ns\n", stats->hw_usage_time);
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_show);
+
+void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk)
+{
+	seq_printf(m, "media-maxfreq:\t%lu Hz\n",
+		   clk_get_rate(clk));
+	seq_printf(m, "media-curfreq:\t%lu Hz\n",
+		   clk_get_rate(clk));
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_show_clock);
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..ae6688722bee 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -17,6 +17,7 @@
 #include <linux/kconfig.h>
 #include <linux/list.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-stats.h>
 
 struct video_device;
 struct v4l2_ctrl_handler;
@@ -43,6 +44,7 @@ struct v4l2_fh {
 	struct list_head	list;
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
+	struct v4l2_stats	stats;
 	enum v4l2_priority	prio;
 
 	/* Events */
diff --git a/include/media/v4l2-stats.h b/include/media/v4l2-stats.h
new file mode 100644
index 000000000000..d580933c4181
--- /dev/null
+++ b/include/media/v4l2-stats.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * v4l2-stats.h
+ *
+ * V4L2 statistics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+#ifndef V4L2_STATS_H
+#define V4L2_STATS_H
+
+#include <linux/types.h>
+
+struct clk;
+struct seq_file;
+
+enum v4l2_media_dev_type {
+	MEDIA_DEV_TYPE_V4L2 = 0,
+	MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER,
+	MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER,
+
+	MEDIA_DEV_TYPE_COUNT,
+};
+
+struct v4l2_stats {
+	u64 hw_usage_time;
+	enum v4l2_media_dev_type media_dev_type;
+};
+
+void v4l2_stats_init(struct v4l2_stats *stats);
+void v4l2_stats_exit(struct v4l2_stats *stats);
+
+void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time);
+void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type);
+
+void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m);
+void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk);
+
+#endif /* V4L2_STATS_H */

-- 
2.54.0


