Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF3C98304
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiGAzCGrKNlXiWDXOy73S85m7H6z+aGxCerVB6vGef0=; b=e+ZAjmfZsd5POd4lBMVin6GKb9
	op+aPom1fa3x8V3Q1yVCm+jgI2gCyvaktyr7aqHRtbFWGCnLAmE03gCWoZOkOdAodS/9P+yyCY97f
	/yqH7DSI4paiLTkEoN4ePjqoTDUuZS1U0qJWPtT4cn+ZLS0my47yVQ5HkKCWgOKtxhXNpYwy9fDFp
	3NI1sbHQlaTutE4l2rO9BQP3fWlybkAdmL9YZb5g6CiYx977ni/yBvJvvOBi+2GVHkSbVaZaIBUGy
	U2+sTCWboBmoieXg1ww3BjwWkrX15HlE/oCRNhxs50rgivGHjipd5yZ/UUkhkF0oPC5cc+Go1ZyCw
	jX/ITFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eg-00000005R1R-2w43;
	Tue, 22 Sep 2026 13:08:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Ea-00000005Qym-3qjl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NiGAzCGrKNlXiWDXOy73S85m7H6z+aGxCerVB6vGef0=; b=HWnJUZZilWj4z9KiMcajWjBg7V
	GiZNK9DkaUIreJ8se0RYJ5Mym9q07syzXco4EHdcIxprdVRgmNV6l/ibOC7RGP6CAnXmJ4IcAtPXU
	V0JQcv9mY0WvOKTJNoQx5X8CfVVCyJkzodSPdH1p+pUJiDF8AALiAgLuuLk1ao5z+rJ1oCVh402KC
	b47CyYA3pTN5SAp8oWuABqLtAAsNmzCutep8r63kHM1ZaUO+lsBUqz39BmTnyBiW4gurXW8e6S8HK
	Y7/SW3IQfZIVFFJugtb3mFgjDn7AoIcaL1kP+ca1ESZmIciH32fqaF9MxYfTOKjzLxB/oaPLTYl+R
	G4NkQS6Q==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90EY-0000000DbBR-0J52
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:31 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e735659b7so33293705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082508; x=1790687308; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiGAzCGrKNlXiWDXOy73S85m7H6z+aGxCerVB6vGef0=;
        b=QR3I0nfoPMWyPUuXr/QYq1bQbJkzIJ1vszBlJ7sX8SsGgPoF5fiaLzHGvyX9GbdF9+
         PNe74ADUtDCbKmfeqUeLqZ0LVO3xEY4xZJJPgr2a5em2W9N9ThbvFeaZHoQcDkybU96g
         fwKdrIXZRMcXDV/5rhiGMGYD2o/ygX98kPLZSFEVIQPukIZbXpPqM18wemoIBgk6Kvkw
         St9DM7Jrf36kf5HCylkhCgSGoqp1HIDtyX+Tz6zpjllozBVbWX949sn9IEUba+ggK3uh
         KKkWnr3+DrlsTiaKVAr7v/GLW7WLThFd4DAXu1yJWN6BsfmRZbCVmn5fNrnsQGMy66TD
         l0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082508; x=1790687308;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiGAzCGrKNlXiWDXOy73S85m7H6z+aGxCerVB6vGef0=;
        b=LhMtcjj/ECg2z6ZatwXWf7FmNSnBdScUL2vdoIBAvouazINnmGI0dFG4oP+V3/W9T9
         4zsCOy0Utgwc0bh5pOe8JTC2LuzvLVcBaXsHl/Uq5osuZS+OoOdR1COnT3P+G/gUQeE4
         tXLnXLHiljshjbxREPj+t4dzPaKDc91+A3R/FgrBGh/hHuLQIo8AnbuzwKMC5UWhl+k8
         MqER1XY8YD19dNyJB+zLA1GJZHvCX2OPEXog3XFqOG7LUIA1oSg7GYyWuHf7snj4O5hF
         cnNTFO37XV4Jn0w76mcF7zj4QRAjYVLAiLjlT+4I0NcC92xPRlvl/bOZfC+SNI9KQxw7
         vI8w==
