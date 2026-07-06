Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC922C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xw8oKErKJugwoULnyAAaflBVsSMulF1hLp82YBU5bbo=; b=lt7wYTg4w2ru9AVpd5Iu7joj8e
	S55pXZ0wq7FFv1lfm+0G0ijVK/ytWN5JpEo21NdXbdflp64xt/dQK+FlNmXBw/opl0JGAMWkOdtdY
	ibdGsqvqd7fwHmnEGQeAnbPkKpUf+NrzApbZT+gZRbnvLLKqCG5aNRuXJJ/tuMZQHrlp6OXBqu5E6
	U1cojMe+SHcmBdtscODWOT1yMsWjvKOlpm6l7KZKWr4AXrca6Z/fPhK8EIaHaL2t8MroINTYCBqNn
	98xTwVbXDie+0ha5TMZnbm1HWaqAFoJeEc67uNCH2h+QuC9uCfd9KaMxMrX9fQljgzqIb4wzDxOYD
	978jb2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkbe-0000000CnXh-2KWb;
	Mon, 06 Jul 2026 14:47:34 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkbW-0000000CnVF-2rUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:47:30 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHntH6v0tqN487Fw--.49535S2;
	Mon, 06 Jul 2026 22:47:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Nishanth Menon <nm@ti.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Sandeep Nair <sandeep_n@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: ti: knav_qmss: remove debugfs file on teardown
Date: Mon,  6 Jul 2026 22:47:06 +0800
Message-ID: <20260706144706.96313-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHntH6v0tqN487Fw--.49535S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyxZw18uFWfKF47JFyxKrg_yoW8KryDpa
	ykuFyfCry0ka1a9345Ar4UZFyfA3s3AF1xJrWxZ3sYyF1Ut34rXrW7Ga4jvFWrXrZ5tF42
	qr4Ut3s8Xr4UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUU
	UU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_074727_086522_CAF338CB 
X-CRM114-Status: GOOD (  13.18  )
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
callback reads the global knav_qdev state. knav_queue_remove() tears
down the queue manager resources but leaves the debugfs file published.

Save the debugfs dentry in struct knav_device and remove it during
teardown before the resources used by the show callback are released.
While touching the debugfs_create_file() call, spell the unchanged read-
only file mode as 0444.

Fixes: 41f93af900a2 ("soc: ti: add Keystone Navigator QMSS driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- rebase on current linux/master
- store the debugfs dentry in struct knav_device instead of a separate
  global variable, as suggested by Nishanth
- spell the unchanged debugfs file mode as 0444 and document it
- keep the existing device_ready handling and current knav_qdev naming

 drivers/soc/ti/knav_qmss.h       | 1 +
 drivers/soc/ti/knav_qmss_queue.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss.h b/drivers/soc/ti/knav_qmss.h
index 037dc1b36645..8a624fbda84a 100644
--- a/drivers/soc/ti/knav_qmss.h
+++ b/drivers/soc/ti/knav_qmss.h
@@ -304,6 +304,7 @@ struct knav_device {
 	struct list_head			pools;
 	struct list_head			pdsps;
 	struct list_head			qmgrs;
+	struct dentry				*debugfs_file;
 	enum qmss_version			version;
 };
 
diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 7410b63af0e6..2d564c2937d4 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1849,8 +1849,9 @@ static int knav_queue_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	debugfs_create_file("qmss", S_IFREG | S_IRUGO, NULL, NULL,
-			    &knav_queue_debug_fops);
+	knav_qdev->debugfs_file =
+		debugfs_create_file("qmss", 0444, NULL, NULL,
+				    &knav_queue_debug_fops);
 	device_ready = true;
 	return 0;
 
@@ -1868,6 +1869,8 @@ static void knav_queue_remove(struct platform_device *pdev)
 	struct knav_device *kdev = platform_get_drvdata(pdev);
 
 	device_ready = false;
+	debugfs_remove(kdev->debugfs_file);
+	kdev->debugfs_file = NULL;
 	knav_queue_stop_pdsps(kdev);
 	knav_queue_free_regions(kdev);
 	knav_free_queue_ranges(kdev);
-- 
2.43.0


