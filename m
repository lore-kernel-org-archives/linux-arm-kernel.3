Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=; b=aoR97IBZgU2jaomL3DvfS+g86W
	6aJAFigq96B7yq+zkBdthdBrouyjoXLyNZVtbjT2ymzavGCvCAl9BL9Kx2lTcPHWD3L03xLhDhSY2
	KGo8CrBuV6vNnZrN5ciQ3HUQuzc1oUqb4VQ5YPv2hiChIK9gCmdPzK40vqf7SRCaURtTk7E6YdZXX
	p1uuFXm9NdAFhvtSFnvK/I+amr9HPIkV3QRBWHWzn3Z9Hd3mMVrmH+z6z7Kd7Q/HCH4EtD50DXWXA
	TiwN0WbwgdLqfl/3B4p4KaqWts7cRwoXwMlsOK1MO9uk+Xz2cFWDA2pmQ7CMvqIl2oTw8+iqA0XPF
	oCeK3a2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQc-0000000GLHu-2hMK;
	Tue, 30 Jun 2026 09:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQX-0000000GLEA-3Gjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80D9143B9C;
	Tue, 30 Jun 2026 09:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CEE1F000E9;
	Tue, 30 Jun 2026 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810405;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TRaQIIslnyP56XHlxJLrKlhDRclwQcw9V4XZD/AqW6HZVvWJ5VfKkh/5Z9AR5Z0+Z
	 iPvqjPOS55ANIy+4jBkf2zb5VFXAuY0hoXCQE6i5P2tywM+qpORfASlYZftEZDvJwL
	 gZzqGs0anZzydpK8amo6MZSlMDPDFD7TLMvzMKeRuRTkPIpyUnWF62EeNdxHnznKil
	 mqODjDTZrvxZRhUAPQjsyFx+K31bVw8bQEq6xy853Me4QXIp8r8+PAwKbmgwJ2hYlx
	 KuFhAs/eyaQBTaGMykn/S20NEjWUP39TcFDu5EiAYIP7sw70LMilHvOkii7gdACjmm
	 HVpNCrOfliAlg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:03 +0100
Subject: [PATCH 7/9] firmware: arm_scmi: Unwind TX receiver mailbox setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-7-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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


