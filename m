Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E642CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP1Zw6xqfNHqzyukhIpR7O8aPQtmr0Xc0TjrzEu5Xck=; b=j0MBW6w5p2IF5Wr/02vRO5g/f1
	qncmlZt6eit80IN7NzNQjAQJqmEgTKXPGS7QoU2LfSBWlA04lxPDIZpWARH37b1Qb1V37P5j+/TLd
	iwuYhiJGS66qN3p7X/OdA4x68YIuycXwh/55EYXbjXOtdCkLm9VziXRmqgzDQsGlORxnGIAfwGjJ9
	VwvfUeT+nvMVCJg0+4ZIKD2WNU8VJMla2bOpbhsIEsX9otpJ6GWxGxAyjg766uGd34xTm2ddCRAxV
	f1hZNVF3z67LzdKqw0aozI25XTa/ETYiGGu5/CN11sO4fTgO9Uutu6cfS8aCLKBixtOYDqws8i9IK
	FPKy6Q4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuhE-00000005RlY-160U;
	Tue, 09 Jun 2026 11:32:40 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuh9-00000005Rkb-2NpF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:32:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260609113227euoutp02811ffddbe5f6c1e4800c2a3d8392b021~3ZmHR_DvP0812608126euoutp02d;
	Tue,  9 Jun 2026 11:32:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260609113227euoutp02811ffddbe5f6c1e4800c2a3d8392b021~3ZmHR_DvP0812608126euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781004748;
	bh=dP1Zw6xqfNHqzyukhIpR7O8aPQtmr0Xc0TjrzEu5Xck=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sUqNR0enH3oHDoKJRkr/hYQpxeen6LqZeeZvXHR96jlJqh7z5vMsxj8lYGT8t2yIt
	 jkmrUWeaeC3PvPVM4Xtdo1BqoqGXxMT/5EXc6+HVHuS2VpWbOH5CxDQWAg6+adY7tR
	 w/b+XfxOkluv17fjONVFAER0jexSL91cHvahOtBI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260609113227eucas1p270d53f6f2654b828e83102e4472bcfa7~3ZmG6ELhE0757307573eucas1p2V;
	Tue,  9 Jun 2026 11:32:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260609113225eusmtip15c9f2d7cabf785cd9fcfa92556661a88~3ZmE6DYYu2874928749eusmtip1R;
	Tue,  9 Jun 2026 11:32:25 +0000 (GMT)
Message-ID: <658bffa9-bd70-4b62-ac03-505822ba0be9@samsung.com>
Date: Tue, 9 Jun 2026 13:32:24 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 03/17] clocksource/drivers/arm_arch_timer: Default to
 EL2 virtual timer when running VHE
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mark
	Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
	Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
	Holland <samuel@sholland.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ge Gordon
	<gordon.ge@bst.ai>, BST Linux Kernel Upstream Group
	<bst-upstream@bstai.top>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars
	Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dinh Nguyen
	<dinguyen@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
	Dybcio <konradybcio@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
	<afaerber@suse.de>, =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
	<eleanor.lin@realtek.com>, Heiko Stuebner <heiko@sntech.de>, Shawn Lin
	<shawn.lin@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Michal Simek <michal.simek@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <86ecigt2hq.wl-maz@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260609113227eucas1p270d53f6f2654b828e83102e4472bcfa7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260609100324eucas1p146c5ffe86a104677143baaeca1d3feba
X-EPHeader: CA
X-CMS-RootMailID: 20260609100324eucas1p146c5ffe86a104677143baaeca1d3feba
References: <20260523140242.586031-1-maz@kernel.org>
	<20260523140242.586031-4-maz@kernel.org>
	<CGME20260609100324eucas1p146c5ffe86a104677143baaeca1d3feba@eucas1p1.samsung.com>
	<ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com>
	<86ik7st3nh.wl-maz@kernel.org>
	<193cc406-0834-4dee-9b4a-02cdfd85e05c@samsung.com>
	<86ecigt2hq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_043236_210289_1912D460 
X-CRM114-Status: GOOD (  23.58  )
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

