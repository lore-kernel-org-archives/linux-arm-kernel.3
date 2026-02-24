Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB9F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeJr9DzN1rZgN/lyi6nCB8+W3Dtqtue5A1AT5DcrVV0=; b=zbsfF69C+MDPPtSNRjgdAa8DXL
	gwKl+bA67tPzsxd+mn/SMRuh+IGEIYDxVwzmXHBoxNpcjcuCLVTfMecKIXkejdTFs228iqzzgUBvu
	wCFTA+Sd21m5mdbxO1GO3Z2bNCyJKtwkkU1o2bbuOYKtW8Oyp230lK5dNk1Ln7KYdOv66fqwBBjK3
	7QFs0RKAtg48yETwfivB/H4kg+oz4UBLMaPOxxdhADG/PKohhvvTk0wKrNNm/B8GxAj9Gj927pfvb
	yah7+vIq8Wilpje6iuIm79PsfDALamCetOtMTMCpTjTUKi4Z6zjFlGZYE8xyC1TlWPoDDKUrfESB/
	1+eGIfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfO-00000002WVR-1jh9;
	Tue, 24 Feb 2026 17:57:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfJ-00000002WSg-1xzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:57:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A71CE339;
	Tue, 24 Feb 2026 09:57:38 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1114B3F59E;
	Tue, 24 Feb 2026 09:57:39 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 02/41] KVM: arm64: Preserve host MPAM configuration when changing traps
Date: Tue, 24 Feb 2026 17:56:41 +0000
Message-ID: <20260224175720.2663924-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095745_625359_897D5574 
X-CRM114-Status: GOOD (  13.46  )
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

When kvm enables or disables MPAM traps to EL2 it clears all other bits in
MPAM2_EL2.  Notably, it clears the partition ids (PARTIDs) and performance
monitoring groups (PMGs). Avoid changing these bits in anticipation of
adding support for MPAM in the kernel. Otherwise, on a VHE system with the
host running at EL2 where MPAM2_EL2 and MPAM1_EL1 access the same register,
any attempt to use MPAM to monitor or partition resources for kernel space
would be foiled by running a KVM guest. Additionally, MPAM2_EL2.EnMPAMSM is
always set to 0 which causes MPAMSM_EL1 to always trap. Keep EnMPAMSM set
to 1 when not in a guest so that the kernel can use MPAMSM_EL1.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 2597e8bda867..0b50ddd530f3 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -267,7 +267,8 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 
 static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
 {
-	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
+	u64 clr = MPAM2_EL2_EnMPAMSM;
+	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
 
 	if (!system_supports_mpam())
 		return;
@@ -277,18 +278,21 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
 		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
 	} else {
 		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
-		r |= MPAM2_EL2_TIDR;
+		set |= MPAM2_EL2_TIDR;
 	}
 
-	write_sysreg_s(r, SYS_MPAM2_EL2);
+	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
 }
 
 static inline void __deactivate_traps_mpam(void)
 {
+	u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
+	u64 set = MPAM2_EL2_EnMPAMSM;
+
 	if (!system_supports_mpam())
 		return;
 
-	write_sysreg_s(0, SYS_MPAM2_EL2);
+	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
 
 	if (system_supports_mpam_hcr())
 		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);
-- 
2.43.0


