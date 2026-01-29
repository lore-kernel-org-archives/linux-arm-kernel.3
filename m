Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF9D61020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou8aEa1YQVlADNN2kZXagSLJecIFsEzOiRKw24V0L5E=; b=ThUR1b/BgyJR6XdP5yFhEoAK1X
	eU5nqEjBjwZpvMMXtEQ+Rpb1LQotVAqHvfOsiX9rcMbcCR7EERTlzITzUq+OgmmQbyP48N35P7ofW
	ydryyKJrKHcFCweZQ3rqtyhZRdifOoleTfDZn2dAHXazAvZUoZOKl5MmNdtJhyNBTsoeMy5bvpiB7
	yRrRJg2pxoNTBOixq60XQUcvUrP79c93tJFb+v3XD0pwnPMLIYeqS/c9cVPYdSJChX1BEkqz5gdDi
	XZBAjfVXWYJwcoFK9c9Ftv9LmktmDCAWBJb77XTvi/FvpghcypPsmMIGtOeFu0u2TJg/hW/0viMpX
	oefbsHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTjw-00000000GDY-2dsW;
	Thu, 29 Jan 2026 15:15:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTjt-00000000GCl-1RSC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:15:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ou8aEa1YQVlADNN2kZXagSLJecIFsEzOiRKw24V0L5E=;
	b=gKrzNFXOodrIsazLMBMrD+LQc9ftyhqaCIdDOVgbEgqIZJFCQ4lANYqClNlj2SPpvHrBUBMbu
	4g6VArbryeSMHJTTzbDlVHWxrGNDPcDeLJlRN5ntTpzoeMUALArnEO7d6NhDxZmr4riS0WbTdvH
	phMb88QtLazQZ0hRcte6Mro=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f22k84mZnz1BFng
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:14:40 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ou8aEa1YQVlADNN2kZXagSLJecIFsEzOiRKw24V0L5E=;
	b=gKrzNFXOodrIsazLMBMrD+LQc9ftyhqaCIdDOVgbEgqIZJFCQ4lANYqClNlj2SPpvHrBUBMbu
	4g6VArbryeSMHJTTzbDlVHWxrGNDPcDeLJlRN5ntTpzoeMUALArnEO7d6NhDxZmr4riS0WbTdvH
	phMb88QtLazQZ0hRcte6Mro=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f22df1KqVz1T4GT;
	Thu, 29 Jan 2026 23:10:46 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 74AC240537;
	Thu, 29 Jan 2026 23:15:00 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 23:15:00 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 29 Jan 2026 23:14:59 +0800
Message-ID: <d8639ed9-63d9-4a61-8cce-72f4b7fcb872@huawei.com>
Date: Thu, 29 Jan 2026 23:14:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: wangyushan <wangyushan12@huawei.com>
Subject: Re: [RFT PATCH 0/7] perf tool: Support iostat for multiple platforms
To: Ian Rogers <irogers@google.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <peterz@infradead.org>, <john.g.garry@oracle.com>,
	<Jonathan.Cameron@huawei.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <CAP-5=fWkBjJy2i=e+zn1Ou5g3J8rapGKi8O7ryQ-ic2vXFEOoQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAP-5=fWkBjJy2i=e+zn1Ou5g3J8rapGKi8O7ryQ-ic2vXFEOoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_071521_787399_3381FEC3 
X-CRM114-Status: GOOD (  35.91  )
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



