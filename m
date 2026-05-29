Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2D9CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtH8EAmvqZSbaipGcXqbfvMaLUl7NiYH5Y5wqwunt3g=; b=BDBxmhXNs/PHWwCv7dF1qJPAPw
	CgWTcjqlUEf9h5KcBU4IgBxeGAZa4Loiy5HzAu2pNDVRNHMz/xp/YYIRhaPU2scKwJ/b3PioayntE
	Q56C2idj5I3lsv271aFlJB7PPZY9mGPu2iOizk8TR0gyy9IF9j6/eIFMgBWa2Mwvgf14bO50pjQEJ
	2A2HQw59M+sIcXHQHkwrpxkpFpJqBW44fr5zfOEE6OJKmhfq6vpwdh9V5CnveAfZoFfYFSq9zJ9BD
	8dMxsQqpjLm1fjHTxEEUBHKUmNu2j3rlA5GeT9840KDcAUxZ56wuGJh0KRsLUv+933EdTrvfXnHvo
	+8JiWjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvFq-00000007Gdh-36LJ;
	Fri, 29 May 2026 11:19:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvFo-00000007GdB-2bqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:19:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77DC7403E7;
	Fri, 29 May 2026 11:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF071F00899;
	Fri, 29 May 2026 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780053591;
	bh=xtH8EAmvqZSbaipGcXqbfvMaLUl7NiYH5Y5wqwunt3g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VmEQNF8A0z8+1KzIlCnBSO2nUEjqvajOvCGEzAL61RGw93MGpbxmK5hJDcK4X+hgg
	 UZKxfoV+OrLA00JLpRYVuEnk2+zG0EcpjagS5/KmFt0OlhLC2p/e7meFVlfDWD7qGs
	 nXTLDmbcXuJ39EZkHnlth4IqaeCi/xiYBJKbRQwcygEsAdh9ylf/Ou+VU97yLvZ9Cs
	 KUHV7496Qj6cK1kjLuE0clbEqRyZChdum1FkQtJgv1XKb+hiJafgFN/nxu3gSZRMV6
	 cHZPnxD8vXnSD0ap3nn/GVB5hOYSMxIec2bGVi+edJ+wzEHCTm2BRGVHuY+7qP1zKL
	 Hwp9v0rR9TS9A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id ED4F7F40074;
	Fri, 29 May 2026 07:19:49 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Fri, 29 May 2026 07:19:49 -0400
X-ME-Sender: <xms:VXYZakI5lWrnjge3izJfszwDrLDqJlPb7nZ0fT2HU7TYrL3TCplw0g>
    <xme:VXYZau-AYVOUF9zWLtiR3lm77FNmKJDLXiNWTgXWm9kM2PbUtk5JH_BTb9XckEQOf
    IM6xKd0uVlGv-Af0EaHgCLAEeZ07MDo1zAmw0HyV4We9otTLxNO-NQ>
X-ME-Proxy-Cause: dmFkZTFogum++9uuClw8cy4SxNf1uWqqkvv8W4zIXBwA82RSASLtxRMehGsMOXMDBhgeWs
    nqlmwZCFKVFfLIVlHXs/McboQpxGj3Pf/Ca9vw5Fnwc460UfhaDDOmaD3qvEx/I9yot16o
    HKbvIb5r5GxP5YIN93FaDmoekYS17nZB9LNN3lQjM9012YeqOgV9t7nikOyyFsfLmoVLay
    2YMvHAVZxPo//ZDllLTAZWgQ4dya84DY5uFQ7jgZWp0nWHWbC6LnXyanKW9V439JwchFGC
    I+7TQCdJ0Aia8Y6Nx/jquUp5kpwJr9SFRPG5NT61F+6w8immYHkB9rO2MG46U9M4rAtks7
    FeYlv48F9dDSBaNVIhgiLyXG0PEVVdSqnyDVJK19Q8VZKEv7FqVxTjyauoS88acTjMpWp/
    wnyx9eq5Q+f5wK4egPUSKqhj7maPxidfHDG1WybBbDoe8hefgi9mzbvN6wOxEvLi4ThE/i
    MCWVLp78FR3MwE532+oBLLfeGjmhf6gZyKHjLuYhzMxUvJnYMpPai18akdXzsdwQK2aSsn
    wpp1RuigsjRmFaaIsnA306F8hDP1J0Fxb+aIo+N2kmBwBA8HAEREHRMnLbSamezdfHC6Ve
    s9QaINOtjR8mBOL8OW8amM7Webdd9NcpxVnF5I+lLv9XwA9CwYgWN6RjMV6w
X-ME-Proxy: <xmx:VXYZanXYdNwCH4CsxKGeZZp6kszaQ63Ocg-v04B-teUHBstDlEmyMg>
    <xmx:VXYZamBp3-MPM4qn2rsNYhHpzsmmVdV5g6OjHCmDaSXkN1v4jHu47w>
    <xmx:VXYZag7SWu0rxSwEDztJtlk8ygBpxPpuf624jcXQ5GC0FR4qM0qwuw>
    <xmx:VXYZaqsRBvAntj4cnVkJkSyhoVKFoo__reIoGcw406RrMsk5tE-WSw>
    <xmx:VXYZagzZ6tepEBQMivW1UkJKqyKitg7wfO0OdNyGrhha1AuEusqO4XPX>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1546182007A; Fri, 29 May 2026 07:19:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 29 May 2026 13:19:29 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Jann Horn" <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <96a8b6b9-71f2-4550-bbbb-fbfa146f4e6a@app.fastmail.com>
In-Reply-To: <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-26-ardb+git@google.com>
 <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
Subject: Re: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end of kernel
 image
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041952_727262_B9520A03 
X-CRM114-Status: GOOD (  16.96  )
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


On Fri, 29 May 2026, at 10:27, Kevin Brodsky wrote:
> On 26/05/2026 19:58, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Move the fixmap and kasan page tables out of the BSS section, and place
>> them at the end of the image, right before the init_pg_dir section where
>> some of the other statically allocated page tables live.
>>
>> These page tables are currently the only data objects in vmlinux that
>> are meant to be accessed via the kernel image's linear alias, and so
>> placing them together allows the remainder of the data/bss section to be
>> remapped read-only or unmapped entirely.
>>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/include/asm/mmu.h    | 2 ++
>>  arch/arm64/kernel/vmlinux.lds.S | 8 +++++++-
>>  arch/arm64/mm/fixmap.c          | 6 +++---
>>  arch/arm64/mm/kasan_init.c      | 2 +-
>>  4 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>> index 5e1211c540ab..fb95754f2876 100644
>> --- a/arch/arm64/include/asm/mmu.h
>> +++ b/arch/arm64/include/asm/mmu.h
>> @@ -13,6 +13,8 @@
>>  
>>  #ifndef __ASSEMBLER__
>>  
>> +#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
>> +
>>  #include <linux/refcount.h>
>>  #include <asm/cpufeature.h>
>>  
>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
>> index e1ac876200a3..2b0ebfb30c63 100644
>> --- a/arch/arm64/kernel/vmlinux.lds.S
>> +++ b/arch/arm64/kernel/vmlinux.lds.S
>> @@ -349,9 +349,15 @@ SECTIONS
>>  	_edata = .;
>>  
>>  	/* start of zero-init region */
>> -	BSS_SECTION(SBSS_ALIGN, 0, 0)
>> +	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
>>  	__pi___bss_start = __bss_start;
>>  
>> +	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
>> +	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
>
> Do we actually need the NOLOAD type here?

Yes, otherwise it is emitted as PROGBITS, resulting in all of BSS to be
emitted into Image.


