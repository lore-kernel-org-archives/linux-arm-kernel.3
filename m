Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113BFD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxP4UdShtumCWAH9j9DpA24WgFBTsg6xZDJR5lr3bwo=; b=p/bBh0E6lev2FrIWMVQeCbAZo2
	WedrT1HFBk9PKd006+fQgk2c2QKFGl+KO0M6fkRlwby9jMXCx25Gq1HYdjgxiOz0OYfzswZM+QNgu
	u/o1s72HXGG++MT0AMEVmvOqK3LY3+h39OaNjEXRA20INY1KMblCmTsqIgYODU9vsxObYQGzwp2HA
	+WlRJacCqk2pcgaZk9eoGbFv+Okt8IwdLXMTfb16nGIBH4j5H3QXGAOuDWrh1+h6MtADbOIQlmO+F
	KgzCDe0lSNvPd6NJ3/ETax9+DWanjNOrKxwzwo7T56gva2aZ4JJD9yK9nxONZVXEUBfd86s/y2Sb9
	zXoqhV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc3M-0000000Gftz-3ix9;
	Thu, 27 Nov 2025 13:28:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc3K-0000000GftE-3uVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4F8A16F8;
	Thu, 27 Nov 2025 05:28:46 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4F63F66E;
	Thu, 27 Nov 2025 05:28:48 -0800 (PST)
Message-ID: <5997e6bb-4d69-46a7-821f-72d470f6ddff@arm.com>
Date: Thu, 27 Nov 2025 14:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-5-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126071446.3234218-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_052855_015840_63C573D7 
X-CRM114-Status: GOOD (  14.14  )
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

On 26/11/2025 08:14, Jinjie Ruan wrote:
> commit a9f3a74a29af ("entry: Provide generic syscall exit function")
> introduce generic syscall exit function and call rseq_syscall()
> before audit_syscall_exit() and arch_syscall_exit_tracehook().
>
> And commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") add rseq support for arm32, which also call rseq_syscall()
> before audit_syscall_exit() and tracehook_report_syscall().
>
> However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
> calls and select HAVE_RSEQ") implement arm64 rseq and call
> rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
>
> So compared to the generic entry and arm32 code, arm64 terminates
> the process a bit later if the syscall is issued within
> a restartable sequence.
>
> But as commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") said, syscalls are not allowed inside restartable sequences,
> so should call rseq_syscall() at the very beginning of system call
> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
> whether there is a syscall issued inside restartable sequences.
>
> It makes sense to raise SIGSEGV via rseq_syscall() before auditing
> and ptrace syscall exit, because this guarantees that the process is
> already in an error state with SIGSEGV pending when those later steps
> run. Although it makes no practical difference to signal delivery (signals
> are processed at the very end in arm64_exit_to_user_mode()), the ordering
> is more logical: detect and flag the error first, then proceed with
> the remaining work.

Thanks for providing this separate patch with a detailed rationale!

> To make it more reasonable and in preparation for moving arm64 over to
> the generic entry code, move rseq_syscall() ahead before
> audit_syscall_exit().
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

