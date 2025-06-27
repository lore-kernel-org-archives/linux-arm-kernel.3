Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84171C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1MfYjfC2Qc4xBmDLjcOEpJYWjzkr9xA1YQcLlLnjmo=; b=ZnQbljMOjVBy7TuOWiSmfRTi6w
	98jbolYiAIbl6VHYF+ESRC/Q4Z+t1sBow5QpuHA/srTKbcuahG6nX5mbqUIn48rfy3ZoWOiRAQlET
	J38a605youSSMDppI2aKqzaRM+F6iQ/x8SpfwrC0PHxqOi0+FmVB3wVPQTPxt/Oq1uOsGRwB3CjZz
	HIDki+pPU2A85nPhtyt8UTpQHWxRNkr5Uu8gUmX4pkWMOBOnGPiwipsBhPwPPHct/RmZ6/ht4DMDh
	EdIu2KCtklHaOibLeIlQ/8rcgnZcqz00l8fHQUnBCXJGspUYwNOFbUOkPLm2DMexwCbm4Ib/Sk0sC
	+dGUMzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVD60-0000000FQnv-0OjY;
	Fri, 27 Jun 2025 17:42:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC67-0000000FIs7-37SH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:38:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E571F1A00;
	Fri, 27 Jun 2025 09:38:23 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83CE3F58B;
	Fri, 27 Jun 2025 09:38:39 -0700 (PDT)
Message-ID: <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
Date: Fri, 27 Jun 2025 17:38:38 +0100
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
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093843_856846_FF13B95C 
X-CRM114-Status: GOOD (  24.24  )
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

On 23/06/2025 15:48, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>> Filesystems like resctrl use the cache-id exposed via sysfs to identify
>> groups of CPUs. The value is also used for PCIe cache steering tags. On
>> DT platforms cache-id is not something that is described in the
>> device-tree, but instead generated from the smallest CPU h/w id of the
>> CPUs associated with that cache.
>>
>> CPU h/w ids may be larger than 32 bits.
>>
>> Add a hook to allow architectures to compress the value from the devicetree
>> into 32 bits. Returning the same value is always safe as cache_of_set_id()
>> will stop if a value larger than 32 bits is seen.
>>
>> For example, on arm64 the value is the MPIDR affinity register, which only
>> has 32 bits of affinity data, but spread across the 64 bit field. An
>> arch-specific bit swizzle gives a 32 bit value.

> What's missing here is why do we need the cache id to be only 32-bits?
> I suppose it is because the sysfs 'id' file has been implicitly that?

Yup, and its too late to change.


> Why can't we just allow 64-bit values there? Obviously, you can't have
> a 64-bit value on x86 because that might break existing userspace.

It's the same user-space. Users of resctrl should be portable between architectures.
Resctrl isn't the only user, of the cache-id field.


> But for Arm, there is no existing userspace to break.

libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/


> Even with 32-bits,
> it is entirely possible that an existing userspace assumed values less
> than 32-bits and would be broken for Arm as-is.

Sure, but I've not found a project where that is broken yet.


> It is obviously nice
> if we can avoid modifying userspace, but I don't think that's a
> requirement and I'd be surprised if there's not other things that need
> to be adapted for MPAM support.

The whole multi-year effort has been to make existing user-space work without any ABI
changes. The effect is some platforms have features that can't be used because resctrl
expects things to be Xeon shaped.
But if your platform looks a bit like a Xeon (cache portion controls on the L3, memory
bandwidth controls somewhere that is believably the L3), then resctrl works as it does on
Intel. The only thing that has come a little unstuck is the 'num_rmid' property where MPAM
doesn't have an equivalent, so '1' is exposed as a safe value.


> Also, what if an architecture can't swizzle their value into 32-bits?
> They would be stuck with requiring userspace to deal with 64-bit
> values.

Remap them in a more complicated way. Chances are there aren't 2^32 CPUs.


I'll add something about the libvirt example to the commit message.


Thanks,

James

