Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2167C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=; b=ygR408mi+jsEf3Rr4sKqdCB8eH
	eB4hFLTfwezENWeqxupXwYaHYOhGzSNYneTWGGo671qgR7PmpRWawqp1/dnRSdkS2sroEFbybsSvb
	O4/LHlUyFDz6c0XSCF/WZS7PwYYLNp06T0OD+D+YqYI0fIC653ulin4/DjbwnFvQnKj+po+VRqtMa
	ob39ZejgoT6Hd4jGQ9nMMJZM13RkvOmJNZX0RCg6Nj41pzEfhVVjp++ubALcCi9eSP3BgcG2eNE8L
	2BnMuHyYpvdDqKh8OrVGbf/lTbzIlx9MVIaY/HcdETyWMIcuo4geTbDuB50p9KJzCwwGg7Pkn16QP
	yGbRrL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX2-00000001exK-2W58;
	Thu, 09 Jul 2026 08:54:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVI-00000001aYU-0Wbc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCB81418FE;
	Thu,  9 Jul 2026 08:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2731F000E9;
	Thu,  9 Jul 2026 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587187;
	bh=L9WYDR5trI7p9S+Iac5p6xn9rhzelgxyQenxL6PczGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bar/EztNxGT1+fhCeoRg+hYkaUehvMQY2T829gmYYVbt1FCzP8LDyuoLNct5mAGM5
	 k03WU5swcgsK4Px8gfz6Vkinlji9Xp+qzIZA0p2NGDv4ujn87TLTUWFAo1CFCP54kl
	 TbswaEkLeSO3AcrSMsVSf8VbmpdVEwwaspD+kto7e7/53lzI/S2rmP3eMSiIKuveAj
	 eFUBzW0+CpIjP2xUW0N4pVwMO00sSpGCOAYt9EGS2GscXY3XS/UFwpfJRAknC+UyP8
	 wcPhkceqsgmJF0psUUJAwdQhpeqtT8WxT6cAbHo7k0tO+O2IEMz525CLhCkwCPe05o
	 hNbmEnchc5yMg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:33 +0100
Subject: [PATCH v5 09/16] firmware: arm_scmi: Protect device request lookup
 with RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-9-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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


