Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529F2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVE4u5v9F9Cqf26AtDnPPkT40mlXZr3O3IhmW+XJJJY=; b=i2xvwIK8YiLup18zTfuJ/i9RSq
	vM5hDKgwNCC4mngm9w1oXkpILtxNGAbE77PHuUgQQ7feiLK2usVqQbQ8YumSR/XGZm8jw2EPD5NNx
	1y3j5Kxx6aCpA0PTlquXEE3TmPsuUZ8ebcV/e9Lcptl++i8a+ETAwSNEzeWIp9LsWjyRJPYTZrZnU
	DuAb8qaljpLwNPLJ464IBDhbcCZPOduWyJ/RpRGkU2QCQhPb7XNy/ZfCKYPCLuCYZQhiiDbC7T1dr
	pMMNIzbnCLExhW1Ak5/7YjqylO5/FXG1C0sPRqX0WlDERDqcTL26whnCW+h3odW5RVOZPkMx510dr
	bv/uLyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJid-0000000Bq8S-2fzD;
	Sun, 23 Feb 2025 21:40:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmJh8-0000000Bq04-2oo4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 21:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D39D16F2;
	Sun, 23 Feb 2025 13:39:39 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A73B23F6A8;
	Sun, 23 Feb 2025 13:39:21 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	Andrei Homescu <ahomescu@google.com>
Subject: [PATCH] firmware: arm_ffa: Skip the first/partition ID when parsing vCPU list
Date: Sun, 23 Feb 2025 21:39:09 +0000
Message-Id: <20250223213909.1197786-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_133926_754766_EF0263A6 
X-CRM114-Status: GOOD (  12.39  )
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

The FF-A notification id list received in response to the call
FFA_NOTIFICATION_INFO_GET is encoded as: partition ID followed by 0 or
more vCPU ID. The count includes all of them.

Fix the issue by skipping the first/partition ID so that only the list
of vCPU IDs are processed correctly for a given partition ID. The first/
partition ID is read before the start of the loop.

Fixes: 3522be48d82b ("firmware: arm_ffa: Implement the NOTIFICATION_INFO_GET interface")
Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 31832af7a7bb..f63e3b0eed16 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1012,7 +1012,7 @@ static void ffa_notification_info_get(void)
 			}
 
 			/* Per vCPU Notification */
-			for (idx = 0; idx < ids_count[list]; idx++) {
+			for (idx = 1; idx < ids_count[list]; idx++) {
 				if (ids_processed >= max_ids - 1)
 					break;
 
-- 
2.34.1


