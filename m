Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 03:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A7yReOP78CrLg6eVLp6o17Zdp8VfsyZcGlMH1FUkzGI=; b=xgaEe0jlMVIB/3x2AECxIcFot2
	VNDQ91z8RC7LmV56fUEM3Inp96T/qX2LEC2czSkUlNNNligwCjhAIWw1Ph/FzgIt+kCjzqPgsCGcG
	+NNJQ2V1hl7Ln9NpkW/zdHW7gkGQU3QVXCH5TftBPCaQokBaGrPVJe5rGmvkBgwPAqbbF2iUP6dgG
	ebL8kTmCkZAfRx+CXKKiMVmhtnS9SugqLli9nfH3TS+5YHDoF5Uk4zhTBUr4WizSXwvKNq72gDaJ9
	LV0stR/TGxDR3kK2Amh5Jy2EKnQm6eqbqH26pd9xvZL54w8wPUxdLV455bt/LFKfltGUivKyXkxxj
	f7oBk01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf88r-00000003VEl-0nPg;
	Thu, 02 Jul 2026 03:31:09 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf88l-00000003VAW-1JZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 03:31:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4grMpr1qzDzKHLwM
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 11:30:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E0FF64056E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 11:30:54 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBHGods20Vqbds1Ag--.34098S2;
	Thu, 02 Jul 2026 11:30:54 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	jason@lakedaemon.net,
	lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v4 0/6] Some Minor fixes and cleanups to irqchip/gic-v3-its
Date: Thu,  2 Jul 2026 11:30:44 +0800
Message-Id: <20260702033050.1583-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBHGods20Vqbds1Ag--.34098S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF18AFy3tw18Ar4DXw43Wrg_yoWfKFc_ua
	yFqas3WFWxWFWrCa4xtF4ktFWkGr4q9Fyj9FyFkFWUJw18X3WfXF47GrsxZFsxXFW8Ja43
	GFW5Zr4fGr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_203103_549016_D38B1CE8 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
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

There are some random fixes and cleanups to irqchip/gic-v3-its. More
details can be found in respective patches.
Thanks.

v1->v2:
- Drop unneeded patches and some minor improvement.
v2->v3:
- Fix an extra leak issue in its_vpe_irq_domain_alloc().
- Remove redundant check in its_vpe_db_proxy_unmap_locked()
v3->v4:
- Add missing Fixes tags
- Improve changelog description


Kemeng Shi (6):
  irqchip/gic-v3-its: Fix memleak in its_probe_one()
  irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
  irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
  irqchip/gic-v3-its: Add ITS address info in more error logs
  irqchip/gic-v3-its: Fix grammar and replace a bit number with its
    symbol
  irqchip/gic-v3-its: Remove redundant check in
    its_vpe_db_proxy_unmap_locked()

 drivers/irqchip/irq-gic-v3-its.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

-- 
2.36.1


