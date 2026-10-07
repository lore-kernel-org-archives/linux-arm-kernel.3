Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E35ACA600A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wfWb6pR/Jd7nyknzw8Bq27GUa+yqLx4jC5oPYHK8jo=; b=ONcihznejUsldzeh1ENSof//Oz
	+/oxH+ntqNzHPprpO8pyRf8xncFfXNEoJWos7OPFaoMd8BFi4jdWVUQ20avC5CEzA4WIb80imEIlT
	T7Tsu8zm2G5we1sOYZ/axrhUw/pgmFrh0nIzb431XsZiKJ4DmTzdP7BQ3pirFSF4o+cccVA125hcq
	SFLfu3Mn1pKGaPKtJNxFQ5ntNNaLK2a0liQtD8oEpclH9fBpYrnnPApFdVvyY13N9EXhriwcs6muP
	Hwuz4jfEM6Oz3BayoBDEy0JV93WGs5e6OQuQMaDtf6Wf5kuPfCfYXY7Yo2UeLRuUDyYtBtaRd1Z8A
	XH9dbozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKuF-00000001ks6-2ANG;
	Wed, 07 Oct 2026 06:13:35 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEKuB-00000001kor-0eMd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:13:32 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 Oct
 2026 14:13:19 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 Oct 2026 14:13:19 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 7 Oct 2026 14:13:19 +0800
Subject: [PATCH v5 2/9] EDAC/aspeed: Free the interrupt before the
 mem_ctl_info on remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-edac-v5-2-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
In-Reply-To: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791353599; l=2176;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=HAabpmX2c//xzySbY96a1LqNR0wWgYBnoW1KUfWu6LE=;
 b=1NyCPAkhY78g1xuIJge7tW+Ruluz5gE63m7zzEcYSHL3a5vdv8o6xe757IGZlvwD70KD3K9kP
 FA9zfC30FxqB/pfflP6akobu/coHbbTw3sNsaf7qkcuWpY6wpp160vf
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_231331_200363_326281F4 
X-CRM114-Status: GOOD (  15.79  )
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

The ECC interrupt is devm-managed, so it is only released after .remove()
has returned, and masking the controller does not wait for a handler
already running on another CPU. edac_mc_free() can therefore free the
mem_ctl_info the handler uses as its context while it is still running.

Register the handler with request_irq() and free it before the memory
it uses. aspeed_probe() returns as soon as config_irq() succeeds, so
devres has no error path left to unwind.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

---
Changes in v5:
- Use request_irq()/free_irq() rather than devm_request_irq() followed
  by an explicit free, and keep the interrupt number in a file-scope
  variable so aspeed_remove() does not have to call platform_get_irq()
  a second time.

Changes in v4:
- Drop the Cc: stable tag.

Changes in v2:
- New patch.
---
 drivers/edac/aspeed_edac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 83d60414f89a..cb233a33d29a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -36,6 +36,7 @@
 
 
 static struct regmap *aspeed_regmap;
+static int aspeed_irq;
 
 
 static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
@@ -212,11 +213,12 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	rc = devm_request_irq(&pdev->dev, irq, mcr_isr, IRQF_TRIGGER_HIGH,
-			      DRV_NAME, ctx);
+	rc = request_irq(irq, mcr_isr, IRQF_TRIGGER_HIGH, DRV_NAME, ctx);
 	if (rc)
 		return rc;
 
+	aspeed_irq = irq;
+
 	/* enable interrupts */
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE,
@@ -364,6 +366,8 @@ static void aspeed_remove(struct platform_device *pdev)
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
 
+	free_irq(aspeed_irq, platform_get_drvdata(pdev));
+
 	/* free resources */
 	mci = edac_mc_del_mc(&pdev->dev);
 	if (mci)

-- 
2.34.1


