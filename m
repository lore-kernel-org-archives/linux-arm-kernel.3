Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F579C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fVjmtG9t5PH8jaTLa3GFDGVuY97eQdhrSJneEQuI78=; b=OIHE5RV7bD3vZqmvuYq8hwLe6L
	xA8Zv3UJ6Kew5th3QlK1Ov2P9OPv/bJ94Ebm2inXorjF6pCBWO8DE3tEjDGnBaAt2zHJRZTUFjLK/
	OMpS15CWHDNFdA89g7vPZ3SqSGWPTgV0dzA91tYe1LvqTVv1Q7rTiSXM3+qaG3JgatvRhhb/9+x+M
	aD9mdynj9zIBn5HMX2PEn7vYGc1FJ41eSL4u7UeCzgAAxtau6z4VK82eiL8hFY4VGUflWKaSjbdyD
	2Natam0sRTccZm5eygtKCRz5T6QII0X81dZqGgDlv3+TONpMGDw0TCvFpYiQ+bXhsbB7NZp0lq6hQ
	arP9SVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58U-0000000HTWU-4BPd;
	Mon, 28 Sep 2026 06:46:51 +0000
Received: from out-102.mta0.migadu.com ([2001:41d0:1004:224b::66] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58R-0000000HTUa-3DNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:46:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ytdKApU5ydc5tgMMhT0OgPOrlWOEu72eXq+ptWF2rq8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790578005; v=1; x=1791182805;
 b=IigTPIOn6hYFsxJMrgRBRJhD6ZJuR8vcHF/t/WjEo9pL5WSjE97g15HU0N66rX8lg+lIKT6c
 EJzBuqGnCh7dwfFvzyQ3ZHOKf5YK7P3KM7vIVYpaHoCq0MM6s3SkSWC5G1K/Dl3xXWhfeTUw0Ut
 EriVZfRYslyyUSd2Rg9FabZM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 44dc0649da117e22;
	Mon, 28 Sep 2026 06:46:45 +0000
X-Mizu-Trace-ID: 44dc0649da117e22
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS from vEL1
Date: Mon, 28 Sep 2026 07:46:40 +0100
Message-Id: <20260928064643.3265087-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928064643.3265087-1-fuad.tabba@linux.dev>
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_234647_944024_9EB511C4 
X-CRM114-Status: GOOD (  10.82  )
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

KVM hides TLBI OS from a guest whose ID registers don't advertise it by
trapping the instructions: through the fine-grained traps on a CPU with
FGT, and through HCR_EL2.TTLBOS on one with FEAT_EVT2. With FGT,
triage_sysreg_trap() makes a trapped TLBI OS UNDEFINED. Without it, the
instruction reaches handle_tlbi_el1(), which assumes an EL1 TLBI only
traps from a guest at vEL2 and WARNs before checking whether the guest
supports it. The guest still gets its UNDEF after the WARN. A VMM can
trigger the WARN by hiding TLBI OS and having the guest execute one.

Check support before the WARN.

Fixes: 0cb8aae226768 ("KVM: arm64: nv: Add handling of outer-shareable TLBI operations")
Cc: stable@vger.kernel.org
Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>
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


