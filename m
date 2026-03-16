Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD5F53D80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvueIHWrftpZGm9WwSLw4m+mhIgN4K5gi1wLojgWmOA=; b=TEk8Ah65ksVQZW/3hMSm5+MDh2
	RI2hS1fkTjpN8KH6Upu8u4+PBilnX54c2LJAHdd/wtJjOlo982+5NZMGSeNNfsbJ9xZs8EWuuGl0w
	EPv50eHRzCNBniIN2g4N+2HMHVbhRB4T0by/cpuj2ZzKd2qcVeqJv8Ftae2hCy2HGc64HKVOZKo8n
	AAXk4u/+wfiss/ASK2sfn70F1ytw6ArY0VmoRqDNRux8aH8SNCB3eKdPDW3YLAEkDT1Am29u0pixU
	uMN/oigiGLlMQQF0fsdvEYzNd26/MhPffvLsO0O5Dffo90P3ahyMvhqjUifUZJucc7yvzLjvLa+K5
	qevDDGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqt-00000004ZpO-0OFV;
	Mon, 16 Mar 2026 17:35:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqq-00000004Zna-3hlx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FvueIHWrftpZGm9WwSLw4m+mhIgN4K5gi1wLojgWmOA=; b=IHxLHLbhoy1EkRprjgaiLKYU9Z
	WresiZ7gJmvKlYMPzYoF8YjzsWKMWnUIAxtn8Az1wNszP/63GalwH4eRtImIeNJFZdFjxkILvdcTE
	oJDYa2fK/6y95QTRRLbhhnMsMI1MAYU3T5KPVLKtydwpUnxtu1XSqWhpAPgT/LXfY9ev/8HiW0wl8
	voFbN1eW69cUxsPlQVPMNmGwXB0A6Pu4saiHFW9kHlaLGYD3zTM4TJPE1EyGfoZ2o5Cj20T6mcO93
	KIZTVfWIPztYheElm4a24pEYtF61707Dku5BbyPuJ8lKupYZXbHUAtRf2t0JUx2vSaA8o4OTQlJC8
	+qxGYP0g==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqn-00000007Lrm-0WeV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so51398185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682531; x=1774287331; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvueIHWrftpZGm9WwSLw4m+mhIgN4K5gi1wLojgWmOA=;
        b=NcwPIF0SRaRBwJvdmRphzqkixzvTZRb5XFoqrNzBTU43w3ozFnwTM2XKWuBhf39DXJ
         ifpZU5UY3A/5Snj73gCT/xavtZ96eTWbnx/74Z2ZHb23XZuxpP/DPR4Qua323bUo52x4
         L35QsE0qR+PW2pJE2FnV2RSzmmO5JMBcGiHWwBvrd5n3ZCaV+ZAM1xpGF31jrS6tbt5h
         YNyTwsMlEX3cND7Zdms94dNTAiuzjwJGQqAnHjyrsVHYb7b+iTa4ARZfIYPg6wXILGdi
         0T3sbJd3OidjLs2vFvU7VrBOYTcBkil+To0K7EkmEj0YsQbXxYXMSHjbqHzhrhRbiMB6
         SC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682531; x=1774287331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvueIHWrftpZGm9WwSLw4m+mhIgN4K5gi1wLojgWmOA=;
        b=JraC/sh9n8436esB8BISwqXOoMeJ+XqvLleSazEXLukZuUg0+v/IY6+k9SOxcFZ3ON
         4zXHvRiLc4B8miROLYvwXCfJ+SxAwhBGY/v8SshZilnuxkHdJMgzTTKNVoWFt4SfKIdm
         kblGrovznw3E2tmd01C/o/VHXBK01kgo0zL1Vg2SYB3RXY++lP6TN2pFtDQntYVOrlGd
         OZVXusVVhkfQgp5J/8CnisX4cr6ht27VPE92rGhPU/tOXAVmISsvoFrnlBs/YtibiopN
         nwmdR2jEYAvjqZ+C2WSapvPhUzzR7EHNgtreRDwr02YtdVqyBz3oym1YDke9tDYtrDrF
         l6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnNH8pP6bRz38D0+4YnCnYXWl1UQ0290Y1pP6M2zO8GToJO0UdODa29uBuXt0d88Pddv52jr2iOR7HEQQKpIdK@lists.infradead.org
