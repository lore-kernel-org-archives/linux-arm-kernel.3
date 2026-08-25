Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D99BC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cobYJEGb3W53QP2W2mYmmoOXuHeQdtagqN0geH2RpLc=; b=AsRYQVPoTngwp+qIjtsLM+TKo3
	rssIjzsM/+VZA0RXmmaCQEpLprrMIGkiYNHHVuyDpdq4ThQSlf6NVrMUU2TYAlZA191Yr4WeloRDb
	49GxboOdnlwYUVCDuD898ZD4Lv/9Hk9Hb66FDMXraZmCUAHJxiM6MY54IJ9pbBRdqm3l+Ko8bFvvO
	sy8lmOUJOUbdkwjY/RLls/H+GP1vlCxTKIyzByQCx5JXGCB1JC+7Pr2ps7CIOMxYFkJzfbu4alxrQ
	rpTVX9+4uuk4trSeB4FCtOODrwmeBBqWZRVAKut1kdW4Bd/VU7r9QtwzWlA/19PxIHTu/tZXZfNCv
	rVQ9sxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynAt-00000000SM2-1D6H;
	Tue, 25 Aug 2026 09:10:31 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynAq-00000000SL3-1dqV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787649024; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=cobYJEGb3W53QP2W2mYmmoOXuHeQdtagqN0geH2RpLc=;
	b=xNqmxTZiVEbLT04HCD5U5upClW9ZRUMHhLl4E6noisGpdVYuRBpM6sGOyySnxorbLki1ucmQ24Nd0Z6kEeP6+mJM0DM1nb9Ub0pYrevSUJT78GSd/ORd55kft5ZhydLS+9z/ox1UgFemK13atrfsQTUC5NnsA615MLmTkmVb0yc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X9dP6.j_1787649022;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X9dP6.j_1787649022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Aug 2026 17:10:23 +0800
Date: Tue, 25 Aug 2026 17:10:22 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Eric Auger <eauger@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs()
 allocated on failure
Message-ID: <newqqvl3kuyv3tzlmg5gvt6j2bqf4htk4rwotawrhfud4fv3dr@pcd3uodxdsbj>
References: <20260824074245.710955-1-fuad.tabba@linux.dev>
 <20260824074245.710955-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074245.710955-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_021028_617821_AAC33340 
X-CRM114-Status: GOOD (  22.34  )
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

On Mon, Aug 24, 2026 at 08:42:43AM +0800, Fuad Tabba wrote:
> A failure in the its_alloc_vcpu_sgis() loop leaves behind both the SGI
> domains created for the vPEs below the failing index and the vPE irqs
> allocated before the loop, since irq_domain_remove() frees neither. Each
> leaked vPE takes its ITS state with it, a vpe_id and an LPI pending
> table.
>
> Free both from a second label before the existing unwind. With the
> freed pointers now cleared, its_free_sgi_irqs() can skip a vPE with no
> SGI domain and be reused there. The check has to precede the lookup:
> irq_find_mapping(NULL, 0) falls back to irq_default_domain, and the
> live irq it returns would then be freed.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Fixes: 6d31b6ff985d ("irqchip/gic-v4.1: Add VSGI allocation/teardown")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v4.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
> index 754839e409f88..f707a3cb281aa 100644
> --- a/drivers/irqchip/irq-gic-v4.c
> +++ b/drivers/irqchip/irq-gic-v4.c
> @@ -159,6 +159,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
>  	return -ENOMEM;
>  }
>
> +static void its_free_sgi_irqs(struct its_vm *vm);
> +
>  int its_alloc_vcpu_irqs(struct its_vm *vm)
>  {
>  	int vpe_base_irq, i;
> @@ -189,11 +191,14 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
>  		vm->vpes[i]->irq = vpe_base_irq + i;
>  		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
>  		if (ret)
> -			goto err;
> +			goto err_free_irqs;
>  	}
>
>  	return 0;
>
> +err_free_irqs:
> +	its_free_sgi_irqs(vm);
> +	irq_domain_free_irqs(vpe_base_irq, vm->nr_vpes);
>  err:
>  	if (vm->domain) {
>  		irq_domain_remove(vm->domain);
> @@ -215,8 +220,13 @@ static void its_free_sgi_irqs(struct its_vm *vm)
>  		return;
>
>  	for (i = 0; i < vm->nr_vpes; i++) {
> -		unsigned int irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
> +		unsigned int irq;
>
> +		/* irq_find_mapping() falls back to the default domain on NULL. */
> +		if (!vm->vpes[i]->sgi_domain)
> +			continue;
> +
> +		irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
>  		if (WARN_ON(!irq))
>  			continue;
>
> --
> 2.39.5
>

