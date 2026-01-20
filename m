Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874A0D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpXyH34CFeKZeTaTWBElXlgUbMpP958BejYtbygF9WU=; b=K/s8QspJxMZ/hIZW3Bv6/IbCZt
	ogz7y8Y+xIN/SSc9qCFFi9nYfuMfLV3dc1ALOzZftZ/nLvZ06Ib6R6JFPYr+GV6Olvl1uqTiKPHl/
	mkiDJ/auNHf9omZFPIdhDpBCsjmI7MjI91r2deI7RQDtoAKvrlvxMFrgTBq9skWD6Vx84lGcFUPt4
	uc92VPXD8qMfKyuGpDgtO7aUuWEnv81ZhDqPyj3hhJiX3B9iHSVm09RmDQ6zcydYWeah46qbjc0Wi
	LQPn36FYHybT/sQvDOrfJa52NwEK1t9PNc0zLdTi0HcLo3h2t5LsK+ZdLO8/acuPFYw0elacQMsc+
	8Zt3Tk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sx-00000003HZY-0cLG;
	Tue, 20 Jan 2026 06:43:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Si-00000003HMp-0BbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:37 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id F3B4F20B7170;
	Mon, 19 Jan 2026 22:43:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F3B4F20B7170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891415;
	bh=zpXyH34CFeKZeTaTWBElXlgUbMpP958BejYtbygF9WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XooknD8V3y1L7GC5cut7FI2hLyVvn6UK2r3zNP70pOOrJOGkL2XgdHyUFQhkvqH+s
	 a2RAD3LH4gUbnfx4u/9xJnauVpk+rbZvmVon1tdkvwqWrzcIdMVTfcOr9i82ENiIG+
	 9hTmsE68dqA36HuiiMpMrCAkEEFwOF3W1KpplTro=
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
Subject: [PATCH v0 07/15] mshv: Add ioctl support for MSHV-VFIO bridge device
Date: Mon, 19 Jan 2026 22:42:22 -0800
Message-ID: <20260120064230.3602565-8-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224336_105770_82706B44 
X-CRM114-Status: GOOD (  15.57  )
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

Add ioctl support for creating MSHV devices for a paritition. At
present only VFIO device types are supported, but more could be
added. At a high level, a partition ioctl to create device verifies
it is of type VFIO and does some setup for bridge code in mshv_vfio.c.
Adapted from KVM device ioctls.

Credits: Original author: Wei Liu <wei.liu@kernel.org>
NB: Slightly modified from the original version.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/hv/mshv_root_main.c | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 83c7bad269a0..27313419828d 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -1551,6 +1551,129 @@ mshv_partition_ioctl_initialize(struct mshv_partition *partition)
 	return ret;
 }
 
+static long mshv_device_attr_ioctl(struct mshv_device *mshv_dev, int cmd,
+				   ulong uarg)
+{
+	struct mshv_device_attr attr;
+	const struct mshv_device_ops *devops = mshv_dev->device_ops;
+
+	if (copy_from_user(&attr, (void __user *)uarg, sizeof(attr)))
+		return -EFAULT;
+
+	switch (cmd) {
+	case MSHV_SET_DEVICE_ATTR:
+		if (devops->device_set_attr)
+			return devops->device_set_attr(mshv_dev, &attr);
+		break;
+	case MSHV_HAS_DEVICE_ATTR:
+		if (devops->device_has_attr)
+			return devops->device_has_attr(mshv_dev, &attr);
+		break;
+	}
+
+	return -EPERM;
+}
+
+static long mshv_device_fop_ioctl(struct file *filp, unsigned int cmd,
+				  ulong uarg)
+{
+	struct mshv_device *mshv_dev = filp->private_data;
+
+	switch (cmd) {
+	case MSHV_SET_DEVICE_ATTR:
+	case MSHV_HAS_DEVICE_ATTR:
+		return mshv_device_attr_ioctl(mshv_dev, cmd, uarg);
+	}
+
+	return -ENOTTY;
+}
+
+static int mshv_device_fop_release(struct inode *inode, struct file *filp)
+{
+	struct mshv_device *mshv_dev = filp->private_data;
+	struct mshv_partition *partition = mshv_dev->device_pt;
+
+	if (mshv_dev->device_ops->device_release) {
+		mutex_lock(&partition->pt_mutex);
+		hlist_del(&mshv_dev->device_ptnode);
+		mshv_dev->device_ops->device_release(mshv_dev);
+		mutex_unlock(&partition->pt_mutex);
+	}
+
+	mshv_partition_put(partition);
+	return 0;
+}
+
+static const struct file_operations mshv_device_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = mshv_device_fop_ioctl,
+	.release = mshv_device_fop_release,
+};
+
+long mshv_partition_ioctl_create_device(struct mshv_partition *partition,
+					void __user *uarg)
+{
+	long rc;
+	struct mshv_create_device devargk;
+	struct mshv_device *mshv_dev;
+	const struct mshv_device_ops *vfio_ops;
+	int type;
+
+	if (copy_from_user(&devargk, uarg, sizeof(devargk))) {
+		rc = -EFAULT;
+		goto out;
+	}
+
+	/* At present, only VFIO is supported */
+	if (devargk.type != MSHV_DEV_TYPE_VFIO) {
+		rc = -ENODEV;
+		goto out;
+	}
+
+	if (devargk.flags & MSHV_CREATE_DEVICE_TEST) {
+		rc = 0;
+		goto out;
+	}
+
+	mshv_dev = kzalloc(sizeof(*mshv_dev), GFP_KERNEL_ACCOUNT);
+	if (mshv_dev == NULL) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	vfio_ops = &mshv_vfio_device_ops;
+	mshv_dev->device_ops = vfio_ops;
+	mshv_dev->device_pt = partition;
+
+	rc = vfio_ops->device_create(mshv_dev, type);
+	if (rc < 0) {
+		kfree(mshv_dev);
+		goto out;
+	}
+
+	hlist_add_head(&mshv_dev->device_ptnode, &partition->pt_devices);
+
+	mshv_partition_get(partition);
+	rc = anon_inode_getfd(vfio_ops->device_name, &mshv_device_fops,
+			      mshv_dev, O_RDWR | O_CLOEXEC);
+	if (rc < 0) {
+		mshv_partition_put(partition);
+		hlist_del(&mshv_dev->device_ptnode);
+		vfio_ops->device_release(mshv_dev);
+		goto out;
+	}
+
+	devargk.fd = rc;
+	rc = 0;
+
+	if (copy_to_user(uarg, &devargk, sizeof(devargk))) {
+		rc = -EFAULT;
+		goto out;
+	}
+out:
+	return rc;
+}
+
 static long
 mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
@@ -1587,6 +1710,9 @@ mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	case MSHV_ROOT_HVCALL:
 		ret = mshv_ioctl_passthru_hvcall(partition, true, uarg);
 		break;
+	case MSHV_CREATE_DEVICE:
+		ret = mshv_partition_ioctl_create_device(partition, uarg);
+		break;
 	default:
 		ret = -ENOTTY;
 	}
-- 
2.51.2.vfs.0.1


