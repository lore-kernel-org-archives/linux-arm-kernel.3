Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0370AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE3n1MQHeBEZIJeRhlEmDATcaZYVPoxlFf67C9rUYLU=; b=DRtYIogORKIGyEM52WhamD62Z3
	FQ5bz66dd4iwtB9VE+39Kq4J9lsjSWGEV9gU7MXrrvGU1dWMWc0jKKkf8t1M0ArpWfXagqtBXRkGC
	B9QZh2yQzmoVGQH5w1dT/ps17/eRzhPFU/abThxIKTob2f2asTKSmaaLPL64z9oe4TUpsEits2GkR
	fgLRvrE/tmyfp/xmSFzAedP5YBTRI2E00S0m6WUO/Q3ebxQCo3ySex9sHKGOahM3yLqk2Jrn4D42R
	tmpPheb7TAsMi5WEV2p2O1Q15o6QBhaGB/B2ZCu0PrbyUtPt/eXO4sDJn1zJkfJgmYcmks/2E+hDc
	CaYiJSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9F-00000006xnI-0fzf;
	Fri, 03 Jul 2026 12:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9C-00000006xhx-1pZX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 12:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XE3n1MQHeBEZIJeRhlEmDATcaZYVPoxlFf67C9rUYLU=; b=KUU8nW7VlluH2n6RfB+sw2KX9u
	DxJATSb2DZCJTDLL3Ro2YoMYbqmDQ1RimbxYRSXiZAGVUXqFYEF7dNeHztzAFuGmmb5PQsjDv8zAi
	xE/Kn4xV3XVOiBNcjm7FXWLOKV+5f28nwLfS6Ao6b1NNsan9RBUQLOUwJIRvg877Ug1Bxl0+EDWcK
	dRgMULkLu17Mz+3mffDHt1ZSgy/JSyQEnYRVzvY3w/g+XZLfNU3NAhvxfdY9ljUtPmBjbZiHwtRsN
	uKhb1YxTLk4eBdTa70TB0aPdiW3rjiwuf/lMcwkFE+dpIF1Xa0JBR/J7fPR4Wnbdhm3oASSArY0OL
	d7Ey8msQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfd99-00000004oxf-1jh0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F943463D;
	Fri,  3 Jul 2026 05:37:26 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E77563FAA1;
	Fri,  3 Jul 2026 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082250; bh=Stq5ITq3d09AjUvd+Rpis8aRqelVoFM1D6B+D60/jcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXFuWcQ2TBKS54du/1t9C7KiESejIqc39bjWBHSkCHO8DHnhZ4t1wmetIywbYTbrn
	 s0tM0ZCu2dPbzKrsddRhRxYgynMLJX3BoOMdymeAUcWzLQCN4RN7UvVA24/99CspCO
	 KUs5SaWz5+EHZ3BnQgHBEocniE50S6HYZzJ2hcYY=
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
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 16/23] firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
Date: Fri,  3 Jul 2026 13:35:54 +0100
Message-ID: <20260703123601.381275-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133731_802534_04EF1E67 
X-CRM114-Status: GOOD (  16.14  )
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
 drivers/firmware/arm_scmi/telemetry.c | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index f54e7d262f7f..163098985a26 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -11,6 +11,8 @@
 #include <linux/compiler_types.h>
 #include <linux/completion.h>
 #include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/limits.h>
@@ -369,6 +371,12 @@ struct telemetry_shmti {
 	struct scmi_telemetry_shmti_info info;
 };
 
+struct scmi_telemetry_dbg_shmti {
+	struct telemetry_shmti *shmti;
+	size_t buf_sz;
+	void *buf;
+};
+
 #define SHMTI_EPLG(s)						\
 	({							\
 		struct telemetry_shmti *_s = (s);		\
@@ -1297,6 +1305,86 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
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
+	sblob->buf = kzalloc(shmti->info.len, GFP_KERNEL);
+	if (!sblob->buf) {
+		kfree(sblob);
+		return -ENOMEM;
+	}
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
+	if (!sblob->buf_sz || *ppos == 0) {
+		memcpy_fromio(sblob->buf, sblob->shmti->base,
+			      sblob->shmti->info.len);
+		sblob->buf_sz = sblob->shmti->info.len;
+		/* update inode timestamps */
+		simple_inode_init_ts(file_inode(filp));
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, sblob->buf, sblob->buf_sz);
+}
+
+static int scmi_telemetry_dbg_shmti_release(struct inode *inode, struct file *filp)
+{
+	struct scmi_telemetry_dbg_shmti *sblob = filp->private_data;
+
+	kfree(sblob->buf);
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
+		struct dentry *d;
+		char id[16];
+
+		snprintf(id, 16, "%u", i);
+		d = debugfs_create_file(id, 0444, shmti_top, &ti->shmti[i],
+					&scmi_telemetry_dbg_shmti_fops);
+		if (!IS_ERR(d))
+			i_size_write(d->d_inode, ti->shmti[i].info.len);
+	}
+}
+
 static int iter_shmti_update_state(struct scmi_iterator_state *st,
 				   const void *response, void *priv)
 {
@@ -3212,6 +3300,9 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 				 "Could NOT register Telemetry notifications\n");
 	}
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		scmi_telemetry_debugfs_initialize(ti);
+
 	return ret;
 }
 
-- 
2.54.0


