Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E8C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eklp5QRNjtVIHCYD5PxlJQl+9egMn+PVMdq6OVcT+8w=; b=kDaiFhlMsWb76YGIibDkgUNnXq
	34c3K+Ep/sv2mfgpO4uXuilWW5LGtlUJ/0yA9zOWo4LN1dYUFfSxX44+juE6AErIkA2Ks7EfnOLLD
	tzv2ormStftxg5ZZWjUrXMZhyYiDs5WJEz8Oh2CO5oLA2dwaW0pfhDcqgpknNaiKnVnC2UkQxmx8S
	ajR3KptQNEH/UxtYtqF/G+T/g3oYqjYNfI7Q7FyNenEgkLZLHMGBOPvqBns2Cx/SMOwpwFEipYqba
	gznxWLnt8l13A9QvQ7uempnmAiXZyumTzrzxp0gn33UzBNxCpPmxj6GkWedxMl35bEVY5kVkJaK+v
	V+pgyZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3A-00000005hUy-3h5H;
	Tue, 28 Jul 2026 15:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok38-00000005hU3-0wDH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:48:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16956169E;
	Tue, 28 Jul 2026 08:48:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0F03F66F;
	Tue, 28 Jul 2026 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785253737; bh=zr+9PxuDJ8lVkBBcPMcBlC8LCkYW7GLO6vnyeUF46Tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sdfWHKkq+5CXHiHCV32yCTAkdMpxSOe2krpGhrxe+7SD9xNOR0XUje2Y+l3Hu/2ln
	 dDzKpX1lq9LoumIAdJ7EV4Zq3ceOUSo54++8dAj6TFMHRvdX6PiCW17pUJpJLt3pCv
	 SW2d3bsmt4+r5UO/bpDtJs1vw+X/6RiCbPbdQJlM=
Message-ID: <d471ead3-d6fd-4e2e-a800-5bbeba42cb90@arm.com>
Date: Tue, 28 Jul 2026 16:48:53 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH] arm_mpam: remove sanity check of accessibility when
 error interrupt is SPI on SMT platforms
To: Yadong Qi <yadong.qi@linux.alibaba.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
 sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ying.huang@linux.alibaba.com
Cc: ptg-linux-kernel@linux.alibaba.com
References: <20260720072409.2660-1-yadong.qi@linux.alibaba.com_quarantine>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260720072409.2660-1-yadong.qi@linux.alibaba.com_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084858_299101_AF8244FE 
X-CRM114-Status: GOOD (  23.26  )
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

Hi Yadong,

On 7/20/26 08:24, Yadong Qi wrote:
> On SMT platforms, an L2 cache MSC is typically shared between sibling
> threads. Per the MPAM ACPI spec (DEN0065B), the MSC's linked device
> should be set to the processor container of those siblings, so the
> kernel derives msc->accessibility as just the sibling CPUs.
> 
> Per the MPAM spec (IHI0099B), when an MSC is not integrated into a PE,
> SPI/LPI is the recommended error interrupt. SPIs are not per-CPU, and a
> sanity check in mpam_msc_setup_error_irq() requires accessibility ==
> cpu_possible_mask — assuming a shared interrupt must be routable to all
> CPUs. This creates a conflict on SMT platforms: the MSC has a restricted
> accessibility but a shared error interrupt, causing probe to fail with:
> 
>   msc:N is a private resource with a shared error interrupt
> 
> This RFC patch removes the check to allow MSC probe to succeed on SMT
> platforms, but this is mainly intended to start a discussion. We would
> appreciate advice on the right way to handle this conflict. Is this a
> spec issue, or should the driver handle SPI error interrupts differently

For advice on questions broader than just linux please ask arm support: support@arm.com

> when an MSC has a restricted accessibility mask?

I expect the MPAM driver could be taught to deal with SPI interrupts without global affinity.

> 
> Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>
> ---
>  drivers/resctrl/mpam_devices.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b69f99488111..e8b2b5e00d7c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1964,13 +1964,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
>  	if (irq_is_percpu(irq))
>  		return __setup_ppi(msc);
>  
> -	/* sanity check: shared interrupts can be routed anywhere? */
> -	if (!cpumask_equal(&msc->accessibility, cpu_possible_mask)) {
> -		pr_err_once("msc:%u is a private resource with a shared error interrupt",
> -			    msc->id);
> -		return -EINVAL;
> -	}
> -

To do this the MPAM driver would have to remove the interrupt from balancing, IRQF_NOBALANCING, and
control the balancing itself.

Thanks,

Ben

>  	return 0;
>  }
>  


