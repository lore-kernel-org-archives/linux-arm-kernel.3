Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92CBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yEy4iUEQRwnQgoFRJSbVa2XrH/UVGGcgBH3QNERPzdM=; b=ZQ6RqZl9+SS+lZwrLuLkuLQIM2
	LzbObTY43iKIpSnT85UCtF8gBx75eQZtRveNduO20S15HL4svxUryMj2+JBoDHURWlP2hWDFwLZ9N
	vLOkniUA5oLDb293ry7u2CMnMe5qDZTiZEfd4ja2Ig3lQg8gmNeoHXLPyjCSyZYIA3bJpfAUU7EOY
	V939uIZy+me4JqgaOxPPVn2Xl25SK0fVbgMWQjpBAxyYuYf4wjfyz/mL9IUEI8qVe+zF0XyoaTWc5
	GKzbv1m3iwgc7lms8hVVNDKh/rlQenQKnQtvlzDcNiRYC+vm8iFk4vBtqifTijtsv9k7rb8MQOw2f
	2eBBbeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIH2-00000008Z6V-2Iym;
	Fri, 07 Feb 2025 06:55:36 +0000
Received: from [198.47.23.234] (helo=lelvem-ot01.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgID7-00000008YRN-2nDj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 06:51:35 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5176pS6F3777752
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 00:51:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738911088;
	bh=yEy4iUEQRwnQgoFRJSbVa2XrH/UVGGcgBH3QNERPzdM=;
	h=From:To:CC:Subject:Date;
	b=x4uN012BIh7LsG+twhT0FOQ+32fYslGI/rGRtOs5sJJpiYgkSi11ddWrts5UovQ9f
	 kYEyNwuKYG60eCJjIBYHbkpZMc8T4Yghb7Auilz0ofRlfvxrLO62cbSwwnuaZbRkrR
	 aK887DEHLHSpWfvemLOTq4KDO3JnW9EquFBETP/Y=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5176pSxn032038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 00:51:28 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 00:51:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 00:51:27 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5176pOX8077856;
	Fri, 7 Feb 2025 00:51:25 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] soc: ti: k3-ringacc: include platform_device header
Date: Fri, 7 Feb 2025 12:21:23 +0530
Message-ID: <20250207065123.879863-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_225133_856977_7EFAB1BB 
X-CRM114-Status: UNSURE (   8.17  )
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

Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
users therefore will not include "platform_device.h", resulting in
compilation warnings for the APIs declared in "k3-ringacc.h" which assume
inclusion of "platform_device.h" by its users.

Fix the compilation warnings by including the "platform_device" header
file, which should ideally have been included since commit under Fixes.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
bb066fe812d6 Merge tag 'pci-v6.14-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
of Mainline Linux.

Regards,
Siddharth.

 include/linux/soc/ti/k3-ringacc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..6bbb58068048 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -8,6 +8,7 @@
 #ifndef __SOC_TI_K3_RINGACC_API_H_
 #define __SOC_TI_K3_RINGACC_API_H_
 
+#include <linux/platform_device.h>
 #include <linux/types.h>
 
 struct device_node;
-- 
2.43.0


