Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED4DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6psWOVVyFeQFOY75EO2JMzQlsdjSGaYJxWUCFV1ZrrE=; b=GvozabnxcXYYymMT/3fjpJNd1Q
	2d6nPuwrsaLLbzPTYtPm2VWH0xSM0U0GxKkTUByB0V3f5wt6O9FTA1YlnzjwOc+R+lF7p8EJk/Dsx
	QSS1k76lA43iYopcMphgOpKgGANkTxejSmHv9B+8c4stlD3tE3q8jAHZLfUM1gwvr5PgYHBICYKS1
	3cehtii/sri52ikTM6kd4lXzhpAM4SnmDyetW0gfKKC0YMomFmik0J+xieu7rA75Xmx5FSu7h6mCp
	Sd4jlFzygAl2aEBUUPCwzuOlr3zZQCJOXS15ir+VrTjIHG++qRQsDp44aFB9oKTh1AzqXlFXOGO3/
	f7FuhVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90FA-00000005RKn-2ojn;
	Tue, 22 Sep 2026 13:09:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Ef-00000005R0m-46Js
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6psWOVVyFeQFOY75EO2JMzQlsdjSGaYJxWUCFV1ZrrE=; b=Rqrwz3zll/Y1Tat2s4DD/eAtt8
	vF5n/QcaLRtfL/qlqesNZdRrV1g+bRp4QFKrb2C47tmNhnntaNMuNoRZ7Hf9JFlbAaN5WPQyume1W
	kcg+4s1qm8fPd1YfwzXo+SmDLA9cp1v+WXLtoi4JYQEDVJGTDY5RGCTlWpUknRBF01QS++OmYO8ul
	qCau1pYMbf83DGaJCva4JLm2qnhDx6r79quh6TL6ZtwDWaXQcnyC0Wf5dRlN4Y2ES22C5GayFfa0O
	dy92N07GjJLzYDI3lYchtrtF7UHc/OXI9PIQaecmaUfUSuaPV5Vjl1lH0dk95QDZnwNMaNJFRfAcA
	ooDWMwsw==;
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90Ec-0000000DbDO-46nb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:36 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6aa82371cb7so2926396a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082513; x=1790687313; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6psWOVVyFeQFOY75EO2JMzQlsdjSGaYJxWUCFV1ZrrE=;
        b=C9K7Luh3XHxJjWGigVtUUWZ7QAZtqJgxHEryajlAbxhQc3IemtCJdBu5EL7rqqrwYW
         nFj0kicHLrl6MX9FAK6Z0BOq0LAAs6URQiJs7I+I8sKRClIyUe7tcqc9pka6Qdv3n0SZ
         mWrAX3CKmsmYTMRAzk7gSWPbcUyy3V9HbRhiA5LmZGzj9A6VmA88LVpjcTvLV9DEgm41
         nzn9QradRPyMwPNBWE4yQ9JayuO6sdsu1kQZg79DhrdIXLw+D8gjdS+GnJ0YIhlpa46l
         WLaqnLWAT1DSYFRvgHAqKOHWRfLNn9Y3UGmOBv3Gj5uHen8dqK5Hf1MDJ5dtcCfh12OX
         5sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082513; x=1790687313;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6psWOVVyFeQFOY75EO2JMzQlsdjSGaYJxWUCFV1ZrrE=;
        b=2PBuZqMxe6xQhpLaXWV8wS0awNJzf250/kKCsepUHQ89OlYdNKbNUEYiV5cG8VMSFA
         h80SpGtx2LAIS/U2tlxRRaleVbuf7h2ulFkuO1ds43yORiT0gYjC70wsZcspbve+CBbg
         vWfIvndlViQQ673dttlLtCTWlmPq/jDAUOSG2+6AbS6qGSnNv0c59ZXXO2wr1Bb8mvAD
         QDSnX3hdyQg4akK2ULs6s2X5IeQlZXoo1Ff8YoPUqkjsQaRIGKc54NuPBQS5Fd5EkKzl
         HFYZE2ruG7AQbYOINODpO9RjuKzY8XCcDHQRFBMM0vpA+KVOCLMShiPus6MufH22dnix
         nvuw==
