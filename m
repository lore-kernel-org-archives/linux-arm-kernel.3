Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5286C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mZm/Y7YVfF+nEcpgpSJB1Y57nWUjIF3vCADHLfVfnE=; b=3F2vHU+H6Xc5jO9SnRJ6BlbrwC
	92DRjlyVclsmWkjzHQaZ1eduqFQTAIlLaHGbsPCJk0Ws7BaUTCBAaKA/O7DYIoB0mj16lVpy6+d0s
	e+s0Xes60eVwW3EZPred6iY7e+yh5cn05QKTMZHcv3Uu1ZrYvTSuVlrrLHmoDDUTvpMUDgPsKdPur
	0yRzBJ3W4qtpDpF7djiBYjQTJTwzskhKmlmimopOv+lkUpnkNDRBK1EAJDTy93T3Sf6Pcn8M2OJe4
	La6AMN6rZKpQx9XHRRrA6oiDiHxwj1cD6KxJVVP3aSqMdle4tNUOCID5ZPKl6QngbplskH8U1LGk0
	AbIK7Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNQ-000000082qU-0ErH;
	Thu, 24 Jul 2025 17:05:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueweX-00000007hbi-0AhH;
	Thu, 24 Jul 2025 14:10:34 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4822511E6;
	Thu, 24 Jul 2025 16:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366189;
	bh=kncEHGUHBsOPEbj18mUjhjLaFdDTloHadGxnvcBRhXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gAaY+DbrTVEhRUog6Y1tHYj8lkp5ax+jymeQIs6+3uVtcn7z+YxFdusv8C4Qu/p64
	 gKFSZwqZFlEPAssB+7plXSZ8LZxHsnTuZ+tcQjNZ6hmfsZQOHe2cAJWD/uxI3SSIA6
	 8KcE9stVQFHHDqFTYV0pgQqAGPVTS+EfBy9Yw050=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:08 +0200
Subject: [PATCH v2 01/27] media: mc: Add per-file-handle data support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-1-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7105;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iZLPf77dc0oKef/FoIrNYxuY8wrefkX+9mbiaN7w1+U=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7OvS5BlVCgiF1gQqp9wy2UdrB4acbKilKqM
 fhKRME9Q1WJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zgAKCRByNAaPFqFW
 PFwnD/9tMm5RSk04hMUf0xgme2U3HQKA5jq+FX5aJPpIj4pNU9WjhDYPOKRXvTVrPqa2a87lE0v
 +2KyqJj0AYVdRG8PAqLIvfLgon0ttIlMHJRpsSY2XhX/KVhNtU78imxQsj+ZmR57o7IlKEfdaBE
 0NFZBgL4VmRkB0WSaM+sbMDdtsMBS+GVITGxu0FEH7bJTIGvqGADAoFfIZT3osz6ZL/ij4OS3lB
 Y48H7lRZXIP0m97d26Qiph5Fa6ff7BnPXdulyG0ImDbE0cD9s5ndZPq0MNqjUr8Kq/OlzMKPJhC
 u57FCHwiwiA8qdSK04kWtDA1cE99rYGYSYMHXJDkHjrvzHi4LEc74iCATILYLlGMT0LCh/7/Qht
 Oz81NzymhC8coQxkylalaxhNzT+rcLO+ylaeB/Kj3wALxleEQAXsKzhUrcKfyDq9t7h9ECOZUsa
 VGP9P5PX+OwHYRqZofSIToNxjcYSUpUmYWbjBd0YPdm6BfXs+fgT0bdDiPoanvhP23ifhPqWyml
 /JZoke8BMxkZq4gtEtCmq75MT4XgZ+tBnQF6KzRpHCxJv6Mi+U+YbdPsV1E0HxWl6/BlsN7H81u
 WvDeHEKvFwre4T5n12vQr6lfLAiy2wMd+8PobpzSyQNeCTeXuqK3fhXfJpGD1z23NS2r14CZLtz
 7/1Ne2kdcP5LNBQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071033_267151_A15ABACA 
X-CRM114-Status: GOOD (  22.46  )
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The media devnode core associates devnodes with files by storing the
devnode pointer in the file structure private_data field. In order to
allow tracking of per-file-handle data introduce a new media devnode
file handle structure that stores the devnode pointer, and store a
pointer to that structure in the file private_data field.

Users of the media devnode code (the only existing user being
media_device) are responsible for managing their own subclass of the
media_devnode_fh structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Prepare struct media_device_fh to be used for maintaining file handle list
to avoid shuffling things here and there right after.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/mc/mc-device.c  | 14 +++++++++++++-
 drivers/media/mc/mc-devnode.c | 20 +++++++++-----------
 include/media/media-device.h  |  7 +++++++
 include/media/media-devnode.h | 18 +++++++++++++++++-
 include/media/media-fh.h      | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index c0dd4ae5722725f1744bc6fd6282d5c765438059..f298f8f67b8a84194d66126461e84228c0b20394 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -22,6 +22,7 @@
 #include <media/media-device.h>
 #include <media/media-devnode.h>
 #include <media/media-entity.h>
+#include <media/media-fh.h>
 #include <media/media-request.h>
 
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -35,7 +36,6 @@
 #define MEDIA_ENT_SUBTYPE_MASK			0x0000ffff
 #define MEDIA_ENT_T_DEVNODE_UNKNOWN		(MEDIA_ENT_F_OLD_BASE | \
 						 MEDIA_ENT_SUBTYPE_MASK)