X-Forwarded-Encrypted: i=1; AKwUvBxsOkIrLo7IDrKjqiSHctB4gbCkS9Ol1uuvoWyRNBTy+pDunQ7FGsSFwk0YNSeBV7ggk0bdnuBNSbaly6MvHzWx@lists.infradead.org
X-Gm-Message-State: AFuF++kMTBjUIKprVaT6bTXrY8zu4B3mP3D4id28ukQH26y1E8OfzZ6h
	Vdc+7U6FyHezqk0/eNgyh8YwfRsieuM5tt6vS/M6qe04BkPeKySHpOWh/MYD8nEm8WZfCVC/7C4
	1O2lyMIifRZizPlBCR3n1kg==
X-Received: from wmoo4.prod.google.com ([2002:a05:600d:104:b0:49c:d71f:ccaa])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6612:b0:49f:dc8e:6211 with SMTP id 5b1f17b1804b1-49fdc8e6c34mr15259695e9.16.1790082507824;
 Tue, 22 Sep 2026 06:08:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:17 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-3-vdonnefort@google.com>
Subject: [PATCH v1 2/6] KVM: arm64: Pass kvm_s2_fault_desc to fault_supports_stage2_huge_mapping()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140830_223186_DD51A718 
X-CRM114-Status: GOOD (  15.49  )
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

Pass the fault descriptor to fault_supports_stage2_huge_mapping() instead
of passing memslot and hva separately so it can access other s2fd
members such as vcpu.

No functional change intended.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..9dfaf4f277b5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1353,12 +1353,21 @@ static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
 	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
 }
 
-static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
-					       unsigned long hva,
+struct kvm_s2_fault_desc {
+	struct kvm_vcpu		*vcpu;
+	phys_addr_t		fault_ipa;
+	struct kvm_s2_trans	*nested;
+	struct kvm_memory_slot	*memslot;
+	unsigned long		hva;
+};
+
+static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s2fd,
 					       unsigned long map_size)
 {
-	gpa_t gpa_start;
+	struct kvm_memory_slot *memslot = s2fd->memslot;
+	unsigned long hva = s2fd->hva;
 	hva_t uaddr_start, uaddr_end;
+	gpa_t gpa_start;
 	size_t size;
 
 	/* The memslot and the VMA are guaranteed to be aligned to PAGE_SIZE */
@@ -1427,9 +1436,9 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
  * Returns the size of the mapping.
  */
 static long
-transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
-			    unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
+transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfnp, gfn_t *gfnp)
 {
+	struct kvm *kvm = s2fd->vcpu->kvm;
 	kvm_pfn_t pfn = *pfnp;
 	gfn_t gfn = *gfnp;
 
@@ -1438,8 +1447,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
-		int sz = get_user_mapping_size(kvm, hva);
+	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
+		int sz = get_user_mapping_size(kvm, s2fd->hva);
 
 		if (sz < 0)
 			return sz;
@@ -1597,14 +1606,6 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
 	return prot;
 }
 
-struct kvm_s2_fault_desc {
-	struct kvm_vcpu		*vcpu;
-	phys_addr_t		fault_ipa;
-	struct kvm_s2_trans	*nested;
-	struct kvm_memory_slot	*memslot;
-	unsigned long		hva;
-};
-
 static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
@@ -1791,7 +1792,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PUD_SIZE))
+		if (fault_supports_stage2_huge_mapping(s2fd, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
@@ -1799,7 +1800,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 		vma_shift = PMD_SHIFT;
 		fallthrough;
 	case PMD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PMD_SIZE))
+		if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
 			break;
 		fallthrough;
 	case CONT_PTE_SHIFT:
@@ -2049,9 +2050,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		if (perm_fault_granule > PAGE_SIZE) {
 			mapping_size = perm_fault_granule;
 		} else {
-			mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
-								   s2fd->hva, &pfn,
-								   &gfn);
+			mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
 			if (mapping_size < 0) {
 				ret = mapping_size;
 				goto out_unlock;
-- 
2.55.0.1082.g2b9226bbc0-goog


