Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814A5CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snLc08CEx0hQKjXhIYNrNpxtx9u8d6+Ec7HXGIkP+mI=; b=48p+XbCeFidnLt7HP+AZssl+Tj
	17YKlxpYfBFHVpT1b1dATFC6JTTaH8zVfYT2qqgeRsvYi3EShp1aHdYBZlnATQj8ODlkjte9OdQiH
	92sw9hH5H4gEkbQS7MTnea0ObbVDA9zOZxv9jv0MotSE9t9Q/qtsa1y1R8BEFOiTFXCdBTii/+HHv
	3ljQTQrOvQ0l9RWjK370WrX6PuQpff5fqOBrYSQPyLbttc0jErfQIEOKUEBQ7ZTFrjrdD9Li3Dg6l
	qN+abfhz85mcdGZj/G2UYGDf6RAbhb4P81q3onnGXc4X23lqxMzIVfZdZl/t5Klpdu8/+Tme5wlQk
	h0/SJcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLH6-00000005l2f-2P4x;
	Mon, 12 Jan 2026 17:00:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLH3-00000005l19-2Khf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:00:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0312153B;
	Mon, 12 Jan 2026 09:00:05 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5208B3F694;
	Mon, 12 Jan 2026 09:00:07 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v3 04/47] KVM: arm64: Preserve host MPAM configuration when changing traps
Date: Mon, 12 Jan 2026 16:58:31 +0000
Message-ID: <20260112165914.4086692-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090013_639084_BA06159A 
X-CRM114-Status: GOOD (  14.09  )
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index c5d5e5b86eaf..63195275a8b8 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -269,7 +269,8 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 
 static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
 {
-	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
+	u64 clr = MPAM2_EL2_EnMPAMSM;
+	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
 
 	if (!system_supports_mpam())
 		return;
@@ -279,18 +280,21 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
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


