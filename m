Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D2C98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q8bM/3nZq9rZuSSKa62ahb9ZKA+I26N7N7v3dpr2bo=; b=yUDVzuzZT4ElTZm3hHsZ5bb8ee
	s3iBRDQE8Mqa3ueGZOacKpnHGK6fK6m+J5LOBTOTXUMdTLEEVQiMMb2JR6PYgHrzey8E3DSW3FmlO
	+rWx0cokp4Zqjc1xg7GAPtOoKhQihZ2cJ+fxTZ6r0IwixIJdTaUB1FEddZzOx2uA5ZDowzvHNSkJ8
	Hxzxi5ldxk8azk/Pq+Xw5fl63a6Orw4LFxajau4VC7rJX6e4uGAL+G1TUxzgKqD+QmdoECXRW6Wn4
	xWSlrUAPPmXj1sXBWOj/osJ4VRegNdkEcTSQ4idfJXa3Q2A2ecUdxyMd09EUR4y6dD/Py0umd+mHw
	WVOTHHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1sv-0000000Cy5T-13ao;
	Fri, 25 Sep 2026 09:06:25 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1ss-0000000Cy3R-34W1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:06:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8smf6B5tmlcKz4QzEGNgl2hIDEjwNVAhW9TDDQkcLVc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790327180; v=1; x=1790931980;
 b=a2ntrXphIPFOe1yZje+JkJ8k02wPscxfCg5akywqTNCUknE1uA+5jo9J+eviYujweOWJrZVz
 dsuhmy/Lve/Yk3wOravotxdI7IBUSDiS0j23peMXghk5ccAkcobT8B8bcguQZyhp6Qop2ht4W7d
 ivfz2q+cUzrO0tyKCSWtgcZM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dbee69ddbf1bd07b;
	Fri, 25 Sep 2026 09:06:20 +0000
X-Mizu-Trace-ID: dbee69ddbf1bd07b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS from vEL1
Date: Fri, 25 Sep 2026 10:06:16 +0100
Message-Id: <20260925090619.852995-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925090619.852995-1-fuad.tabba@linux.dev>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020622_929962_D450DCC4 
X-CRM114-Status: GOOD (  10.65  )
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

A VMM can trigger the WARN_ON(!vcpu_is_el2()) in handle_tlbi_el1() on a
CPU with FEAT_EVT2 and FEAT_TLBIOS but no FEAT_FGT, by setting
ID_AA64ISAR0_EL1.TLB to NI and having the guest execute TLBI VMALLE1OS.

Without FGT, HCR_EL2.TTLBOS traps the instruction. KVM records no FGT
trap information on such a host, so triage_sysreg_trap() doesn't UNDEF
it. The instruction reaches handle_tlbi_el1(), which warns before
checking whether the guest supports it.

Check support before the warning.

Fixes: 0cb8aae226768 ("KVM: arm64: nv: Add handling of outer-shareable TLBI operations")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/sys_regs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d7..0ce29ce678b08 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4257,6 +4257,10 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
 
+	/* Without FGT, HCR_EL2.TTLBOS also traps a hidden TLBI OS from vEL1 */
+	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
+		return undef_access(vcpu, p, r);
+
 	/*
 	 * If we're here, this is because we've trapped on a EL1 TLBI
 	 * instruction that affects the EL1 translation regime while
@@ -4279,9 +4283,6 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 	WARN_ON(!vcpu_is_el2(vcpu));
 
-	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
-		return undef_access(vcpu, p, r);
-
 	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)) {
 		kvm_handle_s1e2_tlbi(vcpu, sys_encoding, p->regval);
 		return true;
-- 
2.39.5


