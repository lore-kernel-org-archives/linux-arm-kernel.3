Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6612ACA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 05:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/zpVbhwsUpNbrOoO6Rbtd5iCkQr04e+OVUHoKIuXg0=; b=q8eFe3YwT+jPXX0pdVSmZl4flb
	/t2ijwEwwJ2YaJR+rQNPzUZ8J5Uo0vxgKTncMwFfbsVpztzShiw2ThDRpMa3GnoprMUmxMmzJyr4Y
	o3IyjZt4uNMrM+G7jes/O91bUPUZEq/HPxkxd06+Z+oKsAQsuU+MoFT9unz8Bzjpb1AiQi+49d5SW
	dJn2hv7oaL5HbDe+tU0TLi6dneHAX3NVzpUskLIomWWIurObERXQc0XmgOXqqkXTifMBFIjea4aR2
	i2+NQNqDS6ew2T89ZM67djv5vmHITi24ha2wyW+V2PjbsF6lk6f+TKcClYDukNutBHckxXFAIgfTw
	0a51g/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDarp-0000000FgL8-2Ujp;
	Mon, 05 Oct 2026 05:04:01 +0000
Received: from out-89.mta0.migadu.com ([2001:41d0:1004:224b::59] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDarm-0000000FgKD-38jJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 05:04:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=X2NngjtUK3UIGZuKRsaGbM1Nn8I+pzP8pxoF8AGn/sk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791176636; v=1; x=1791781436;
 b=YgGTHIl4h42GtXWpwWVzwnO0+3KLoSTk8HvVmhlxI5ku1kPGwKuqwYpAQBx6pwQjUujdZInA
 5gNcSXvsPDlig0ReaaO2gqyvqBj4JYDUD2/yw5t5iTSHIifLINA5gElwjrkblH3whvw+gWjYDRu
 tGa2RVG1zdsN8Mj8TsiqdnNI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2334147f9724cdcb;
	Mon, 05 Oct 2026 05:03:56 +0000
X-Mizu-Trace-ID: 2334147f9724cdcb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com,
	mark.rutland@arm.com
Subject: [PATCH] KVM: arm64: Pend host SErrors for protected vCPUs through HCR_EL2.VSE
Date: Mon,  5 Oct 2026 06:03:52 +0100
Message-Id: <20261005050352.836980-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_220358_927556_0E42F9AC 
X-CRM114-Status: GOOD (  11.67  )
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

kvm_inject_serror_esr() reads PSTATE.A and SCTLR2_EL1.NMEA to decide
whether to emulate the SError's exception entry or pend it through
HCR_EL2.VSE. For a protected vCPU, the host's copy of those is stale,
and when it reads as unmasked KVM emulates the entry on that copy. EL2
never delivers it as an SError: its entry handler turns the pending
exception into an external abort on the trapped access, and an MMIO
completion still pending trips WARN_ON(INCREMENT_PC).

Always pend through HCR_EL2.VSE for a protected vCPU. EL2 forwards it,
and the guest's own masking decides when the SError is taken.

Fixes: 872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for protected guests")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20261001142109.794CA1F000FF@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Applies on kvmarm/next. A follow-up to "KVM: arm64: Confine protected VM
vCPU state to EL2" [1], from Sashiko's review of its v4 patch 12.

[1] https://lore.kernel.org/all/20261001135711.1640520-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/inject_fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..49a342b078365 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	 *
 	 * As we're emulating the SError injection we need to explicitly populate
 	 * ESR_ELx.EC because hardware will not do it on our behalf.
+	 *
+	 * A protected vCPU's PSTATE and SCTLR2_EL1 live at EL2, so pend through
+	 * HCR_EL2.VSE and let the guest's own masking apply.
 	 */
-	if (!serror_is_masked(vcpu)) {
+	if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
 		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));

base-commit: fa22cd9947fc245d71bc40482f7f78eb0d5a4af0
-- 
2.39.5


