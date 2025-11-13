Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC7BCD5BC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohi7P5eV57bnPL8yOBPJ/r4sop8jgVpznI8QMYNvtwM=; b=mY3HXEk8N1qBbe8NbDdi7tz77q
	vQ0P/JtKUkEnCAHiANr62MvvG+nNK2gZKz3wkQCn98SdGeuN5IB1LNdhBtc/71a7OHzp5VVKnb7jP
	8IG2wHMgr0v/Ptzav9446qgUU2GaVHpDgjfkqR69Ts+MtV4XtoUI+LFh7H52IY6SkHjSVLSWlBO0u
	GSwH8MG/ZoVJXSEZoDksXMag+HwlB72Thdl+aN+njIaPoYJ6lqUOB7sE8dDZ/OQxlpU1ozObPehXR
	X9/ZUvQBo0nLtJQa+C6kT6Dj+Rn+IaYzAVoN/obhIgKQYVy798xQpFaUIkYd7ZptM+g1zAbdVIslS
	G025EDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVWS-0000000AOVq-2ZkY;
	Thu, 13 Nov 2025 11:29:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVWQ-0000000AOVS-0dBF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:29:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3691C12FC;
	Thu, 13 Nov 2025 03:29:41 -0800 (PST)
Received: from [10.57.88.12] (unknown [10.57.88.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5B363F66E;
	Thu, 13 Nov 2025 03:29:47 -0800 (PST)
Message-ID: <3d4b96ed-60a8-446a-b34a-44c083ad25ff@arm.com>
Date: Thu, 13 Nov 2025 11:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Content-Language: en-GB
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <3af5d651-5363-47f7-b828-702d9a0c881c@arm.com>
 <a6eec165-9c48-56aa-8b05-6bf73411e4bf@gentwo.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a6eec165-9c48-56aa-8b05-6bf73411e4bf@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_032950_253146_D9E59C7F 
X-CRM114-Status: GOOD (  19.53  )
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

On 12/11/2025 17:11, Christoph Lameter (Ampere) wrote:
> On Wed, 12 Nov 2025, Ryan Roberts wrote:
> 
>> I have a long-term aspiration to enable "per-process page size", where each user
>> space process can use a different page size. The first step is to be able to
>> emulate a page size to the process which is larger than the kernel's. For that
>> reason, I really dislike introducing new ABI that exposes the geometry of the
>> kernel page tables to user space. I'd really like to be clear on what use case
>> benefits from this sort of information before we add it.
> 
> One is user space where you want to "emulate" other page sizes and the
> other is kernel space.
> 
> The per process page size is likely going to end up
> being a per VMA page size since these address spaces can be shared and the
> VMA is already containing information about huge pages, memory policies
> and other stuff relatd to memory layout. And yes it would be great to have
> an accounting of the page sizes used in a VMA.

See my response to Yang. I suspect my issue shouldn't really be a consideration
for this patch.

> 
> 
>> nit: arm64 tends to use the term "linear map" not "direct map". I'm not sure why
>> or what the history is. Given this is arch-specific should we be aligning on the
>> architecture's terminology here? I don't know...
> 
> Other architectures are already exposing this data via the terminology
> used here. The information is useful for seeing if there is an issue with
> small pages that could be impacting kernel performance. It is surprising
> coming from oter architectures that this information is not readily
> available.
> 


