Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244BCC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7YIOafvXbCcZYfkJxsD9i8XvErNivDNnj0yBlvpAKmg=; b=jqbKPDuHeJQZlN6D1sOWN6LezH
	kj9bm0/I+nmj3QDAxrd3Pe8vd5vhMngvMBCZgOo+Xl9L0Qd/oyUTH/mprovLRgxuynYDiKdFCY1Id
	w/0XoHnQZcDCggyneUm2vXRNwqkQl04n9SWQd3JfwlicpBl4pXV7MduUN4pyOBfBcqsKllMI3RuUc
	u4USzy2Kv68EPvhA2EjvXDEPOjPRjU+D5yd6kdx0RakesMN+qwli8HTacKxuUGaU7ibRFNsrD4t5t
	1qChf6X7n6FqO/XYPuba2qj1PouOaw4KVABgTDoqwt2o/cnLnFTNh4f1FMWSxdPhW+D7ioPtChdt1
	nUGdD8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lv1-0000000EwMr-0PUg;
	Wed, 02 Sep 2026 14:26:27 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lux-0000000EwLH-3HLc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:26:25 +0000
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c487cfc0;
	Wed, 2 Sep 2026 22:26:07 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] peci: aspeed: Initialize state before requesting IRQ
Date: Wed,  2 Sep 2026 22:26:00 +0800
Message-Id: <20260902142600.3580382-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa062834d9e03a1kunm2177e8e01adc4c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShlDVh8fTkhKHk9IH0gZHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KKF8bk19ENztW57ojYhZ3fOHVd6TfrO65VlreY5e/zGH8R63SXibz+1hD52XfdiBQEOmmSl+B0x1erwvCUuV8L1sARACXJtB8X83tXJBikjKGw7EeO8+2Xq5uZ7u9qRMdUOafMr8TNGwhZei0FHZInCgqSKU8fq84x7ouLYwvxU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=7YIOafvXbCcZYfkJxsD9i8XvErNivDNnj0yBlvpAKmg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_072624_049979_98AABD62 
X-CRM114-Status: GOOD (  10.08  )
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

The PECI interrupt handler uses the lock and completion object as soon as
the interrupt is delivered. Initialize both before registering the
handler so an early interrupt cannot access uninitialized state.

Fixes: a85e4c52086c ("peci: Add peci-aspeed controller driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/peci/controller/peci-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index a0c99ecf7..5d7f4f8fd 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -529,14 +529,14 @@ static int aspeed_peci_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
+	init_completion(&priv->xfer_complete);
+	spin_lock_init(&priv->lock);
+
 	ret = devm_request_irq(&pdev->dev, priv->irq, aspeed_peci_irq_handler,
 			       0, "peci-aspeed", priv);
 	if (ret)
 		return ret;
 
-	init_completion(&priv->xfer_complete);
-	spin_lock_init(&priv->lock);
-
 	priv->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->rst))
 		return dev_err_probe(priv->dev, PTR_ERR(priv->rst),
-- 
2.34.1


