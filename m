Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE1FDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC9qQTBFGPhM9VVfZsMZPGt3T362foDJ1809S5lS0ys=; b=t1xHybZ7vtNAoJuf6EOtL8NQ/U
	maYmzww7u5X12/ezu0HqpmGdHl5VrW3kwDup06V7pOWV+ZCf9JWc58lsjh0u2z9YmDX9lh4gIRZMU
	rFlEh2l+8IAS66sOE45fJuMDzWKEZcXN74I9ofSz3mytJDgA2FzJP8eb3Jalbu1JD4rZaydfdE9xG
	N1QjNdiHAqmUaXLcPB4Cke91Aged7bB/XTNOUowlFA1tTetpcOlTgVwW1lxaiJd/inZBVHhLxsjpo
	CBn6QoWYRQL3lY3exL0yE4pIB4Ew8n+9xJaUNhPApYcGE7NpYTclUfpMcuE6ACHax/t9oKa3aqJbH
	X4HPI2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmR-0000000C2Oc-1YbQ;
	Thu, 23 Apr 2026 17:23:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmK-0000000C2K2-1uPb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2A1C60582;
	Thu, 23 Apr 2026 17:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DADC2BCB3;
	Thu, 23 Apr 2026 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965031;
	bh=c4BcYMZ0KWMorH09+B5vNrAhFQ4rDIDYqWvY5VR5Gws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TJyq/UdbIn7Ylv3yTN9y3bgSYNuxU6WqCRX/Hj6zPFxILEdXtEzjPWvDecb9bZF8x
	 FkdCJrI+6o6qd7o7X2TIHCrcPEXbDrPpJes96F8ISs8BcmC1Yiyqu0Sk4A2XG87A7y
	 ExFX0Q8BdDvdSL67amtyvJ8sAOH7opgk6uRa2x8N1glwFFoIjrZ2grq4ZnohbaPB51
	 vsYtS6EK3uASo4bnPjsg+sy1Gc9SUXaPwAqrA03fsVRbxJidCYg+wGefdV53d7X18f
	 19Re5W+H0HPN8ooi03kRDRkqicP5raw5jCLsX8vd3fItdvTKEE/vxFSBzG8Sc3hIj/
	 Xp3F7uvNQig2Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:52 +0100
Subject: [PATCH 2/8] firmware: arm_ffa: Skip free_pages on RX buffer alloc
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-2-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
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

If the RX buffer allocation fails in ffa_init(), the error path jumps to
free_pages even though no buffer has been allocated yet. Route that case
directly to free_drv_info so the cleanup path is only used after at
least one RX/TX buffer allocation has succeeded.

Fixes: 3bbfe9871005 ("firmware: arm_ffa: Add initial Arm FFA driver support")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index eb2782848283..e6a051b20cb7 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2067,7 +2067,7 @@ static int __init ffa_init(void)
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
 		ret = -ENOMEM;
-		goto free_pages;
+		goto free_drv_info;
 	}
 
 	drv_info->tx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);

-- 
2.43.0


