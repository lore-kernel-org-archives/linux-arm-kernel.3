Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvvBZVAHxjCca8xpuD4vg6YCLTc80qN7YLXWi5qiQXY=; b=nHnWg2qg6Nfn8G28Ujbm4HgZ4b
	i3SrSDxOqG4o9AyZ3S5BRGfG7QhyOZSsAUxpvCx8bZodsfXqCRTb4FlqgcPxTNRwKqcsG86n7lyLi
	SAznvH7sMPG7b6U9a4Ag3i879ueQVJmCBGBQ2pIcb3/WsAt9Xm72HC+IaR2YDeYjiz4iENBTTBErz
	w3fU37DHBcGjo80cAr0Ehs4cnEOojlLau/l4WBSAs5LHD8cZI3xk5E8cvNCFUgX50/5KwkVbmThne
	AZms6S6ACqHFh0EUKEKlo8CpL1fjE7ppK/v43DjIeZ4qghcvn4auQJqUn35fv1D8kv6yXWmk4Dse4
	enN54tHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEpA-00000004Bgm-3e6H;
	Thu, 02 Jul 2026 10:39:16 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEp8-00000004Be9-3o04
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:16 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-c1237547c18so177200966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988753; x=1783593553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pvvBZVAHxjCca8xpuD4vg6YCLTc80qN7YLXWi5qiQXY=;
        b=jmfR4MMap7hnPId4SJuHaxewT+0q49LnB0yi2PL83Y+T2mSZgNblz2EGJCzrQB590R
         3ETKR4vG6eJC5YvRp6ca2jrfP7WUi9MKSltiYipK2qFp0FbWCPySFhLa7aJigczIIn7c
         N2WrKn181WpSJp4UG66x+P4bigDV3J7s02w56dI9wO8AlZl8koXuX5FjEOfBpD2see67
         8tJL48/IthJKvjGCsrDSdIlIylHH5rvjc5eMw8z31gloLSN4GsIEgfu+1A/FLy2PhdyF
         ct/cC54pa6e+b/19NkUROI3rflBdbv4zYIkfg7ALdCgt3W6cwSJwHJz0XQOJ8DP3hGxV
         NwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988753; x=1783593553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvvBZVAHxjCca8xpuD4vg6YCLTc80qN7YLXWi5qiQXY=;
        b=POu+spdUxwoeu2nbfn0Un3Tthegth+NbOlgGeSQ37T0YO8nJwZjDiSOAjkP/UFTCU7
         A70GYcQHTMTj0tBl/sJrpMjz8iuwGzgYmWFUiy9caDOOuTnvfccrsfxC/wcVhnKqvEgj
         Z7Ar+V4SrxPfXlSz3ImfQJRAI3+rtvg3WpjLMkoqRaZoFNQ11WZoXcknvGg30st9VRcw
         p9ncMucyEHTDgG9DvJKtNe8FSAbaW1xek1BSH1PKBddJt1McPX7jmKHzFmkLXp82RisM
         zrPaJK/uJPNeY8tKGccmYGPArT0+ZgCozyQ7wazLOG58/AcO9req+ppIL477UV0ZB7mp
         ncaA==
X-Forwarded-Encrypted: i=1; AHgh+RoeYS2EzAhKagLaDpZRyd8ZzWFrMPdMNvNN8Hkt2O6V3/sUYL9VpXfYB2nDhfS4HLqXUPxF1gzDSQM5y0S2O4So@lists.infradead.org
X-Gm-Message-State: AOJu0YzwlRBnRbniiKbfcKbaZcC8GI4AtJ21EuS0ex5UdSKFox1Pnv7w
	DCKuTeIJCTz3Nh+Vrk3eq7JLQNFBc1gyHEnGR3cCI+wxxzFud9dRj+inlGXuf2/E+ZPSzIg55+i
	S7GtvrXqsbw5Zs8LfqEccPnheUkHC0g==
X-Received: from ejcxl38.prod.google.com ([2002:a17:907:d866:b0:c12:69ca:c04d])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6290:b0:c12:34ed:e0fc with SMTP id a640c23a62f3a-c12aa1d60f1mr264254366b.58.1782988752409;
 Thu, 02 Jul 2026 03:39:12 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:41 +0000
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260702103848.1647249-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-5-sebastianene@google.com>
Subject: [PATCH v9 4/6] KVM: arm64: Validate the offset to the mem access descriptor
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
X-CRM114-CacheID: sfid-20260702_033914_974825_94526734 
X-CRM114-Status: GOOD (  18.57  )
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
index 41cc4c1bafeb..2e7ab7e3319d 100644
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


