Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDA4D2ED11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPdcZ3oYYb4ZG+PhlxYF87J7HHXsFXSeD2DjQ2CVDUs=; b=d4csFz2yiAlAuxK3uUlt5bC0Xp
	i68zYHjaay+ESejeZCC+eu2wmxk/W8cKZ+vHgQWDyAKeKh9NKRC3xNaw9OYDZ91RzbNotSVNfNq+l
	BnNuwlX0XzFno+kLuPKQczjFQ45kXmZUKghQVIpJw6n0rPusoYuecKH9k89Agv5PFS+xxhioz4o8d
	BrcWzfg3i4pXipnwm3gdbcMw4W9g6QgxlK/64Clq+Cd0zzQlNeUAk/zqUyg340MonWIcGMAsRgVQj
	Y2kkfPQ60Eb+bIvrOW3NVgzXKUhMq9Tz9cnuyNmG0k8dVymqf9Ozxtr/c6Sm7vM0w7sfTN6ui/7GH
	Yo0o1jfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sj-00000003HPZ-3Ti9;
	Tue, 20 Jan 2026 06:43:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sf-00000003HMp-35yB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:34 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 54B4720B716E;
	Mon, 19 Jan 2026 22:43:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 54B4720B716E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891413;
	bh=FPdcZ3oYYb4ZG+PhlxYF87J7HHXsFXSeD2DjQ2CVDUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiATsc3swd7iNJmjeFF3w4IDEsPYdWmb2J6SCPlMQQO32Pnrw5LP6U52eGSSappj2
	 TqyitrZ2rdhmWEEejwZfN2zcFSnJKFrZOP8otPcC8LrvT3klwyLhWnqRm1HiJDYpAf
	 xzPjuypRaaY68PG9Ltq37rP3R3k62wGFPm9I0euY=
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
Subject: [PATCH v0 05/15] mshv: Declarations and definitions for VFIO-MSHV bridge device
Date: Mon, 19 Jan 2026 22:42:20 -0800
Message-ID: <20260120064230.3602565-6-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224333_805954_B77153F9 
X-CRM114-Status: GOOD (  11.13  )
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

Add data structs needed by the subsequent patch that introduces a new
module to implement VFIO-MSHV pseudo device.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/hv/mshv_root.h    | 23 +++++++++++++++++++++++
 include/uapi/linux/mshv.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/hv/mshv_root.h b/drivers/hv/mshv_root.h
index c3753b009fd8..42e1da1d545b 100644
--- a/drivers/hv/mshv_root.h
+++ b/drivers/hv/mshv_root.h
@@ -220,6 +220,29 @@ struct port_table_info {
 	};
 };
 
+struct mshv_device {
+	const struct mshv_device_ops *device_ops;
+	struct mshv_partition *device_pt;
+	void *device_private;
+	struct hlist_node device_ptnode;
+};
+
+struct mshv_device_ops {
+	const char *device_name;
+	long (*device_create)(struct mshv_device *dev, u32 type);
+	void (*device_release)(struct mshv_device *dev);
+	long (*device_set_attr)(struct mshv_device *dev,
+				struct mshv_device_attr *attr);
+	long (*device_has_attr)(struct mshv_device *dev,
+				struct mshv_device_attr *attr);
+};
+
+extern struct mshv_device_ops mshv_vfio_device_ops;
+int mshv_vfio_ops_init(void);
+void mshv_vfio_ops_exit(void);
+long mshv_partition_ioctl_create_device(struct mshv_partition *partition,
+					void __user *user_args);
+
 int mshv_update_routing_table(struct mshv_partition *partition,
 			      const struct mshv_user_irq_entry *entries,
 			      unsigned int numents);
diff --git a/include/uapi/linux/mshv.h b/include/uapi/linux/mshv.h
index dee3ece28ce5..b7b10f9e2896 100644
--- a/include/uapi/linux/mshv.h
+++ b/include/uapi/linux/mshv.h
@@ -252,6 +252,7 @@ struct mshv_root_hvcall {
 #define MSHV_GET_GPAP_ACCESS_BITMAP	_IOWR(MSHV_IOCTL, 0x06, struct mshv_gpap_access_bitmap)
 /* Generic hypercall */
 #define MSHV_ROOT_HVCALL		_IOWR(MSHV_IOCTL, 0x07, struct mshv_root_hvcall)
+#define MSHV_CREATE_DEVICE		_IOWR(MSHV_IOCTL, 0x08, struct mshv_create_device)
 
 /*
  ********************************
@@ -402,4 +403,34 @@ struct mshv_sint_mask {
 /* hv_hvcall device */
 #define MSHV_HVCALL_SETUP        _IOW(MSHV_IOCTL, 0x1E, struct mshv_vtl_hvcall_setup)
 #define MSHV_HVCALL              _IOWR(MSHV_IOCTL, 0x1F, struct mshv_vtl_hvcall)
+
+/* device passhthru */
+#define MSHV_CREATE_DEVICE_TEST		1
+
+enum {
+	MSHV_DEV_TYPE_VFIO,
+	MSHV_DEV_TYPE_MAX,
+};
+
+struct mshv_create_device {
+	__u32	type;	     /* in: MSHV_DEV_TYPE_xxx */
+	__u32	fd;	     /* out: device handle */
+	__u32	flags;	     /* in: MSHV_CREATE_DEVICE_xxx */
+};
+
+#define MSHV_DEV_VFIO_FILE      1
+#define MSHV_DEV_VFIO_FILE_ADD	1
+#define MSHV_DEV_VFIO_FILE_DEL	2
+
+struct mshv_device_attr {
+	__u32	flags;		/* no flags currently defined */
+	__u32	group;		/* device-defined */
+	__u64	attr;		/* group-defined */
+	__u64	addr;		/* userspace address of attr data */
+};
+
+/* Device fds created with MSHV_CREATE_DEVICE */
+#define MSHV_SET_DEVICE_ATTR	_IOW(MSHV_IOCTL, 0x00, struct mshv_device_attr)
+#define MSHV_HAS_DEVICE_ATTR	_IOW(MSHV_IOCTL, 0x01, struct mshv_device_attr)
+
 #endif
-- 
2.51.2.vfs.0.1


