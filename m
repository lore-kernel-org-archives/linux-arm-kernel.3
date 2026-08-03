Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E25C55197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPrt0jAjZ/dWa7e7v608CZcpRR+OkkaS0UKA/zQy3yM=; b=qWNIu0DbuZyhToMNT/diRhG1f6
	BvvYGJocWjOET/Wx+Y+Tn1OARLT+dk0dc2912uLAa8TVhrOgSdTQaKnjP3Pegp9efrzxattDQHVMj
	LdoJFcX90tDwnSomSIkmkH/AUEZ1sMUncbF0JX4CskrHZe917ENUVVqDihSTd1vDhpTAvayzVpd04
	r5NSs9dExx4OQ3qWPYOfg15fYYPjNEMSqtLI8v2FRBnyzF9tvOJNBvVvFY4HWHnrrCAbsKcIYghf8
	gGOdi1hpJsnZrppYnlkjSfDpcHrrsOjrfxp7RSREpbBTLng5sqLI+KnDsqwTwE6vhuevSnhNc4+sN
	lTe/E0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdk-0000000GnT2-0YWc;
	Mon, 03 Aug 2026 10:11:24 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdh-0000000GnKK-3cj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:23 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4955e865174so10906135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751879; x=1786356679; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPrt0jAjZ/dWa7e7v608CZcpRR+OkkaS0UKA/zQy3yM=;
        b=tjLD3zWfw1evU4XX4fJAPrvkYeZkXL5wA2PoIXYrzzZa6OhQywCo/m+PZjnbFTByW9
         NYrgBZl/3X6RTNhRxeo8s9XsbblnlZQ7GHGT463JJEg+eLWUuUE3XTLyz1dGX58OEgTF
         phfL97xf8OLjCItEI0lFZ28eD3Xrhh86alNYbR9fPT9qAd1jBCKsUxUP4YNLzMk5qtl1
         mhwrcDz/9X812TSLFQr7hz1EWEHFXH+1iY5rw3emWvi7rQJvw/qhucus8DGk6irtFYZG
         iT3XriC+X0M3fULPradx/omKQk5uNKHzLk1EXxXPFEfsaLUDRVxBscNwiOlXljA4xPaz
         lUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751879; x=1786356679;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPrt0jAjZ/dWa7e7v608CZcpRR+OkkaS0UKA/zQy3yM=;
        b=lbM/mNv0xz9BQUoL6KzZE4siuw08G2lDEi5XPgE+VoMKHlUXEn/fRXZSoPC6BFeMly
         spivZmGp2JvHseSzxvalOlxS6Rc5LGi7ybHmoPlm6ibM0+nQZ2taROKepAZE7ObZoLLL
         jKXGKUIqWSwuZQI43Qi/zJl1z+ik40yFA4HHcIa5eMHzHMZHt84L9WGbGaV+KQhnYOL2
         zzp3pdIVBKkyhAtGPcno2iuOAdwe5A1ZvWC6MHk7rLPjayrb0DXqdhPeXkaPQs2zPRhZ
         Z+Mer+bLr3Etz2mH4QBlT3JLJ1rKWsAhJ9oL2KxeRpFyqvD/8pP17gYW+IR7NmalqFJc
         NVNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJqk6kX/nJcImjHkYWbQ9Hf+Ecamb1+vIbgrqq4EBYsK/SpeEqHn93vQmu86BzQuZD0gnNbiX9Vz6WSRNpal/q@lists.infradead.org
X-Gm-Message-State: AOJu0YwXp4dI3Wf2BBt+MVYtWqMjiIAa/8Jp8iw1nH6/UULNEB0NUzN8
	M8fAYq6L8hlb0OWtfh4tc1J4jIlQ2Y1AukHlI3L481ZSFOJUcp1Wms2Q+L/m2B5AvOxiThqn8Iz
	5/M0JTkdRVYJOnokMZEB4RQ==
X-Received: from wmej9.prod.google.com ([2002:a05:600c:42c9:b0:493:ae35:2761])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310f:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-4994892d033mr7745345e9.8.1785751878006;
 Mon, 03 Aug 2026 03:11:18 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:09:03 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-20-vdonnefort@google.com>
Subject: [PATCH 19/20] KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031121_927680_6EEBA600 
X-CRM114-Status: GOOD (  14.37  )
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

Pages shared by the guest with the host are annotated into the guest
stage-2. If the shared page is backed by a huge mapping, we need to
split it first.

Raise a PKVM_HYP_REQ_SPLIT for the host on the guest HVC MEM_SHARE, if a
block exists (-E2BIG) and replay the HVC (by rewinding the ELR).

At the moment, the guest HVC MEM_SHARE is single-page only. This means
unsharing is ensured to find a PTE-level mapping. However as this is
most likely be extended later, raise the same PKVM_HYP_REQ_SPLIT on the
guest HVC MEM_UNSHARE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3b8e95b83bf4..57f4303aede1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1082,16 +1082,34 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
 	return ARM_EXCEPTION_TRAP;
 }
 
+static u64 pkvm_request_split(struct pkvm_hyp_vcpu *hyp_vcpu, u64 gfn, u64 nr_pages)
+{
+	struct pkvm_hyp_req *req = &hyp_vcpu->host_vcpu->arch.pkvm_hyp_req;
+	u64 elr;
+
+	req->type = PKVM_HYP_REQ_SPLIT;
+	req->split.gfn = gfn;
+	req->split.nr_pages = nr_pages;
+
+	/* Rewind the ELR so we return to the HVC once the block is split */
+	elr = read_sysreg(elr_el2);
+	elr -= 4;
+	write_sysreg(elr, elr_el2);
+
+	return ARM_EXCEPTION_PKVM_HYP_REQ;
+}
+
 static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	u64 ipa = smccc_get_arg1(vcpu);
+	u64 gfn = hyp_phys_to_pfn(ipa);
 
 	if (!PAGE_ALIGNED(ipa))
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, gfn, 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
@@ -1102,6 +1120,9 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		 */
 		*exit_code = __pkvm_memshare_page_req(vcpu, ipa);
 		goto out_host;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
 	}
 
 out_guest:
@@ -1110,17 +1131,29 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
-static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
+static bool pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	u64 ipa = smccc_get_arg1(vcpu);
+	u64 gfn = hyp_phys_to_pfn(ipa);
 
 	if (!PAGE_ALIGNED(ipa))
-		return;
+		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
+	switch (__pkvm_guest_unshare_host(hyp_vcpu, gfn, 1)) {
+	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
+		goto out_guest;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
+	}
+
+out_guest:
+	return true;
+out_host:
+	return false;
 }
 
 /*
@@ -1165,7 +1198,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 			break;
 		}
 
-		pkvm_memunshare_call(val, vcpu);
+		handled = pkvm_memunshare_call(val, vcpu, exit_code);
 		break;
 	default:
 		/* Punt everything else back to the host, for now. */
-- 
2.55.0.508.g3f0d502094-goog


