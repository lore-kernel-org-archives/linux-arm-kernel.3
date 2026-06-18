Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CCCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJXRRr5jikfS8pEi2DjSriuKsor67oCrrUcUCc4ACG8=; b=nSWuoN4fyOG70Ep6oz+Qk1+Wma
	sF7yCiIonkfIf5vEzxZnJBBgN3Ips35le5x9mZkhpxCdKogsXiHyT/66H2KBV4VxJIMc2UXhfSgsX
	kPv4noh6mBwLzjcxrtkqLjVADAhtTf3sI/NP1xZ9an5an+rJhKY8OHfGS9GrN4XPNO1g51E35atKl
	KCC8iimwX7P/ONvE1TZFaXdiFhdxGuTaCn4BZi9AZIuL8KYR56kvxawyswTlyQmUK0EBKJeAgc45u
	6yO7/T/KFI/S84/BXI+RL4nZDm3JYfF/AEZ7VDJ1akHTF046h3VabPIWM/aUZXeLMsvWC461EDHzg
	vUOhTF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ll-00000000TUi-0UyM;
	Thu, 18 Jun 2026 01:15:21 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ld-00000000TSI-23db
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:15:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ggjSF3gWlzYQtvM
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:14:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id ECF284062A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:15:08 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with SMTP id _Ch0CgC3XQmXRjNq00isCA--.10914S3;
	Thu, 18 Jun 2026 09:15:08 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v2 1/4] irqchip/gic-v3-its: Fix memleak in its_probe_one()
Date: Thu, 18 Jun 2026 09:14:56 +0800
Message-Id: <20260618011459.58347-2-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260618011459.58347-1-shikemeng@huaweicloud.com>
References: <20260618011459.58347-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgC3XQmXRjNq00isCA--.10914S3
X-Coremail-Antispam: 1UD129KBjvdXoWruF43Jw4fXw4kZr17KF1rWFg_yoWfAFX_C3
	4rWan7GFW29r18GwnrJw4SvFy7Ga1v9r18ZF1Fya45tryxZw1DCFZrXF98AF4UWF4jva4f
	Aa9Y9r1I9r1xAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb68FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjNVyDUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_181513_711334_DDEAAEDF 
X-CRM114-Status: UNSURE (   9.96  )
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

Fix collection leak when its_init_domain() failed in its_probe_one().

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 291d7668cc8d..d721b6101e0a 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5326,7 +5326,7 @@ static int __init its_probe_one(struct its_node *its)
 
 	err = its_init_domain(its);
 	if (err)
-		goto out_free_tables;
+		goto out_free_col;
 
 	raw_spin_lock(&its_lock);
 	list_add(&its->entry, &its_nodes);
@@ -5334,6 +5334,8 @@ static int __init its_probe_one(struct its_node *its)
 
 	return 0;
 
+out_free_col:
+	kfree(its->collections);
 out_free_tables:
 	its_free_tables(its);
 out_free_cmd:
-- 
2.33.0


