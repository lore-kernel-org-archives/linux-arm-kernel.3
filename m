Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B305109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOjdyc5IinqfPbQlSEmWIhjniGA13VnU5aBxynVfrms=; b=JNOESBn5hl8v5QoP0DxwS5Pzqy
	ixxDEFT0T6Nh3ZA/TY+8QNMcdAf8SOG1ufBeCv3oUSqfZGTqW5lz7AhKGZ8WhMLo7cQmwP8s/+7AH
	hSXpRfoo+5yDcJ8c8B/nmlFNufG2LdI3wWjWKeVqw0adeVw7+eaCjCbCPTJrOdn5L3RmLmhukvr2n
	pN8hq7vLgLzhWe33Z3LZ7xaoH6V4f1Zz62pWEI6EB7U8lF8kQ/1Uh9pO5GrV6sSycxSPwHMspxlfp
	NBBkiPAzEHJnjytsmR0WY5jJFYXzMYbZrYbfE3gmDslsmKC7bqlz1fgwYVwpeYTyTBND70KrcUTGn
	jGDyNoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNT-0000000DD3w-1uFZ;
	Tue, 31 Mar 2026 15:51:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bNP-0000000DD2p-2MP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49DC6416E6;
	Tue, 31 Mar 2026 15:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BDCC19424;
	Tue, 31 Mar 2026 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972295;
	bh=Jnvgq2pegetUjGhytI/QZI4LtPSB8jg7KrJ5nmPTBf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vm7PaAYQuiVvieD+rjDmaDmoT4LLOScZiZKiUpSSOeMjjYn5ZPFQn+regAxdhMgex
	 gd7v5781pr8h4/EM+LM+Im1fMAg3O4uCA0YNYMBeGDWXSlvGGmCoG3ODiOgJA1OO9N
	 F+1+r1dt3WgBTP+8uiwb3gWr0yyKbRDC7M2zNTq5CdBF9Mmg/KLSLor4hE3LSAFBB9
	 EGErZmdKzuMVNML7vqu5NDki9VBfSd4H9YCrXyWNpNf70RzkRrAum4z5Z2sbJrwdOP
	 MNMofIBji9KZ1Z/7Dtma4kNhwvD+wXrPdzwnb+BN9VHKC0km4C+Z22eG4vCNVFxgjQ
	 ZTA9oSijZqpog==
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
Subject: [PATCH 2/3] KVM: arm64: Allow get_pkvm_hyp_vm() to take a reference to a dying VM
Date: Tue, 31 Mar 2026 16:50:54 +0100
Message-ID: <20260331155056.28220-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331155056.28220-1-will@kernel.org>
References: <20260331155056.28220-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_085135_619043_165E14E7 
X-CRM114-Status: GOOD (  10.12  )
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

Now that completion of the teardown path requires a refcount of zero for
the target VM, we can allow get_pkvm_hyp_vm() to take a reference on a
dying VM, which is necessary to unshare pages with a non-protected VM
during the teardown process itself.

Note that vCPUs belonging to a dying VM cannot be loaded and pages can
only be reclaimed from a protected VM (via
__pkvm_reclaim_dying_guest_page()) if the target VM is in the dying
state.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3fd3b930beeb..b955da0e50bc 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -309,14 +309,8 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm)
-		goto unlock;
-
-	if (hyp_vm->kvm.arch.pkvm.is_dying)
-		hyp_vm = NULL;
-	else
+	if (hyp_vm)
 		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
-unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
 	return hyp_vm;
-- 
2.53.0.1118.gaef5881109-goog


