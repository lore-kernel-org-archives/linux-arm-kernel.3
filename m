Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1C9C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=; b=PaXWMKf5hTHFnqumP+rIGjpxoe
	MiOQf5l1xVsbtZY+UJGkdlZkJ6QyetL0LnTpJesyW0c16EeR7C1BoPTDQRz9f16qaXa9LxDJdi/Xq
	ZH9R6ul8ny+/Xf0JeZgGTyHuT1ZPFJKazJxsIAChZSf7kNmLG8l5kqjg63giEubo3emJ1+AwcIp0S
	qxGGSRP/8AR8F6qqAIvPTQ00VjdKnRCZmOCT8tGWh34rDate9G2pyuQIwqGRTu0EYonsspWf3wMRA
	sxuwyuj6ui347OIr1x6sqIJJkd6CqOXjBptgy1MAnkOS7FW3E/LFgOpKFb9sp6D+9ldW8aR+PBW7r
	p+9neGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBh-00000002b5E-3n1E;
	Wed, 01 Jul 2026 16:53:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBf-00000002b1g-12ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B022160122;
	Wed,  1 Jul 2026 16:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A911F00A3A;
	Wed,  1 Jul 2026 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924802;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kr25S/n9VzlPmL0BklcZN0wpZjCPFzt3OwVfBRBCTzzRoHosyLB1SX4S6VatXiX0z
	 I9G2iqnkBpHLQFQXyBWnjqChfcAxCH3UI4A6+dIrK4Y+13hbsrGXKq6aIQBfpdcies
	 cI0ex8VFTDANHE+g1CBPni7bQ+avyZjfKj0E/+pDROAz+kLRsy+uGimIYiuuSZTMgB
	 YE1yvCzXWiXyYnnC3+SOK1naDQwC/Mcq4D+ID+OYP5ySM9iEgExdcWw9H8nVsWqcY1
	 p6n1+yKANbVhTPBKjVL7VxtmQ4iQvk6eR9Jv4PibnddncHpD04qbqCHetGDASi7iFh
	 7eE/aJkU6FL9Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:27 +0100
Subject: [PATCH v2 06/14] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-6-1f5e85553f73@kernel.org>
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

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4b369b003003..6df0fe055d64 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3402,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 
 	scmi_notification_exit(&info->handle);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3410,8 +3413,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0


