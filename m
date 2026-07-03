Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=; b=SuxP7719bQfQtx01D6gIww/L57
	KaJQc9luQSGMJojfZrmFpv4M3SN8uH8BT0dfjZmu4m23quEUVQ378qGnaNmu8CnDfVyu96R68951b
	roOkapx0Mu4sc/VCLrmxhT+KcPA3jqLpdgunZrIKHnGj7uIf/R9wEsYadHl7o9rHPfiDgKuYep8YS
	yrOuHVGyUyG9MS10Wma2jMALlxA6PPUBWp9wEKthGI2n9GP+J07K8qZTWbzj2t3QpdwhhGjY2nDXy
	XdqA4zLu/nHmTFhUUBCVFY2hC811za+1WraOBhU802tc1I3sap1JvWJ4rAoFawAmUTuN7HepCnuBw
	gdKwKVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS9-00000007qO2-3op0;
	Fri, 03 Jul 2026 20:25:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS7-00000007qMa-2UZ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F67F600B0;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353B31F000E9;
	Fri,  3 Jul 2026 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110334;
	bh=xsC7twIJ3ucnfIY/XQ0lBk229dOSIqHl6m5TjxkfYO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f1d5QP4SeOVgzwWX7qaIrKqBl1A18BEuTsOE/7IvZcGCUGWFRFAQNsy1dElparTMb
	 vYCjrNQfpjoYL3KelYvXj9rT1WZ9nNGZo8sIU9E1yosdp5eH7crT8NQz3pXkU72ssN
	 08aT6ddhrGWYzkqSu5PYmHOBFBfq5G1NaO7Vn5stplIhd3FumaQldLnRND2X+cfPwX
	 42uO5zNK9UDnxd+3IsQ7OtlMuugfHJw0LHQBjOzrHzAEu2BbGaGjKLOyouZtGiBLQ2
	 YxtLG/Cd4fWhZHKiPlfd4CqJ0s/qzTpnnLhzCaRqOQftcKn3nEygNYB6PSR1CYtiGl
	 XwV60R6zMcxsw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:43 +0100
Subject: [PATCH v3 07/17] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-7-5bae9766abfc@kernel.org>
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


