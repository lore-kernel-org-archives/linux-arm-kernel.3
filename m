Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84332CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywmDAG7PE2fj1+B2GkU5RbYTyU3sAGy8lTlonC3Qgos=; b=hWQqgFpreT+HYOV3lF1SjhieB7
	eFGRFV2O8zqMou1AZrj4EFKKqG7sNBVCkweV06MqM7F3ypcMdeKJ1147WDeqdNxHgJcV4LmSB4JBU
	2wS5v/s35xkzfozfZg+S0kcaVOFKKPnELbf/h5fRvAIW4JFTTEQIC2YJA3ZGPsNbG2EE6kTNseAXO
	z3ddZtlMLCIgmwwGKy3AtPUAlIVjbYzmcZaFpff4JEI+tNcLJ7HvZjAk9CXff5tc4rMkK+qLeRZHi
	/WTmhPU4tWngk7peAMMNro481E7L0FYvDZBmN+ZocWjAn3tbO3Y4zzrD/eNYSeG8bGUiRTPBhUcZT
	XCDDhNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYsG-00000002xWm-0h71;
	Fri, 05 Sep 2025 16:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVSx-00000001fM3-3tgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2012D153B;
	Fri,  5 Sep 2025 05:22:46 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7BF93F63F;
	Fri,  5 Sep 2025 05:22:48 -0700 (PDT)
Message-ID: <a18f9cbd-490d-4270-8707-4ed6d730cfcd@arm.com>
Date: Fri, 5 Sep 2025 14:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 <Liam.Howlett@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
 <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
 <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
 <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052256_002254_1CC734DC 
X-CRM114-Status: GOOD (  11.94  )
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

On 05/09/2025 13:37, Lorenzo Stoakes wrote:
> On Fri, Sep 05, 2025 at 12:21:40PM +0100, Lorenzo Stoakes wrote:
>> You should really base on mm-new.
>>
>> You need to account for everything that is potentially going to go
>> upstream. mm-stable is generally not actually populated all too well until
>> shortly before merge window anyway.
> Just to note that mm-unstable is also fine. Despite its name, it's substantially
> more stable than mm-new, which can even break the build and appears to have no
> checks performed on it at all.

Thanks for the overview - I had a general idea about those branches but
I wasn't sure what the standard practice was. I'll rebase on mm-unstable
to start with.

- Kevin

