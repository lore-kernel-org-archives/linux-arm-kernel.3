Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37626C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 05:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMEh+mBSqy4Q1wN+hrKY0hGwxwWyjQSlhoS+yh/qIgk=; b=Rt148nKnyokJiB4IZsAAmh7J4p
	lFbczEdtrBZrfaep/IeRs3RaufsY5dK5ZSlpm22+69uZ9I0oZBNn13guziBqaSK1aozYiKTKbeVdM
	OyOz3zLaYGr1HukdiyhvmQR4x+rId6yo0GJXKrzTTAbfVZuk6CcAWYi8fLcI30D7Xr0D1/QHBVJ8B
	SSzjhx8fRiuiZeWbMhSAaA3vrGuk1hr0KNg5EQpxEwZB7LScvjMBfZzyqEKZdGo4geYfdpnLfpMtA
	G635kDxPB2nfdEuoQ0mJQFEY3dE51aVShVr7LxKPL/qT0PAzAt1BPD3uz1jZuR3N42LrkhbJoM/JX
	z0KvskHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfUn-0000000BmLt-3Yge;
	Fri, 31 Jul 2026 05:09:21 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfUk-0000000BmLV-2pUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 05:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785474558; x=1817010558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrV1ZuArq7jUJFUzuZdIkzToe/yL0yOxpBMWNWx//uc=;
  b=PVrshLOxZBYaQd2XkIUcyTL/Xv+sTSLC5/YTaGBEoFclqQHN2gyJiNMG
   ChFqNXW3bk2WK1K8KhrB56Ws4lon14+ZdSzYwVoF+0FnGLK8n8yqrxQ/O
   cwDDwNA+uudN97Xo6jDX3jg/XXzKslXFB9Jy+isHKo7O3ambH9+jQ3VVI
   7Q2wS+iLT7xx0Oqr0O0e3vpKnOwJwt1o/U94gIi+G8SVygqQ+c+y6acMY
   Kqg+lxHmoP9RrimaGYgVPnb/fZ/S9Tm1iU8jhpjXg7Ekat+69C0mU26q9
   w7dgrVD7UbelryT9JHukICLDPmEharDwvKdXERcdcDuIZmCyMxeoQ5+iM
   Q==;
X-CSE-ConnectionGUID: Mqd0eUp3RwqfXHYKDEojeg==
X-CSE-MsgGUID: /QyUUr6XS/ioNl7Cu+Qo0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="249229723"
X-IronPort-AV: E=Sophos;i="6.25,195,1779116400"; 
   d="scan'208";a="249229723"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 14:09:14 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4353142A309
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 05:09:14 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EC230102FBA9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 05:09:13 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.10.122.81])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with SMTP id BBE931005AEA;
	Fri, 31 Jul 2026 05:09:07 +0000 (UTC)
Date: Fri, 31 Jul 2026 14:09:06 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
Message-ID: <amwrnJ1KhllC-gVu@FCCLS0092175.localdomain>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-2-enju.kohei@fujitsu.com>
 <46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_220919_316416_F3D61422 
X-CRM114-Status: GOOD (  40.80  )
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

On 07/29 12:47, Suzuki K Poulose wrote:
> Hello
> 
> Thanks for sending the patch. Please find my comments inline below.
> 
> 
> On 24/07/2026 10:40, Kohei Enju wrote:
> > Introduce the KVM_ARM_RMI_CONFIG ioctl to allow userspace to configure
> > Realm VM parameters before the Realm is created.
> 
> This approach is something we tried in the past. Another option is to
> add these as kvm_device_attr for the KVM VM, under a new group, e.g.,
> KVM_ARM_VM_RMI_CTRL and add the following attributes :
> 
> KVM_ARM_VM_RMI_CTRL_RPV 		-> Realm Personalization Value
> KVM_ARM_VM_RMI_CTRL_MEASUREMENT_ALGO	-> Measuerment algo
> KVM_ARM_VM_RMI_CTRL_MEC_PRIVATE		-> Private MEC Policy. By default to shared
> ?

Hi Suzuki, thanks for suggesting another option. That looks good to me,
and I'd be happy with either approach.
Anyway I'd like to wait for feedback from the maintainers and other
reviewers.

Thanks,
Kohei

