Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mlwrKuqO;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qE+S37o+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tr8NkJMHl3FHlQcbzwhDnYMo8FYHNDVW44KQY09vbOs=; b=mlwrKuqONZfnLE
	lG9zcYMhd9IL3BwTbU5+yUTE7yuyL6qXYy1q1QhLUYUKKKcv5+PelWLoG8W8ifCdx33NtGJyylzbV
	OaSaGDVSkTb+DWDIfOYRph8rXYn0E75cYewHObxDk7tGdWCJFT3xZbWK++azNQxNluVLNx6tFWUbQ
	WKsZAZV5vOjUV0HZOv/Ufnw3Kw90zVdFdb0JxmA+KnPeFY7zWp2B441awQwIhpvy0noXYGmg2slEv
	fKaIg/c2BiLfsDXdIqJTnZEPUsvCs0s3TqmezY2qFXfIzAOq71xA9s4CC+qr0k/bSCEDw+wvBTkeT
	jifBitA9qfWHsbPY8+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKe-000000083sz-0HQ2;
	Thu, 05 Nov 2026 07:56:24 +0000
Received: from out-130.mta1.migadu.com ([95.215.58.130] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKV-000000083qE-0fyK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:56:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NufnUWPoeGRDltZSqqytUAf9Oe1HKZ1J1ChJkjlHQ68=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793865372; v=1; x=1794470172;
 b=qE+S37o+Msp/zZhIA4Bb/q5Ng+r9nVyAXNl+njlYlfoSYJrWMRglD1RoYHcILTA/195rBZqi
 n6up0Xisgq9OBp8yThEG0d/u7qJF3beICgrksYLt5TdCjhyCgISRL1acd7oFjzhGh1Y+nKJt9pV
 o0RN2zNX0trx/b92v7eUg8KI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cccae0cd339b3153;
	Thu, 05 Nov 2026 07:56:12 +0000
X-Mizu-Trace-ID: cccae0cd339b3153
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Martijn Bogaard <martijnbogaard@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: Check PGD alignment when creating a pVM
Date: Thu,  5 Nov 2026 07:56:04 +0000
Message-ID: <20261105075606.367005-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105075606.367005-1-fuad.tabba@linux.dev>
References: <20261105075606.367005-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_235615_346240_5AF9A0CB 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Quentin Perret <qperret@google.com>

Martijn reported a hypervisor crash when providing pKVM with an
undersized PGD allocation. Indeed, although the size of the PGD
allocation at EL2 is not under host control, a smaller host-side
allocation can lead to providing pKVM with a misaligned PGD, which will
cause the guest stage-2 init to fail in a bad way. Specifically,
guest_s2_zalloc_pages_exact() expects a successful allocation from
hyp_alloc_pages(), which can only happen if the pool has been pre-filled
with a physically aligned high-order page.

In order to guarantee allocation success in this path, check the
host-provided PGD alignment early on.

Fixes: 60dfe093ec13 ("KVM: arm64: Instantiate guest stage-2 page-tables at EL2")
Reported-by: Martijn Bogaard <martijnbogaard@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
[Fuad: Returned -EINVAL and moved the check ahead of hyp_alloc(), with
 the other input checks in __pkvm_init_vm(). Cast pgd_hva for its __kern
 type, updated the comment, and pointed Fixes: at the commit that
 initialises the guest's pool from the PGD.]
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c        | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d4c332a918035..5b624b1ab32e8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -186,7 +186,7 @@ static void *guest_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&current_vm->pool, get_order(size));
 
-	WARN_ON(size != (PAGE_SIZE << get_order(size)));
+	WARN_ON(!addr || size != (PAGE_SIZE << get_order(size)));
 	hyp_split_page(hyp_virt_to_page(addr));
 
 	return addr;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fc0475f0877d1..03e530e15b4a2 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -892,8 +892,8 @@ void teardown_selftest_vm(void)
  *
  * host_kvm: A pointer to the host's struct kvm.
  * pgd_hva: The host va of the area being donated for the stage-2 PGD for
- *	    the VM. Must be page aligned. Its size is implied by the VM's
- *	    VTCR.
+ *	    the VM. Must be aligned to its size, which is implied by the
+ *	    VM's VTCR.
  *
  * Return 0 success, negative error code on failure.
  */
@@ -924,6 +924,10 @@ int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva)
 
 	vm_size = pkvm_get_hyp_vm_size(nr_vcpus);
 	pgd_size = kvm_pgtable_stage2_pgd_size(host_mmu.arch.mmu.vtcr);
+	if (!IS_ALIGNED((unsigned long)pgd_hva, pgd_size)) {
+		ret = -EINVAL;
+		goto err_unpin_kvm;
+	}
 
 	hyp_vm = hyp_alloc(vm_size);
 	if (!hyp_vm) {
-- 
2.47.3