X-Forwarded-Encrypted: i=1; AKwUvBx3lsJasmD8VDLC6UrLuEWCTg9xQlu1dgtVqmDzpey/eUbi6kwrr5Chg0OjdHw2zEwxjMesVX5pxlpxia1QwhVw@lists.infradead.org
X-Gm-Message-State: AFuF++kEw9aGVwwMvl3ojI52i7+Ysq+uCb1FKt8A1Vnne/j/+BHBz0TN
	RLFJU9fJ8QHOhMahzi2KPClom78YjVoUrsoooPX40Q9n33lQF3qgAAKi7TWSMPgF66G7nANqgc8
	vZM7UHtzldL9o/Y2ZKucK8Q==
X-Received: from ejsr12.prod.google.com ([2002:a17:906:7fcc:b0:c1c:2696:91f1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c10b:b0:c26:19de:9139 with SMTP id a640c23a62f3a-c2a15cf8ea1mr1328780266b.44.1790082512677;
 Tue, 22 Sep 2026 06:08:32 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:21 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-7-vdonnefort@google.com>
Subject: [PATCH v1 6/6] KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140835_171982_F17A24B1 
X-CRM114-Status: GOOD (  19.81  )
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

To paraphrase Marc in commit 08f97454b7fa ("KVM: arm64: Fix protected
mode handling of pages larger than 4kB"), pkvm_pgtable_stage2_map()
assumes the address passed as a parameter is aligned to the size of the
intended mapping, while HPFAR_EL2 gives the IPA minus the bottom 12
bits, regardless of the system page size configuration.

To fix this alignment, bring support for kvm_s2_fault_vma_info in
pkvm_mem_abort() and use its members where possible. They do contain the
page-alignment we need to fix the fault on system with pages larger than
4K.

Also, add a check at the start of pkvm_pgtable_stage2_map(), it does not
support !PAGE_ALIGNED arguments.

Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c  | 24 +++++++++++++++---------
 arch/arm64/kvm/pkvm.c |  3 +++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ee0fcca838c1..167b769107ee 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1374,9 +1374,11 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
 	if (map_size == PAGE_SIZE)
 		return true;
 
-	/* pKVM only supports PMD_SIZE huge-mappings */
-	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
-		return false;
+	/* pKVM only supports PMD_SIZE huge-mappings for non-protected VMs */
+	if (is_protected_kvm_enabled()) {
+		if (vcpu_is_protected(s2fd->vcpu) || map_size != PMD_SIZE)
+			return false;
+	}
 
 	size = memslot->npages * PAGE_SIZE;
 
@@ -2167,12 +2169,12 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
 static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
 	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
-	struct page *page;
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
@@ -2180,12 +2182,16 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret)
 		return -ENOMEM;
 
+	ret = kvm_s2_fault_get_vma_info(s2fd, &s2vi);
+	if (ret)
+		return ret;
+
 	ret = account_locked_vm(mm, 1, true);
 	if (ret)
 		return ret;
 
 	mmap_read_lock(mm);
-	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
+	ret = pin_user_pages(s2fd->hva, 1, flags, &s2vi.page);
 	mmap_read_unlock(mm);
 
 	if (ret == -EHWPOISON) {
@@ -2195,7 +2201,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	} else if (ret != 1) {
 		ret = -EFAULT;
 		goto dec_account;
-	} else if (!folio_test_swapbacked(page_folio(page))) {
+	} else if (!folio_test_swapbacked(page_folio(s2vi.page))) {
 		/*
 		 * We really can't deal with page-cache pages returned by GUP
 		 * because (a) we may trigger writeback of a page for which we
@@ -2215,8 +2221,8 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	}
 
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
-				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
+	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), PAGE_SIZE,
+				      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
 				      hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
 	if (ret) {
@@ -2227,7 +2233,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 
 	return 0;
 unpin:
-	unpin_user_pages(&page, 1);
+	unpin_user_page(s2vi.page);
 dec_account:
 	account_locked_vm(mm, 1, false);
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..c298a5b9b12a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))
+		return -EINVAL;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 
-- 
2.55.0.1082.g2b9226bbc0-goog


