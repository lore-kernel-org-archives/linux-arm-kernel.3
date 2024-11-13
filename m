Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348ED41C3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paG34W9RuUFqjynCcqmF9vylDQ8hE8NgKGEWL4OoefM=; b=vNaPU+onuwHvgs+Bj632aH1CfG
	P8upVyx3PupBWA5BOFIJBg24atqPAvUPiYUzJXwlNld2j7XEA4RQ1Z2Rrgd/WUKd3eHw9Q57BVx2p
	xTbTZ5IAPrVOs83+X4AhlXfEVfpX7kr+Oc1IepSH3lSF4sevBjq/lnSiTjd92bseQtbFCu+Sur+1z
	GZRPMzPR5j0OJjhjQ9EBuJD6Ek+hRBOOxnTKvdghdd+1W8PLnS0dYnF0CiOf/ygefJudqG6uVqU1f
	Ns7maeQa9yFRiMhS7HKalSK5LviYd2oQsVJ5LnB7PIlQDIAHge7LkhqEJ2gqEy4qE/e5ktKGWa/G5
	eqKFF6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCwy-00000006qYQ-2t82;
	Wed, 13 Nov 2024 12:58:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCvA-00000006qF7-0Wun
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738261655;
	Wed, 13 Nov 2024 04:56:58 -0800 (PST)
Received: from [10.1.38.177] (XHFQ2J9959.cambridge.arm.com [10.1.38.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D103C3F66E;
	Wed, 13 Nov 2024 04:56:25 -0800 (PST)
Message-ID: <ed43da27-30bf-4f9d-a952-3d1fe80c5302@arm.com>
Date: Wed, 13 Nov 2024 12:56:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Content-Language: en-GB
To: Petr Tesarik <ptesarik@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <20241111131442.51738a30@mordecai.tesarici.cz>
 <046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
 <20241112104544.574dd733@mordecai.tesarici.cz>
 <5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
 <20241112115039.41993e4b@mordecai.tesarici.cz>
 <20241113134038.5843ab73@mordecai.tesarici.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241113134038.5843ab73@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_045632_287179_BD605386 
X-CRM114-Status: GOOD (  25.15  )
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

On 13/11/2024 12:40, Petr Tesarik wrote:
> On Tue, 12 Nov 2024 11:50:39 +0100
> Petr Tesarik <ptesarik@suse.com> wrote:
> 
>> On Tue, 12 Nov 2024 10:19:34 +0000
>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>>> On 12/11/2024 09:45, Petr Tesarik wrote:  
>>>> On Mon, 11 Nov 2024 12:25:35 +0000
>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>     
>>>>> Hi Petr,
>>>>>
>>>>> On 11/11/2024 12:14, Petr Tesarik wrote:    
>>>>>> Hi Ryan,
>>>>>>
>>>>>> On Thu, 17 Oct 2024 13:32:43 +0100
>>>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:    
>>>>> [...]    
>>>>>> Third, a few micro-benchmarks saw a significant regression.
>>>>>>
>>>>>> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
>>>>>> slower with variable page size. I don't know why, but I'm looking into
>>>>>> it. The system() library call was also about 18% slower, but that might
>>>>>> be related.      
>>>>>
>>>>> OK, ouch. I think there are some things we can try to optimize the
>>>>> implementation further. But I'll wait for your analysis before digging myself.    
>>>>
>>>> This turned out to be a false positive. The way this microbenchmark was
>>>> invoked did not get enough samples, so it was mostly dependent on
>>>> whether caches were hot or cold, and the timing on this specific system
>>>> with the specific sequence of bencnmarks in the suite happens to favour
>>>> my baseline kernel.
>>>>
>>>> After increasing the batch count, I'm getting pretty much the same
>>>> performance for 6.11 vanilla and patched kernels:
>>>>
>>>>                         prc thr   usecs/call      samples   errors cnt/samp 
>>>> getenv (baseline)         1   1      0.14975           99        0   100000 
>>>> getenv (patched)          1   1      0.14981           92        0   100000     
>>>
>>> Oh that's good news! Does this account for all 3 of the above tests (getenv,
>>> getenvT2 and system())?  
>>
>> It does for getenvT2 (a variant of the test with 2 threads), but not
>> for system. Thanks for asking, I forgot about that one.
>>
>> I'm getting substantial difference there (+29% on average over 100 runs):
>>
>>                         prc thr   usecs/call      samples   errors cnt/samp  command
>> system (baseline)         1   1   6937.18016          102        0      100     A=$$
>> system (patched)          1   1   8959.48032          102        0      100     A=$$
>>
>> So, yeah, this should in fact be my priority #1.
> 
> Further testing reveals the workload is bimodal, that is to say the
> distribution of results has two peaks. The first peak around 3.2 ms
> covers 30% runs, the second peak around 15.7 ms covers 11%. Two per
> cent are faster than the fast peak, 5% are slower than slow peak, the
> rest is distributed almost evenly between them.

FWIW, One source of bimodality I've seen on Ampere systems with 2 NUMA nodes is
placement of the kernel image vs placement of the running thread. If they are
remote from eachother, you'll see a slowdown. I've hacked this source away in
the past by effectively using only a single NUMA node (with the help of
'maxcpus' and 'mem' kernel cmdline options).

> 
> 100 samples were not sufficient to see this distribution, and it was
> mere bad luck that only the patched kernel originally reported bad
> results. I can now see bad results even with the unpatched kernel.
> 
> In short, I don't think there is a difference in system() performance.
> 
> I will still have a look at dup() and VMA performance, but so far it
> all looks good to me. Good job! ;-)

Thanks for digging into all this!

> 
> I will also try running a more complete set of benchmarks during next
> week. That's SUSE Hack Week, and I want to make a PoC for the MM
> changes I proposed at LPC24, so I won't need this Ampere system for
> interactive use.
> 
> Petr T


