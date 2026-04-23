Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845CDFDEE34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ1AcWMpxtdzbhNNJmwaczTFZOoUSuTM7hKeKeTf1pI=; b=WahwAwqtI5MK7+JF/+7vUImq11
	Ah8v3DMsDtyJdkl2MbuE/4xGcj1WDzBKCromwssAxewb8BICCHW3oMxVHrNZp+fL8nm90w33LqcSA
	IOz/Ei22deA3SrEpHHgsLIVVWh506wE1VDE5pxjkB/X2yq6nw9wK3bC/MKxTnIzwzp/TWQ4+i0Y7C
	XhqLPgQbKkoHU8WMvp+k2mRxb2zk0Qxub96RoYxItklH1m3P7O9mKNyieqGtqgXE0lXivqoGOhl3b
	3kFBazM5Bx1nb5cm0J6zh/Bz+pJhJXCIg5fgKcTTkDWvhZjWdi/E8VqxD18dgdUta9ogb2g/MVkv1
	0Qsz/1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmS-0000000C2Pm-1BFg;
	Thu, 23 Apr 2026 17:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmN-0000000C2MQ-0QtZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCFC34471F;
	Thu, 23 Apr 2026 17:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0666CC2BCC4;
	Thu, 23 Apr 2026 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965034;
	bh=4GMGB4p8iCuyXlrORu3AvP0h9ZKS32L0djQtHAsgD8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NOiwObeHUNMF+zIV4jjQLsGimaaOae+Wi33QJik/ayvcadfDcVWlGJVjECsvlQ0zH
	 yoX/96Ex9Go05nHTEA8Avsf4smU1UZBJcU/tLX2XbQJ0g+D01TFV/Oh7p0zJnV493M
	 l+VUHX2KzTkQyuZ2OdjHAJhfikzYwR2R0MU/ZNjKeun+fCtN47lZRp/n+C2VoO11MO
	 Q8PHCE/MV27vmYDZdIkQxhWj28aSpsw3MGxPrunxGTk8Izhci1tBJmhukMbdNTOcev
	 VG4CSkg/1Tp4eRxIT6NvYBX060pkaPgzmaAE8aTqetkOEEhm5M6zjvd/8J3jamZSeg
	 v8rp3Mvs9CP7w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:55 +0100
Subject: [PATCH 5/8] firmware: arm_ffa: Validate framework notification
 payload bounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-5-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102355_225508_2DDEE9E7 
X-CRM114-Status: GOOD (  10.42  )
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

Framework notification callbacks copy an indirect message payload out of
the shared Rx buffer. Validate the reported offset and size before
kmemdup() so malformed firmware data cannot drive an out-of-bounds read
or an oversized allocation.

Fixes: 285a5ea0f542 ("firmware: arm_ffa: Add support for handling framework notifications")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 764cb1226182..0e030f377985 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1469,6 +1469,7 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 	int notify_id = 0, target;
 	struct ffa_indirect_msg_hdr *msg;
 	struct notifier_cb_info *cb_info = NULL;
+	size_t min_offset = offsetof(struct ffa_indirect_msg_hdr, uuid);
 
 	/* Only one framework notification defined and supported for now */
 	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
@@ -1476,6 +1477,13 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 
 	scoped_guard(mutex, &drv_info->rx_lock) {
 		msg = drv_info->rx_buffer;
+		if ((msg->offset != min_offset && msg->offset < sizeof(*msg)) ||
+		    msg->offset > drv_info->rxtx_bufsz ||
+		    msg->size > drv_info->rxtx_bufsz - msg->offset) {
+			pr_err("invalid framework notification message\n");
+			goto release_rx;
+		}
+
 		buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
 		if (!buf)
 			goto release_rx;

-- 
2.43.0


