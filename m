Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69221F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0qPGiP06/FJyuhmS2u9RGZ3nvbtn35FKMvhoZt6Of0=; b=oPYTd4XwJYOJpqDwe5lie7EeIu
	KLvNlYXuz0YbPYn8o45eA6y96BU2lDPEU0Q/tmbhekJ/SDtEvoSgGy1KHmjuQlekGBINX7hFbUKHp
	F0ZDgkXtJq2hmVhTzF3nzeinkpMhSKJ2CgtO9eL6ZlynXvW1DLng6LgMtBqkspB8CeFiF/10V0ecW
	+B4x8PdVebWgnd8Q/fsYKTdqbdUiLeNz5s0EDuwPguNJ/7GRmoD46iepIPYvbgV9RXTByLw+ZGe9l
	YWYvi3X/4oCD20q9xzJkq5+XIhYAEwpBT7bfeWKHtP9uqQZE/ZvfudTnRhpW0QD4fBRHc6zkea7OM
	/YhSZ6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJX0-0000000Cpmr-3CLA;
	Fri, 10 Apr 2026 21:36:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJWx-0000000CpmV-3ilY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 21:36:49 +0000
Received: from DairyQueen (unknown [52.148.171.5])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4A00B20B710C;
	Fri, 10 Apr 2026 14:36:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4A00B20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775857005;
	bh=U0qPGiP06/FJyuhmS2u9RGZ3nvbtn35FKMvhoZt6Of0=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=PbQfq9X2IkH3uKdwQ0U9n40tSHha2wO/HIbnFwCziRNXkQy5dH/q97g/ozBnQtk7l
	 mYDKTNwkZ759hTDcYvMWl+aSk5VuMNbE0WS9tG7Es4FTjZAFUUzBUF7wD/J/uUDkx8
	 E/Fi+MzGNChm2+RKfXvQAYr12OPPASNnQ2wyBfN4=
From: "Kameron Carr" <kameroncarr@linux.microsoft.com>
To: "'Catalin Marinas'" <catalin.marinas@arm.com>
Cc: <will@kernel.org>,
	<suzuki.poulose@arm.com>,
	<steven.price@arm.com>,
	<ryan.roberts@arm.com>,
	<dev.jain@arm.com>,
	<yang@os.amperecomputing.com>,
	<shijie@os.amperecomputing.com>,
	<kevin.brodsky@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260406213317.216171-1-kameroncarr@linux.microsoft.com> <adjZpFIgXQYOvyTq@arm.com>
In-Reply-To: <adjZpFIgXQYOvyTq@arm.com>
Subject: RE: [RFC PATCH] arm64: mm: support set_memory_encrypted/decrypted for vmalloc addresses
Date: Fri, 10 Apr 2026 14:36:42 -0700
Message-ID: <001301dcc932$21cb6d80$65624880$@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDZ5dKfOR6ho5ixVw3NahcWfi2iMwMH8E/Gt8YywzA=
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_143647_981004_B765B81F 
X-CRM114-Status: GOOD (  18.14  )
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

On Friday, April 10, 2026 4:06 AM, Catalin Marinas wrote:
> Could you give more details about the user of set_memory_decrypted() on
> vmalloc()'ed addresses? I think this came up in the past and I wondered
> whether something like GFP_DECRYPTED would be simpler to implement (even
> posted a hack but without vmalloc() support). If it is known upfront
> that the memory will be decrypted, it's easier/cheaper to do this on the
> page allocation time to change the linear map and just use
> pgprot_decrypted() for vmap(). No need to rewrite the page table after
> mapping the pages.

Thank you for the review. I understand that my approach is not ideal in
terms of speed / cost. For my use case it was not an issue since the
memory is typically only initialized once during device initialization,
but I understand there could be a larger performance impact in other
uses.

The use case I am interested in is Hyper-V netvsc
(drivers/net/hyperv/netvsc.c). The network driver allocates large send
and receive buffers (typically 16MB+) with vzalloc(), then registers them
as Guest Physical Address Descriptor Lists (GPADLs) via
vmbus_establish_gpadl(). Inside __vmbus_establish_gpadl()
(drivers/hv/channel.c), set_memory_decrypted() is called on the buffer so
the hypervisor can access the shared memory.

In this use case, whether to decrypt the memory can always be known at
time of allocation, so a solution like GFP_DECRYPTED is an option.

I think I found the hack you mentioned
(https://lore.kernel.org/linux-arm-kernel/ZmNJdSxSz-sYpVgI@arm.com/). The
feedback in Michael Kelley's reply covers the key considerations well. He
likely had netvsc's use of vmalloc in mind when he made the point
"GFP_DECRYPTED should work for the three memory allocation interfaces and
their variants: alloc_pages(), kmalloc(), and vmalloc()." His other
points already cover the concerns I had in mind around handling errors
from set_memory_decrypted()/encrypted(), etc.

What is the current status of your proposed GFP_DECRYPTED implementation?
Is this something you are actively working on?

I'd be happy to work on an RFC following the GFP_DECRYPTED approach if
you think that's the right direction.

Regards,
Kameron Carr


