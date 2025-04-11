Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF35C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQdjS8wEVI0RSkbTJN7+BoJg6JW5UQYaGPhCYbApfk0=; b=mJqeBxLXUsqgb3lQZxkmAmSoEM
	a06qec8usy2o7w63qjXcHFKXm6xotYkejL5L2gLXA1V4fkvCeah930OLvo7vp0CRY2gEkD4lE1IXt
	3ygAl9M1OVQbsa6UJ6o7xrvyFkJbakoHdl22cGP6rqhVV2nKs+MSSjgbJwHnsRER6/xdDiTws8FpW
	IMP0CFZJXg+NR4gY4bikw9nyI8Op7kNjUxB2ziLLkRNmf41l0ct8RVN9wLiiDvsTSHjhulV6WhXf8
	jyhTvgJAQlDYm2psxoTNGhqvFxPlBa+UGen2lD9Oqoka+4s0xvpUbz1pUCyCvafg+5WSE41LlUTZb
	rBO5BABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dw1-0000000DpBp-3QW1;
	Fri, 11 Apr 2025 12:56:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dda-0000000DlWv-07bd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:37:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E3F106F;
	Fri, 11 Apr 2025 05:37:37 -0700 (PDT)
Received: from [10.57.72.36] (unknown [10.57.72.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F003F694;
	Fri, 11 Apr 2025 05:37:31 -0700 (PDT)
Message-ID: <5bad616f-8a62-46f4-9c0c-929f4ab1dde0@arm.com>
Date: Fri, 11 Apr 2025 14:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/18] pkeys-based page table hardening
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
 <Z_jfGlOEb4Bjl3vO@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z_jfGlOEb4Bjl3vO@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053738_180435_CD863CCB 
X-CRM114-Status: GOOD (  13.92  )
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

On 11/04/2025 11:21, Ingo Molnar wrote:
> * Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> Performance
>> ===========
>>
>> Caveat: these numbers should be seen as a lower bound for the overhead
>> of a real POE-based protection. The hardware checks added by POE are
>> however not expected to incur significant extra overhead.
>>
>> +-------------------+----------------------------------+------------------+---------------+
>> | Benchmark         | Result Class                     | Without batching | With batching |
>> +===================+==================================+==================+===============+
>> | mmtests/kernbench | elsp-64                          |            0.20% |         0.20% |
>> |                   | syst-64                          |            1.62% |         0.63% |
>> |                   | user-64                          |           -0.04% |         0.05% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/fork      | fork: p:1                        |      (R) 225.56% |        -0.07% |
>> |                   | fork: p:512                      |      (R) 254.32% |         0.73% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/munmap    | munmap: p:1                      |       (R) 24.49% |         4.29% |
>> |                   | munmap: p:512                    |      (R) 161.47% |     (R) 6.06% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 14.80% |    (R) 11.85% |
>> |                   | fix_size_alloc_test: p:4, h:0    |       (R) 38.42% |    (R) 10.47% |
>> |                   | fix_size_alloc_test: p:16, h:0   |       (R) 64.74% |     (R) 6.41% |
>> |                   | fix_size_alloc_test: p:64, h:0   |       (R) 79.98% |     (R) 3.24% |
>> |                   | fix_size_alloc_test: p:256, h:0  |       (R) 85.46% |     (R) 2.77% |
>> |                   | fix_size_alloc_test: p:16, h:1   |       (R) 47.89% |         3.10% |
>> |                   | fix_size_alloc_test: p:64, h:1   |       (R) 62.43% |         3.36% |
>> |                   | fix_size_alloc_test: p:256, h:1  |       (R) 64.30% |     (R) 2.68% |
>> |                   | random_size_alloc_test: p:1, h:0 |       (R) 74.94% |     (R) 3.13% |
>> |                   | vm_map_ram_test: p:1, h:0        |       (R) 30.53% |    (R) 26.20% |
>> +-------------------+----------------------------------+------------------+---------------+
> So I had to look 3 times to figure out what the numbers mean: they are 
> the extra overhead from this hardening feature, measured in system time 
> percentage, right?

These are relative increases compared to the baseline for this series
(described earlier on: 6.15-rc1 + 2 additional series). Real time is
measured, except for kernbench where all 3 measurements are provided.

> So "4.29%" means there's a 4.29% slowdown on that particular workload 
> when the feature is enabled. Maybe add an explanation to the next iteration? :-)

Yes that's right. I thought it was clear from the description above but
evidently I was wrong :) I'll add a "plain text" reading like this one
in the next version. I should also have mentioned which config was used,
namely: defconfig + CONFIG_KPKEYS_HARDENED_PGTABLES=y

- Kevin

