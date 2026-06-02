Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B94C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hP2LSLOcJwd8pqW0+7W9R4omsBDhLT1ZDgtaEvUzbZw=; b=EnhwOK1WHxSulV3jy237vibKyl
	0Y1n+p8HzpL6OysjNF2MZhmut6TBKf/OTE3/VAGMb+GTpoS0Umz3lSxW8XAD3FngzZ03SvJ2nzE0W
	KsLseypVH1YwQzZZRFcfDCj0S92sr80KKTx3BqTp9M2Y+QzTwlgfgm9yfE6qQCfKz8um8DItDiTUJ
	Pek78tEBjcOyKlAkwSFqBsFQuysmHIakLHtoFIOWgmqq8zALzgu7Vc2HLvwPNbbqH2+iPtu9XVxNG
	5hO/n//3xEezSzYUqyssnPr+fI8hRqtZPmvHAJIRqYx8gz58PuS6jox1to773GcFzdmE7OxsUWgkG
	N8rviJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJvH-0000000CVbL-3iGs;
	Tue, 02 Jun 2026 07:52:27 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJvE-0000000CVav-27BF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:52:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84229481d44so1030006b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780386743; x=1780991543; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hP2LSLOcJwd8pqW0+7W9R4omsBDhLT1ZDgtaEvUzbZw=;
        b=ahl8gIFHT4tmqcBxN68eEQlAEXWXFSxKPg9Ti08KV11roMmWpSxCKDxCFbJu7fkUwz
         pnNS9MTf+Y3pos1bJ1z81qb2nTSbeOkdSHb7B0MDPfsJ+xQFkbaIIKUxmZJaZ9/kwIQw
         FJ89gybCIyWUyKa0UwR/B/gb1yM47lpJXfcPjFBCG8eEo/WcTdxzPcLyak2ahprM0hWz
         9g1IEIqh9CuZa018/N99xKnADH13YlYOEzQN+DSiqFWeRuVYsY6YUUwbMUaxlmTLGJAu
         eZaPzRme8cTDrFQL74lHKaWeictfZm++kb4I2V8CPjOulyuQ9K9FeC/tkTyiWNCYLV5H
         FVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386743; x=1780991543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP2LSLOcJwd8pqW0+7W9R4omsBDhLT1ZDgtaEvUzbZw=;
        b=opk+iBbTmbOGdNSxNGBWWa/UIpmRmZ+l6lFL3bywoEKRrijasuPlKFG0L4y8XS6J/Q
         uTsTSJxOC50q5+b97Ks4a1h+iqHANWkshikm0iR7pVuWlVgo4Ya7OnfkoEqi98UF4d/y
         DmqQYEXACJTVlPcTosrfSDWzan7+I4zbQPhAWn4AIOdItM6Xe53y1GNPCDfjCTGcdQ6T
         bfBPl9WWE0jY4ehh6C+PXWeyDaBjJmlLCFsX/HGSi1n0fvnAxOmrIkluxwbNmHsVn5vJ
         joX5ZKayTWiV7IZRYs7DP5J5CKopw4Yiax6bNeY2zWM1dZVMRIqSyMv3t9AElRjMDZuj
         Mxkw==
X-Gm-Message-State: AOJu0Yw6MTX+Yb0xnancrI4EEBbASionoq0moFHf0m5orL3IvkVGF6Wz
	Ax6toti9TGn/I59dIr9gmKAoNxj2Q8KyNou/IMZZKCtSkNSxfRywGJJc
X-Gm-Gg: Acq92OH1y/lPOYlN0pOBd5ZEM0jyZq/iUOIn3Zj3H6i9IhWGP7aQzdSdbybbrBkQ/ea
	zDZI6ui/WqfTa0E39wkoImb/0uFEDcZ9defNnOfV8AxstR1f+zeYB3BQOwihX9Gx9zcbO0Mtw5c
	s58R9VA35allVJCyq4kLUBoVihrbIwHcd3cr97bOuOxcecmDJ3kdiBMCWmihqYdTrVwRqX9fGE2
	h280ezqknmTzIzqMM3QJ5zNsld+R02J07wiG8LaC7QH+C2heXH36jNSEIsq8aunuLaMON2IOn0T
	CWms+sFHFrOzrzxtvQyYgq1yNPN0DFM0iFctXZuSM6qu9zX3HV/iAI5SQC4cqpfREdMEhtIhHAR
	ceC7GtQaZb6zBV2SsNzQkk1wmUVG0Cb1WVNyB9e4hajiKqTz1GKQmYsLHQJSIZt/QcPF2cz1t3G
	TiVAFEG1NneCtRrGnPHVHNe4J9sqNhv8hR6lDhILw3tVcx9/Syb2+1lRtaNZUtjTTj
