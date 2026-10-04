Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC288CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBUAta3AECAv6EoOqKTZTc7jfrQb14aPOz5cl6oodcg=; b=z83Ntv2i74SyB7ts0dvIchE9tk
	xXhT4bZOiznhTH1aQjSBnGH09XBl4kUH6hVobMPkTcVmzvGIXwytLibH1W638LX5PF4qus7PbepHK
	3F2s9MKncpIJGeiNdmcwM+uURCLjd+qHpwpZdrkMJz3nxIb0PfC5RF9gX2XT4eA57aRqMAeTrLOPq
	MjP9rimjhkdkxmIZZerbOUCDqZq+1BpDrFR34eN7UGMwJaqRHJi1oM7PTjLCI+mNraLdoKm065Pxc
	BAM9GqDrZfM6AdLlw0mFCvlqTPQw4EqzH+62PYmAKZdKD8dYph9wPnibl6iqq8h5Jg5QYJtybKeG0
	VjWkUnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHBi-0000000EWE2-1dcc;
	Sun, 04 Oct 2026 08:03:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHBd-0000000EW7V-3iEw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:03:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 522C51A32;
	Sun,  4 Oct 2026 01:03:03 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE153F85F;
	Sun,  4 Oct 2026 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100986; bh=djk2TMlg4D+FVbf9sMtLwh0/nTNIfrlO2BNMYI9oLVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uD7AapQVCJnyO+CPyhEzfgsXP/o8RqIWnWMtQt+XKC0eibZq9yynWI1A0lhBq/nMx
	 EyYPPsPzd5jo+cdjNs1fehJo0BVF2GS3dJ+MQUsgQZe9N+yqCbxfktjA0wH41b7MQ7
	 2ffYv51a/NY9nko2ivcj11c+OpySVN3x7Pukoeq8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v13 16/25] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Sun,  4 Oct 2026 09:00:57 +0100
Message-ID: <20261004080106.3355393-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_010311_303838_BB1B2EFE 
X-CRM114-Status: GOOD (  17.25  )
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

Expose one debugfs entry for each discovered SHMTI that can be used to
dump the related SHMTI in binary form from TBGN up to TEND markers.

No processing is done kernel side, beside using proper accessors for
device memory.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - get inode lock on time update
v11 --> v12
 - fix debugfs shmti dump file to use the SID as name
v8 --> v9
 - use kvzalloc/kfree
 - use file_update_time to update debugfs file ts
v5 --> v6
 - added mutex to protect binary dump buffer during reads (Sashiko)
 - using debugfs_create_file_size() (Sashiko)
---
 drivers/firmware/arm_scmi/telemetry.c | 98 +++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 8ce6af2d01c7..f8c1ce966e51 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -9,10 +9,12 @@
 #include <linux/bitfield.h>
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/eventfd.h>
+#include <linux/fs.h>
 #include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
@@ -418,6 +420,14 @@ struct telemetry_shmti {
 	struct scmi_telemetry_shmti_info info;
 };
 
+struct scmi_telemetry_dbg_shmti {
+	struct telemetry_shmti *shmti;
+	size_t buf_sz;
+	void *buf;
+	/* Protect this descriptor from concurrent readers using it */
+	struct mutex mtx;
+};
+
 #define SHMTI_EPLG(s)						\
 	({							\
 		struct telemetry_shmti *_s = (s);		\
@@ -1520,6 +1530,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
 					ti->info.intervals);
 }
 
+static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob;
+	struct telemetry_shmti *shmti;
+
+	if (!inode->i_private)
+		return -ENODEV;
+
+	shmti = inode->i_private;
+	sblob = kzalloc_obj(*sblob);
+	if (!sblob)
+		return -ENOMEM;
+
+	sblob->shmti = shmti;
+	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
+	if (!sblob->buf) {
+		kfree(sblob);
+		return -ENOMEM;
+	}
+
+	mutex_init(&sblob->mtx);
+
+	filp->private_data = sblob;
+
+	return 0;
+}
+
+static ssize_t scmi_telemetry_dbg_shmti_read(struct file *filp, char __user *buf,
+					     size_t count, loff_t *ppos)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	/* Dump on first read and again after each rewind to start pos */
+	guard(mutex)(&sblob->mtx);
+	if (!sblob->buf_sz || *ppos == 0) {
+		struct inode *ino = file_inode(filp);
+
+		memcpy_fromio(sblob->buf, sblob->shmti->base,
+			      sblob->shmti->info.len);
+		sblob->buf_sz = sblob->shmti->info.len;
+		/* update inode timestamps */
+		inode_lock(ino);
+		file_update_time(filp);
+		inode_unlock(ino);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, sblob->buf, sblob->buf_sz);
+}
+
+static int scmi_telemetry_dbg_shmti_release(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	kvfree(sblob->buf);
+	kfree(sblob);
+
+	return 0;
+}
+
+static const struct file_operations scmi_telemetry_dbg_shmti_fops = {
+	.open = scmi_telemetry_dbg_shmti_open,
+	.release = scmi_telemetry_dbg_shmti_release,
+	.read = scmi_telemetry_dbg_shmti_read,
+	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
+};
+
+static void scmi_telemetry_debugfs_initialize(struct telemetry_info *ti)
+{
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct dentry *top, *shmti_top;
+
+	top = ph->hops->debugfs_proto_dentry_get(ph);
+	shmti_top = debugfs_create_dir("shmtis", top);
+
+	for (unsigned int i = 0; i < ti->num_shmti; i++) {
+		char id[16];
+
+		snprintf(id, 16, "%u", ti->shmti[i].info.sid);
+		debugfs_create_file_size(id, 0444, shmti_top, &ti->shmti[i],
+					 &scmi_telemetry_dbg_shmti_fops,
+					 ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -4373,6 +4468,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return 0;
 }
 
-- 
2.54.0


