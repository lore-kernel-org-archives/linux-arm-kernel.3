Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA0CA5FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 05:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzfGEJLpHwH50IZOK4KkDMKN3sG+LbnJq7S0viXLif8=; b=vlG2LRF6FMtm9L8abRZuFhpHg+
	MxT2/NkXr23cLE/vNqLQK1YehIFvl/7MKVepTbEOpmlcmIO6PqiekCOeaRqO4g/aeo3amHxh2ZA8j
	6lRId2rpoHfv7Ad9zbY3xlKZF8QuIXByr+EWQgTMGIeRgYwC5F4rF2MPLcl97Lm0JpVPmPl/6Em53
	KUtzs5J6AvUiCVsVbx3SnnO0m3+nlBY64Uaz9LmqZsNrCMBodlSE5RE0xjZabq32nEfd6TTOIRsgb
	46ZdqH1iJ5doo7ZFWAKVznDPNJEXab1MiJv+TISCLRvM7+Tqn8axn4e+H5XHXlBZW8nlLuLsDQ0Mj
	RRf6TXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmf5-000000051tf-2DRv;
	Wed, 30 Sep 2026 05:15:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBmf0-000000051oP-03ts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 05:15:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Sep
 2026 13:15:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 30 Sep 2026 13:15:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 30 Sep 2026 13:15:02 +0800
Subject: [PATCH v4 4/9] EDAC/aspeed: Free the mem_ctl_info unconditionally
 on remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-edac-v4-4-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
In-Reply-To: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790745299; l=1565;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=7kVBSW+iJq7iG0C/gaN+W7UHNDDfaeN9Q8zh7Gh7SjI=;
 b=H9Byb9NgdLg6aM+qdKUhskY0XKNa9wuQwv/hYGV/IVIx4+FzRHam+Uz3t55eaUDaRKrtRnhCy
 qdDLVAR5fFgBFRt9FCt3bjZCcOCH6GYL53CQoZE0ZvBMxugVM7OmnRY
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_221518_073284_F14FDAC1 
X-CRM114-Status: GOOD (  14.19  )
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

aspeed_remove() is a driver .remove callback, so it only runs for a device
that has already probed successfully and registered its mem_ctl_info. In
that case edac_mc_del_mc() always returns the same, valid pointer, and the
NULL check on its return value can never be false.

Fetch the mem_ctl_info from the platform device's driver data instead and
free it unconditionally, dropping the redundant check. This also decouples
the teardown from the return value of edac_mc_del_mc().

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index cd2a6fcca355..352910e1defc 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -343,7 +343,7 @@ static int aspeed_probe(struct platform_device *pdev)
 
 static void aspeed_remove(struct platform_device *pdev)
 {
-	struct mem_ctl_info *mci;
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
 	int irq;
 
 	/* disable interrupts */
@@ -352,12 +352,11 @@ static void aspeed_remove(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	WARN_ON(irq < 0);
-	devm_free_irq(&pdev->dev, irq, platform_get_drvdata(pdev));
+	devm_free_irq(&pdev->dev, irq, mci);
 
 	/* free resources */
-	mci = edac_mc_del_mc(&pdev->dev);
-	if (mci)
-		edac_mc_free(mci);
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
 }
 
 static const struct of_device_id aspeed_of_match[] = {

-- 
2.34.1


