Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C8C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1SHt6f3Y8x+OinsnAYT+PECaOjWB7+9TgxMssXHyA4=; b=eWE8jj6bhDq/cZhT1m+fAvs+bW
	PIDvX9usEHX0S4PSf7VK6czc4WrtLPBhPcSDsuugy3sfCbetoDxsmsgpo3V6NC0W2Z9qzcDNeK9+s
	hIJMyqxY8g3jUnsYkjDrXS5MZI7KuxoaKH20ZT8CT/3wCVRq09cqOB4f36SSJk+amS/zgX8kiZGL6
	TCbTSKXaiSzqZFUo27Q7LvOp+eslDsC+kkH6R7MnMU6SmwyLMbRhEN3UNQify9ted0PLCnzGaKnnU
	FUw7318RdDZs+G+i7CHZBB5Es1T0uyDtRldIYzECW1MKCKicZPpoKOEX9W6ejKM4NUZRqFeSWXJJH
	sCkUVyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fT-0000000GoT6-0AUf;
	Fri, 11 Sep 2026 13:51:51 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fA-0000000Go5y-20HN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:33 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49d1a778b9dso8865805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134687; x=1789739487; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1SHt6f3Y8x+OinsnAYT+PECaOjWB7+9TgxMssXHyA4=;
        b=eHxJA/cORKymyCDYg6rkPFg+JlLzmRbwCkqKZLoOcjd5daYXKad89wb0ovxypuxf7p
         YITqv5FD0KRCvCepqUl9HrbWJ0pJQwAABi3zZnX4iRrOaZbucqlciqwqQ8D2VULpiHUN
         1lLfzDw8H75hm+bIshX3MJD8kGqW3tNDM5Ecr+Hn+MA+bsG7T+nXFD6fZTsFDRZ7eDkN
         WSwMWxOS0Yi2NI6iqlxbHSsCzFLDgszxS78Dd/nEfM2SIiuUyhj+mn5aeRdmBFGyuyZe
         jV63oMq2yErRizLTx8hgFspnjCRDXxPFOiII3jwNWSAoQGX4MUm4YkSXeulj+aDIoTji
         s+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134687; x=1789739487;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1SHt6f3Y8x+OinsnAYT+PECaOjWB7+9TgxMssXHyA4=;
        b=a40xfqt4+VWGcsEjzKWbJumWNPc2xAYhw0/hLTX/vPbalGBXCu+Xfyg3v3U8eceVUr
         IuuDK/AJc7k2sXTbvY5HuiRbGEOR8uJjplbY//Wa2aP+8CYkELJrBwNG5wNVB1a7DPCo
         WkxtMnJcI58rVODzwoaKc4YaDAv2HJK60kAraTWx0Z6Y8VtuMisEIebnNKbuNfEdjEJZ
         BtndcZIH87G4RqcC/jy10JOBS3mZ89cwgGhLmiPPCXWVDnGO79sHiVo0vPg3W8K4rcmJ
         IMn0OvHJ4iyE5PeKwrxoYpcX0XdoBR6cFCj87Y9dEax8WKGrZOY8gp8FpoQZIpByTxj/
         cwlA==
X-Forwarded-Encrypted: i=1; AKwUvByCyBxrZjx0Qr0KgykLXpQRevzM/rm799pJCF0kEn7wtgZ2/Vae8YF0AF5ohb0WA3r4WaIROCZ4KIUyT8Hlb5/r@lists.infradead.org
X-Gm-Message-State: AFuF++nuBynI8aUGoUkGiK+kgFviTbK5wFMejj/GHhJauUMGWYvp9KRf
	qS1B7262MQlMupVHn5CD0L6ARWbOwMZ1QBTsW9TnVK6zO29MoxqS0eCNmvGRJeOJWun+id5hi9M
	xpTKHQvStdRoifhoAzF0PWw==
X-Received: from wmtk6.prod.google.com ([2002:a05:600c:c4a6:b0:49e:65c1:6109])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e663cc929mr48137635e9.15.1789134686931;
 Fri, 11 Sep 2026 06:51:26 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:52 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-22-vdonnefort@google.com>
Subject: [PATCH v2 21/22] KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to
 host sharing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065132_563634_4BA705F8 
X-CRM114-Status: GOOD (  16.20  )
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
unsharing is ensured to find a PTE-level mapping. However, as this will
most likely be extended later, raise the same PKVM_HYP_REQ_SPLIT on the
guest HVC MEM_UNSHARE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 2b0b0bc3064c..9b24c2233490 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1095,16 +1095,34 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
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
@@ -1115,6 +1133,9 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		 */
 		*exit_code = __pkvm_memshare_page_req(vcpu, ipa);
 		goto out_host;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
 	}
 
 out_guest:
@@ -1123,17 +1144,29 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
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
@@ -1178,7 +1211,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 			break;
 		}
 
-		pkvm_memunshare_call(val, vcpu);
+		handled = pkvm_memunshare_call(val, vcpu, exit_code);
 		break;
 	default:
 		/* Punt everything else back to the host, for now. */
-- 
2.55.0.1007.g17ff1f9808-goog


