Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF20C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/9axS+bS+Or8K2AX/3fEEjIEsVmevYGJsjuPGYv+WY=; b=pcDZTC1TYoQF714ClVKP6IVKni
	D4krmdZA18GODE8+eSDBm/G8xrQsKt1aPdWbBDqTfdUvI3YelM5urv1PxZeXP6/yqRuY/O6kQv4xI
	fU2OzJpK7LiYimLjbZZ6YWPJitQz8wELdgIq1GMi0pr0e3INdveCwJyK3g21ckkBxxaN8FKAhTpNH
	t5EyRqWWIn6VaZ1/xSIe29cWhGRaxNXr8Ll+fX6gjHrJKk/9oCn0FIaIRSYi6Eqi30yZYiHsv+8m+
	Msvk5BAbUZBqjTceDT3XW6UeLIK/s3McLHZGwIX+DzMko54kaRBhDR11BGNkuM/YzVybnDYD0WCu+
	r1VJGejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ08-000000057cY-2ACE;
	Fri, 21 Feb 2025 10:11:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPlv-000000052Wh-23IA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AC3416F3;
	Fri, 21 Feb 2025 01:56:57 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C6B43F6A8;
	Fri, 21 Feb 2025 01:56:38 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	Andrei Homescu <ahomescu@google.com>
Subject: [PATCH 2/2] firmware: arm_ffa: Explicitly cast return value from NOTIFICATION_INFO_GET
Date: Fri, 21 Feb 2025 09:56:32 +0000
Message-Id: <20250221095633.506678-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221095633.506678-1-sudeep.holla@arm.com>
References: <20250221095633.506678-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_015639_567781_3B4B6F80 
X-CRM114-Status: GOOD (  12.72  )
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

The return value ret.a2 is of type unsigned long and FFA_RET_NO_DATA is
a negative value.

Since the return value from the firmware can be just 32-bit even on
64-bit systems as FFA specification mentions it as int32 error code in
w0 register, explicitly casting to s32 ensures correct sign interpretation
when comparing against a signed error code FFA_RET_NO_DATA.

Without casting, comparison between unsigned long and a negative
constant could lead to unintended results due to type promotions.

Fixes: 3522be48d82b ("firmware: arm_ffa: Implement the NOTIFICATION_INFO_GET interface")
Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index a77bb205ff7d..31832af7a7bb 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -976,7 +976,7 @@ static void ffa_notification_info_get(void)
 			  }, &ret);
 
 		if (ret.a0 != FFA_FN_NATIVE(SUCCESS) && ret.a0 != FFA_SUCCESS) {
-			if (ret.a2 != FFA_RET_NO_DATA)
+			if ((s32)ret.a2 != FFA_RET_NO_DATA)
 				pr_err("Notification Info fetch failed: 0x%lx (0x%lx)",
 				       ret.a0, ret.a2);
 			return;
-- 
2.34.1


