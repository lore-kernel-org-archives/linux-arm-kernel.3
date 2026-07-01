Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BDDC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijKjg1UKh+d0/IAuKWsqNeiw8kVOXVnEo2ybOVcIaKw=; b=DzPCGPHYuWjCiqVTw4sqNU2f3J
	9nt5XHMMAxmCBb30OF59p3XJ3kHs+y7pzvlI34G9KfPV7iGfQzEHmDCX1yeNmz0EeZ1h3Q/SPFkiC
	n+TnKQ8clAtMirbHfzXV8BmxG9409vMB26oIK0z5cz2A9RqTM0mtV4p6DDgwSYSHs90kjjreuKry+
	lfTPtPPzCBFjie83otDwBI+YwqrWa7++ZwV3bbkAUGwy5jauhzCm610+MsN126x4yHyffUEtxDvHg
	R0o4cOPrhovGjYshrMEtI/Gq6vMlHc1k/w7hqD8QjstjCKz5J5LyYyiruNC4SC2guRnsCMvexeO9b
	yWY93ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBo-00000002bHe-1dIb;
	Wed, 01 Jul 2026 16:53:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBm-00000002bDz-3P91
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 456DD601DD;
	Wed,  1 Jul 2026 16:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DA21F0155A;
	Wed,  1 Jul 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924810;
	bh=ijKjg1UKh+d0/IAuKWsqNeiw8kVOXVnEo2ybOVcIaKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MCmPJOj4aa6JkENXtZbH64mZlCvfenp41NrAJQ+/xHREJMfh6jocgx/oOKr6gin1I
	 8WgTY9947SdBZVQjpfwoKHcXl80lRlxCyN+qi14yhkr0K/OwLi6QMqAahjmvJG6n0S
	 MJNFc9SWbnh8bTqgOXi+hvztk16aU0oe29ZXfS5KX9HcquQvEWilu7obX9xsd2RkTD
	 /XoFrksGTiLUk5LNuXZ4ss6ClkMRdjurLk+7DWnO0LEe+Sjt5hHZWnCy2rXk3KrfPt
	 XPXTBiHSnSU5FACmQaxD+UEM9bisFFBTafu8nStOyWVNHMJcSFUAzE2KRdXTK9y+Yg
	 isQ+O05l4jCJQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:35 +0100
Subject: [PATCH v2 14/14] firmware: arm_scmi: Publish mailbox cinfo before
 channel request
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-14-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

Publish cinfo->transport_info and smbox->cinfo, and initialize the
chan_lock, before requesting any mailbox channel. Clear the early
published pointers again on setup failure so later cleanup does not see
a half-initialized transport.

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 07a08ea5d9de..f1bee48ef7dd 100644
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
@@ -243,16 +248,15 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
 
 err_free_chan_receiver:
 	mbox_free_channel(smbox->chan_receiver);
 err_free_chan:
 	mbox_free_channel(smbox->chan);
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
 	return ret;
 }
 

-- 
2.43.0


