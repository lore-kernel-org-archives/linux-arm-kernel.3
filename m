Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6FED10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFhAcay03ch7P92KUy+gVdHfIHe3YtQM91fB6LwAipU=; b=qJH8y2Tq7LoyMDZNIKkra4bASd
	NIRLjx4j0NYoFnIi6cf5LX8SulLxDNMfLoHRA/no8NsnUM06JuXtlK30Gcdm1XS55YIuw1EUN4ioe
	TjtHVvcuOvV67v6xxe7nPzKbLKH9UAx1cnTUjTBRLLqKeawDR6WDoqnczemxARn66nJovTMpQc0R2
	nEuuNuvRvCHJrM/u9WsEPtgAY2hHDI5jIErQxbLmfqR2z3gqbjximKSPKiRpuRPLwINuUIZ6XfRSo
	jRtYZvLky5vb7R7dXSNUUAf6GcnAQnuPfxPDH9YXlOVq3anCRPSfZiemla2aJJjnC9BlarRNuTesJ
	XQi7SrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHwR-0000000FE0o-44nN;
	Wed, 26 Nov 2025 16:00:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw8-0000000FDlz-2Pld
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xFhAcay03ch7P92KUy+gVdHfIHe3YtQM91fB6LwAipU=; b=IVB05gjzzuZpdPqdBbtI7/1Oqk
	MwfBRXQ+p7CvR0pY0qHVUYk6SxYiSGcFmipAtGO6YfG9BsGx0gLDGVzIGRPoPXlyAG23IzB2MmNL1
	WqQRu0Ez+TtOuubOOZLRFh+RrVy7Zx5kqBkHUGAbWTtynn/+gJxcwcylfOvxEZMPknqM0n858QJeq
	0AYnv9iBtcnt1Qg5Zu81fJ2iH+pCXWR6GdOC9tA4kiwwiCQSC99trkPKmYXba8lE999QYum0f03R0
	tS5eCACQK6DQBzvPv/zZLObjzDWUq2uhSwmB0jFhhyoNmYsBb7E2K3OAlbtL73YG/QDk8hD0WRpZR
	IOapFZnw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH4V-00000008JnK-02dp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:04:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B8F44299;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843EBC19424;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172801;
	bh=oMUFNhJwoz5712RpwSGLvZcN/b61b7Nh7mKR2kXcc4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cc+ij8tSa4xgyJVhUE0KraHDww+nZLCb1jt7kLYoun/0UO7q9ryxfxSB06Cwlh6FE
	 GRQHgd7NIEb12Q5q4Py7hTpC4D6DTbW3PyZ5I3bs2U3cbBlCo4l+qXu1k2t3iZKMkO
	 89wC2E7FRi47mWqhDzUMr9xEAg7F987gQ4ZwuzYsWrgjuVO07p/PxER0wp6k+l5C/k
	 7b7jqfVqD+F3bmfF50fDNDb+nAadU/ac6s36McjzdI1Po2Qs393+1BWGvlBJw08cyX
	 Fap20KzZHDce1HhIofR38IYTvHeraq8i7N/e9810QVO4yHo4fYFtJ4AVdI94NGIiKi
	 raPK/sudkO2vg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vOHvz-00000008WrH-00Zc;
	Wed, 26 Nov 2025 15:59:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 3/5] KVM: arm64: Add a generic synchronous exception injection primitive
Date: Wed, 26 Nov 2025 15:59:49 +0000
Message-ID: <20251126155951.1146317-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251126155951.1146317-1-maz@kernel.org>
References: <20251126155951.1146317-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_150443_349612_AA355BA2 
X-CRM114-Status: GOOD (  11.61  )
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

Maybe in a surprising way, we don't currently have a generic way
to inject a synchronous exception at the EL the vcpu is currently
running at.

Extract such primitive from the UNDEF injection code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  1 +
 arch/arm64/kvm/inject_fault.c        | 10 +++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index c9eab316398e2..df20d47f0d256 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -45,6 +45,7 @@ bool kvm_condition_valid32(const struct kvm_vcpu *vcpu);
 void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
+void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index dfcd66c655179..7102424a3fa5e 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -162,12 +162,16 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
 }
 
+void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr)
+{
+	pend_sync_exception(vcpu);
+	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
+}
+
 static void inject_undef64(struct kvm_vcpu *vcpu)
 {
 	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
 
-	pend_sync_exception(vcpu);
-
 	/*
 	 * Build an unknown exception, depending on the instruction
 	 * set.
@@ -175,7 +179,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
 	if (kvm_vcpu_trap_il_is32bit(vcpu))
 		esr |= ESR_ELx_IL;
 
-	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
+	kvm_inject_sync(vcpu, esr);
 }
 
 #define DFSR_FSC_EXTABT_LPAE	0x10
-- 
2.47.3