X-Gm-Message-State: AOJu0YyUy/au4assOuHH7ayhIUKNrX9RQh8+1ViO1P/1P/PAKyedgjy5
	uph1f8hnP5qMpD/PymTlrBsPUq6CxyRDNZXUFfBSIYKw2ZqpGQBs1B8L1D+QtnOK42mAub38KNh
	z8Q==
X-Received: from wmim11.prod.google.com ([2002:a7b:cb8b:0:b0:483:5126:2240])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a4a:b0:477:76bf:e1fb
 with SMTP id 5b1f17b1804b1-485566f7bd0mr229045355e9.16.1773682531263; Mon, 16
 Mar 2026 10:35:31 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:24 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-3-456875a2c6db@google.com>
Subject: [PATCH 03/10] KVM: arm64: Use guard(hyp_spinlock) in ffa.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173533_323421_F0C49AC2 
X-CRM114-Status: GOOD (  13.80  )
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

Migrate manual hyp_spin_lock() and hyp_spin_unlock() calls managing
host_buffers.lock and version_lock to use the guard(hyp_spinlock)
macro.

This eliminates manual unlock calls on return paths and simplifies
error handling by replacing goto labels with direct returns.

Change-Id: I52e31c0bed3d2772c800a535af8abdabd81a178b
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 86 +++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 94161ea1cd60..0c772501c3ba 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -239,6 +239,8 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	void *rx_virt, *tx_virt;
 
+	guard(hyp_spinlock)(&host_buffers.lock);
+
 	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
@@ -249,10 +251,9 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 		goto out;
 	}
 
-	hyp_spin_lock(&host_buffers.lock);
 	if (host_buffers.tx) {
 		ret = FFA_RET_DENIED;
-		goto out_unlock;
+		goto out;
 	}
 
 	/*
@@ -261,7 +262,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	 */
 	ret = ffa_map_hyp_buffers(npages);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx));
 	if (ret) {
@@ -292,8 +293,6 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	host_buffers.tx = tx_virt;
 	host_buffers.rx = rx_virt;
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
 out:
 	ffa_to_smccc_res(res, ret);
 	return;
@@ -306,7 +305,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	__pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx));
 err_unmap:
 	ffa_unmap_hyp_buffers();
-	goto out_unlock;
+	goto out;
 }
 
 static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
@@ -315,15 +314,16 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, id, ctxt, 1);
 	int ret = 0;
 
+	guard(hyp_spinlock)(&host_buffers.lock);
+
 	if (id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
 	}
 
-	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.tx) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	hyp_unpin_shared_mem(host_buffers.tx, host_buffers.tx + 1);
@@ -336,8 +336,6 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 
 	ffa_unmap_hyp_buffers();
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
 out:
 	ffa_to_smccc_res(res, ret);
 }
@@ -421,15 +419,16 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	int ret = FFA_RET_INVALID_PARAMETERS;
 	u32 nr_ranges;
 
+	guard(hyp_spinlock)(&host_buffers.lock);
+
 	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
 		goto out;
 
 	if (fraglen % sizeof(*buf))
 		goto out;
 
-	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.tx)
-		goto out_unlock;
+		goto out;
 
 	buf = hyp_buffers.tx;
 	memcpy(buf, host_buffers.tx, fraglen);
@@ -444,15 +443,13 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 		 */
 		ffa_mem_reclaim(res, handle_lo, handle_hi, 0);
 		WARN_ON(res->a0 != FFA_SUCCESS);
-		goto out_unlock;
+		goto out;
 	}
 
 	ffa_mem_frag_tx(res, handle_lo, handle_hi, fraglen, endpoint_id);
 	if (res->a0 != FFA_SUCCESS && res->a0 != FFA_MEM_FRAG_RX)
 		WARN_ON(ffa_host_unshare_ranges(buf, nr_ranges));
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
 out:
 	if (ret)
 		ffa_to_smccc_res(res, ret);
@@ -482,6 +479,8 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
 
