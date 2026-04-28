Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A43FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBFwe+kQ1OqLHi9s19ESuOVx/rJg9xLwA9cXX3TmEmg=; b=V5cqkt46hDvn1M7Z6/I/8fQp/+
	AiGXgG6W/dcwkVBjqQMcngj2fPcTT8hQfF/ALvhYYPRic7E5WYTgXSQLobr6lLeLAOP099+jW3cai
	Tyr3RtHQHuKRiA8Zz7LbSqC4rZvjMwOS02oE5iNMKbSQCEdi4+sdAYZrfERkyNscwcaccPjoTlAaM
	T8o3cfiUd7TcclDfkSzSnNHnweIhdSq9QxhLZB9tJc199RfWKhZPAh6J9qn8W5GzawGLJg5CuzSnb
	hKUSFrJ858usVHVHSxhPG9fLVFzH8ikIbrrJP3dKFv4vzHjra0xxMf04vpeimNSMhrT0J8Y0OIYc7
	XGrnMv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfiA-00000001AxU-14EY;
	Tue, 28 Apr 2026 10:30:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhs-00000001AjU-1uq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48a55ecc32cso64959405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372218; x=1777977018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBFwe+kQ1OqLHi9s19ESuOVx/rJg9xLwA9cXX3TmEmg=;
        b=f55EDl/vf+lacSByZMA9V9jlcijbe2eYrn9gQ3OvvwmM/B1HCWSz7cDR6eSvXk85H/
         xkJgpxQ7Nfg5drWuxdd7xzUg9vZnylj8OS1Ah6mzGPIp0PKU4oKqx0DKoSTbmhqg8arU
         W9sKVotxYEtp2wODkuBHlC/uQJctFd6DLoedZzVC1rgqPowYjKB2jYINYG9zbWKjQ1QK
         xe+EVdfhIfu/ukcZWeQVvDBoi3gz1RwCSZU4oXVn7QguZ1wcQlL4/SC1bL0OSQ+cNA6Q
         pNVeHajC3iM6zJ3q9dFHpQsLg3Zcugc2o/kdqiJn2Dp62eQQlyM5lUeLLaa8641YprQQ
         aA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372218; x=1777977018;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZBFwe+kQ1OqLHi9s19ESuOVx/rJg9xLwA9cXX3TmEmg=;
        b=i6IBfmkjWufUXclrdIGXEtO5ZTDs7gfZOinBiPcZLDeg2dBwjcMcssnv2YdV83eqc0
         idWf+1Im5CEAJ0N5G0L5MfE1AlSAgBT/KQMVYRGTNwX2WU70D9BO8sXOoElqouFJOV2p
         3nOaqzz8mulN4nYwYwp8cTWDmLkMY2MkKJgM0DSFeJ185YvGL0e/Ddi6XzMUuqe2N4KU
         tVkMLieGATrqB3p1OiJOwYwqV7EGxyDPVzmhYlMM+npft4Flq+Fl+idHsQWL8OsJx8dC
         jxtUy5vZ+YlPjiwA8sSZUCu2wJqqxA6pZj2S48OtRXhioPvkR2HGtBN0YhSHSL655vlQ
         3hTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Glar9jt3Wu8Rz/uoQU2fcSqOL+DVG2V7q40ryonRV1o7e3kaEDeNUuRkMFxteuud3ZhaV5r33ndFTlXi1/+Jh@lists.infradead.org
X-Gm-Message-State: AOJu0YyvjyzM13vyAKfw7+SE1fkZSaOuKdc+9CWSCqr5RcM1A+gXNY/U
	IXVRaoNZAdP+f1deKwEoOQ1hgitikKqV2QpYs5q/FUtOV+XIY6UDNmllOdKt3YlIzdtpU8TJIYS
	qQA==
X-Received: from wmbjp7.prod.google.com ([2002:a05:600c:5587:b0:488:a71c:cf48])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b90:b0:488:a639:b772
 with SMTP id 5b1f17b1804b1-48a77af5f04mr37827885e9.7.1777372218008; Tue, 28
 Apr 2026 03:30:18 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:08 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-9-tabba@google.com>
