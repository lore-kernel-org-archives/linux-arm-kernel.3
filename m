Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF78FD7077
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icbOpmynuUfLAeiPDpArH81UXKGBjTOCaXIZ9GzuaaI=; b=GV9pL3WgHCcC/w
	qA+0YnV8ZetNsvC/0ZWEJxgRpLOgoA/3Y8jBXLrzAq5AZc4lt3EoAOZzlcuhlQ0HHsbRlObKS3D64
	DHBGMg4u8O0BmeBsSgoaSoH692hR/sPPXa2SQoBThskiq+iEZPqww0MPoFTiIjMjBpjzvb8UH9zUX
	6ckRNmnWkK1l8omUKpKsCmHe8b9qbtEicwR8vTKkz+mQVOdOM1bXuhQwXI1zx+o8kEn8KJNr85D83
	8drmUfygtBjLH+Xju+u2b1+5AW6A38Xie77r3C84xjIRbL55Y94F8wxGklRchTUYUvk2NosUXShFy
	lQUUqRNdFuQetvdHz83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rkc-000000062Fp-3L0S;
	Tue, 17 Mar 2026 10:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkX-000000062Bn-2qkv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=icbOpmynuUfLAeiPDpArH81UXKGBjTOCaXIZ9GzuaaI=; b=J3UOTjfd+CFqE4esbeSIgd1Jh7
	b+3TqW8kRApuLkX3vwKFIQ7n7yxFCHFMGtBpBQNXRcIjhVMGUeyY0QmOlTHPUFp7+Yj206poVzzJn
	vlU7G4JVs0SK4wcoP2J6mVMSq1hfzUiNak6SEKbHFPbQBoZ8/7IerwhzYQqhs7IAjVP+ok2N02xVw
	4Twp9Hcmxpp+1yO8XQPeCxZnp/EdUf3myIVCGFwXTWcvfIKlQ/p3yBqNYZWzVaJua+UQdlKbkJT2r
	Sphkn01vkL9tVxDQmWe9ynPyIt5mXRFGT5/vfet9Qgp60V4AUhSUU1+y2+LHswR92F6ZzUVEeRoye
	0rC/Jn2g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkS-00000008iMw-1Dqz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:34:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0A61477;
	Tue, 17 Mar 2026 03:33:57 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402483F7BD;
	Tue, 17 Mar 2026 03:34:01 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 8/8] firmware: smccc: lfa: introduce SMC access lock
Date: Tue, 17 Mar 2026 11:33:34 +0100
Message-ID: <20260317103336.1273582-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_103405_131721_5C5111F3 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

After a successful live activation, the list of firmware images might
change, which also affects the sequence IDs. We store the sequence
ID in a data structure and connect it to its GUID, which is the
identifier used to access certain image properties from userland.
When an activation is happening, the sequence ID associations might
change at any point, so we must be sure to not use any previously
learned sequence ID during this time.

Protect the association between a sequence ID and a firmware image
(its GUID, really) by a reader/writer lock. In this case it's a R/W
semaphore, so it can sleep and we can hold it for longer, also
concurrent SMC calls are not blocked on each other, it's just an
activation that blocks calls.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 38 +++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index ecd056901b8d..663ba79f0713 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/psci.h>
+#include <linux/rwsem.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
@@ -157,6 +158,16 @@ static struct workqueue_struct *fw_images_update_wq;
 static struct work_struct fw_images_update_work;
 static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
 
+/*
+ * A successful image activation might change the number of available images,
+ * leading to a re-order and thus re-assignment of the sequence IDs.
+ * The lock protects the connection between a firmware image (through its
+ * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
+ * a sequence ID needs to take the readers lock. Doing an activation requires
+ * the writer lock, as that process might change the assocications.
+ */
+struct rw_semaphore smc_lock;
+
 static const struct attribute_group image_attr_group = {
 	.attrs = image_default_attrs,
 };
@@ -253,6 +264,7 @@ static unsigned long get_nr_lfa_components(void)
 	reg.a0 = LFA_1_0_FN_GET_INFO;
 	reg.a1 = 0; /* lfa_info_selector = 0 */
 
