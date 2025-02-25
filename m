Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CE1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sx+wG2I6muMWRlpq3+WkBLnFuG4GL7QMDnbx+k/VDoo=; b=pODd7e07zhV0isjGPBJwXvgvmt
	bZ539hUet/PpdRwNVvV83aqh9demXn0tAHPb9mT8JiV744jBD1wfGv3Z6QvGSHpTkcTr+HEzejeV8
	o7s0R4pP5713H0LAkASfjsVaNwX/Q2wkW4vXuSZ/JnbE7pSnv0M/ocqH3W1m83KmY1KsmaiwWM29t
	KtIZRx1VzIBNFLSZlX+dE6UjM/xYOEFgeD+QeOyRRHogM+/ySpW6b5eS8jwm/l3RGL9nFJmUzcWwm
	l0hKEZchyTlFEHWT78xYDszsnhW67bAvxfRfVTw1dTYsqJG5qXJ3noAmVVJgjwNcFLM0Yvfker2+r
	CU2qzQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkYf-0000000Fn0Z-0zir;
	Tue, 25 Feb 2025 02:20:29 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkX8-0000000Fmr7-0gEV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 02:18:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z21Q45C0rz2CpdY;
	Tue, 25 Feb 2025 10:14:36 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id B12CD1A016C;
	Tue, 25 Feb 2025 10:18:38 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 25 Feb
 2025 10:18:38 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: <aubin.constans@microchip.com>, <ulf.hansson@linaro.org>
Subject: [PATCH -next] mmc: atmel-mci: Add missing clk_disable_unprepare()
Date: Tue, 25 Feb 2025 10:28:56 +0800
Message-ID: <20250225022856.3452240-1-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_181854_365156_681D6282 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, wangweiyang2@huawei.com, ludovic.desroches@atmel.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The error path when atmci_configure_dma() set dma fails in atmci driver
does not correctly disable the clock.
Add the missing clk_disable_unprepare() to the error path for pair with
clk_prepare_enable().

Fixes: 467e081d23e6 ("mmc: atmel-mci: use probe deferring if dma controller is not ready yet")
Signed-off-by: Gu Bowen <gubowen5@huawei.com>
---
 drivers/mmc/host/atmel-mci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index fc360902729d..24fffc702a94 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -2499,8 +2499,10 @@ static int atmci_probe(struct platform_device *pdev)
 	/* Get MCI capabilities and set operations according to it */
 	atmci_get_cap(host);
 	ret = atmci_configure_dma(host);
-	if (ret == -EPROBE_DEFER)
+	if (ret == -EPROBE_DEFER) {
+		clk_disable_unprepare(host->mck);
 		goto err_dma_probe_defer;
+	}
 	if (ret == 0) {
 		host->prepare_data = &atmci_prepare_data_dma;
 		host->submit_data = &atmci_submit_data_dma;
-- 
2.25.1


