Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BDBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/lJdiP4MMrsMxVhZojvsLz0AQ80OWJfwqihWe33qm8=; b=jJDny0aA5a8RXMzCXWYSDXeCKM
	7YQziOiLuPMcWFMu8j4gZWHNslLejESBSLPxo9l266Uy3ZO/DQVKsPAJ1E6KxZbNMTFPxnC1c/3dQ
	NR/SalO2atx6SmyF+SGqlaoOGwmZekv0NxW3YnQ3NFhNaBVRxmY4GUto75ugOC3PXGEOLi+j94/wW
	pmwpF++aGFHg72Q+k+bbYl6hkma4cwq0zj51s86dieo2GGoiy4it8CPeeysxMtkcFE1wBtb+YpjuG
	IDtHRinT4bfBB/v4RZFvZZAJTmd02QhFIZafShgo98/x7dMfrp5+BK9texjwNkPp5BV0FIVXBUXdh
	BdHCWoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITo-00000007YJT-29M5;
	Wed, 23 Sep 2026 08:37:28 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITg-00000007YGG-3h75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152640; x=1821688640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/lJdiP4MMrsMxVhZojvsLz0AQ80OWJfwqihWe33qm8=;
  b=IbT507TaZUWKFnDo3QwPgA9c/E/K3hmahuMwOEonIn1Xy45Sn5kRNY2/
   82z4bBlSEotl+8gBr6n8ISox26WL2MB5R35VljgLloW0UyeHGYamOzp9M
   RiM/XHQsfCOlDcla9aqf21D0LsGKdlaIRsppw/mNut0f/iUoLacXAZ2fP
   Ggzn9GDTQAACWqqw9d3pwDY+5ahIb1M2x5PY87Otevmr89e70yjksKTH9
   UFZl+fOK4jWBPepUSvr0CjCGAhrPJkht47c2Gu7KXmV3G1BlblksqoQna
   cnu/vpdKAw9oZzIeLz85gFsqcVDlVB0IwySIZc86Rf33FWW4fPHq/463Q
   Q==;
X-CSE-ConnectionGUID: dq4XxM7BSa6cNOOLkhtlgA==
X-CSE-MsgGUID: pKw+rOEDTnqv6+PQx+yiJQ==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29415376"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:15 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:4792]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.208:2525] with esmtp (Farcaster)
 id bc26085e-0f7a-495a-b7b1-1f149d6bacd0; Wed, 23 Sep 2026 08:37:14 +0000 (UTC)
X-Farcaster-Flow-ID: bc26085e-0f7a-495a-b7b1-1f149d6bacd0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:14 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:13 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 3/4] irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
Date: Wed, 23 Sep 2026 08:37:02 +0000
Message-ID: <20260923083703.38974-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013720_966412_1B93B671 
X-CRM114-Status: GOOD (  11.40  )
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

Fix the coding-style issue reported by checkpatch:

  ERROR: space required after that ',' (ctx:VxV)

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 20f1f7f7612b..8155f63cfd29 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	 * To select the primary GIC as the target GIC, bits [18:17] must be set
 	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
 	 */
-	priv->addr = res.start & GENMASK_ULL(63,20);
+	priv->addr = res.start & GENMASK_ULL(63, 20);
 	priv->addr |= ALPINE_MSIX_SPI_TARGET_CLUSTER0;
 
 	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first)) {
-- 
2.47.3


