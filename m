Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx3J+pJavz1fFM7CBGqP9zmvQYThVuvASvjjlaxrEZE=; b=Mnfpq7G6ThRaE0xPrvGxl5JoBW
	8jcvaf4RWI97IfiMxeGj+bKa5dUXTKfTY2ifhD4f5ZTMyz+WXAZwdfHcAEo3YfsN/bDoabhsiigLw
	qV8GsEav0PSuhLs/wGtpkced6YeryOwlpAZGYTOwhf+HIDSTZ/b+wgfKXdMgySHXyu0sSO4doFzA1
	nKYjWp/93K152Rm6qu1L/2QP7UmlvX7NmHqzgKJh9MGqhBITF7uxKoh3e4BEyIKzerMeH+rA5zKMl
	I+6rQRyw4j17H8BKV1JtAXcKgdGPbzRKQbc7ZLHIXC8Kyu0XAoLkPRv7aSC9EaX+GfDrZVgt/Vmva
	JxCFd0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBk-00000002b99-0kFa;
	Wed, 01 Jul 2026 16:53:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBh-00000002b3a-05bc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78709601DD;
	Wed,  1 Jul 2026 16:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E981F00A3E;
	Wed,  1 Jul 2026 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924804;
	bh=nx3J+pJavz1fFM7CBGqP9zmvQYThVuvASvjjlaxrEZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fZVE6VoyOpoEGDzsYcszNUAZQv6yp1QP60/7gNzFDN7oBuT8hdKMCVpvmvIKm3EnN
	 jntitu3vFdCNo5BuDwDE2SLZqyeiPPTQdwTkbrejVNddvovEAOqvO6BHgCpuRjcWYp
	 u/ExxRY7Y+ChwS/lXuwYQFeRurXylsmaW1rUtElzYBWtkTTMzZjvRl7OAo4HG4KYQb
	 oEM78NNgZHtIHhGgtqy8wwq5vW1M3OBTeLZpDWRv4QvRydaTALvT2HbtFPsAmzWqo6
	 IrKWMJwYUlrnlxhWYPsoMZUQ7gwAhB+fIXx/qA45mao/INCwThdtPtrvc0L8SWvwUO
	 QG1funnE7vpow==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:29 +0100
Subject: [PATCH v2 08/14] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-8-1f5e85553f73@kernel.org>
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
index 44d45ce838e5..07a08ea5d9de 100644
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
+			goto err_free_chan;
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


