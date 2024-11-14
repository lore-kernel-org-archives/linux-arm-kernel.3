Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3C6D68B32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3p8kE0DMrkl9mhIZPg/dU5JWgGiY//aVa9AKST+fCQ=; b=UUMjG+6T3wFARGYz2TtmUZyZfK
	4qdfYlrYvx7jZPfXUEEctyznx8P6xkKGhoDvNbQXOZaqvrFZdu2LYC7XiTWeMmhOj+afqfbGmuCCV
	dtUJC+D8+97xvh8ylphLSr5euTIxYQ9LD3RCMeVuS1dcKudinoug+Nbu71sQS1T30O4RflWb2x1n4
	9PcE7swaDmoyg7tAmdf542RtEeT59eYMde4u4Xjf7VC5++tH6rqyc/dLnlgfISOtcMBgm2v4wh4s9
	Qw1qrBFQsy9hHVR8GmXdzYdEfVDa8giAV/EgnnAzQtgNQs4f58SOuPIsFKtfEEOnYdyU5d1KsyTHg
	lt9Bo9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbto-000000002nV-0Cgj;
	Thu, 14 Nov 2024 15:36:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbsZ-000000001UN-0U2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:35:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6827B169E;
	Thu, 14 Nov 2024 07:35:57 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A1FB3F59E;
	Thu, 14 Nov 2024 07:35:16 -0800 (PST)
Message-ID: <2621385c-6fcf-4035-a5a0-5427a08045c8@arm.com>
Date: Thu, 14 Nov 2024 15:35:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
To: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, tglx@linutronix.de, maz@kernel.org,
 bhelgaas@google.com, leonro@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, dlemoal@kernel.org,
 kevin.tian@intel.com, smostafa@google.com,
 andriy.shevchenko@linux.intel.com, reinette.chatre@intel.com,
 eric.auger@redhat.com, ddutile@redhat.com, yebin10@huawei.com,
 brauner@kernel.org, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, anna-maria@linutronix.de,
 nipun.gupta@amd.com, marek.vasut+renesas@mailbox.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
 <ZzPOsrbkmztWZ4U/@Asurada-Nvidia> <20241113013430.GC35230@nvidia.com>
 <20241113141122.2518c55a.alex.williamson@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113141122.2518c55a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_073531_294901_884CBD54 
X-CRM114-Status: GOOD (  31.42  )
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

On 13/11/2024 9:11 pm, Alex Williamson wrote:
> On Tue, 12 Nov 2024 21:34:30 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
>> On Tue, Nov 12, 2024 at 01:54:58PM -0800, Nicolin Chen wrote:
>>> On Mon, Nov 11, 2024 at 01:09:20PM +0000, Robin Murphy wrote:
>>>> On 2024-11-09 5:48 am, Nicolin Chen wrote:
>>>>> To solve this problem the VMM should capture the MSI IOVA allocated by the
>>>>> guest kernel and relay it to the GIC driver in the host kernel, to program
>>>>> the correct MSI IOVA. And this requires a new ioctl via VFIO.
>>>>
>>>> Once VFIO has that information from userspace, though, do we really need
>>>> the whole complicated dance to push it right down into the irqchip layer
>>>> just so it can be passed back up again? AFAICS
>>>> vfio_msi_set_vector_signal() via VFIO_DEVICE_SET_IRQS already explicitly
>>>> rewrites MSI-X vectors, so it seems like it should be pretty
>>>> straightforward to override the message address in general at that
>>>> level, without the lower layers having to be aware at all, no?
>>>
>>> Didn't see that clearly!! It works with a simple following override:
>>> --------------------------------------------------------------------
>>> @@ -497,6 +497,10 @@ static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
>>>                  struct msi_msg msg;
>>>
>>>                  get_cached_msi_msg(irq, &msg);
>>> +               if (vdev->msi_iovas) {
>>> +                       msg.address_lo = lower_32_bits(vdev->msi_iovas[vector]);
>>> +                       msg.address_hi = upper_32_bits(vdev->msi_iovas[vector]);
>>> +               }
>>>                  pci_write_msi_msg(irq, &msg);
>>>          }
>>>   
>>> --------------------------------------------------------------------
>>>
>>> With that, I think we only need one VFIO change for this part :)
>>
>> Wow, is that really OK from a layering perspective? The comment is
>> pretty clear on the intention that this is to resync the irq layer
>> view of the device with the physical HW.
>>
>> Editing the msi_msg while doing that resync smells bad.
>>
>> Also, this is only doing MSI-X, we should include normal MSI as
>> well. (it probably should have a resync too?)
> 
> This was added for a specific IBM HBA that clears the vector table
> during a built-in self test, so it's possible the MSI table being in
> config space never had the same issue, or we just haven't encountered
> it.  I don't expect anything else actually requires this.

Yeah, I wasn't really suggesting to literally hook into this exact case; 
it was more just a general observation that if VFIO already has one 
justification for tinkering with pci_write_msi_msg() directly without 
going through the msi_domain layer, then adding another (wherever it 
fits best) can't be *entirely* unreasonable.

At the end of the day, the semantic here is that VFIO does know more 
than the IRQ layer, and does need to program the endpoint differently 
from what the irqchip assumes, so I don't see much benefit in dressing 
that up more than functionally necessary.

>> I'd want Thomas/Marc/Alex to agree.. (please read the cover letter for
>> context)
> 
> It seems suspect to me too.  In a sense it is still just synchronizing
> the MSI address, but to a different address space.
> 
> Is it possible to do this with the existing write_msi_msg callback on
> the msi descriptor?  For instance we could simply translate the msg
> address and call pci_write_msi_msg() (while avoiding an infinite
> recursion).  Or maybe there should be an xlate_msi_msg callback we can
> register.  Or I suppose there might be a way to insert an irqchip that
> does the translation on write.  Thanks,

I'm far from keen on the idea, but if there really is an appetite for 
more indirection, then I guess the least-worst option would be yet 
another type of iommu_dma_cookie to work via the existing 
iommu_dma_compose_msi_msg() flow, with some interface for VFIO to update 
per-device addresses directly. But then it's still going to need some 
kind of "layering violation" for VFIO to poke the IRQ layer into 
re-composing and re-writing a message whenever userspace feels like 
changing an address, because we're fundamentally stepping outside the 
established lifecycle of a kernel-managed IRQ around which said layering 
was designed...

Thanks,
Robin.

