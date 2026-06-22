Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F27CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhF+Z7QvSyF8SFiHgEa+zx62DspglqwUqFsjrg9vB+A=; b=ak9gd2PB/2JqPW84NSLnLeqsAu
	tOz6Pv611Q/fluaTwftXSYnf6cY79ESoQy8y8n39tXdx9tahMjlm8qC8cXuEkIV7uOf9lgtIvDupx
	94UDtXdNe+UM0g08yY1s8h28OGiXOxJxLN6B8Q2bFC7yN0DgNDz2wA0kWmzu37YfUd3WcB9Yfbev0
	e8utO8K773GyxFgRF6q8P7GuKYGwYBxiHsQkdGEIzhSvkBtBA5+VcBYmkRE2cM9/oRnHJLZxW3YS0
	FjA1QF1f8esRZr1M6rKdwF/SgJPQM0inGGtktClfR/l1aJ3Pzt1vqeeSEYxFA6LrqcWAm8KbX/QPC
	awMTpF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiDB-00000005FDg-3IJP;
	Mon, 22 Jun 2026 17:13:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiD9-00000005FCM-0RHZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 17:13:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0191A00;
	Mon, 22 Jun 2026 10:13:19 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.1.32.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EAF23F62B;
	Mon, 22 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782148403; bh=RnwiQypkRLn7P8qYZseBV6Ihj32aR3RId+p6z4H6xw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB1cmzMzT+YCCg7NorZIa+KSxvTRYpIbv/SMaoP0VaMTLqKhCnwscEnPUCC+jZb+/
	 gaRLYTCzh177urdLiaRvwUNvASV/HdLMAMWqfK5gWm4lR38lQmrPWtcwc4xEt/s8Y+
	 xzl5xklVxQ8HOQlcmaoggGEB00Xm26zmkx0NmFW4=
Date: Mon, 22 Jun 2026 18:13:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajltLd6FQg1aMge_@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_101327_322802_9A346545 
X-CRM114-Status: GOOD (  22.33  )
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

Hi Harry,

On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
> On 6/19/26 10:19 PM, Catalin Marinas wrote:
> > On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> >> On 6/12/26 1:44 PM, Dev Jain wrote:
> >>> Now, when a memory object will be freed, it will retain the random tag it
> >>> had at allocation time. This compromises on catching UAF bugs, till the
> >>> time the object is not reallocated, at which point it will have a new
> >>> random tag.
> >>>
> >>> Hence, not catching "use-after-free-before-reallocation" and not catching
> >>> "double-free" will be the compromise for reduced KASAN overhead.
> >>
> >> I doubt users who care about security enough to enable HW_TAGS KASAN
> >> are willing to compromise on security just to save a few instructions
> >> to store tags in the free path.
> >>
> >> To me, it looks like too much of a compromise on security for little
> >> performance gain.
> > 
> > I don't think there's much compromise on security for use-after-free.
> 
> I think it depends... OH, WAIT! I see what you mean.
> 
> You mean use-after-free before reallocation does not lead to much
> compromise on security because objects are initialized after allocation?
> 
> You're probably right.
> 
> Hmm, but stores to e.g.) free pointer, fields initialized by
> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
> will be undiscovered if they happen before reallocation.

Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
(or realloc, only if the actual slab page ends up freed). But we don't
get type confusion for such slab.

However, without tagging on free, one could argue that it reduces
security for cases where the page is re-allocated as untagged - e.g. all
user pages mapped without PROT_MTE. Currently we have a deterministic
tag check fault if the page is coloured as KASAN_TAG_INVALID. I think
for this patch, it might be better to only do such skip on free in
kasan_poison_slab() rather than kasan_poison(). Freed pages would then
be tagged.

An alternative would be tagging on free only with a new tag and skipping
it on re-alloc. But we'd need to track when it's a completely new
allocation or a reused object (I haven't looked I'm pretty sure it's
doable).

-- 
Catalin

