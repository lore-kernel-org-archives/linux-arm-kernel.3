Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD6FCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKmvbTzK+90ueZ4AbighQ8tyOuU1wtuXRrG7vAo1zO0=; b=1FbCDiVfjWMY7doKK9tuvSJrSl
	76b7DiKUR4zaLRHb/4a5xEb+NECdy2gJOTW1wrjKxWCPEavSODkjlzM2+XP5srJUqgpMi6hp/IvxE
	5mcdN4ywXk8WnOejKiYeCPzDZCB6qt0KmPrI+Has9p1bocXJBOkTDjaYw3lcyNvKe0bpBD9XTRyY7
	mRJVqC5kUAon/H5/V+iAS2m2IDVyId0W27nse6AutiOUek32bGy3J0Z0qA7du2n2BTwCDM+fOMUT/
	D7DAnFib3lRap8+1tbozQBaqxHygXXCEcQuMKwX1m997CZpqfYhS6yCDAMndX3Sprs7JPyOp7AwG6
	zIMDsx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waR7p-00000001ygX-34oP;
	Fri, 19 Jun 2026 04:46:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waR7m-00000001yg4-2WUy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:46:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A24293F;
	Thu, 18 Jun 2026 21:46:32 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6433F632;
	Thu, 18 Jun 2026 21:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781844397; bh=zo7L85WEMQspgr+Xxc8ITBFT//tY1Z8VCvuSv/cXyLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFR0HsfmIgbVnXQm+nqkHxhtgz5uJsi6PxQu6nA5ExDABz7YYRT7NN2ntqyfACtfc
	 YYTLIoQYxo0u00Td35Ce4bhkgZmFJh0u8l1EU5h2mEcWWIy16lRJl/KwhmY7mFTxOW
	 hsefNn6008dILDD8tAKp+MmYZbEaeZK3tVneAAno=
Message-ID: <9abb0da8-e29a-46ce-af11-55c49b30b1b2@arm.com>
Date: Fri, 19 Jun 2026 10:16:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Lance Yang <lance.yang@linux.dev>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260613060637.40039-1-lance.yang@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260613060637.40039-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_214639_299843_AF92A20C 
X-CRM114-Status: GOOD (  13.52  )
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



On 13/06/26 11:36 am, Lance Yang wrote:
> 
> On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
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
> Hmm ... do we also need to teach the KASAN KUnit tests about this mode?
> 
> With kasan.tag_only_on_alloc=on, free-time poisoning is skipped, so
> some UAF and double-free reports are skipped on purpose, but the tests
> still expect them :)

Yeah my opinion is that we shouldn't bother - but if we go ahead with this
patch in some shape or form then I'll see how to make kasan_test work with
this.

> 
> Cheers, Lance
> 


