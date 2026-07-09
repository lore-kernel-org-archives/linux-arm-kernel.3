Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F9C44509
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIP5sA6CbF1eR02kWXqug5HbdDA/BAiLc/L7lQ0febQ=; b=JmOnlVYERypgWBzRu2+8DjrZvB
	6O+24GuENQidoy5gHjt9LIe1Uu4kYhTQdaSewJ3jQt7kWgilj+g4Wx9/yb18QdIc4BtPYJNABKnwb
	P6EP24QtOWvowiEzfIWlXcyJjXzE9aeP+N1SS3f5MwoQYD81dxYCjEsVFuS4oErTI8cwi38gbVkTn
	xuf/FvnxPnZIZNsuNT04uiFE/w6Ew/OiviUbEWJyPJilSsQT3ee7ZCCXwl3WG4Dcq2p0H7RKgaG7a
	IXi0Vc1MJ8frCHyg3YmRRWYIlknddBCSN979mVJCm0+Kdbl6l48QVzsdngwQnGSQWfyU7lNWAiHzL
	C1P9zyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWx-00000001ekS-3h4j;
	Thu, 09 Jul 2026 08:54:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVB-00000001aX6-0erw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93B956001A;
	Thu,  9 Jul 2026 08:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97261F00A3A;
	Thu,  9 Jul 2026 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587180;
	bh=LIP5sA6CbF1eR02kWXqug5HbdDA/BAiLc/L7lQ0febQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A354h2h7YTbyjYx/iTaKJlVgbfTgPO07hzKmLil1Y1S1BnWZusRzzpfFWUPlyBhBV
	 zi3HqToDHAFhsh9lPw3fgTY5o/TUwNnQj/8SLooUqt7FMGga39NaYU779jBhlwEGnP
	 3ZvzChDGfWAMvyhXud5qPTFEJdHrSYta0yqLHPs339yU06xnLv6hX4zEcOV41+vEev
	 u04jkFU3alT0N59tZrKdjkZnVvlmOZJ7Jki31ZHQBL4ziNHUgiBF9a7vjOhcvoEnNa
	 90hW32tBts8J1votIAC8xj1zdg1aFqlTypeWnmL+TTtrg97JhsLycTZ0FvOG8acbsS
	 hw03kLk7go4oQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:25 +0100
Subject: [PATCH v5 01/16] firmware: arm_scmi: Publish channel state before
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-1-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

Transport setup can enable callbacks before the setup routine returns.
mailbox_chan_setup() registers the mailbox client with
mbox_request_channel(), and the mailbox controller startup path can enable
interrupt delivery before SCMI mailbox channel state has been published.
Similarly, smc_chan_setup() requests the optional A2P completion IRQ before
the SMC transport has made its cinfo pointer visible.

If a pending or spurious callback fires in those windows, the transport RX
callback can dereference a NULL transport cinfo pointer. Publishing only
the transport-private pointer is not sufficient either: an early callback
can enter the SCMI core before scmi_chan_setup() has assigned
cinfo->handle.
The core derives scmi_info from cinfo->handle in the RX path, so a NULL
handle can still fault even when the transport-private cinfo is valid.

Assign cinfo->handle before invoking the transport setup callback. Publish
the mailbox and SMC transport-private channel state before requesting the
mailbox channels or IRQ, and clear the early-published pointers again on
setup failure. Also unwind mailbox setup devres resources on failure so an
optional RX setup error that is ignored by the core does not leave stale
transport state behind.

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c             |  2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c | 18 +++++++++++++-----
 drivers/firmware/arm_scmi/transports/smc.c     | 15 +++++++++------
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..1d1f5d25d773 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2782,6 +2782,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
 		of_node_put(of_node);
@@ -2814,7 +2815,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		return ret;
 	}
 
-	cinfo->handle = &info->handle;
 	return 0;
 }
 
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..b6459fbb8151 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -211,13 +211,18 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	cl->tx_block = false;
 	cl->knows_txdone = tx;
 
+	cinfo->transport_info = smbox;
+	smbox->cinfo = cinfo;
+	mutex_init(&smbox->chan_lock);
+
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
+		smbox->chan = NULL;
 		if (ret != -EPROBE_DEFER)
 			dev_err(cdev,
 				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		goto err_clear_cinfo;
 	}
 
 	/* Additional unidirectional channel for TX if needed */
@@ -241,11 +246,14 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
+
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
+	devm_iounmap(dev, smbox->shmem);
+	devm_kfree(dev, smbox);
+	return ret;
 }
 
 static int mailbox_chan_free(int id, void *p, void *data)
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 21abb571e4f2..1fce3ccdeb7f 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -172,6 +172,13 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		scmi_info->param_page = SHMEM_PAGE(res.start);
 		scmi_info->param_offset = SHMEM_OFFSET(res.start);
 	}
+
+	scmi_info->func_id = func_id;
+	scmi_info->cap_id = cap_id;
+	scmi_info->cinfo = cinfo;
+	smc_channel_lock_init(scmi_info);
+	cinfo->transport_info = scmi_info;
+
 	/*
 	 * If there is an interrupt named "a2p", then the service and
 	 * completion of a message is signaled by an interrupt rather than by
@@ -183,18 +190,14 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
 		if (ret) {
 			dev_err(dev, "failed to setup SCMI smc irq\n");
+			cinfo->transport_info = NULL;
+			scmi_info->cinfo = NULL;
 			return ret;
 		}
 	} else {
 		cinfo->no_completion_irq = true;
 	}
 
-	scmi_info->func_id = func_id;
-	scmi_info->cap_id = cap_id;
-	scmi_info->cinfo = cinfo;
-	smc_channel_lock_init(scmi_info);
-	cinfo->transport_info = scmi_info;
-
 	return 0;
 }
 

-- 
2.43.0


