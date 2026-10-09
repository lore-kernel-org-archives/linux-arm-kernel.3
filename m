Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51630CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypXqJeoqO/OA0P5zFci6A2c5lPDoR2N2TjeEBwfYDTM=; b=mYUxIFq/JE1f8a
	EesxL26wfUQiIP5pO3o/8q5VT0vPLzfJ+Snz21W6ScZ2avDfvgBCNb7/wKmew2OSqgAXhsirGwEzz
	xssqaNytcL8RkxNfNR3gP8iW01Lle1CMOrLDz8nm36pCm7XaqgyTcPkeN1BVzicHzt4TbgDpPmIGk
	KlSqpNCCP/uS2Z0xQhvCKXvGdwuJRswUEJPqPwGWrF6DKrsqowTA32gYgcbsQ0W+Gq6c4Yil3+Bgf
	4yi6AjybmGHjNXg2RyvfQZCziTX1dKtShEmUSFWRtFOeEjxxZcEnX5Mxe8640Q2tfJnzUWXXFAZJ2
	Xyv+uwoxcGeCfuV1IAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAXU-00000006NAR-3Mvq;
	Fri, 09 Oct 2026 13:21:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAXS-00000006N9R-1s45
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:21:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46DCC1BB2;
	Fri,  9 Oct 2026 06:21:24 -0700 (PDT)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 257993F763;
	Fri,  9 Oct 2026 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791552087; bh=hRhxlDr3ghluH/n3MjQIcZt8qG0YcCtn6rX1pd593sQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Adl6jA6J9BYPFxHQzHiaWmUINvAK8wA58GDVWDHD7lg54hvFG7MF1Yc6exVEpsZ6T
	 D6Xxp5nThjjH+YtvgQDITVhH4czKRwtgYb0d3ufijZ2wktSRmZeqk5SbmJrvGkWieY
	 II+Yr9pCM6gLKQF6mGQLT9LhFECZ6ow5oVPJX31Y=
Message-ID: <5becc0b8-9b31-4539-b477-2d4af66c89a4@arm.com>
Date: Fri, 9 Oct 2026 14:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP notification
 to task_work()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20261001143516.Ew8C97WS@linutronix.de>
 <fd405cda-51bd-4b1c-803c-f2597b2b128e@arm.com>
 <20261008192117.ZIKKU3Yh@linutronix.de>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20261008192117.ZIKKU3Yh@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062130_533177_7199DF05 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Clark Williams <clrkwllms@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, James Clark <james.clark@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Linus Walleij <linusw@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sebastian,

On 08/10/2026 20:21, Sebastian Andrzej Siewior wrote:
> On 2026-10-06 18:17:52 [+0100], Ada Couprie Diaz wrote:
>> Hi Sebastian,
> Hi Ada,
>
>> I find the function names a bit counter-intuitive, compared to the other
>> arch-specific perf functions.
>> Given the name `perf_arch_...`, I would have expected them to be defined
>> in arch code, rather than in the generic perf code.
>>  From what I can see, usually perf functions calling an arch-specific
>> function lack the `_arch_` infix of their `arch_` counterpart.
>>
>> I do not know very well what we expect in perf, so I might be off-base,
>> but would calling them `perf_hwbp_send_sig()` and `perf_hwbp_notify()`
>> make sense ?
> Thanks for looking at this. I renamed them as:
> - perf_arch_hwbp_notify() -> perf_hwbp_notify() (generic)
> - arch_hwbp_send_sig() -> perf_arch_hwbp_send_sig() (arch specific)
> - perf_arch_hwbp_send_sig() -> perf_hwbp_send_sig() (generic)
>
> [...]
>
> Sebastian
That sounds good to me, thanks !
Kind regards
Ada

