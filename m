Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA786CEE351
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85dLdaSSikOolLGRg84h7iQ8Ka0pQjrHEHvZGQWL1jU=; b=z/QEtkCuIM6gb4e907QtEzqrjn
	7TkdfdyBeEOdUfM77Bw7YAaza+RlIb7EZqJhmiVFLPfd5ALn+h7H6vWhAU9pk6s7SPDmiAoSvQmwF
	WxYcTZBZ3VaWOpJwkphEONAPTcFAdW+Dr4GV+sJLsEiFo4k4XQJipnhGLN6jPm7pMEnJIy8cNeO3a
	ejwpyUdz9QyZCNpSGegm9lCKTU89JNLT6levaojpKdb2WwlNrcPrU4DVzXoZgB+x5NZxZm0xtz+bS
	mfon4ANI9VqAIJAkSSitOTOTaoTSGmFyqdKddSQa/YOrnukNKyH7W6TT026mAJxj6LquszIRAcTvo
	MnmIQniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRmJ-000000012T9-461O;
	Tue, 18 Nov 2025 19:54:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRmI-000000012T1-3VZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 19:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF49F6001A;
	Tue, 18 Nov 2025 19:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F39BC2BCAF;
	Tue, 18 Nov 2025 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763495653;
	bh=HK3qKweBiTr8wvoEKCuKNialWeUlld/rrOWhA7lzV3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CMEXQ4Fmrmu3EAe46xoa70vmQPCYduuEc2N62EBz9AuOG9pP7xV3p7FNSsLCgOw+5
	 jaoJ8E4ifRN/95pwBHIjkkeL1iXklnVlcfoBPWXwOuS0S6olbvXUvM9KubejZo3HWI
	 oN2iLBcEw2NEl7ZW+fge+Xob7zhGfrm5qwaAoh2zls4r7W2uBydGWao5cKca6UV1To
	 brsscDE115hagYHgwlDvwWleVPSWQiBt9C55cTl+672JgPJgb2IDn27o7DyfMqTDi6
	 pYlUNkzRH0lbOUjprzA73EHP5mOY0xo2/pRmuemSbT0JSaI9hKCzs9EF+i3pUV0ZvM
	 GlyTx45vWLczg==
Message-ID: <e2012e60-b278-4116-98b0-e79bd36412a4@kernel.org>
Date: Tue, 18 Nov 2025 20:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: exynos: Rework system wakeup interrupts
 initialization
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
References: <CGME20251118115051eucas1p15f688883a4466dd7cabf3550a798c060@eucas1p1.samsung.com>
 <20251118115037.1866871-1-m.szyprowski@samsung.com>
 <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/11/2025 14:21, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> CC Robh
> 
> On Tue, 18 Nov 2025 at 12:50, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Since commit 1b1f04d8271e ("of/irq: Ignore interrupt parent for nodes
>> without interrupts") it is not possible to get parent interrupt device
>> node when no 'interrupts' property is specified. Rework the hack used for
>> initializing the Exynos system wakeup interrupts (PMU controller is a
>> proxy for SoC RTC interrupts) to get the parent interrupt node by
>> manually parsing 'interrupt-parent' property.
>>
>> Fixes: 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Thanks for your patch!
> 
>> ---
>> This fixes the following boot failure of allmost all ARM 32bit Exynos
>> boards observed since next-20251118:
>>
>> /soc/system-controller@10020000: no parent, giving up
>> OF: of_irq_init: Failed to init /soc/system-controller@10020000 ((ptrval)), parent 00000000
> 
> Oops...
> 
>> ...
>> 8<--- cut here ---
>> Unable to handle kernel paging request at virtual address 00002008 when read
>> [00002008] *pgd=00000000
>> Internal error: Oops: 5 [#1] SMP ARM
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00026-g1b1f04d8271e #16162 PREEMPT
>> Hardware name: Samsung Exynos (Flattened Device Tree)
>> PC is at exynos_set_delayed_reset_assertion+0x5c/0xb0
>> LR is at exynos_set_delayed_reset_assertion+0x80/0xb0
>> pc : [<c012b9a4>]    lr : [<c012b9c8>]    psr: 80000053
>> ...
>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>> Stack: (0xf0825f30 to 0xf0826000)
>> ...
>> Call trace:
>>  exynos_set_delayed_reset_assertion from exynos_smp_prepare_cpus+0x10/0x34
>>  exynos_smp_prepare_cpus from kernel_init_freeable+0x94/0x234
>>  kernel_init_freeable from kernel_init+0x1c/0x12c
>>  kernel_init from ret_from_fork+0x14/0x28
>> Exception stack(0xf0825fb0 to 0xf0825ff8)
>> ...
>> ---[ end trace 0000000000000000 ]---
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>>
>> Best regards
>> Marek Szyprowski, PhD
>> Samsung R&D Institute Poland
>> ---
>>  arch/arm/mach-exynos/suspend.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
>> index 44811faaa4b4..02785342e0c7 100644
>> --- a/arch/arm/mach-exynos/suspend.c
>> +++ b/arch/arm/mach-exynos/suspend.c
>> @@ -192,6 +192,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
>>  {
>>         struct irq_domain *parent_domain, *domain;
>>
> 
> Perhaps add a check:
> 
>     if (!parent)
> 
> just in case any of the pmu system controllers ever gets a real
> interrupts or interrupts-extended property?
> 
>> +       parent = of_parse_phandle(node, "interrupt-parent", 0);
> 
> Or of_irq_find_parent(node)?
> 
>>         if (!parent) {
>>                 pr_err("%pOF: no parent, giving up\n", node);
>>                 return -ENODEV;

Ack for both and also please of_node_put in the error paths, which will
be a bit complicated if parent can be non-NULL as well.

I wonder now whether more platforms are affected, e.g. imx_gpc_init().
See also Mark's report.

https://lore.kernel.org/all/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk/


Best regards,
Krzysztof

