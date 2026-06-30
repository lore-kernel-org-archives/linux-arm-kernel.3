Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF689C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VE+1IF89JPg2cS6LsWuiQU7BFezbrXsY0qjq7Bvb7Y=; b=UqT3dJUS/hu8thZVen6ZVaFYY3
	oQhpLwcxAmgmIHcasTIcLTXyZZM+xh/caRgHKKGCtTgGd7GvHCz+No07YItXGpfbdDACbfeCa5/75
	BrulVcmWipyMMbw47Jdudp7TsNVC3w40Cg3l+zsbTtCuwwSzBMp9ZKACpM3iXxmE8kve6ubHlqWp6
	7MV2zgnprPxWE0qs2lXJsBsfK+cGlBlT/t/Ubgu3F5O0qp6kvtJQcThZ6RLOZgQU5+/p14k5qwove
	aFyXC11rCgM5Egt/QKVIYSmZPJp4RcYuwaYtLFkU72bN7dkmKoq7L5uzJ0in2YdQ3Os6ow+A4UpQ7
	ELdXk7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQc-0000000GLIR-38TT;
	Tue, 30 Jun 2026 09:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQY-0000000GLEl-49XU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB7CE40640;
	Tue, 30 Jun 2026 09:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39DF1F00A3A;
	Tue, 30 Jun 2026 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810406;
	bh=8VE+1IF89JPg2cS6LsWuiQU7BFezbrXsY0qjq7Bvb7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mEb2XRZnUXGPlkIHm4jpNGiLtC8unMNx3B7JQSRltckJLw3i+JuOWEAjdn+X6y4Rv
	 RIATgxpAjAW+dF2ZkTqpHNzl8BeTn0qTWXRvcCIMNU0n26r//+QJnvn69RVXoBhLra
	 dwhPgf4AV4cn3OIbjAdf+FnlFHBbY4wbGZVlAy6pxyEkjtN5oCT8YYQZeF+QS43cno
	 XvnprbaOLO+wupI607fY2Q0mticPlajAuBr2l/GJou9EgWafdRC8xqEmorOgt6ztVL
	 vi17L05+P+e4mqI67Bx1wmOdMCXsayLzqIo6W1PZhCju4hWBwyZfjfvAWFbXKq+qJn
	 Mqr1taMvmvrtA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:04 +0100
Subject: [PATCH 8/9] firmware: arm_scmi: Unwind P2A receiver mailbox setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-8-f932c1e51992@kernel.org>
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
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 44d45ce838e5..f2bda95953d4 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -236,9 +236,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
+			smbox->chan_platform_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			goto err_free_chan_receiver;
 		}
 	}
 
@@ -248,6 +249,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	return 0;
 
+err_free_chan_receiver:
+	mbox_free_channel(smbox->chan_receiver);
 err_free_chan:
 	mbox_free_channel(smbox->chan);
 	return ret;

-- 
2.43.0