-
 /* -----------------------------------------------------------------------------
  * Userspace API
  */
@@ -47,11 +47,23 @@ static inline void __user *media_get_uptr(__u64 arg)
 
 static int media_device_open(struct file *filp)
 {
+	struct media_device_fh *fh;
+
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
+	if (!fh)
+		return -ENOMEM;
+
+	filp->private_data = &fh->fh;
+
 	return 0;
 }
 
 static int media_device_close(struct file *filp)
 {
+	struct media_device_fh *fh = media_device_fh(filp);
+
+	kfree(fh);
+
 	return 0;
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 56444edaf13651874331e7c04e86b0a585067d38..312eb48ffc2f2a0c013e4744204995df0ff5b12c 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -142,6 +142,7 @@ static long media_compat_ioctl(struct file *filp, unsigned int cmd,
 static int media_open(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode;
+	struct media_devnode_fh *fh;
 	int ret;
 
 	/* Check if the media device is available. This needs to be done with
@@ -162,17 +163,15 @@ static int media_open(struct inode *inode, struct file *filp)
 	get_device(&devnode->dev);
 	mutex_unlock(&media_devnode_lock);
 
-	filp->private_data = devnode;
-
-	if (devnode->fops->open) {
-		ret = devnode->fops->open(filp);
-		if (ret) {
-			put_device(&devnode->dev);
-			filp->private_data = NULL;
-			return ret;
-		}
+	ret = devnode->fops->open(filp);
+	if (ret) {
+		put_device(&devnode->dev);
+		return ret;
 	}
 
+	fh = filp->private_data;
+	fh->devnode = devnode;
+
 	return 0;
 }
 
@@ -181,8 +180,7 @@ static int media_release(struct inode *inode, struct file *filp)
 {
 	struct media_devnode *devnode = media_devnode_data(filp);
 
-	if (devnode->fops->release)
-		devnode->fops->release(filp);
+	devnode->fops->release(filp);
 
 	filp->private_data = NULL;
 
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 53d2a16a70b0d9d6e5cc28fe1fc5d5ef384410d5..2fc750efef7c43814f019f12078e9c96c1bd6bf9 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -108,6 +108,10 @@ struct media_device_ops {
  *		     other operations that stop or start streaming.
  * @request_id: Used to generate unique request IDs
  *
+ * @fh_list:	List of file handles in the media device
+ *		(struct media_device_fh.mdev_list).
+ * @fh_list_lock: Serialise access to fh_list list.
+ *
  * This structure represents an abstract high-level media device. It allows easy
  * access to entities and provides basic media device-level support. The
  * structure can be allocated directly or embedded in a larger structure.
@@ -180,6 +184,9 @@ struct media_device {
 
 	struct mutex req_queue_mutex;
 	atomic_t request_id;
+
+	struct list_head fh_list;
+	spinlock_t fh_list_lock;
 };
 
 /* We don't need to include usb.h here */
diff --git a/include/media/media-devnode.h b/include/media/media-devnode.h
index d27c1c646c2805171be3997d72210dd4d1a38e32..6c2e253dde498779dffd103dc5d00e50e14a0249 100644
--- a/include/media/media-devnode.h
+++ b/include/media/media-devnode.h
@@ -55,6 +55,20 @@ struct media_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * struct media_devnode_fh - Media device node file handle
+ * @devnode:	pointer to the media device node
+ *
+ * This structure serves as a base for per-file-handle data storage. Media
+ * device node users embed media_devnode_fh in their custom file handle data
+ * structures and store the media_devnode_fh in the file private_data in order
+ * to let the media device node core locate the media_devnode corresponding to a
+ * file handle.
+ */
+struct media_devnode_fh {
+	struct media_devnode *devnode;
+};
+
 /**
  * struct media_devnode - Media device node
  * @media_dev:	pointer to struct &media_device
@@ -146,7 +160,9 @@ void media_devnode_unregister(struct media_devnode *devnode);
  */
 static inline struct media_devnode *media_devnode_data(struct file *filp)
 {
-	return filp->private_data;
+	struct media_devnode_fh *fh = filp->private_data;
+
+	return fh->devnode;
 }
 
 /**
diff --git a/include/media/media-fh.h b/include/media/media-fh.h
new file mode 100644
index 0000000000000000000000000000000000000000..6f00744b81d6000a4b0c503fe6968dd7adcbb1c3
--- /dev/null
+++ b/include/media/media-fh.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Media device file handle
+ *
+ * Copyright (C) 2019--2023 Intel Corporation
+ */
+
+#ifndef MEDIA_FH_H
+#define MEDIA_FH_H
+
+#include <linux/list.h>
+#include <linux/file.h>
+
+#include <media/media-devnode.h>
+
+/**
+ * struct media_device_fh - File handle specific information on MC
+ *
+ * @fh: The media device file handle
+ * @mdev_list: This file handle in media device's list of file handles
+ */
+struct media_device_fh {
+	struct media_devnode_fh fh;
+	struct list_head mdev_list;
+};
+
+static inline struct media_device_fh *media_device_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct media_device_fh, fh);
+}
+
+#endif /* MEDIA_FH_H */

-- 
2.49.0


