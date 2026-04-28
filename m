Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E39FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBzgBVDAjOycqgcIzeu+4bme8jBbglGvTuoHc/CuC0c=; b=ZQzOe4vbFH2vcf9uxhQVySGRQ+
	sLP/jv8dlXovBQukdM6jFN1kAqxQfQ6RVNrKjzQ2JbWaY6TZu2sZxXx0M260T7nXVYbM9GTsorIJt
	/GcDQT8KbPpMqFAJ2rn+MPS+D09LvUdAaDXjGzsMInWMQCniYjSSH0Nhcxx9BpxZ1ULkPlyW2zdQt
	Obw9J99hS96zoCl/42Ej0QEIcwedQkptwKrekqUyhOi9/r11BO1ABClu/1jGyavCHFbOr8MFPyFPS
	cjQV9KUj9I+kP+0Luk08A9z3P6w+/zNk6pBvYfPaI5rVevfjX/HsHyDQbxo+4Q4Sl940jU8KZ7nbq
	KpeIhOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfi9-00000001AwP-2Zvs;
	Tue, 28 Apr 2026 10:30:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhq-00000001Ahr-1vkx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:19 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43ff19e54beso6947639f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372216; x=1777977016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBzgBVDAjOycqgcIzeu+4bme8jBbglGvTuoHc/CuC0c=;
        b=JlYSzLAfaIOoik1DIvMhwwtQAQsNARlAThow8vrD7cXo/0hG34znheVPzI1ldfGyuA
         /pjtGDazsk/+6DMaFpbS9ri4LfDMt/vNUupo9oXFmWBU0xHsp8A5c5ck6XJggqtN6+mq
         Bql8Z1LtXWp6ZcXYWcbhp4dIoAW7KMnsxJmh5Gp/vFjv4wAG/oarX+mawGToLKXZ7HkR
         wId1jULA3J9yknFKf+QAPMba4Yl4ShTc8VvdjUary8HzNR3Pszz/qpsVh81rPSMlI051
         f719Cch+j2KoAFby7E4HmovqCSCatD8kfMjv5qt/lHcYtl9zOdmwyLjkKeaF8hU8w18v
         e1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372216; x=1777977016;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YBzgBVDAjOycqgcIzeu+4bme8jBbglGvTuoHc/CuC0c=;
        b=ZEs3oqoGSk5ueuuG0L2WbhIzQnO+DVIdpgZiv/XcUMT1cN7Y/6HH7e3wTmfqZ5XzRu
         RPHPh+NTDsRWnSRD+vYFEHuSZHOEzws28pzOMKHc2vAT4cDibL6Z/Y/5C9pXzuNE9Giv
         CVjjyVPijIF1BWQDUACdVdtQKjIk3KHL8ljw0fQDa2aF8NfM55H65ChPY/PUPDE8OEIF
         xqoNVEQbDtrXHfFmI+7i6PPVRG6Nq3133DAwOnUpWw+j1ZbMdOiBPAak5IsxTyFfCrAA
         zs0E409IBcA6DXL5PYE5+meo7frkKrMNwtG0Ob2ID8/FbLlvAbVBRsPycoc84sVpT98G
         qlXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v3DU6g8KX0hWbLoRBD5FyjaN7P8xrgBRPO/A7zb1X5+woSgk7e+whiXCn+I+e60hOrquCLVZuieJRNWHHI0qw@lists.infradead.org
X-Gm-Message-State: AOJu0YxEfBrK8fpOhOcUqX+26bTPzuucqRpaLwt4FPqqOMMVUa0im7cU
	wrUuIvGTjqRa4vVuGX4Hyzns8FPOI2jDvYRU4wJTQ7ol2v/++8s7RcZI3Q2Yp78t6rCsbjaTXUn
	FHA==
