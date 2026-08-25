Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDBC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1/3sxKWMwZmvXn0ohFtsHlyP5vLtleCRLjspTUH1BM=; b=goqqktqv782sKE+9d1MGpFhgf7
	SbYcvNKkSaH5YAVVda38aWLX6ZzSSUIr9FtuNBV99pIlJancvKBAZkRry8saenX/na4fWNX6USunw
	evtukeQbSmowTjS9/5sMb/yr/otrDebt/o89HXmAA7d++lLqb2ZZOhj9tUUm4NDkMUrXp0HPLMC4g
	lTmxDN9smjR62D+Vpr2xVJX76+GQ7VJnmbsDAr5EZwUwtwG1A6/OVETQQsNMryJ7yLKTHNHP/O6iF
	Lf2Nz973HdpASo6ePRyfLMOV7c+lA4gH5QMX9nN2jIb0apaC0kb0a/q7OLL7tWjlrQ2BUyPpsFr1u
	EEG4jQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymu1-00000000QdS-1FAd;
	Tue, 25 Aug 2026 08:53:05 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymty-00000000QbX-0742
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787647974; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=b1/3sxKWMwZmvXn0ohFtsHlyP5vLtleCRLjspTUH1BM=;
	b=G+mKkMkAaGELBvFZw1Z9U/YkRTjx1B3GH1e/SS+jeBP+EfpO4JdONZ16IbmPi5/rGcqTTrk6RebtYDg+4Zk67wp3/lt6mysMJwx6yIDOsSWd3pOrq8rJT79aIJ0hfk/NhfdvJ25o/vyIOevmhbDCGROfKjQXlK/v8PFrLXDj3eo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X9dJUmE_1787647973;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X9dJUmE_1787647973 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Aug 2026 16:52:53 +0800
Date: Tue, 25 Aug 2026 16:52:51 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Eric Auger <eauger@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] irqchip/gic-v4: Clear the domain and fwnode
 pointers after freeing them
Message-ID: <xsuxicnwpzpogl7wlh7atdjw75irdd54oytivalf223jfdbfmz@36tvycw2qt6y>
References: <20260824074245.710955-1-fuad.tabba@linux.dev>
 <20260824074245.710955-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074245.710955-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015302_418491_3AC02C2A 
X-CRM114-Status: GOOD (  19.75  )
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

On Mon, Aug 24, 2026 at 08:42:42AM +0800, Fuad Tabba wrote:
> The GICv4 allocation and teardown paths free their irq domains and
> fwnodes but leave the pointers set, and the allocation error paths test
> those pointers before removing them. struct its_vm and struct its_vpe
> are embedded in KVM's per-VM and per-vCPU state, so nothing re-zeroes
> them between two attempts, and an error path taken after an earlier one
> already freed the domain calls irq_domain_remove() on freed memory.

Hi Tabba,

Real nice finding!

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Reaching this takes two allocation failures, one to leave the stale
> pointer behind and one to send the next attempt down the error path.
>
> Fixes: 7de5c0af9c7c ("irqchip/gic-v4: Add per-VM VPE domain creation")
> Fixes: 6d31b6ff985d ("irqchip/gic-v4.1: Add VSGI allocation/teardown")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v4.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
> index 8455b4a5fbb0d..754839e409f88 100644
> --- a/drivers/irqchip/irq-gic-v4.c
> +++ b/drivers/irqchip/irq-gic-v4.c
> @@ -147,10 +147,14 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
>  	return 0;
>
>  err:
> -	if (vpe->sgi_domain)
> +	if (vpe->sgi_domain) {
>  		irq_domain_remove(vpe->sgi_domain);
> -	if (vpe->fwnode)
> +		vpe->sgi_domain = NULL;
> +	}
> +	if (vpe->fwnode) {
>  		irq_domain_free_fwnode(vpe->fwnode);
> +		vpe->fwnode = NULL;
> +	}
>  	kfree(name);
>  	return -ENOMEM;
>  }
> @@ -191,10 +195,14 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
>  	return 0;
>
>  err:
> -	if (vm->domain)
> +	if (vm->domain) {
>  		irq_domain_remove(vm->domain);
> -	if (vm->fwnode)
> +		vm->domain = NULL;
> +	}
> +	if (vm->fwnode) {
>  		irq_domain_free_fwnode(vm->fwnode);
> +		vm->fwnode = NULL;
> +	}
>
>  	return -ENOMEM;
>  }
> @@ -215,6 +223,8 @@ static void its_free_sgi_irqs(struct its_vm *vm)
>  		irq_domain_free_irqs(irq, 16);
>  		irq_domain_remove(vm->vpes[i]->sgi_domain);
>  		irq_domain_free_fwnode(vm->vpes[i]->fwnode);
> +		vm->vpes[i]->sgi_domain = NULL;
> +		vm->vpes[i]->fwnode = NULL;
>  	}
>  }
>
> @@ -224,6 +234,8 @@ void its_free_vcpu_irqs(struct its_vm *vm)
>  	irq_domain_free_irqs(vm->vpes[0]->irq, vm->nr_vpes);
>  	irq_domain_remove(vm->domain);
>  	irq_domain_free_fwnode(vm->fwnode);
> +	vm->domain = NULL;
> +	vm->fwnode = NULL;
>  }
>
>  static int its_send_vpe_cmd(struct its_vpe *vpe, struct its_cmd_info *info)
> --
> 2.39.5
>

