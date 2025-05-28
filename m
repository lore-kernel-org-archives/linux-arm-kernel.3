Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAB8C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pdPesFUtT8KPyiEpJqF/OYihxLz1Mri2lqG+ebrMJQ=; b=ypmeFyk2y9KR/ib+BoqS5xY/yb
	LwlKRkDyUq+cTpIJZ9uKTJ1DYoKFLTmpH0DTG64YyhkPp/p/bL+DKGJNoqdfS6tabVh3XN41a+i9K
	iiyMvNoktlM0FWe1UU713oFhqDsCHNb3mqgu1FSQ837OQ/X9Z1GbNf6pBzG+rmIX0d8kTm6z9cMOq
	GZoqPr1bOsPiwm73loe7bYzEaZVZNjhGTco4Xe+QR6fS16Z6dQkaCAET6G1Uask/EFOwIYLIvtEaS
	idqfugz0x1HdVc6oOyZdk9jsJxTVfg5rtnkP6BzA0x5WWA+R9o5Jb220UdGs8AeWm9cofw2fMA4f1
	5hO+dWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCb7-0000000CeFO-0XYQ;
	Wed, 28 May 2025 08:57:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCUY-0000000Ccrw-045d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3CF422FC;
	Wed, 28 May 2025 01:50:10 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 448213F673;
	Wed, 28 May 2025 01:50:26 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 28 May 2025 09:49:41 +0100
Subject: [PATCH 1/3] firmware: arm_ffa: Fix memory leak by freeing notifier
 callback node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015030_116973_479C6DFA 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Commit e0573444edbf ("firmware: arm_ffa: Add interfaces to request
notification callbacks") adds support for notifier callbacks by allocating
and inserting a callback node into a hashtable during registration of
notifiers. However, during unregistration, the code only removes the
node from the hashtable without freeing the associated memory, resulting
in a memory leak.

Resolve the memory leak issue by ensuring the allocated notifier callback
node is properly freed after it is removed from the hashtable entry.

Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index fe55613a8ea993378474671d3c5756309da34fbc..6f75cdf29720993b1cd95eb7d3a36d01b0fdd1de 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1284,6 +1284,7 @@ update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
 		hash_add(drv_info->notifier_hash, &cb_info->hnode, notify_id);
 	} else {
 		hash_del(&cb_info->hnode);
+		kfree(cb_info);
 	}
 
 	return 0;

-- 
2.34.1


