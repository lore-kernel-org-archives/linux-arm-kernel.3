Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B71D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI/oyW1P+yX/6vsPM19HzFOt5K5VwUfn1ZbJAW6eycE=; b=gMLiISOZkfNzENV00vb+kPp7EQ
	XSyTcPtt773pydOljvrM17bz3KR6k3YIq9Wef1pS9zFEHOsfXdGwCfIlU5cFVjHXMhHK+kZzdbtjT
	kf+xktfWnWPf1UeqK1bWAthPoLNOpufcXBc1DWTL3/ysBLTCH2B5K9v4qrgXp8dbcopabi2aktoLZ
	QV9LZHITMbcuQkAkeJCNV6+Em0c5Hy5toYAQadFtVfd2ULaZZjsId+q5KrsWxIHNav9oivK2XivSB
	Vo+HQNq82RaKq5ixQ6sFxb1S/eZ8q7jdM/UHKdgjWtyraKNbVz80HlQkHpZfgVoxNx3huPnf0aDrP
	LsO0MAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy4j-0000000EL6g-3176;
	Tue, 09 Dec 2025 13:48:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy4h-0000000EL5v-2BFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:48:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 774D21758;
	Tue,  9 Dec 2025 05:48:10 -0800 (PST)
Received: from [10.57.45.100] (unknown [10.57.45.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C94C3F762;
	Tue,  9 Dec 2025 05:48:12 -0800 (PST)
Message-ID: <746211f0-74b7-4935-a036-48a00bb5701b@arm.com>
Date: Tue, 9 Dec 2025 14:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/16] arm64: Inline el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, macro@orcam.me.uk, charlie@rivosinc.com, ldv@strace.io,
 mark.rutland@arm.com, song@kernel.org, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-15-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251204082123.2792067-15-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054819_592989_2E1890B3 
X-CRM114-Status: GOOD (  14.59  )
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

On 04/12/2025 09:21, Jinjie Ruan wrote:
> After switch arm64 to Generic Entry, the compiler no longer inlines

Did it inline it before this series?

> el0_svc_common() into do_el0_svc(). So inline el0_svc_common() and it
> has 1% performance uplift on perf bench basic syscall on kunpeng920
> as below.
>
> | Metric     | W/O this patch | With this patch | Change    |
> | ---------- | -------------- | --------------- | --------- |
> | Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%   |
> | usecs/op   | 0.219575       | 0.217192        |  ↓1.1%   |
> | ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

I think this is sensible - do_el0_svc() is clearly hot and the small
increase in code size is completely justified. It also removes a
performance regression when enabling CONFIG_COMPAT (without it
el0_svc_common() has only one caller so it should be inlined regardless).

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  arch/arm64/kernel/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index 47e193a1cfff..5aa51da9ec25 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -66,8 +66,8 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
>  	choose_random_kstack_offset(get_random_u16());
>  }
>  
> -static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
> -			   const syscall_fn_t syscall_table[])
> +static __always_inline void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
> +					   const syscall_fn_t syscall_table[])
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  	unsigned long flags = read_thread_flags();

