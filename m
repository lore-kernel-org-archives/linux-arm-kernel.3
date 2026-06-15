Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED3CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLUWysLnXJUyDGlthAz7GhDDKzGTIrViXQc8Ymy47Dg=; b=B2pFJiY5/XgkBP9zhWzMHBrBj6
	j9JLOLATNzoCL9LL88Dn8wDvAofoViEAkQsueMxaZyI59IEnXaCaiFZSnPmQNYc0g+sEutNsAwloD
	9LYg8Rwb+P2soOMfrMFzyIl+Dgsas1RO973/MR37HrIC3Z5/ijvEc8TjnYkAax/AmfqswNb9BZIJj
	2OspTwfi8m88TUIOSG5J1gedLt5rpehcG9DpYXlHYhqUCOGhLxfbw7a5RGfku4eQwYHVJQM0bJNDU
	VQn838XFnu2Luv121t0LTO8FJHeljObktlFGqVDVoWcdvMHxdAX1znQI3ZMLChWn33F5PfqYRrXBS
	+9kFvxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3NP-0000000DxAJ-1WwV;
	Mon, 15 Jun 2026 09:13:03 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3NM-0000000Dx9K-2pbH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:13:02 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADX4Mcawi9q92nLFA--.857S2;
	Mon, 15 Jun 2026 17:12:58 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] soc: ti: knav_qmss: remove debugfs file on teardown
Date: Mon, 15 Jun 2026 17:12:51 +0800
Message-ID: <20260615091251.7129-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX4Mcawi9q92nLFA--.857S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1DZr1DGF13Ww4UtF1xAFb_yoW8Aryrpa
	yDZFyfGr409F42v3y3Ar47ZFySg34F9Fy7Jryxua4v93Wqvwn8Xry8JFWYqFWfXrZ5JF47
	tF4UtayqvF45A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260615_021301_246534_A7C1A8D5 
X-CRM114-Status: GOOD (  11.35  )
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

knav_queue_probe() creates the global qmss debugfs file whose show
callback reads the global kdev state. knav_queue_remove() disables
runtime PM but leaves the debugfs file and ready state published.

Save the debugfs dentry, remove it during teardown, and clear the global
ready pointer state.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soc/ti/knav_qmss_queue.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 86d7a9c9ae01..1cc2e4a90c0d 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -26,6 +26,7 @@
 #include "knav_qmss.h"
 
 static struct knav_device *kdev;
+static struct dentry *knav_queue_debugfs;
 static DEFINE_MUTEX(knav_dev_lock);
 #define knav_dev_lock_held() \
 	lockdep_is_held(&knav_dev_lock)
@@ -1857,8 +1858,9 @@ static int knav_queue_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	debugfs_create_file("qmss", S_IFREG | S_IRUGO, NULL, NULL,
-			    &knav_queue_debug_fops);
+	knav_queue_debugfs = debugfs_create_file("qmss", 0444,
+						 NULL, NULL,
+						 &knav_queue_debug_fops);
 	device_ready = true;
 	return 0;
 
@@ -1873,9 +1875,14 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
+	device_ready = false;
+	debugfs_remove(knav_queue_debugfs);
+	knav_queue_debugfs = NULL;
+
 	/* TODO: Free resources */
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	kdev = NULL;
 }
 
 static struct platform_driver keystone_qmss_driver = {
-- 
2.50.1 (Apple Git-155)


