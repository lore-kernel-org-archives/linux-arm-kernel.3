Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ey1jnJ5S;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j64q8qUb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5NABG2AiXntzQQhgrbFs5uOv8MiJIKrNTvyQWAjpfGM=; b=Ey1jnJ5Sb7CmVp
	pmvlcPNUcbNVRvtnQebs6uWVtoBYOvpQ3jRyoO9G7C/JrOQ1BI6wRl1f5cohkOUq/RifxkrLVgl7s
	9GW5svNusjTq3hZSpxRP9AasPUJkajaQpzEUS2w2P3CIE1mB0R0m9j5oyc9Rl73a5HuxzpMfQSpRF
	IYYlKSi9Hv1rny/uNX9xIZ2KadMJCyizlhgLmTaG5HEzvPknGvWYiCfmknaZUax1f0G0/ncOiewNS
	khSebB+B68Td7NRz3Xa7zwMVLWJVhxbiZ7k4L5BvmG5BCpyancLB3Uh9F/OOaehBSuuXMjJHr22Xt
	Ib++aubKzdxH8JoJmryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0f9-00000006jaV-28eJ;
	Wed, 28 Oct 2026 10:13:43 +0000
Received: from out-205.mta1.migadu.com ([95.215.58.205] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0f2-00000006jXy-1iO6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:13:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kg3kdJ38Ft3AD46ZxOYLXC0C0yujn9suVYw9Z8g/U9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793182414; v=1; x=1793787214;
 b=j64q8qUbnIImZVnnR94EjYfCqijHtVApq4tBd9c7UecgpowHQdKQ0YVAzh/473sxqNm+N3Eb
 RgxM1RTMOfqkd17Ph5ETyzwZ4fygmIS+uFy56vYlIutGl2koa4ScNG4rNMHmaUpq29QVVBRNvmq
 j1kUINqeL81wTs9XPrBqc1Zs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8e770c70f83dabeb;
	Wed, 28 Oct 2026 10:13:34 +0000
X-Mizu-Trace-ID: 8e770c70f83dabeb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
Date: Wed, 28 Oct 2026 10:13:18 +0000
Message-ID: <20261028101318.2170928-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028101318.2170928-1-fuad.tabba@linux.dev>
References: <20261028101318.2170928-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_031336_610784_6CA0272E 
X-CRM114-Status: GOOD (  12.39  )
X-Spam-Score: -2.1 (--)
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

Since commit c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to
write GICD_TYPER2.nASSGIcap"), userspace can disable vPE allocation for
a VM on a GICv4.1 host with vSGIs by clearing nASSGIcap before the vgic
is initialised. vgic_init() then skips vgic_v4_init(), and
kvm_vgic_dist_destroy() skips vgic_v4_teardown(). vgic_its_create()
still calls vgic_v4_init() for an ITS created after the vgic is
initialised, though, and vgic_v4_init() allocates the vPEs and requests
a doorbell IRQ for each vCPU. Destroying the VM leaks them, and leaves
each doorbell handler registered with a vCPU that's about to be freed.

Move the part of vgic_supports_direct_msis() that doesn't depend on the
ITS into vgic_supports_vpes(), together with vgic_v4_init()'s GICv3
check. Gate vgic_v4_init() on it rather than on
vgic_supports_direct_irqs(), which reads has_its before
vgic_its_create() sets it. vgic_supports_direct_msis() returns what it
did before, since vgic_has_its() is already false for a non-GICv3 VM.

Fixes: c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
Suggested-by: Oliver Upton <oupton@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 9 +++++++--
 arch/arm64/kvm/vgic/vgic-v4.c      | 2 +-
 arch/arm64/kvm/vgic/vgic.h         | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d83019..a60697238a7a7 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -48,7 +48,7 @@ bool vgic_has_its(struct kvm *kvm)
 	return dist->has_its;
 }
 
-bool vgic_supports_direct_msis(struct kvm *kvm)
+bool vgic_supports_vpes(struct kvm *kvm)
 {
 	/*
 	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
@@ -58,7 +58,12 @@ bool vgic_supports_direct_msis(struct kvm *kvm)
 	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
 		return false;
 
-	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
+	return kvm_vgic_global_state.has_gicv4 && vgic_is_v3(kvm);
+}
+
+bool vgic_supports_direct_msis(struct kvm *kvm)
+{
+	return vgic_supports_vpes(kvm) && vgic_has_its(kvm);
 }
 
 bool system_supports_direct_sgis(void)
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index a01de4de608a6..0a4b9a74425b4 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
+	if (!vgic_supports_vpes(kvm))
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b71d486ae5145..7fc29a395a7db 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -500,6 +500,7 @@ static inline bool vgic_host_has_gicv5(void)
 }
 
 bool system_supports_direct_sgis(void);
+bool vgic_supports_vpes(struct kvm *kvm);
 bool vgic_supports_direct_msis(struct kvm *kvm);
 bool vgic_supports_direct_sgis(struct kvm *kvm);
 
-- 
2.47.3