+	/* No need for the smc_lock, since no sequence IDs are involved. */
 	arm_smccc_1_2_invoke(&reg, &reg);
 	if (reg.a0 != LFA_SUCCESS)
 		return reg.a0;
@@ -265,9 +277,11 @@ static int lfa_cancel(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 };
 
+	down_read(&smc_lock);
 	reg.a0 = LFA_1_0_FN_CANCEL;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 
 	/*
 	 * When firmware activation is called with "skip_cpu_rendezvous=1",
@@ -332,6 +346,7 @@ static int activate_fw_image(struct fw_image *image)
 	int ret;
 
 retry:
+	down_write(&smc_lock);
 	if (image->cpu_rendezvous_forced || image->cpu_rendezvous)
 		ret = stop_machine(call_lfa_activate, image, cpu_online_mask);
 	else
@@ -339,10 +354,13 @@ static int activate_fw_image(struct fw_image *image)
 
 	if (!ret) {
 		update_fw_images_tree();
+		up_write(&smc_lock);
 
 		return 0;
 	}
 
+	up_write(&smc_lock);
+
 	if (ret == -LFA_CALL_AGAIN) {
 		/* SMC returned with call_again flag set */
 		if (ktime_before(ktime_get(), end)) {
@@ -383,8 +401,11 @@ static int prime_fw_image(struct fw_image *image)
 	 * be called again.
 	 * reg.a1 will become 0 once the prime process completes.
 	 */
+	down_read(&smc_lock);
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &res);
+	up_read(&smc_lock);
+
 	if ((long)res.a0 < 0) {
 		pr_err("LFA_PRIME for image %s failed: %s\n",
 		       get_image_name(image),
@@ -429,7 +450,7 @@ static ssize_t activation_capable_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", image->activation_capable);
 }
 
-static void update_fw_image_pending(struct fw_image *image)
+static void _update_fw_image_pending(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
 
@@ -441,6 +462,13 @@ static void update_fw_image_pending(struct fw_image *image)
 		image->activation_pending = !!(reg.a3 & BIT(1));
 }
 
+static void update_fw_image_pending(struct fw_image *image)
+{
+	down_read(&smc_lock);
+	_update_fw_image_pending(image);
+	up_read(&smc_lock);
+}
+
 static ssize_t activation_pending_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -515,9 +543,11 @@ static ssize_t pending_version_show(struct kobject *kobj,
 	 * Similar to activation pending, this value can change following an
 	 * update, we need to retrieve fresh info instead of stale information.
 	 */
+	down_read(&smc_lock);
 	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 	if (reg.a0 == LFA_SUCCESS) {
 		if (reg.a5 != 0 && image->activation_pending) {
 			u32 maj, min;
@@ -749,6 +779,7 @@ static int activate_pending_image(void)
 	struct fw_image *image;
 	int ret;
 
+	down_read(&smc_lock);
 	spin_lock(&lfa_kset->list_lock);
 	list_for_each_entry(kobj, &lfa_kset->list, entry) {
 		image = kobj_to_fw_image(kobj);
@@ -756,7 +787,7 @@ static int activate_pending_image(void)
 		if (image->fw_seq_id == -1)
 			continue; /* Invalid FW component */
 
-		update_fw_image_pending(image);
+		_update_fw_image_pending(image);
 		if (image->activation_capable && image->activation_pending &&
 		    image->auto_activate) {
 			found_pending = true;
@@ -764,6 +795,7 @@ static int activate_pending_image(void)
 		}
 	}
 	spin_unlock(&lfa_kset->list_lock);
+	up_read(&smc_lock);
 
 	if (!found_pending)
 		return -ENOENT;
@@ -950,6 +982,8 @@ static int __init lfa_init(void)
 	 */
 	lfa_dev = faux_device_create("arm-lfa", NULL, &lfa_device_ops);
 
+	init_rwsem(&smc_lock);
+
 	err = update_fw_images_tree();
 	if (err != 0) {
 		kset_unregister(lfa_kset);
-- 
2.43.0


