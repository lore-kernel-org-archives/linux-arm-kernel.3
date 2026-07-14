Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F007C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUAIiQtPL0221z9283fk3CoSipszAo31ipyqzu1R2vE=; b=SpMDvU/MoRWsPHRjtirvon9vEo
	1UmmrRXComtJ7ZQgTNq+b00lcWCWzqW6mJ02tuvc5mQIBAwr7BL6sdVw9eFyeEhcSnqYiHJQQ++w0
	XeEx2GA0601lOG9FvyrPIwX0vNveaI27McJ98FCKwn9M2k59kBFQir3VEU0TI/g+rRq1i0yZf68jq
	1y8O+8NQdEMVfyft47LsEhupkMXC9enADTg7pbusqLBCDxKcWUJbUyx498m34uQ6YRaQrffBqY0fc
	R5H2aKX8rWbhAv8pLwGtZ/8mp/pG8EnbimtQHFhj8aIzjsj3L5SE4YdLyfbtS8/3fOVNi87Pa6ZlB
	lQOQ9dOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo9-0000000Bpe9-3VFk;
	Tue, 14 Jul 2026 12:00:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo4-0000000Bpaj-0yPZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:00:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABABB497;
	Tue, 14 Jul 2026 05:00:06 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74CC93FAF5;
	Tue, 14 Jul 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030410; bh=dEOA4qysSRG7n58hsk4J7X5+FYVGdQ3ln2cyFcm1ZyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=srF8MC90nVSBrVEL7QmF7JLmmo8Sv8R3E3KsdFRWfZU1J878GxNO9qhYIiAQb5Q8N
	 FXIx+lnr/rY/WmSScZds/P1s0xqA8awh9vzBebK8k+08Z0xUjctiUIoH4mpazdURc1
	 /O4vbxzfPregZE9Qw4ba+7MZZaQm3ROtT/68SYbs=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v4 4/6] KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables
Date: Tue, 14 Jul 2026 12:59:23 +0100
Message-ID: <20260714115926.2044757-5-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115926.2044757-1-weilin.chang@arm.com>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050012_321688_2D7C8472 
X-CRM114-Status: UNSURE (   9.19  )
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

__unmap_stage2_range() and kvm_unmap_cipa_range_nested() are using the
same arguments, clean this up by using local variables.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 73629aa1ade6..6bfc1fbc5387 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2441,15 +2441,16 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
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
-	kvm_unmap_cipa_range_nested(kvm, range->start << PAGE_SHIFT,
-				    (range->end - range->start) << PAGE_SHIFT,
-				    range->may_block);
+	__unmap_stage2_range(&kvm->arch.mmu, gpa, size, may_block);
+	kvm_unmap_cipa_range_nested(kvm, gpa, size, may_block);
+
 	return false;
 }
 
-- 
2.43.0


