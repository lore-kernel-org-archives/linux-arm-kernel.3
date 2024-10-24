Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6978D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:CC:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEUi9h4vm+GlcPfZJZzwrXB8Lv2CQDK+b6eWjtIbTzc=; b=lwxiu6eCD1Kbakd155wUoM1Py6
	tUbQ6d4HtOkErJkBDGyyZCvz/h/NXcfDDVQLPjjMvr89BGVhfOS/sWn4DWe/7u0/aOnPuPqWay6+F
	IYhRJmUIK/fo86XTREVlDbvXOyXNQe/SzVhFI5NAlYb9jnL7Aw1Pa5cgglJbOYmj/0Z6BIbcWTMPJ
	ZnjD/9PvI4zr8bbWV0Y0If5tW6AEoqSNEphbcSMrZ09Cl6Pfgzsdc011u+308lIB0ThDgQYpzjkQh
	e7QeUPR5bij9yo3QK9f5jdFrsXec/bQkipXZqes7BicDV9wUwUQKxfBlA99rxQzYh34/4V2WWhBqE
	JlrgzEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3q5d-0000000GlUo-3hzT;
	Thu, 24 Oct 2024 05:08:53 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3q45-0000000GlPy-2Hbg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:07:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XYv4b0FcMz1SCyJ;
	Thu, 24 Oct 2024 13:05:35 +0800 (CST)
Received: from kwepemf500015.china.huawei.com (unknown [7.202.181.2])
	by mail.maildlp.com (Postfix) with ESMTPS id BC397180043;
	Thu, 24 Oct 2024 13:06:59 +0800 (CST)
Received: from [10.174.178.37] (10.174.178.37) by
 kwepemf500015.china.huawei.com (7.202.181.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Oct 2024 13:06:58 +0800
Message-ID: <bb4aeb68-c77b-4071-bca5-d129a1c5f6f3@huawei.com>
Date: Thu, 24 Oct 2024 13:06:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<wanghaibin.wang@huawei.com>, <tangnianyao@huawei.com>,
	<wangzhou1@hisilicon.com>, <yuzenghui@huawei.com>, <wangyanan55@huawei.com>,
	<jiangkunkun@huawei.com>, <jiaqingtong@huawei.com>
From: Zhiqiang Ni <nizhiqiang1@huawei.com>
Subject: [bug report] KVM: arm64: vgic-its: Performance degradation on GICv3
 LPI injection
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.37]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500015.china.huawei.com (7.202.181.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_220717_980263_B03FBB12 
X-CRM114-Status: GOOD (  13.39  )
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

Hi all,

I found a performance degradation on GICv3 LPI injection after this
commit ad362fe07fecf0aba839ff2cc59a3617bd42c33f(KVM: arm64: vgic-its:
Avoid potential UAF in LPI translation cache).

In my testcase, the vm's configuration is 60 VCPU 120G RAM with a
32-queue NIC and the kernel version is 5.10. The number of new TCP
connections per second changed from 150,000 to 50,000 after this
patch, with the %sys of cpu changed from 15% to 85%.

From the ftrace, I found that the duration of vgic_put_irq() is
13.320 us, which may be the reason for the performance degradation.

The call stack looks like below:
    kvm_arch_set_irq_inatomic()
      vgic_has_its();
      vgic_its_inject_cached_translation()
        vgic_its_check_cache()
        vgic_queue_irq_unlock()
        vgic_put_irq()

So, I tried to modify the code like below and I found the performance
degradation is gone. Is this a good idea?

From 2bd98f8a2cc02a17423ced36e07f7bb3c7e044af Mon Sep 17 00:00:00 2001
From: Zhiqiang Ni <nizhiqiang1@huawei.com>
Date: Thu, 24 Oct 2024 12:29:28 +0800
Subject: [PATCH] KVM: arm64: vgic-its: Avoid vgic_put_irq in LPI translation
 cache

---
 arch/arm64/kvm/vgic/vgic-its.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 93c0365cd..0efabe555 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -579,24 +579,6 @@ static struct vgic_irq *__vgic_its_check_cache(struct vgic_dist *dist,
 	return NULL;
 }

-static struct vgic_irq *vgic_its_check_cache(struct kvm *kvm, phys_addr_t db,
-					     u32 devid, u32 eventid)
-{
-	struct vgic_dist *dist = &kvm->arch.vgic;
-	struct vgic_irq *irq;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&dist->lpi_list_lock, flags);
-
-	irq = __vgic_its_check_cache(dist, db, devid, eventid);
-	if (irq)
-		vgic_get_irq_kref(irq);
-
-	raw_spin_unlock_irqrestore(&dist->lpi_list_lock, flags);
-
-	return irq;
-}
-
 static void vgic_its_cache_translation(struct kvm *kvm, struct vgic_its *its,
 				       u32 devid, u32 eventid,
 				       struct vgic_irq *irq)
@@ -759,18 +741,24 @@ static int vgic_its_trigger_msi(struct kvm *kvm, struct vgic_its *its,
 int vgic_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi)
 {
 	struct vgic_irq *irq;
-	unsigned long flags;
+	unsigned long flags, flags2;
 	phys_addr_t db;
+	struct vgic_dist *dist = &kvm->arch.vgic;

 	db = (u64)msi->address_hi << 32 | msi->address_lo;
-	irq = vgic_its_check_cache(kvm, db, msi->devid, msi->data);
-	if (!irq)
+	raw_spin_lock_irqsave(&dist->lpi_list_lock, flags2);
+	irq = __vgic_its_check_cache(dist, db, msi->devid, msi->data);
+
+	if (!irq) {
+		raw_spin_unlock_irqrestore(&dist->lpi_list_lock, flags2);
 		return -EWOULDBLOCK;
+	}

 	raw_spin_lock_irqsave(&irq->irq_lock, flags);
 	irq->pending_latch = true;
 	vgic_queue_irq_unlock(kvm, irq, flags);
-	vgic_put_irq(kvm, irq);
+
+	raw_spin_unlock_irqrestore(&dist->lpi_list_lock, flags2);

 	return 0;
 }
-- 
2.33.0

Thanks,
Zhiqiang Ni

