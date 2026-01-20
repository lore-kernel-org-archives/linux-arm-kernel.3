Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B53D2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwXH04ojEJxzpdDZwfeULNXdgZ4dyhCYxfw3tXdVy3E=; b=nN3lL1E9J3lnmXlV+LtDIoHOxA
	JzFAILLmNSKkHfnyo6Q3oXWv/v05ValE5Jury+v1rYWzQi/39cu7VUYyTEHZ+l5/uA1YmCkuvUtpS
	ycUyH646H2lGnHSDx47dUVxbPody8Lu4pEadWPJ/dVcigdaV6rM2w3N8DVP7fFwK6AAjp+QnJ/hoD
	1+0Qr58bCHid3tXyasELpVbIlaEMlg+m/RFSdfZJwwKFkc1hfkmOa0MzeOc88AtPbJQWqa99X8PZU
	i8BAdchCcOaV1shY3FGsDAozN63kt9p5KmMu5M6wqDXPhE3vqQcXym0BaoxEd6B6pVQVKMza4bFWD
	DFYvI32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sw-00000003HZ6-3IVm;
	Tue, 20 Jan 2026 06:43:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sh-00000003HLO-14jx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:36 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id B615E20B716F;
	Mon, 19 Jan 2026 22:43:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B615E20B716F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891414;
	bh=FwXH04ojEJxzpdDZwfeULNXdgZ4dyhCYxfw3tXdVy3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IOvVNIdhQm1FzPXkTQDr6pHRkzL3ArhoH+uoR99cwC5MHH22g9j3Kl66U8jUWNDCP
	 k5Y9DlpfYNsMYamxE6UKNWHlrDXpfhR5dsom3uwq/vPtCAsjkiqt4DXdL6AWhq3aOF
	 L6r1zY4aWR9/vJsgZZzPvwf9FsiwH55J+H45oDPk=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 06/15] mshv: Implement mshv bridge device for VFIO