On 1/27/2026 1:01 AM, Ian Rogers wrote:
> On Mon, Jan 26, 2026 at 4:35 AM Yushan Wang <wangyushan12@huawei.com> wrote:
>> Currently, platform-specific iostat code for PMUs is implemented as a
>> common iostat callback interface and invoked based on what is being
>> built. This approach limits support for iostat across different types of
>> PMUs.
>>
>> Support of HiSilicon PCIe PMU iostat was raised at [1], which uses the
>> similar approach.
>>
>> To extend support of iostat across platforms, change common iostat
>> interface to framework to allow perf to probe PMU capabilities during
>> runtime and route iostat request to the correct PMU-specific functions.
>> Then HiSilicon PCIe PMU iostat is supported with the new framework.
>>
>> Request For Test:
>> Refactors has been made to x86 iostat to adapt the iostat framework, the
>> probe function that checks if there's any PMU's name contains 'x86-iio'
>> may not work properly, tests of that would be appreciated.
>>
>> [1] https://lore.kernel.org/all/4688a613-c94a-49b0-9d0f-09173c64082d@arm.com/
>>
>> Shiju Jose (2):
>>   perf-iostat: Extend iostat interface to support different iostat PMUs
>>   perf-iostat: Make x86 iostat compatible with new iostat framework
>>
>> Yicong Yang (1):
>>   perf-iostat: Enable iostat mode for HiSilicon PCIe PMU
>>
>> Yushan Wang (4):
>>   perf stat: Check color's length instead of the pointer
>>   perf stat: Save unnecessary print_metric() call
>>   perf-x86: iostat: Change iostat_prefix() to static
>>   perf-iostat: Support wilder wildcard-match for pmus
> Hi,
>
> Thanks for the changes! Given the iostat code is display code, it'd be
> great if we could avoid the arch directory usage. For example, I may
> record data on a machine with a HiSilicon PCIe PMU but then want to
> look at the data on an x86 laptop, as the code is under arch/arm64 it
> won't get built.Given the PMU name is unique, is it possible to put
> this code into tools/perf/util and determine whether to use it or not
> by seeing if the PMU is present by its name? I know that means
> refactoring the x86 code that hasn't done this.

Yes, iostat itself didn't do much more than rearrange the display
format. I can try to refactor that to the util directory, though x86
iostat may need even more testing :)

> A thought that is away from the iostat code and may simplify the code
> base is that we could introduce system PMU, rather than CPU, dependent
> metrics. Perhaps the iostat code could be replaced by a particular
> metric group like Default or TopdownL1, so `perf iostat` becomes
> something of a synonym for `perf stat -M iostat`. An example of what
> this may look like is (unmerged):
> https://lore.kernel.org/lkml/20260108191105.695131-34-irogers@google.com/
> where I introduce a memory bandwidth saturation metric dependent on
> uncore PMUs (either cbox or cha) on Intel. There is a metric
> "have_event" function that can be used to make a metric conditional.
> If you `perf stat record` a metric today and then look at the
> perf.data with `perf script --fields metric` (IIRC) then every metric
> that has the recorded events within it will be computed, although the
> code needs better testing, etc. I suspect the biggest downside to this
> approach is in how the output looks, but perhaps that can be tweaked.
> For example, the `ilist.py` command:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/python/ilist.py?h=perf-tools-next
> supports regular metrics.
Since iostat is a small sub-command with not many events involved,
it is great to have some events extracted as system metrics, like PCIe
bandwidth etc.

But the variety of bdf filtering and display may be difficult to adapt
to the way metric does it. What do you think if we leave the iostat as
is for now and maybe merge it to system metric infrastructure later?

> That said, I'm not against the changes, the arch directory usage, not
> using json metrics, etc. and this change is doing clean up, following
> existing patterns, etc. Sometimes the codebase has evolved but certain
> commands haven't kept up. I think `perf iostat` is a command like
> that.

And we are trying to make it follow up!

> Thanks,
> Ian

Thanks for the feedback!
Yushan
>>  tools/perf/arch/arm64/util/Build         |   1 +
>>  tools/perf/arch/arm64/util/hisi-iostat.c | 479 +++++++++++++++++++++++
>>  tools/perf/arch/x86/util/iostat.c        | 105 +++--
>>  tools/perf/builtin-script.c              |   2 +-
>>  tools/perf/util/iostat.c                 |  79 ++--
>>  tools/perf/util/iostat.h                 |  21 +-
>>  tools/perf/util/pmus.c                   |  12 +-
>>  tools/perf/util/pmus.h                   |   3 +
>>  tools/perf/util/stat-display.c           |   4 +-
>>  tools/perf/util/stat-shadow.c            |   4 +-
>>  10 files changed, 638 insertions(+), 72 deletions(-)
>>  create mode 100644 tools/perf/arch/arm64/util/hisi-iostat.c
>>
>> --
>> 2.33.0
>>


