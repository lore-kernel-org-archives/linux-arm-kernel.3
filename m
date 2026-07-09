Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03880C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc9kU+ZgE5XODZsQBZ86ADvj/Ljvow0ueROlYCHvuAs=; b=b1vHuPZVRqa1gImpMS0dWESLSs
	BXeXWVPHS0YjdYbVhPH437jezLm4+Tc/OO7aRZqObGUzd9YlQRfM2+CrqEnU51/4PSh7TUUxD7t9g
	YiPQI4zsDvPkGi+/mn5JtlXmJ0Zy2KfUZfvvWOWQDR0GeZUgJDhuW+OSvJFz2yETMmgLVkB6GKCOh
	feH8EIg6gR1BRMzmqtdvMRiQpYzqdHFL2Q+SEHPPlGGXYGnyXgPFUFTGHCpdWpPWrq0qNT/zcd1QA
	1VycVtKYCVE87yPrTv1RNqpQZ5oc9UJiMLMvl0aIHqSaQqB5nz6/Wu4NWLrlYsDLHlB4SmVvausUU
	3TvKrx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhvZ-000000016zo-1KKM;
	Thu, 09 Jul 2026 06:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhvW-000000016yW-29tS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:08:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D9A24C0;
	Wed,  8 Jul 2026 23:07:51 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 395FA3F7B4;
	Wed,  8 Jul 2026 23:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783577275; bh=5TwAOLITC1YXoDg2mMcYupgv1n+wMrm66cLoo63ucz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ca0NrPS7WhWjH0EbrkfJ9CcgmZLP+Ci/Ix90jXf6EcrUjae7YWOHfzmh8TLgWybZL
	 mDy49MvgdKaIAQ+/FGWqal/giD0eUa2auN8dnkFFt6ShdzlIe/aWHzlXJ9xeZX7eHM
	 nA2t+0KITyq8j4vxmk0rTr15Zzt6ycKUNrq4h78w=
Message-ID: <29947b61-d2f3-4161-ac65-197cfe00a99d@arm.com>
Date: Thu, 9 Jul 2026 01:07:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] CPPC: reduce FFH feedback-counter sampling skew on
 arm64
To: Pengjie Zhang <zhangpengjie2@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, lenb@kernel.org, saket.dumbre@intel.com,
 beata.michalska@arm.com, zhenglifeng1@huawei.com, sumitg@nvidia.com,
 zhanjie9@hisilicon.com, geert+renesas@glider.be, cuiyunhui@bytedance.com,
 vanshikonda@os.amperecomputing.com, ionela.voinescu@arm.com,
 viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linuxarm@huawei.com
Cc: prime.zeng@hisilicon.com, wanghuiqiang@huawei.com, xuwei5@huawei.com,
 lihuisong@huawei.com, yubowen8@huawei.com, wangzhi12@huawei.com
References: <20260708082818.808041-1-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260708082818.808041-1-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_230802_751756_18AA7EF2 
X-CRM114-Status: GOOD (  21.18  )
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

Hi,

On 7/8/26 3:28 AM, Pengjie Zhang wrote:
> The legacy CPPC feedback-counter path reads the delivered and reference
> performance counters separately.
> 
> On arm64 systems using AMU-backed CPPC FFH counters, each FFH read is
> served through a cross-CPU counter read helper. Reading the counters
> separately therefore widens the sampling window between them and can
> skew the delivered/reference ratio used by cpuinfo_cur_freq. Under heavy
> load, the skew is observable as transient values that may exceed the
> platform maximum, as discussed in [1] and [2].
> 
> This series adds a small generic hook for architectures that can obtain
> both FFH feedback counters in one operation, while preserving the
> existing per-register read path as the fallback.
> 
> Patch 1 adds the generic CPPC hook and uses it from cppc_get_perf_ctrs().
> Patch 2 implements the hook on arm64 by sampling both AMU counters in a
> single operation on the target CPU.
> 
> For detailed test results and data demonstrating the observable skew and
> the improvements brought by this series, please refer to [3] and [4].

So, this set appears to help considerably, I have a small script which 
after setting a fixed CPU frequency proceeds to sample cpuinfo_cur_freq 
and builds the mean/stddev/stderr and worst case error percentage. Its 
really the latter that I've been focusing on. When run under varying 
workloads, local vs cross cpu, t builds what I think is a somewhat 
reasonable picture of the machine behaviors.

Given a machine that at a baseline, has an error percentage that can 
exceed 100% (ex the actual frequency is 2.4Ghz, and it can report > 
5Ghz), this patch appears to bring the worst case down to approximately 
~20%, but usually its somewhere around 5%. This is similar to the v1 of 
the jitter patch I posted, but worse than than the best sample version 
of the jitter patch I've been promising, which does a better job 
selecting the initial sample.

But combining them is magic, the tweaked version reduces that to less 
than a percent.

The combination appears good enough to consistently detect small 
variations between the requested frequencies and the rate the delivered 
clock is claiming (ex request 2600 Mhz, consistently get 2630 Mhz +- 2Mhz).


With that:

Tested-by: Jeremy Linton <jeremy.linton@arm.com>

I have a small nitpik for review, that should only be considered if for 
some reason this gets respun, but otherwise.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>




> 
> [1] https://lore.kernel.org/all/20231025093847.3740104-4-zengheng4@huawei.com/
> [2] https://lore.kernel.org/all/20231212072617.14756-1-lihuisong@huawei.com/
> [3] https://lore.kernel.org/all/443104e2-ba6e-454e-8469-909f35817a99@huawei.com/
> [4] https://lore.kernel.org/all/317d33d5-8279-4aa8-84b7-6ae1976636ac@huawei.com/
> 
> Tested-by: Sumit Gupta <sumitg@nvidia.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
> Tested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> Reviewed-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
> Changes in v2:
> - Simplified the CPPC generic layer fallback logic to prevent pointless single-read retries.
> - Added upfront register validation in the arm64 hook to avoid unnecessary IPI overhead.
> - Explicitly flipped the -EOPNOTSUPP error to -ENODEV in the arm64 hook when AMU is unsupported, cleanly bypassing redundant CPPC generic fallbacks.
> - Addressed other kernel-doc and naming feedbacks from Beata.
> - Added Reviewed-by and Tested-by tags from Vanshidhar and Sumit
> - Link to v1: https://lore.kernel.org/all/20260410094145.4132082-1-zhangpengjie2@huawei.com/
> 
> Pengjie Zhang (2):
>    ACPI: CPPC: add paired FFH feedback-counter read hook
>    arm64: topology: read CPPC FFH feedback counters in one operation
> 
>   arch/arm64/kernel/topology.c | 92 ++++++++++++++++++++++++++++++++----
>   drivers/acpi/cppc_acpi.c     | 50 ++++++++++++++++++--
>   include/acpi/cppc_acpi.h     |  7 +++
>   3 files changed, 136 insertions(+), 13 deletions(-)
> 


