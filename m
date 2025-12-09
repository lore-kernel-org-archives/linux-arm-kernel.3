Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1EFD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XCBr1Dmhlo5J5EJeXM7pJfnA+pWNgVjkZs7W6PShlc=; b=KDo4JztZDh5slEF0+WM6zzdVk5
	okLTdhGRqXVI/TcAIVZD1P2ctYXaWnSBxBnzRUSFvrPpXq7B9TgFqNhd2Gajs+VkwhQFLmEx6TvuK
	S8+PbwC9Zepop45AXGjXqKQyNnp/4PNgIgA2X6kulIIzx2xEy4PoG6UxfDRzXM4MidJ3r2LniP15A
	qZDCIroJ9bq5YXH0KhMe7JA2TLwDeobqFIQn53Xfz+AC9bah+wVjsbl3FANDiMKVNFCKggEMN4r79
	Xwr+eQPmvNKPVafwaZVUtZtLgAkl8cePiShoqiFjfbzalAj3sFATnsxSu2DpTqaoouoH+wZlUYbcZ
	xVjiARfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy4A-0000000EKyX-2OWu;
	Tue, 09 Dec 2025 13:47:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy48-0000000EKyA-0WuN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:47:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29CFE169C;
	Tue,  9 Dec 2025 05:47:36 -0800 (PST)
Received: from [10.57.45.100] (unknown [10.57.45.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8289D3F762;
	Tue,  9 Dec 2025 05:47:38 -0800 (PST)
Message-ID: <ec404a91-2e24-4198-975b-e26c6a8330f8@arm.com>
Date: Tue, 9 Dec 2025 14:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/16] arm64: entry: Convert to generic entry
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
 <20251204082123.2792067-14-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251204082123.2792067-14-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054744_206932_D93C872B 
X-CRM114-Status: GOOD (  11.04  )
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
> Currently, x86, Riscv, Loongarch use the generic entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> switched to the generic IRQ entry, so completely convert arm64 to use
> the generic entry infrastructure from kernel/entry/*.
>
> The changes are below:
>  - Remove TIF_SYSCALL_* flag.
>
>  - Remove _TIF_SYSCALL_WORK and has_syscall_work(), as _TIF_SYSCALL_WORK
>    is equal with SYSCALL_WORK_ENTER.

Should be updated considering patch 7 (has_syscall_work() no longer
exists and there is also _TIF_SYSCALL_EXIT_WORK).

>  - Implement arch_ptrace_report_syscall_entry/exit() with
>    report_syscall_entry/exit() to do arm64-specific save/restore
>    during syscall entry/exit.
>
>  - Add "ARCH_SYSCALL_WORK_EXIT" to be defined as "_TIF_SECCOMP |
>    _TIF_SYSCALL_EMU" to keep the arm64 behaviour unchanged.

No longer the case.

>  - Remove arm64 syscall_trace_enter(), syscall_exit_to_user_mode_prepare(),
>    and related sub-functions including syscall_exit_work() and
>    syscall_enter_audit(), by calling generic entry's functions with similar
>    functionality.

Would be good to talk about SYSCALL_EXIT_TRAP as well.

Otherwise:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> - Implement arch_syscall_is_vdso_sigreturn() to support "Syscall User
>   Dispatch".
>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>
> [...]

