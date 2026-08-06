Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA17BC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NuVl080bt4cA2uVz75kzQbvjwfydsHS9/195tFer8k=; b=DK8L4ky/TdQ8VROtRIfODc7BFL
	IXsvMmbDngey6iPXryAY9MCshKtaNKGNQyIopIN0xX892t7Xd5sH7Uzk3Cg+G6aBDQVhrZ4nd7Vf/
	VB+q3P3QgPohnX5L0dQZGF/EdoVvBjk2pypXz5XXZyy1gq0L/Zw0OIUKpEWbT8uDGnILP4Q/b/3Ru
	p8MjuwWDh/DUCALXserHfp+jhqyamebEc4yR+aMq3+GYPLpa+WE9YB2qXErSfHjxeyAusgzwR5uW5
	AmOt5jYZ6QG7yneEDOQZvn2LC57KDnAgHMaLLKE2ZogAfw1RLqhHxuUfWaSoEG05vNEzbH1mefqv1
	eCWQayKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtNM-00000005DXa-36el;
	Thu, 06 Aug 2026 08:22:52 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtNI-00000005DWJ-46JN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:22:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4NuVl080bt4cA2uVz75kzQbvjwfydsHS9/195tFer8k=;
	b=rNkOuxuOy6FOR22QgZpBTFAow9DPI4vCWJsA0NRKxpTmhfRz8z3kOdqX5jiIFnSN0EVCLVxSS
	Qi+F61a0r7NvpEwRy0fo3We9RaHuk1A90ySGA38QqKG+/+RfiXGTumdoY8xEg3kCaGB0cot4vu+
	P7Fit34Z3j/1NNuCfITREv0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hG0Px1xDLzcb0W;
	Thu,  6 Aug 2026 16:12:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 66A1A4056D;
	Thu,  6 Aug 2026 16:22:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Aug 2026 16:22:32 +0800
Message-ID: <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
Date: Thu, 6 Aug 2026 16:22:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <Aishwarya.TCV@arm.com>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
 <20260728021122.2640104-2-ruanjinjie@huawei.com>
 <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_012249_638732_9BE568B5 
X-CRM114-Status: GOOD (  21.51  )
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



在 2026/8/5 23:04, Mark Brown 写道:
> On Tue, Jul 28, 2026 at 10:11:21AM +0800, Jinjie Ruan wrote:
>> As Kees suggested, add a test that verifies that seccomp observes the
>> correct first argument after a ptracer modifies x0 at a syscall-enter-stop
>> on arm64.
> 
> This change is now in -next and is breaking the build on Arm's internal
> KernelCI instance, the same thing can also be seen on at least upstream
> KernelCI mixed in with extra issues due to what looks like a
> missing/failed headers_install - I'll report the infra aspects of that
> separately:

Thank you for the report.

> 
>   CC       seccomp_ptrace_x0_bypass
> seccomp_ptrace_x0_bypass.c: In function ‘do_child’:
> seccomp_ptrace_x0_bypass.c:67:28: error: array type has incomplete element type ‘struct sock_filter’
>    67 |         struct sock_filter filter[] = {
>       |                            ^~~~~~
> seccomp_ptrace_x0_bypass.c:68:17: warning: implicit declaration of function ‘BPF_STMT’; did you mean ‘BPF_STX’? [-Wimplicit-function-declaration]
>    68 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),  /* nr */
>       |                 ^~~~~~~~
>       |                 BPF_STX
> seccomp_ptrace_x0_bypass.c:69:17: warning: implicit declaration of function ‘BPF_JUMP’; did you mean ‘BPF_JMP’? [-Wimplicit-function-declaration]
>    69 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 3),
>       |                 ^~~~~~~~
>       |                 BPF_JMP
> seccomp_ptrace_x0_bypass.c:75:16: error: variable ‘prog’ has initializer but incomplete type
>    75 |         struct sock_fprog prog = {
>       |                ^~~~~~~~~~
> seccomp_ptrace_x0_bypass.c:76:18: error: ‘struct sock_fprog’ has no member named ‘len’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                  ^~~
> In file included from seccomp_ptrace_x0_bypass.c:38:
> /tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: warning: excess elements in struct initializer
>    64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>       |                         ^
> seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro ‘ARRAY_SIZE’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                        ^~~~~~~~~~
> /tmp/kci/linux/tools/testing/selftests/kselftest.h:64:25: note: (near initialization for ‘prog’)
>    64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>       |                         ^
> seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro ‘ARRAY_SIZE’
>    76 |                 .len = ARRAY_SIZE(filter),
>       |                        ^~~~~~~~~~
> seccomp_ptrace_x0_bypass.c:77:18: error: ‘struct sock_fprog’ has no member named ‘filter’
>    77 |                 .filter = filter,
>       |                  ^~~~~~
> seccomp_ptrace_x0_bypass.c:77:27: warning: excess elements in struct initializer
>    77 |                 .filter = filter,
>       |                           ^~~~~~
> seccomp_ptrace_x0_bypass.c:77:27: note: (near initialization for ‘prog’)
> seccomp_ptrace_x0_bypass.c:75:27: error: storage size of ‘prog’ isn’t known
>    75 |         struct sock_fprog prog = {
>       |                           ^~~~
> seccomp_ptrace_x0_bypass.c:75:27: warning: unused variable ‘prog’ [-Wunused-variable]
> seccomp_ptrace_x0_bypass.c:67:28: warning: unused variable ‘filter’ [-Wunused-variable]
>    67 |         struct sock_filter filter[] = {
> 
> 
>> --- /dev/null
>> +++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
>> @@ -0,0 +1,195 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Test that seccomp, tracepoints and audit observe the correct syscall
>> + * arguments after a ptracer has modified them at syscall-enter-stop.
> 
>> +#include <linux/filter.h>
> 
> The relevant definitions ought to be being picked up from here, there's
> a copy of a current version in tools/include and has been for a while
> (since at least v6.18) but there's no Makefile update to ensure that
> gets picked up.

Will add -I$(top_srcdir)/tools/include to CFLAGS for this test.

> 
>> +#ifndef __NR_write
>> +#define __NR_write 64
>> +#endif
> 
> That's...  interesting.

I'll remove the hardcoded __NR_write.


