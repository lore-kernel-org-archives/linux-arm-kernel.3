Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C434CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDPCL25gnw+u2t6ujB6bGPtisu3gsqaY1e1sRyp51y4=; b=lAcA2//jUJkt+q2+ZWJy3Zish6
	4hRIHlEIUZ/zRvHZR9qacLVGAAGzi0BEsph6K9OnOIAKaeL1wwxY4p3XkbF3FP7t8fwXHQY/psmIw
	BktHfMViIjHxdYh8n6y7CvKe6ES7nDS/9Zsu+PfIxWQXmCxajwh6LaXT4zxxFoCv3uYDcf3OeTlKO
	bplmdIcpMN6r+7HbAThuZCY3ly8JPnR6rKt6TZy8pFgzFj8D7S4Z4kWvDSqH8tPE1l8wIaQpwI/6Q
	HeTQ/cqxKPO1KxgFoCobLuPPR8Nvp6C2l6vGpol6mVAffy51UgWtQufVtLDvhSHoddgj9qawJnANg
	xAtOmINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lhl-000000087mb-1ZMr;
	Fri, 17 Oct 2025 14:45:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lhe-000000087iD-2xO6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:45:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9CE954E41147;
	Fri, 17 Oct 2025 14:45:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69A80606DB;
	Fri, 17 Oct 2025 14:45:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 223B9102F2361;
	Fri, 17 Oct 2025 16:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760712305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jDPCL25gnw+u2t6ujB6bGPtisu3gsqaY1e1sRyp51y4=;
	b=mV9sS67qVQgekEExCP6IXdkEdReXLj9v1xlnPzSU1C3W5iOlS26KNs7NavC9YPVkC2Z+18
	T6g3Sbuf7zOjjb6pgkdIjWLXndYB0x6L4UAl2fk/Ejbm9exSoCv9ILcSXIg0F4bKjY/X0u
	NIgZpR/zg0U3BobLwCohu9f+wc7VoPKksaFn91/QzCwaM7NJL13C4H8/37gPlVrjcuB9cR
	vh1xXef0wcvLd8y7pXUbrfcvY2HiNIQ0qPzEHruP13VIZuVxoBsVSGdWnGxdGLlgNJMIRt
	+0Ue0/SMLvLzoIvNt7tltLsLKIHXYRa5xTVmqpssWtd4HvID8p6JbHOCxQV8Ow==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Fri, 17 Oct 2025 16:44:51 +0200
Subject: [PATCH RFC 2/2] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-2-34d4339d247a@bootlin.com>
References: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com>
In-Reply-To: <20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_074513_480594_23C72BF3 
X-CRM114-Status: GOOD (  15.71  )
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

In BOARDCFG_MANAGED mode, the firmware cannot restore IRQs during
resume. This responsibility is delegated to the ti_sci driver,
which maintains an internal list of all requested IRQs. This list
is updated on each set/free operation, and all IRQs are restored
during the resume_noirq() phase.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 143 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index f9f1a67e8e66b0a4048fae04ce31be54ca5cba7a..a211f8805dd21c7675b8cefd61929ecfda8e0f7f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -87,6 +87,16 @@ struct ti_sci_desc {
 	int max_msg_size;
 };
 
