Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D276ECDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhJ01pN+fsFMtc06EKIaFfnuJMSOvnV9XEFCNfBbINY=; b=s1BwZPFFc6eJH6+60UhEKwp88z
	EbFe6OTlZI32CqcmLr+lOXQ1ywgP1InJ1+83Mt1XPnP1Jiz72oeC95eNTKmkrnTXk4LX4NSFePFyd
	YpotTvrMZLNvxuMFIhZkSLpnCl5NQJElzSRoeM2+67T08VpRR5wLSGkKqGbth4oxvgsolMgRy50vM
	ShC8/TMwLS89HyR/dShZS87cC5SAF50vvkg3byag1thygSfwrNh6eynOPePEVfps3J6nWXWMyDwve
	kCbh0AWssux6j7H4RloofY6L/SGEndApAQ5YGoxrzYVWMrRkQZJgZmGYBPRGEPbZnc7ZaMel6Iskb
	VCFT98uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSU-00000005ZhD-3cSt;
	Tue, 23 Jun 2026 02:01:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqSR-00000005Zey-3SUc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:01:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gkpF6264SzKHMZd
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:00:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 959CE4058F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:01:39 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP1 (Coremail) with SMTP id cCh0CgCHiD0A6TlqxaQZCw--.5730S5;
	Tue, 23 Jun 2026 10:01:39 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v3 3/6] irqchip/gic-v3-its: Fix leak in its_vpe_irq_domain_alloc()
Date: Tue, 23 Jun 2026 10:01:32 +0800
Message-Id: <20260623020135.3584-4-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260623020135.3584-1-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCHiD0A6TlqxaQZCw--.5730S5
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1UKFykGr1DKF1UGw4Uurg_yoWfJFX_CF
	yjqan3Wayjvrn5Gw1Iyw43Zryvv3Wv9wn29FyFya4fJw48ua4xAF4fZF9xJrsrWF1jq34f
	AFZ5ZrWSkr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb68FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUX_-JUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_190148_046785_F55AAFCD 
X-CRM114-Status: GOOD (  10.89  )
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

We miss to teardown the vpe when its_irq_gic_domain_alloc() is failed.
Just fix this.

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


