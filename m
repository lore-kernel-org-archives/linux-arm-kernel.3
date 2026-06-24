Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F89CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vmlws4SyEILlTRj3H2zwdIifUQJ6mxj6O+CXowTjjdQ=; b=aq45FCGM0ngyrI
	5HGWDA1IzIt2e1XrSLxbr4x22iZ1sE5yABqXGWVinaXthkjR9lzoxGRcw35CQ6189PF/Dx3DVzL9w
	pm5dcmE27cXesR8GbKLcY5X44dMQVgVfquOD0KrHubKPwmCoKmtvM5A1HBsEIlthOOUZwRZTGWPh6
	awql8f39joZei9lUQDfTjDqfdQLvxhIJdMRJWLl6ZLK+aanmTDs06OzlgU60Co98Fnkz5AKj4FNNb
	oVNGZyv8Ip/2hbFcC55DQkK/lmklcNfV/mrVamtRKea5jFoyzsL+XOqHBZXxrF28t/gZp9t0JhIrM
	XbfqsnoE46BcfOApUMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNoa-00000007ppY-2Ran;
	Wed, 24 Jun 2026 13:38:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNoX-00000007pou-1Yuf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:38:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B6C31C14;
	Wed, 24 Jun 2026 06:38:42 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 916BD3F632;
	Wed, 24 Jun 2026 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308326; bh=fvLOENwwsTm8koXCpH2blUCcRt7sL79l2NvHBaVjXcE=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=HI8zFgcOqJJUeTTnCwPr6HiCA9YkFAjuMiSXZHo7Zoh7FSmkSmo4DnXYJ0JiHhf9C
	 pLOSMpiyWPhNW72Jpbt+nxCgOpPK1fiWkMn4SUi+6NZya0yMtUHX3ZjJ/6csazw+0+
	 RD+6NP6DfVHSExK+40KlGAtKG4rshp6YblGQ1qVo=
Message-ID: <8ca5eae1-c72c-47b0-b4d7-e2ec6445c943@arm.com>
Date: Wed, 24 Jun 2026 14:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 02/11] arm64/ptrace: Refactor
 syscall_trace_enter/exit() to accept flags parameter
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-3-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_063849_626973_2E1C4579 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

> Refactor syscall_trace_enter() and syscall_trace_exit() to move thread
> flag reading to the caller. This aligns arm64's syscall trace enter/exit
> function signature with generic entry framework.
>
> [Changes]
> 1. Function signature changes:
>     - syscall_trace_enter(regs) → syscall_trace_enter(regs, flags)
>     - syscall_trace_exit(regs) → syscall_trace_exit(regs, flags)
>
> 2. Move flags reading to caller:
>     - Previously: read_thread_flags() called inside each function.
>     - Now: caller (like el0_svc_common) passes flags as parameter.
>
> 3. Update syscall.c:
>     - el0_svc_common() now passes flags to tracing functions and
>       re-fetches flags before entry/exit to handle potential TIF
>       updates.
>
> [Why this matters]
> - Aligns arm64 with the generic entry interface.
> - Makes future migration to generic entry framework.
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
I was a bit confused with some parts, but those changes were made to align
exactly on the generic entry code, so makes sense !

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


