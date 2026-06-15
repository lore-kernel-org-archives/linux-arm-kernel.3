Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0506CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yijyBRpjslnrDi7AKjJ3k1O7frzZhCKrmEpUjAK0Qqk=; b=wOIyug01WfqNIHRl4nWSWAxaXo
	+0srmZHByXHVIDwuzDuGyidfrdiSMyAAAsUhcFZp0tRAt+W2Qsa+pkEvN8/6w8PTI/QsOP1Q1Fyo4
	3PUCVm/xcl50Dy+oLphXDt+HQJE6LDpmQ9R2ojFFBBMrX/MYp/FBEzulNoxLXAqi6bm5DkEI0c8UB
	4v2OVFPxNN3fSuWfhvaIFjraa1qvnvo03bBYenLBurtjpQObkW/+HE12+wDoffbo42mJM4i8qXrt1
	vasYffGgp2A+jpJGsW+A3yJ/WsUssTUtNIHh57pKO8Aoatjn7ysHnbWZ7+64FurLedp4OMKiVOauw
	VpxGvHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1F-0000000DWBJ-0WIz;
	Mon, 15 Jun 2026 03:29:49 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1C-0000000DW7n-1tjm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:29:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gdwZg6b1vzKHMWl
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:28:59 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 756CE4064C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:44 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgAnKj+PcS9qOnxeBw--.30354S8;
	Mon, 15 Jun 2026 11:29:44 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH 6/6] irqchip/gic-v3-its: some minor cleanups
Date: Mon, 15 Jun 2026 11:29:10 +0800
Message-Id: <20260615032910.54735-7-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260615032910.54735-1-shikemeng@huaweicloud.com>
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAnKj+PcS9qOnxeBw--.30354S8
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18Gr18uFy7WF47Cw1rJFb_yoW8Cw1fpF
	47GFW2krZ7WrW5Kr1Yy3WkAFy5XwnFgay5Kry7K3sxZF15X3s5uFs3ta95Wr10qr4rXFy5
	ZFsYgayY93W7A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULtxDUUUUU
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_202946_848805_16D20E40 
X-CRM114-Status: GOOD (  14.16  )
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

1. Remove unneeded NULL check in itt_alloc_pool() as addr will always be
NULL when we reach here.
2. Correct indentation in cpumask_pick_least_loaded()
3. Remove unneeded updation of range node when it is to be deleted in
alloc_lpi_range().
4. Remove unneeded assignment to baser->psz which is already used
as input inits_setup_baser()

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index fc32a1709f76..ef505575ba86 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -273,7 +273,7 @@ static void *itt_alloc_pool(int node, int size)
 			break;
 
 		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
-	} while (!addr);
+	} while (true);
 
 	return (void *)addr;
 }
@@ -1681,7 +1681,7 @@ static unsigned int cpumask_pick_least_loaded(struct irq_data *d,
 		int this_count = its_read_lpi_count(d, tmp);
 		if (this_count < count) {
 			cpu = tmp;
-		        count = this_count;
+			count = this_count;
 		}
 	}
 
@@ -2127,12 +2127,13 @@ static int alloc_lpi_range(u32 nr_lpis, u32 *base)
 	list_for_each_entry_safe(range, tmp, &lpi_range_list, entry) {
 		if (range->span >= nr_lpis) {
 			*base = range->base_id;
-			range->base_id += nr_lpis;
-			range->span -= nr_lpis;
 
-			if (range->span == 0) {
+			if (range->span == nr_lpis) {
 				list_del(&range->entry);
 				kfree(range);
+			} else {
+				range->base_id += nr_lpis;
+				range->span -= nr_lpis;
 			}
 
 			err = 0;
@@ -2472,7 +2473,6 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 
 	baser->order = order;
 	baser->base = base;
-	baser->psz = psz;
 	tmp = indirect ? GITS_LVL1_ENTRY_SIZE : esz;
 
 	pr_info("ITS@%pa: allocated %d %s @%llx (%s, esz %d, psz %dK, shr %d)\n",
-- 
2.36.1


