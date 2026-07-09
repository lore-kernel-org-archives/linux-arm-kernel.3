Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB804C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=; b=D8fdQGAYL/ta7FP/5XSC4heV4N
	ivC0fJLMvRMvnL/R/L4JE6tIVIHNO8nhG9cVfFUifHTomhMCj3snXDgJyH5TCSR3BPWquHwUS2R1K
	PWX9RBugRO/XglZUStyiZwCsnv+MM4V7bL64ILAdi4c8tLEJCNt7SKtWy+ls59MMzlvOChJOJOgrc
	VwI+yJQoHCsiHpVJFJrrOVMf3sfIw9D12+k4pSGj1XFp4vHcXlLimxzNpo/S5lCgNzAMgoGspnz8q
	RNIMaBzJg8X2m7MtVqVYxLuFLeBD8bUVfiVCEtJvNSw8qtuz79UC1DDbm4iKmwebSU12wtt5vbmPo
	eUUnn6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX5-00000001f4W-0U6W;
	Thu, 09 Jul 2026 08:54:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVN-00000001aZ7-1B8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B994A6136C;
	Thu,  9 Jul 2026 08:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9231F000E9;
	Thu,  9 Jul 2026 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587192;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ENJ0Ic2cKoCXyj6dWklG6Lqc5w8RXN1ofVUnKr45WDUG/IJxMSg6x4Rx3ClGOC/ku
	 kaHeEv5KUuB0a1UBy+trTdnDrKLSvHDJDjrBNUvhCIBpPGlgvsPio4IZwxbPUM3wbR
	 HMkeuuXPAD4JBIQR7tHuJzunjwdN1XqMv3Q0EGE8oLmgci8a3MpMKXMCtWFBlmg4aN
	 ZQE32TugZ1ORjQqFfux2hdNtshSfXtJ6TaTh8aSCjzCtISxzisP6Qtj/gq9UvWHjGB
	 TQBjbtc1/MCGnUXrhRC58pL/Bs0i0rFYGotttocVw5l8HKjLC1bdU58alfLGXpEDKY
	 5HRVIPgYEJ+2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:38 +0100
Subject: [PATCH v5 14/16] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-14-bea6a3024f05@kernel.org>
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

mailbox_chan_setup() can request an additional P2A receiver channel after
successfully acquiring the primary P2A channel. If that later request
fails, the function returns immediately and leaves the primary channel
allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

Fixes: fa8b28ba22d9 ("firmware: arm_scmi: Add support for platform to agent channel completion")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 37e3eab529ea..308736c3ead9 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -241,9 +241,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
+			smbox->chan_platform_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 

-- 
2.43.0


