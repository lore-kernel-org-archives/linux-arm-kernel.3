Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF40FCEE341
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPoukKxuWMfWLoyeNPLuo2XtAOhUwgEJ600sbgTHok8=; b=VPF01aMefV/Q6PaO+ECWqLe8bQ
	zH4elHYk5e1+4PiOm3Hdn8rnOje9mVhyEgnU8A8UMfZfe418sulawMPxyAunzqb1PuFxBTlJP6NRl
	n2u0k/CTEjt/AhXozOPV95ZBIJ/9to075rFKVVffgvgCSYbz2LEkvtXQt5OEBFuh5yZBvwXAD5B4v
	sseZKCe8OBUE4EMFoXDYfp8zqZPU5+jlAJjaJA8oanHtaIVnG288W/ZU21cHD9GYsustgxb746H5G
	gpfn3vG/Y1+Gee2oXInJahkvRqqHOpIN1swIM4++1j+ildE1aeHdqVjyqJFUzhGCHp4FQj8lke5j/
	M1xGDlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPFo-00000000pPp-2987;
	Tue, 18 Nov 2025 17:12:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPFm-00000000pPE-3XYR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A10615A1;
	Tue, 18 Nov 2025 09:12:22 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72273F66E;
	Tue, 18 Nov 2025 09:12:24 -0800 (PST)
Message-ID: <e33d0fdb-e8a5-4abd-8e40-773349008b6b@arm.com>
Date: Tue, 18 Nov 2025 18:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64/ptrace: Expand secure_computing() in place
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
 <20251117133048.53182-7-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091230_932278_35B9D1A5 
X-CRM114-Status: GOOD (  15.16  )
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
> The generic entry expand secure_computing() in place and call
> __secure_computing() directly.
>
> In order to switch to the generic entry for arm64, refactor
> secure_computing() for syscall_trace_enter().
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 707951ad5d24..9af3046a2ce9 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2387,8 +2387,11 @@ int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  	}
>  
>  	/* Do the secure computing after ptrace; failures should be fast. */
> -	if (secure_computing() == -1)
> -		return NO_SYSCALL;
> +	if (flags & _TIF_SECCOMP) {
> +		ret = __secure_computing(NULL);

No argument was passed to __secure_computing() in v6, as expected since
it was removed in v6.15. Not sure why this NULL reappeared.

> +		if (ret == -1L)

ret is an int, so should be -1, not -1L.

- Kevin

> +			return NO_SYSCALL;
> +	}
>  
>  	/* Either of the above might have changed the syscall number */
>  	syscall = syscall_get_nr(current, regs);

