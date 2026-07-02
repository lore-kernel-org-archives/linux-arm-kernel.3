Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg0hexr0P49gk/nAXumCmfMA2/oWaKuNQi47i0D2iUA=; b=rzyzJT8fZgAJauYtsKK/u41/NK
	zqNpJfZxUQ6fIrNa0hgdu0MtJAPe8piMXPlXgKU5olpmasTG20rkmmPiH3LC+H8jxZ60pQgDVKwf9
	KT+DAoh6BoxBhONodyC99GyEnsuHf8VfNF5qaYEISVqhEx/KN7/mVgVEGgniYYiiK7s05HelZM3rP
	LrzSb+wRLtlxNC2qIAXqi97aKChDYpNDtx0tm9Gaz4kcxpFd/lXJ5trPOZouYKFY/5vtitr17Fjw4
	TQbLX753jL2K+Rz5JzeMGJoIPxV5ADk8tFOghCSD2NIyaafa50AD/30vgx8HioIlyr/HjqZYD+ZXE
	qii+CM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf88r-00000003VEZ-0RNM;
	Thu, 02 Jul 2026 03:31:09 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf88k-00000003VAT-4AZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 03:31:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4grMp130JlzYQtLf
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 11:30:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id EF3914056D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 11:30:56 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBHGods20Vqbds1Ag--.34098S5;
	Thu, 02 Jul 2026 11:30:56 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org,
	jason@lakedaemon.net,
	lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v4 3/6] irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
Date: Thu,  2 Jul 2026 11:30:47 +0800
Message-Id: <20260702033050.1583-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260702033050.1583-1-shikemeng@huaweicloud.com>
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBHGods20Vqbds1Ag--.34098S5
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyDZr4kCFWkCF4DZw13urg_yoWkGFg_CF
	yjqan3Wa1jqrn5Gw18tr4Svryv93Wv9rn29r1SyayfJw47u34xArs3ZFZxJrs7XF1jyw1f
	AFZ5ZrWfCr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb68FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbTUDJUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_203103_227149_7C24A7DD 
X-CRM114-Status: GOOD (  10.78  )
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

When its_irq_gic_domain_alloc() fails, the following
its_vpe_irq_domain_free() skips calling its_vep_teardown() for the
corresponding irq. Call its_vpe_teardown() when its_irq_gic_domain_alloc()
is failedto avoid the leak issue.

Fixes: 7d75bbb4bc1ad ("irqchip/gic-v3-its: Add VPE irq domain allocation/teardown")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 3e4edcb64065..8968bedefdba 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4666,8 +4666,10 @@ static int its_vpe_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
 			break;
 		err = its_irq_gic_domain_alloc(domain, virq + i,
 					       vm->vpes[i]->vpe_db_lpi);
-		if (err)
+		if (err) {
+			its_vpe_teardown(vm->vpes[i]);
 			break;
+		}
 		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
 					      irqchip, vm->vpes[i]);
 		set_bit(i, bitmap);
-- 
2.36.1


