Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D769CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkRBbhHB4iuN7xSPIITChDuTjwYpXvbOBnslFsQsEpc=; b=We+Kuf/lQbBKpyx1OqlWLRyLLb
	YM4V6zxrW0eimVxE+TJkOjCAaiS/vRkVZ5rsh+EovYuDlSDWtvg+ucSDFGx2ujcdPjd292BhLF/RP
	1uTbnrMAJ0sZUJ7wC/tecG476IP5NFA/oduCoEF2t1+Co7dJCrOmuTiqyY75R8MGsYeEePd/lWw/R
	7DAAmupUirHehe6/kGqgIgPswyaGd8QPDEPynDg+rqsgoMRXF78AqBayZms2kaXkJLt8R7gDZ1D9O
	u/oATl9QAAWmypcHawiK5x1Oz+tKcB6NhpYWg8Ih29jsps7OS57D5s8qPMVd5hhsYQ1zfTAMnvZXP
	VkBUQuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcT-0000000HVHl-1IYC;
	Wed, 17 Jun 2026 14:51:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcN-0000000HVCx-0QUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b0682d2fso55108195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707909; x=1782312709; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkRBbhHB4iuN7xSPIITChDuTjwYpXvbOBnslFsQsEpc=;
        b=uqGby7zSHsLzaLeG5TQmHbueoIktx48esKyp/0uwg5gxGN2rEjbiYwl3tkQUryiczt
         AJ41JD1IpDimqJtG97M6BVLHAP8jV8H6zGbdRCkrbz+wJYAQAKOel3/avor7EeiyOAt1
         eenmYGoGusf8XDplaB2jA5g3p5f8qyGhuW5QnBxgieD8dXJgJvsGLJ6yKrWZlOwv7kVL
         3py35T5Ozp7oehalj0Krk1vixkTkWTPGwFDBvJtStV5f1289gpInKA3qXtfxhlwvsn5W
         i3/NevjOFohsY+ARSE1ud3HqzsLuCYpAExABSF5Ur1HkXzg0FqwYTVFu2C675EqQw7M7
         e1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707909; x=1782312709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkRBbhHB4iuN7xSPIITChDuTjwYpXvbOBnslFsQsEpc=;
        b=q1a6NYPPcIdicYfqoYC0XkaUtNVRgZ+iN/fxo20Q+ofm8OpWNpQyZzVlhoZFz9g2DG
         d/Ky1GACDqWpFA72H6mwIDJ+O5ctWcojSrTUOZgp4J2fmIMBL/o3DGo2jp8X97lo2yiQ
         Z+fCT/YaBtMPnf0Di4A9v/Ji/6djPsxbzjME8a/aiHZlkAS77EvnqnHWZl+q6nD4V0DZ
         TI8jNBX0jPyS+TkTL3hgt0qwRy/EhVOkhyNS4byVaCtYZ3UNH9s0FLDEEWi0bBuzE8Eh
         QKqnZluHD0U/Z59Jh12YfGDTKTqp1LIDGi7TWVNHJUic5hfUu6m3q3GFzkHnBPPR092G
         NTcA==
X-Forwarded-Encrypted: i=1; AFNElJ8snEmRohV8SR2RhOnQ9A1KvQ3fPlNaEIzN2UrIne9pHbI3NurC8dqJQAKbb4xde741G98fOWuG+aj138vGqUDC@lists.infradead.org
X-Gm-Message-State: AOJu0YxG8oX7sronMYBxdqFSslroFlFKBakBouYZjkhSXUJH/LiZ2ydq
	EkPKU8rlEcsTfQztSV6gTcx9sShgM3IWtLiPynhY0+5TRiL387N9HYDnigD5a+jWR2AyswFasxU
	d4loaiXrrDImUltO4y9H5g4w/L9iWag==
X-Received: from wmbc22.prod.google.com ([2002:a7b:c016:0:b0:491:41a:40d4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37ce:b0:490:bd66:e526 with SMTP id 5b1f17b1804b1-49236791faemr29047845e9.32.1781707908701;
 Wed, 17 Jun 2026 07:51:48 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:28 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-6-sebastianene@google.com>
Subject: [PATCH v7 5/7] KVM: arm64: Validate the offset to the mem access descriptor
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
X-CRM114-CacheID: sfid-20260617_075151_176066_F421E43C 
X-CRM114-Status: GOOD (  15.75  )
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

Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.

Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2d211661952e..1a2abd0154c6 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -476,11 +476,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	DECLARE_REG(u32, fraglen, ctxt, 2);
 	DECLARE_REG(u64, addr_mbz, ctxt, 3);
 	DECLARE_REG(u32, npages_mbz, ctxt, 4);
+	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
+	size_t mem_region_len = !FFA_MEM_REGION_HAS_EP_MEM_OFFSET(hyp_ffa_version) ?
+		offsetof(struct ffa_mem_region, ep_mem_offset) :
+		sizeof(struct ffa_mem_region);
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
 	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
@@ -488,8 +491,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		goto out;
 	}
 
-	if (fraglen < sizeof(struct ffa_mem_region) +
-		      sizeof(struct ffa_mem_region_attributes)) {
+	if (fraglen < mem_region_len + ffa_emad_size_get(hyp_ffa_version)) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
@@ -508,8 +510,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
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
@@ -574,9 +581,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
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
@@ -599,8 +606,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
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
2.54.0.1136.gdb2ca164c4-goog


