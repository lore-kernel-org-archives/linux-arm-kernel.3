Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060A31099B32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR5TRJDu25+CrE37x06vwLgFtRqwfJZKgPjD2juAXCE=; b=f4Qtx08LAk/0COavP7YrIUWSkl
	ZWg0CtVQGPkAgeIYXcoIQzIzrJaj34I3p1uyISm7FguBgFB7cojRuplcwzsrJoqQ/PvsRYQwXTOX6
	eix9WnP3Ruxt1jyQ8OsRwbcFmKKSOn0X+k3hJBN+WV7QoggdoD6w/Fia7+vR41M3gq7Bv8iu+qeSw
	lV26MLsfs+/68j0IrCCU22cDDsNfsyl0vSeXHvcZPFyuAJl1qIiGi7VtCuK/el7W9ZhvDpnLL0wfD
	stjaL9cyqwg8IKPAMeKUZL73PgUPbHxSAQh1xM/WsUGZLGxLY3OICcuvohKaqfId4DYAYGjZ5lmgx
	wtJxDvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fCb-0000000DPw0-2xTH;
	Fri, 20 Mar 2026 19:08:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fCZ-0000000DPvf-0ZWA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 19:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E5C94096C;
	Fri, 20 Mar 2026 19:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664ECC4CEF7;
	Fri, 20 Mar 2026 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774033686;
	bh=hubpgunOKqXmTqXQCt/h6pUXQ4Vod13YMoCr7vvGoG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC4yGqB4yeYqXeADGrpxx0K2f3j7IwHZKEMV6bj+hzupr9ZLkVHkBaEhxlFI9bb0N
	 Ecv9rW0Uz7rzFnG/FJnyRR7uM6nQsgsJNJDSBZLkg3Sh0BEc/gTN+KMP0g0ozp/aFd
	 Q4k+i5T5O/HSJ0sJGazw1Iqav/y0hX/9/ulyIv2+QccmEAy1dxwO87IccNcTcEKjnw
	 XAuhnywnhv8nvcK49cY1+i0uhzU9KIhGFp17Z7pseM+K6tZ9rRZH5/030eHux9VDlN
	 kETmXrocVeO4Iq0WTrJ/X/LIaX2cp2SnmNvtqB5kTv0BXigwzldI5yapq0/ct3/S4M
	 MctZs3GyFuQIw==
Date: Fri, 20 Mar 2026 12:08:06 -0700
From: Kees Cook <kees@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Gogul Balakrishnan <bgogul@google.com>,
	Arman Hasanzadeh <armanihm@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] KVM: arm64: vgic: Annotate struct vgic_dist with
 __counted_by_ptr
Message-ID: <202603201158.4EF7FCFF7@keescook>
References: <20260319015418.2871262-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319015418.2871262-1-morbo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_120807_241165_DB8CD169 
X-CRM114-Status: GOOD (  26.35  )
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

On Thu, Mar 19, 2026 at 01:54:10AM +0000, Bill Wendling wrote:
> Add the __counted_by_ptr attribute to the spis pointer field in struct
> vgic_dist. This pointer field points to an array of struct vgic_irq
> elements, and the number of elements is tracked by the nr_spis field
> within the same structure.
> 
> The nr_spis field is initialized in vgic_init() (or earlier via
> userspace) before the spis array is allocated in kvm_vgic_dist_init().
> The nr_spis value remains constant during the lifetime of the spis
> allocation, making it a suitable counter for the array.

This one eluded me briefly, but yeah:

int vgic_init(struct kvm *kvm)
{
        struct vgic_dist *dist = &kvm->arch.vgic;
	...
        /* freeze the number of spis */
        if (!dist->nr_spis)
                dist->nr_spis = VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;

        ret = kvm_vgic_dist_init(kvm, dist->nr_spis);



static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
{
        struct vgic_dist *dist = &kvm->arch.vgic;
	...
        dist->spis = kzalloc_objs(struct vgic_irq, nr_spis, GFP_KERNEL_ACCOUNT);


It seems weird that nr_spis is passed to kvm_vgic_dist_init at all:
there's only 1 caller, and the value is stored in dist->nr_spis
(available through kvm) immediately before the call. For readability,
I'd almost prefer to see:


diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 9b3091ad868c..9e6ca2f04581 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -190,16 +190,15 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 /**
  * kvm_vgic_dist_init: initialize the dist data structures
  * @kvm: kvm struct pointer
- * @nr_spis: number of spis, frozen by caller
  */
-static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
+static int kvm_vgic_dist_init(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu0 = kvm_get_vcpu(kvm, 0);
 	int i;
 
 	dist->active_spis = (atomic_t)ATOMIC_INIT(0);
-	dist->spis = kzalloc_objs(struct vgic_irq, nr_spis, GFP_KERNEL_ACCOUNT);
+	dist->spis = kzalloc_objs(struct vgic_irq, dist->nr_spis, GFP_KERNEL_ACCOUNT);
 	if (!dist->spis)
 		return  -ENOMEM;
 
@@ -211,7 +210,7 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	 * require prior initialization in case of a virtual GICv3 or trigger
 	 * initialization when using a virtual GICv2.
 	 */
-	for (i = 0; i < nr_spis; i++) {
+	for (i = 0; i < dist->nr_spis; i++) {
 		struct vgic_irq *irq = &dist->spis[i];
 
 		irq->intid = i + VGIC_NR_PRIVATE_IRQS;
@@ -401,7 +400,7 @@ int vgic_init(struct kvm *kvm)
 	if (!dist->nr_spis)
 		dist->nr_spis = VGIC_NR_IRQS_LEGACY - VGIC_NR_PRIVATE_IRQS;
 
-	ret = kvm_vgic_dist_init(kvm, dist->nr_spis);
+	ret = kvm_vgic_dist_init(kvm);
 	if (ret)
 		goto out;
 


The other question I'd have (which isn't related to this patch
specifically) is if dist->spis is guaranteed to be NULL before
kvm_vgic_dist_init() is called.

Regardless:

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

> 
> This patch was generated by CodeMender and reviewed by Bill Wendling.
> Tested with the KVM selftests.
> 
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Zenghui Yu <yuzenghui@huawei.com>
> Cc: Gogul Balakrishnan <bgogul@google.com>
> Cc: Arman Hasanzadeh <armanihm@google.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: kvmarm@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: codemender-patching+linux@google.com
> ---
>  include/kvm/arm_vgic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index f2eafc65bbf4..1cca87623d92 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
> @@ -284,7 +284,7 @@ struct vgic_dist {
>  	/* Wants SGIs without active state */
>  	bool			nassgireq;
>  
> -	struct vgic_irq		*spis;
> +	struct vgic_irq		*spis __counted_by_ptr(nr_spis);
>  
>  	struct vgic_io_device	dist_iodev;
>  	struct vgic_io_device	cpuif_iodev;
> -- 
> 2.53.0.851.ga537e3e6e9-goog
> 

-- 
Kees Cook