> 
> 
> Marc, Oliver, thoughts ?
> 
> Cheers
> Suzuki
> 
> > 
> > Currently, ARM_RMI_CFG_MEC_POLICY is the only supported configuration
> > item. Its value can be ARM_RMI_MEC_POLICY_SHARED or
> > ARM_RMI_MEC_POLICY_PRIVATE. Reject the private policy if the platform
> > does not support private MECs.
> > 
> > If userspace does not explicitly configure the MEC policy,
> > ARM_RMI_MEC_POLICY_SHARED is used by default.
> 
> 
> 
> > 
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >   Documentation/virt/kvm/api.rst   | 29 +++++++++++++++++++++++++++++
> >   arch/arm64/include/asm/kvm_rmi.h |  4 ++++
> >   arch/arm64/kvm/arm.c             |  9 +++++++++
> >   arch/arm64/kvm/rmi.c             | 29 +++++++++++++++++++++++++++++
> >   drivers/firmware/arm_rmm/rmi.c   |  8 ++++++--
> >   include/linux/arm-rmi-cmds.h     |  1 +
> >   include/uapi/linux/kvm.h         | 17 +++++++++++++++++
> >   7 files changed, 95 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 85bec9b4f021..e1c660e5eb34 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6690,6 +6690,35 @@ populated data is hashed and added to the guest's Realm Initial Measurement
> >   (RIM) stored by the RMM. This can then be retrieved by the guest (using the RSI
> >   interface) to present to an attestation server.
> > +4.147 KVM_ARM_RMI_CONFIG
> > +------------------------
> > +
> > +:Capability: KVM_CAP_ARM_RMI
> > +:Architectures: arm64
> > +:Type: vm ioctl
> > +:Parameters: struct kvm_arm_rmi_config (in)
> > +:Returns: 0 on success, < 0 on error
> > +
> > +::
> > +
> > +  struct kvm_arm_rmi_config {
> > +       __u32 cfg;
> > +       union {
> > +               /* cfg == ARM_RMI_CFG_MEC_POLICY */
> > +               __u8 mec_policy;
> > +
> > +               /* Fix the size of the union */
> > +               __u8 reserved[256];
> > +       };
> > +  };
> > +
> > +Configures parameters of a Realm VM before the Realm is created.
> > +
> > +Currently, `ARM_RMI_CFG_MEC_POLICY` is the only supported configuration item.
> > +`mec_policy` must be either `ARM_RMI_MEC_POLICY_SHARED` or
> > +`ARM_RMI_MEC_POLICY_PRIVATE`. `ARM_RMI_MEC_POLICY_PRIVATE` is not supported if
> > +no private MEC is available on the platform.
> > +
> >   .. _kvm_run:
> >   5. The kvm_run structure
> > diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> > index 420e99fca07e..721033b132e1 100644
> > --- a/arch/arm64/include/asm/kvm_rmi.h
> > +++ b/arch/arm64/include/asm/kvm_rmi.h
> > @@ -60,6 +60,7 @@ enum realm_state {
> >    * @ia_bits: Number of valid Input Address bits in the IPA
> >    * @stage2_unmapped: The Realm stage-2 mappings have been removed
> >    * @rtts_destroyed: The non-root RTTs have been torn down
> > + * @mec_policy: MEC policy for the Realm VM
> >    */
> >   struct realm {
> >   	void *rd;
> > @@ -76,6 +77,7 @@ struct realm {
> >   	unsigned int ia_bits;
> >   	bool stage2_unmapped;
> >   	bool rtts_destroyed;
> > +	unsigned int mec_policy;
> >   };
> >   /**
> > @@ -115,6 +117,8 @@ struct kvm_arm_rmi_populate;
> >   int kvm_arm_rmi_populate(struct kvm *kvm,
> >   			 struct kvm_arm_rmi_populate *arg);
> > +struct kvm_arm_rmi_config;
> > +int kvm_arm_rmi_config(struct kvm *kvm, struct kvm_arm_rmi_config *arg);
> >   void kvm_realm_unmap_range(struct kvm *kvm,
> >   			   unsigned long ipa,
> >   			   unsigned long size,
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 3862db30779f..17302ba2844c 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2169,6 +2169,15 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> >   			return -EFAULT;
> >   		return ret;
> >   	}
> > +	case KVM_ARM_RMI_CONFIG: {
> > +		struct kvm_arm_rmi_config cfg;
> > +
> > +		if (!kvm_is_realm(kvm))
> > +			return -ENXIO;
> > +		if (copy_from_user(&cfg, argp, sizeof(cfg)))
> > +			return -EFAULT;
> > +		return kvm_arm_rmi_config(kvm, &cfg);
> > +	}
> >   	default:
> >   		return -EINVAL;
> >   	}
> > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > index 06cc85fb5092..629dea5e8c47 100644
> > --- a/arch/arm64/kvm/rmi.c
> > +++ b/arch/arm64/kvm/rmi.c
> > @@ -572,6 +572,9 @@ static int realm_create_rd(struct kvm *kvm)
> >   	if (kvm_lpa2_is_enabled())
> >   		params->flags0 |= RMI_REALM_PARAM_FLAG_LPA2;
> > +	params->flags0 |= FIELD_PREP(RMI_REALM_PARAM_FLAG_MEC_POLICY,
> > +				     realm->mec_policy);
> > +
> >   	r = realm_init_sve_param(kvm, params);
> >   	if (r)
> >   		goto out_undelegate_tables;
> > @@ -1155,6 +1158,30 @@ int kvm_arm_rmi_populate(struct kvm *kvm,
> >   	return ret;
> >   }
> > +int kvm_arm_rmi_config(struct kvm *kvm, struct kvm_arm_rmi_config *cfg)
> > +{
> > +	guard(mutex)(&kvm->arch.config_lock);
> > +
> > +	if (kvm_realm_state(kvm) != REALM_STATE_NONE)
> > +		return -EBUSY;
> > +
> > +	switch (cfg->cfg) {
> > +	case ARM_RMI_CFG_MEC_POLICY:
> > +		if (cfg->mec_policy != ARM_RMI_MEC_POLICY_SHARED &&
> > +		    cfg->mec_policy != ARM_RMI_MEC_POLICY_PRIVATE)
> > +			return -EINVAL;
> > +
> > +		if (cfg->mec_policy == ARM_RMI_MEC_POLICY_PRIVATE &&
> > +		    rmi_mec_count() == 0)
> > +			return -EOPNOTSUPP;
> > +
> > +		kvm->arch.realm.mec_policy = cfg->mec_policy;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >   static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
> >   {
> >   	struct kvm *kvm = vcpu->kvm;
> > @@ -1474,6 +1501,8 @@ int kvm_init_realm(struct kvm *kvm)
> >   {
> >   	struct realm *realm = &kvm->arch.realm;
> > +	realm->mec_policy = ARM_RMI_MEC_POLICY_SHARED;
> > +
> >   	realm->params = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
> >   	realm->sro = kmalloc_obj(*realm->sro);
> >   	if (!realm->params || !realm->sro) {
> > diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> > index d0c083bdf251..e9632c35e7db 100644
> > --- a/drivers/firmware/arm_rmm/rmi.c
> > +++ b/drivers/firmware/arm_rmm/rmi.c
> > @@ -14,8 +14,7 @@
> >   static bool arm64_rmi_is_available;
> > -/* Currently only the first 2 registers are used by Linux */
> > -#define RMI_FEAT_REG_COUNT	2
> > +#define RMI_FEAT_REG_COUNT	5
> >   static __ro_after_init unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT];
> >   unsigned long rmi_feat_reg(unsigned long id)
> > @@ -27,6 +26,11 @@ unsigned long rmi_feat_reg(unsigned long id)
> >   }
> >   EXPORT_SYMBOL_GPL(rmi_feat_reg);
> > +u64 rmi_mec_count(void)
> > +{
> > +	return u64_get_bits(rmi_feat_reg(4), RMI_FEATURE_REGISTER_4_MEC_COUNT);
> > +}
> > +
> >   int rmi_delegate_range(phys_addr_t phys,
> >   		       unsigned long size,
> >   		       phys_addr_t *out_phys)
> > diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> > index 138983ab4e3c..5236600421c6 100644
> > --- a/include/linux/arm-rmi-cmds.h
> > +++ b/include/linux/arm-rmi-cmds.h
> > @@ -28,6 +28,7 @@ struct rmi_sro_state {
> >   };
> >   unsigned long rmi_feat_reg(unsigned long id);
> > +u64 rmi_mec_count(void);
> >   int rmi_delegate_range(phys_addr_t phys, unsigned long size,
> >   		       phys_addr_t *out_phys);
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index adee3936d6ae..46e62327957c 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1704,4 +1704,21 @@ struct kvm_arm_rmi_populate {
> >   	__u32 reserved;
> >   };
> > +#define KVM_ARM_RMI_CONFIG     _IOW(KVMIO, 0xd8, struct kvm_arm_rmi_config)
> > +
> > +#define ARM_RMI_CFG_MEC_POLICY		0
> > +#define ARM_RMI_MEC_POLICY_SHARED	0
> > +#define ARM_RMI_MEC_POLICY_PRIVATE	1
> > +
> > +struct kvm_arm_rmi_config {
> > +	__u32 cfg;
> > +	union {
> > +		/* cfg == ARM_RMI_CFG_MEC_POLICY */
> > +		__u8 mec_policy;
> > +
> > +		/* Reserve space for future configuration payloads. */
> > +		__u8 reserved[256];
> > +	};
> > +};
> > +
> >   #endif /* __LINUX_KVM_H */
> 

