Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE02C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=; b=GT0Gjr74PWzETtxMuxwF8wF/R+
	wKVlxYCbqBoU5edTcZScvfOGt2MnAvkF8onpWY0i6jMFFz86fKMsc1xY/ie+aVYIlayAfj+rTGU7f
	fj13xIh5lLtC8AppbeZ1qljwiL4QgfHp+yOvptJbioQ4UFidbua0Bp4v/CCuRanh3kf25nRnc9SUA
	TsjluzDQvcWxtCg0ximFWIpzs1GvFarIDEjfnf1EKmR4t8BAvdRT7h9jDo3l9oklGiPppw1qsXmmx
	dfNQW6NKsZGYVnwX3d0zOSUn8SIYQqlM5/4lYq9SdMdkiiiBzglLLmHtDCqDKl49+XUu8kMF8tB5z
	hLdOzLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcjN-0000000C3N0-2mfZ;
	Tue, 14 Jul 2026 12:59:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcip-0000000C2i0-3amX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BEE34062D;
	Tue, 14 Jul 2026 12:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDDA1F00A3E;
	Tue, 14 Jul 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033931;
	bh=uujWU4pxjJzuJYUbcpSqUlEN3LiP3PT6PxeH0l499rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h2YDxWkgfcFKmRzSmSDF/4r8Dv8U1qzLL+n0zQ2DBLNQjnYs/Q/URrwv/R613+e7Q
	 xHFXVxXxwbOk/S6q9p7OXRhhumpdRTm3eVt5GHbrNZKOYMiQmIYUNTqwkiGlCXpDcP
	 TTPCUSenlRtQ9r6Jc+RmeMSFkrh0hPQxHVFIWJd0eCKxGAINp1qvotuBzjbnQCM56g
	 XgPQcCXHtYdbq3kUFDtHYILqFeW4OIJAM7a9+72wljQuSsUZCXqXkhc5SS78683oyv
	 p15iojt9mL/tTTed/TXQEFD2dhRIZftTSkqMtFjR1iyRh1YntjLT10SaGN35vSKuNo
	 yDuACr6YTY4Gg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:33 +0100
Subject: [PATCH v6 14/16] firmware: arm_scmi: Unwind P2A receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-14-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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


