Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D81CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYbnAayVJ5j0xB1k23z8SMycFu9vSF8PiQYLB5iMyog=; b=zsSoQE0/uxzWJD3+O77/H5C7VN
	PotcGXGCD5NOeiicV3q0Z5boesStEIF1Pl0OoUq63tQXj4V5PzWkrg2jkxLqkf+T/3qQtM7/okg9d
	yhWvcn1GqHHbQrNN6Qn2AvKENDk5UK44qOIW9SH4BK9tODcfbRN6qAkoYZUjJhdFLQnSyeFUCt5BR
	gdw6zoLJgnjCdkCu726H1I/wIJe0paVa8lduiXhUf1Bi7dJAVeRlU6D21JNgsFTWHPxyH6Inu1Nx4
	v5P3TnVsObBQAbnBnD1SdRt6+WIp6pdzOOZ6z9aBkeGBuOflmdOuQ0QWLYZ9RfIcWOY/9i8+AYkR+
	7VDnVVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYjn-00000002txK-0Jnc;
	Fri, 05 Sep 2025 15:52:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVIG-00000001ave-2Wy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:11:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0A1B153B;
	Fri,  5 Sep 2025 05:11:42 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F093F63F;
	Fri,  5 Sep 2025 05:11:45 -0700 (PDT)
Message-ID: <66335cf3-d49d-4b27-a37b-0a8a5e2c5d78@arm.com>
Date: Fri, 5 Sep 2025 14:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Nesting support for lazy MMU mode
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_051152_683532_CA730FD9 
X-CRM114-Status: GOOD (  16.57  )
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

On 05/09/2025 11:46, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:29PM +0100, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> When the lazy MMU mode was introduced eons ago, it wasn't made clear
>> whether such a sequence was legal:
>>
>> 	arch_enter_lazy_mmu_mode()
>> 	...
>> 		arch_enter_lazy_mmu_mode()
>> 		...
>> 		arch_leave_lazy_mmu_mode()
>> 	...
>> 	arch_leave_lazy_mmu_mode()
> I did not take too deep - sorry if you already answered this.
> Quick question - whether a concern Ryan expressed is addressed
> in general case?

The short answer is yes - it's good that you're asking because I failed
to clarify this in the cover letter!

> https://lore.kernel.org/all/3cad01ea-b704-4156-807e-7a83643917a8@arm.com/
>
> 	enter_lazy_mmu
> 		for_each_pte {
> 			read/modify-write pte
>
> 			alloc_page
> 				enter_lazy_mmu
> 					make page valid
> 				exit_lazy_mmu
>
> 			write_to_page
> 		}
> 	exit_lazy_mmu
>
> <quote>
> This example only works because lazy_mmu doesn't support nesting. The "make page
> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
> page can be accessed in write_to_page. If nesting was supported, the inner
> exit_lazy_mmu would become a nop and write_to_page would explode.
> </quote>

Further down in the cover letter I refer to the approach Catalin
suggested [4]. This was in fact in response to this concern from Ryan.
The key point is: leave() keeps the lazy MMU mode enabled if it is
nested, but it flushes any batched state *unconditionally*, regardless
of nesting level. See patch 3-6 on the practical implementation of this;
patch 7 also spells it out in the documentation.

Hope that clarifies the situation!

- Kevin

[4] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/