Subject: [PATCH 8/8] KVM: arm64: Propagate stage-2 map failure on guest->host unshare
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033020_541558_35B513A4 
X-CRM114-Status: GOOD (  16.61  )
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

__pkvm_guest_unshare_host() re-acquires exclusive guest ownership of
a page by (i) annotating the host stage-2 PTE via
host_stage2_set_owner_metadata_locked(), (ii) mapping the page in
the guest stage-2 as PKVM_PAGE_OWNED via kvm_pgtable_stage2_map(),
and (iii) restoring host ownership via
host_stage2_set_owner_locked(). The map's return value was wrapped
in WARN_ON() and otherwise discarded.

At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it expands
to a BRK that enters the invalid-host-el2 vector and branches to
hyp_panic(), declared __noreturn.

__pkvm_guest_unshare_host() calls get_valid_guest_pte() before the
map, which verifies that a valid last-level (PAGE_SIZE) leaf PTE
already exists for the IPA. Because the leaf and all intermediate
tables are in place, the subsequent kvm_pgtable_stage2_map()
replacing it cannot fail via -ENOMEM: no block to split, no new
tables to install. The failure path is not currently reachable.

Nevertheless, WARN_ON() on any fallible call is the wrong pattern at
EL2. Capture the return value and propagate it. The unmap() and
host-side rollback are kept as defensive guards for the currently
unreachable failure path. The rollback's
WARN_ON(__host_set_page_state_range()) asserts an impossible state:
the host leaf PTE was just written by
host_stage2_set_owner_metadata_locked(), so the reverse idmap
rewrite cannot require new page-table allocation from host_s2_pool.
This is the correct use of WARN_ON at EL2 =E2=80=94 an impossible-state
assertion, not a reachable error being ignored.

Fixes: 246c976c370d ("KVM: arm64: Implement the MEM_UNSHARE hypercall for p=
rotected VMs")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 37 ++++++++++++++++++---------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 6fb546af699f..12f3ea7a2d75 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -984,14 +984,10 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcp=
u, u64 gfn)
 				     &vcpu->vcpu.arch.pkvm_memcache, 0);
 	if (ret) {
 		/*
-		 * Stage-2 map can fail mid-walk (e.g. -ENOMEM from the
-		 * memcache), leaving partial leaf entries in the guest
-		 * stage-2 transitioned to PKVM_PAGE_SHARED_OWNED. Tear
-		 * them down so the host does not see a partially-shared
-		 * mapping it has not yet acknowledged via the host
-		 * stage-2 update below. No host bookkeeping needs
-		 * unwinding here: the only mutation prior to the failed
-		 * map is the (now-discarded) guest stage-2 update itself.
+		 * Defensive: get_valid_guest_pte() guarantees a last-level
+		 * leaf PTE already exists, so stage-2 map() cannot currently
+		 * fail here. The unmap() restores the IPA to a clean state as
+		 * a guard should the precondition ever change.
 		 */
 		kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
 		goto unlock;
@@ -1024,13 +1020,30 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu =
*vcpu, u64 gfn)
 	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORRO=
WED))
 		goto unlock;
=20
-	ret =3D 0;
 	meta =3D host_stage2_encode_gfn_meta(vm, gfn);
 	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
-				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+	ret =3D kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				     pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
+				     &vcpu->vcpu.arch.pkvm_memcache, 0);
+	if (ret) {
+		/*
+		 * Defensive: get_valid_guest_pte() guarantees a last-level
+		 * leaf PTE already exists, so stage-2 map() cannot currently
+		 * fail here. The unmap() and host-side rollback below are
+		 * kept as guards should the precondition ever change.
+		 */
+		kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+
+		/*
+		 * Roll back the host stage-2 mutation above: the host leaf
+		 * PTE was just written by host_stage2_set_owner_metadata_locked(),
+		 * so __host_set_page_state_range() rewrites it in-place
+		 * without needing fresh page-table pages from host_s2_pool.
+		 */
+		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE,
+						    PKVM_PAGE_SHARED_BORROWED));
+	}
 unlock:
 	guest_unlock_component(vm);
 	host_unlock_component();
--=20
2.54.0.545.g6539524ca2-goog


