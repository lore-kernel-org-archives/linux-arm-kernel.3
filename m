Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAC606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CNYadqja;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVYlDZxA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Iz8nEeRUoSx59BuYet9dNiyHKe/fPrgbXO6zBJt1wYU=; b=CNYadqjaUF0a//1YbLwyBWyMEp
	h4kebNrtys/I0BspiMtMc0Eo7WaEQGHQ2rYrxbFWRA0Qnt1vDaqJQW7K/6viCuENXfvPY5rqf3r+I
	ROqduZ9/okAF9MJynMZjny1ldB2l13/gI5JbejomwK8ieypjzH1cGEzTS6PbqqoutQwTv634bDDwU
	FgBOdR4irWgxESqK6biH21DxVnXdhVex+hhr77szPn6+xsQvMXEEkubZcK/NyZKZ4PJnuLnvt4ubk
	bVjdhNAtI3hqR3MfCCT7pBNqz4Nq4KxWhvBq/gPvx0ZvgYJbvMNs9fNcGma0j2H5EhFZ55oDP8hf5
	Pxb/dQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQXV-00000003Akp-30A5;
	Mon, 26 Oct 2026 19:39:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQXU-00000003Aki-2PIt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:39:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74BA7601EF;
	Mon, 26 Oct 2026 19:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED12B1F01825;
	Mon, 26 Oct 2026 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793043563;
	bh=Iz8nEeRUoSx59BuYet9dNiyHKe/fPrgbXO6zBJt1wYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVYlDZxAsoEZDhQ1SN8wVNatwEHENQSAY05RbTkmfvFILekO3ZTUsJBpd/6La9FsX
	 fWathrT5ToN3EwPvWnXF6G00oEC3og7IisJsTcVxMRaSOO7rK4JyN7yF6ukAh2xDbm
	 i2OdwD2yxqXwWw+7CCFuZSMt0DrMhlSdPxpu0X1War4kn/iHShJIpkqXd5yR7s23Pv
	 2TiHkS4SNPeK19GQjB6hmrGLHTXQ9dFnpGTdvA1NYIX8aPeSHhom2vcRstngeSVQ6B
	 /O/xkR4QUlFFa1ZpwKIgT+BULORX1zf8IDIiA+PsekM149JYZ1C2cM2oeUHtBxTyIv
	 wu80iWmo9V2hw==
Date: Mon, 26 Oct 2026 12:39:21 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when
 userspace clears nASSGIcap
Message-ID: <at-saZT_ixQxsZIr@kernel.org>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
 <20261026152639.3926498-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026152639.3926498-3-fuad.tabba@linux.dev>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On Mon, Oct 26, 2026 at 03:26:39PM +0000, Fuad Tabba wrote:
> Since commit c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to
> write GICD_TYPER2.nASSGIcap"), userspace can disable vPE allocation for
> a VM on a GICv4.1 host with vSGIs by clearing nASSGIcap before the vgic
> is initialised. vgic_init() then skips vgic_v4_init(), and
> kvm_vgic_dist_destroy() skips vgic_v4_teardown(). vgic_its_create()
> still calls vgic_v4_init() for an ITS created after the vgic is
> initialised, though, and vgic_v4_init() allocates the vPEs and requests
> a doorbell IRQ for each vCPU. Destroying the VM leaks them, and leaves
> each doorbell handler registered with a vCPU that's about to be freed.
> 
> Rather than gate on vgic_supports_direct_irqs(), which reads has_its
> before vgic_its_create() sets it, check for a cleared nASSGIcap in
> vgic_v4_init().
> 
> Fixes: c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-v4.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
> index a01de4de608a6..12a57921f6af3 100644
> --- a/arch/arm64/kvm/vgic/vgic-v4.c
> +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> @@ -251,6 +251,10 @@ int vgic_v4_init(struct kvm *kvm)
>  	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
>  		return 0; /* Nothing to see here... move along. */
>  
> +	/* Userspace disabled vPE allocation by clearing nASSGIcap */
> +	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
> +		return 0;
> +

Looking at both of the patches now, I'd rather we just fix the
predicates and use those to consistently gate GICv4. Untested as always:

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 9e782a4fea7e..2b22f096a504 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1866,9 +1866,16 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 
 	mutex_lock(&dev->kvm->arch.config_lock);
 
+	/*
+	 * Make an early indication that this VM has an ITS so calls to
+	 * vgic_supports_direct_irqs() work as intended, rolling back state
+	 * if we fail to setup GICv4.
+	 */
+	dev->kvm->arch.vgic.has_its = true;
 	if (vgic_initialized(dev->kvm)) {
 		ret = vgic_v4_init(dev->kvm);
 		if (ret < 0) {
+			dev->kvm->arch.vgic.has_its = false;
 			mutex_unlock(&dev->kvm->arch.config_lock);
 			kfree(its);
 			return ret;
@@ -1893,7 +1900,6 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 	xa_init(&its->translation_cache);
 
 	dev->kvm->arch.vgic.msis_require_devid = true;
-	dev->kvm->arch.vgic.has_its = true;
 	its->enabled = false;
 	its->dev = dev;
 
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d..c65bd8783284 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,8 +248,8 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
-		return 0; /* Nothing to see here... move along. */
+	if (!vgic_supports_direct_irqs(kvm))
+		return 0;
 
 	if (dist->its_vm.vpes)
 		return 0;
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b71d486ae514..bd1614c9ff05 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -509,6 +509,10 @@ static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
 	if (vgic_is_v5(kvm))
 		return true;
 
+	/* GICv2 never supports direct IRQs */
+	if (!vgic_is_v3(kvm))
+		return false;
+
 	return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgis(kvm);
 }
 
-- 
Thanks,
Oliver

