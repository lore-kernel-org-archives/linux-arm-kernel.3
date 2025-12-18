Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C2AD6ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw1F1nlXJHe3DyHwSaxKqYXlRuu7iBVwkmxpbMVNBYU=; b=cJYQzcyFPXjv2UvDR8Hl6TdS7j
	Xw8tLzFEqa87OzS2raGx6Fi0DO6y+DYjjx2+uuHsxdyg2JmZTS1KAhRPUSIf+5tBBDOi7j5pLbE4n
	pBBhEgW2790yGvJxnQCUVbCDNvqvOShmTtecn67ID0v6IqSz2JYREaAgJMN2dkNpyMvXZrw1Nx0C7
	Ztr7IKCcjc4/zPyjIwbW9IJlPPJz8p45fY6xckLSrRzCWFKKUg7UtowqOmrPdUxiXH0KCO1s++ehc
	cILcE/S9zoH9dUsHiydj/Txxv4nEC5KHNOvmdt+/J8jBqp5J7GZBpCh/EuFQjneNF7M1XGM/po3E1
	15OeL+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCi9-00000008OTZ-3E9C;
	Thu, 18 Dec 2025 12:02:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCi7-00000008OSx-2LX3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:02:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E31C6FEC;
	Thu, 18 Dec 2025 04:02:13 -0800 (PST)
Received: from [10.1.39.180] (unknown [10.1.39.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 029FB3F762;
	Thu, 18 Dec 2025 04:02:15 -0800 (PST)
Message-ID: <0d08b4bf-35c5-4c63-964b-ef886b8262d9@arm.com>
Date: Thu, 18 Dec 2025 12:02:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while
 stop_machine()
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, catalin.marinas@arm.com,
 will@kernel.org, kevin.brodsky@arm.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <20251212161832.2067134-3-yeoreum.yun@arm.com> <aUPJuZINNuNxddRX@tiehlicka>
 <aUPLCPAyxkPeBaoD@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aUPLCPAyxkPeBaoD@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_040223_661774_BE5F9F5E 
X-CRM114-Status: GOOD (  10.50  )
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

On 18/12/2025 09:36, Yeoreum Yun wrote:
> Hi,
>> On Fri 12-12-25 16:18:32, Yeoreum Yun wrote:
>>> linear_map_split_to_ptes() and __kpti_install_ng_mappings()
>>> are called as callback of stop_machine().
>>> That means these functions context are preemption disabled.
>>>
>>> Unfortunately, under PREEMPT_RT, the pagetable_alloc() or
>>> __get_free_pages() couldn't be called in this context
>>> since spin lock that becomes sleepable on RT,
>>> potentially causing a sleep during page allocation.
>>>
>>> To address this, pagetable_alloc_nolock().
>>
>> As you cannot tolerate allocation failure and this is pretty much
>> permanent allocation (AFAIU) why don't you use a static allocation?
> 
> Because of when bbl2_noabort is supported, that pages doesn't need to.
> If static alloc, that would be a waste in the system where bbl2_noabort
> is supported.
> 
> When I tested, these extra pages are more than 40 in my FVP.
> So, it would be better dynamic allocation and I think since it's quite a
> early time, it's probably not failed that's why former code runs as it
> is.

The required allocation size is also a function of the size of the installed RAM
so a static worst case allocation would consume all the RAM on small systems.

> 
> --
> Sincerely,
> Yeoreum Yun


