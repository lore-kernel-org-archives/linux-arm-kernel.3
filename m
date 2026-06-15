Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZoxlApcv9AQepqjoi0oI9FbZKhi/RumfJZWLsfw0Ew=; b=i/WW2jgPnJgb9dxHLNptabo9Bh
	9y/Q/DnVw8S34K19xAb2J6DuJIoPgeW1sS5vwNLuR5T2Vx+4yNOzg4PXPmNFPAMNYwcUNWJNHc+8s
	N2kb2KezHZgxcDTVqq0Gl+oHFKq8S/8n377sVY/+O3wBSLyhx0CByFb/a/YvMWRjvUqbgxgWdJwYN
	7Xg3fOhE5mEMNeKOLdlEMe0mL10BRTo3qjTAKnkP8KoNWNmo6bLZdrFCEPZshLNoGn8wZ3ZvD/Wek
	rR90Hy0Ur4ldXMKPeiqbDxV3D5Z8E4TbyXxgWbVX136iVpCzSuIUZmRELnbx4nn1xiC7At/dksMB6
	QhA+SuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3MW-0000000Dwzv-0qCL;
	Mon, 15 Jun 2026 09:12:08 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3MT-0000000Dwyz-1m5E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:12:06 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABXddziwS9qmGPLFA--.801S2;
	Mon, 15 Jun 2026 17:12:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] soc: ti: knav_dma: remove debugfs file on teardown
Date: Mon, 15 Jun 2026 17:12:00 +0800
Message-ID: <20260615091200.2373-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXddziwS9qmGPLFA--.801S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5XF47AF18uFWrWr4kZwb_yoW8CF18pw
	n29Fy3Wr4qvF13Cr13Cw4UuF1Sg3ySyayxA397u3WSkw15Xwn8XFyDJFyUtry5JFZ5GF1j
	vFZ8t34rZr4UJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU0VbkUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_021205_828619_3CE8453C 
X-CRM114-Status: GOOD (  11.27  )
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

knav_dma_probe() creates the global knav_dma debugfs file whose show
callback walks the global kdev list. knav_dma_remove() tears down the DMA
instances and runtime PM but leaves that debugfs file and global ready
state behind.

Save the debugfs dentry, remove it before destroying the DMA state, and
clear the global ready pointer state during remove.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soc/ti/knav_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index e5f5e3142fc4..9277c525ac21 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -125,6 +125,7 @@ struct knav_dma_chan {
 			ch->channel : ch->flow)
 
 static struct knav_dma_pool_device *kdev;
+static struct dentry *knav_dma_debugfs;
 
 static bool device_ready;
 bool knav_dma_device_ready(void)
@@ -740,8 +741,9 @@ static int knav_dma_probe(struct platform_device *pdev)
 		goto err_put_sync;
 	}
 
-	debugfs_create_file("knav_dma", S_IFREG | S_IRUGO, NULL, NULL,
-			    &knav_dma_debug_fops);
+	knav_dma_debugfs = debugfs_create_file("knav_dma", 0444,
+					       NULL, NULL,
+					       &knav_dma_debug_fops);
 
 	device_ready = true;
 	return ret;
@@ -758,6 +760,10 @@ static void knav_dma_remove(struct platform_device *pdev)
 {
 	struct knav_dma_device *dma;
 
+	device_ready = false;
+	debugfs_remove(knav_dma_debugfs);
+	knav_dma_debugfs = NULL;
+
 	list_for_each_entry(dma, &kdev->list, list) {
 		if (atomic_dec_return(&dma->ref_count) == 0)
 			knav_dma_hw_destroy(dma);
@@ -765,6 +771,7 @@ static void knav_dma_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	kdev = NULL;
 }
 
 static struct of_device_id of_match[] = {
-- 
2.50.1 (Apple Git-155)