+	guard(hyp_spinlock)(&host_buffers.lock);
+
 	if (addr_mbz || npages_mbz || fraglen > len ||
 	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -494,15 +493,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		goto out;
 	}
 
-	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.tx) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	if (len > ffa_desc_buf.len) {
 		ret = FFA_RET_NO_MEMORY;
-		goto out_unlock;
+		goto out;
 	}
 
 	buf = hyp_buffers.tx;
@@ -513,30 +511,30 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	offset = ep_mem_access->composite_off;
 	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	if (fraglen < checked_offset) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	reg = (void *)buf + offset;
 	nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
 	if (nr_ranges % sizeof(reg->constituents[0])) {
 		ret = FFA_RET_INVALID_PARAMETERS;
-		goto out_unlock;
+		goto out;
 	}
 
 	nr_ranges /= sizeof(reg->constituents[0]);
 	ret = ffa_host_share_ranges(reg->constituents, nr_ranges);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ffa_mem_xfer(res, func_id, len, fraglen);
 	if (fraglen != len) {
@@ -549,8 +547,6 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		goto err_unshare;
 	}
 
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
 out:
 	if (ret)
 		ffa_to_smccc_res(res, ret);
@@ -558,7 +554,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 
 err_unshare:
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents, nr_ranges));
-	goto out_unlock;
+	goto out;
 }
 
 #define do_ffa_mem_xfer(fid, res, ctxt)				\
@@ -583,7 +579,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 
 	handle = PACK_HANDLE(handle_lo, handle_hi);
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 
 	buf = hyp_buffers.tx;
 	*buf = (struct ffa_mem_region) {
@@ -594,7 +590,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	ffa_retrieve_req(res, sizeof(*buf));
 	buf = hyp_buffers.rx;
 	if (res->a0 != FFA_MEM_RETRIEVE_RESP)
-		goto out_unlock;
+		goto out;
 
 	len = res->a1;
 	fraglen = res->a2;
@@ -611,13 +607,13 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
-		goto out_unlock;
+		goto out;
 	}
 
 	if (len > ffa_desc_buf.len) {
 		ret = FFA_RET_NO_MEMORY;
 		ffa_rx_release(res);
-		goto out_unlock;
+		goto out;
 	}
 
 	buf = ffa_desc_buf.buf;
@@ -628,7 +624,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		ffa_mem_frag_rx(res, handle_lo, handle_hi, fragoff);
 		if (res->a0 != FFA_MEM_FRAG_TX) {
 			ret = FFA_RET_INVALID_PARAMETERS;
-			goto out_unlock;
+			goto out;
 		}
 
 		fraglen = res->a3;
@@ -638,15 +634,13 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 
 	ffa_mem_reclaim(res, handle_lo, handle_hi, flags);
 	if (res->a0 != FFA_SUCCESS)
-		goto out_unlock;
+		goto out;
 
 	reg = (void *)buf + offset;
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-out_unlock:
-	hyp_spin_unlock(&host_buffers.lock);
-
+out:
 	if (ret)
 		ffa_to_smccc_res(res, ret);
 }
@@ -774,13 +768,13 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
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
@@ -793,7 +787,7 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 			.a1 = ffa_req_version,
 		}, res);
 		if ((s32)res->a0 == FFA_RET_NOT_SUPPORTED)
-			goto unlock;
+			return;
 
 		hyp_ffa_version = ffa_req_version;
 	}
@@ -804,8 +798,6 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 		smp_store_release(&has_version_negotiated, true);
 		res->a0 = hyp_ffa_version;
 	}
-unlock:
-	hyp_spin_unlock(&version_lock);
 }
 
 static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
@@ -818,10 +810,10 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
 
-	hyp_spin_lock(&host_buffers.lock);
+	guard(hyp_spinlock)(&host_buffers.lock);
 	if (!host_buffers.rx) {
 		ffa_to_smccc_res(res, FFA_RET_BUSY);
-		goto out_unlock;
+		return;
 	}
 
 	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
@@ -834,16 +826,16 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
@@ -854,12 +846,10 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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

-- 
2.53.0.851.ga537e3e6e9-goog


