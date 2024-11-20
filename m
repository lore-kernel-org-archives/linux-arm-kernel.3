Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834E5D63939
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pYmcfAOVL4lH7Ez8B+rVq5uAfANeVBdvrYZSZINoWw=; b=PmpwGFSCtNBasz
	8FVXl1myASj0tZ9El4xdxb8eqpdHqTg0mRItSSjwSN+0lYSIEckuOzlS3l9KtfssyO6XdZzNfBOZD
	+DeNqdza+7HImhv+WylqzzyKihafeG/TvFNfsWS8iKK+AW7wkM+U9HsMgPc7RBR1Mwz2U7Ye3nDtl
	EbFeJOk9jJLQsa0ko4OmXkWd25proapHYVvW/v4qLxJigyJMjDppcnn5erhKazipvHsEpathOzqGI
	PHT+63cQNeYDRLTOfqFW+S0aBNwLlD4rHAxPsYEfLnQ6CMjE97bhEnlpmvlj0NKbI+aT/2SWyK5Ad
	sxqAzMldv9jgxdMrezAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkbh-0000000FOee-2Pbl;
	Wed, 20 Nov 2024 13:18:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkak-0000000FOY1-01ao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732108675;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pYmcfAOVL4lH7Ez8B+rVq5uAfANeVBdvrYZSZINoWw=;
	b=ePWiRxG2PMCoY/rSWyBSUZwVvQSHszCTcxmYvQ0yK8jIL0/8W4Wu5qpMqbLCWyAq/Zp+oZ
	ON6X+53OktezVfjAhYZ75GUCC3qUpakm8OHocEQivH1iyTuXzwu8ALXWPqLeMkptTOhTaN
	65ILW63ZjxsfEJbQXqRl53fsf/bApLU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Y2tVSvhPPDSZxxDB-NPwAA-1; Wed, 20 Nov 2024 08:17:53 -0500
X-MC-Unique: Y2tVSvhPPDSZxxDB-NPwAA-1
X-Mimecast-MFC-AGG-ID: Y2tVSvhPPDSZxxDB-NPwAA
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46360a97a99so84187441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 05:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732108673; x=1732713473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pYmcfAOVL4lH7Ez8B+rVq5uAfANeVBdvrYZSZINoWw=;
        b=Plx3oEwTKx+4TxQmZsC2FLz+AAIhuXmkvLYLWc3evED/jEdGvhvhN+J3/raN5RG1Km
         Zd5ZNEvtUw4xeIUUq6wW40oZ1xtjTroIu2YffXghGRGkjZuXFWsn0CIO0ItOs5NxUHcd
         TwqKuwt1MK3JBSTIIFw37THxMUy0E5xAbc4UnSogqoEeh1Asdp3OUO9Dg9fRtOIjlWeP
         n5YdyA9LUXI3j5AZeYZHsnsTovo1MoeyZPX/mifX6XMs4ywdiRwVWnBH9n2zTAzH6k6M
         GGwhrWVr2S5NqyFWPnH0SPy1ODKrD5aCsDtVhB4qA6dySVZyOUCptK/juHFf/dtlognT
         Q0vg==
X-Forwarded-Encrypted: i=1; AJvYcCU6VViuShX5ATUBL+zz1T2SxVF64qDr1+sQn2QF43CJsO+ymc4BiAQBnyLXFZu2uVoTQvVYho7RKSd5QU8FSjrS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJazIfdKuScdEmHKiUPTE8ICISiqAzuglaIA3W2Dl+bU66TwTv
	CPSfkn9Tbc0woNADKEADQLHo8ghd0YHgR6StXq+d6Jp2+IbBFC0jqpNpU/LH9FG2MZey8NMGl9W
	kq+J2immv3fNbzm99YrGhCiu2c48XjS/8r9KOF74EDYyBvYiFeepxCRaNkBkPk3+UfWqnX/Hf
X-Received: by 2002:a05:6214:21a9:b0:6d4:10b0:c242 with SMTP id 6a1803df08f44-6d43782650cmr36004826d6.26.1732108673344;
        Wed, 20 Nov 2024 05:17:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoyaTxmYX8UT3QHHo+4fHJkXgTEZWD6Y5LfaFiT6Th8SIw6Ey1ch5deEOkok5XrGrNJJGMpw==
X-Received: by 2002:a05:6214:21a9:b0:6d4:10b0:c242 with SMTP id 6a1803df08f44-6d43782650cmr36004416d6.26.1732108673005;
        Wed, 20 Nov 2024 05:17:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d43812ab1csm10435266d6.93.2024.11.20.05.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 05:17:52 -0800 (PST)
