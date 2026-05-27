Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBEDCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BckYBENK6hhz+ff2bUCfdnEivIY8LabEaYEeFq/XAWw=; b=bArfcA6FTmRoFeSyz8AoTEgIoF
	IjgSeyhyMeFo7F22qWL26+XmBgI+XNeIuiyk58Hvnn0BE+lRoJ3Rn9KC+rQBjSS58ZSLCevDtd8tR
	X0eQMkM9a1J24myf6RPY8jcw7RocRdKJ0RWott9GNR06Ty5s+gbmgPSn5FbZNDJzGVssHv7Y+IO0h
	prSInt+hDa/d0S3jQgiiCftFEL0OYjHcxHDYjoJx3z5ciI5EZdHinV/iP2GUnTWulNBfHd5OvVuRe
	F00r+BdpM8+ZO3YH80SLeJYrwiHtdAsInZIlaxZ47T5z2/F8DiVFJM3+QobeYSRxwgsSDpe2KOM34
	moF9CCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmm-00000004MOa-1MHb;
	Wed, 27 May 2026 15:03:08 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmT-00000004MAJ-1PKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:50 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45ea38c03a1so5612740f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894167; x=1780498967; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BckYBENK6hhz+ff2bUCfdnEivIY8LabEaYEeFq/XAWw=;
        b=erlsattoeKNUqhT03LZapcfTok3U/d9bGQ/jzEK1SVEyO6YdVvl87ykWKmcaq0uizg
         lf2+KCrenBn7Nnq9PlI4mzstWKhOtS4d/oEAWykCMf9OKYPrqRpUpt1W3lNWULHQ9SBU
         eV34cbmlrEzNMRezD+ZyCaYwB19i6+qjbSDlJa7atoh1KUSDGPriZ9JdT75Ccs9MsOV9
         phdcHTcOh5OBmxiIl1GkenQjFsVvGQJYWq7Ujh14A9142L0BiGRQjXknTBKjZ3HJe+VH
         CZeX6qo/FldOKwS8mNqKgGGpol15EIGf6rkKC3lRucb6k9WnXM/bRl9Dec0uQE6v7Bwu
         z77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894167; x=1780498967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BckYBENK6hhz+ff2bUCfdnEivIY8LabEaYEeFq/XAWw=;
        b=WVaBYO9xCQazCPSm/NYt6+As0lWXIgMkoAT3Wq7qklySupSWzroiBpXN7fgz7JrJA9
         +cngqqUpmWG7dUNoCM4axPrFiYKM7k87nxBbi4k5AoHBTy47EwFIUs/ffQEv3zNFr8ZP
         YHp+Lzdz1ApQcrBoneQfwFtcb5GYiG5JwatrebmP1MudMdMKQ3lAT1Mv1my1kFqqPUJM
         TAPeH13AfEfU1e3RO7Z42dgSVmnxylNtAkzKoVwJItpTOzLW1bFvexm3xnX5SNrnJ6pW
         wzAdq7WDYqXNKnCkK4ddE2iIP2sYZYhZBGOjNqC8grGZBC/ROECsnz8Ei1j31VJcbQrQ
         aBPw==
X-Forwarded-Encrypted: i=1; AFNElJ+5+zIf+kxO7pmiEx2KM8PZwwxLcTrgcOQZYRqf4RaanirnZWajt6XiBQyYpSVmHFZShsgufsIQ22kRlosBmplz@lists.infradead.org
X-Gm-Message-State: AOJu0YyhG9f8zp0xyUySV4neOwqszqn5mICEwDcv/pZM7QaI7U9b8l9O
	9ZtsE78vC53KEIeQwe9/gZFsiNQjCjvVkHbBcoTOByHxyMJIdZcq8TwYkHlcTS2QH89M8KDJVl5
	/3A4RSuXSVlrmPA==
X-Received: from wrjb1.prod.google.com ([2002:adf:e301:0:b0:44c:f833:f80e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e011:0:20b0:43f:e9ee:5610 with SMTP id ffacd0b85a97d-45eb38b0408mr28581235f8f.43.1779894166481;
 Wed, 27 May 2026 08:02:46 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:35 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-6-smostafa@google.com>
Subject: [PATCH v6 5/6] KVM: arm64: Validate the offset to the mem access descriptor
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080249_396342_76B9509B 
X-CRM114-Status: GOOD (  15.65  )
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

From: Sebastian Ene <sebastianene@google.com>

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

Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.

[@Mostafa, Add missing call to ffa_rx_release() and use fraglen
 as the max buffer size as it is the only intialised part]

Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index b6cf9ad82e12..a12e01883314 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -476,10 +476,10 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	DECLARE_REG(u32, fraglen, ctxt, 2);
 	DECLARE_REG(u64, addr_mbz, ctxt, 3);
 	DECLARE_REG(u32, npages_mbz, ctxt, 4);
+	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
@@ -489,7 +489,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	}
 
 	if (fraglen < sizeof(struct ffa_mem_region) +
-		      sizeof(struct ffa_mem_region_attributes)) {
+		      ffa_emad_size_get(hyp_ffa_version)) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
@@ -508,8 +508,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -574,9 +579,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, handle_lo, ctxt, 1);
 	DECLARE_REG(u32, handle_hi, ctxt, 2);
 	DECLARE_REG(u32, flags, ctxt, 3);
+	u32 offset, len, fraglen, fragoff, em_mem_access_off;
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
-	u32 offset, len, fraglen, fragoff;
 	struct ffa_mem_region *buf;
 	int ret = 0;
 	u64 handle;
@@ -599,8 +604,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	len = res->a1;
 	fraglen = res->a2;
 
-	ep_mem_access = (void *)buf +
-			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
+	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		ffa_rx_release(res);
+		goto out_unlock;
+	}
+
+	ep_mem_access = (void *)buf + em_mem_access_off;
 	offset = ep_mem_access->composite_off;
 	/*
 	 * We can trust the SPMD to get this right, but let's at least
-- 
2.54.0.746.g67dd491aae-goog


