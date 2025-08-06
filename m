Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05522C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WV8w6HflitnvuIZv9YRWnhVd8hrMuwqdPZeElHQ+N4=; b=Qv3Wmhg/9NBt4fmar9Y8ebTXqq
	uKG9xT1uLW4uavUAkincwIt8tJ2w+tkJEwxpnxzTmEi2eI9ZwQMTeAng/p/vvy2qISnIwlvsK+zs8
	4dXV6pwaVS8Jup8mirvtbo6/uTTj9fLgyTVR4S7GWGEH2PuoNVoOAlPAUL65TbA3MtUIDj2zoIe+L
	OBrj85GTlovyU5c0uoTX/MA4HJ8f7bwBvcJeyXtBaV/eAHmD61I0NALD00Bu0y0cZSKHNUaPs3OgT
	hdDbLz3044G5KFshlYr55WYQXAGy68mp3WsHu1CyfWhgcqpdXz9UbKqOiDKjVdv8gtteCe6E77lmz
	8r9/19mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYcV-0000000EWGL-1ydu;
	Wed, 06 Aug 2025 07:31:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYRZ-0000000EUwr-3Ps5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:20:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7141F37;
	Wed,  6 Aug 2025 00:20:04 -0700 (PDT)
Received: from [10.57.88.107] (unknown [10.57.88.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DD7F3F5A1;
	Wed,  6 Aug 2025 00:20:11 -0700 (PDT)
Message-ID: <b2d3e684-e3dc-41b5-9708-ca5926c55ebf@arm.com>
Date: Wed, 6 Aug 2025 08:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
 <20250724221216.1998696-4-yang@os.amperecomputing.com>
 <0e86671e-18bb-4f3b-9294-c583299ad49e@arm.com>
 <e65ed11d-68ef-4b9c-80ad-7e880743b3d3@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e65ed11d-68ef-4b9c-80ad-7e880743b3d3@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_002013_895935_43FB0604 
X-CRM114-Status: GOOD (  13.03  )
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

On 05/08/2025 19:53, Yang Shi wrote:

[...]

>>> +    arch_enter_lazy_mmu_mode();
>>> +    ret = split_pgd(pgd_offset_k(start), start, end);
>> My instinct still remains that it would be better not to iterate over the range
>> here, but instead call a "split(start); split(end);" since we just want to split
>> the start and end. So the code would be simpler and probably more performant if
>> we get rid of all the iteration.
> 
> It should be more performant for splitting large range, especially the range
> includes leaf mappings at different levels. But I had some optimization to skip
> leaf mappings in this version, so it should be close to your implementation from
> performance perspective. And it just walks the page table once instead of twice.
> It should be more efficient for small split, for example, 4K.

I guess this is the crux of our disagreement. I think the "walks the table once
for 4K" is a micro optimization, which I doubt we would see on any benchmark
results. In the absence of data, I'd prefer the simpler, smaller, easier to
understand version.

Both implementations are on list now; perhaps the maintainers can steer us.

Thanks,
Ryan

