Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Andp5VDV+A4AW07a5bDFOCh8KWVJkL4Vd6SoEbvZutE=; b=Qb17g1k8pSo2BTNZS+E4RQwahH
	/fuAxJn1s6a4ECzfz5XsynWmvLhVF47wTPo0mhzsDACHSxsXjrg7Cwu8mtq7mLxx5+hLKM812h/EH
	caIgtr/Bl+kPqq4wrS6i88DLfe1a/HvKWDVzJu1b5kw/TG3Khb3INDM+jo8GC+BleRo41jx5X6C1G
	vWmcHCiudhJJatybID+XRWSf5S48fOqaf/a8sxu0I/b260EBdMxgrZoS2A9Ea8WvIKTaroLxAYikW
	uXHuYpKdVMJ84JvXA6sxj8b2kxfCSkvTjrRNU33tgAyqe40qxE327oVIsnbBviL5W91szEowhRGOy
	Kk8Zd5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDj-00000003GwU-0Um6;
	Tue, 29 Sep 2026 10:37:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD3-00000003GdX-0at7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Andp5VDV+A4AW07a5bDFOCh8KWVJkL4Vd6SoEbvZutE=; b=mGOKuYAuykAZNuAP/8sVAUal57
	zDyIKhIIavnLxw3cgsiqXlEUEpdFfsqGhsq9SvWA8TZs2Pv+yDxTDgdWfOihJtuj5b/WIgdDCl7OD
	CqVKnKS2GeU3Wl6IC7hAXFBv1GUhyLNYzyq6QTKJglTXQ7EPMQy2dI0SQLzqlKFt1xtplnxWZXFrG
	WZLk2gKv43u7ddT86RhELK7eSah6mAS/fU+/KqJD8vfGsARYByrTlgYEgwzZ20lBrpVZZtoPR1elb
	yGn7QARI7h3Z6CqbBEbji6uOFUS/j832PgEXnJKKYUY6WH9pFYSphZxjeFz9qGvC7urdWK5weUodt
	YUvnaCOw==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVCz-00000002VF3-1oFn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Andp5VDV+A4AW07a5bDFOCh8KWVJkL4Vd6SoEbvZutE=;
	b=PW5NPQWVzKrCPAeqQzi5/g4ahW18MU7ss3ZMC2zzYgBfLa+P+/sgySwMBkPZKwRkSG1FpiOAu
	miJqRgqLhWlsWdyHY0O8uAxdMZBTowN1PXuRKYnYsSsM9wAeqk4J60/eAW9HBG8It3tVsFMrlcn
	lkfBnWfpWvuEiR6NvEmg7Xo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hvDnb64TSzpSy8;
	Tue, 29 Sep 2026 18:24:51 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 8514940575;
	Tue, 29 Sep 2026 18:37:00 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:36:59 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 05/15] KVM: arm64: Harvest stage-2 dirty state into the host folio account
Date: Tue, 29 Sep 2026 18:36:45 +0800
Message-ID: <20260929103655.85107-6-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113714_073196_22B20567 
X-CRM114-Status: GOOD (  20.82  )
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

With VTCR_EL2.HD set, hardware promotes writable-clean descriptors to
writable-dirty without any VM exit, and the only record of the write
is the S2AP[1] bit in the stage-2 PTE. The write never passed through
the host stage-1, and no unmap path reads the bit, so the record dies
with the PTE and reclaim may discard written guest data (silent
corruption).

The fault paths already mark the folio speculatively at fault-in, but
the mapping lifecycle still needs exact harvesting, mirroring
zap_present_folio_ptes() in the generic mm:

  - stage2_unmap_walker(): harvest the output address of a valid leaf
    with S2AP[1] set before tearing it down.

  - stage2_wrprotect_walker(): a WD -> WC transition drops the dirty
    state, so harvest before the clear.

Both hooks go through a new kvm_pgtable_mm_ops::mark_page_dirty
callback, as the walkers are also compiled into the nVHE hypervisor,
where SetPageDirty() is unavailable. pKVM leaves the callback NULL.

The folio is dirtied at its head, so one harvest covers a whole block
mapping. MMIO/PFNMAP ranges and reserved pages are skipped, mirroring
kvm_is_ad_tracked_page().

Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/kvm_pgtable.h |  2 ++
 arch/arm64/kvm/hyp/pgtable.c         | 14 ++++++++++++--
 arch/arm64/kvm/mmu.c                 | 16 ++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 379031c74cbc..ea71c13615f7 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -246,6 +246,8 @@ struct kvm_pgtable_mm_ops {
 	phys_addr_t	(*virt_to_phys)(void *addr);
 	void		(*dcache_clean_inval_poc)(void *addr, size_t size);
 	void		(*icache_inval_pou)(void *addr, size_t size);
+	/* NULL where folios are not tracked. */
+	void		(*mark_page_dirty)(u64 pa);
 };

 /**
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index aa0448d3a6a4..9dde7e779699 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1182,8 +1182,13 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,

 		if (mm_ops->page_count(childp) != 1)
 			return 0;
-	} else if (stage2_pte_cacheable(pgt, ctx->old)) {
-		need_flush = !cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
+	} else {
+		if (stage2_pte_cacheable(pgt, ctx->old))
+			need_flush = !cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
+
+		if ((ctx->old & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W) &&
+		    mm_ops->mark_page_dirty)
+			mm_ops->mark_page_dirty(kvm_pte_to_phys(ctx->old));
 	}

 	/*
@@ -1302,6 +1307,11 @@ static int stage2_wrprotect_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		new &= ~KVM_PTE_LEAF_ATTR_HI_S2_DBM;

+	if (kvm_pte_valid(ctx->old) && ctx->old != new &&
+	    (ctx->old & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W) &&
+	    ctx->mm_ops->mark_page_dirty)
+		ctx->mm_ops->mark_page_dirty(kvm_pte_to_phys(ctx->old));
+
 	/*
 	 * We may race with the CPU trying to set the access flag here,
 	 * but worst-case the access flag update gets lost and will be
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 698a87e85a6d..85a98d2c23a9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -897,6 +897,21 @@ static int get_user_mapping_size(struct kvm *kvm, u64 addr)
 	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
 }

+static void kvm_s2_mark_page_dirty(u64 pa)
+{
+	unsigned long pfn = pa >> PAGE_SHIFT;
+	struct page *page;
+
+	if (!pfn_valid(pfn))
+		return;
+
+	page = pfn_to_page(pfn);
+	if (PageReserved(page))
+		return;
+
+	SetPageDirty(page);
+}
+
 static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
 	.zalloc_page		= stage2_memcache_zalloc_page,
 	.zalloc_pages_exact	= kvm_s2_zalloc_pages_exact,
@@ -909,6 +924,7 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
 	.virt_to_phys		= kvm_host_pa,
 	.dcache_clean_inval_poc	= clean_dcache_guest_page,
 	.icache_inval_pou	= invalidate_icache_guest_page,
+	.mark_page_dirty	= kvm_s2_mark_page_dirty,
 };

 static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
--
2.43.0


