Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E1CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa3sqwAfHWDJfAzPcUpQ5Gk/NxgBvpG/vZ758TZknkk=; b=dD0tekekYTacx3XsUVkdTUHJTw
	PczSdYeRkv1Ajfsd8A3CjJmzPjzzj7/r5dihBfIEnbeq6fnufC/fI3OUTKANl+ZAu2PXuJXMEAPcW
	/4zLarfjvPiSBQIi6cIDRZdt3P9EO8zJ8WDJSyzWr8A1h9B++iQxqN+G4O+0DslC0YUbkwNkZQEGY
	9Kuft9m4tifMrsuQJwRgTJzWkyjBjGDoPR11NvALzm9exC2nGKCIEvBa+kvjcROBmw7Qyd9NcOVff
	ckq/FhT7e2AUmsb7TW2G/B/ofb67T9MHqsP//dvWVPi1ZbTe5b4Q8qNnk7E1rTYtxd1IOAD6pw5Pw
	i6Rdaucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOQF-0000000DDXC-1Lef;
	Mon, 11 May 2026 11:03:39 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOQB-0000000DDV5-3uBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778497409; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=aa3sqwAfHWDJfAzPcUpQ5Gk/NxgBvpG/vZ758TZknkk=;
	b=HeHc7WmPWlOvU4672u+Sesdt63upX9o1q+AhebanqjwjjpDt/Lq8ZmvAX6EYqI7xKliAe8H33iMTFA9lzynFUTA7rCe0wC7TOZvj81m2XS5TMJYVGxEnNuAZGVAm+fmnBVMSK75PF/jA39cSbjD/cxsGQgxv+7OpRZ07IUGvHRE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X2iOJIK_1778497405;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X2iOJIK_1778497405 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 May 2026 19:03:26 +0800
Date: Mon, 11 May 2026 19:03:25 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Cameron <jic23@kernel.org>, 
	Eric Auger <eric.auger@redhat.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Maxim Levitsky <mlevitsk@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [RFC PATCH] KVM: arm64: vgic: Skip vCPU trylock for pre-init
 register access
Message-ID: <3ijnoudux4iyddpd25yr53s2zqrslplixjqfod225ix43y4z4a@heoklijpq45f>
References: <6564c8b967948e30a8d3f35b6ef5de79dd5feeb7.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6564c8b967948e30a8d3f35b6ef5de79dd5feeb7.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_040336_785695_0EE732C8 
X-CRM114-Status: GOOD (  31.74  )
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

On Sun, May 10, 2026 at 11:11:43PM +0800, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> When creating a VM, userspace sets pre-init distributor registers such
> as GICD_IIDR before the VGIC is initialized.
>
> Strictly speaking there's no reason this couldn't be done at VM creation
> time before any vCPUs exist at all, but the design of the userspace API
> does require vCPU0 to have been created, as the system-wide registers
> are effectively accessed via vCPU0.
>
> So a VMM can't just set the IIDR at startup before spawning vCPU threads;
> it has to be done once the vCPUs are being created.
>
> However, kvm_trylock_all_vcpus() makes it unreliable by causing spurious
> -EBUSY failures if any vCPU cannot be locked. So userspace is forced to
> create the vCPUs (well, at least vCPU0), and is then forced to have a
> full synchronization point and quiesce them all in order to reliably set
> the IIDR.
>
> To slightly reduce the pain of all this, skip the trylock when the VGIC
> is not yet initialized. There is no need to lock the vCPUs if they can't
> be accessing it anyway.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> Other options would include making it possible to set the IIDR before
> creating any vCPUs, either by creating a new device-level attribute or
> special-casing it not to require vCPU0 for DIST_REGS that aren't really
> associated to a vCPU.
>
> Deprecating kvm_trylock_all_vcpus() and killing every user of it with
> fire would also be a good option, perhaps... :)
>
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 38 ++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> index a96c77dccf35..e17ea9f07f5f 100644
> --- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
> +++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> @@ -540,7 +540,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
>  	struct vgic_reg_attr reg_attr;
>  	gpa_t addr;
>  	struct kvm_vcpu *vcpu;
> -	bool uaccess;
> +	bool uaccess, vcpus_locked = false;
>  	u32 val;
>  	int ret;
>
> @@ -566,18 +566,37 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
>  			return -EFAULT;
>  	}
>
> +	if (!vgic_initialized(dev->kvm) && !reg_allowed_pre_init(attr))
> +		return -EBUSY;
> +
>  	mutex_lock(&dev->kvm->lock);
>
> -	if (kvm_trylock_all_vcpus(dev->kvm)) {
> -		mutex_unlock(&dev->kvm->lock);
> -		return -EBUSY;
> +	/*
> +	 * Pre-init registers (e.g. GICD_IIDR) don't need vCPU quiescence
> +	 * since the VGIC isn't live yet.  Skip the trylock to avoid spurious
> +	 * -EBUSY when vCPU threads happen to be running.
> +	 */
> +	if (vgic_initialized(dev->kvm)) {
> +		if (kvm_trylock_all_vcpus(dev->kvm)) {
> +			mutex_unlock(&dev->kvm->lock);
> +			return -EBUSY;
> +		}
> +		vcpus_locked = true;
>  	}
> -
>  	mutex_lock(&dev->kvm->arch.config_lock);
>
> -	if (!(vgic_initialized(dev->kvm) || reg_allowed_pre_init(attr))) {
> -		ret = -EBUSY;
> -		goto out;

Hi David,

> +	/*
> +	 * If the VGIC becomes initialized between the above check and taking
> +	 * config_lock, drop config_lock to lock the VCPUS.
> +	 */
> +	if (vgic_initialized(dev->kvm) && !vcpus_locked) {
> +		mutex_unlock(&dev->kvm->arch.config_lock);
> +		if (kvm_trylock_all_vcpus(dev->kvm)) {
> +			mutex_unlock(&dev->kvm->lock);
> +			return -EBUSY;
> +		}
> +		mutex_lock(&dev->kvm->arch.config_lock);
> +		vcpus_locked = true;

Question: Why not do vgic_initialized(dev->kvm) and
reg_allowed_pre_init(attr) checking after take config_lock,
and depends on the checking result to decide trylocak all
vcpus or not ?

>  	}
>
>  	switch (attr->group) {
> @@ -612,7 +631,8 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
>
>  out:
>  	mutex_unlock(&dev->kvm->arch.config_lock);
> -	kvm_unlock_all_vcpus(dev->kvm);
> +	if (vcpus_locked)
> +		kvm_unlock_all_vcpus(dev->kvm);
>  	mutex_unlock(&dev->kvm->lock);
>
>  	if (!ret && uaccess && !is_write) {
> --
> 2.43.0
>
>

