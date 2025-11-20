Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC945CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t7hmruR6MWJpSfcv7dicfOBqMxal2u0/ahXPnRgxiY=; b=tk8NJo7aHu+zyF/IRxQ7J9DW8+
	Nl6xuD9SH52w5OMsOupZqiq+/ta47XzwZ5nS/rkmXti1rQ4Oznbi9lYRJ7M6DD/ppUw/mWju1f1nn
	5XK20GtTIMZSynJPjLhVeeLOFVpMB7aCXy5Z7sk/KPEXBIZseceZic1nPpJoTR2wufEAK/CK59qZA
	PNcEdP6Tc5R6MxMxDDejOy8bondKRKMpBpAQuCUUf6tifQz+FbqP85g1QVYIALhwyWntPdjNuBqXY
	Z4/A6mzjj2at5daWOlaTBMiOQX8q3Bz3snZuFOD/sWB4UVlasnKty4b47AmuMR6JezI6gC3O6mXu7
	teVd+v3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw0S-000000067JR-2nk2;
	Thu, 20 Nov 2025 04:10:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw0N-000000067IT-1OCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 04:10:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66122FEC;
	Wed, 19 Nov 2025 20:10:36 -0800 (PST)
Received: from [10.164.18.59] (MacBook-Pro.blr.arm.com [10.164.18.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED693F740;
	Wed, 19 Nov 2025 20:10:41 -0800 (PST)
Message-ID: <01c00163-ec81-41ba-ba4d-c3425e2109f7@arm.com>
Date: Thu, 20 Nov 2025 09:40:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, ryan.roberts@arm.com, rppt@kernel.org,
 shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com> <aR4GhuhEISNSSbUf@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aR4GhuhEISNSSbUf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_201047_412263_A8B240EE 
X-CRM114-Status: GOOD (  16.25  )
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


On 19/11/25 11:33 pm, Catalin Marinas wrote:
> On Wed, Nov 12, 2025 at 11:57:15AM +0530, Dev Jain wrote:
>> The rodata=on security measure requires that any code path which does
>> vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
>> too. Therefore, if such a call fails, we must abort set_memory_* and caller
>> must take appropriate action; currently we are suppressing the error, and
>> there is a real chance of such an error arising post commit a166563e7ec3
>> ("arm64: mm: support large block mapping when rodata=full"). Therefore,
>> propagate any error to the caller.
>>
>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> v1 of this patch: https://lore.kernel.org/all/20251103061306.82034-1-dev.jain@arm.com/
>> I have dropped stable since no real chance of failure was there.
> I couldn't figure out from the comments on v1 whether Will's concern was
> addressed:
>
> https://lore.kernel.org/all/aQn4EwKar66UZ7rz@willie-the-truck/
>
> IOW, is the patch necessary? What are the failure scenarios and what

The patch is necessary because rodata=on requires us to proceed with
set_memory_* *only* if the linear map alias permission change was successful.
If we still go ahead with the set_memory_*, you now have memory in
RO state, whereas the linear map alias is in RW state, defeating the purpose
of rodata = on.

> does the caller do? It's good to propagate an error to the caller but
> patch also changes the current behaviour by bailing out earlier.

The caller will get to know that set_memory_* failed. Since we may have
bailed out partially in between the linear map alias permission change,
we must also ensure that we change that memory back to RW - vm_reset_perms()
will ensure that, and that change back to RW is *guaranteed* to succeed
in the calls to set_area_direct_map() in vm_reset_perms(): as explained
in the next patch, since that memory is non-RW, it is guaranteed to be
pte-mapped.

Now, it is the responsibility of the caller to pass VM_FLUSH_RESET_PERMS
*before* it does set_memory_ro/set_memory_rox. If it doesn't, then the
code is broken as is (Ryan noted earlier how this is a fragility in the
vmalloc API and we should do something about it).

>

