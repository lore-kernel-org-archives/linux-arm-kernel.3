Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247DEC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Bh74ffhwGvzoB32j6548UJ2jmofNRBk5TExayO2sC0=; b=zHy8bwxtK78io7YjwPa5LWrnSd
	d9bd0U9Hq4ThrqP7xzqRYmFB24FId4oJ5zVss2A2sw2XeiwBU57wwLcWKkMQjVSmSf5cQ5u1MKM/+
	/sGHsV6C8OGUatfEGRVtzitxt+x6ObOmXQGBKPkswcPMxxEooZXbVnQ1tayr1CFfDzjEHFSU9U8R/
	Ug8/65ER7zPEBYrStneR9l4Z6GBjiIxOxJaF+M1P7h7R2mPX/rqOZKWmYSGUalft4SY7Pglz2tGNH
	91efopu3XsoSffby6lZDg3K8Hr2kLi0P6UdRLrrFMpyAB4JQUWShTipxVcDRVWpZnrbMWaSU4FMbL
	4+rUa7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqY-0000000BdkP-2rDv;
	Mon, 05 Jan 2026 15:50:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqV-0000000Bdhz-3WBH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 457B660141;
	Mon,  5 Jan 2026 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F19FC19425;
	Mon,  5 Jan 2026 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628214;
	bh=FMgH4tjmmPzyeMSdlENmcMAZuZ5jAY2wrE5NYUN4Hvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fqe6pn6Ocahv3hqhHuzUxcGmCjLM1isCKz3KxZSjp9wwvlnJhxkrD+jRFqBFnHK6t
	 3pCqJr/6H+dd3UOSyjGcTat3gebE8uZFWa5ur0yQEtjjyie+dLGSNek15sBlGzEe3O
	 AAU4dpxz3/IEgRi/gr67OGMVX9ogEFmZRmSWuQJ7/OgCKAgr/gtcM3k8yY7RN4AwDe
	 BlFKh4vyWkvaeISHUR0ki/1GU8xQMu+FTwB7fXBelbqplzn6B3IdZiHYMrDWhuun9e
	 jidaSmoyi0bYYCICQED2UEtcuqArZzSUdvWMDTyY7PdcoLoozT2S/dEHhslYj9nOAE
	 D3/3CP/tZmoUA==
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
Subject: [PATCH 08/30] KVM: arm64: Prevent unsupported memslot operations on protected VMs
Date: Mon,  5 Jan 2026 15:49:16 +0000
Message-ID: <20260105154939.11041-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a888840497f9..8f290d9477d3 100644
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
2.52.0.351.gbe84eed79e-goog