X-Received: from wrvw10.prod.google.com ([2002:a5d:544a:0:b0:43e:a8da:c95a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3109:b0:43d:7aa8:f64e
 with SMTP id ffacd0b85a97d-44649c995b6mr4775338f8f.32.1777372216035; Tue, 28
 Apr 2026 03:30:16 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:06 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-7-tabba@google.com>
Subject: [PATCH 6/8] KVM: arm64: Propagate stage-2 map failure on host->guest donation
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
X-CRM114-CacheID: sfid-20260428_033018_522855_25642D1E 
X-CRM114-Status: GOOD (  16.04  )
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

__pkvm_host_donate_guest() flips the host stage-2 PTE for the donated
page to a non-valid annotation (KVM_HOST_INVALID_PTE_TYPE_DONATION,
owner =3D PKVM_ID_GUEST) via host_stage2_set_owner_metadata_locked()
and then calls kvm_pgtable_stage2_map() to install the matching guest
stage-2 mapping. The map's return value was wrapped in WARN_ON() and
otherwise discarded.

At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it expands
to a BRK that enters the invalid-host-el2 vector and branches to
hyp_panic(), declared __noreturn. WARN_ON of a reachable failure at
EL2 is a panic primitive, not a debug aid.

kvm_pgtable_stage2_map() can fail in reachable ways even at PAGE_SIZE
granularity: __pkvm_host_donate_guest() verifies PKVM_NOPAGE for the
guest IPA before the map, meaning no valid stage-2 entry exists. The
walker must allocate new page-table pages from the vcpu memcache to
install the mapping, returning -ENOMEM if exhausted. The host
controls the vcpu memcache via the topup interface, so an
under-provisioned donation request converts a recoverable error into
a fatal hyp panic.

Capture the stage-2 map return value and propagate it. The walker
may have installed partial leaf entries for the IPA before failing,
so unmap the range to clear them; otherwise the guest would retain
stage-2 access to a page the host is about to reclaim as
PKVM_PAGE_OWNED. Then roll back the host stage-2 mutation: the only
forward mutation is host_stage2_set_owner_metadata_locked() flipping
the host vmemmap from PKVM_PAGE_OWNED to PKVM_NOPAGE and the host
stage-2 PTE from idmap to invalid+annotation.
host_stage2_set_owner_locked(_, _, PKVM_ID_HOST) restores both.

The rollback calls host_stage2_set_owner_locked() under WARN_ON.
This is the correct use: host_stage2_set_owner_metadata_locked()
just wrote the host leaf PTE as an invalid+annotation entry, so the
reverse idmap rewrite cannot require new page-table allocation =E2=80=94 it
rewrites the leaf in-place. The WARN_ON asserts an impossible state
under correct EL2 execution, semantically distinct from the misuse
being fixed.

Fixes: 1e579adca177 ("KVM: arm64: Introduce __pkvm_host_donate_guest()")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 7044913a0758..b8c57a95e9bf 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1391,9 +1391,30 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struc=
t pkvm_hyp_vcpu *vcpu)
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
+		 * Stage-2 map can fail mid-walk (e.g. -ENOMEM from the
+		 * memcache), leaving partial leaf entries installed in the
+		 * guest stage-2. Tear them down before rolling back the host
+		 * stage-2; otherwise the guest would retain access to a page
+		 * the host is about to reclaim as PKVM_PAGE_OWNED.
+		 */
+		kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+
+		/*
+		 * Roll back the donation annotation applied above by
+		 * host_stage2_set_owner_metadata_locked() (host vmemmap
+		 * PKVM_NOPAGE -> PKVM_PAGE_OWNED, host stage-2 PTE
+		 * invalid+annotation -> idmap). The leaf PTE was just
+		 * installed by the forward call, so reinstating the idmap
+		 * rewrites it without needing fresh page-table pages from
+		 * host_s2_pool.
+		 */
+		WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	}
=20
 unlock:
 	guest_unlock_component(vm);
--=20
2.54.0.545.g6539524ca2-goog


