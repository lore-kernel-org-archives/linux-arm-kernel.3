Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0A10ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiHG5n7P2ayM3uEFEPlReSOtNi8YGqLUC0wgcT0sKos=; b=exJgyL7iUJcI3AgFeYkKr4xJSX
	2rZT2H/Jf9XQQZpIrVM1FEjW0hYzB5AALtCCfAux7MTFoGlnAoIITNyvr0cJ8z/oKrI6/bHvMuCWn
	c1IBCuY9gYDcshOuSs1MU0SA96190DOKV48OhEzp55ELtU/O3BDL4UoM8fVmTWOe6c9vuVIRY1m7S
	72gr8oAOY61hYz8GCyCuq1edT9HWvX3OVnaYbvQJV2jH7INMcD9wG/Uu5Xo09HSC1BAeGMLwcEPxq
	y5ToItQ7R6TrRkxFmiZim5ILmw+i5IYDQyc3Z2Mq7ykQmfe9UH4bOgAhjCI50yQX7tQDLj/oxSVxw
	jefXHFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kq-00000007Vsb-1b0t;
	Fri, 27 Mar 2026 14:01:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kX-00000007Ved-0fCa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D882A43464;
	Fri, 27 Mar 2026 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1729C2BCB1;
	Fri, 27 Mar 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620080;
	bh=ytSwSbutDYnmNQD/WJcRI42GxQWEkV8O9WbKsVxsWAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pgsY3W6l72r3Ktoy08b2ty2QUdicC4H5HATTm3GIMJfbBw7gzPAlfk/MoICuTP5Wt
	 1CuTMwOSsUCQjy8KPk6nx0bUQ49PTmic25FjqpcIJePAMSj1I7K/JeJnrcPt3jd6yR
	 PSinKgiBJgAxO5SRj/vcSpEYPoP4A8M3g61mT2MnXdfMCZ7TXwiggh2dSqVHEp7q1B
	 BV4sETlYGDTWdggybJb87QHMTSV8DYmTtPK4GFfI0kxgAvBb7zfY4JQjzqCX6ZeUVv
	 EQmExHk6KZo2y8ld+5vwCX7baPTFTuXtUt0152az68ro8MuKWJOsoLzGU5qo0bAZOA
	 LXm6ryHFEH4Bg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 09/38] KVM: arm64: Prevent unsupported memslot operations on protected VMs
Date: Fri, 27 Mar 2026 14:00:08 +0000
Message-ID: <20260327140039.21228-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070121_229198_68ED40D2 
X-CRM114-Status: GOOD (  10.01  )
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

Protected VMs do not support deleting or moving memslots after first
run nor do they support read-only or dirty logging.

Return -EPERM to userspace if such an operation is attempted.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5e7821fe0fc4..b3cc5dfe5723 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2414,6 +2414,19 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	hva_t hva, reg_end;
 	int ret = 0;
 
+	if (kvm_vm_is_protected(kvm)) {
+		/* Cannot modify memslots once a pVM has run. */
+		if (pkvm_hyp_vm_is_created(kvm) &&
+		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
+			return -EPERM;
+		}
+
+		if (new &&
+		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
+			return -EPERM;
+		}
+	}
+
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
 			change != KVM_MR_FLAGS_ONLY)
 		return 0;
-- 
2.53.0.1018.g2bb0e51243-goog


