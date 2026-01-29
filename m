Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE550D6100C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1TflBqCBsazeqTZArCWKkEIMomlGrQpkzi2VBwqkvw=; b=Sl7KmC742WIwD1eDWR0XQv6Zxy
	uNDRubezHcQPA50to9m2+Dq9gw2TyJolmjon3TWYLhoz2xqMu0ovyOKZfukEIuZSfzCzDogHsVZJE
	8ImvnFG26WpclExeBg3lpyuN87ONpBZCr4Pa9YOAAO+4X0BPgODttMexxCfLR2YspkqPyxc5ZtdJM
	nQaDm5b1B0nUT+1F1hr+c/s7DA4Ar9gHV5DS61cQIb7JQStLIk4osjy/kWMehuG5YWw9yXnYHfXZq
	0Dpq+JWME20kExr0mw/w7eJC9L6UAcAUtBx0a/wU5UGJI5dzsziR0m5d6B+gD2VqAsT5uwbhPqf5p
	rMVRdi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQnd-000000004gT-1gZA;
	Thu, 29 Jan 2026 12:07:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQna-000000004fk-3pt7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:07:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97929153B;
	Thu, 29 Jan 2026 04:06:51 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89C2E3F632;
	Thu, 29 Jan 2026 04:06:52 -0800 (PST)
Message-ID: <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
Date: Thu, 29 Jan 2026 13:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 mark.rutland@arm.com, anshuman.khandual@arm.com, song@kernel.org,
 ryan.roberts@arm.com, thuth@redhat.com, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_040659_090689_7F620116 
X-CRM114-Status: GOOD (  22.00  )
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

On 28/01/2026 04:19, Jinjie Ruan wrote:
> In the generic entry code, the beginning of
> syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
> sense to rework it.
>
> In preparation for moving arm64 over to the generic entry
> code, as nothing calls syscall_exit_to_user_mode_work() except for
> syscall_exit_to_user_mode(), move local_irq_disable_exit_to_user() and
> syscall_exit_to_user_mode_prepare() out from
> syscall_exit_to_user_mode_work() to the only one caller.
>
> Also update the comment and no functional changes.
>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/linux/entry-common.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index e4a8287af822..c4fea642d931 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>   * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>   * @regs:	Pointer to currents pt_regs
>   *
> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> + * Same as step 1 of syscall_exit_to_user_mode() but without calling
> + * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
>   * exit_to_user_mode() to perform the final transition to user mode.
>   *
> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
> - * returns with all work handled and interrupts disabled. The caller must
> - * invoke exit_to_user_mode() before actually switching to user mode to
> - * make the final state transitions. Interrupts must stay disabled between
> - * return from this function and the invocation of exit_to_user_mode().
> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and

Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
__exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).

- Kevin

> + * exit_to_user_mode() before actually switching to user mode to
> + * make the final state transitions.
>   */
>  static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  {
> @@ -155,8 +155,6 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  	 */
>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>  		syscall_exit_work(regs, work);
> -	local_irq_disable_exit_to_user();
> -	syscall_exit_to_user_mode_prepare(regs);
>  }
>  
>  /**
> @@ -192,6 +190,8 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
>  {
>  	instrumentation_begin();
>  	syscall_exit_to_user_mode_work(regs);
> +	local_irq_disable_exit_to_user();
> +	syscall_exit_to_user_mode_prepare(regs);
>  	instrumentation_end();
>  	exit_to_user_mode();
>  }

