Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F1D32D75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JQNvIKvzwZQGEHrsZ3sSnuvOwvNsdWPbA2dI8+nQ2E=; b=AyFKn5W4TI3NETUfKDyfRdZrv8
	l/cF5JwdP5YcBXKYdZ3ADWH0GHOIAC4jj8QJ6auW7g1TPNRsKxmsqVLI9M+e2VodBNuNU6frl0h1v
	zU+dSC1aHAu24ygzQM/he3AKIbT1EiJQwjkVHd7RBX4UhnUFLL5JNx7ZhCfK3dhTN66ydV7GjHlsq
	5dHgMbpM550QhTDsvrbYQbpuT8WD2ewydpVaqFJNlaaCUirU6BqGwGZ0cXszXNDpIvV1OCft+1gRd
	yzkIGSfujyojTXEUUxY1wybieP2DnsJytk16mi/akDgRtliG2WlTWzyQcNnmWdkE1m+dE4SVop4pY
	xYg/fOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoBM-000000033S6-06cq;
	Tue, 12 Nov 2024 10:31:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnzn-0000000313c-2rd3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:19:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B44C25E4;
	Tue, 12 Nov 2024 02:20:08 -0800 (PST)
Received: from [10.57.89.175] (unknown [10.57.89.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9683F66E;
	Tue, 12 Nov 2024 02:19:35 -0800 (PST)
Message-ID: <5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
Date: Tue, 12 Nov 2024 10:19:34 +0000
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241112104544.574dd733@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021939_810313_51780396 
X-CRM114-Status: GOOD (  17.52  )
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

On 12/11/2024 09:45, Petr Tesarik wrote:
> On Mon, 11 Nov 2024 12:25:35 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Hi Petr,
>>
>> On 11/11/2024 12:14, Petr Tesarik wrote:
>>> Hi Ryan,
>>>
>>> On Thu, 17 Oct 2024 13:32:43 +0100
>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>> [...]
>>> Third, a few micro-benchmarks saw a significant regression.
>>>
>>> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
>>> slower with variable page size. I don't know why, but I'm looking into
>>> it. The system() library call was also about 18% slower, but that might
>>> be related.  
>>
>> OK, ouch. I think there are some things we can try to optimize the
>> implementation further. But I'll wait for your analysis before digging myself.
> 
> This turned out to be a false positive. The way this microbenchmark was
> invoked did not get enough samples, so it was mostly dependent on
> whether caches were hot or cold, and the timing on this specific system
> with the specific sequence of bencnmarks in the suite happens to favour
> my baseline kernel.
> 
> After increasing the batch count, I'm getting pretty much the same
> performance for 6.11 vanilla and patched kernels:
> 
>                         prc thr   usecs/call      samples   errors cnt/samp 
> getenv (baseline)         1   1      0.14975           99        0   100000 
> getenv (patched)          1   1      0.14981           92        0   100000 

Oh that's good news! Does this account for all 3 of the above tests (getenv,
getenvT2 and system())?

> 
>> You probably also saw the conversation with Catalin about the cost vs benefit of
>> this series. Performance regressions will all need to be considered in the cost
>> column, of course. So understanding the root cause and trying to reduce the
>> regression as much as possible will increase chances of getting it accepted
>> upstream.
> 
> Yes. Now that the biggest number is off the table, I'm going to:
> 
>  - look into the dup() slowdown
>  - verify whether VMA split/merge operations are indeed slower
> 
> Petr T


