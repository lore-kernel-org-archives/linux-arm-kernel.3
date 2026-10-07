Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67527CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xIZcoTMGM4ZZ98AaGSzVpL0WLZwwcRYlHl69+CXLZsY=; b=1GAyUbObigGZZBkVZnJl3n3mNR
	CHYm5VVtOyOfeFFQyHJqTH/OxFUSSg8Yq87qfeeRVu0zqhIe0OkithynZf9e/OswQarGzyyeM8B9d
	cPuhjWrPRzPpzy7mEWf4fj8ieeYOK3RWD1LQIfd7JLerZJ7OiKz7KcUgiAmJ2V/bph349Z9OifEOW
	AjGNtJAjE26f1Z54SX3p6rPdZr7PyzPihsACCUEm2OAi3fVO/5xw5Po0eDjs3Os7667Dzk3I/fkzP
	jzpCGotd7dYsohDVG5Pp4KC44n4KSyvpufjjorFyCVw14lottdD3PLbrWiUVwa00AiTTHoxhM9lZ9
	pJzO/PXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMhe-00000001vM8-1nvS;
	Wed, 07 Oct 2026 08:08:42 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMhb-00000001vLV-2w7J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:08:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xUcojllf6XEfIPzebipORABSIXaK1iQh2wjor1f1tws=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791360517; v=1; x=1791965317;
 b=EvtZ4DefdNIgLykCHLkYDu6bDAZ9KkfI08J7Gle3GeTU1W3ckS/f2P5WdIGz4KIiPu0pDzFt
 jDwQAS9SViUC053eXD1h9kbsNbzSDJD8Ja9wtSBecty9tuTafPDFrSQv1Ol3fu2zOQriG9WtgaJ
 RwZDiCK1U9XahP0bvnJEr4xs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6d6ae5aa49d7ea56;
	Wed, 07 Oct 2026 08:08:37 +0000
X-Mizu-Trace-ID: 6d6ae5aa49d7ea56
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3] KVM: arm64: Only emulate an SError's entry for vCPUs with NV
Date: Wed,  7 Oct 2026 09:08:33 +0100
Message-Id: <20261007080833.371899-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_010840_080143_0EFF6C2B 
X-CRM114-Status: GOOD (  15.90  )
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

kvm_inject_serror_esr() emulates an SError's exception entry when the
host's copy of PSTATE says SErrors are unmasked, although only NV needs
this, for a nested context whose guest hypervisor owns the vSError. A
protected vCPU's PSTATE lives at EL2, and the VMM can unmask SErrors in
the host's copy before the first run, so KVM emulates the entry on that
copy and the guest never takes the SError.

Emulate the entry only for a vCPU with NV, which protected VMs don't
support, and otherwise pend the SError through HCR_EL2.VSE, as KVM did
before commit ce66109cec867 ("KVM: arm64: nv: Take "masked" aborts to
EL2 when HCRX_EL2.TMEA is set").

Fixes: 872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for protected guests")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20261001142109.794CA1F000FF@smtp.kernel.org/
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
v3:
 - Gate the emulated entry in kvm_inject_serror_esr() on vcpu_has_nv(),
   instead of masking SErrors in the host copy at first run (Oliver).

v2:
 - Set PSTATE.A and clear SCTLR2_EL1.NMEA in the host copy when the hyp
   vCPU is created, instead of testing vcpu_is_protected() in
   kvm_inject_serror_esr() (Marc).

Applies on kvmarm/next. A follow-up to "KVM: arm64: Confine protected VM
vCPU state to EL2" [1], from Sashiko's review of its v4 patch 12.

v2: https://lore.kernel.org/r/20261006092826.2201763-1-fuad.tabba@linux.dev/
v1: https://lore.kernel.org/r/20261005050352.836980-1-fuad.tabba@linux.dev/
[1] https://lore.kernel.org/all/20261001135711.1640520-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/inject_fault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..96bf926ca520e 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -371,15 +371,15 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	}
 
 	/*
-	 * Emulate the exception entry if SErrors are unmasked. This is useful if
-	 * the vCPU is in a nested context w/ vSErrors enabled then we've already
-	 * delegated he hardware vSError context (i.e. HCR_EL2.VSE, VSESR_EL2,
-	 * VDISR_EL2) to the guest hypervisor.
+	 * With NV, emulate the exception entry if SErrors are unmasked: in a
+	 * nested context with vSErrors enabled, the hardware vSError context
+	 * (i.e. HCR_EL2.VSE, VSESR_EL2, VDISR_EL2) is delegated to the guest
+	 * hypervisor. Otherwise, HCR_EL2.VSE delivers it once it is unmasked.
 	 *
 	 * As we're emulating the SError injection we need to explicitly populate
 	 * ESR_ELx.EC because hardware will not do it on our behalf.
 	 */
-	if (!serror_is_masked(vcpu)) {
+	if (vcpu_has_nv(vcpu) && !serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
 		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
-- 
2.39.5


