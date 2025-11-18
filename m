Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADED1CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXlXkNZaf4JT4aI/TFpE5oAVKGJQ0KwImp9ELhzIUsM=; b=ZB+qn9sVS0/XXRK+75p7LtI5F9
	GjEcPSsCze1KA2T4owMcLg79D5+ncQdBIciNp1mK3Eyd3yC5aRCcT74w3zpSNlD83PwgbS4Hpi2bS
	0i9JRjmQs6Ii0re2Br0WhzFzTPbJQG3r0yWArsWXyEID36VsTDRnwFzIw7C94RQHXM8qDz8/PcaFG
	NZ4tOnFykWzdbqikabhgx/TvP/CSEI9Pz1dAcrfpLt6HbTnUj4Saqz5JJo5ru1MLELGBB9Ia7pEUJ
	Vf/HBKzvmnjoZ+LLsdTZ26t97sDj6iQf0E5Ajt1IILj9bUnuWiDivRJvALyyP+WZFE5Sf2atpgjS4
	P0NYHFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPEj-00000000pAe-0GRJ;
	Tue, 18 Nov 2025 17:11:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPEg-00000000pA6-2kcS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:11:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED541595;
	Tue, 18 Nov 2025 09:11:14 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8977C3F66E;
	Tue, 18 Nov 2025 09:11:16 -0800 (PST)
Message-ID: <af048915-40d3-4007-880a-090c1f079e59@arm.com>
Date: Tue, 18 Nov 2025 18:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] entry: Add syscall_exit_to_user_mode_prepare()
 helper
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-5-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091122_819108_B1D0A42F 
X-CRM114-Status: GOOD (  22.43  )
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

On 17/11/2025 14:30, Jinjie Ruan wrote:
> In the generic entry code, the part before
> syscall_exit_to_user_mode_work() calls syscall_exit_work(), which
> serves the same purpose as syscall_exit_to_user_mode_prepare()
> in arm64.

This is really hard to parse, I suppose the point is that the beginning
of syscall_exit_to_user_mode_work() can be reused on arm64 and therefore
it makes sense to split it?

> In preparation for moving arm64 over to the generic entry
> code, extract syscall_exit_to_user_mode_prepare() helper from
> syscall_exit_to_user_mode_work().
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

The position of this patch in the series seems a little arbitrary (it
has no dependency on other patches), it might make more sense to group
it with the other generic patches (i.e. move it to patch 7).

Otherwise:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

> ---
>  include/linux/entry-common.h | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index 7177436f0f9e..cd6dacb2d8bf 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -137,20 +137,11 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
>   */
>  void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>  
> -/**
> - * syscall_exit_to_user_mode_work - Handle work before returning to user mode
> - * @regs:	Pointer to currents pt_regs
> - *
> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> - * exit_to_user_mode() to perform the final transition to user mode.
> - *
> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
> - * returns with all work handled and interrupts disabled. The caller must
> - * invoke exit_to_user_mode() before actually switching to user mode to
> - * make the final state transitions. Interrupts must stay disabled between
> - * return from this function and the invocation of exit_to_user_mode().
> +/*
> + * Syscall specific exit to user mode preparation. Runs with interrupts
> + * enabled.
>   */
> -static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +static __always_inline void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
>  {
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  	unsigned long nr = syscall_get_nr(current, regs);
> @@ -171,6 +162,24 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  	 */
>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>  		syscall_exit_work(regs, work);
> +}
> +
> +/**
> + * syscall_exit_to_user_mode_work - Handle work before returning to user mode
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> + * exit_to_user_mode() to perform the final transition to user mode.
> + *
> + * Calling convention is the same as for syscall_exit_to_user_mode() and it
> + * returns with all work handled and interrupts disabled. The caller must
> + * invoke exit_to_user_mode() before actually switching to user mode to
> + * make the final state transitions. Interrupts must stay disabled between
> + * return from this function and the invocation of exit_to_user_mode().
> + */
> +static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +{
> +	syscall_exit_to_user_mode_prepare(regs);
>  	local_irq_disable_exit_to_user();
>  	exit_to_user_mode_prepare(regs);
>  }

