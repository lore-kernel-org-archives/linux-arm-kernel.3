Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDA1CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk0/+2CjcY2+fUUwbJIId7ZPArsTXXXhFqe+Sv45Y7A=; b=CV2qnixU4UyvWARzp9kCkax7e8
	jddHcGYshTiD19no6vjIsWGg4+tAC5RvktWf1HHZAkwOGEuDJDVbkqKH6wfgyeZQABT1S7Pu28wal
	Iu7BSeGpGVdcU78qsT7K2ExS++76h/coj4VJu7mKrpEqrvcFsIzSunko6TLrAXAXfegD13a4eU7ZV
	52JmZUmadbmGQA7OPu14newwS/EYp7QDVi7ltgTv3O33yT0KqaAABQM0QHvs54IV/eSVax+dxY1uB
	lDbjnCYHmS5+aYeTpzJ566mdjCl0Pn8WMRXIoJnDd9BTinX8c2VZyfqRa35+BoYrNVAcP2CsX2nwk
	D1klXpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrc-0000000AQxs-1VQN;
	Fri, 12 Jun 2026 06:59:36 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrX-0000000AQuj-0puP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:32 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-68c8bba56d3so470012a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247569; x=1781852369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk0/+2CjcY2+fUUwbJIId7ZPArsTXXXhFqe+Sv45Y7A=;
        b=C1NaahOqLu2/U8plSl/zrQwzRaA/R0Iw3dZACFXTK9y+J1xO1wi9Z05PiGynJlYoFh
         CZlPyB+QFyINvSTYaV1W/92dPXx51osoMrySl8MFJsy5v+aejnLud5rbA2Hi7JBcs50x
         o4cp/FC2b34OJFnxvF17ZMWOC1zpVQFTcb1pKz8r2TwLvAPBLJx3Xx5y2VHvWkCdnFZT
         oj6IHRhy/PNlqc7OD/bDeFnlZW2ammorqg08sJQr1KDnGHfeIJxuAPca3ZTk40JqEJ+Z
         S6QG3YNMFklCMxosGYFrX3vlEofb0BZ7qs/uOBFb6+TloPKU1Rnd5/wjSe8TZ3qo5fjL
         thbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247569; x=1781852369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk0/+2CjcY2+fUUwbJIId7ZPArsTXXXhFqe+Sv45Y7A=;
        b=eR8SnpWNoq+jToTeVvVkLa58DdhP/y2Qmdteoq54lzd+Z6ywluzy/dvV6+cc+2nR93
         BVfqtWYvFkW8Q52Ak3qfixPWxiftfYPKrIXpMPB2Ip+21f2DJ2/1smJGomTkdU9dN6Hs
         9eZFNsO2YuHs7RitzzzCoxBL1hPSj3hEbwfVALPSq55FCathji8hzwVO3HQtsi6E5SoF
         mkmkj2ZSO25J1mEzq3U1zXEl5xn+ze7nWR66zkqRLYJ1A6NCDFjEq7Gi1r/kIc63vkPm
         w+iTHEQqCBEvOAskhGHxr4+enJR7N5wYOW5PQMqU2xQB8LlgB2Xhnr/tJ5GqGqsEa7HR
         4WMg==
X-Forwarded-Encrypted: i=1; AFNElJ85qImUH4LmDNwsu9Y0s3ZWhbJKmpjoH9AQTne5Bsk3VrvHpEHXFYsEzFSNG6MHR5I2g7tIhhO94+YXXCc9RIaQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw866EnFwpGFLdKjT0wvcvU9P5nwgUB+6xKijhCuC3Klh+Vyv8I
	aJaVYybBapacddK5EJEmTGyY8ITricsh84WTQz5jmhDNG5nCNAu50eWfBvdfvkTCC10bA1+s3Jb
	8mw==
