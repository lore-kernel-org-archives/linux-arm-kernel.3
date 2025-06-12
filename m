Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D77C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhMgCzLFHDrjP7IHTKbvXrrvOjH/iAr+ej+q3Ejpd68=; b=gNPdjOMYLcL09HqZmaX7rOhoYp
	isipPWe57HdXpIi3dGecO4VB1yBJylcc8NZrtktd9MMcQc93J8Tdzk04cB8qINeNBNMh5DEtYpky9
	vqDlnPw/qTqDo98CI5ZuIQ81+ERWdMvjGxXKLv9LtfDlc/uF+LO5MeHZ+B6K+ZAmr8F+3/UTo9gWK
	+aETZC+4TWuHLf/lI+bJ7xYeF6eBHEUAqWo2uth3wI0lxww/yOo6KBaZ66fJx4CaG57tnPGUnF549
	o/nkzEq2u2Z/23gULPiRZNakM7umBBNLgHnWX5uqxaIlysDmRBGDZQLVHuq5JXfHZ84oyChIDikPm
	0fKaBLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcX7-0000000CTRY-30Dv;
	Thu, 12 Jun 2025 07:39:33 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcAl-0000000CPet-3Vfw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:16:28 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C7GPa71594309;
	Thu, 12 Jun 2025 02:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749712585;
	bh=XhMgCzLFHDrjP7IHTKbvXrrvOjH/iAr+ej+q3Ejpd68=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=asFA2Tb0X3GrLpoIhs8JEbCZjBSm4dUiMPyLlCz1cpR/AAW/Du55Bch6TYK0Zwg2I
	 4OVUMc1osty6Kdd8r8yNKRNRLHsKqlevWos7LQT+HKxvE16eGXXfsZ2m3Y9e1e6A2P
	 fRt034ez0GLKv8Eu7xvRRuTe0NdnLfiO/SMjDqsI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C7GOhZ1618875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 02:16:25 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 02:16:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 02:16:24 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C7FTKW1608959;
	Thu, 12 Jun 2025 02:16:19 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
Subject: [PATCH v2 10/17] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Thu, 12 Jun 2025 12:45:14 +0530
Message-ID: <20250612071521.3116831-11-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612071521.3116831-1-s-adivi@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_001627_967156_2D8B1F86 
X-CRM114-Status: GOOD (  10.41  )
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

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 2 ++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 9c541646e8e44..27abf389cc878 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2489,3 +2489,5 @@ int setup_resources(struct udma_dev *ud)
 	return ch_count;
 }
 
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 2df0ebe8e7fac..be3dab9fbebba 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2854,5 +2854,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.34.1


