Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C706C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brk7gnai6gz4UHxzLy/Nm9XzohQjir1AWQRNXEfyYAM=; b=Qjq+ps+A/hv7LdpFlqydIf3SOD
	SbqIal94JZU5A7t7w/wpAi4TODKqJ0vAYQ+xcb6gRJMZCRKFJcpabEllqBF8v/UyR40bAGSH4sL4K
	uhtCMrEV+KfcNuXrcNfY2WY+5NrtVC93G8iLz4FKX1vAoxnItJSEXA+uRPLVjhuw03PAK83g1KPL4
	2zU/niadBtOCK9z/EwThPr5WcwYg4nB1eskN+6m5abfZGBvRyRjsixNbI/rR4grRgnjahnDGQZXZb
	qMdCKTAReBdV/Xz6Gik3AKGSQxVc3NA2NvGm/XB/VPvPxsrIBFZ3IunqBFjGFUb/2LzZMHLd9JpMV
	tQWjAjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmroL-0000000GkOe-0PQq;
	Tue, 25 Feb 2025 10:05:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrXK-0000000Gfz8-2LFL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:47:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F18311516;
	Tue, 25 Feb 2025 01:47:49 -0800 (PST)
Received: from [10.57.84.186] (unknown [10.57.84.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4972E3F673;
	Tue, 25 Feb 2025 01:47:32 -0800 (PST)
Message-ID: <b39a37c8-c9b5-406d-a97a-24fa67622b49@arm.com>
Date: Tue, 25 Feb 2025 09:47:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG at arch/arm64/mm/mmu.c:185!
Content-Language: en-GB
To: Luiz Capitulino <luizcap@redhat.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
Cc: ardb@kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <will@kernel.org>
References: <a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com>
 <fe95f4c8-4b09-4d8e-99c9-987ddc2761e3@arm.com>
 <9f5600b3-6525-4045-ad1f-4408dfc9ce0f@redhat.com>
 <cf2b32a4-2217-4a31-b6d7-e60a9f4ef7dd@arm.com>
 <789c17e6-5ebc-4e37-93cd-19d24f148fd8@redhat.com>
 <dee18de8-7938-4df1-badb-c00832d6995f@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <dee18de8-7938-4df1-badb-c00832d6995f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_014734_645159_1D6D7FC1 
X-CRM114-Status: GOOD (  12.83  )
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

(Adding arm folks for visibility)

See original report here for context:
https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/

TL;DR is that 6.14 doesn't boot on Ampere Altra when kaslr is enabled.


On 20/02/2025 20:08, Luiz Capitulino wrote:
> On 2025-02-19 09:40, Luiz Capitulino wrote:
> 
>>>> Btw, I'll try to bisect again and will also try to update the system's firmware
>>>> just in case.
> 
> I tried to bisect it and again, got nowhere.
> 
> Git bisect says the first bad commit is 8883957b3c9de2087fb6cf9691c1188cccf1ac9c .
> But I'm able to boot that tree...
> 

OK, think I've found the dodgy commit:

Commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")

Based on the changes it certainly looks like it could be the issue, but I
haven't spotted exactly what the problem is yet. Ard, could you take a look?

I managed to hack multi ram bank support into kvmtool, so I can now repro the
issue in virtualization. Then was able to bisect to get to the above commit.

I'll keep digging to see if I can get to the root cause, but I suspect Ard is
best placed to hypothesise at this point.

Thanks,
Ryan

