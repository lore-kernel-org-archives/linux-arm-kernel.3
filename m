Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E0AC982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKu0uI0x59fkrodfWZWADySi1vL1RYfrnHdcK+TZC8I=; b=agktQDxnYBvpgFDoSoJP7ge4Fv
	ru+JOpbHcTTcdLVAvbzep/LqT5EsFCvumZm6HbVe91tK9G+6GsZw8RJAeLzRAHwxCfocdUH4bZCdf
	c6znuRdJaR2JC1lGjlpMymZ7F9Y18cRepTvQxKu3dZTsH/zNI/fg2AAzON5zUsB4NzeK+alJM2Btp
	qWa1T6YxZLiX5vc+EjWazWRmZDobKJmKqhyYzAcoJie3+OlgJ8+oQj3zVQ489YM4cDX953U8RiExI
	uWXs9ZRNJjCkc1MHEzctNCelLY1Z9uq9TbCBhlsB0/5Z3N2sQDfJYNg/x8/fl7zcCL5HEjCg9J916
	YC151xFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcD-00000007LNy-15ku;
	Tue, 15 Sep 2026 16:02:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vc6-00000007LHl-12aV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WKu0uI0x59fkrodfWZWADySi1vL1RYfrnHdcK+TZC8I=; b=d3H2Rek+IlyvtXQaxLgtO2/nJc
	Isx3ZF1LL+kiWmzvGdKnEQP8/q/kEkG6ytywtUrORdwKCmfnIqOLprDDtxHvKziwepVnEyDgX3F3M
	6KPmUUNSVN6v0lUOZ7Cnwt6USnoVmiMmnH72Emk/hR+MT2+DuBe+tU7CfVAqo4iTxYP1jFzDDnhv5
	IAmPU2Bgdb7Qn/PobBJsKsMIvMREkdp2zGQxEVVigG2H/UiGnGWaFgAfRdVUEJwaNKCenCBqXwHfc
	KbzIcj7+9r9FEL9ouw4oFEWAL/3S7+UGhxpPeJZPiY+gnLDYI0n0Dyk2cp0Pe0+44khXHXq8ZQoPo
	yyCbL5RQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Vc3-00000006zkt-1U8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF6915A1;
	Tue, 15 Sep 2026 09:02:22 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82C8D3F882;
	Tue, 15 Sep 2026 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488146; bh=O20Il//CEz/+ccfyPp5fc/rnwGtdVWyTBiPY+ldH7Bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqAo4y5xDcLPy/SIM1ag+uNsHiVFPkhOybAkt1H7ifo9uJeJ0ZxAIbaflRaCpAqRY
	 t5ePwLFllZ6a7snHTFb1SfpEBlJorXlNCETpp2gF2FvPrMTDhACTrFW/nUDHVySWEk
	 jy5yHQHBYcVfHhitR71wOHtzml+p5kNu6OERGSKk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v18 11/23] KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
Date: Tue, 15 Sep 2026 17:01:29 +0100
Message-ID: <20260915160141.3543048-12-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_170227_661395_AC4340C2 
X-CRM114-Status: GOOD (  12.48  )
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

Now that we have a flavor to check, use the helper to explicitly check
the type for an unprotected PKVM guest. We don't convert all of the
!kvm_vm_is_protected(), but only the ones that target unprotected PKVM
guests.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 +-
 arch/arm64/kvm/arm.c              | 2 +-
 arch/arm64/kvm/handle_exit.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index a1f3e05e75dc1..e4ea80711bec6 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -49,7 +49,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES:
 		return false;
 	default:
-		return !kvm || !kvm_vm_is_protected(kvm);
+		return !kvm || kvm_vm_is_unprotected_pkvm(kvm);
 	}
 }
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 36bd1c6c04899..42d9385f5e329 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1082,7 +1082,7 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 
 	if (is_protected_kvm_enabled()) {
 		/* Start with the vcpu in a dirty state */
-		if (!kvm_vm_is_protected(vcpu->kvm))
+		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
 			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 		ret = pkvm_create_hyp_vm(kvm);
 		if (ret)
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index db37678dcb05c..384c5d258c7f8 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exception_index)
 {
 	int exception_code = ARM_EXCEPTION_CODE(exception_index);
 
-	if (!is_protected_kvm_enabled() || kvm_vm_is_protected(vcpu->kvm))
+	if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
 		return;
 
 	/*
-- 
2.43.0


