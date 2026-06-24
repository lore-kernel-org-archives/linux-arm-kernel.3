Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81BCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLfffUSuInzAUcrty/JFJJFI1S246Kx9HYqfsleRYsk=; b=B6wQieVyao9lLv
	eLLkGjIt19ed6aURhovozRP0H+h24sjNmcmoQKTIegRnAphGHc2LQnN410vU2m6y6JrNbBd5qKi/f
	iecoZn/BfydC0QwAQLdzzmIIMgLFjni7WNKo+2+b7zrWSVtycE/leFw7T8Qu9aq1oNs4wW4K5yjqh
	Dfvp61sNX2Kl372KAYzUF9Huh+luOYNk94y/YCjeflMpH7hSdJOkJFlkQ+q22WGJ5xIQzx9d833/P
	s7aCqfvp1xcFTyf7XpRdkJ4+griQkNv6lNCzVt0PdmaOSnvEP3PtpzbBTRg0f4KVMnEBHh4mhEzOP
	D1UuZ2OFWDb3pr2w2TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNs6-00000007q4O-22yc;
	Wed, 24 Jun 2026 13:42:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNs4-00000007q41-2psC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:42:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB25E2576;
	Wed, 24 Jun 2026 06:42:22 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 039463F58B;
	Wed, 24 Jun 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308547; bh=sPYXVdR3XnU5XF2+0KTe8yRvENoikdkGxTLyDDn6oHI=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=ZY2U6+AFT/Y2egQCwd/2qzms+gYMyAGh0OqywJMpFhBW5+iJjb3qgWLeVc4vb1Rsv
	 QUZy5tIIPWv5RTprTgatLSnZdlJ/1QQFtpuiNOrZpLw8end3xzc9yuejSYBz+53GVN
	 j/OvxZNJqyULLcCBdZPkyYa+tN6/CDhJoc5C6cDE=
Message-ID: <5ea376d7-388a-418c-acde-9ebe1da96202@arm.com>
Date: Wed, 24 Jun 2026 14:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 03/11] arm64/ptrace: Use syscall_get_nr() helper for
 syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-4-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064228_852339_C714048D 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:20, Jinjie Ruan wrote:

> Use syscall_get_nr() to get syscall number for syscall_trace_enter().
> This aligns arm64's internal tracing logic with the generic
> entry framework.
>
> [Changes]
> 1. Use syscall_get_nr() helper:
>     - Replace direct regs->syscallno access with
>       syscall_get_nr(current, regs).
>     - This helper is functionally equivalent to direct access on arm64.
>
> 2. Re-read syscall number after tracepoint:
>    - Re-fetch the syscall number after trace_sys_enter() as it may have
>      been modified by BPF or ftrace probes, matching generic entry behavior.
>
> [Why this matters]
> - Aligns arm64 with the generic entry interface.
> - Makes future migration to generic entry framework.
This is missing what it makes the future migration . Easier, possible ?
(Same in patch 02, but I missed it !)
> - Properly handles syscall number modifications by tracers.
> - Uses standard architecture-independent helpers.
>
> No functional changes intended.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

Otherwise,

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