X-Received: from edpg14.prod.google.com ([2002:aa7:d1ce:0:b0:67d:1c0:a45b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:ea9:b0:674:1fe8:407b
 with SMTP id 4fb4d7f45d1cf-693788f842amr526512a12.9.1781247568420; Thu, 11
 Jun 2026 23:59:28 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:16 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-3-tabba@google.com>
Subject: [PATCH v1 02/11] KVM: arm64: Use guard(hyp_spinlock) in pKVM
 hypervisor code
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235931_491103_EB5E74DF 
X-CRM114-Status: GOOD (  18.34  )
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

Convert the manual hyp_spin_lock()/hyp_spin_unlock() pairs in
arch/arm64/kvm/hyp/nvhe/{pkvm,mm,page_alloc,ffa}.c to
guard(hyp_spinlock) and scoped_guard(hyp_spinlock), dropping several
unlock-only goto labels in favour of direct returns.

hyp_fixblock_lock in mm.c is left as an explicit lock/unlock pair: it is
acquired in hyp_fixblock_map() and released in hyp_fixblock_unmap(), so
its critical section spans two functions and cannot be expressed as a
single lexical scope.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c        | 154 +++++++++++----------------
 arch/arm64/kvm/hyp/nvhe/mm.c         |  37 ++-----
 arch/arm64/kvm/hyp/nvhe/page_alloc.c |  13 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c       |  86 +++++----------
 4 files changed, 105 insertions(+), 185 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..46cd4fa924be 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -313,17 +313,16 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 			      struct kvm_cpu_context *ctxt)
 {
 	DECLARE_REG(u32, id, ctxt, 1);
-	int ret = 0;
 
 	if (id != HOST_FFA_ID) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 	if (!host_buffers.tx) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
@@ -336,10 +335,7 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 
 	ffa_unmap_hyp_buffers();
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
-out:
-	ffa_to_smccc_res(res, ret);
+	ffa_to_smccc_res(res, 0);
 }
 
 static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
@@ -418,18 +414,20 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, fraglen, ctxt, 3);
 	DECLARE_REG(u32, endpoint_id, ctxt, 4);
 	struct ffa_mem_region_addr_range *buf;
-	int ret = FFA_RET_INVALID_PARAMETERS;
+	int ret;
 	u32 nr_ranges;
 
-	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
-		goto out;
+	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE ||
+	    fraglen % sizeof(*buf)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
 
-	if (fraglen % sizeof(*buf))
-		goto out;
-
-	hyp_spin_lock(&host_buffers.lock);
-	if (!host_buffers.tx)
-		goto out_unlock;
+	guard(hyp_spinlock)(&host_buffers.lock);
+	if (!host_buffers.tx) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
 
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
@@ -444,19 +442,14 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 		 */
 		ffa_mem_reclaim(res, handle_lo, handle_hi, 0);
 		WARN_ON(res->a0 != FFA_SUCCESS);
-		goto out_unlock;
+		ffa_to_smccc_res(res, ret);
+		return;
 	}
 
 	ffa_mem_frag_tx(res, handle_lo, handle_hi, fraglen, endpoint_id);
 	if (res->a0 != FFA_SUCCESS && res->a0 != FFA_MEM_FRAG_RX)
 		WARN_ON(ffa_host_unshare_ranges(buf, nr_ranges));
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
-out:
-	if (ret)
-		ffa_to_smccc_res(res, ret);
-
 	/*
 	 * If for any reason this did not succeed, we're in trouble as we have
 	 * now lost the content of the previous fragments and we can't rollback
@@ -465,7 +458,6 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	 * sharing/donating them again and may possibly lead to subsequent
 	 * failures, but this will not compromise confidentiality.
 	 */
-	return;
 }
 
 static void __do_ffa_mem_xfer(const u64 func_id,
@@ -480,29 +472,29 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
 	u32 offset, nr_ranges, checked_offset;
-	int ret = 0;
+	int ret;
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
 	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	if (fraglen < sizeof(struct ffa_mem_region) +
 		      sizeof(struct ffa_mem_region_attributes)) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 	if (!host_buffers.tx) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	if (len > ffa_desc_buf.len) {
-		ret = FFA_RET_NO_MEMORY;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_NO_MEMORY);
+		return;
 	}
 
 	buf = hyp_buffers.tx;
@@ -512,53 +504,41 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	if (fraglen < checked_offset) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	reg = (void *)buf + offset;
 	nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
 	if (nr_ranges % sizeof(reg->constituents[0])) {
-		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
 	}
 
 	nr_ranges /= sizeof(reg->constituents[0]);
 	ret = ffa_host_share_ranges(reg->constituents, nr_ranges);
