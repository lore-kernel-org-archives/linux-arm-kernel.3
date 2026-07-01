Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C89C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=; b=vnrvwFNKAYSmm2shR7N/54fYcv
	D6ZMDmEbFUEEKRca0hUyJNTW6LE8gB+jHWqAIPo51+Sg+/CQwaxQ/1/V4MK3cP07KOhRO846nCNPU
	UOfkJtd5Yw6sFQubDOXGRUosBGJ1xfJ1d0FHyK5v+8rF7VlQ+oD3Xtu2wJ+02cyK4cE/gtk3JmhJS
	vhuStvM/4yXdmN6RxhQdfKrbxEZynARzTIKAYatCVq4dUQx1c165S6OCa4lSfZookLmqUO+nzvj35
	n7L5xizBGvKjivgfsVlxf3NsDvQsPvAPPuEIbBG6AbXnzSkOr8bRpZfG03coYi+aWyXJMSV4rCwQX
	UwDfV6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBi-00000002b5g-0E6u;
	Wed, 01 Jul 2026 16:53:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBf-00000002b2S-3xLr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76A1A4013E;
	Wed,  1 Jul 2026 16:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71EE1F00A3F;
	Wed,  1 Jul 2026 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924803;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EjQJrbgzXLOpVc33xXnofE68QrIVR2JvFOxCbp9zD2YUh6FXMEizovFBmWxLzf7sk
	 uOejw87+kQw1SsirHQpDUX1L6zaIDqmTc+92SFIjL6bSW+6W/dToyLopKLx9cVWky+
	 5kFWR8ZObSZETbUSjmcUUpC8RqAqUqKA0ZzCNjiLcDaKEA/jtt/cwP93h3d0gdKA+J
	 KSLoTCaQFE+J8fKXzJT9zkxmNJe7NGmE9Sar2qiTVK30oJUDKva5ELw+9GhBrYMT1a
	 dmwAxypp4Zh7iOQoBZfc49I8qcBkOgBpiV9EWxsu7QbO492JDfkAj+qqcq2VL7avcF
	 OM1Nr7bFVxPSw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:28 +0100
Subject: [PATCH v2 07/14] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-7-1f5e85553f73@kernel.org>
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

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..44d45ce838e5 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -225,9 +225,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
@@ -246,6 +247,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	mutex_init(&smbox->chan_lock);
 
 	return 0;
+
+err_free_chan:
+	mbox_free_channel(smbox->chan);
+	return ret;
 }
 
 static int mailbox_chan_free(int id, void *p, void *data)

-- 
2.43.0


