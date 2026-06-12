Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5CFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzeSy3OuMWqjXFm50tlFHc/ka5zNG1NXgfkNjH2Hvds=; b=DTp6ZPeszlkbkOUXhx6zie/Aoi
	UnoOu1XFQNFEyIzzpTYG8f19bHwyHeFt9tu7UxlENQEbxXYsq+u+RTgsBAidd0Mf+jCUG+ZJLkymM
	C2KV/aC+UUfDrnMUR2bWITUbZPxxCJa4bD0U6KuV5Nr+8gjjO5+vWBdlkis7yz9+Yqv4t834MfbMS
	mfB2ZMEJ0QvVuz7u8sAfWRKFshJTLqHbTIllb2ZpeYjKEcp02gP19eT2TIZM0jV0SwpwQQIeMpC1f
	0BRmGJgfVIjwtDmJTm2Ahk2yqG3Pqje5v/IcZMKdCAyIjHkDtnvzcQDhMRa3nYiNAdW1aKxTjywWP
	AegZ5RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAYL-0000000Bhic-3ey2;
	Fri, 12 Jun 2026 22:40:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAYA-0000000BhT3-2WZV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:40:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71DF4A09;
	Fri, 12 Jun 2026 15:40:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0B103FB7F;
	Fri, 12 Jun 2026 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304029; bh=GI0vwR1LEStmargetn1ql1v3LHVWj/3AFAUhwSQd72k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gPZUchLafmLmBTG6kU1XxPqRe5FZiTCIOutLUAYXpDRSVnwCv/siq+mk6Ghh0tIQq
	 xzSi4vWou+YoRuAEGKyrrBAZYIOXRXqQO+8GZVsqPNnLqn22bE58SsPjlDmUW+UXh8
	 M0U/7Qqc9TeITAG3++SznwWKjEA1q9pcngEehzZY=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
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
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 27/31] firmware: arm_scmi: stlmfs: Add generation file
Date: Fri, 12 Jun 2026 23:37:57 +0100
Message-ID: <20260612223802.1337232-28-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_154030_734893_B329B8F8 
X-CRM114-Status: GOOD (  13.24  )
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

Add a read-only generation file to be used for monitoring configuration
changes across an instance: first read after the open returns the current
value, then it blocks till next confiuration change is detected.

Generation file supports also poll system call to monitor chamges.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - added stlmfs tag in $SUBJECT
---
 .../firmware/arm_scmi/scmi_system_telemetry.c | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
index c83d9763d479..df45fc212e13 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -19,12 +19,14 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/poll.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/wait.h>
 
 #include <uapi/linux/scmi.h>
 
@@ -1368,6 +1370,91 @@ static const struct file_operations available_interv_fops = {
 	.release = scmi_tlm_priv_release,
 };
 
+struct scmi_tlm_gen_priv {
+	unsigned int last_seen;
+	struct wait_queue_head *wq;
+	struct scmi_tlm_buffer tb;
+};
+
+static int scmi_tlm_generation_open(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(ino);
+	struct scmi_tlm_setup *tsp = tlmi->tsp;
+	struct scmi_tlm_gen_priv *gen;
+
+	gen = kzalloc_obj(*gen);
+	if (!gen)
+		return -ENOMEM;
+
+	gen->wq = tsp->ops->event_wq_get(tsp->ph);
+	if (!gen->wq) {
+		kfree(gen);
+		return -ENOMEM;
+	}
+
+	gen->last_seen = SCMI_TLM_GENERATION_INVALID;
+	filp->private_data = gen;
+
+	return nonseekable_open(ino, filp);
+}
+
+static ssize_t
+scmi_tlm_generation_read(struct file *filp, char __user *buf,
+			 size_t count, loff_t *ppos)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+	struct scmi_telemetry_info *info = (struct scmi_telemetry_info *)tlmi->priv;
+	unsigned int c;
+
+	if (*ppos == gen->tb.used)
+		gen->tb.used = *ppos = 0;
+
+	if (!gen->tb.used) {
+		int ret;
+
+		ret = wait_event_interruptible(*gen->wq,
+					       (c = atomic_read(&info->generation)) !=
+					       gen->last_seen);
+		if (ret)
+			return -ERESTARTSYS;
+
+		gen->last_seen = c;
+		gen->tb.used = scnprintf(gen->tb.buf, SCMI_TLM_MAX_BUF_SZ, "%u\n", c);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, gen->tb.buf, gen->tb.used);
+}
+
+static __poll_t scmi_tlm_generation_poll(struct file *filp, poll_table *wait)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
+	struct scmi_telemetry_info *info = (struct scmi_telemetry_info *)tlmi->priv;
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+
+	poll_wait(filp, gen->wq, wait);
+	if (atomic_read(&info->generation) != gen->last_seen)
+		return EPOLLIN | EPOLLRDNORM;
+
+	return 0;
+}
+
+static int scmi_tlm_generation_release(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+
+	kfree(gen);
+
+	return 0;
+}
+
+static const struct file_operations generation_fops = {
+	.open = scmi_tlm_generation_open,
+	.read = scmi_tlm_generation_read,
+	.poll = scmi_tlm_generation_poll,
+	.release = scmi_tlm_generation_release,
+};
+
 static const struct scmi_tlm_class tlm_tops[] = {
 	TLM_ANON_CLASS("all_des_enable", TLM_IS_STATE,
 		       S_IFREG | 0666, &all_des_fops, NULL),
@@ -1383,6 +1470,8 @@ static const struct scmi_tlm_class tlm_tops[] = {
 		       S_IFREG | 0444, &de_impl_vers_fops, NULL),
 	TLM_ANON_CLASS("tlm_enable", 0,
 		       S_IFREG | 0666, &tlm_enable_fops, NULL),
+	TLM_ANON_CLASS("generation", 0,
+		       S_IFREG | 0444, &generation_fops, NULL),
 	TLM_ANON_CLASS(NULL, 0, 0, NULL, NULL),
 };
 
-- 
2.54.0


