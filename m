Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNotStSquqSFK0hMAyIgrA/RVsRNMLOKCsMmm1oXZOs=; b=Yew03mIIMVc8hEEU4+DRedidPN
	MqlGllpkEuIJRoognFnz/Ob12iJB6ttMuV3S25IcNFpQqIoIAP8k/jtrsaIQ96PGT8U7IjbrWfXtM
	x1JAUMfrdMH5/VE6uQaSYPfTLDMQbJCmw5QXhWOEQyOwxCY0pmScbuJsWye6/N1JuXFtrCPj0abp0
	G28BY1jzuZQrrDxm1HzAE9XmUejWdH7kSUu/nWpJ551ojXlvEcUYTNCPyIw2eRKV9DpJJYO064ZqU
	Doz2NpO0xcFtgcZGbKQVyl3/+VPwNS0yF6QIsriAjE5fffR9C5uoqJPxHDCutQnBiuaMNufrNb0rw
	tOeFNdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwsLv-0000000AkwG-11xm;
	Thu, 20 Aug 2026 02:17:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwsLs-0000000Akvi-1P5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 02:17:58 +0000
X-UUID: 5514da589c3d11f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:137abac5-6e03-44b8-8f40-7346ad6be806,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:1dc6f0cb647b155389abae454a9ca50d,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5514da589c3d11f19a56ed5b684f684d-20260820
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 531664091; Thu, 20 Aug 2026 10:17:45 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	sudeep.holla@kernel.org,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] firmware: arm_scmi: pm: use DEFINE_SIMPLE_DEV_PM_OPS for pm struct
Date: Thu, 20 Aug 2026 10:17:18 +0800
Message-Id: <20260820021718.2454014-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_191756_700048_4DE3A259 
X-CRM114-Status: UNSURE (   9.14  )
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

use DEFINE_SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
.freeze .thaw .poweroff .restore.if these address are null, may cause
error in s4.

Change:
-Replace SIMPLE_DEV_PM_OPS() in v1 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/firmware/arm_scmi/bus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e060edbe7e83..c3af5eb549e1 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/pm.h>
 
 #include "common.h"
 
@@ -361,10 +362,7 @@ static int scmi_pm_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops scmi_dev_pm_ops = {
-	.suspend = pm_sleep_ptr(scmi_pm_suspend),
-	.resume = pm_sleep_ptr(scmi_pm_resume),
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(scmi_dev_pm_ops, scmi_pm_suspend, scmi_pm_resume);
 
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
-- 
2.25.1


