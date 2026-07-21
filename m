Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F1C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7eoK4O5doo1N4oC7fzcWZUtSpB7A1RNM+4MiWtWSKY=; b=4FRtU32bYJOdblMCOxyqGxJlYB
	VwppmuCyATUMAumR4eiryID7T8YbkhXtb03OZn73KBbPgh707ynw+4Nyfmk7BvgYRGlme83fY5GqG
	gzhgkN/UKm6D//Onwd1bYoC6SvVm4EaOLyvt1AQ2ogkbfedyi5bUZFF+sbOdRVphbd+ygPfyXEuKJ
	+3ig/Yj6oiQFLxvHGkkjQiw1/BPxlpa7OinjykHwgv2bd8BPtC9ahQXZDBk1ueOn9Mxr7oMiQrhoD
	UcS4Q+bbZMUf2wPl0Jl5qdwyn0sWMIouBTb4PGtPu6XM9Z/pbD0JLV6qWTm8f1Gb5Jsxi9S7h1oD/
	tOpk4C6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm42L-00000008Wpq-2P1d;
	Tue, 21 Jul 2026 06:33:05 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm429-00000008WlT-1ZSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:32:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h46xH3v5fzKHMSh
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:32:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2E8154093B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 14:32:45 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBXsm6KEl9qRSYCCA--.34790S4;
	Tue, 21 Jul 2026 14:32:45 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v6 2/2] irqchip/gic-v3-its: Fix grammar and replace a bit number with its symbol
Date: Tue, 21 Jul 2026 14:32:41 +0800
Message-Id: <20260721063241.52549-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260721063241.52549-1-shikemeng@huaweicloud.com>
References: <20260721063241.52549-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBXsm6KEl9qRSYCCA--.34790S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5trWxAFy5WFy3ur17ZFb_yoW8GF43pF
	WUG34Ikr4fKFW5urnxua109Fy5tws2yFW7G3yxCayFq34UWr9YqF4UtFyaqrn7Jr13ArWY
	vF4S9r4UWayUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUolk3UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_233253_593709_C3C6E8B9 
X-CRM114-Status: GOOD (  14.54  )
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

Fix grammatical errors in comments and simplify the comment about reading
GITS_BASER_INDIRECT to check two-level support.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-gic-v3-its.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 28899792afd3..1c6a5213e779 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -163,7 +163,7 @@ struct event_lpi_map {
 
 /*
  * The ITS view of a device - belongs to an ITS, owns an interrupt
- * translation table, and a list of interrupts.  If it some of its
+ * translation table, and a list of interrupts.  If some of its
  * LPIs are injected into a guest (GICv4), the event_map.vm field
  * indicates which one.
  */
@@ -2501,10 +2501,7 @@ static bool its_parse_indirect_baser(struct its_node *its,
 
 	/* No need to enable Indirection if memory requirement < (psz*2)bytes */
 	if ((esz << ids) > (psz * 2)) {
-		/*
-		 * Find out whether hw supports a single or two-level table by
-		 * table by reading bit at offset '62' after writing '1' to it.
-		 */
+		 /* Find out whether hw supports a single or two-level table */
 		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
 		indirect = !!(baser->val & GITS_BASER_INDIRECT);
 
-- 
2.36.1


