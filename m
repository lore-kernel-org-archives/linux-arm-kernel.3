Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623F7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=me/PYrVLsmNCRPmt3YLLhQOu31Dt2HxN8RzThRmkvck=; b=IxHXpfdjIcO7PbuuWvoMHP8adi
	ysZ1pHUQkx+QcWfYh+ygiXB7OZkmPAamHVLWIgyKoPkzcICdS+/FH0BBriiXRAEL3bhAFM21EtKO8
	LQeVV37MJS7Qew/43fsZ+zp0Vymq6XPUwETsu6PuxrPkeDRbE1oHSBq2ctJP2cOSciiz95v1C7NpI
	tZXmNeDpQeGsdGfRHBDVYBGOkP3njb3WOqKX9J6ZWC5LlvUqi3yGvNV+1DarrMOFNNtV7cUV2L6QQ
	knYMCbgq0ungadTkE8QN4WvbLBeZe/ADBll8avwtLn9KyDv8OVyyde/0TumP1ZTwm9WaNT9z2Kslu
	A6nfxXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw210-00000008w2s-1Zwb;
	Tue, 09 Sep 2025 17:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvysy-00000007ZiX-1YLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E9261424;
	Tue,  9 Sep 2025 06:59:43 -0700 (PDT)
Received: from [10.44.160.77] (e126510-lin.lund.arm.com [10.44.160.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF773F66E;
	Tue,  9 Sep 2025 06:59:44 -0700 (PDT)
Message-ID: <203c84db-1a58-42f0-a79b-35104d79e964@arm.com>
Date: Tue, 9 Sep 2025 15:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
 <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065952_486666_C1E19E7B 
X-CRM114-Status: GOOD (  15.41  )
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

On 09/09/2025 11:21, David Hildenbrand wrote:
> On 09.09.25 04:16, Andrew Morton wrote:
>> On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky
>> <kevin.brodsky@arm.com> wrote:
>>
>>> The main change enabling nesting is patch 2, following the approach
>>> suggested by Catalin Marinas [4]: have enter() return some state and
>>> the matching leave() take that state.
>>
>> This is so totally the correct way.  Thanks.
>
> Staring at this, I wonder if we could alternatively handle it like
> pagefault_disable()/pagefault_enable(), having something like
> current->lazy_mmu_enabled.
>
> We wouldn't have to worry about preemption in that case I guess
> (unless the arch has special requirements).
>
> Not sure if that was already discussed, just a thought. 

That's an interesting point, I think I've addressed it in reply to patch
2 [1].

- Kevin

[1]
https://lore.kernel.org/all/47ee1df7-1602-4200-af94-475f84ca8d80@arm.com/

