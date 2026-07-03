Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAD8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=; b=otknWkVzZMPtcBLkUAF8Fpnr5Q
	bghMGt9QBmgG/fi3wJlw/rL+t7+LE+e9wpNtWIN216YLjB8QuV6Ugm1mVHwKMlI0nTqautBl5CBkw
	Ae2uJW7H13DX1EfqtaoQ5JuT187Rvpemd2uyiV41TmusGPvoZ/WgltI7FggUa03vI2b9kyKmg/ssl
	o8Eac/eXeTF1/xwv/yIWYmiG7ZxcVdBdjLNYYfYV+tTU30hHhTnWQOAi1UPtPP7ocRbtF1x4ml7kR
	erQ+SzdzBeIjV1Iqt1cI/2sh7qxXEejkmb/BP4gSyEKPRVkCcY1qsvQkgSY/V5fUnlpeJIT9IDK8Z
	dXA89WWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSF-00000007qUt-1H4h;
	Fri, 03 Jul 2026 20:25:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS9-00000007qNR-1wGm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3E8B60051;
	Fri,  3 Jul 2026 20:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F491F00A3D;
	Fri,  3 Jul 2026 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110336;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FCSqJqU73UjXjYb6DI+l6uc+KNg5n8z7CUg9w4kjjvfBm8s/+b8kjJJq8wd2QANTH
	 M46URcr2svxX3XUaturRGw8drvbBZRJpCWzGyHdDfPr7HszHdN49rPR3vMRu38LILl
	 pxSyzY17ZcuTCeLJiFsfaZnX1Kmny4Z0SgrAeWQJyFl4fe1pzFIELJZttcRvS+t/HB
	 DboEBovm/ZWOL/+zLb8ge9wmoX+erMLaGVVlVivtMjFJcr233Dcjo4y7QOBYjx2OcJ
	 jzEOt78v+APX7lE10vCkxtMizu1H/p1AfC9v/JVfhJGMUA8coV53GogNVXRQs6ym2L
	 LPJwWaAQFF7WA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:45 +0100
Subject: [PATCH v3 09/17] firmware: arm_scmi: Protect device request lookup
 with RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-9-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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


