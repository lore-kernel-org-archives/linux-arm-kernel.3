Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJZ1Ajiw;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JECrwoav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ssw5USA6kTJR2rczz2n//qjSi6PfjV55B6pl9u5yEdU=; b=fJZ1Ajiw/IVIw4
	cPDHzaTCBmqf0AiPCfeSkquMFTDlmJvT54+VsSplsfEWZRWlW7feJAhaXXvljfrqw8TCGP2wKc62M
	iAS72TvnUqVu/x/sUDPf4OaOZ4Int0l2KJvhZ8I4dJ25tC28oHduGK3ZFuzbvJs7C4b4SC8q+kbed
	nlRAuI+szVxiIXammaqqXRsYOCONBFU52Le+3PhU/g2o1R7nUX+KFYbwfsUxx6Myusw9F533QvBSt
	xeOeQb4SoRHgFCBc6aJAlrhM0ZHVntC4AWntKKc6LmEq3WeSdqoecKaqHRrjmvJX4KWpEcDZlO156
	nrUjIL/RMl4QgsZ3ax1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsng-0000000Gk9a-2fql;
	Mon, 02 Nov 2026 14:14:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsne-0000000Gk6X-19F3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F11D1691;
	Mon,  2 Nov 2026 06:14:10 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2C8D3F59E;
	Mon,  2 Nov 2026 06:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628853; bh=h6KBkcsp5DeEHH4D4E0W9F9SywHXfnWYy74THEiEa0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JECrwoavalTBUMpD5iZGLy7KhIDhV9iLSCAITQfYugg5FaFnqZsEqK7N88s7ONT6k
	 QaqgUlv/kAUKobC95yz2jAvIYsWeU7QyvXWEoy6w3fkSnL2jOTdgKnFk8V+o1duvPx
	 OjFZflVf90HEDK4mbOx81QYjdnyfGSP3q/ZFVIns=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH 09/11] KVM: arm64: CCA: Prevent memslot modifications after Realm creation
Date: Mon,  2 Nov 2026 14:13:00 +0000
Message-ID: <20261102141304.126883-10-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061414_370543_12559265 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -4.4 (----)
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Once the Realm is created, prevent any changes to guest_memfd backed
memslots, as the private memory is provided by slots backed by gmem.
This will also be validated when we handle a fault for Realm Stage2 (in
a later commit).

Additionally, similar to pKVM, we do not support dirty logging or
read-only memslots.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/mmu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 51fda7b2ff7f..eb8c5f9e9791 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2862,13 +2862,28 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
 		return -EPERM;
 
-	if (kvm->arch.vm_flavor == VM_PROTECTED_PKVM) {
+	switch (kvm->arch.vm_flavor) {
+	case VM_PROTECTED_PKVM:
 		/* Cannot modify memslots once a pVM has run. */
 		if (pkvm_hyp_vm_is_created(kvm) &&
-		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
+		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
 			return -EPERM;
-		}
+		break;
+	case VM_REALM:
+		/*
+		 * Once the Realm is created, we cannot modify any slots that
+		 * could be providing private memory. i.e., guest_memfd backed
+		 * slots.
+		 * TODO: Handle trusted device private memory slots
+		 */
+		if (!kvm_realm_is_created(kvm))
+			break;
 
+		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
+			return -EPERM;
+		break;
+	default:
+		break;
 	}
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
-- 
2.43.0


