Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0FD60A382B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RlhzDloP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bjQq2tyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1iqiUC774uIz1noqTv66R/pcx1jq2Y3gBT5EkDOI8+U=; b=RlhzDloPfg8NTE
	iMOI15m2SbsKHdjKWlcSAmcI7/FQhmW4C8H83IApFbjnPjgiOdTmmH3X/Mf2WHsQzhzjqXXW7Ii/a
	Oswjj62rZTTPgD3BHAlmTBLBqBlYLwVKhqMTWsF8bGj/P/1gQriirNhZFJ09unJ825CEkGLgrKfsn
	QDJSh3HWfGo6xc64GykxfLanPVh+4nBVjL/SHiq1zAJ4VYNrfEzTNb08Wpsmua3usR9/RMaTSTk2r
	4dIdIeAP+EtuOlZ5770TyEI8/bRF81JENf5W3f2aacJjitbu0Cshs/aI2MVnnRhlA4ISEU41ryEVv
	2H/p9E3rLYdW+keFivdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbjd-00000003uQo-06dr;
	Tue, 27 Oct 2026 07:36:41 +0000
Received: from out-50.mta1.migadu.com ([95.215.58.50] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbjZ-00000003uQF-3VdO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 07:36:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dmqT96w8wTTUeTOZNcr8vlUEdj+NSgO8Wwrd2wCr44Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793086595; v=1; x=1793691395;
 b=bjQq2tyxEe9OTBmG0Dqfb2eCsJWmXyMGMm82E3d8RYDnkAPLIxekObBnzI0Gj+Fo7wI6Y92I
 4Aua35paKGksXn8hML4IsMX2SEiQLAhuPembjW9cFF6PVkL4OsC0novNkOoisMmtfEFTbUSuWg/
 fUcPWee6J4fMrnmpzLSp5d+E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 77ba2e4eb353bbfd;
	Tue, 27 Oct 2026 07:36:35 +0000
X-Mizu-Trace-ID: 77ba2e4eb353bbfd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
Date: Tue, 27 Oct 2026 07:36:34 +0000
Message-ID: <20261027073634.440288-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <at-saZT_ixQxsZIr@kernel.org>
References: <at-saZT_ixQxsZIr@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_003638_086397_59B49316 
X-CRM114-Status: GOOD (  20.34  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oliver,

On Mon, 26 Oct 2026 19:39:21 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Looking at both of the patches now, I'd rather we just fix the
> predicates and use those to consistently gate GICv4. Untested as always:

I open coded the nASSGIcap check because vgic_its_create() only sets
has_its after vgic_v4_init(), but the predicate is the better place for
it.

> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
[...]
> @@ -1866,9 +1866,16 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
>  
>          mutex_lock(&dev->kvm->arch.config_lock);
>  
> +        /*
> +         * Make an early indication that this VM has an ITS so calls to
> +         * vgic_supports_direct_irqs() work as intended, rolling back state
> +         * if we fail to setup GICv4.
> +         */
> +        dev->kvm->arch.vgic.has_its = true;

This makes vgic_supports_direct_irqs() true for running vCPUs before
vgic_v4_init() has allocated their vPEs. On GICv4.0, a vCPU loaded in
that window hits the WARN_ON(vgic_v4_load()) in vgic_v3_load()
(vpe->irq is still 0). With an msleep() holding vgic_its_create()
there, my reproducer, which creates an ITS while a vCPU runs, hits it
on the FVP. Keeping the store after vgic_v4_init(), where it is today,
avoids that window (diff below).

[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
[...]
> @@ -248,8 +248,8 @@ int vgic_v4_init(struct kvm *kvm)
>  
>          lockdep_assert_held(&kvm->arch.config_lock);
>  
> -        if (!kvm_vgic_global_state.has_gicv4)
> -                return 0; /* Nothing to see here... move along. */
> +        if (!vgic_supports_direct_irqs(kvm))
> +                return 0;

vgic_supports_direct_irqs() is also true for any vGICv5 VM, so with
this, creating an ITS on an initialised one, on a GICv5 host with
legacy support, reaches its_alloc_vcpu_irqs() with no GICv4 irqdomain,
where irq_domain_create_hierarchy() dereferences a NULL vpe_domain_ops.
The diff below keeps the has_gicv4 test.

It gates vgic_v4_init() on the part of vgic_supports_direct_msis()
that doesn't read has_its. That part is false for the GICv2 VM from
patch 1 and for a vGICv5 VM, so the diff drops your vgic.h hunk:

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
index ed236f083f0d7..0a4b9a74425b4 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
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
 

Tested on the FVP (GICv4.0 and GICv4.1): KVM doesn't leak doorbells in
either patch's case, a GICv3 VM still gets its vPEs when the ITS is
created, and the reproducer above doesn't hit the WARN. Does that work
for you? If so, I'll send it as v2.

Cheers,
/fuad

