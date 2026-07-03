Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAGzEqJJIxNTkDBafWgxGLh0GxaMB4SJoR3kl1AArdk=; b=k95v4JhZ+HGlTM+4roawtnRIln
	iUSnXexHOJWh0FzG+clOEpuHSsMwQdrkFdVt/wBZGC2StbjZ9TVqeuV7hOSTPTYpKbcOPQDDSoWIE
	CBKQJ9NV/z0mVuZUpgNkrF1+Zhj8QVGwfyAphyAwkXGAJtXldj4mc3NwvOAavghs2/k7c9xBlFzzP
	Gum0hM9Pe7IL9fIj83IMSxC5q4pOjmhzo+9Xwh1IuPzc++rOqHrptDwc6pX1oIKNt51lto2JxarSJ
	QyCfvKmvyGgeURZUrCiOCEHAMUOaVs79QoOTr67D43B1n0LCuWmlo50apNQ7F839NB5dmdLI+luJW
	2d5kQzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSF-00000007qX9-45DE;
	Fri, 03 Jul 2026 20:25:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSD-00000007qT3-2k72
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 691B841470;
	Fri,  3 Jul 2026 20:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED391F0155D;
	Fri,  3 Jul 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110341;
	bh=cAGzEqJJIxNTkDBafWgxGLh0GxaMB4SJoR3kl1AArdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KI/PD6AKdUYMdp9RGuFHgWts7tipyyhpnQQ9MkivWHWlukWkF2UaM9S3RjbnzRpoj
	 iXIuvYBTu3rTpf3iSS6i/JBFNaU8lbYcBk/s9q2r0wkagmmJPmAH6FaVYiqMn6CRm0
	 3nW+SjdKbfB7T5WVRN3pnfJXOyu0ZgeAzPvz1KY3tcBlLpeTTeBi6Auxc/tRzCktzc
	 uVOHctk67fRdL/HJWXdIKz8FSb9bcbMxGsIxJo8sgftc0ADgxB/ni87D2MCbMLw7P6
	 tX+05AJDR0oduxbFXWI1/aihQpI84k+E/kr/z81RmF8oi73bW8X/Esia8VBR7YTCZL
	 9yQux+QZCfl2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:50 +0100
Subject: [PATCH v3 14/17] firmware: arm_scmi: Publish channel state before
 mailbox request
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-14-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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

mailbox_chan_setup() initializes smbox->cinfo only after all mailbox
channels have been requested successfully. That is too late because
mbox_request_channel() binds the client before invoking the controller
startup callback, and startup can enable interrupt delivery.

If a pending or spurious mailbox interrupt fires during that window,
mbox_chan_received_data() can call the SCMI mailbox rx_callback() before
smbox->cinfo is set. The callback dereferences smbox->cinfo on both the
spurious IRQ path and the normal RX path, so this can crash before
channel setup has completed.

Publishing only the mailbox transport pointers is not sufficient because
an early mailbox callback can enter the SCMI core before scmi_chan_setup()
has assigned cinfo->handle. The core derives scmi_info from cinfo->handle
in the RX path, so a NULL handle can still fault even though smbox->cinfo
is valid.

Publish cinfo->transport_info, smbox->cinfo, and cinfo->handle before
requesting any mailbox channel. Also initialize the chan_lock before the
request, and clear the early published transport pointers again on setup
failure so later cleanup does not see a half-initialized transport.

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c             |  2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ddd026b05300..df574961875c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2785,6 +2785,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
 		scmi_device_destroy(info->dev, prot_id, name);
@@ -2816,7 +2817,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		return ret;
 	}
 
-	cinfo->handle = &info->handle;
 	return 0;
 }
 
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index d41b8451bd21..4c9d1e4abd85 100644
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
@@ -243,14 +248,13 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
 
 err_free_chan:
 	mbox_free_channel(smbox->chan);
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
 	return ret;
 }
 

-- 
2.43.0


