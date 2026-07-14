Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BED8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=; b=K+MTncIw4yrZJ2WH4VO06w7o3H
	8nvcVFjLFuFlzgAq+jXfRa3I4U6rz7v66tGFZoKTz1WY/wGSfiM1v8xdCI5+5pyYcEkHh8vjJX2TL
	Cr9047u9ItPQ0/vWImpZM/wPuSCK9HUalWzNHs1k7MXrXaI9MGUtpESgywnlD9AleMRK0ZkBAa8Uy
	QEjZpg0zFtBOxDEAImuocZoeasPUY8ru5xgUTMLDi3wGGusXVP5XqEnBEardcrI+9ZxscGroGtRGC
	KJBwDEVqtkUCgkENWyWfteksUQ8iHiqj4c+O+QkR/frnNGFSRNr6hUdplhhJeiJKkYcl7iOXlkm6/
	79kN8JeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcin-0000000C2fF-3x2q;
	Tue, 14 Jul 2026 12:58:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcik-0000000C2aq-3cht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D8EA405FE;
	Tue, 14 Jul 2026 12:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2491F00A3F;
	Tue, 14 Jul 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033926;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i06zBUzqpTcRsmR/gY2bqgX80JQDQoCjKlyqIRQhssBhkc/llgdwUvininXheC0xl
	 JddpxC1r/5QaEKHNCMZh1UurUsPB8EMrD0Gqcc91EGtveliN+1EmjyDrEDeawegvQ+
	 JChazQmsRrpZI7xd+SVKBd3vbEQIL8hBbJkRQmPkmo+2SRIblK6yJjWDZCWmvFV88N
	 Mw9BliiJcTPsUfVmdtd1xTrM84Cmg+eT88vxVjW4cWQPrOWZFDaovrAABjdaeoTVMA
	 IKxfo1P+TIFOgKp7agXRWeKPaA2jmB3tgU2tQo4OWhDQhfyXY0dz9DNmLfG6zcAD6H
	 CkIjATSyeFD+A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:28 +0100
Subject: [PATCH v6 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-9-3afe499d46e3@kernel.org>
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

The SCMI device request notifier looks up protocol OF nodes from the
active_protocols IDR. The IDR lookup can run concurrently with protocol
activation while probe is still registering protocols and creating their
SCMI devices.

Wrap the lookup in an RCU read-side critical section as required by the
IDR API for lockless readers.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f607557c04ad..a2871dca24dc 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -33,6 +33,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -2958,7 +2959,9 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
+	rcu_read_lock();
 	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	rcu_read_unlock();
 	if (!np)
 		return NOTIFY_DONE;
 

-- 
2.43.0


