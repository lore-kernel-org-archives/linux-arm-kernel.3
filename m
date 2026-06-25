Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F05CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUobQcvyhZOtyQtOikdb+eklZinioR0h77XeVrRsVtw=; b=1c0iMXQcSWDarihWxrRnVB3f1v
	8INJu74ACT6anB6l2li31n0b0rWRGrSapSbjRxpfWAjxvV5ouc4zp9t7pqLYUxWub2rHQpItlqBop
	VfuW2kSLaFdQW6yZPiDV2x8F2ly/0cPQRLMFoi6G4gdqIFtWu8j1KzcOUr1lEqzIFBDME30AbeiNq
	C2kW3nUxI/ibuD9Ul1/0OxGxm/t4+EoWZnLUsIhKTHhu/EoFf7Por701QNbeIjSKzOCVBGq1CWxQz
	JWFEEOYJQCiWNr0EytEax9M2V1UgwWBTxnt1mW+dMAWaMCVlWAmupfXu4imBh1+I34QO8lYI8nOXm
	HpUdLecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY46-00000008TVY-1jNG;
	Thu, 25 Jun 2026 00:35:34 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY42-00000008TUm-3KGN;
	Thu, 25 Jun 2026 00:35:32 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACnkKfOdzxqF93CFQ--.4393S2;
	Thu, 25 Jun 2026 08:35:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chaotian Jing <chaotian.jing@mediatek.com>
Cc: pengpeng@iscas.ac.cn,
	Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mmc: mtk-sd: report DMA stop timeouts as data errors
Date: Thu, 25 Jun 2026 08:35:25 +0800
Message-ID: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACnkKfOdzxqF93CFQ--.4393S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrKr13Ww1UKFy8tF4rAFb_yoW5Jr1kpa
	y5W3Z8KrWkXwn7W3yrCF1UXwn8Xa9aq398G348Gw1fZw1Fgr1DXa1DKa4FvFyayrWfJ3ZF
	9a18t3y5CrZ5JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoq
	2MUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_173531_201310_A863074E 
X-CRM114-Status: GOOD (  11.85  )
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

msdc_data_xfer_done() stops the DMA engine before completing a data
request, but it only logs failures from the DMA stop and DMA-inactive
polls.

When the interrupt status also carries MSDC_INT_XFER_COMPL, the function
can still report the full data length as transferred even though the DMA
engine did not confirm that it stopped or became inactive.

Treat DMA stop/inactive timeouts as data errors.  This reuses the existing
reset/error path and prevents a timed out DMA stop from being reported as a
successful full-length transfer.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mmc/host/mtk-sd.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b2680cc05..e3caa9c32 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1583,7 +1583,7 @@ static void msdc_data_xfer_done(struct msdc_host *host, u32 events,
 	     | MSDC_INT_DMA_BDCSERR | MSDC_INT_DMA_GPDCSERR
 	     | MSDC_INT_DMA_PROTECT);
 	u32 val;
-	int ret;
+	int dma_err = 0, ret;
 
 	spin_lock_irqsave(&host->lock, flags);
 	done = !host->data;
@@ -1603,18 +1603,23 @@ static void msdc_data_xfer_done(struct msdc_host *host, u32 events,
 
 		ret = readl_poll_timeout_atomic(host->base + MSDC_DMA_CTRL, val,
 						!(val & MSDC_DMA_CTRL_STOP), 1, 20000);
-		if (ret)
+		if (ret) {
 			dev_dbg(host->dev, "DMA stop timed out\n");
+			dma_err = ret;
+		}
 
 		ret = readl_poll_timeout_atomic(host->base + MSDC_DMA_CFG, val,
 						!(val & MSDC_DMA_CFG_STS), 1, 20000);
-		if (ret)
+		if (ret) {
 			dev_dbg(host->dev, "DMA inactive timed out\n");
+			dma_err = ret;
+		}
 
 		sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
 		dev_dbg(host->dev, "DMA stop\n");
 
-		if ((events & MSDC_INT_XFER_COMPL) && (!stop || !stop->error)) {
+		if (!dma_err && (events & MSDC_INT_XFER_COMPL) &&
+		    (!stop || !stop->error)) {
 			data->bytes_xfered = data->blocks * data->blksz;
 		} else {
 			dev_dbg(host->dev, "interrupt events: %x\n", events);
@@ -1622,7 +1627,9 @@ static void msdc_data_xfer_done(struct msdc_host *host, u32 events,
 			host->error |= REQ_DAT_ERR;
 			data->bytes_xfered = 0;
 
-			if (events & MSDC_INT_DATTMO)
+			if (dma_err)
+				data->error = -ETIMEDOUT;
+			else if (events & MSDC_INT_DATTMO)
 				data->error = -ETIMEDOUT;
 			else if (events & MSDC_INT_DATCRCERR)
 				data->error = -EILSEQ;
-- 
2.50.1 (Apple Git-155)


