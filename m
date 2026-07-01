Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=; b=ZfgSHk7r7BtfcGq9yZccOOTyto
	P9fBzAg8zIzMQY6bhWDUUH7haMNsKNNXCIZnvWVCDHAZ2pQ8Z+A00B4NkU51cGFKiJBuIIq/X2R9Y
	L2ac0F6j6Ka0ETEbH0P2kX7+xqKwGAALw9F3XAFPtJOm65SdSIhfowzZ7dI2/Wo5PySrf/WMWJ9ja
	YrPJJScjRsaUhbWlIL4SElUwXOdRXiP6j4RdevyS8sjPg2G22Nu0rBFCtAo1G9EF08YzjeGd9NoZj
	kekDZdLHKllBcocHLmXXhu6WPu07gfOuk1FWTxLkPHuxLWFhnz8c5eu+wMBje3iZ1MgDkp7EdTrOu
	vaDbPgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBk-00000002b9n-1ZnK;
	Wed, 01 Jul 2026 16:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBi-00000002b4v-0Mqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 877DA6001D;
	Wed,  1 Jul 2026 16:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2D11F000E9;
	Wed,  1 Jul 2026 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924805;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PYAoMrRD+yH4FMWd2ivhD4Y7E2zYn6WM6Ce45FQx+xLDPLSgTcpbrApZqxaQzQhzY
	 tgOiDoBfV8D9gSHsBy8/ZQj904Q8Evj973YftNzOCYtJ/LOzWJYPq4MtihUzvArQkE
	 4CsEmVCJKomT1ACaLrP83QBeElWpr/G1ck8OJA4b4IXYVZ9+e7dOegAZ1kt73abLAF
	 gW+023bpm95o1R4Hsr/O/mM4o9N+qPpjTtbjDUWm0wze3si8spqvN/MiIJW40xgfq6
	 EaG+DNx4W+0D/OT6NiqERcsREj7jZXeHhxHLMQL8lFIZ44NPORNH7E/r6G3zGYFXSj
	 IOYizHojWlaEA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:30 +0100
Subject: [PATCH v2 09/14] firmware: arm_scmi: Protect device request lookup
 with RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-9-1f5e85553f73@kernel.org>
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
index 6df0fe055d64..a575e661f1e2 100644
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
@@ -2957,7 +2958,9 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
+	rcu_read_lock();
 	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	rcu_read_unlock();
 	if (!np)
 		return NOTIFY_DONE;
 

-- 
2.43.0


