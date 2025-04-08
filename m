Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly+q2aBGiKHABUBSkOijB1PhwaO45SYGbzxI0F4R7h0=; b=W5a5f5n5iCEyB03w8yvPWtcRh9
	rXykJCucnBfKUgyj5zi0Z+CKtYXQ6PgQWSO1O5hLnum0oD/X4qN7nDeNfEmBJgpoh/QI5d7qanhQs
	47uwha1c103JsDuYL2hOg9LMGiVh7EkFdZvlSGkEL69tAAhz5uvHRuY2I7quA3vwx3e2wmxiro8xG
	fhzZic6qcsH/kBkI/KcAejvtHYYCkdj+ErN92nPQM18zEd1Qrr8YRsKgXUtks1TVThPcO0z0I9hHl
	BXgJOUvAOAZv4rB1fNA6pJQFXXUPj4U2bxQ7Cwfy6EdEsj02gW76PhOcS13RqU6Jjvq3j0d73gjs5
	lDrooC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Y2-00000003uVR-3kRm;
	Tue, 08 Apr 2025 11:55:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZM-00000003kX4-1njv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1D4B5C0E75;
	Tue,  8 Apr 2025 10:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCB3C4CEE5;
	Tue,  8 Apr 2025 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109559;
	bh=Gk4HFp8XS6m0HdA7Gwl+LnZ7YLCugzXs9yfBTmhgsK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oWmp2flgvk05JFGyAV1A39XUeYcuyiX9GxrwnbXtINY3JL2VC98+u8wTXwAEwQ5if
	 I5cFDg7i/yX7/bh01DKK2GyN6DWvfWuMjhNTNQSemY90kD7CYOnM1p8vMnXT8dRg1M
	 os4P0kGPBQUzU5QHwk5wA4Mosoxkv+J+AZu3Hc99C6BToKzWrnnSk1/0JCh5wgc0v4
	 pS+Jo0VaR70XNyh9odd9CharMSXWSntwqo6T01dcvKthUY3/gwxQwT/5gglgYeudFa
	 XK0I9JHbfWBr+65ZnEooan4NKVzgSXEqYSKCUdxVDBckJUYqklogylR7kvzZZGbzu0
	 2sj3ikSl9OLzg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZJ-003QX2-Fz;
	Tue, 08 Apr 2025 11:52:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 02/17] KVM: arm64: nv: Allocate VNCR page when required
Date: Tue,  8 Apr 2025 11:52:10 +0100
Message-Id: <20250408105225.4002637-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035240_511981_58600E1E 
X-CRM114-Status: GOOD (  12.49  )
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

If running a NV guest on an ARMv8.4-NV capable system, let's
allocate an additional page that will be used by the hypervisor
to fulfill system register accesses.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++++++
 arch/arm64/kvm/reset.c  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4a3fc11f7ecf3..884b3e25795c4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -55,6 +55,12 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
 		return -EINVAL;
 
+	if (!vcpu->arch.ctxt.vncr_array)
+		vcpu->arch.ctxt.vncr_array = (u64 *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+
+	if (!vcpu->arch.ctxt.vncr_array)
+		return -ENOMEM;
+
 	/*
 	 * Let's treat memory allocation failures as benign: If we fail to
 	 * allocate anything, return an error and keep the allocated array
@@ -85,6 +91,9 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
 			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
 
+		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
+		vcpu->arch.ctxt.vncr_array = NULL;
+
 		return ret;
 	}
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index f82fcc614e136..965e1429b9f6e 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -158,6 +158,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	if (sve_state)
 		kvm_unshare_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
 	kfree(sve_state);
+	free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
 	kfree(vcpu->arch.ccsidr);
 }
 
-- 
2.39.2


