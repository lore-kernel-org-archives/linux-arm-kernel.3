Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EC8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv8e2RFdvZF0EUgXr8xovCJjbXorTmtigExTnvTEHMM=; b=Fdg/FEufH3tf/dyiDMyySyYtG4
	b6bvnn+wCfIdOlog/LfK58V4k8rSO/wXA5UXRcVlqeqyKOt6Aqi0v5USjuXe5Nn7gR4SZZrMatpIp
	ekIVjAfgxNVBplGp4m3ZHG6GWtLz6poU2FnTK+UnITpz6Jq5hiip3z6Z6MBLlRjHuMI06nPZTVj70
	8t4WRBe5wDy/WJI3g17KP5Zg0YOqb0Wk1EkOIN//R1osbpB6767OQjUDnd9nooS9Rpc5LBPB9udoQ
	TLrNGBM+9OEJnT+8tPYeAeclHE8QP99w2cgOzSAm4Y4iwn2nSptxd4gviUEEDXJ4HoDCL+JJb/M1m
	Hcjo4PKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VKA-00000007GgC-3311;
	Tue, 15 Sep 2026 15:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJw-00000007GXe-09GE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773FC1570;
	Tue, 15 Sep 2026 08:43:39 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786C73F882;
	Tue, 15 Sep 2026 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487023; bh=B3XXboLvPkx6dcOeOmoMJEVAmJvgwTkHHDv9chNx8vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s7+YPBFQT58OoE1Uxuggw3iFQzbJZ1gHumDNW7y2cUr1H96wbIklTYGLDCUreTNwy
	 3YxqtanquhJiQlt1Hm5COhOvwhGsfFvypLyKZbYNBCqia/ZvJ5S+CkK8IiGsy1YYsR
	 g3BdfsnOW6b9cBwj9KEV1rMbNS23eRn816xN4xN4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v6 7/7] KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables
Date: Tue, 15 Sep 2026 16:43:05 +0100
Message-ID: <20260915154305.3852871-8-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084344_114802_C3F57BCC 
X-CRM114-Status: GOOD (  10.14  )
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

__unmap_stage2_range() and kvm_nested_unmap_cipa_range() are using the
same arguments. Clean this up by using local variables.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b8ba2d09ed96..3c3bc231eab7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2519,15 +2519,16 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
+	gpa_t gpa = range->start << PAGE_SHIFT;
+	size_t size = (range->end - range->start) << PAGE_SHIFT;
+	bool may_block = range->may_block;
+
 	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
 		return false;
 
-	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
-			     (range->end - range->start) << PAGE_SHIFT,
-			     range->may_block);
-	kvm_nested_unmap_cipa_range(kvm, range->start << PAGE_SHIFT,
-				    (range->end - range->start) << PAGE_SHIFT,
-				    range->may_block);
+	__unmap_stage2_range(&kvm->arch.mmu, gpa, size, may_block);
+	kvm_nested_unmap_cipa_range(kvm, gpa, size, may_block);
+
 	return false;
 }
 
-- 
2.43.0