+/**
+ * struct ti_sci_irq - Description of allocated irqs
+ * @list: List head
+ * @desc: Description of the irq
+ */
+struct ti_sci_irq {
+	struct list_head list;
+	struct ti_sci_msg_req_manage_irq desc;
+};
+
 /**
  * struct ti_sci_info - Structure representing a TI SCI instance
  * @dev:	Device pointer
@@ -101,6 +111,7 @@ struct ti_sci_desc {
  * @chan_rx:	Receive mailbox channel
  * @minfo:	Message info
  * @node:	list head
+ * @irqs:	List of allocated irqs
  * @host_id:	Host ID
  * @fw_caps:	FW/SoC low power capabilities
  * @users:	Number of users of this instance
@@ -117,6 +128,7 @@ struct ti_sci_info {
 	struct mbox_chan *chan_tx;
 	struct mbox_chan *chan_rx;
 	struct ti_sci_xfers_info minfo;
+	struct ti_sci_irq irqs;
 	struct list_head node;
 	u8 host_id;
 	u64 fw_caps;
@@ -2294,6 +2306,29 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
+ *                       compared)
+ * @irq_a:	irq_a to compare
+ * @irq_b:	irq_b to compare
+ *
+ * Return: true if the two irqs are equal, else false.
+ */
+static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq irq_a,
+			     struct ti_sci_msg_req_manage_irq irq_b)
+{
+	return irq_a.valid_params == irq_b.valid_params &&
+		irq_a.src_id == irq_b.src_id &&
+		irq_a.src_index == irq_b.src_index &&
+		irq_a.dst_id == irq_b.dst_id &&
+		irq_a.dst_host_irq == irq_b.dst_host_irq &&
+		irq_a.ia_id == irq_b.ia_id &&
+		irq_a.vint == irq_b.vint &&
+		irq_a.global_event == irq_b.global_event &&
+		irq_a.vint_status_bit == irq_b.vint_status_bit &&
+		irq_a.secondary_host == irq_b.secondary_host;
+}
+
 /**
  * ti_sci_set_irq() - Helper api to configure the irq route between the
  *		      requested source and destination
@@ -2317,15 +2352,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			  u16 dst_host_irq, u16 ia_id, u16 vint,
 			  u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq *desc;
+	struct ti_sci_irq *irq;
+	int ret;
+
 	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
 		 __func__, valid_params, src_id, src_index,
 		 dst_id, dst_host_irq, ia_id, vint, global_event,
 		 vint_status_bit);
 
-	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				 dst_id, dst_host_irq, ia_id, vint,
-				 global_event, vint_status_bit, s_host,
-				 TI_SCI_MSG_SET_IRQ);
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_SET_IRQ);
+
+	if (ret)
+		return ret;
+
+	irq = kzalloc(sizeof(*irq), GFP_KERNEL);
+	if (!irq)
+		return -ENOMEM;
+
+	desc = &irq->desc;
+	desc->valid_params = valid_params;
+	desc->src_id = src_id;
+	desc->src_index = src_index;
+	desc->dst_id = dst_id;
+	desc->dst_host_irq = dst_host_irq;
+	desc->ia_id = ia_id;
+	desc->vint = vint;
+	desc->global_event = global_event;
+	desc->vint_status_bit = vint_status_bit;
+	desc->secondary_host = s_host;
+
+	list_add(&irq->list, &info->irqs.list);
+
+	return 0;
 }
 
 /**
@@ -2351,15 +2414,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			   u16 dst_host_irq, u16 ia_id, u16 vint,
 			   u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct ti_sci_irq *this_irq;
+	struct list_head *this;
+	int ret;
+
 	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
 		 __func__, valid_params, src_id, src_index,
 		 dst_id, dst_host_irq, ia_id, vint, global_event,
 		 vint_status_bit);
 
-	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				 dst_id, dst_host_irq, ia_id, vint,
-				 global_event, vint_status_bit, s_host,
-				 TI_SCI_MSG_FREE_IRQ);
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_FREE_IRQ);
+
+	if (ret)
+		return ret;
+
+	irq_desc.valid_params = valid_params;
+	irq_desc.src_id = src_id;
+	irq_desc.src_index = src_index;
+	irq_desc.dst_id = dst_id;
+	irq_desc.dst_host_irq = dst_host_irq;
+	irq_desc.ia_id = ia_id;
+	irq_desc.vint = vint;
+	irq_desc.global_event = global_event;
+	irq_desc.vint_status_bit = vint_status_bit;
+	irq_desc.secondary_host = s_host;
+
+	list_for_each(this, &info->irqs.list) {
+		this_irq = list_entry(this, struct ti_sci_irq, list);
+		if (ti_sci_irq_equal(irq_desc, this_irq->desc)) {
+			list_del(&this_irq->list);
+			kfree(this_irq);
+			break;
+		}
+	}
+
+	return 0;
 }
 
 /**
@@ -3768,6 +3862,9 @@ static int ti_sci_suspend_noirq(struct device *dev)
 static int ti_sci_resume_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
+	struct ti_sci_msg_req_manage_irq *irq_desc;
+	struct ti_sci_irq *irq;
+	struct list_head *this;
 	int ret = 0;
 	u32 source;
 	u64 time;
@@ -3780,6 +3877,33 @@ static int ti_sci_resume_noirq(struct device *dev)
 			return ret;
 	}
 
+	switch (pm_suspend_target_state) {
+	case PM_SUSPEND_MEM:
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED) {
+			list_for_each(this, &info->irqs.list) {
+				irq = list_entry(this, struct ti_sci_irq, list);
+				irq_desc = &irq->desc;
+				ret = ti_sci_manage_irq(&info->handle,
+							irq_desc->valid_params,
+							irq_desc->src_id,
+							irq_desc->src_index,
+							irq_desc->dst_id,
+							irq_desc->dst_host_irq,
+							irq_desc->ia_id,
+							irq_desc->vint,
+							irq_desc->global_event,
+							irq_desc->vint_status_bit,
+							irq_desc->secondary_host,
+							TI_SCI_MSG_SET_IRQ);
+				if (ret)
+					return ret;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
 	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
 	/* Do not fail to resume on error as the wake reason is not critical */
 	if (!ret)
@@ -3961,6 +4085,9 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED)
+		INIT_LIST_HEAD(&info->irqs.list);
+
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 out:
 	if (!IS_ERR(info->chan_tx))

-- 
2.51.0


