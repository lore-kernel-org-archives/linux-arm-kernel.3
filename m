Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF62DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mZm/Y7YVfF+nEcpgpSJB1Y57nWUjIF3vCADHLfVfnE=; b=Ckmefv337Ya33WGSQLjRXNJTl9
	lSXVdmr4RhgidU9qJPzKzzMa4IkZhFIP+kH/5qGbRHnxLtSuv+ULZ6XkFhn1V2dl33hG86eFEpZRC
	4DHO8TSGu//jsPNv4PduyO/6CsYnxFUg44gvz+KkoZKQEqBVZ9xpHFFAr57KG5iSfReyAFfYJ4Brq
	qX6bJkH1QNsC1FwIDW6Abo8Z7Q70OD/jD7uyXq+NxQoVZSUTRlsl4lTxuPINRW3bdgzJD2JokJa2W
	5VRtxKzf31br1rwGsQOVN6qRdoT/lDFQjc1VWBm6mV8C0CqGVC8RyeR1/CmZUmHNvInNqAm0+4YIi
	3pvbPyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMhW-00000009yCX-3eRb;
	Thu, 17 Jul 2025 11:22:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7V-00000009sdx-082V;
	Thu, 17 Jul 2025 10:45:46 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3928A1FA4;
	Thu, 17 Jul 2025 12:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749107;
	bh=kncEHGUHBsOPEbj18mUjhjLaFdDTloHadGxnvcBRhXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e6/zFHNNGGMuH9U9zuz8Y32+ZXvmPUdFLcgoaUGTzzI7yudysa2ihXzwZ0ROlRTlg
	 VtzvEKB/c3xWVUziYbinIGVaZztT69TdZmXTe6Hpb6GzwdOerHBlL+sZJJK0Tmibs/
	 uzKT1zKYrc61H11U42cD4rnoSEyJIsULmvDVrhf8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:27 +0200
Subject: [PATCH 01/26] media: mc: Add per-file-handle data support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-1-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRObO3WXVK5YuwGNfryMHoO0eT2HGz8KOkkO
 MoxoOP2EUWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTgAKCRByNAaPFqFW
 PB3qD/sHu7AvE8eTIOkPKtlkTHw4fCK4Ra3kALeaaL6nydbMc5ghfVmAgfX8uSjA1Sii5UBXIr1
 WW12rKwYIpjl4VM1OSCQ/aA2pKCksaJReYzHumMCR5E47ocMHEsH1S/07zXiMpy85pCMUn/JnBP
 vsjzArG/VzsGi+hgcG0KHxFpYKx0dncGf9ZR+skWqO+OctpySVJwPfzMkzGXhixn45qal+xzLBX
 dI56Mr67KoUr1Grw6UH8S11LZ5KcvfZZ1qydxPeVV72dY6IkcbaSto6w72pKW7m2n3h0r+q6UMb
 jnLV0RUimUfEkaMOEPsmpgKIDvCazpP4VahoLZ0Vd/e+1WkygfkSbS7Jdja6szY3UNfLxFNRjpy
 qt6B6FdUjyUnanVZ4LWJJDzfIChBHLoojJXO50eEHTuCXcH3ybNOxxFpvqu1u6AAwpb2b+iuUc3
 w4P+ZZRcZ8N2VlcuwtbyumX7x1yIlTEQqks+H5F3pTL3jXLgXO6WEH1Y5xmrldia70zceJOBNAW
 XFGPcTraBODKmoCO3aH7IKamJ5Q8wJhvhVFur5pE+3eINwSTILE90fdLdw510CtbpdYkslq1d2h
 ekSePo711T/X5zejFK9dzGnjBBmMItdhIKirYJrb3TR1la23SkplncwTJ6B+FJFI3/OOVy6V6Jc
 uh1xtgaem0c0Oyw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034545_361702_244A32AD 
X-CRM114-Status: GOOD (  22.08  )
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


