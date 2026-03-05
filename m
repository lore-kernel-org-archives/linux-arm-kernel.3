Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E752F30956
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHNwtheC/nOQSQi5VPbQp7KzuBGm/ypUaad49APd2gs=; b=2WYexEGIErI2PTnGwmgpe7znaa
	8Jci5mIvyfdr9F2UiihnXRxkZt2zjpF/dl1bbxMintKYYnBWPONrsUD3GnnIZ2d6NFYRdQkC/qn1p
	hEt2HN9zti4irQA2/IHZcUHU0YvZUGU9IWb8fPnVRdTq0CQH+uiMCV0xyDsSR17U6j73AiCRO+f4H
	r27dYJnQMV2dxDx/CLgLGx0Aw+N1xTzUS8juEhTTDP98IDNnokIqLp7yDKvxshPKTiXYj5tbbAq6D
	8nv3l01TTwKbyM4B37uX+v2lmo49Dqb1+XLH8ReNukpTiiWpOXa9e81JMnVbyYGK5vqqMVWgeDAGJ
	qUYNfsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8TN-00000001rD9-2gy1;
	Thu, 05 Mar 2026 13:10:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8TL-00000001rC6-2ARz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:10:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FFA8339;
	Thu,  5 Mar 2026 05:10:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 452B93F836;
	Thu,  5 Mar 2026 05:10:28 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error path
Date: Thu,  5 Mar 2026 13:10:11 +0000
Message-ID: <20260305131011.541444-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_051035_609713_DB117ABB 
X-CRM114-Status: GOOD (  11.10  )
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

Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
registration for unsupported events") the call chains leading to the helper
__scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
get an handler for the requested event key, while the current helper can
still return a NULL when no handler could be found or created.

Fix by forcing an ERR_PTR return value when the handler reference is NULL.

Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/notify.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 9168794adae4..40ec184eedae 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1066,7 +1066,7 @@ static int scmi_register_event_handler(struct scmi_notify_instance *ni,
  * since at creation time we usually want to have all setup and ready before
  * events really start flowing.
  *
- * Return: A properly refcounted handler on Success, NULL on Failure
+ * Return: A properly refcounted handler on Success, ERR_PTR on Failure
  */
 static inline struct scmi_event_handler *
 __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
@@ -1113,7 +1113,7 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
 	}
 	mutex_unlock(&ni->pending_mtx);
 
-	return hndl;
+	return hndl ?: ERR_PTR(-ENODEV);
 }
 
 static struct scmi_event_handler *
-- 
2.53.0


