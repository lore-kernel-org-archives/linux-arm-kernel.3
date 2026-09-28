Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1019CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYaKfFIOED5JuoPKzS7izkx7Pd8mqCgQw5gWfRn6yUE=; b=d9zUmwEIxtxVMo+2D6Nzk+d4yV
	xQdAJ24C4er9Xng4DwzQIUxlqr7Fgr+ysKYz3c0fIVB6DZs82xeEHOjdpad8sFGZtz4/j76c9EMIm
	ThEZgP8mzX55PQdxoGTsNPhNo/6aARE6iaU3/xJDnyTTVCEWn5a62svcOESqhpWMuqrcco6VG8ZhW
	ovUveLhx6iwR24ewBus7w0N0NrEGraX0qusrnwAhsTvN41pKaRRxhpfm6zlbQEvS6hwCB+sGAUFaB
	dmJbEH5vpnv7zJSsRdQhgc6n2aHyAj1LbC9VrkuX+UlV0GFBUlDE/8sZcf+yyesiP3WD/swZD9ZNl
	X5dUHtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84s-00000000HtV-3iuE;
	Mon, 28 Sep 2026 09:55:18 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84j-00000000Hok-3jDX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:55:11 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a0032846d7so8562135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790589307; x=1791194107; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYaKfFIOED5JuoPKzS7izkx7Pd8mqCgQw5gWfRn6yUE=;
        b=fGebywZ0xCsakLTkFxitdjoVAglxGd8xTIOtjfhQDyovXmxbDFrHom1WjHYBub0aY1
         3J30Vwz+ugFaDfqKBgonF1JFaGf2bgKGM0y0n4eZYrTHSav+Hh+Bkx/W/lyCmsUwLVpf
         GqVBi9RiqQgZxCEBNofsrf8cw6eJQedhf0or2SpG2WwS0rR61A/WivluPXVJfLDSNGi4
         7uRaEcdgmnnrVcFkyG4VJ4gkGRS8eQmenGkQ56YNoyTZiWhZcl4GOOVLGK2ybG+b1qY3
         shtmhseiMCbxWGmetDm2/Di8YsGGu0tWjXDSkFQ8KdMLYOxLuDGygnfAbvPEossmoMuN
         9+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589307; x=1791194107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYaKfFIOED5JuoPKzS7izkx7Pd8mqCgQw5gWfRn6yUE=;
        b=a7pthl3LxpgGKGxYHLXovOqsPvRKlsncTjLjWFZfP0dLCsTmSoalBIItkE7IKzWRi1
         r53w8q/mzh6OQLaZVe+TlFq/q5xoiLVqwSUEFi6xtLvKIt+jCmP+ScEAfAlCfYBbnTMD
         kAKw36OeEN1KhDXAckyzgEGzQ7pNtBRwqG7AbOwqWTbsYgW/LbLi2PBa91ckrwk08l3R
         geuo7CU6LioThBpX5GEzQUYrM9k6OoaPuTXsh0iizRAlX91EMaoC+fjZktZ9ysdwPRzw
         /rz6mmV5iAgYzG5XZ9tfUMsGnKQn7jIHEjcDwkQp+REsL5uaTP2+4EpcnVGopoA0XrAT
         mK6A==
X-Forwarded-Encrypted: i=1; AKwUvBxZf5S4meQsQZMSt1gUlG7pRDi36hxIBO3jPxpiXcj/jkDTzA1z0cL4ewZwlcHfEWD/Muui+DS12PWDgmCRwdCQ@lists.infradead.org
X-Gm-Message-State: AFuF++k/2tURG/4rdOwC/Qx8oiCxxR40o3rDEXb8YeyLUnDSjSr26Tss
	qsnm6c6dWcIQ2sIgSN/XmrdReycsz6JOxMhxWKOWsNEx5vxmJ0PiM2I9FSfwiPF8sMpND/Ih5HR
	LMiUAj3Uh0McF6zQPECug/w==
X-Received: from wmok24.prod.google.com ([2002:a05:600c:4798:b0:49b:8f1d:7d3a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b65:b0:49f:fe7e:dc61 with SMTP id 5b1f17b1804b1-49ffe7eddc0mr76091865e9.0.1790589306558;
 Mon, 28 Sep 2026 02:55:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:51 +0100
In-Reply-To: <20260928095454.3255918-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260928095454.3255918-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928095454.3255918-3-vdonnefort@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Pass kvm_s2_fault_desc to fault_supports_stage2_huge_mapping()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_025509_968283_62C95E76 
X-CRM114-Status: GOOD (  15.59  )
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
members such as vcpu. This implies to pass that same s2fd argument to
transparent_hugepage_adjust().

No functional change intended.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2d44cd6a5aed..dc55b0792e34 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1362,12 +1362,21 @@ static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
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
@@ -1436,9 +1445,9 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
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
 
@@ -1447,8 +1456,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
-		int sz = get_user_mapping_size(kvm, hva);
+	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
+		int sz = get_user_mapping_size(kvm, s2fd->hva);
 
 		if (sz < 0)
 			return sz;
@@ -1606,14 +1615,6 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
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
@@ -1800,7 +1801,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PUD_SIZE))
+		if (fault_supports_stage2_huge_mapping(s2fd, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
@@ -1808,7 +1809,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 		vma_shift = PMD_SHIFT;
 		fallthrough;
 	case PMD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PMD_SIZE))
+		if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
 			break;
 		fallthrough;
 	case CONT_PTE_SHIFT:
@@ -2058,9 +2059,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
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
2.56.0.rc1.315.gc6ed9934b7-goog


