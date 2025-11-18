Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B523FCEE341
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0uieujS0vjs9fBW3DzQLEmBYxDNzedQQWNrzLtVUpU=; b=Dbr4uvg1ITSYLEPsgPr7EYXF6V
	eHxp5beDdJR9vCDPbMI3pCl9vcQDzQ/snhwWV6eIgwK6R0HYbQ+gvHfsAEil8naS/l9KkwuMd8pTY
	3Q3c8O8SgYgMEUq1O0u0ULTt45+zjXAIFh0uzgAaLASPd7xOloU5cNOPdaNKzFq23HExJ3dCbQbys
	SnsYVrOtxDbOwJIxQAeHekJSGC4CFWS96qjuuF2f9dqHk2F2YjGmnEqAKMEa25+/msxSWW1OwnvW3
	AUlS+A5v1BfYnJ6pHdsKOHE7bit7NjxlHmBpvKtovCMdvOaY5PKB2Hn8KG9hVPUsDAyztxk3oZXmV
	p4XjnyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPGH-00000000pVz-3SU1;
	Tue, 18 Nov 2025 17:13:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPGF-00000000pV6-2rQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:13:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0B5E1655;
	Tue, 18 Nov 2025 09:12:50 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8B93F66E;
	Tue, 18 Nov 2025 09:12:53 -0800 (PST)
Message-ID: <256357dc-2f29-4af6-8efc-5222170e5e49@arm.com>
Date: Tue, 18 Nov 2025 18:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64/ptrace: Use syscall_get_arguments()
 heleper
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
 <20251117133048.53182-8-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091259_767990_854FA00D 
X-CRM114-Status: GOOD (  16.54  )
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

In subject: s/heleper/helper/

On 17/11/2025 14:30, Jinjie Ruan wrote:
> The generic entry check audit context first and use
> syscall_get_arguments() helper.
>
> In order to switch to the generic entry for arm64,
>
> - Also use the helper.
>
> - Extract the syscall_enter_audit() helper to make it clear.
>
> - Check audit context for syscall_enter_audit(), which only adds
>   one additional check without any other differences as
>   audit_syscall_entry() check it first otherwise do nothing.

Presumably this is to avoid an unnecessary memcpy(). Overall these
changes make syscall_enter_audit() exactly equivalent to the generic
one, would be good to spell it out.

> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 9af3046a2ce9..9455ccf1ecc1 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2376,6 +2376,17 @@ static void report_syscall_exit(struct pt_regs *regs)
>  	}
>  }
>  
> +static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
> +{
> +	if (unlikely(audit_context())) {
> +		unsigned long args[6];
> +
> +		syscall_get_arguments(current, regs, args);
> +		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
> +	}
> +

Nit: empty line.

- Kevin

> +}
> +
>  int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  {
>  	int ret;
> @@ -2406,8 +2417,7 @@ int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  		 syscall = syscall_get_nr(current, regs);
>  	}
>  
> -	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
> -			    regs->regs[2], regs->regs[3]);
> +	syscall_enter_audit(regs, syscall);
>  
>  	return regs->syscallno;
>  }