-	if (ret)
-		goto out_unlock;
+	if (ret) {
+		ffa_to_smccc_res(res, ret);
+		return;
+	}
 
 	ffa_mem_xfer(res, func_id, len, fraglen);
 	if (fraglen != len) {
-		if (res->a0 != FFA_MEM_FRAG_RX)
-			goto err_unshare;
-
-		if (res->a3 != fraglen)
-			goto err_unshare;
+		if (res->a0 != FFA_MEM_FRAG_RX || res->a3 != fraglen)
+			WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
 	} else if (res->a0 != FFA_SUCCESS) {
-		goto err_unshare;
+		WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
 	}
-
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
-out:
-	if (ret)
-		ffa_to_smccc_res(res, ret);
-	return;
-
-err_unshare:
-	WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
-	goto out_unlock;
 }
 
 #define do_ffa_mem_xfer(fid, res, ctxt)				\
@@ -578,12 +558,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	struct ffa_composite_mem_region *reg;
 	u32 offset, len, fraglen, fragoff;
 	struct ffa_mem_region *buf;
-	int ret = 0;
 	u64 handle;
 
 	handle = PACK_HANDLE(handle_lo, handle_hi);
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 
 	buf = hyp_buffers.tx;
 	*buf = (struct ffa_mem_region) {
@@ -594,7 +573,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	ffa_retrieve_req(res, sizeof(*buf));
 	buf = hyp_buffers.rx;
 	if (res->a0 != FFA_MEM_RETRIEVE_RESP)
-		goto out_unlock;
+		return;
 
 	len = res->a1;
 	fraglen = res->a2;
@@ -609,15 +588,15 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 */
 	if (WARN_ON(offset > len ||
 		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
-		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_ABORTED);
+		return;
 	}
 
 	if (len > ffa_desc_buf.len) {
-		ret = FFA_RET_NO_MEMORY;
 		ffa_rx_release(res);
-		goto out_unlock;
+		ffa_to_smccc_res(res, FFA_RET_NO_MEMORY);
+		return;
 	}
 
 	buf = ffa_desc_buf.buf;
@@ -627,8 +606,8 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	for (fragoff = fraglen; fragoff < len; fragoff += fraglen) {
 		ffa_mem_frag_rx(res, handle_lo, handle_hi, fragoff);
 		if (res->a0 != FFA_MEM_FRAG_TX) {
-			ret = FFA_RET_INVALID_PARAMETERS;
-			goto out_unlock;
+			ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+			return;
 		}
 
 		fraglen = res->a3;
@@ -638,17 +617,12 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 
 	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);
 	if (res->a0 != FFA_SUCCESS)
-		goto out_unlock;
+		return;
 
 	reg = (void *)buf + offset;
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
-
-	if (ret)
-		ffa_to_smccc_res(res, ret);
 }
 
 /*
@@ -774,13 +748,13 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 		return;
 	}
 
-	hyp_spin_lock(&version_lock);
+	guard(hyp_spinlock)(&version_lock);
 	if (has_version_negotiated) {
 		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
 			res->a0 = FFA_RET_NOT_SUPPORTED;
 		else
 			res->a0 = hyp_ffa_version;
-		goto unlock;
+		return;
 	}
 
 	/*
@@ -793,7 +767,7 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 			.a1 = ffa_req_version,
 		}, res);
 		if ((s32)res->a0 == FFA_RET_NOT_SUPPORTED)
-			goto unlock;
+			return;
 
 		hyp_ffa_version = ffa_req_version;
 	}
@@ -804,8 +778,6 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 		smp_store_release(&has_version_negotiated, true);
 		res->a0 = hyp_ffa_version;
 	}
-unlock:
-	hyp_spin_unlock(&version_lock);
 }
 
 static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
@@ -818,10 +790,10 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 	if (!host_buffers.rx) {
 		ffa_to_smccc_res(res, FFA_RET_BUSY);
-		goto out_unlock;
+		return;
 	}
 
 	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
@@ -834,16 +806,16 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	}, res);
 
 	if (res->a0 != FFA_SUCCESS)
-		goto out_unlock;
+		return;
 
 	count = res->a2;
 	if (!count)
-		goto out_unlock;
+		return;
 
 	if (hyp_ffa_version > FFA_VERSION_1_0) {
 		/* Get the number of partitions deployed in the system */
 		if (flags & 0x1)
