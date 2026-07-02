Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1481C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5pW2X8dLODkLCHijpyvtLxcjR3119nmpK6U2x+j3Ok=; b=pgvsAMAoSiJ/KAtwcxgW3M/3Rd
	KCj+Bi1vh6GznqPhXOzAtSLdM9f3kIg1FQ+AE8R+o3zrIwtTjTZtIb7EQFLvtP6AGW7b5zkPT4Jzt
	Bs+uBuGsmXn9xkJ/vZCECCKtD1IBX2Pw1eZfCmqsmeAPy1gEB+AjfKuAecy8oK+AL9iD1EFCsHs9T
	8Njt9Sqkuy0fRfOWFS0bixhIZCGrhFRtbOopJObsYsBUebRNldwxbvg+eCWS9II8vzsG1rf1rXbMj
	OBBDSz46n8wHWqokAlvd5twZA1KXG0a75An6H9sxsQYkppvvNfu2ICAd5VzJa5hgS1R4OQHkfsU5E
	aMIiSklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEp7-00000004BeB-1hra;
	Thu, 02 Jul 2026 10:39:13 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEp5-00000004Bbn-03Os
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:12 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c1265eb65e9so168124166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988749; x=1783593549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5pW2X8dLODkLCHijpyvtLxcjR3119nmpK6U2x+j3Ok=;
        b=AHKORxfDxHVTe8hiG2vWCs8GCAiHuKFZqIKbM601GCArW8xXWes0ULxIgzEDvjFKnN
         Hm+rVSdlNeSU7NB8pvGnRM0moXYdUXpSV3BvRzz9VcfeTIZORBgGnqaSPsUL0lTtAp2d
         ObVQ1bNwBfy81nKC/4C/M1Gw2yYejN/HbRZ3ZvhXj85y2H4uGgFkIMoMbsHhT91Wuwov
         lR8qn06oWVzWyegz/kt2DoaFNgotkKLEvDUJhgG0FHoUDRkrOK9e6w6AOINstSVuNGNG
         ZxRZNISKJgY97fanrrHfONH0GPY8F1iKqexwNR/TfZw8iSNsihAWSbMQUPG7/I0TYeDs
         UZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988749; x=1783593549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5pW2X8dLODkLCHijpyvtLxcjR3119nmpK6U2x+j3Ok=;
        b=Euao6m/Zo4eJxr3rdRq7Pl3I6SIXO/399G5WhfAeZ4VrZ7XW3atyqOECC5RajqaPc5
         3Pguc4jCWbjfYJFoIy/IFqdSuVMbwGtixukql5KPRlyZHQrK4Um3sX6P+DDxy+KeF05E
         AQEiFPs3iSC45lLV28DW9AzdJrcL99VD4o7Exh7u9+7U+1sc1PtNPbkHARCzwGbi0mUY
         pRYvmobcDXmrJHw4tIsITLKsz9YW7OLLna5pCDJxMwz1gdAauIO6o5etBMiJDYpCpLWG
         WnKAVqT4mHTNSvtHkP+JtZkj2bxuZk0JhwYkXTATnTo6ju+qSMD7xMwt8toBC9tztERQ
         HqWg==
X-Forwarded-Encrypted: i=1; AHgh+RrJXZl7dK+h3kqdlxJY77xMF2DbGiaJKWQg4Ju8bSdY1aFMEiCffyDcqq7eUs3BmEfkMhb1hk4UsBC126RnwE6j@lists.infradead.org
X-Gm-Message-State: AOJu0YxfG4Jpl5/23FZ8PCwAzIjDfTiE4VmFmf5FxY8piWNUM22Y6i1g
	Nf5hcNLqHkmPXhoh1MrGj3Zod0HdW27ZVP/sBKr4Fmg+ECCQrH1nHIKeML8l1V/8dcAl3fza0CD
	lALkhuDDuklXrW1Wf1UDncUODWV/Q4w==
X-Received: from ejbec17.prod.google.com ([2002:a17:906:b6d1:b0:c06:bd7:70c6])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f112:b0:c12:951b:7f1c with SMTP id a640c23a62f3a-c12a9d7a733mr196967366b.21.1782988748201;
 Thu, 02 Jul 2026 03:39:08 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:40 +0000
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260702103848.1647249-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-4-sebastianene@google.com>
Subject: [PATCH v9 3/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_033911_072855_E67D1456 
X-CRM114-Status: GOOD (  16.27  )
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

From: Mostafa Saleh <smostafa@google.com>

Sashiko (locally) reports out of bound write possiblity if SPMD
returns an invalid data.

While SPMD is considered trusted, pKVM does some basic checks,
for offset to be less than or equal len.

However, that is incorrect as even if the offset is smaller than
len pKVM can still access out of bound memory in the next
ffa_host_unshare_ranges().

Split this check into 2:
1- Check that the fixed portion of the descriptor fits.
2- After getting reg, check the variable array size addr_range_cnt
   fits.

Also, drop the WARN_ONs as that will panic the kernel and in the
next checks there are no WARNs, so that makes it consistent.

Fixes: 0a9f15fd5674 ("KVM: arm64: pkvm: Add support for fragmented FF-A descriptors")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..41cc4c1bafeb 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -607,8 +607,8 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 * check that we end up with something that doesn't look _completely_
 	 * bogus.
 	 */
-	if (WARN_ON(offset > len ||
-		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
+	if (offset + CONSTITUENTS_OFFSET(0) > len ||
+	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
 		goto out_unlock;
@@ -636,11 +636,16 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		ffa_rx_release(res);
 	}
 
+	reg = (void *)buf + offset;
+	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {
+		ret = FFA_RET_ABORTED;
+		goto out_unlock;
+	}
+
 	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);
 	if (res->a0 != FFA_SUCCESS)
 		goto out_unlock;
 
-	reg = (void *)buf + offset;
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-- 
2.55.0.rc0.799.gd6f94ed593-goog


