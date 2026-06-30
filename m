Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F23CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2U/VeegX6zkq+FfETCymx32V7rN5pCpIXqjl6Jjj74=; b=alvuk1ssiB4X8Wh/15D9OZoD0K
	7VLsKnoEqOE9ljyKXUfu7X2IvrDx7U4xBZhBYCh3ovLYHHSrLilzxfy7SapBbCzP+zwEQ3P7o85hZ
	hXuAcVENeO85va5NWQ4556HzstmztCEIij24OaOKZBg1AXUEEJgvtcNd8aV0RceZ+G5RagiT/YeqX
	rMnTM8+opsLASem96/EAAv9NZoKuluPLf1ToC9ep4BOgGI3jFvIpxlKvNqDKVERluiLmzUM/83+7f
	nKb7FVsoWiXNPkCfWMpvwr7Sxwcha8b2OGTnr9XwUcU17zENmPYaCDhGeHS1gDrQLjLOhLZNB8eme
	7x7bTdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVb7-0000000GcRC-2s41;
	Tue, 30 Jun 2026 10:21:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVas-0000000GcGt-0Y0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493ba771d1bso7176225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814887; x=1783419687; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2U/VeegX6zkq+FfETCymx32V7rN5pCpIXqjl6Jjj74=;
        b=mQfuuNltU9ZX8sy1XsTSohSGLD0LoXxjBnwtZO3p1rDz7DDVVUBzWX06qoquwin0dX
         SHZTBcHdCP1o8Y+S/oVoTFqXepVoJyDN5257vCwDvbv2xBYRcUQ1q2lZKyJfSp2M8sRZ
         S2/1eseS/wHMQLP1b2PkZIm92UPz6eFLximQTIui9qwFlPukEmtOWeOfvZrAvuQRbPSS
         2xQ4Axte90tqgxwIC5EZjVpb6rwr98o1iCBf5bK/Q6v6wcSsAiQXi0O2nBqHn5xHyBFM
         HfkYJJPNwVfpYo54DC0Uh7AE816V1XdilvXJopEC/7SY6Wf70efaydefkQ11K2dSkJCr
         C30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814887; x=1783419687;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2U/VeegX6zkq+FfETCymx32V7rN5pCpIXqjl6Jjj74=;
        b=i1p20sZHl5yzwNKnt0KYzhhKGFtrSd0iirXgzAmZOT5sc1X3t/aUVJ4g6nnvHvilkS
         Lez8f+OF+b+NRUQjGnC/h7pTSBMoX+Mc5kCeViHUiZ3TNI1gvEd9JM2yT0iHqLCPSjiv
         89lUOiZNp3mXbklGkOadbdpoR/+fh1UrW5pu7OeBLE5gHGCJ4JKK6FhXhiGasS4hbzhe
         kE8+cc10en79OxlZbY/d+2eiGL/dr+cylE0pfFPwdRKgNtJoiJVQPhxF0sov+CM4YcQS
         xWXy9z93YZRa3welPdDc30qR4agAVwU7onl5XGk58N7TsBOu6Wb8tQ4ckGf3lOaEBL/U
         YsUw==
X-Forwarded-Encrypted: i=1; AFNElJ/qdhTVx9Vvru/rljzz2wlzeRdinSMiyVzyn1SphMGCKL2eD/mkyRo1Dqd/LXA0E+82zQUpF+rdiw1xX3AIFTzO@lists.infradead.org
X-Gm-Message-State: AOJu0YzASc3i0qPdfagl6QMyM5/lnoi0+83CiRv7LIzs/YClpu0Mv+kc
	Xhx68DcvLsJxcGd+44uNc7MgT743XAf5Vk71zcjAL9LeUWs45eC/5To0lkmFnshGd3wZNguIno7
	+5UrogEXH02LLjCq+bjzQB9UKpAne/g==
X-Received: from wmrc3.prod.google.com ([2002:a05:600c:ac3:b0:492:4e77:8950])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b96:b0:490:acb8:1490 with SMTP id 5b1f17b1804b1-493b827fd1emr41693135e9.4.1782814887055;
 Tue, 30 Jun 2026 03:21:27 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:57 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-6-sebastianene@google.com>
Subject: [PATCH v8 4/6] KVM: arm64: Validate the offset to the mem access descriptor
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
X-CRM114-CacheID: sfid-20260630_032130_198519_73ACCD10 
X-CRM114-Status: GOOD (  18.20  )
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
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++--------
 include/linux/arm_ffa.h       |  7 +++++++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2d211661952e..14aa37846059 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -476,11 +476,12 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	DECLARE_REG(u32, fraglen, ctxt, 2);
 	DECLARE_REG(u64, addr_mbz, ctxt, 3);
 	DECLARE_REG(u32, npages_mbz, ctxt, 4);
+	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
+	size_t mem_region_len = FFA_MEM_REGION_SZ(hyp_ffa_version);
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
 	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
@@ -488,8 +489,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		goto out;
 	}
 
-	if (fraglen < sizeof(struct ffa_mem_region) +
-		      sizeof(struct ffa_mem_region_attributes)) {
+	if (fraglen < mem_region_len + ffa_emad_size_get(hyp_ffa_version)) {
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
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 033c630b271b..e71d83ee0aef 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -421,6 +421,13 @@ struct ffa_mem_region {
 #define FFA_EMAD_HAS_IMPDEF_FIELD(version)	((version) >= FFA_VERSION_1_2)
 #define FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version) ((version) > FFA_VERSION_1_0)
 
+/* The layout changed from FFA_VERSION_1_0 and the region includes an
+ * ep_mem_offset.
+ */
+#define FFA_MEM_REGION_SZ(version)		(!FFA_MEM_REGION_HAS_EP_MEM_OFFSET((version)) ?\
+						 offsetof(struct ffa_mem_region, ep_mem_offset) :\
+						 sizeof(struct ffa_mem_region))
+
 static inline u32 ffa_emad_size_get(u32 ffa_version)
 {
 	u32 sz;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


