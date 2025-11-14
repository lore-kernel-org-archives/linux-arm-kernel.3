Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B680CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8Xlnsx/zmgvCXCQMzb89zgvdg2ATSgROq5OfvhcQiQ=; b=p2sXaTv3befPwehLE0khB6v22k
	E5u/RpVNZfraid3U1ylhEkTL6gVl2UjU7KXuqa5JDyUPB0acAIpwPaSwad84Sds+atVYbsi4f/v8w
	Nh9/esjPPWBsaNoQyoOVeKgN17hJPYDaXT04xS08Rtk83FVaFpUI2pCB+v+NuYNNYgSYn9zAfXLK+
	yNPMioZpSzq7MCuZCWAXTWWwVBdElC0aOLyw9jIMDA4iB8v6RGM09pyfRPgXw+y3MF/+ShGP/4SzF
	l0it76jSdQF0r6L25W+XVCrj+9TKBlvK75FylG7Vm2DUEjGbdVIdkgpZWqjXzw0kKLjlv2mVWfC/1
	Iwe9/59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLu-0000000CfzL-1FWZ;
	Fri, 14 Nov 2025 16:08:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLg-0000000Cfip-39DA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N8Xlnsx/zmgvCXCQMzb89zgvdg2ATSgROq5OfvhcQiQ=; b=o1rnhe975Yaj+Gh5p3AQb6kwu9
	LQQEaTmTk+OKxW+j/OX0+dMaBLnhVl+x7QK377xsGJNRirKG1PRdZfZP10PfDhNm6hQRAwRigIru8
	NJSdDVQ2iNdAM4BAp+m4BVmByt7XurLPzhD2sTMkX6j7hWQeoh8FmenS7nAFlxGGN/KgSl0qKuBpb
	ngHcE/57vFk6ZUFsNdYD6+6TO/nR6wazQFrt4BI7ofLqGeyZTWLhKsW/egpFSY72sUXAA1aczlku5
	++n81Ygt9kUJqGEY1L6sx+4oKthIA/w8/M7elzpx3W8+MZhYSQjNUIp8/RNgDjXtkA1XQVDm/GwBX
	bBsSGDfA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTz-00000002vXZ-0rHH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0CA119F6;
	Fri, 14 Nov 2025 08:08:19 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 546493F5A1;
	Fri, 14 Nov 2025 08:08:25 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 21/35] KVM: arm64: Check for unsupported CPU early in kvm_arch_vcpu_load()
Date: Fri, 14 Nov 2025 16:07:02 +0000
Message-ID: <20251114160717.163230-22-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151303_467295_B10AF019 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

When support for SPE is added, KVM will have to touch SPE hardware
registers on VCPU load and put. Move the check for unsupported CPU at the
start of kvm_arch_vcpu_load(), so KVM doesn't try to access SPE registers
on a CPU which doesn't have FEAT_SPE.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/arm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 783e331fb57a..f5c846c16cb8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -586,6 +586,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
 
+	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
+		vcpu_set_on_unsupported_cpu(vcpu);
+
 	if (is_protected_kvm_enabled())
 		goto nommu;
 
@@ -656,9 +659,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
 			     &vcpu->arch.vgic_cpu.vgic_v3);
 	}
-
-	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
-		vcpu_set_on_unsupported_cpu(vcpu);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
-- 
2.51.2


