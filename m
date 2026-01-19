Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2F8CCF2F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOhFAgQx7UTfmysW69H5vV/HYgWt5xRYFrDctb7UOo4=; b=g1Vf12f7maPvWwj/wPQyLVoWFu
	ssldM0Ii31XiJBtBmAykRpPDR2jnp0p6firnaka5jTer1Tv1QV9ChYNgZ6jPJfOmb4mLUZHtktVES
	gH2jIiKw1BmKyVmiwk731cV0hsu2P/LZtwRhFn2eRp0ZE6PUP77hBOAgfxaW5IcAD+j8WtbG/S0Rp
	rsuQVBZr/jZ/phVCLOzDMka7rehQ7SUfKr4jOhMmYvXuj9r34YvDsEnnsbQ1MuSffUIhWxcLIZafn
	M544oIR2LaoJvTM9eKF3PA+KjX9Hu4XtROpJs0FEwF2E0lxdwaGbSKxkyOzcO+TEvFHpuE+aD2XRT
	TSLt71bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofP-000000023Ot-3OnM;
	Mon, 19 Jan 2026 12:47:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofB-000000023G0-1r04
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BE9043DB0;
	Mon, 19 Jan 2026 12:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7A9C19423;
	Mon, 19 Jan 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826840;
	bh=8iNT4oQAeGWJG0Dr79nIPwJzjgkxNXQGMTbbi7cpd2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAQfLsbTbX8Vxk5iZ2AIRHCZtghLQ8Y3mvrrX46JtllSvwyNmcJK/psOh4Ywh+BWW
	 yrD2FvmV1igIMzgtKybK2cuO93rpCEJxG66lLKuFBfnKz6S3t3x5Xupyhr4OTZS3lM
	 Mhe69t2ypF4z0TIM13paTzokaO2fJGZvqoAVju7N4h48jwNZWl8Bf3IKL8+TYyKTpQ
	 Cye6psd2J2BmCFnuIqxJBAPSdEHPBqXhhqxRxXVqLDHNmA9Nll8p1In5OuHdRUagRQ
	 2B1UuqyZHqBDHaw9DbkzIWRj7+KgCvXxIaY5TGx+rTr41dvVvlldaJMkDG8z+YiOJs
	 7ruhqlXoPYQFw==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 09/35] KVM: arm64: Prevent unsupported memslot operations on protected VMs
Date: Mon, 19 Jan 2026 12:46:02 +0000
Message-ID: <20260119124629.2563-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044722_949850_3A451199 
X-CRM114-Status: GOOD (  10.90  )
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index f535a180fc1e..a23a4b7f108c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2419,6 +2419,19 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
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
2.52.0.457.g6b5491de43-goog


