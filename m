Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E472CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwqnK87ih9GsyWytIMaPTnNXX5u5gRrlwpDRD3YEi/0=; b=pFNo0NyV37EXiXTF6kDQSDMYZE
	tvIJg3c3X/kUJsf2RH+P4z5unBfgjbg0nQKfE0QvoJUV6QrgXMz+IGK9YbRNMxvmVmpdTcZIx8XHb
	f1+tadEX20FleM3lLWqWlbY1SDlc9+aVUxIKN+7sFVnJjCOBZdM/AhzLghkd0o5jAM8SGeMiY+okn
	DEKxQNnTJ6TdvrIFBgpTHEh2NTlG5UKw0pPXf7jQZDDp6yq1wQ+X5QipdP4piQMjtUUn1fH1Aznfj
	Wp6/Ju4HZTxBxuHMUHJLW5xXa2+8MB2b+TCEv6ZnltKdwcgwEoa9pYwoJLXOMZjwWil4mqjpwQ4oG
	//eAuZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbr-0000000GZCA-0aD3;
	Wed, 27 Aug 2025 19:15:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjb-0000000G8ou-0SBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2E3144B8B;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F9DC4CEEB;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=xFiCwHRpBjad861jtcnFFkFJ2NjU7rHSKrxDbaqViw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bmxjIxsqqct2ILUHI/DaYjU0Ow28xwE193EI3P8bxq1F48zpXL2Qv6o9+DmhKLaTN
	 AdlQUOyC5I3Sd7sA7amjmtP0Qr4fGADKL7AOIPoLBDMYiFIXGqp2RXEUIBef8iCYNr
	 8Q/HMdYASlP+OtXqHogsKGWYi4PkT1Nt37DPjOmvYYUjm/2axJrVY8XGLSEa+t8Ruk
	 xQdfDvOtZY2CUU0VBgvkTPgSlesr2Bbtuf4MLpnz5mBJcx7CIpExHdUq/RRlC4eE4/
	 RV+ZHfevMtlUEgm0mlGQIO4G8MTAZwfUiuNKpYrl/lcR3UaJNnL0yxk2LjDmDn2BjX
	 1HwAJDXuUSANg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjY-00000000yGc-3lZs;
	Wed, 27 Aug 2025 16:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 12/16] KVM: arm64: Don't switch MMU on translation from non-NV context
Date: Wed, 27 Aug 2025 17:10:34 +0100
Message-Id: <20250827161039.938958-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091051_174700_ED9DAE23 
X-CRM114-Status: GOOD (  13.09  )
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

If calling into the AT code from guest EL1, there is no need
to consider any context switch, as we are guaranteed to be
in the correct context.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 76745e81bd9c8..6e767ae3c495a 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1294,7 +1294,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 {
 	struct mmu_config config;
 	struct kvm_s2_mmu *mmu;
-	bool fail;
+	bool fail, mmu_cs;
 	u64 par;
 
 	par = SYS_PAR_EL1_F;
@@ -1310,8 +1310,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	 * If HCR_EL2.{E2H,TGE} == {1,1}, the MMU context is already
 	 * the right one (as we trapped from vEL2). If not, save the
 	 * full MMU context.
+	 *
+	 * We are also guaranteed to be in the correct context if
+	 * we're not in a nested VM.
 	 */
-	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
+	mmu_cs = (vcpu_has_nv(vcpu) &&
+		  !(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)));
+	if (!mmu_cs)
 		goto skip_mmu_switch;
 
 	/*
@@ -1379,7 +1384,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
-	if (!(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)))
+	if (mmu_cs)
 		__mmu_config_restore(&config);
 
 	return par;
-- 
2.39.2


