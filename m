Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13090E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g16VAzdXjk7el24eci4KwOplqZTjTQcO4xOI6aGpkE=; b=NlZ+CdZEFiOj5tqvwoWT2OXQOX
	nyIkOfErc8/XgX2OYZ98ahc/yGB6sn2gsCeIe1DnQCuATZgMG7eUE47ANG/Ltcrt0h6Eu7OitW58/
	1ENyqSz/KMSDFKxJvTMJBt2ujl9SKwsQQoycHa8Z6nioVe7slVfR2Er11xR1gv9f0OTkeqxMRt6rW
	Kxrr8U9CKeMD57ym6tDZIgrorUFwqjWICMpsulpTI4xkzY6bEBcQUQzskLVQus7RbZaLG7nxQEYEo
	TtIkJhXCX9ADaQZcQ329UHM1sblTPo9CDni4Cl2tOF5wPOi73UmNHvEFW0YnxuSMEJHuAsskjQqRa
	FFPxDo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdvt-00000009Ys0-43pQ;
	Wed, 18 Feb 2026 09:33:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdvq-00000009Yrc-3V02
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:33:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF2021477;
	Wed, 18 Feb 2026 01:33:11 -0800 (PST)
Received: from [10.57.81.199] (unknown [10.57.81.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281A43F7F5;
	Wed, 18 Feb 2026 01:33:15 -0800 (PST)
Message-ID: <b56d5ba7-46ba-4a4c-9266-70d7e63530cc@arm.com>
Date: Wed, 18 Feb 2026 09:33:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map
 creation
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jack Aboutboul <jaboutboul@microsoft.com>,
 Sharath George John <sgeorgejohn@microsoft.com>,
 Noah Meyerhans <nmeyerhans@microsoft.com>,
 Jim Perrin <Jim.Perrin@microsoft.com>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh>
 <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
 <2026021718-citrus-parakeet-dc60@gregkh>
 <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
 <2026021758-subsidy-tinfoil-ee2c@gregkh>
 <20e320d2-749a-4379-a236-5dbe3d52b07f@arm.com>
In-Reply-To: <20e320d2-749a-4379-a236-5dbe3d52b07f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_013318_998489_9694ACA9 
X-CRM114-Status: GOOD (  21.53  )
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

On 17/02/2026 14:43, Ryan Roberts wrote:
> On 17/02/2026 14:26, Greg KH wrote:
>> On Tue, Feb 17, 2026 at 02:21:30PM +0000, Ryan Roberts wrote:
>>> On 17/02/2026 14:10, Greg KH wrote:
>>>> On Tue, Feb 17, 2026 at 01:58:36PM +0000, Ryan Roberts wrote:
>>>>> On 17/02/2026 13:50, Greg KH wrote:
>>>>>> On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
>>>>>>> Hi All,
>>>>>>>
>>>>>>> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
>>>>>>> some speed ups to enable significantly faster booting on systems with a lot of
>>>>>>> memory. The patches were originally posted at:
>>>>>>>
>>>>>>>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
>>>>>>>
>>>>>>> ... and were originally merged upstream in v6.10-rc1.
>>>>>>>
>>>>>>> I'm requesting this be merged to stable on behalf of a partner who wants to get
>>>>>>> the benefit of this series in Debian 12.
>>>>>>
>>>>>> Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
>>>>>> would be able to justify moving to a newer kernel for performance
>>>>>> reasons, why enable them to stay on an older one, just delaying the
>>>>>> inevitable upgrade they will have to do anyway in a year or so?
>>>>>
>>>>> I can't answer this presicely, but I did ask and push for that approach. As I
>>>>> understand it, they are stuck with Debian 12, which is stuck with kernel 6.1.
>>>>> The Debian maintainer apparently requested that these go through stable in order
>>>>> to get them into Debian 12.
>>>>
>>>> I understand the position of Debian not wanting to take patches for new
>>>> features that are not already upstream, but really, Debian offers a
>>>> newer kernel for hardware that wants to use it for things like this,
>>>> right?  Why not just use that instead?
>>>
>>> Let me go push a bit harder. But I expect we are in the grey zone between bug
>>> and feature here; this is a performance bug fix, not a new feature. By
>>> selectively backporting I'm guessing they are avoiding the risk of new features
>>> that a new kernel brings introducing new bugs? I'm guessing there is a higher
>>> qualification bar for that.
>>
>> That's a broken "qualification system" if that is the case, given that
>> the patches that flow back into stable kernel releases should be
>> triggering "full qualification" if anyone actually paid attention to
>> what goes into there :)
>>
>> Anyway, good luck!  And same for 6.1.y, if they are ok with 6.6.y, why
>> would they even care about 6.1.y?
> 
> The request was only for 6.1. I did 6.6 as well for continuity; I didn't want it
> to get slow again if they moved from 6.1 to 6.6. It's already fixed in 6.12.

Hi Greg,

I thought a bit more about this overnight, and decided I wanted to have one more
go at convincing you...

In case you didn't read the commit logs, this series fixes a pretty nasty
performace bug; for a machine with 512G of RAM, it previously took 17.5 seconds
to create the linear map, and with the changes, it's down to 1.2 seconds. That's
quite a big quality-of-life improvement if you are booting VMs regularly.
(personally I hit this quite a bit).

It's a low risk change - it's been in since v6.10 and is part of arm64's core
boot path - and no issues have ever been raised.

Are you sure this isn't the sort of change that should be considered for stable?

Thanks,
Ryan


> 
> 
>>
>> thanks,
>>
>> greg k-h
> 


