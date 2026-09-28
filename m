Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E61ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI2gtcB0i4cs886K7l/Zq/qGzFBeQBBbpf7DCYKhBPA=; b=1oZOfasSz7aTv21oP1Iu5HiV0V
	/nIjMfWW2fDvH//M48SItQ0tfQw5pBw13X8lthZRKVXdQD1qlc+Eo7XtpxBijF5Qfyevm82ef3Ur+
	fbkmv9hq2Rnb7SWWLbI706HpLJvUDJw/kCBDx2a18kjhxhfWmFbxBOcSQZGvoWkVTLAv/7UkXMVE4
	apSi+oM9RMlorobKCvmyIgU2oDJwNVHd9I9kHPIwCtRyAJs6RCdNqj3Gad1kUoZWTP/x4AyNmJZpc
	B00byzLGond4Ooqgux2eG8OeL5UJTv/vLLqUUQvSbqLFPPUeNV+cHRuxQovQnEj+s84f8TN8eg+G3
	xhTrMAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEm-00000000tVq-0bjz;
	Mon, 28 Sep 2026 15:25:52 +0000
Received: from out-65.mta1.migadu.com ([2001:41d0:203:375::41] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEc-00000000tRH-1Kq0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:25:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=P0RVNuENs3vpENd0HRdOYdMiYWEyBhUlAVznVoI9ctM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609140; v=1; x=1791213940;
 b=ZRQLRpgShNNXptQTnoo4geZPAESCFlaXdtTyBZGmZvRv7slOY508pIK0WglY3qge1J5D0ZNf
 7Pt18O2rA+qfSwCEV4isbB1s8GwLQ3Imr04gcSlmwwe3UEXWU8B+CQrjk8oJXFTI9Q9mqRa+zDt
 j+wE2DdWydpDT9aOfDRagLT4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7f3a0b0fc5a4363a;
	Mon, 28 Sep 2026 15:25:40 +0000
X-Mizu-Trace-ID: 7f3a0b0fc5a4363a
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
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/10] KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W} with an invalid VTCR_EL2
Date: Mon, 28 Sep 2026 16:25:00 +0100
Message-Id: <20260928152507.2116110-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082542_501162_3327A1AD 
X-CRM114-Status: GOOD (  11.12  )
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

When KVM walks an L1 guest's stage-2 tables, a positive return means
the walk faulted with the syndrome in out->esr, and a negative one
means KVM couldn't complete it and the caller has to retry. The
VTCR_EL2.T0SZ and SL0 checks return -EFAULT for what is the guest's
own misconfiguration: an invalid SL0 is a stage-2 level 0 Translation
fault (AArch64_S2InvalidSL()), and so is an out of range T0SZ that the
implementation doesn't clamp (AArch64_S2TxSZFaults()).

An L1 guest that programs either value therefore executes
AT S12E{0,1}{R,W} forever, since the AT is never retired, and on an L2
abort KVM injects the fault and then returns -EFAULT from KVM_RUN. The
T0SZ check also left the syndrome unset, so where a fault was reported
at all, on an L2 abort or in PAR_EL1 after a stage-1 AT, it was an
Address size fault.

Return 1 with a level 0 Translation fault from both checks, as the walk
does for the guest's other stage-2 faults.

Fixes: fd276e71d1e7b ("KVM: arm64: nv: Handle shadow stage 2 page faults")
Fixes: 92c6443222ca4 ("KVM: arm64: Propagate PTW errors up to AT emulation")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/nested.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 98c1f8c193319..a67be19e73250 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -275,13 +275,10 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 
 	stride = wi->pgshift - 3;
 	input_size = get_ia_size(wi);
-	if (input_size > 48 || input_size < 25)
-		return -EFAULT;
-
-	ret = check_base_s2_limits(vcpu, wi, level, input_size, stride);
-	if (ret) {
+	if (input_size > 48 || input_size < 25 ||
+	    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {
 		out->esr = compute_fsc(0, ESR_ELx_FSC_FAULT);
-		return ret;
+		return 1;
 	}
 
 	base_lower_bound = 3 + input_size - ((3 - level) * stride +
-- 
2.39.5


