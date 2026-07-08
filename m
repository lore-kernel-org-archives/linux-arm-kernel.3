Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9DDC44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+3DDIC4PQymPZk8Lzuoy1hNZXPh/rY0lef4PRU+Vgo=; b=V821GgqsBf/X6lEFpP3KP2PT4k
	CDDLvavDsAPbAGsmQyH4dQyNoY9e8rTH97xsp0LUgeqGq6EbhRVyTaMDWfXkaDbXGcHRfqq8PC7xJ
	sewJ9caldteuCB828WmRouCfZf9UU2D1+dJbV/8c4T6YO/GHcfff4PEkvgl4lJmycvM1dYLEOV8Gi
	k7tFZWwOWyGjLxt0gvp2XPQICvVZBQ+wU3JitGNjGm/BmCSJ22k8JDEkvvHth8SR3fX2veeGLv9WW
	fQ5aY7nsJP7YMkLYTjdyHI45PnWBbFZh8RgY1TsrHDxRjApdF3L24dt3Ji+k50rpjba98gYJ5vxSt
	l5eYM6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8y-0000000Gg0q-30as;
	Wed, 08 Jul 2026 09:00:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8v-0000000GfxO-4B9o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0775412D2;
	Wed,  8 Jul 2026 09:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F01F000E9;
	Wed,  8 Jul 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501233;
	bh=7+3DDIC4PQymPZk8Lzuoy1hNZXPh/rY0lef4PRU+Vgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K+SeFUTetjIL+PihBvnhdPSutJGC4EU+7KrYuzh8y1FSwWAVd0B1yDl/kBXFi5dLD
	 ppHbVF4IXNk6XZOjujrTs4Q6lFMh5WpcnIX6SX3+rA09reitJyhCz5aPdD8sSusNbj
	 gIRe8ymIwmzOPA+yYyEhy/paLbMiAncMLWrMNbKw2DvO/wPN1pUHks1YzYhyuxJlbT
	 jDXAKttK/EF8pEUc5xSj6U2MMZ5jXMa5SeVOVwqQgkGD9Uv6uluXDtGiNW/ghtddXU
	 bwclpVQ2slrfaHtIPvgYo4+30rPaxQEChVMDLSyrP1pAx8aLbTOsc2jldt0cc23NkQ
	 8SPlqD7+qzFwA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:05 +0100
Subject: [PATCH v4 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-9-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 67267507ea1d..73cfe2eaacea 100644
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


