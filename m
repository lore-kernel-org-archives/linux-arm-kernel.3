Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A11061B0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeKl0GS5ZMn2Z0NrC5EYD8l6+GOH+xNvyySuQnd+sSA=; b=Fk+QOxhzXnKGiHVQKqru0d03y7
	QdVgyS8t+VDjCPpXwSTHBtTEAKaBUVn4k/x/aPUcM+27KiTL/l5BoBm3+NRAHVgdsV77xglY8z2oz
	ODwX10MEjbGpvaS9nXP6AHuzLEOsk7at25lfYz31cBcXfZ9aRvTizUEhS4gXfHHFJJzgjdqF5d+YI
	F5i0eMMkPTg2Z5qSD/Zvwh3DPX7Kg9QYtdNld4D/NumHhjXRRisUilaavdsDJli7CErUTwYfBiu7H
	qPp3oFKv2Pazdh4+oyKZ/ufLXeZVtzG/01H3pGjxTTJMQzLU5Fwl2ji6wvo+9QKN7L8iUUEdxqNl6
	HYrdJ4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvm-0000000BT8B-1oZw;
	Mon, 30 Mar 2026 14:49:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dvd-0000000BT3c-3cfj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 491DD60121;
	Mon, 30 Mar 2026 14:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41056C2BCB1;
	Mon, 30 Mar 2026 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882161;
	bh=7P+uzxldFf+9qg+nRD40JCugsSDrZRwu1jtKYArToK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VMeOEdH2h+jUvGV7ydQh9oSm/Dj1t2ykqHJYdjyvymnP3dDB/nxB++AdjPzaWCHlq
	 OXBDjpVwU4hKwy7zMgh8H8dMSRofvftFiAMVTexSWcEGMrvp1diz52/JiDZoLFevqe
	 3YAZhO/uUOy5bBbQN+6Peg+D5eZ6r9tDoogKbIcdTFA3bOJ3mZkNl0vhBt0+uSW2Cb
	 FulM8Gy/h5nKWvwz0qdUqtHQLcxGD0PPtWokTLZLUj3oXo/vaTqc+mnbYXSkw4JzVz
	 gm2qVysFx9KbOxomjdEMSujIh3gQNxai9mVJweAFIXxMi9yj6797dRyy9uv/yZdhW6
	 3TuEttyqW1h/w==
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
Subject: [PATCH v5 09/38] KVM: arm64: Prevent unsupported memslot operations on protected VMs
Date: Mon, 30 Mar 2026 15:48:10 +0100
Message-ID: <20260330144841.26181-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 arch/arm64/kvm/mmu.c  | 13 +++++++++++++
 arch/arm64/kvm/pkvm.c |  6 ++++++
 2 files changed, 19 insertions(+)

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
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index dd93dfdfe52d..94b70eb80aa8 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -192,10 +192,16 @@ int pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	int ret = 0;
 
+	/*
+	 * Synchronise with kvm_arch_prepare_memory_region(), as we
+	 * prevent memslot modifications on a pVM that has been run.
+	 */
+	mutex_lock(&kvm->slots_lock);
 	mutex_lock(&kvm->arch.config_lock);
 	if (!pkvm_hyp_vm_is_created(kvm))
 		ret = __pkvm_create_hyp_vm(kvm);
 	mutex_unlock(&kvm->arch.config_lock);
+	mutex_unlock(&kvm->slots_lock);
 
 	return ret;
 }
-- 
2.53.0.1018.g2bb0e51243-goog