On 09.06.2026 12:46, Marc Zyngier wrote:
> On Tue, 09 Jun 2026 11:35:24 +0100,
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 09.06.2026 12:21, Marc Zyngier wrote:
>>> On Tue, 09 Jun 2026 11:03:21 +0100,
>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> On 23.05.2026 16:02, Marc Zyngier wrote:
>>>>> When running with at EL2 with VHE enabled, the architecture provides
>>>>> two EL2 timer/counters, dubbed physical and virtual. Apart from their
>>>>> names, they are strictly identical.
>>>>>
>>>>> However, they don't get virtualised the same way, specially when
>>>>> it comes to adding arbitrary offsets to the timers. When running as
>>>>> a guest, the host CNTVOFF_EL2 does apply to the guest's view of
>>>>> CNTHV*_El2. This is not true for CNTPOFF_EL2 and CNTHP*_EL2, as
>>>>> the architecture is broken past the first level of virtualisation
>>>>> (it lacks some essential mechanisms to be usable, despite what
>>>>> the ARM ARM pretends).
>>>>>
>>>>> This means that when running as a L2 guest hypervisor, using the
>>>>> physical timer results in traps to L0, which are then forwarded to
>>>>> L1 in order to emulate the offset, leading to even worse performance
>>>>> due to massive trap amplification (the combination of register and
>>>>> ERET trapping is absolutely lethal).
>>>>>
>>>>> Switch the arch timer code to using the virtual timer when running
>>>>> in VHE by default, only using the physical timer if the interrupt
>>>>> is not correctly described in the firmware tables (which seems
>>>>> to be an unfortunately common case). This comes as no impact on
>>>>> bare-metal, and slightly improves the situation in the virtualised
>>>>> case.
>>>>>
>>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>> This patch landed recently in linux-next as commit d87773de9efe
>>>> ("clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when
>>>> running VHE"). In my tests I found that it breaks booting of RaspberryPi5
>>>> board. Reverting it on top of linux-next fixes the issue. Here is a boot
>>>> log:
>>> Huh.
>>>
>>> [...]
>>>
>>>> arch_timer: cp15 timer running at 54.00MHz (hyp-virt).
>>>> clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
>>>> sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
>>> The interrupt appears to be advertised in the DT, but doesn't seem to
>>> fire. That's obviously not going to end well. My suspicion is that
>>> either the interrupt isn't wired (that'd be hilariously abd), or is
>>> left as Group-0 by the firmware (copy-paste from RPi4).
>>>
>>> Can you try the following hack and let me know if the kernel shouts at
>>> you?
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>>> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
>>> index ec70c84e9f91d..d05791e6cc0db 100644
>>> --- a/drivers/irqchip/irq-gic.c
>>> +++ b/drivers/irqchip/irq-gic.c
>>> @@ -213,6 +213,7 @@ static void gic_eoimode1_mask_irq(struct irq_data *d)
>>>  static void gic_unmask_irq(struct irq_data *d)
>>>  {
>>>  	gic_poke_irq(d, GIC_DIST_ENABLE_SET);
>>> +	WARN_ON(!gic_peek_irq(d, GIC_DIST_ENABLE_SET));
>>>  }
>>>  
>>>  static void gic_eoi_irq(struct irq_data *d)
>> I've applied this change, but it doesn't trigger any warning in the boot log.
> [+ Florian]
>
> Huh. So that really points at the timer not being wired into the GIC,
> Samsung style... Can you confirm that removing the EL2 virtual timer
> from the DT results in a booting machine?

With the following diff the board boots again:

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..09ff5e9959d3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -678,8 +678,6 @@ IRQ_TYPE_LEVEL_LOW)>,
                             <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
                                          IRQ_TYPE_LEVEL_LOW)>,
                             <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
-                                         IRQ_TYPE_LEVEL_LOW)>,
-                            <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
                                          IRQ_TYPE_LEVEL_LOW)>;
        };

> Florian, can you please check whether PPI12 is actually the EL2
> virtual timer on the RPI5 SoC?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


