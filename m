Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1F6C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmjzpOb1BSLSJgzl8E+e3sQpFM231jK8ASoB1iHUY7I=; b=q/vshm4a6T5MYAeTFjl5SJON9B
	7eOAUtzbyfcAEsnOZHJXqRmxsfMHUsG/Tlc7uMHsYprOtxk4UmMzdkyCksJstKRKzkoqQQqgwaMjD
	wprREABVv4qB9Qt8WNhA72FtJ6SrIH5gGkBunmxiq0Lbf4hTolzSm+0l5ncbFpp/BFBzexvKNxWmj
	JdIME+PCBbg9kY/BzuA4ivXz2XF0N+AX277Zmjj4DDIi9eCpmFz6udzeJw6Xl2t9YuTcnq3e58pp0
	IFehd1J/zvz7X8aEdM8FfQG7gYD1COhL7WJgOSroWXnyYfZ+t7k4FR+gBFy8b0vGwl4iq7xe7miFj
	S4wE8u3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkZR-0000000F9Et-3cY3;
	Fri, 04 Jul 2025 17:51:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkNN-0000000F7AU-1m8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:39:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D1C293B;
	Fri,  4 Jul 2025 10:38:50 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7A83F66E;
	Fri,  4 Jul 2025 10:39:03 -0700 (PDT)
Message-ID: <642f2fa8-cd61-47ed-9d63-a15de263d36d@arm.com>
Date: Fri, 4 Jul 2025 18:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-3-james.morse@arm.com>
 <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
 <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
 <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103905_556924_2166817C 
X-CRM114-Status: GOOD (  31.61  )
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

Hi Rob,

On 30/06/2025 20:43, Rob Herring wrote:
> On Fri, Jun 27, 2025 at 11:38 AM James Morse <james.morse@arm.com> wrote:
>> On 23/06/2025 15:48, Rob Herring wrote:
>>> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>>>> Filesystems like resctrl use the cache-id exposed via sysfs to identify
>>>> groups of CPUs. The value is also used for PCIe cache steering tags. On
>>>> DT platforms cache-id is not something that is described in the
>>>> device-tree, but instead generated from the smallest CPU h/w id of the
>>>> CPUs associated with that cache.
>>>>
>>>> CPU h/w ids may be larger than 32 bits.
>>>>
>>>> Add a hook to allow architectures to compress the value from the devicetree
>>>> into 32 bits. Returning the same value is always safe as cache_of_set_id()
>>>> will stop if a value larger than 32 bits is seen.
>>>>
>>>> For example, on arm64 the value is the MPIDR affinity register, which only
>>>> has 32 bits of affinity data, but spread across the 64 bit field. An
>>>> arch-specific bit swizzle gives a 32 bit value.
>>
>>> What's missing here is why do we need the cache id to be only 32-bits?
>>> I suppose it is because the sysfs 'id' file has been implicitly that?
>>
>> Yup, and its too late to change.
>>
>>
>>> Why can't we just allow 64-bit values there? Obviously, you can't have
>>> a 64-bit value on x86 because that might break existing userspace.
>>
>> It's the same user-space. Users of resctrl should be portable between architectures.
>> Resctrl isn't the only user, of the cache-id field.
>>
>>
>>> But for Arm, there is no existing userspace to break.
>>
>> libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Looks to me like AMD wasn't even supported til v10.8.0 (2024-10-01)[1].

'when mounted with [a particular option]'

AMDs bandwidth controls count in 1/8ths of 1GB/s - and you have to know you're running on
an AMD machine. I'm aiming for the arm64 support to be portable between Intel and RISC-V.


>> DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> 
> Is that even applied yet?

No idea, but its equally likely that I haven't found all the places this gets parsed by
user-space. I don't think we have a way of telling people using stable-kernels that we
might change the size of that field. It's pretty clear people don't anticipate it changing!

This is just the downside of exposing anything to user-space!

[...]

>>> It is obviously nice
>>> if we can avoid modifying userspace, but I don't think that's a
>>> requirement and I'd be surprised if there's not other things that need
>>> to be adapted for MPAM support.
>>
>> The whole multi-year effort has been to make existing user-space work without any ABI
>> changes. The effect is some platforms have features that can't be used because resctrl
>> expects things to be Xeon shaped.
>> But if your platform looks a bit like a Xeon (cache portion controls on the L3, memory
>> bandwidth controls somewhere that is believably the L3), then resctrl works as it does on
>> Intel. The only thing that has come a little unstuck is the 'num_rmid' property where MPAM
>> doesn't have an equivalent, so '1' is exposed as a safe value.
> 
> Fair enough, but I'd be rather surprised if there doesn't end up being
> changes to support Arm platforms.
> 
>>> Also, what if an architecture can't swizzle their value into 32-bits?
>>> They would be stuck with requiring userspace to deal with 64-bit
>>> values.
>>
>> Remap them in a more complicated way. Chances are there aren't 2^32 CPUs.

> What about using the logical CPU number instead? That's stable for a
> given machine and firmware.

Hmmm, if you offline CPU-0 then kexec, then CPU-1 becomes the new CPU-0 and the numbers
get doled out differently.


> And then instead of having 3 sets of
> numbers (MPIDR, compressed MPIDR, and logical CPU), we'd still only
> have 2. And logical CPU is what sysfs already exposes to userspace.

I don't think the linux allocated CPU number is robust enough.

We could use the CPU number as seen when walking through the DT to make it stable, but
that would still be a third type of number. It would save the arch hook to swizzle the
bits, but changing the DT would change the numbers which doesn't happen with this scheme.

Let me know if that is what you prefer.
(I'll summarise this on the cover-letter/patch-1 of the incoming series)


Thanks,

James

