Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14392CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luo1Ov/b5IyQpa8UKyF/DHHKjh2UGvVi519fgAGadtU=; b=mBYlHC/nZyDU1goBTmJnUP4tL9
	+IQ3vV92QqkT540+CR53EgtfomM4fKIbC4W9nEONj/D2kGoERa1/F3+jWn/s+Kp03sSOEmmkt2H2P
	K0rcfV8ENilJr8QaNgSUUFWPdGfs/FncAKLnlfEjjzPZ60sCQuNOqag0Zw3lPRLKEbqyUhb2rHliq
	A2WhCrtPZN7E3ESaiGekLYulX9bUuPsYb2qBk8U4BbteOWM40M26Cf4DqWU0cRjHYcTXIIN1fSP+t
	AL9Uwm4/UQ+buQC3GGjqsA2zKdnSyQoTyrsfZ7hw8WIaV6S1GHPrIG2pxwS2Uo0/I/0UY2uz7e5zk
	mnSRPXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG97-00000000k5R-03Me;
	Tue, 19 May 2026 08:49:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG95-00000000k49-29md;
	Tue, 19 May 2026 08:49:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61AF234FC;
	Tue, 19 May 2026 01:49:38 -0700 (PDT)
Received: from [10.57.24.124] (unknown [10.57.24.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E89C3F85F;
	Tue, 19 May 2026 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779180583; bh=2ItcKLOHuYuo+5+zg3nAK5dtbbWOEusz4M2dKNduT5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHWhEtQu0+j3+QsOWr2nLpXICsL3AQVNq2V7x/fb/XyRGPAKRbuSINGm0ljae0+i8
	 9z42OdtXMowoLE3td48keL3MFMfcrE2qLP+5ACkvZROnd4D2JJ9PLo2A8+sjpZLK8t
	 k19/XatDyTfkXHKjdvr06k8CRJ9nVozmozjNf8GY=
Message-ID: <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
Date: Tue, 19 May 2026 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?=
 <marcin.slusarz@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Florent Tomasin
 <florent.tomasin@arm.com>, nd@arm.com
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora> <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora> <agMvb_jeRsO7tSS-@e142607>
 <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
 <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora>
 <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
 <20260519093955.448ff899@fedora>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20260519093955.448ff899@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014947_637355_22923F69 
X-CRM114-Status: GOOD (  49.81  )
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

On 19/05/2026 09:39, Boris Brezillon wrote:
> On Mon, 18 May 2026 17:36:40 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
>> On Mon, May 18, 2026 at 12:16 AM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>>>
>>> On Wed, 13 May 2026 12:31:32 -0700
>>> Chia-I Wu <olvaffe@gmail.com> wrote:
>>>   
>>>> On Tue, May 12, 2026 at 8:39 AM Liviu Dudau <liviu.dudau@arm.com> wrote:
>>>>>
>>>>> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
>>>>>> On Tue, 12 May 2026 14:47:27 +0100
>>>>>> Liviu Dudau <liviu.dudau@arm.com> wrote:
>>>>>>   
>>>>>>> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
>>>>>>>> On Thu, 7 May 2026 11:02:26 +0200
>>>>>>>> Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
>>>>>>>>   
>>>>>>>>> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
>>>>>>>>>>> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
>>>>>>>>>>>                      return ret;
>>>>>>>>>>>      }
>>>>>>>>>>>
>>>>>>>>>>> +   /* If a protected heap name is specified but not found, defer the probe until created */
>>>>>>>>>>> +   if (protected_heap_name && strlen(protected_heap_name)) {
>>>>>>>>>>
>>>>>>>>>> Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
>>>>>>>>>> name is "" already?
>>>>>>>>>
>>>>>>>>> If dma_heap_find() will fail, then the whole probe with fail too.
>>>>>>>>> This check prevents that.
>>>>>>>>
>>>>>>>> Yeah, that's also a questionable design choice. I mean, we can
>>>>>>>> currently probe and boot the FW even though we never setup the
>>>>>>>> protected FW sections, so why should we defer the probe here? Can't we
>>>>>>>> just retry the next time a group with the protected bit is created and
>>>>>>>> fail if we can find a protected heap?
>>>>>>>
>>>>>>> The problem we have with the current firmware is that it does a number of setup steps at "boot"
>>>>>>> time only. One of the steps is preparing its internal structures for when it enters protected
>>>>>>> mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
>>>>>>> process when we have a group with protected mode set.
>>>>>>
>>>>>> No, but we can force a full/slow reset and have that thing
>>>>>> re-initialized, can't we? I mean, that's basically what we do when a
>>>>>> fast reset fails: we re-initialize all the sections and reset again, at
>>>>>> which point the FW should start from a fresh state, and be able to
>>>>>> properly initialize the protected-related stuff if protected sections
>>>>>> are populated. Am I missing something?
>>>>>
>>>>> Right, we can do that. For some reason I keep associating the reset with the
>>>>> error handling and not with "normal" operations.
>>>> I kind of hope we end up with either
>>>>
>>>>   - panthor knows the exact heap to use and fails with EPROBE_DEFER if
>>>> the heap is missing, or
>>>>   - panthor gets a dma-buf from userspace and does the full reset
>>>>     - userspace also needs to provide a dma-buf for each protected
>>>> group for the suspend buffer
>>>>
>>>> than something in-between. The latter is more ad-hoc and basically
>>>> kicks the issue to the userspace.
>>>
>>> Indeed, the second option is more ad-hoc, but when you think about it,
>>> userspace has to have this knowledge, because it needs to know the
>>> dma-heap to use for buffer allocation that cross a device boundary
>>> anyway. Think about frames produced by a video decoder, and composited
>>> by the GPU into a protected scanout buffer that's passed to the KMS
>>> device. Why would the GPU driver be source of truth when it comes to
>>> choosing the heap to use to allocate protected buffers for the video
>>> decoder or those used for the display?
>> I don't think the GPU driver is ever the source of truth. If the
>> system integrator wants to specify the source of truth (SoT) from
>> kernel space, they should use the device tree (or module params /
>> config options). If they want to specify the SoT in userspace, then we
>> don't really care how it is done other than providing an ioctl.
>> Panthor is always on the receiving end.
> 
> Okay, we're on the same page then.
> 
>>
>> If we don't want to delay this functionality, but it takes time to
>> converge on SoT, maybe a solution that is not a long-term promise can
>> work? Of the options on the table (dt, module params, kconfig options,
>> ioctls), a kconfig option, potentially marked as experimental, seems
>> like a good candidate.
> 
> If Panthor is only a consumer, I actually think it'd be easier to just
> let userspace pass the protected FW section as an imported buffer
> through an ioctl for now. It means we don't need any of the
> modifications to the dma_heap API in this series, and userspace is free
> to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
> somehow (envvar, driconf, ...). The only thing we need to ensure is if
> lazy protected FW section allocation is going to work, but given the
> current code purely and simply ignores those sections, and the FW is
> still able to boot and act properly (at least on v10-v13), I'm pretty
> confident this is okay, unless there's some trick the MCU can do to
> detect that the protected section isn't mapped (which I doubt, because
> the MCU doesn't know it lives behind an MMU).
> 
> Of course, once we have a consensus on how to describe this in the DT,
> we can switch Panthor over to "protected dma_heap selection through DT",
> and reflect that through the ioctl that exposes whether protected
> support is ready or not (would be a DEV_QUERY), such that userspace can
> skip this "PROTM initialization" step.
> 
> We're talking about an extra ioctl to set those buffers, and a
> DEV_QUERY to query the state (ready or not), the size of the global
> protected buffer (protected FW section) and the size of the protected
> suspend buffer. The protected suspend buffer would be allocated and
> passed at group creation time (extra arg passed to the existing
> GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
> in term of maintenance cost.

If we can avoid the dma-heap changes, then that would surely help!
I can try to implement this in the next version unless someone finds a 
reason why it is a bad idea.

>>>> For the former, expressing the relation in DT seems to be the best,
>>>> but only if possible :-). Otherwise, a kconfig option (instead of
>>>> module param) should be easier to work with.
>>>>
>>>> Looking at the userspace implementation, can we also have an panthor
>>>> ioctl to return the heap to userspace?
>>>
>>> Yes, it's something we can add, but again, I'm questioning the
>>> usefulness of this: how can we ensure the heap used by panthor to
>>> allocate its protected FW buffers is suitable for scanout buffers
>>> (buffers that can be used by display drivers). There needs to be a glue
>>> leaving in usersland and taking the decision, and I'm not too sure
>>> trusting any of the component in the chain (vdec, gpu, display) is the
>>> right thing to do.
>> The heap returned by panthor is only for panfrost/panvk. It says
>> nothing about compatibility with other components on the system.
> 
> Okay, if it's used only for internal buffers, I guess that's fine.

--
Ketil

