Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F347E909C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=111An18P5NPZp2WnP5EsC/86se1pm0vl8ebi8m+L0Is=; b=j5jhyh7BulzVIUGar9vhtFyV2O
	PT2KJmtosEK6vaRYMbJ/YaOryyHK4lvu89mChXTRwp3qJQO9jJpyc2KJjKGPjPR47F+oKrUkfxo9G
	A+Boc06CrKM1BLriBFJVJSczawf3b6MfXJNygk/1koIesjAdrirKRCb/nIUYrKHtGqisJo5ikzPr4
	quEoTpnx91r2qzenN+kaRGX3F97Nq8vToyhTi4nTUdN+GcIyFe5ameNDOB6ULMws8jc6ruFum9KKo
	prbZpCl520OnTsY/V+GoqLhg1AFOC24xJYEllhAIUtI0HGj4e/p9z8SHAEjAfUsdjmHzxxzIba8dC
	dFdF82uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNM2-00000008WW0-1TUF;
	Tue, 17 Feb 2026 15:51:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNM0-00000008WVe-0JQl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 712C61477;
	Tue, 17 Feb 2026 07:51:04 -0800 (PST)
Received: from [10.1.30.186] (XHFQ2J9959.cambridge.arm.com [10.1.30.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACF763F632;
	Tue, 17 Feb 2026 07:51:07 -0800 (PST)
Message-ID: <0a772015-f9ea-4c7b-a42f-393a2f591f98@arm.com>
Date: Tue, 17 Feb 2026 15:51:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, catalin.marinas@arm.com,
 will@kernel.org, ardb@kernel.org, hughd@google.com,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
 <2e68ef61-dcf2-46b2-913f-14980a104faf@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2e68ef61-dcf2-46b2-913f-14980a104faf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_075112_252612_F8C9D417 
X-CRM114-Status: GOOD (  22.57  )
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

On 17/02/2026 15:30, David Hildenbrand (Arm) wrote:
> On 2/17/26 16:22, Matthew Wilcox wrote:
>> On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
>>> 2. Generic Linux MM enlightenment
>>> ---------------------------------
>>> We enlighten the Linux MM code to always hand out memory in the granularity
>>
>> Please don't use the term "enlighten".  Tht's used to describe something
>> something or other with hypervisors.  Come up with a new term or use one
>> that already exists.
>>
>>> File memory
>>> -----------
>>> For a growing list of compliant file systems, large folios can already be
>>> stored in the page cache. There is even a mechanism, introduced to support
>>> filesystems with block sizes larger than the system page size, to set a
>>> hard-minimum size for folios on a per-address-space basis. This mechanism
>>> will be reused and extended to service the per-process page size requirements.
>>>
>>> One key reason that the 64K kernel currently consumes considerably more memory
>>> than the 4K kernel is that Linux systems often have lots of small
>>> configuration files which each require a page in the page cache. But these
>>> small files are (likely) only used by certain processes. So, we prefer to
>>> continue to cache those using a 4K page.
>>> Therefore, if a process with a larger page size maps a file whose pagecache
>>> contains smaller folios, we drop them and re-read the range with a folio
>>> order at least that of the process order.
>>
>> That's going to be messy.  I don't have a good idea for solving this
>> problem, but the page cache really isn't set up to change minimum folio
>> order while the inode is in use.

Dev has a prototype up and running, but based on your comments, I'm guessing
there is some horrible race that hasn't hit yet. Would be good to debug the gap
in understanding at some point!

> 
> In a private conversation I also raised that some situations might make it
> impossible/hard to drop+re-read.
> 
> One example I cam up with if a folio is simply long-term R/O pinned. But I am
> also not quite sure how mlock might interfere here.
> 
> So yes, I think the page cache is likely the one of the most problematic/messy
> thing to handle.
> 

I guess we could side step the problem for now, by initially requiring that the
minimum folio size always be the maximum supported process page size. That would
allow us to get something up and running at least. But then we lose the memory
saving benefits.

Of course, I'm conveniently ignoring that not all filesystems support large
folios, but perhaps we could do a generic fallback adapter with a bounce buffer
for that case?