Message-ID: <66977090-d707-4585-b0c5-8b48f663827e@redhat.com>
Date: Wed, 20 Nov 2024 14:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
To: Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, tglx@linutronix.de, maz@kernel.org,
 bhelgaas@google.com, leonro@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, dlemoal@kernel.org,
 kevin.tian@intel.com, smostafa@google.com,
 andriy.shevchenko@linux.intel.com, reinette.chatre@intel.com,
 ddutile@redhat.com, yebin10@huawei.com, brauner@kernel.org,
 apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
 anna-maria@linutronix.de, nipun.gupta@amd.com,
 marek.vasut+renesas@mailbox.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, kvm@vger.kernel.org
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
 <ZzPOsrbkmztWZ4U/@Asurada-Nvidia> <20241113013430.GC35230@nvidia.com>
 <20241113141122.2518c55a.alex.williamson@redhat.com>
 <2621385c-6fcf-4035-a5a0-5427a08045c8@arm.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2621385c-6fcf-4035-a5a0-5427a08045c8@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hNhhn-opV4Ce6NFKkcl3ElDvtsY7Ki8T7Ddzw9o9-is_1732108673
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_051758_115894_89CFBFE4 
X-CRM114-Status: GOOD (  33.96  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 11/14/24 16:35, Robin Murphy wrote:
> On 13/11/2024 9:11 pm, Alex Williamson wrote:
>> On Tue, 12 Nov 2024 21:34:30 -0400
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>>> On Tue, Nov 12, 2024 at 01:54:58PM -0800, Nicolin Chen wrote:
>>>> On Mon, Nov 11, 2024 at 01:09:20PM +0000, Robin Murphy wrote:
>>>>> On 2024-11-09 5:48 am, Nicolin Chen wrote:
>>>>>> To solve this problem the VMM should capture the MSI IOVA
>>>>>> allocated by the
>>>>>> guest kernel and relay it to the GIC driver in the host kernel,
>>>>>> to program
>>>>>> the correct MSI IOVA. And this requires a new ioctl via VFIO.
>>>>>
>>>>> Once VFIO has that information from userspace, though, do we
>>>>> really need
>>>>> the whole complicated dance to push it right down into the irqchip
>>>>> layer
>>>>> just so it can be passed back up again? AFAICS
>>>>> vfio_msi_set_vector_signal() via VFIO_DEVICE_SET_IRQS already
>>>>> explicitly
>>>>> rewrites MSI-X vectors, so it seems like it should be pretty
>>>>> straightforward to override the message address in general at that
>>>>> level, without the lower layers having to be aware at all, no?
>>>>
>>>> Didn't see that clearly!! It works with a simple following override:
>>>> --------------------------------------------------------------------
>>>> @@ -497,6 +497,10 @@ static int vfio_msi_set_vector_signal(struct
>>>> vfio_pci_core_device *vdev,
>>>>                  struct msi_msg msg;
>>>>
>>>>                  get_cached_msi_msg(irq, &msg);
>>>> +               if (vdev->msi_iovas) {
>>>> +                       msg.address_lo =
>>>> lower_32_bits(vdev->msi_iovas[vector]);
>>>> +                       msg.address_hi =
>>>> upper_32_bits(vdev->msi_iovas[vector]);
>>>> +               }
>>>>                  pci_write_msi_msg(irq, &msg);
>>>>          }
>>>>   --------------------------------------------------------------------
>>>>
>>>> With that, I think we only need one VFIO change for this part :)
>>>
>>> Wow, is that really OK from a layering perspective? The comment is
>>> pretty clear on the intention that this is to resync the irq layer
>>> view of the device with the physical HW.
>>>
>>> Editing the msi_msg while doing that resync smells bad.
>>>
>>> Also, this is only doing MSI-X, we should include normal MSI as
>>> well. (it probably should have a resync too?)
>>
>> This was added for a specific IBM HBA that clears the vector table
>> during a built-in self test, so it's possible the MSI table being in
>> config space never had the same issue, or we just haven't encountered
>> it.  I don't expect anything else actually requires this.
>
> Yeah, I wasn't really suggesting to literally hook into this exact
> case; it was more just a general observation that if VFIO already has
> one justification for tinkering with pci_write_msi_msg() directly
> without going through the msi_domain layer, then adding another
> (wherever it fits best) can't be *entirely* unreasonable.
>
> At the end of the day, the semantic here is that VFIO does know more
> than the IRQ layer, and does need to program the endpoint differently
> from what the irqchip assumes, so I don't see much benefit in dressing
> that up more than functionally necessary.
>
>>> I'd want Thomas/Marc/Alex to agree.. (please read the cover letter for
>>> context)
>>
>> It seems suspect to me too.  In a sense it is still just synchronizing
>> the MSI address, but to a different address space.
>>
>> Is it possible to do this with the existing write_msi_msg callback on
>> the msi descriptor?  For instance we could simply translate the msg
>> address and call pci_write_msi_msg() (while avoiding an infinite
>> recursion).  Or maybe there should be an xlate_msi_msg callback we can
>> register.  Or I suppose there might be a way to insert an irqchip that
>> does the translation on write.  Thanks,
>
> I'm far from keen on the idea, but if there really is an appetite for
> more indirection, then I guess the least-worst option would be yet
> another type of iommu_dma_cookie to work via the existing
> iommu_dma_compose_msi_msg() flow, with some interface for VFIO to
> update per-device addresses direcitly. But then it's still going to
> need some kind of "layering violation" for VFIO to poke the IRQ layer
> into re-composing and re-writing a message whenever userspace feels
> like changing an address, because we're fundamentally stepping outside
> the established lifecycle of a kernel-managed IRQ around which said
> layering was designed...

for the record, the first integration was based on such distinct
iommu_dma_cookie

[PATCH v15 00/12] SMMUv3 Nested Stage Setup (IOMMU part) <https://lore.kernel.org/all/20210411111228.14386-1-eric.auger@redhat.com/#r>, patches 8 - 11

Thanks

Eric



>
> Thanks,
> Robin.
>


