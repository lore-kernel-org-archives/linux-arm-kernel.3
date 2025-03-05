Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FC2C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbQEaC+v/OfD76ZIrdkqZKUQeWDyxNh6/G9RBIyydaQ=; b=R7yfOC9uB2Jb31tTrMpuvzQVRs
	R2stf81govELUiECuKyBfRKJAjdmvBqFLAcD7qQUapJzOKxWZNkdVs9196c3fF55Wd4/3N0eAMTcn
	jlxW4oMvRm/iqjlibvEt4jCs8aqLiCT4VXLkoz9JJUdf/30onAe18hdYPfw1aLTNCDHG/hX994p9w
	swVjfkNZcyp32HCoGn6XogCTMT7C84mDMKWvPbz0zII6OQQr7OWzFErFNDNvWKQM7ayREekXWxOSE
	IXE6VAZXx4BbXlwA/+672Zu+18y6OMIBeRMvjw5CciTSwyCK1RN5Dkat4PWvgHBH09qhcAwXGK1kX
	tW9ifP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxJD-00000009Uht-1H0t;
	Wed, 05 Mar 2025 22:33:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKx-00000009DAW-3CaY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BbQEaC+v/OfD76ZIrdkqZKUQeWDyxNh6/G9RBIyydaQ=; b=vDB82vR9yNU0Ck0TJ2KSA00p8b
	s3c/zcp22kSLx3JpWAJNFmC8WiKp6xpIzyPfzd9iIU8/AvkpqoJgMvYwBbeG8RRVz6oD36Y210Pw8
	/C8Q6FRkzPtZhSqgpr0CPK6FmzfFyLIEzTvBQ+1sb3DvAyUtlucStW6tSXNCaTcgUql25P6bETO/C
	2JoPCjn5czcPO6gXeKs81nu6SARvhmchyu94xjphfpb5A9ULwaKCK2qQ6/nHGNyVBXQx2rlqIX/Ni
	H3l4Zu89PwTACmPDLW0X3Jl4W7UkpGi86A1lbr4/H9wGhliFTAqziltSNNpJGtFZC4/RJkX26Sr4v
	o1Wk+ReA==;
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKu-00000006AhL-3GpM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbQEaC+v/OfD76ZIrdkqZKUQeWDyxNh6/G9RBIyydaQ=;
	b=XwifhcXhLMkukfucgBCxxonsngMxyv540XGuYHeAyygl3BZUBAIsx/LpE/7Eo/ztYwF6XY
	l9s+ksdcl37bgs1WorwD2MyjvgcYtymIqTIVlmpuVui6UjjR+YYSu7vBKK2vbe1z+7xo9S
	OE9RTYwi8r+Gj7xxV+z1EE20+60f4VQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 09/14] KVM: arm64: Compute synthetic sysreg ESR for Apple PMUv3 traps
Date: Wed,  5 Mar 2025 12:26:36 -0800
Message-Id: <20250305202641.428114-10-oliver.upton@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202725_107805_26A16A54 
X-CRM114-Status: GOOD (  10.79  )
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

Apple M* CPUs provide an IMPDEF trap for PMUv3 sysregs, where ESR_EL2.EC
is a reserved value (0x3F) and a sysreg-like ISS is reported in
AFSR1_EL2.

Compute a synthetic ESR for these PMUv3 traps, giving the illusion of
something architectural to the rest of KVM.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 22 ++++++++++++++++++++++
 arch/arm64/tools/cpucaps        |  1 +
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 647737d6e8d0..731a0378ed13 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -527,6 +527,25 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
 }
 
+static bool kvm_hyp_handle_impdef(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	u64 iss;
+
+	if (!cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
+		return false;
+
+	/*
+	 * Compute a synthetic ESR for a sysreg trap. Conveniently, AFSR1_EL2
+	 * is populated with a correct ISS for a sysreg trap. These fruity
+	 * parts are 64bit only, so unconditionally set IL.
+	 */
+	iss = ESR_ELx_ISS(read_sysreg_s(SYS_AFSR1_EL2));
+	vcpu->arch.fault.esr_el2 = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SYS64) |
+				   FIELD_PREP(ESR_ELx_ISS_MASK, iss) |
+				   ESR_ELx_IL;
+	return false;
+}
+
 static const exit_handler_fn hyp_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
@@ -538,6 +557,9 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_WATCHPT_LOW]	= kvm_hyp_handle_watchpt_low,
 	[ESR_ELx_EC_ERET]		= kvm_hyp_handle_eret,
 	[ESR_ELx_EC_MOPS]		= kvm_hyp_handle_mops,
+
+	/* Apple shenanigans */
+	[0x3F]				= kvm_hyp_handle_impdef,
 };
 
 static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index ee4316cb3690..772c1b008e43 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -105,6 +105,7 @@ WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
 WORKAROUND_NVIDIA_CARMEL_CNP
+WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
 WORKAROUND_REPEAT_TLBI
-- 
2.39.5


