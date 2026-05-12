Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D977CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTRlEigdkhn6bOKBOZmqHGKnjSXcZHjG0+RY5EH/5oA=; b=TeFxliybKETIRwplDR+D6hdF5K
	ZEpj9RhVtFYbjbQnN4So3SDH/ApWjerTmzFQd/cFnwvEy73XpGS4ucYmmdXi5wJlNvJxoH2VILsmd
	Ahn0fHfdqvn6XBhmkLADUnF5fCVMgs57lmcTjxDwgsuKyQDcUr8qcAYxQFnBOvGwKDX9Rp74Nk6kV
	OGv/rrDF8ozaVp3BL0mWewnj4UhyZRVLxHJoCqnbxym0fybws3GE11gYbTZ2Ss18o2QMbC/Y+GARA
	xB9AXKKfw2QG6nU0Qdd3Hx0y4QXNy+RBO/G/QQFwtqXk4G++k1ac+sXwlmj1iqfCzHV6zi/Prqql/
	f01Z/f2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTk-0000000Ghgy-0gtx;
	Tue, 12 May 2026 12:44:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTh-0000000Ghei-0A4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:44:50 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso33034505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778589886; x=1779194686; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTRlEigdkhn6bOKBOZmqHGKnjSXcZHjG0+RY5EH/5oA=;
        b=Wmku/ALrZl1ISVbRHPPyOKmcKr2O1ONfUbdcFS4KMnGFqZJhSWI6V02mR3Ah0nbVjj
         VVwC4XvGLMyNL0tsqh+P+7aDtJARHgk0ZEtM6x6N9J4q/TNV9ItGS/ywsq8mN0SgXQ4D
         fa7blpv7zmXDrTovGVvZ3dGfEF5b34H4gaYMi9nj+ZXVQuyYyoSIiSbhX9duBN9XLahj
         a9JrUKYLRB7pyh2kpitj7d6YYy0SJ4peJ9JXHIgjhVh1byBch4sioXe+uBkah9mLc+Jw
         iMPm4PC4nrLTBREpfsT/QEPNiGFOtFodZLHdfRhX9Q5BkRIMI9cY4uRE5Seqz0i8MD1N
         y3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589886; x=1779194686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTRlEigdkhn6bOKBOZmqHGKnjSXcZHjG0+RY5EH/5oA=;
        b=EOiACw627CmS/9IedoMZn959oTq4KQlG127VCqWWaxjwCNIC74Ma/6KOoNtgcj9dPB
         bTYRGik09eTIDCqyuJRboBV2CGfnphQVMPIFhQkAaXMxKdArZCsf6VmS3xQ/8jRrzWNK
         SQgjeoF8CXwtaCCwyZSTs+yFN5ZzJF8eItUB9l99O5s4Pnag352amUtU3hu20SI0qjVm
         RLJucmuR3/0gTskiH8NajfB6mKi/+Wc7J+Zm4KkPpdn0Z0Cj2YEnfNyzRBNIGpIVzr6h
         Mikb61tyrACipff6WUg3qMWWzXmipzkyPym3OIKuD4+Vb87EYK6oFcetTsNJ2Y+VSEkv
         iUcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4wnIUwt5IKBK6I+cSrxTavry1qwb05LP2qXth73RrvVwaeWcy9/b7mUCql5xmsSs21Ps4qq9oZzn9RdoWLKAh@lists.infradead.org
X-Gm-Message-State: AOJu0YyMia/FhlQyVng8CwMDQHZLAk1MBNJIIzC5Medc02Hhr0qLaOJ4
	wQ/50ZfLlei4Rt+7wMF7JIPt84urPaTcxT/MyuKN3J+nI3lAVibS99FCrEr5dPkGdqzAdpybVvA
	MfuIGK9YRiK4sWU99FJXroYkiXRNUqQ==
X-Received: from wrpy15.prod.google.com ([2002:adf:f6cf:0:b0:43d:7331:91dd])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6211:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48e8fe72215mr45081965e9.16.1778589886397;
 Tue, 12 May 2026 05:44:46 -0700 (PDT)
Date: Tue, 12 May 2026 12:44:42 +0000
In-Reply-To: <20260512124442.1899107-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260512124442.1899107-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512124442.1899107-3-sebastianene@google.com>
Subject: [PATCH v3 2/2] KVM: arm64: Validate the offset to the mem access descriptor
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	sudeep.holla@kernel.org, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054449_092517_232C2BFC 
X-CRM114-Status: GOOD (  15.55  )
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

Prevent the pKVM hypervisor from making assumptions that the
endpoint memory access descriptor (EMAD) comes right after the
FF-A memory region header.
Prior to FF-A version 1.1 the header of the memory region
didn't contain an offset to the endpoint memory access descriptor.
The layout of a memory transaction looks like this from 1.1 onward:
Type | Field name | Offset
[ Header | ffa_mem_region  | 0
  EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
]
Verify that the offset to the first endpoint memory access descriptor
is within the mailbox buffer bounds.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..34927bc1239b 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges, checked_offset;
+	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
 	int ret = 0;
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
@@ -508,8 +508,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off >
+	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - sizeof(struct ffa_mem_region_attributes)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -576,7 +582,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 3);
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
-	u32 offset, len, fraglen, fragoff;
+	u32 offset, len, fraglen, fragoff, em_mem_access_off;
 	struct ffa_mem_region *buf;
 	int ret = 0;
 	u64 handle;
@@ -599,8 +605,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	len = res->a1;
 	fraglen = res->a2;
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if (em_mem_access_off >
+	    KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE - sizeof(struct ffa_mem_region_attributes)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	/*
 	 * We can trust the SPMD to get this right, but let's at least
-- 
2.54.0.563.g4f69b47b94-goog


