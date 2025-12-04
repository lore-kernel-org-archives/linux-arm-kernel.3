Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B16D1F9A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zz7gxxhjTFjOLjIw0Pw1675QnjNIaEfyx60fMUeA+8=; b=h6wTfaS7v/ukeq+qmRFUeGIvCN
	M192+qpJn56DTKITCc7UJu/d7A+jRkehUH5VfZMcTlrZ00KTCc3hJAB2dzc7lZ7JqovF1YHrSslFN
	+XuOM293v1Fcj59D/z54vMFzin2QNMG9kkOnZ9Z+pzY81SAQuRKLjwi+P9cvVF1zLU0PX0TU3Bn7X
	K12+a5z5ICttxoZEXYnuvwAD86AC5tG0uGK0Ubn/9pd1e/Q+q9cCXhD/4d5s9Wg9DwkvUJB5YQQhP
	/nR0qK5btsyiSaEh1F/bFmBhZ8jB/yUtiEooJ2h0y5R0FJQiRKg8Lo66R318C3bR/HA+1P10j9qsW
	IpgbU3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x5-00000007mv7-3Jpd;
	Thu, 04 Dec 2025 09:48:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5wz-00000007moy-3bBf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C99244468;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B776C116C6;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=4XVkua0rEg/vz2zwquEpsKlRnQFatRDvaCblm+Lr3ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nYbUB4OHlg/w1pXC/ufdNxR2DhvnYpiuJagy6bN68/+EeySWZ41OrQpqQLm8cKSb7
	 p608CI9t+4j3uS+lS5VzSBhrFCBRizQsTBWURm5h9AJMJVwOKaAE6MRT/DuY6k2utF
	 HBu99WfUfDXnyYFV0MsqFdg7/DhsXxA/7iRimsL1SLFBqxga/53DOxOtqG9Tz83l1C
	 sDDeO8kXIonGXDyoYYDFhDlEQpNSXpbNu/GEGy7HdNNwaMHnGK5fP3mCAtR4X0lvpw
	 8DiGyBsNG5cIcuNHXL2rruOFOALzcnd8pCj7FClLuIu0DU1IQj19jBZ0obB1EEPKIC
	 Lh3huyyxenKsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5wx-0000000AP90-0I6P;
	Thu, 04 Dec 2025 09:48:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 4/9] KVM: arm64: Handle FEAT_IDST for sysregs without specific handlers
Date: Thu,  4 Dec 2025 09:48:01 +0000
Message-ID: <20251204094806.3846619-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014838_006166_F70FF211 
X-CRM114-Status: GOOD (  13.14  )
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

Add a bit of infrastrtcture to triage_sysreg_trap() to handle the
case of registers falling into the Feature ID space that do not
have a local handler.

For these, we can directly apply the FEAT_IDST semantics and inject
an EC=0x18 exception. Otherwise, an UNDEF will do.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 616eb6ad68701..fac2707221b47 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2588,6 +2588,26 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 
 		params = esr_sys64_to_params(esr);
 
+		/*
+		 * This implements the pseudocode UnimplementedIDRegister()
+		 * helper for the purpose of fealing with FEAT_IDST.
+		 *
+		 * The Feature ID space is defined as the System register
+		 * space in AArch64 with op0==3, op1=={0, 1, 3}, CRn==0,
+		 * CRm=={0-7}, op2=={0-7}.
+		 */
+		if (params.Op0 == 3 &&
+		    !(params.Op1 & 0b100) && params.Op1 != 2 &&
+		    params.CRn == 0 &&
+		    !(params.CRm & 0b1000)) {
+			if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
+				kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+			else
+				kvm_inject_undefined(vcpu);
+
+			return true;
+		}
+
 		/*
 		 * Check for the IMPDEF range, as per DDI0487 J.a,
 		 * D18.3.2 Reserved encodings for IMPLEMENTATION
-- 
2.47.3