-			goto out_unlock;
+			return;
 
 		partition_sz  = res->a3;
 	} else {
@@ -854,12 +826,10 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	copy_sz = partition_sz * count;
 	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
-		goto out_unlock;
+		return;
 	}
 
 	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
 }
 
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..56c3eb4a2251 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -35,13 +35,8 @@ static DEFINE_PER_CPU(struct hyp_fixmap_slot, fixmap_slots);
 static int __pkvm_create_mappings(unsigned long start, unsigned long size,
 				  unsigned long phys, enum kvm_pgtable_prot prot)
 {
-	int err;
-
-	hyp_spin_lock(&pkvm_pgd_lock);
-	err = kvm_pgtable_hyp_map(&pkvm_pgtable, start, size, phys, prot);
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return err;
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	return kvm_pgtable_hyp_map(&pkvm_pgtable, start, size, phys, prot);
 }
 
 static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
@@ -80,10 +75,9 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	unsigned long addr;
 	int ret;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 	addr = __io_map_base;
 	ret = __pkvm_alloc_private_va_range(addr, size);
-	hyp_spin_unlock(&pkvm_pgd_lock);
 
 	*haddr = addr;
 
@@ -137,13 +131,8 @@ int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot
 
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 {
-	int ret;
-
-	hyp_spin_lock(&pkvm_pgd_lock);
-	ret = pkvm_create_mappings_locked(from, to, prot);
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return ret;
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	return pkvm_create_mappings_locked(from, to, prot);
 }
 
 int hyp_back_vmemmap(phys_addr_t back)
@@ -340,22 +329,17 @@ static int create_fixblock(void)
 	if (i >= hyp_memblock_nr)
 		return -EINVAL;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 	addr = ALIGN(__io_map_base, PMD_SIZE);
 	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, PMD_SIZE, phys, PAGE_HYP);
 	if (ret)
-		goto unlock;
+		return ret;
 
-	ret = kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
-
-unlock:
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return ret;
+	return kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
 #else
 	return 0;
 #endif
@@ -437,7 +421,7 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 	size_t size;
 	int ret;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 
 	prev_base = __io_map_base;
 	/*
@@ -463,7 +447,6 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		if (ret)
 			__io_map_base = prev_base;
 	}
-	hyp_spin_unlock(&pkvm_pgd_lock);
 
 	*haddr = addr + size;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index a1eb27a1a747..f43d8ad507e9 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -167,18 +167,16 @@ void hyp_put_page(struct hyp_pool *pool, void *addr)
 {
 	struct hyp_page *p = hyp_virt_to_page(addr);
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 	__hyp_put_page(pool, p);
-	hyp_spin_unlock(&pool->lock);
 }
 
 void hyp_get_page(struct hyp_pool *pool, void *addr)
 {
 	struct hyp_page *p = hyp_virt_to_page(addr);
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 	hyp_page_ref_inc(p);
-	hyp_spin_unlock(&pool->lock);
 }
 
 void hyp_split_page(struct hyp_page *p)
@@ -200,22 +198,19 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 	struct hyp_page *p;
 	u8 i = order;
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 
 	/* Look for a high-enough-order page */
 	while (i <= pool->max_order && list_empty(&pool->free_area[i]))
 		i++;
-	if (i > pool->max_order) {
-		hyp_spin_unlock(&pool->lock);
+	if (i > pool->max_order)
 		return NULL;
-	}
 
 	/* Extract it from the tree at the right order */
 	p = node_to_page(pool->free_area[i].next);
 	p = __hyp_extract_page(pool, p, order);
 
 	hyp_set_page_refcounted(p);
-	hyp_spin_unlock(&pool->lock);
 
 	return hyp_page_to_virt(p);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index eb1c10120f9f..7d843afd8c0a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -258,32 +258,27 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 	if (__this_cpu_read(loaded_hyp_vcpu))
 		return NULL;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying)
-		goto unlock;
+		return NULL;
 
 	if (hyp_vm->kvm.created_vcpus <= vcpu_idx)
-		goto unlock;
+		return NULL;
 
 	/* Pairs with smp_store_release() in register_hyp_vcpu(). */
 	hyp_vcpu = smp_load_acquire(&hyp_vm->vcpus[vcpu_idx]);
 	if (!hyp_vcpu)
-		goto unlock;
+		return NULL;
 
 	/* Ensure vcpu isn't loaded on more than one cpu simultaneously. */
