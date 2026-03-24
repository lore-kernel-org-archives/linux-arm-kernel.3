Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306FFF54AC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS2ja/jRm5ExQD/dlBquJ639weeO2LVW20mV3pYZZmY=; b=yj2VEs6pL1LVt38oseyrJ0i9q8
	RbbDEKopR8VVcRSTRjJ2I+sXUQ2gMCDpx6aKjO5uAsBzyVazN5gSdejgzdgkyIGz2oH0YuUisUAxd
	GXPgp2B1ai3Jt+8ttNMDltf/bAbbAYeeyqtbWmjpN7pymkERJwmNYHxzltzOIvujdkmq0cyX2LX13
	U4Z3hAJmjP/84E4VjqVTg4oz9JfYZvo3MiafXzFJXnmGf9EQitncbpzufRMuU0KJ25rAlPSNoYs5Q
	pCn2q5uJa1z2tsRx9ppoduKxUIMB2sJDopiSTLZKVnwrcLoK6ZMT+ESvt/RUiKwfttJABvG8YhQW/
	dJ6pBeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53My-00000001itC-13fV;
	Tue, 24 Mar 2026 15:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Ms-00000001iql-1aSq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97DA7600C4;
	Tue, 24 Mar 2026 15:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94D7C2BC87;
	Tue, 24 Mar 2026 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364909;
	bh=Enamp8dC1Wo/mbf3VECCnKuZQq+rJTy21IUMNiBSnq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t6ZevjZMjOhGT9qz10/RQ7Pdx1e+/kvAd2Xg5QUFRqtogwzuGyPGlKSBQSBycl7kW
	 O6uDJu5DaD/A0+ECKJUCmu6wg7IgOv/PMX7ExGKFfCjd+3CXRFA9h8SYJIWOqWWtzu
	 8F4haXf1Preh7jE6RIM7+8jpmslq0EG73UQ+RBlVloobvie9k1c7QR/I1OLivK09Ww
	 5Vuh5ma3rev2irzm4uGjTozYHF4ai9BEgAcmLk/dZP8tNgT66szQI9+cHCgdzwnU5A
	 7xdNl+P68Bzseg463hUn+br7VSTMx7/scg2uGG22n+VAx0cdJRyVJjrxwNse5ZAry6
	 dvj5svV49Qw8Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Javier Achirica <jachirica@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] irqchip: fix mask alignment in gic-v2m
In-Reply-To: <86zf3y4qfp.wl-maz@kernel.org>
References: <CACixm23xGCdrZ5wy7+KyLHcdxRK+-XK6R0grg1uJA0Bo_s_YbA@mail.gmail.com>
 <86zf3y4qfp.wl-maz@kernel.org>
Date: Tue, 24 Mar 2026 16:08:25 +0100
Message-ID: <87jyv1gt92.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Mar 23 2026 at 13:37, Marc Zyngier wrote:
> On Sat, 21 Mar 2026 14:12:16 +0000,
> Javier Achirica <jachirica@gmail.com> wrote:
>> 
>> commit 2ef3886ce626dcdab0cbc452dbbebc19f57133d8 ("irqchip/gic-v2m: Handle
>> Multiple MSI base IRQ Alignment") introduced a regression in kernel 6.12.58
>> affecting PCIe devices using GICv2m MSI on a Qualcomm (arm64) platform.
>> 
>> It uses nr_irqs parameter to generate a mask to align the MSI base address,
>> but this mask isn't properly generated when nr_irqs isn't a power of two.
>> This bug was found while adding support for the TCL HH500V router in OpenWrt.
>> 
>> This patch fixes the issue, can be cleanly applied to the 6.12.x tree and,
>> with a small fuzz, to 7.0.x.
>> 
>> Signed-off-by: Javier Achirica <jachirica@gmail.com>
>> Cc: stable@vger.kernel.org
>> ---
>> --- a/drivers/irqchip/irq-gic-v2m.c     2026-03-20 09:45:22.170192561 +0100
>> +++ b/drivers/irqchip/irq-gic-v2m.c     2026-03-20 09:45:26.284210783 +0100
>> @@ -158,7 +158,7 @@
>>         struct v2m_data *v2m = NULL, *tmp;
>>         int hwirq, i, err = 0;
>>         unsigned long offset;
>> -       unsigned long align_mask = nr_irqs - 1;
>> +       unsigned long align_mask = roundup_pow_of_two(nr_irqs) - 1;
>> 
>>         spin_lock(&v2m_lock);
>>         list_for_each_entry(tmp, &v2m_nodes, entry) {
>> 
>
> This looks wrong for a bunch of reasons:
>
> - you're hacking the allocation path, but not the free path -- what
>   could possibly go wrong?
>
> - nr_irqs not being a power of two to start with is more indicative of
>   a bug somewhere else in the system. The only case where we allocate
>   more than a single IRQ at a time is for Multi-MSI, and that is
>   definitely a power-of-two construct.

Right. Though the PCI/MSI core has never enforced it.

It just ensures that the number of requested interrupts is less than or
equal the power of 2 aligned number in the Multiple Message Capable
field of the Message Control word.

It only writes back round_up_power_of_two(nvec) to the Multiple Message
Enable field and hands the non power of two aligned allocation request
(nvec) down to the domain.

x86 handles this silently under the hood forever. The IRTE allocation
rounds nvec up to the next power of two.

If the driver requests minvec = 3 and maxvec = 5 and the hardware
supports 8 pci_msi_enable_range() it will allocate 5 in the device
domain, resulting in a table size of 8 and 5 actually allocted
interrupts.

The PCI/MSI core could allocate 8 in the device domain and stay
backwards compatible by returning 5 to the caller. The downside would be
that this fully allocates 3 extra unused interrupts descriptors and
resources throughout the domain hierarchy.

It's mostly memory and the only problematic case would be affinity
managed interrupts where the over-allocation actually affects the scarse
x86 vector space. I can't tell from the top of my head whether managed
mode is actually supported with MULTI-MSI or not. It might be, but that
needs some investigation.

Can't we have nice things for once?

Thanks,

        tglx


