Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8211DC44502
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR0jgISqKjRrDnBjgwv19P7Pi1A7PRvJPSCLopA5W0I=; b=ZhK79Yb8uCfVsBHfVmjcDfTuVx
	IUeG2hndRlVOEsWGrsdsHLoqtUxgEmlUIJB6Jhc8+28Szhw0HVO25SPpNsf+LYu1lLYQHMFGErbYy
	9cQgMS0HFojrlb9BhaU8mT7Vyh0mFnrvvtROa7VlfCBA0xJiaGXyf2IiMhBnrtfvGFEAroTTz7RxF
	JXtSzKKOS36lq+ptKfG7iuH9Vzh7kzYohJ7kXSjM8DH+WPWfKlHinWbmG9hroj8SllqRQjL5U6uLh
	7BiDl5ktY7xfQ0RXEHWz2hOaHmG9dSMkE7Pj5kO5ercjyimhseiM24xk+besVaYPdwtG8TejImFv4
	QUKNh6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSA-00000007qP1-0MhQ;
	Fri, 03 Jul 2026 20:25:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS8-00000007qNC-2CZv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E58600D8;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258EC1F00A3A;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110335;
	bh=fR0jgISqKjRrDnBjgwv19P7Pi1A7PRvJPSCLopA5W0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n3SAwxNdtBqjBAvaBvIveJJdCrjVBAD9F635LkE4k0GO1cR94aKUNZTBiWPdlBMUE
	 /OMkZCdeZqtXtEjOWvin4LvUekag1nBwnI2BF5UmCvT7Sr8ByEh0MoAyT1ip+/Tfgu
	 kUyh/LzCGLry3qTiYs/qe8fhRDpMcnUw4rDo0Uysd/cIAgNYOUH2f3gkLX6OaMz1R3
	 5rSp6FjVqqffCTxhAcNv4pRgp+H/iQCej9v5GJfr4Jb0BTYIZjZtOWH07yE8hlYX1i
	 UZbPRDQ9BCuTYLz1WoX33YOBkREJtRJCIVdg52c9Dtxe9vGUXQ6Y2l+Z46OMZFgA+K
	 HwTifavDI7WpA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:44 +0100
Subject: [PATCH v3 08/17] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-8-5bae9766abfc@kernel.org>
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
index 44d45ce838e5..d41b8451bd21 100644
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
 

-- 
2.43.0