-	if (unlikely(hyp_vcpu->loaded_hyp_vcpu)) {
-		hyp_vcpu = NULL;
-		goto unlock;
-	}
+	if (unlikely(hyp_vcpu->loaded_hyp_vcpu))
+		return NULL;
 
 	hyp_vcpu->loaded_hyp_vcpu = this_cpu_ptr(&loaded_hyp_vcpu);
 	hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
-unlock:
-	hyp_spin_unlock(&vm_table_lock);
 
-	if (hyp_vcpu)
-		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
 	return hyp_vcpu;
 }
 
@@ -291,11 +286,10 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vcpu->loaded_hyp_vcpu = NULL;
 	__this_cpu_write(loaded_hyp_vcpu, NULL);
 	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
@@ -308,20 +302,18 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (hyp_vm)
 		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 
 	return hyp_vm;
 }
 
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
 {
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle)
@@ -620,13 +612,8 @@ static int __insert_vm_table_entry(pkvm_handle_t handle,
 static int insert_vm_table_entry(pkvm_handle_t handle,
 				 struct pkvm_hyp_vm *hyp_vm)
 {
-	int ret;
-
-	hyp_spin_lock(&vm_table_lock);
-	ret = __insert_vm_table_entry(handle, hyp_vm);
-	hyp_spin_unlock(&vm_table_lock);
-
-	return ret;
+	guard(hyp_spinlock)(&vm_table_lock);
+	return __insert_vm_table_entry(handle, hyp_vm);
 }
 
 /*
@@ -701,9 +688,8 @@ int __pkvm_reserve_vm(void)
 {
 	int ret;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	ret = allocate_vm_table_entry();
-	hyp_spin_unlock(&vm_table_lock);
 
 	if (ret < 0)
 		return ret;
@@ -722,10 +708,9 @@ void __pkvm_unreserve_vm(pkvm_handle_t handle)
 	if (unlikely(!vm_table))
 		return;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	if (likely(idx < KVM_MAX_PVMS && vm_table[idx] == RESERVED_ENTRY))
 		remove_vm_table_entry(handle);
-	hyp_spin_unlock(&vm_table_lock);
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
@@ -785,9 +770,8 @@ struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
 
 void teardown_selftest_vm(void)
 {
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	remove_vm_table_entry(selftest_vm.kvm.arch.pkvm.handle);
-	hyp_spin_unlock(&vm_table_lock);
 }
 #endif /* CONFIG_NVHE_EL2_DEBUG */
 
@@ -973,20 +957,15 @@ static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
 int __pkvm_start_teardown_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
-	int ret = 0;
 
-	hyp_spin_lock(&vm_table_lock);
+	guard(hyp_spinlock)(&vm_table_lock);
 	hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
-	if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying) {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	if (!hyp_vm || hyp_vm->kvm.arch.pkvm.is_dying)
+		return -EINVAL;
 
 	hyp_vm->kvm.arch.pkvm.is_dying = true;
-unlock:
-	hyp_spin_unlock(&vm_table_lock);
 
-	return ret;
+	return 0;
 }
 
 int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
@@ -996,22 +975,19 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	struct kvm *host_kvm;
 	unsigned int idx;
 	size_t vm_size;
-	int err;
 
-	hyp_spin_lock(&vm_table_lock);
-	hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
-	if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying) {
-		err = -EINVAL;
-		goto err_unlock;
+	scoped_guard(hyp_spinlock, &vm_table_lock) {
+		hyp_vm = get_pkvm_unref_hyp_vm_locked(handle);
+		if (!hyp_vm || !hyp_vm->kvm.arch.pkvm.is_dying)
+			return -EINVAL;
+
+		host_kvm = hyp_vm->host_kvm;
+
+		/* Ensure the VMID is clean before it can be reallocated */
+		__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
+		remove_vm_table_entry(handle);
 	}
 
-	host_kvm = hyp_vm->host_kvm;
-
-	/* Ensure the VMID is clean before it can be reallocated */
-	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
-	remove_vm_table_entry(handle);
-	hyp_spin_unlock(&vm_table_lock);
-
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
 	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
@@ -1042,10 +1018,6 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	teardown_donated_memory(mc, hyp_vm, vm_size);
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return 0;
-
-err_unlock:
-	hyp_spin_unlock(&vm_table_lock);
-	return err;
 }
 
 static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
-- 
2.54.0.1136.gdb2ca164c4-goog


