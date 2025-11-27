Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD4FD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vgi5wrrdV1ygbhZyb38shFie4x9TYtnZLYRYrla8kxQ=; b=GjATmMvTJ3FBCiUD9CQNc24JK0
	zCoX3B7xNvdNdRcCwVSG1P4c/w4i6cl7XZjNHRJ2tWf5TFhChuvZ0yt3r2UroIgLsLkiHv4aPwnzk
	sKAFHat05n6ZJHjZEiKNa+R2u0rYAOaJKdv5p9WBGdvJfwyDwFuxduQQyIAYW+j4YE2MhE45ViID4
	xOHQbehJq/MkyID3QeyHoAY5vrZg0dL8iWORbTxpyHtUdB8WRSEGf4b72lSqHezRwQD/7+D4pwmen
	473wK6fDLHZhPgx8ZlyWun6ySmJbJ82fHT5WLzgQ2NBHb8HWQ86lOg6upjdNoSibRqXb1xym2JU1x
	4kWOGiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXXH-0000000GDdz-0RAJ;
	Thu, 27 Nov 2025 08:39:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXX4-0000000GDZu-1ivV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:39:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0143EC16A18;
	Thu, 27 Nov 2025 08:38:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C95466068C;
	Thu, 27 Nov 2025 08:39:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A44C102F2750;
	Thu, 27 Nov 2025 09:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vgi5wrrdV1ygbhZyb38shFie4x9TYtnZLYRYrla8kxQ=;
	b=nWBIAIC4vi683ZtYZ/BHzJS+AVicNwyF82A74nKdKfPiRFhJMIdoubYBoN0YHy02w37H/j
	AAq8Zm8K1IhzZtF560QQxx1/UpaO/tVHqVr6askqpST04OObBJdeqm/gPFaoqWp2hsot3G
	BY2YzM5m/iopQHYZ6EW7Zo9laYBfN6SMEudnWBeX6IphvDgmq6YOSTrMV+eqElQe3GqbHE
	5hJIWxWq31uuOBALj4sp2VQGM8H9YuAUhzPKFC85A1IudmK2hjWeCJnwppFlCqzY7eKuLl
	d3+tfKn0WARy45XgVpiPoXQWAshMj8GjZ5N0O7KwFiDnwcIwQ8kmOq0vjiA0hg==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:56 +0100
Subject: [PATCH RFC v2 2/4] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-2-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003918_936239_99538A37 
X-CRM114-Status: GOOD (  19.18  )
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
 drivers/firmware/ti_sci.c | 147 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 138 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 4afe1c4872ff8..a4d28f37b58ae 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -12,6 +12,7 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
+#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -87,6 +88,16 @@ struct ti_sci_desc {
 	int max_msg_size;
 };
 
+/**
+ * struct ti_sci_irq - Description of allocated irqs
+ * @node: Link to hash table
+ * @desc: Description of the irq
+ */
+struct ti_sci_irq {
+	struct hlist_node node;
+	struct ti_sci_msg_req_manage_irq desc;
+};
+
 /**
  * struct ti_sci_info - Structure representing a TI SCI instance
  * @dev:	Device pointer
@@ -101,6 +112,7 @@ struct ti_sci_desc {
  * @chan_rx:	Receive mailbox channel
  * @minfo:	Message info
  * @node:	list head
+ * @irqs:	List of allocated irqs
  * @host_id:	Host ID
  * @fw_caps:	FW/SoC low power capabilities
  * @users:	Number of users of this instance
@@ -117,6 +129,7 @@ struct ti_sci_info {
 	struct mbox_chan *chan_tx;
 	struct mbox_chan *chan_rx;
 	struct ti_sci_xfers_info minfo;
+	DECLARE_HASHTABLE(irqs, 8);
 	struct list_head node;
 	u8 host_id;
 	u64 fw_caps;
@@ -2294,6 +2307,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
+ * @irq:	irq to hash
+ *
+ * Return: the computed hash value.
+ */
+static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
+{
+	return irq->src_id ^ irq->src_index;
+}
+
+/**
+ * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
+ *                       compared)
+ * @irq_a:	irq_a to compare
+ * @irq_b:	irq_b to compare
+ *
+ * Return: true if the two irqs are equal, else false.
+ */
+static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
+			     struct ti_sci_msg_req_manage_irq *irq_b)
+{
+	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
+		       sizeof(*irq_a) - sizeof(irq_a->hdr));
+}
+
 /**
  * ti_sci_set_irq() - Helper api to configure the irq route between the
  *		      requested source and destination
@@ -2317,15 +2356,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
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
+	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
+
+	return 0;
 }
 
 /**
@@ -2351,15 +2418,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
 			   u16 dst_host_irq, u16 ia_id, u16 vint,
 			   u16 global_event, u8 vint_status_bit, u8 s_host)
 {
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct ti_sci_irq *this_irq;
+	struct hlist_node *tmp_node;
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
+	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
+				    ti_sci_irq_hash(&irq_desc)) {
+		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
+			hlist_del(&this_irq->node);
+			kfree(this_irq);
+			return 0;
+		}
+	}
+
+	return 0;
 }
 
 /**
@@ -3768,7 +3866,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
 static int ti_sci_resume_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
-	int ret = 0;
+	struct ti_sci_msg_req_manage_irq *irq_desc;
+	struct ti_sci_irq *irq;
+	struct hlist_node *tmp_node;
+	int ret = 0, i;
 	u32 source;
 	u64 time;
 	u8 pin;
@@ -3780,6 +3881,32 @@ static int ti_sci_resume_noirq(struct device *dev)
 			return ret;
 	}
 
+	switch (pm_suspend_target_state) {
+	case PM_SUSPEND_MEM:
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED) {
+			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
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
@@ -3961,6 +4088,8 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
+	hash_init(info->irqs);
+
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 out:
 	if (!IS_ERR(info->chan_tx))

-- 
2.51.0