Date: Mon, 19 Jan 2026 22:42:21 -0800
Message-ID: <20260120064230.3602565-7-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224335_323717_C98260F5 
X-CRM114-Status: GOOD (  19.25  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

Add a new file to implement VFIO-MSHV bridge pseudo device. These
functions are called in the VFIO framework, and credits to kvm/vfio.c
as this file was adapted from it.

Original author: Wei Liu <wei.liu@kernel.org>
(Slightly modified from the original version).

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/hv/Makefile    |   3 +-
 drivers/hv/mshv_vfio.c | 210 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hv/mshv_vfio.c

diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index a49f93c2d245..eae003c4cb8f 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -14,7 +14,8 @@ hv_vmbus-y := vmbus_drv.o \
 hv_vmbus-$(CONFIG_HYPERV_TESTING)	+= hv_debugfs.o
 hv_utils-y := hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
 mshv_root-y := mshv_root_main.o mshv_synic.o mshv_eventfd.o mshv_irq.o \
-	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o
+	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o \
+               mshv_vfio.o
 mshv_vtl-y := mshv_vtl_main.o
 
 # Code that must be built-in
diff --git a/drivers/hv/mshv_vfio.c b/drivers/hv/mshv_vfio.c
new file mode 100644
index 000000000000..6ea4d99a3bd2
--- /dev/null
+++ b/drivers/hv/mshv_vfio.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * VFIO-MSHV bridge pseudo device
+ *
+ * Heavily inspired by the VFIO-KVM bridge pseudo device.
+ */
+#include <linux/errno.h>
+#include <linux/file.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/vfio.h>
+
+#include "mshv.h"
+#include "mshv_root.h"
+
+struct mshv_vfio_file {
+	struct list_head node;
+	struct file *file;	/* list of struct mshv_vfio_file */
+};
+
+struct mshv_vfio {
+	struct list_head file_list;
+	struct mutex lock;
+};
+
+static bool mshv_vfio_file_is_valid(struct file *file)
+{
+	bool (*fn)(struct file *file);
+	bool ret;
+
+	fn = symbol_get(vfio_file_is_valid);
+	if (!fn)
+		return false;
+
+	ret = fn(file);
+
+	symbol_put(vfio_file_is_valid);
+
+	return ret;
+}
+
+static long mshv_vfio_file_add(struct mshv_device *mshvdev, unsigned int fd)
+{
+	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
+	struct mshv_vfio_file *mvf;
+	struct file *filp;
+	long ret = 0;
+
+	filp = fget(fd);
+	if (!filp)
+		return -EBADF;
+
+	/* Ensure the FD is a vfio FD. */
+	if (!mshv_vfio_file_is_valid(filp)) {
+		ret = -EINVAL;
+		goto out_fput;
+	}
+
+	mutex_lock(&mshv_vfio->lock);
+
+	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
+		if (mvf->file == filp) {
+			ret = -EEXIST;
+			goto out_unlock;
+		}
+	}
+
+	mvf = kzalloc(sizeof(*mvf), GFP_KERNEL_ACCOUNT);
+	if (!mvf) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	mvf->file = get_file(filp);
+	list_add_tail(&mvf->node, &mshv_vfio->file_list);
+
+out_unlock:
+	mutex_unlock(&mshv_vfio->lock);
+out_fput:
+	fput(filp);
+	return ret;
+}
+
+static long mshv_vfio_file_del(struct mshv_device *mshvdev, unsigned int fd)
+{
+	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
+	struct mshv_vfio_file *mvf;
+	long ret;
+
+	CLASS(fd, f)(fd);
+
+	if (fd_empty(f))
+		return -EBADF;
+
+	ret = -ENOENT;
+	mutex_lock(&mshv_vfio->lock);
+
+	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
+		if (mvf->file != fd_file(f))
+			continue;
+
+		list_del(&mvf->node);
+		fput(mvf->file);
+		kfree(mvf);
+		ret = 0;
+		break;
+	}
+
+	mutex_unlock(&mshv_vfio->lock);
+	return ret;
+}
+
+static long mshv_vfio_set_file(struct mshv_device *mshvdev, long attr,
+			      void __user *arg)
+{
+	int32_t __user *argp = arg;
+	int32_t fd;
+
+	switch (attr) {
+	case MSHV_DEV_VFIO_FILE_ADD:
+		if (get_user(fd, argp))
+			return -EFAULT;
+		return mshv_vfio_file_add(mshvdev, fd);
+
+	case MSHV_DEV_VFIO_FILE_DEL:
+		if (get_user(fd, argp))
+			return -EFAULT;
+		return mshv_vfio_file_del(mshvdev, fd);
+	}
+
+	return -ENXIO;
+}
+
+static long mshv_vfio_set_attr(struct mshv_device *mshvdev,
+			      struct mshv_device_attr *attr)
+{
+	switch (attr->group) {
+	case MSHV_DEV_VFIO_FILE:
+		return mshv_vfio_set_file(mshvdev, attr->attr,
+					  u64_to_user_ptr(attr->addr));
+	}
+
+	return -ENXIO;
+}
+
+static long mshv_vfio_has_attr(struct mshv_device *mshvdev,
+			      struct mshv_device_attr *attr)
+{
+	switch (attr->group) {
+	case MSHV_DEV_VFIO_FILE:
+		switch (attr->attr) {
+		case MSHV_DEV_VFIO_FILE_ADD:
+		case MSHV_DEV_VFIO_FILE_DEL:
+			return 0;
+		}
+
+		break;
+	}
+
+	return -ENXIO;
+}
+
+static long mshv_vfio_create_device(struct mshv_device *mshvdev, u32 type)
+{
+	struct mshv_device *tmp;
+	struct mshv_vfio *mshv_vfio;
+
+	/* Only one VFIO "device" per VM */
+	hlist_for_each_entry(tmp, &mshvdev->device_pt->pt_devices,
+			     device_ptnode)
+		if (tmp->device_ops == &mshv_vfio_device_ops)
+			return -EBUSY;
+
+	mshv_vfio = kzalloc(sizeof(*mshv_vfio), GFP_KERNEL_ACCOUNT);
+	if (mshv_vfio == NULL)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&mshv_vfio->file_list);
+	mutex_init(&mshv_vfio->lock);
+
+	mshvdev->device_private = mshv_vfio;
+
+	return 0;
+}
+
+/* This is called from mshv_device_fop_release() */
+static void mshv_vfio_release_device(struct mshv_device *mshvdev)
+{
+	struct mshv_vfio *mv = mshvdev->device_private;
+	struct mshv_vfio_file *mvf, *tmp;
+
+	list_for_each_entry_safe(mvf, tmp, &mv->file_list, node) {
+		fput(mvf->file);
+		list_del(&mvf->node);
+		kfree(mvf);
+	}
+
+	kfree(mv);
+	kfree(mshvdev);
+}
+
+struct mshv_device_ops mshv_vfio_device_ops = {
+	.device_name = "mshv-vfio",
+	.device_create = mshv_vfio_create_device,
+	.device_release = mshv_vfio_release_device,
+	.device_set_attr = mshv_vfio_set_attr,
+	.device_has_attr = mshv_vfio_has_attr,
+};
-- 
2.51.2.vfs.0.1


