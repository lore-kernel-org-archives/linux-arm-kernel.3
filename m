Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4234ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XoqbKVIcU5m2EYrvfB8gunMpgJ7GPNHrFcOOL/XShk=; b=EafD/qFX731Q8JYwCahIjF81ad
	HGU2uql2Extkn4Y6Z9l0CpwXj4o+CjRYFMQys/zzOujKsXzbOTW4HgwrGzEYYU1jYfsCGqIBUHDKT
	vGRTyoFvI62qOO/I1gKfYi8NrNIMjOk6HQWhbOlCWXDCR0l/CYfbW35PlV4Dmk6pDWCWM0ww68NMy
	uGVa8sJMGaJD/DRyAU1mpOS/a5+X+6AE+D+VwicVA20FOtNuYyR/CvXJdjLzbszT1NFEq+udzEvxu
	ttOuNVwviTXq15sRT3w16G+LK086rTKtvg4l7/aqFPf0C5nyEp7/exbwp3FKvrqpOmAgHyeQ1SgXG
	EaOYpWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waD6M-00000001O7d-3XBb;
	Thu, 18 Jun 2026 13:48:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waD6K-00000001O7G-0oX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:48:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C3516F8;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
Received: from [10.1.25.219] (XHFQ2J9959-3.cambridge.arm.com [10.1.25.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96A63F915;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781790488; bh=4+3YH9+OATahnfK6V4DDGPracyWuXKqHO5B9kHTtB+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDBPkiAL2u8VTbYCHCj8Av31c5gef+OAcJThQqRjNlf20cUZNt5BoVAu5U09JiYRP
	 q2TDscpDjuJODPCb0KxbMEttDvPKMyn5gHiQSi6xN+ZZlRcdvnm6Qr/yJJLwh+Uv6w
	 neXc2gCyt2w7AESd32PfSu+02EtHqxsUFsqDUaRI=
Message-ID: <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Date: Thu, 18 Jun 2026 14:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, anshuman.khandual@arm.com,
 kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
 will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_064812_288383_DC3081EB 
X-CRM114-Status: GOOD (  18.72  )
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

On 12/06/2026 05:44, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.

Does standard KASAN with HW_TAGS really detect double-free? How does it do that?
I could imagine it testing the tags of memory being freed to see if they are set
to the poison tag, but that would lead to false positives for the GFP_SKIP_KASAN
case, surely?

If I'm right, then the only downgrade this new mode causes is that if
freed-but-not-yet-reallocated memory is accessed via it's dangling pointer, then
that bad access is not detected. I think that would be benign in all the cases I
can think of, so while it would be a problem for a debugging use case, it would
unlikely be a problem for security enforcement?

Thanks,
Ryan


> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 


