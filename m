Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B16CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 05:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5bCXodPHqNgsofT7Pcf+Vb8635LLVTlUVg6eKsgs7g=; b=EgBhqV6hSQQwj/XMJ2I4MCVXA+
	hIF8U/xn9KqxUkWThlSgEwM2Hp/wM8ox508B5EzTGiUIIK6bGWes1ZljbD68Uh4FS0gz+H93iNyP6
	G81nr6XeyyuiIZlLjVL/5K6V/ntWIppLa+jcxk9Aq0DqGOM1/reN3/ZlGQRHOFWMBlJw6LJKPjk6i
	ZCXp+eim1QooxvKXh6dQMpspM3T9sGhhl446KC+3phnUkxgcwZVtb1IYrgfaA0iHUoDQ2rdmuczwY
	nmOlXxMvhpuxBYbz9zthUBy0GZS0eS7tqjeKg8YUGNmON+G/DBSEfVt/TUbZZaMGWk7kRgz8f0Oph
	xdDpTE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRbm-00000001zyQ-0UzF;
	Fri, 19 Jun 2026 05:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRbj-00000001zy2-1b4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 05:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76614AAB;
	Thu, 18 Jun 2026 22:17:28 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BD7B3F763;
	Thu, 18 Jun 2026 22:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781846253; bh=UThYL4n3yi6FB/4PoyNwX/qX7QaXgn7Gb48t1iB6IKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbC5I6eQoGomv8iGJRU8jQqKcwcUpT/e7lp0AiVrdoygvnUoDpQjvVmjGorL3UAXP
	 w1GwO3Kp0D5vrukU9KyYZFT9t245gW6WCyFF1N0+HiO3wjEiGOqU+ePMrs++JmKKeZ
	 W8b3YrHwfkgim0X3khHlwDzSR8867W8+SDC7NVR4=
Message-ID: <5173a464-5f2c-431c-a3e3-16356f8cb873@arm.com>
Date: Fri, 19 Jun 2026 10:47:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Ryan Roberts <ryan.roberts@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, anshuman.khandual@arm.com,
 kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
 will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_221735_526100_DB4EA9BD 
X-CRM114-Status: GOOD (  23.01  )
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



On 18/06/26 7:18 pm, Ryan Roberts wrote:
> On 12/06/2026 05:44, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects. This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>>
>> Now, when a memory object will be freed, it will retain the random tag it
>> had at allocation time. This compromises on catching UAF bugs, till the
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catching
>> "double-free" will be the compromise for reduced KASAN overhead.
> 
> Does standard KASAN with HW_TAGS really detect double-free? How does it do that?
> I could imagine it testing the tags of memory being freed to see if they are set
> to the poison tag, but that would lead to false positives for the GFP_SKIP_KASAN
> case, surely?

Should have mentioned, the double-free check is only for slab objects, see
__kasan_slab_pre_free. So we won't be able to catch double-free here.

> 
> If I'm right, then the only downgrade this new mode causes is that if
> freed-but-not-yet-reallocated memory is accessed via it's dangling pointer, then
> that bad access is not detected. I think that would be benign in all the cases I
> can think of, so while it would be a problem for a debugging use case, it would
> unlikely be a problem for security enforcement?

Okay so you are saying that we won't catch the bug, but there is no security problem
because the dangling pointer is accessing memory which isn't in use by anyone else.


> 
> Thanks,
> Ryan
> 
> 
>>
>> This is an RFC because we are not clear about the performance benefit.
>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
> 


