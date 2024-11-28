Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D1DD690FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BepIv+zsVxwnGd+vRGJKobT/i3K2E0sdG4yWASd1NkE=; b=lYUY+KGlvQv4e+9RTPd4Ae4Uo8
	/P7/OyV2Sajln0pegUbjMRJh7C4ZLpkNIEaKkJvpjYKana27xjgZE88seKk58+A1HWmrbTt/j6zhI
	0n7tQGVYAu+sAJw0AcXd4xsgLNAHQO7buwJ91ELvFBabBzsFrBuzlVl50mukXqV8AwysmI4DllrQT
	2PJTdC9Ol7YvHq7+SgRNVfhqEibCA0tGuV9oV5gZ59au1EuRmkoijWsF6onsrzq2eJLMV65lNQ67e
	fgDrhz3fz2MOP90/Yq1wtI2lNkqngJeC8Sb3a8/EAUVnB2TdAq6kFL1vt1uKK2IEDW5VspNnu4suA
	xgBUkcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcVT-0000000FLMS-1Ozr;
	Thu, 28 Nov 2024 11:16:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcUU-0000000FLFe-0zLt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 11:15:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732792520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BepIv+zsVxwnGd+vRGJKobT/i3K2E0sdG4yWASd1NkE=;
	b=p1sHVd2nF4+Wcf895ouKTQQoSekm/Z0/pHKLqMXZfyVoZtPx8ito7bNXqvpFFTTrgsBGir
	z2WPrTjtm0R+7d4vtevK5z8bJb/Ic16GEiXqO0c2ssuAqKxgxC/+nTMGgX5EGx8eHVvEoQ
	1JnFUDIuFcG4BarV6+JuDFjT+9lmHDBA3++qPXTgD3L+zDK62nsydQfuF+FA0CM16Pob+S
	g6WljcbwJljkAvWZHAjAPwTnytNkqNEDAxaLlcGiAkNbZDS/dZMPL1RxbR7KBCAGBhPWJ2
	ZNZAHvN4yWTGwIlyiyYK1p26sLaYMeM/YRaoszgZLqIR4lg0ozZLDS0ZsIabAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732792520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BepIv+zsVxwnGd+vRGJKobT/i3K2E0sdG4yWASd1NkE=;
	b=CYR8n5Xj31ApiPOAIzYejnuG5cbHitE/iV/uP91bN59JLrhalJuYwg4IpOGHOFgzhEcEJu
	BIP3cMUELs1sUDDg==
To: Jason Gunthorpe <jgg@nvidia.com>, Eric Auger <eric.auger@redhat.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>,
 maz@kernel.org, bhelgaas@google.com, leonro@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, dlemoal@kernel.org,
 kevin.tian@intel.com, smostafa@google.com,
 andriy.shevchenko@linux.intel.com, reinette.chatre@intel.com,
 ddutile@redhat.com, yebin10@huawei.com, brauner@kernel.org,
 apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
 anna-maria@linutronix.de, nipun.gupta@amd.com,
 marek.vasut+renesas@mailbox.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
In-Reply-To: <20241120140337.GA772273@nvidia.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
 <ZzPOsrbkmztWZ4U/@Asurada-Nvidia> <20241113013430.GC35230@nvidia.com>
 <20241113141122.2518c55a.alex.williamson@redhat.com>
 <2621385c-6fcf-4035-a5a0-5427a08045c8@arm.com>
 <66977090-d707-4585-b0c5-8b48f663827e@redhat.com>
 <20241120140337.GA772273@nvidia.com>
Date: Thu, 28 Nov 2024 12:15:20 +0100
Message-ID: <87frnby5h3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_031522_420920_2AF6A454 
X-CRM114-Status: GOOD (  30.09  )
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

On Wed, Nov 20 2024 at 10:03, Jason Gunthorpe wrote:
> On Wed, Nov 20, 2024 at 02:17:46PM +0100, Eric Auger wrote:
>> > Yeah, I wasn't really suggesting to literally hook into this exact
>> > case; it was more just a general observation that if VFIO already has
>> > one justification for tinkering with pci_write_msi_msg() directly
>> > without going through the msi_domain layer, then adding another
>> > (wherever it fits best) can't be *entirely* unreasonable.
>
> I'm not sure that we can assume VFIO is the only thing touching the
> interrupt programming.

Correct.

> I think there is a KVM path, and also the /proc/ path that will change
> the MSI affinity on the fly for a VFIO created IRQ. If the platform
> requires a MSI update to do this (ie encoding affinity in the
> add/data, not using IRQ remapping HW) then we still need to ensure the
> correct MSI address is hooked in.

Yes.

>> >> Is it possible to do this with the existing write_msi_msg callback on
>> >> the msi descriptor?=C2=A0 For instance we could simply translate the =
msg
>> >> address and call pci_write_msi_msg() (while avoiding an infinite
>> >> recursion).=C2=A0 Or maybe there should be an xlate_msi_msg callback =
we can
>> >> register.=C2=A0 Or I suppose there might be a way to insert an irqchi=
p that
>> >> does the translation on write.=C2=A0 Thanks,
>> >
>> > I'm far from keen on the idea, but if there really is an appetite for
>> > more indirection, then I guess the least-worst option would be yet
>> > another type of iommu_dma_cookie to work via the existing
>> > iommu_dma_compose_msi_msg() flow,=20
>
> For this direction I think I would turn iommu_dma_compose_msi_msg()
> into a function pointer stored in the iommu_domain and have
> vfio/iommufd provide its own implementation. The thing that is in
> control of the domain's translation should be providing the msi_msg.

Yes. The resulting cached message should be writeable as is.

>> > update per-device addresses direcitly. But then it's still going to
>> > need some kind of "layering violation" for VFIO to poke the IRQ layer
>> > into re-composing and re-writing a message whenever userspace feels
>> > like changing an address
>
> I think we'd need to get into the affinity update path and force a MSI
> write as well, even if the platform isn't changing the MSI for
> affinity. Processing a vMSI entry update would be two steps where we
> update the MSI addr in VFIO and then set the affinity.

The affinity callback of the domain/chip can return IRQ_SET_MASK_OK_DONE
which prevents recomposing and writing the message.

So you want a explicit update/write of the message similar to what
msi_domain_activate() does.

Thanks,

        tglx

