Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C72C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StOLANgoUDdDCghzEyyTo31Qu80FIuZFNWrDA8Xal/Y=; b=l0wO/s/AE38pEaHJT1NTgUJbt3
	QXq0zkTm5keHJzFzls5HOJyztbIJ809jbZGHT8zXmd862Sse/Q89d/2BImT6Z3awtDio2hnry9g7r
	d0VfV52BEqfOHMUExzWhnSUJ2CLvL4DJoHBNc1JUua2Srvv7m4dU1ft+xq9AVhPuPLelAHdxd3Xqj
	1ozmdJsrYjMLoOy7rPTD3i/wQ41K6vTDdtm8bjjHmM/2gqm+5jDLX4u7dftcma+btuYYhnXylaD4u
	ydSGiG/VkwzPhr8hyvTs0qsV4jq3ABZMX8g30hl8ExoiQgo2rLLjtfUVG54VGzM+Y2y7iyzOvXedc
	9Ouv6n0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iEV-00000008O9Q-2Z7B;
	Wed, 16 Sep 2026 05:30:59 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iER-00000008O3Q-2fKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:30:58 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 13:30:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 13:30:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 16 Sep 2026 13:30:40 +0800
Subject: [PATCH v3 3/9] EDAC/aspeed: Free the interrupt before the
 mem_ctl_info on remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260916-edac-v3-3-23e9ed2fbdf9@aspeedtech.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
In-Reply-To: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536639; l=1363;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=RlxiTc6ufbAPp2W9fkd50aRtYznC++m4JM40pI/YrqE=;
 b=rnOoVpqXeg5E96TKBNdbFXJ2JZ79qG1hfXFi0b0vcir9V9JIJxZifMy1qJVZ6I5OzuSOUhYoP
 bBwdF7LEZ6lDxjgnPc5txFFuwkbfra70zaUq4Ac7WpE5/lSvoXssau1
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_223055_856684_FEFFCC27 
X-CRM114-Status: GOOD (  12.52  )
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

Fix the ordering and synchronise by freeing the interrupt prior to
releasing related memory.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: stable@vger.kernel.org

---
Changes in v2:
- New patch.
---
 drivers/edac/aspeed_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 83d60414f89a..e05ebed5c2f2 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -359,11 +359,16 @@ static int aspeed_probe(struct platform_device *pdev)
 static void aspeed_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci;
+	int irq;
 
 	/* disable interrupts */
 	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
 			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
 
+	irq = platform_get_irq(pdev, 0);
+	WARN_ON(irq < 0);
+	devm_free_irq(&pdev->dev, irq, platform_get_drvdata(pdev));
+
 	/* free resources */
 	mci = edac_mc_del_mc(&pdev->dev);
 	if (mci)

-- 
2.34.1


