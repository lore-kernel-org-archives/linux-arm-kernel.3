Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05722C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd4kpgdpLE6thcE1xgDjISyT+lHl7ZXNIYB05T+WR7g=; b=1H6gmDoWCqBAcy3Wtd+Mh3nJh3
	NzSNF2lpcRZUNb6HPDmAZxlaAoQGoifzT0H8kcOq5tdVWxTp1CSFZJsoSqPqRF15gnKcZZuBA3uRC
	CWxlAbp6q63GGjgwaEC1jUy6LXaCjykZPiuPCLKC5MsY4hXpGoBXF9zTOBM5mD8cd09P+nFphyGY1
	o3OEfSLp3MniZjk1JalD38jolMGgoU2+Ijg7t9x6K1UdQbDh1rbn/xaBUOuHfbm4M00pwhNc9G6hv
	Z3fD2LC7+e5KTqXfDjEOmN6q4bDbJ8GEx4igl/e93T7TzPVeh2kiiZpNtrhv18ELpkrgbE2gnkATQ
	xN8nbJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLV3-00000008GNa-2fLY;
	Fri, 07 Aug 2026 14:24:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLV0-00000008GNC-457m;
	Fri, 07 Aug 2026 14:24:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E5681BCA;
	Fri,  7 Aug 2026 07:24:33 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 968CD3F9A2;
	Fri,  7 Aug 2026 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786112677; bh=bjWAifFxgtUCdE82wAQsbJm5us80D5W3SDsxqOZvTLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fqv7xemQXZNRzwDmanQKRIX//hiRV55JHD/WtmdOucJL18W+Ow6vQUW2O/z5m3ITW
	 zD+IcEt+Oc71EROtAEMUNkOegbtod7cvwWo/Ir3jKcoybAd3wyDANa7bMhUxrUN0dg
	 qBLDpY4RMr/RODVycbR4HtbqXI1pe2UJguxWQS28=
Message-ID: <a89f7d1e-6996-4956-b4be-a7bb9eb1dd8a@arm.com>
Date: Fri, 7 Aug 2026 15:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 7/9] accel/rocket: add RK3576 NPU (RKNN) support
To: Diederik de Haas <diederik@cknow-tech.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net, heiko@sntech.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
 will@kernel.org, ulfh@kernel.org, p.zabel@pengutronix.de,
 ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, alchark@flipper.net, chaoyi.chen@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260806063413.350184-1-gahing@gahingwoo.com>
 <20260806063413.350184-8-gahing@gahingwoo.com>
 <DKIKXY8XZVPF.3RFR4ISK6Y4QX@cknow-tech.com>
 <fb94bd28-fdbf-4f99-a6ff-b5ab18c64345@arm.com>
 <DKIR028TZNJ3.3BGQJYSWX2BMN@cknow-tech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <DKIR028TZNJ3.3BGQJYSWX2BMN@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_072439_093083_3E92B5D1 
X-CRM114-Status: GOOD (  22.35  )
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

On 07/08/2026 2:32 pm, Diederik de Haas wrote:
> On Fri Aug 7, 2026 at 2:55 PM CEST, Robin Murphy wrote:
>> On 07/08/2026 9:48 am, Diederik de Haas wrote:
>>> On Thu Aug 6, 2026 at 8:34 AM CEST, Jiaxing Hu wrote:
>>>> The RK3576 has two cores of the same RKNN block and a few platform
>>>> differences:
>>>>
>>>>    - the CBUF (convolution buffer) has its own clock domain, so the core
>>>>      needs six clocks rather than four;
>>>>    - the BIU reset moved into the power domain, leaving one reset here;
>>>>    - the NPU spans two power domains, and a device with more than one is
>>>>      skipped by the driver-core single-domain auto-attach, so the list has
>>>>      to be attached explicitly;
>>>>    - the DPU completion interrupt is armed exactly as on RK3588 but never
>>>>      reaches the GIC. The completion is visible in INTERRUPT_RAW_STATUS,
>>>
>>> I don't know if it's relevant, so just a data point:
>>> - RK3588 has Cortex A-76 + A-55, which have an External GICv4
>>> - RK3576 has Cortex A-72 + A-53, which have an External GICv3
>>
>> Nope, RK3588 has GIC-600, which is very much v3 still. I guess RK3576
>> probably has GIC-500 like RK3399 given the CPUs, but that shouldn't make
>> any meaningful difference here.
> 
> Unsurprisingly, you're (almost) correct :)
> I looked at this document when I wrote that:
> https://www.arm.com/-/media/Arm%20Developer%20Community/PDF/Cortex-A%20R%20M%20datasheets/Arm%20Cortex-A%20Comparison%20Table_v4.pdf

Ah, that list is effectively describing the *maximum* capabilities of 
the v8 cores' respective GIC-CPU interface implementations. It's really 
just saying that cores which predate GICv4 don't implement the 
additional system registers relevant to direct injection (and of course 
the v7 cores which predate GICv3 don't have a system register interface 
at all).

> But the RK3588 TRM Part 1 Chapter 11 'GIC600' says:
> "The GIC600 supports the GICv3 architecture ..."
> "The version of GIC600 is r1p6-00rel0."
> 
> The RK3576 TRM Part 1 Chapter 13 'Generic Interrupt Controller (GIC)' says:
> "There is a generic interrupt controller (GIC400) in RK3576 which generates
> physical interrupts to Cortex-A53/Cortex-A72."

Oh wow, indeed perhaps I should have just looked at the upstream DT :)
Going back to GICv2 seems like a mildly surprising choice at this point 
in time, but fair enough, sometimes power/area costs beat performance. 
My point still remains valid that the GIC implementation itself should 
have no impact on the behaviour of SPIs that are correctly described in 
the DT.

Cheers,
Robin.

> And RK3399 TRM Part 1 Chapter 11 'Generic Interrupt Controller (GIC)' says:
> "The GIC-500 in RK3399 provides registers for managing interrupt sources,
> interrupt behavior, and interrupt routing to one or more cores."
> 
> Cheers,
>    Diederik
> 
>> If the interrupt never fires at all then possibly the signal depends on
>> some additional clock or power domain in order to propagate, or it's
>> just described incorrectly; or if other interrupt sources within the
>> NPU/IOMMU do still work then maybe there's some additional masking
>> control that's been overlooked, or perhaps it it just terminally broken.
>>
>> (And FWIW I'm also inclined to agree with the other comments that
>> refactoring existing code to make room for new stuff, then actually
>> adding the new stuff, should probably be two separate steps if it's not
>> completely trivial)
>>
>> Thanks,
>> Robin.


