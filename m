Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6746CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q67DNBKcuffmWspv6LvVXCmA21SteXLC22ebhEgdn1U=; b=I+YOegSj0aMAJUrNF7d+KrOiyz
	ooX8Ov92sT0956ozEB1pxCoXkzbT0xC6s5ZCoqAjvj7zFlDu0QZhc3BSi6QgvZKRUK0VYJlIjqoRV
	izKwOEQetSI4erX1eHW508Muyp+ti3rWWc229KcI7koq78s5ZYUd5ecpU3NdYsvikPynSRyS4eCtY
	71Z1V4M+rtu0Fc72ubTDf17ud46Cr9i7Em86agvh8EnZQ3CRTjMLiTfkIopglPSnq79A59NMJqQAZ
	6Wk2aBZvsQXZbm69jm+gh1Yj1WExMNjRbmniDBBJyUPmHqJ7CH4Er9njEIKRNwMm4sB8eOnJp8naa
	vfqGlxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWcu-0000000Doqz-2fE9;
	Tue, 02 Jun 2026 21:26:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWcs-0000000DoqZ-3PDt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:26:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CED9A6012B;
	Tue,  2 Jun 2026 21:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBC41F00893;
	Tue,  2 Jun 2026 21:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780435577;
	bh=Q67DNBKcuffmWspv6LvVXCmA21SteXLC22ebhEgdn1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mdbJmsmkEsdF6WXBnuWjh113rOwL2Pkj8cahrG8MIion6Mz4kplBkEhwPrDD33eDD
	 znJSL3Bibb+P0LWtHqZVhkaYTTlsjFLBbn+TB7WYFekuQYnB6/BA0xquWaFJL5DHPn
	 TuwV9LJLjB8JHgjfzUrsFuUHGOQpbKFa+5fp+uG1pxjBjrnB9SODF/YTjNxUg7ymZt
	 HQ8g4hoCHHaBwCoFvYsf8ubM69aIgs9gl+gLeVh5B6quLPTQTFmjCV6bU2eGkCAFn7
	 PDwfb2rpskRTXn+L5A43fU6kavrSI3fkI7tESb84CJ7qEImG5/D25t8R64BdT3qupN
	 Hb7Xbj58pX/sw==
Date: Tue, 2 Jun 2026 14:26:16 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic-its: Serialize translation cache
 invalidation under its_lock
Message-ID: <ah9KeH8bFl8NOveO@kernel.org>
References: <ah6Lsi4MfKUU6wBR@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah6Lsi4MfKUU6wBR@v4bel>
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

Hi Hyunwoo,

Thanks for respinning.

On Tue, Jun 02, 2026 at 04:52:18PM +0900, Hyunwoo Kim wrote:
> @@ -607,17 +609,16 @@ void vgic_its_invalidate_all_caches(struct kvm *kvm)
>  	struct kvm_device *dev;
>  	struct vgic_its *its;
>  
> -	rcu_read_lock();
> +	guard(mutex)(&kvm->lock);

Urgh, entirely my mistake but we can get here holding the vcpu->mutex
which is an ordering bug. We can defer the locking cleanup as a long
term fix (which I still want) and take what you had before in v1.

Sorry for the noise.

Thanks,
Oliver

> -	list_for_each_entry_rcu(dev, &kvm->devices, vm_node) {
> +	list_for_each_entry(dev, &kvm->devices, vm_node) {
>  		if (dev->ops != &kvm_arm_vgic_its_ops)
>  			continue;
>  
>  		its = dev->private;
> +		guard(mutex)(&its->its_lock);
>  		vgic_its_invalidate_cache(its);
>  	}
> -
> -	rcu_read_unlock();
>  }
>  
>  int vgic_its_resolve_lpi(struct kvm *kvm, struct vgic_its *its,
> @@ -1725,8 +1726,10 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
>  		goto out;
>  
>  	its->enabled = !!(val & GITS_CTLR_ENABLE);
> -	if (!its->enabled)
> +	if (!its->enabled) {
> +		guard(mutex)(&its->its_lock);
>  		vgic_its_invalidate_cache(its);
> +	}
>  
>  	/*
>  	 * Try to process any pending commands. This function bails out early
> -- 
> 2.43.0
> 

