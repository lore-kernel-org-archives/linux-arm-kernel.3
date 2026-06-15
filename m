Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FFCCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJUqoQ+IlyQ0SMP5o3V+R7tbRBXf3nsi1XbZWKgcGpo=; b=yxoinc1mg4f/u+pz5nTLLNaoA3
	wup4MXJYwgMjJphyKIePovTEdUV5OmfJYAnSopcIOZD+8+xvwar0lac/4va3A+N5NAYryDTGCtBXO
	1YXpZCwCGSKrxaqLOp/PWhVxixc3dKHqtqwo8EObb/VfBi1LeVKrWAjrqV0Futqy+FzJOZMMnfO6m
	M4tmrYe3NDBkrVR0bsN6qcrXPN9pHg7+lbkCENXE6iIjk68GlrQRf4OU3SvwPN6SabrSw3zHvPcTw
	BXa4E5E5BpJ9obpo7gTOdIe0tZeVb643DM0kI8PF2UN9+32KpEqWjDoQodojO2q4XZAapKc/vDYPp
	+fhgnxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1F-0000000DWB3-08KQ;
	Mon, 15 Jun 2026 03:29:49 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYy1B-0000000DW7A-2xq2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:29:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gdwb00Z9fzYQtvB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 884DC4058C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:29:42 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgAnKj+PcS9qOnxeBw--.30354S6;
	Mon, 15 Jun 2026 11:29:42 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH 4/6] irqchip/gic-v3-its: Add ITS address info in more error logs
Date: Mon, 15 Jun 2026 11:29:08 +0800
Message-Id: <20260615032910.54735-5-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260615032910.54735-1-shikemeng@huaweicloud.com>
References: <20260615032910.54735-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAnKj+PcS9qOnxeBw--.30354S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWxCFy5GFyfJF4ftFyrZwb_yoW8tw1kpF
	45W3yfZrn3X3yUXFsxZr4DArn3tw4kKas7Gry2g39IgwsxAFykXa1vyF9YvF1fA3Z7Ja12
	qF4jga1vkanrJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsIDxUUUUU
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_202946_133673_76D4A60E 
X-CRM114-Status: GOOD (  10.81  )
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

We have a lot of logs containing ITS address info which is helpful to
distiguish which ITS occurs error. Just add ITS address info into more
exsiting error logs.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 158937c867fb..becd8dd51720 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1120,7 +1120,7 @@ static struct its_cmd_block *its_allocate_entry(struct its_node *its)
 	while (its_queue_full(its)) {
 		count--;
 		if (!count) {
-			pr_err_ratelimited("ITS queue not draining\n");
+			pr_err_ratelimited("ITS@%pa queue not draining\n", &its->phys_base);
 			return NULL;
 		}
 		cpu_relax();
@@ -1196,8 +1196,8 @@ static int its_wait_for_range_completion(struct its_node *its,
 
 		count--;
 		if (!count) {
-			pr_err_ratelimited("ITS queue timeout (%llu %llu)\n",
-					   to_idx, linear_idx);
+			pr_err_ratelimited("ITS@%pa queue timeout (%llu %llu)\n",
+					   &its->phys_base, to_idx, linear_idx);
 			return -1;
 		}
 		prev_idx = rd_idx;
@@ -1244,7 +1244,7 @@ post:									\
 	raw_spin_unlock_irqrestore(&its->lock, flags);			\
 									\
 	if (its_wait_for_range_completion(its, rd_idx, next_cmd))	\
-		pr_err_ratelimited("ITS cmd %ps failed\n", builder);	\
+		pr_err_ratelimited("ITS@%pa cmd %ps failed\n", &its->phys_base, &builder);	\
 }
 
 static void its_build_sync_cmd(struct its_node *its,
@@ -2408,7 +2408,8 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 
 		/* 52bit PA is supported only when PageSize=64K */
 		if (psz != SZ_64K) {
-			pr_err("ITS: no 52bit PA support when psz=%d\n", psz);
+			pr_err("ITS@%pa: no 52bit PA support when psz=%d\n",
+				   &its->phys_base, psz);
 			its_free_pages(base, order);
 			return -ENXIO;
 		}
@@ -5184,7 +5185,7 @@ static int its_init_vpe_domain(void)
 	vpe_proxy.dev = its_create_device(its, devid, entries, false);
 	if (!vpe_proxy.dev) {
 		kfree(vpe_proxy.vpes);
-		pr_err("ITS: Can't allocate GICv4 proxy device\n");
+		pr_err("ITS@%pa: Can't allocate GICv4 proxy device\n", &its->phys_base);
 		return -ENOMEM;
 	}
 
-- 
2.36.1


