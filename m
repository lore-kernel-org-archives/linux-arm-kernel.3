Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BC1CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh6WtazG59LJjsIsyWbqbK4O903nxxhM5eyX3rAwcro=; b=RLFSpVVTVDONNm8Qc9CVfMwSUF
	2DVypatpvkUi2qVcQzMkAl84YIStDUistJvSqT74Mw2y8aCzgxiN9TWOg8bu+/XGEQSartNJacf4m
	zZbsCyhJru6W2P4HTD3aIuEJYpQzGJ6DDLBf/6w2HxiMmexYFMx/gJJmiApsKYfKTJQ8pTlLriZjg
	YTqWhftj4wBqSP2kqF/hQgufyTzNtpgtEyjAN/nQdV1cCh6ircfhHmB/DR5XhHeVTBJxEVHra1dlQ
	CxKmIucfA0POEYXy8N7Y/L/jkPazcoQbIacf5fkGXL4Jbm9+NmelkGUFy+6iW4xIrUbvIBa0SZO3x
	3cGc5SMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ll-00000000TUy-0yrP;
	Thu, 18 Jun 2026 01:15:21 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ld-00000000TSJ-2S9h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:15:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4ggjRw2k49zKHMZT
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:14:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 989364056E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:15:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with SMTP id _Ch0CgC3XQmXRjNq00isCA--.10914S5;
	Thu, 18 Jun 2026 09:15:09 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v2 3/4] irqchip/gic-v3-its: Add ITS address info in more error logs
Date: Thu, 18 Jun 2026 09:14:58 +0800
Message-Id: <20260618011459.58347-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260618011459.58347-1-shikemeng@huaweicloud.com>
References: <20260618011459.58347-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgC3XQmXRjNq00isCA--.10914S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWxCFy5GFyfJF4ftFyrZwb_yoW8tw1kpF
	45W3yfZrn3J3yUXFsxZF4DArn3tw4kKas7G342ga9IgFsxAa4kWa1vyF9YvF1fA3Z7Ja12
	qFWUKanYkanrJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUwFxUUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_181513_989688_AD97ACC8 
X-CRM114-Status: GOOD (  10.75  )
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
index 3e4edcb64065..449e2cfd0c99 100644
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
@@ -2411,7 +2411,8 @@ static int its_setup_baser(struct its_node *its, struct its_baser *baser,
 
 		/* 52bit PA is supported only when PageSize=64K */
 		if (psz != SZ_64K) {
-			pr_err("ITS: no 52bit PA support when psz=%d\n", psz);
+			pr_err("ITS@%pa: no 52bit PA support when psz=%d\n",
+				   &its->phys_base, psz);
 			its_free_pages(base, order);
 			return -ENXIO;
 		}
@@ -5181,7 +5182,7 @@ static int its_init_vpe_domain(void)
 	vpe_proxy.dev = its_create_device(its, devid, entries, false);
 	if (!vpe_proxy.dev) {
 		kfree(vpe_proxy.vpes);
-		pr_err("ITS: Can't allocate GICv4 proxy device\n");
+		pr_err("ITS@%pa: Can't allocate GICv4 proxy device\n", &its->phys_base);
 		return -ENOMEM;
 	}
 
-- 
2.33.0


