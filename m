Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D977FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww/ubChly3a+w0TKUGvE+813cGKsJXUl46skRo5edjo=; b=h4MXCmc9CNtnd+OSUPEPQVh8am
	UVUgXoat6G/FeOccSVGiI9nAZF1YQLjdpUDMoSEhrbV0fOGBzunwnkAd9zqpozPY05k6xLydalpBz
	2pXJ3JVMmeYRlqYEAxU9q6l26YbgGu3O6OQQ3EzbzkSrjv4g/ZGbz409I0cdDJ3QHXjRqpaZ2N41c
	TsoPICssT7Q8C8G1CD249wpcTljTL4/iDetZYxjJTSyiftSNtL6dJeq3pNcs7Hl+0aLsjlTFzTQj+
	NdkJo2RLYR1OuZoFlrTnXCqNy9J6CM956XhbY5wcN8FpkwfEOaGcr2vqP/Jzr/uw1ZfnYDXPpBePs
	diJ/DIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLWR-0000000HJ9s-0BwM;
	Tue, 05 May 2026 19:33:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLWO-0000000HJ9A-48pq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D12FB41692;
	Tue,  5 May 2026 19:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2202DC2BCB4;
	Tue,  5 May 2026 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009611;
	bh=f7ktUdcZvJc27f8PTHxlczZmATUtC+QYHKgPu9Q4XdI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O03hXGwuP6s7cljp4ececAc3RBgZkK0x3Fytpj8e5KnKhBLhsBfGDXms7YFU62yVa
	 eEicIpkoQBauimSlvLGsLtqBtU3nC0mo7cBNL/uNfv899uHueaHzI5Sbt3u1vzLiko
	 XzPuaG581n1WHt9MbeT61x4Wj+CD+q2YWL8M8oxlRpRYaZXGgZiStqwTkM+K/HLG2v
	 i7as8XvW+eVdzHgylEI5SRMt5Gg36RShifHbXWl+2wS7ix5ibZUPtAWWKWSrwr3y8o
	 pH5I80e3ooAgIu3yNU7OrgwntDpyL8TpXBsTsf+ZNWV6CcUo7TeIvFSsMdNywOeTIe
	 0WuvppwcxI/Sg==
From: Thomas Gleixner <tglx@kernel.org>
To: Rahul Sharma <r-sharma3@ti.com>, peter.ujfalusi@gmail.com,
 vkoul@kernel.org, Frank.Li@kernel.org, nm@ti.com, kristo@kernel.org,
 ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip: ti-sci-inta: add runtime PM and system
 sleep support
In-Reply-To: <20260429174904.4049243-3-r-sharma3@ti.com>
References: <20260429174904.4049243-1-r-sharma3@ti.com>
 <20260429174904.4049243-3-r-sharma3@ti.com>
Date: Tue, 05 May 2026 21:33:28 +0200
Message-ID: <87h5oly7lj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_123333_063075_F8AD8675 
X-CRM114-Status: GOOD (  21.24  )
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

On Wed, Apr 29 2026 at 23:19, Rahul Sharma wrote:

Please use the proper subsystem prefix as documented:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

> Register runtime PM callbacks and enable runtime PM via
> devm_pm_runtime_enable() in probe.
>
> runtime_suspend is a no-op; IRQ routing context is preserved by TI SCI

s/IRQ/Interrupt/

A change log is written in prose and not an aggregation of random
acronyms. This is not twatter.

> firmware across power-gate cycles.
>
> runtime_resume restores VINT_ENABLE_SET for each active event bit,
> skipping IRQs with irqd_irq_masked set to avoid re-enabling
> intentionally disabled interrupts.
>
> System sleep reuses these callbacks via pm_runtime_force_suspend/resume
> as late/early sleep ops. This ensures MMIO writes in runtime_resume
> happen after genpd restores the power domain (dpm_resume_noirq),
> avoiding writes to a powered-off device.

TBH, I fails to decode the above word salad. Please check the above
linked documentation for hints how to structure change logs.

 
> +static int ti_sci_inta_runtime_suspend(struct device *dev)
> +{
> +	return 0;

This clearly lacks a comment why this function is empty, while the
counterpart is not.

> +}
> +
> +static int ti_sci_inta_runtime_resume(struct device *dev)
> +{
> +	struct ti_sci_inta_irq_domain *inta = dev_get_drvdata(dev);
> +	struct ti_sci_inta_vint_desc *vint_desc;
> +	int bit;
> +
> +	mutex_lock(&inta->vint_mutex);

  guard(mutex)(....);

> +	list_for_each_entry(vint_desc, &inta->vint_list, list) {
> +		for_each_set_bit(bit, vint_desc->event_map, MAX_EVENTS_PER_VINT) {
> +			unsigned int virq;
> +			struct irq_data *data;

See 'Variable declarations' in the linked document

> +			virq = irq_find_mapping(vint_desc->domain,
> +						vint_desc->events[bit].hwirq);

No line break required. You have 100 characters.

> +			if (!virq)
> +				continue;
> +			data = irq_get_irq_data(virq);
> +			if (!data || irqd_irq_masked(data))
> +				continue;


This is a blatant abuse of the interrupt internals.

Why can't you keep track of the current state in

    vint_desc->events[bit].XXXXX

and be done with it?

> +			writeq_relaxed(BIT(bit), inta->base +
> +				       vint_desc->vint_id * 0x1000 +
> +				       VINT_ENABLE_SET_OFFSET);

Ditto.

> +		}
> +	}
> +	mutex_unlock(&inta->vint_mutex);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ti_sci_inta_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				     pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(ti_sci_inta_runtime_suspend,
> +			   ti_sci_inta_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id ti_sci_inta_irq_domain_of_match[] = {
>  	{ .compatible = "ti,sci-inta", },
>  	{ /* sentinel */ },
> @@ -736,6 +784,7 @@ static struct platform_driver ti_sci_inta_irq_domain_driver = {
>  	.driver = {
>  		.name = "ti-sci-inta",
>  		.of_match_table = ti_sci_inta_irq_domain_of_match,
> +		.pm = pm_ptr(&ti_sci_inta_pm_ops),

See 'Struct declarations and initializers' ....

Thanks,

        tglx

