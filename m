Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7C0C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvdZUX0l4cd+ylAABJxQg390G4+5Q/O6H9vExdJFkvI=; b=bm9SyJbjhApN55
	rRzyqc/RgB/U7kq286xA0U0KW4FNgbDVW4s3doAwnHvstZyA8dkStXcJv1P2bL3TwUWo11kcvgz90
	ElwmVB4AFi8MQ0laGA2WRmbCId5YApEom21WOm1WAAj+cCmA8wQjE00z6Pb4HC8maW3fos+pQrQWu
	w7i5WXqqNzMN5zPclVSQ2vAfxIvIz0jBwKQtYXaPYkGOypywZh2rj3CrNz9HORVT3oyjgvIfTbXW3
	jDWZ/BpPwmzugWt/LY7B+tZtxydOPAmalTmHVKj5FGdStNKO1OAxJV6fF//jWfWTQA4310OuT8J2C
	QaSh2sWPdOUptNGO6Qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdd-0000000CeKs-2PJR;
	Mon, 06 Jul 2026 13:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdb-0000000CeHa-1MNj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 13:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zvdZUX0l4cd+ylAABJxQg390G4+5Q/O6H9vExdJFkvI=; b=KWH/W8fgXEJUikhTmd9NH7vfzF
	Nt/paETNMraQUsRyVd7XlcrH8JICvJtKl51mCGStx4qScCW/bHUOb+oEURxWiV1zWL7uBi52k8tWC
	0/kBeJqmvffI/+mlT5J0yExycTpPM75x3D3YjYZJbW+xncG7b7HSPVt7sEdCs2ttH7y+5fsxf1MK9
	V77NkyRyRJhOUH+Hmy9EkrwhvWhNbFY20+6SjxOh60B/7AY1WL1bR5JwEPBhBfiQ8W2iPWXWHLPHj
	aB6X4NZDvE7ezY7pH8AQ4Ojl94ltZvvvRfm3G2KkCgw8M3gZMgY6PQQH2v9Ha2i+RFTE0oIQKaKW8
	/ddZ0P4w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgjdY-00000006bkc-0u5e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:45:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472D12BCB;
	Mon,  6 Jul 2026 06:45:22 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 175673F7B4;
	Mon,  6 Jul 2026 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345526; bh=eWM2Uc20uezc/VY2nEKwIedQtKj3pH+Xyrai98h2U9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmP8xkZKjMdEGH/xJL05qB6qpzyYIDNShAIuw3f+1C16ziPXsw3PU3FUik3NhM4/S
	 nHmF3D7VAE9uHlkKwLZH0UC5VeYRZ6Htr45/6XbNYxkrOCMF3zhNpl4npxTTar1CAs
	 e6NDUaKXc7kSGJ6QAdaWPxoTX/1VdTkT0aeS/uko=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 7/8] firmware: smccc: lfa: introduce SMC access lock
Date: Mon,  6 Jul 2026 15:44:47 +0200
Message-ID: <20260706134455.132091-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144528_686149_6857E4D6 
X-CRM114-Status: GOOD (  25.06  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
index 2a9c2a90b1bb..44f8baec4c92 100644
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
@@ -145,6 +146,16 @@ static struct workqueue_struct *fw_images_update_wq;
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
@@ -241,6 +252,7 @@ static unsigned long get_nr_lfa_components(void)
 	reg.a0 = ARM_SMCCC_LFA_GET_INFO;
 	reg.a1 = 0; /* lfa_info_selector = 0 */
 
+	/* No need for the smc_lock, since no sequence IDs are involved. */
 	arm_smccc_1_2_invoke(&reg, &reg);
 	if (reg.a0 != LFA_SUCCESS)
 		return reg.a0;
@@ -261,9 +273,11 @@ static int lfa_cancel(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 };
 
+	down_read(&smc_lock);
 	reg.a0 = ARM_SMCCC_LFA_CANCEL;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 
 	/*
 	 * When firmware activation is called with "skip_cpu_rendezvous=1",
@@ -320,6 +334,7 @@ static int activate_fw_image(struct fw_image *image)
 	int ret;
 
 retry:
+	down_write(&smc_lock);
 	if (image->cpu_rendezvous_forced || image->cpu_rendezvous)
 		ret = stop_machine(call_lfa_activate, image, cpu_online_mask);
 	else
@@ -327,10 +342,13 @@ static int activate_fw_image(struct fw_image *image)
 
 	if (!ret) {
 		update_fw_images_tree();
+		up_write(&smc_lock);
 
 		return 0;
 	}
 
+	up_write(&smc_lock);
+
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
 	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
 		if (ktime_before(ktime_get(), end)) {
@@ -370,8 +388,11 @@ static int prime_fw_image(struct fw_image *image)
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
@@ -418,7 +439,7 @@ static ssize_t activation_capable_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", image->activation_capable);
 }
 
-static void update_fw_image_pending(struct fw_image *image)
+static void _update_fw_image_pending(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
 
@@ -430,6 +451,13 @@ static void update_fw_image_pending(struct fw_image *image)
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
@@ -504,9 +532,11 @@ static ssize_t pending_version_show(struct kobject *kobj,
 	 * Similar to activation pending, this value can change following an
 	 * update, we need to retrieve fresh info instead of stale information.
 	 */
+	down_read(&smc_lock);
 	reg.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
 	reg.a1 = image->fw_seq_id;
 	arm_smccc_1_2_invoke(&reg, &reg);
+	up_read(&smc_lock);
 	if (reg.a0 == LFA_SUCCESS) {
 		if (reg.a5 != 0 && image->activation_pending) {
 			u32 maj, min;
@@ -740,6 +770,7 @@ static int activate_pending_image(void)
 	struct fw_image *image;
 	int ret;
 
+	down_read(&smc_lock);
 	spin_lock(&lfa_kset->list_lock);
 	list_for_each_entry(kobj, &lfa_kset->list, entry) {
 		image = kobj_to_fw_image(kobj);
@@ -747,7 +778,7 @@ static int activate_pending_image(void)
 		if (image->fw_seq_id == -1)
 			continue; /* Invalid FW component */
 
-		update_fw_image_pending(image);
+		_update_fw_image_pending(image);
 		if (image->activation_capable && image->activation_pending &&
 		    image->auto_activate) {
 			found_pending = true;
@@ -755,6 +786,7 @@ static int activate_pending_image(void)
 		}
 	}
 	spin_unlock(&lfa_kset->list_lock);
+	up_read(&smc_lock);
 
 	if (!found_pending)
 		return -ENOENT;
@@ -901,6 +933,8 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		return -ENOMEM;
 	}
 
+	init_rwsem(&smc_lock);
+
 	err = update_fw_images_tree();
 	if (err != 0) {
 		kset_unregister(lfa_kset);
-- 
2.43.0