X-Received: by 2002:a05:6a00:3cd3:b0:835:6388:655d with SMTP id d2e1a72fcca58-84225401e17mr12812962b3a.14.1780386743362;
        Tue, 02 Jun 2026 00:52:23 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423dc9f361sm7534426b3a.24.2026.06.02.00.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:52:22 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:52:18 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	imv4bel@gmail.com
Subject: [PATCH v2] KVM: arm64: vgic-its: Serialize translation cache
 invalidation under its_lock
Message-ID: <ah6Lsi4MfKUU6wBR@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_005224_601594_90671C68 
X-CRM114-Status: GOOD (  17.12  )
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

vgic_its_invalidate_cache() walks the per-ITS translation cache with
xa_for_each() and drops the cache's reference on each entry with
vgic_put_irq().

It must be called with its_lock held. The ITS command handlers and the
ITS teardown path hold it, but two paths that also invalidate the cache do
not: the GITS_CTLR write path holds only cmd_lock, and the path that
clears EnableLPIs in a redistributor's GICR_CTLR holds neither lock. Two
contexts without a common lock, such as two vCPUs clearing EnableLPIs or
an EnableLPIs clear racing an ITS command, can drain the same cache at
once. If both observe an entry, erase it and then put it, the single
reference the cache holds on that entry is dropped more than once, and the
entry can be freed while an ITE still maps it.

Take its_lock in the two paths that lacked it: the GITS_CTLR write path
and vgic_its_invalidate_all_caches(), which clears EnableLPIs. Since
vgic_its_invalidate_all_caches() now takes a mutex, it can no longer walk
kvm->devices under rcu_read_lock(), so walk it under kvm->lock instead.
With its_lock held across every invalidation, each entry is erased and put
by a single context, so the cache reference is dropped exactly once.

Cc: stable@vger.kernel.org
Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
Changes in v2:
- Serialize the invalidation under its_lock as suggested by Oliver,
  instead of v1's gating of the put on the xa_erase() return value.
- v1: https://lore.kernel.org/all/ah2c5lu4JbUg7dj-@v4bel/
---
 arch/arm64/kvm/vgic/vgic-its.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 1d7e5d560af4..4bf60fa5bd7c 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -596,6 +596,8 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
 	struct vgic_irq *irq;
 	unsigned long idx;
 
+	lockdep_assert_held(&its->its_lock);
+
 	xa_for_each(&its->translation_cache, idx, irq) {
 		xa_erase(&its->translation_cache, idx);
 		vgic_put_irq(kvm, irq);
@@ -607,17 +609,16 @@ void vgic_its_invalidate_all_caches(struct kvm *kvm)
 	struct kvm_device *dev;
 	struct vgic_its *its;
 
-	rcu_read_lock();
+	guard(mutex)(&kvm->lock);
 
-	list_for_each_entry_rcu(dev, &kvm->devices, vm_node) {
+	list_for_each_entry(dev, &kvm->devices, vm_node) {
 		if (dev->ops != &kvm_arm_vgic_its_ops)
 			continue;
 
 		its = dev->private;
+		guard(mutex)(&its->its_lock);
 		vgic_its_invalidate_cache(its);
 	}
-
-	rcu_read_unlock();
 }
 
 int vgic_its_resolve_lpi(struct kvm *kvm, struct vgic_its *its,
@@ -1725,8 +1726,10 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
 		goto out;
 
 	its->enabled = !!(val & GITS_CTLR_ENABLE);
-	if (!its->enabled)
+	if (!its->enabled) {
+		guard(mutex)(&its->its_lock);
 		vgic_its_invalidate_cache(its);
+	}
 
 	/*
 	 * Try to process any pending commands. This function bails out early
-- 
2.43.0


