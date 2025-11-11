Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D32CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTvP5vxQEYtfYTlHY1HTXzoO9Iicc6ibib68+E/xsbg=; b=q74C1l6icUGQueeTjGYguprJ0T
	oB7npHKMaz9535ZTYN50sQFZlzErcTiozR/SbEthdEvPr+fwsqMEezAxEBSqGZ26gWK9OFqbD5vSi
	qgqC8AdMAWSNR3sg1iLQicfRj1H9j+HD0dmdndqAatXKmMqUe7Gq+txMhWidz1fyO5EfbN9ejD2Bb
	zsULnkn1MH+UyLjAV5ZYz31rDcJxwhd/y3jHQAJPdNxpZLmPhgf5/eYthetMfLrbpxYIRj6KepUj/
	dYWJu4q2iS92RKIvC+ETnbY0kjATI5g7zHntRfWanjg3WPyI/Dc8nDtj5rZVG4WgLCjB6r4JrdIJc
	uO0ASH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInUO-00000007AiJ-02Qp;
	Tue, 11 Nov 2025 12:28:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInUL-00000007Ahi-1rFz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2558E4024C;
	Tue, 11 Nov 2025 12:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F770C116D0;
	Tue, 11 Nov 2025 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762864125;
	bh=QBPQY2h3jb/dwTv8ixDDU/KeHlFYOPsvatKmJc16Bpw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=vKxzX0wr6ntIaxsK/A53hJWE8lLaVeIm69oxgve/EX5SRbhA+pZALO6oZirT/Ncwi
	 jUAHgUFt6USdqjMZj9fX0ByuYJS9TgpZrbp1dalhANR68mARv7EpZCA7T0WH1PJ1Ql
	 s96onujRGUeSVaDS57BbFqPQIkf68jPyOfckNz/F7YWI4ppD3ttAHnnTblSm67XLjT
	 pol5Cl5oPHZO1FrLjEgRMsnDwtaPc0ktaq/LnFNnSlUNquxzwSPzCDjgAhEJFgeLAs
	 gL80VUVermJRjuSoQ1suChEgy3U4XFDrDNGY9Up2R4zc8gDnU4jVyVobAoZ1wjVhx/
	 DQX5sdotI1TDA==
Message-ID: <2093f05a-542f-4d4d-b8e9-22b14d0a7a4c@kernel.org>
Date: Tue, 11 Nov 2025 13:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: Jan Polensky <japo@linux.ibm.com>, catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, will@kernel.org
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
 <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
 <aRMTdt5tqJhjLgGd@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <e2b1339f-89da-4500-b638-c915e15d6c09@kernel.org>
Content-Language: en-US
In-Reply-To: <e2b1339f-89da-4500-b638-c915e15d6c09@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_042845_518845_3B8E25C6 
X-CRM114-Status: GOOD (  16.75  )
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

On 11.11.25 13:27, David Hildenbrand (Red Hat) wrote:
> On 11.11.25 11:44, Jan Polensky wrote:
>> On Mon, Nov 10, 2025 at 10:53:33AM +0100, David Hildenbrand (Red Hat) wrote:
>>> On 10.11.25 10:48, Jan Polensky wrote:
>>>> On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
>>>>> On 09.11.25 01:36, Jan Polensky wrote:
>> ---8<--- snip ---8<---
>>>>> I wonder if the following would work:
>>>>>
>>>>>
>>>>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>>>>> index 65db9349f9053..56b82e116cb79 100644
>>>>> --- a/include/linux/gfp_types.h
>>>>> +++ b/include/linux/gfp_types.h
>>>>> @@ -47,7 +47,9 @@ enum {
>>>>>            ___GFP_HARDWALL_BIT,
>>>>>            ___GFP_THISNODE_BIT,
>>>>>            ___GFP_ACCOUNT_BIT,
>>>>> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>>>>>            ___GFP_ZEROTAGS_BIT,
>>>>> +#endif
>>>>>     #ifdef CONFIG_KASAN_HW_TAGS
>>>>>            ___GFP_SKIP_ZERO_BIT,
>>>>>            ___GFP_SKIP_KASAN_BIT,
>>>>> @@ -85,7 +87,11 @@ enum {
>>>>>     #define ___GFP_HARDWALL                BIT(___GFP_HARDWALL_BIT)
>>>>>     #define ___GFP_THISNODE                BIT(___GFP_THISNODE_BIT)
>>>>>     #define ___GFP_ACCOUNT         BIT(___GFP_ACCOUNT_BIT)
>>>>> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>>>>>     #define ___GFP_ZEROTAGS                BIT(___GFP_ZEROTAGS_BIT)
>>>>> +#else
>>>>> +#define ___GFP_ZEROTAGS                0
>>>>> +#endif
>>>>>     #ifdef CONFIG_KASAN_HW_TAGS
>>>>>     #define ___GFP_SKIP_ZERO       BIT(___GFP_SKIP_ZERO_BIT)
>>>>>     #define ___GFP_SKIP_KASAN      BIT(___GFP_SKIP_KASAN_BIT)
>>>>>
>>>>>
>>>>> Likely we'd have to make __HAVE_ARCH_TAG_CLEAR_HIGHPAGE a proper
>>>>> kconfig option.
>>>>>
>>>>>
>>>>> Then we could turn the default implementation of
>>>>> tag_clear_highpage() into a BUILD_BUG.
>>>>>
>>>> I'd like to suggest to keep the enum untouched and only use the second
>>>> part of your suggestion.
>>>
>>> Why? We also do that for CONFIG_KASAN_HW_TAGS, CONFIG_LOCKDEP and
>>> CONFIG_SLAB_OBJ_EXT.
>> If we remove the enum entry, we’d also need to update mmflags.h because
>> the trace macros reference it.
>> Enums are compile-time only, so they don’t affect the generated binary.
>> My thought was to keep the enum list as it is and just apply the second
>> part of your suggestion.
>> That way, the trace definitions stay consistent without extra changes.
>> Just an idea, happy to go with whatever you prefer.
> 
> I think we'd remove the enum value as well, because then there is no way
> it could accidentally be reused.
> 
> And yes, as you correctly state we'll have to update mmflags as well
> like we did for CONFIG_KASAN_HW_TAGS etc.

/me realizing that my mail client decided to use yet another mail alias, 
I hope I have it fixed now such that everything is sent from my 
kernel.org account ...

-- 
Cheers

David

