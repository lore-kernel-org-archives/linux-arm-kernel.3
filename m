Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AF6D609A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDM+CZRPQ21dH1svIlz6hQF9ngitkkkIJSqO7qKjJCQ=; b=WJf+qC+Pylx/xR9dPN5+/kgVGM
	xSFZKraa64Jw6xUD2F3+4GYTeg3SorAyjIXfPeK28H2FcPoJrLlNNxEWHMERF+dRlUGooNR0in/75
	678aG6Qr2AgOCLzprDOpJHVBP56AuPprMQgU1YyFtWWaJht1mPSga6AcEaO5ypIC58A0QgOEjAjjF
	AxmeEbuqp4YOu1E+HMorwFQrhIWqTlFXpOhRa+KImsvSrQhTq6BbKPmavgVRgP7cGqA1R6bBQL8xk
	RHz8WDzETQgG4v/Q2UXMJ047ioSiGmJt6ZRxyfv90SqU5mIddlkfCzI9nRomCXexdho1QpF1HFp6i
	O33vca3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWhx-00000005QH5-2qxK;
	Tue, 16 Dec 2025 15:11:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWhu-00000005QGJ-3hWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:11:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312BAFEC;
	Tue, 16 Dec 2025 07:11:14 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 241FA3F73B;
	Tue, 16 Dec 2025 07:11:14 -0800 (PST)
Message-ID: <916c17ba-22b1-456e-a184-cb3f60249af7@arm.com>
Date: Tue, 16 Dec 2025 15:11:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] introduce pagetable_alloc_nolock()
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, catalin.marinas@arm.com,
 will@kernel.org, kevin.brodsky@arm.com, dev.jain@arm.com,
 yang@os.amperecomputing.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251212161832.2067134-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_071122_973524_DD064899 
X-CRM114-Status: GOOD (  15.71  )
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

On 12/12/2025 16:18, Yeoreum Yun wrote:
> Some architectures invoke pagetable_alloc() or __get_free_pages()
> with preemption disabled.
> For example, in arm64, linear_map_split_to_ptes() calls pagetable_alloc()
> while spliting block entry to ptes and __kpti_install_ng_mappings()
> calls __get_free_pages() to create kpti pagetable.
> 
> Under PREEMPT_RT, calling pagetable_alloc() with
> preemption disabled is not allowed, because it may acquire
> a spin lock that becomes sleepable on RT, potentially
> causing a sleep during page allocation.
> 
> Since above two functions is called as callback of stop_machine()
> where its callback is called in preemption disabled,
> They could make a potential problem. (sleeping in preemption disabled).
> 
> To address this, introduce pagetable_alloc_nolock() API.

I don't really understand what the problem is that you're trying to fix. As I
see it, there are 2 call sites in arm64 arch code that are calling into the page
allocator from stop_machine() - one via via pagetable_alloc() and another via
__get_free_pages(). But both of those calls are passing in GFP_ATOMIC. It was my
understanding that the page allocator would ensure it never sleeps when
GFP_ATOMIC is passed in, (even for PREEMPT_RT)?

What is the actual symptom you are seeing?

If the page allocator is somehow ignoring the GFP_ATOMIC request for PREEMPT_RT,
then isn't that a bug in the page allocator? I'm not sure why you would change
the callsites? Can't you just change the page allocator based on GFP_ATOMIC?

Thanks,
Ryan

> 
> Yeoreum Yun (2):
>   mm: introduce pagetable_alloc_nolock()
>   arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
> 
>  arch/arm64/mm/mmu.c  | 23 ++++++++++++++++++-----
>  include/linux/mm.h   | 18 ++++++++++++++++++
>  kernel/bpf/stream.c  |  2 +-
>  kernel/bpf/syscall.c |  2 +-
>  mm/page_alloc.c      | 10 +++-------
>  5 files changed, 41 insertions(+), 14 deletions(-)
> 
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 


