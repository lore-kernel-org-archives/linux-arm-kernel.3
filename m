Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B641CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rr4yuCNfg5HsUUkcOsfFCGxjcdFKshVPsfZOetiSko=; b=aN5cj4HsHn3lunTAO317scBx3R
	pTGRgxOOfPPEfUnx3K8UtNwf5yMnELLS/95VNykYGIRAAbDJPGMYzopBrCHBWXuPvsoZC3AePkfwn
	7dUMZ+zXCM/qxnWwTuGI5YHly/ip1Y6vGmHD+vTYB2RIGQiIuPJ0/Y86GxtRpcMtcNiayBvhpT0cI
	jmyIDnqyRaHHwqrYPPgn7ZAYktG4hHzFdJKA7UvZSHZBJNc/lMDNAfj1d4zl1+Q65s/9gjFwALCt2
	Lz3zTS4vbjst3xhbXIsdBtYqZaCgDMh6a8meen8jlNw14byZStGKWnpBDPSKSGVWHUVVpg8IjZ55B
	zLlgdoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy17-0000000DW69-2hQV;
	Mon, 15 Jun 2026 03:29:41 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy15-0000000DW5J-136w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:29:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gdwZX4CRszKHMPw
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:28:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 27FE44058C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:37 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgAnKj+PcS9qOnxeBw--.30354S3;
	Mon, 15 Jun 2026 11:29:37 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH 1/6] irqchip/gic-v3-its: Fix LPI range leak and refactor error handler in its_lpi_alloc()
Date: Mon, 15 Jun 2026 11:29:05 +0800
Message-Id: <20260615032910.54735-2-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260615032910.54735-1-shikemeng@huaweicloud.com>
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAnKj+PcS9qOnxeBw--.30354S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW5GF1DZFWkKFWUZr43Wrg_yoW8GF15pF
	4aga9Fyr4rAay3Gw47AFykXFy5J3Z7JFW7KFy7Ga1xuF15CasIgF4xAFyrX3WxAryxJ3W7
	AFZ5Ga48ua1UCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUJnYwUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_202939_467687_371373BF 
X-CRM114-Status: GOOD (  11.66  )
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

Fix the LIP range leak when bitmap_zalloc() failed. Besides refactor
error handling code to make it a little simpler.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 291d7668cc8d..2b7b546c43c8 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2217,10 +2217,9 @@ static int __init its_lpi_init(u32 id_bits)
 static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
 {
 	unsigned long *bitmap = NULL;
-	int err = 0;
 
 	do {
-		err = alloc_lpi_range(nr_irqs, base);
+		int err = alloc_lpi_range(nr_irqs, base);
 		if (!err)
 			break;
 
@@ -2228,22 +2227,20 @@ static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
 	} while (nr_irqs > 0);
 
 	if (!nr_irqs)
-		err = -ENOSPC;
-
-	if (err)
-		goto out;
+		goto err_out;
 
 	bitmap = bitmap_zalloc(nr_irqs, GFP_ATOMIC);
 	if (!bitmap)
-		goto out;
+		goto err_free_lpi;
 
 	*nr_ids = nr_irqs;
-
-out:
-	if (!bitmap)
-		*base = *nr_ids = 0;
-
 	return bitmap;
+
+err_free_lpi:
+	free_lpi_range(*base, nr_irqs);
+err_out:
+	*base = *nr_ids = 0;
+	return NULL;
 }
 
 static void its_lpi_free(unsigned long *bitmap, u32 base, u32 nr_ids)
-- 
2.36.1


