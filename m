Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A93CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyeYlSz6E1U762BN0EdUinKptw8Zriv1SWjt+9nburo=; b=qc44DlDZucMnQi
	61H6hsIF/DaFmsnqRLTqNVp6q7Ltr7tgWLWbjCF5tNJWerCwnwx0kSIfHrzHk1dTSyzlhAhOlK0Vo
	mbFXn740Wg4tyT9i38Ou+MqYmmEhiphTEjIxwiX3WuSK0Asid3kT4GUg2u0srLnBD8XJrpsyJQIi/
	SvX0J7LDW0EV6LCj14POzunVWLMWJbpAVA+sOYvisCLy/qOca6Q1yWGahDNaqh5ZzyH+1JCdOMFm+
	yZWAgC1f0B1KHcq7Ex69oXywb4ulVzernz0jBcbAVDsxRuYjRLjIjU5dcS4RuRRKgAZTIr2NJs5S1
	zbFIKHZT4pKfltMGhyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcP0d-00000007wsR-1Fi9;
	Wed, 24 Jun 2026 14:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcP0b-00000007ws6-1Z2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:55:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0610B2944;
	Wed, 24 Jun 2026 07:55:15 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E28433F62B;
	Wed, 24 Jun 2026 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782312919; bh=tEkCFO/7kjtDTSCATNl+pL/YVd1ciADIUOeJdcK0kik=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Ar0n6+64oRwrxWE3lp9TQ68Ez0mRiyFyHz9QPRPNY+Zy85YsKjXwzbds3QVzA9pBK
	 d8QuTIacfO+/1tno4aM4Unz2j+NIS61dbJy0YxPFh/zqujby+KEqZ/o6QZ8KGpy0G8
	 pBL4er099nhu/NbNXZVLIZCZ6biGmhwafZmzcLL0=
Message-ID: <7c6bbc36-b100-4ca1-a710-99b483b04d2d@arm.com>
Date: Wed, 24 Jun 2026 15:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 09/11] arm64/ptrace: Skip syscall exit reporting for
 PTRACE_SYSEMU_SINGLESTEP
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-10-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_075521_477231_7B12EB21 
X-CRM114-Status: GOOD (  12.88  )
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

On 11/05/2026 10:21, Jinjie Ruan wrote:
> Align the syscall exit reporting logic with the generic entry
> framework by skipping the exit stop when PTRACE_SYSEMU_SINGLESTEP is
> in effect.
>
> [Rationale]
> When a tracer uses PTRACE_SYSEMU_SINGLESTEP, both _TIF_SYSCALL_EMU
> and _TIF_SINGLESTEP flags are set. Currently, arm64 reports a syscall
> exit stop whenever _TIF_SINGLESTEP is set, regardless of the
> emulation state.
>
> However, as per the generic entry implementation (see
> include/linux/entry-common.h):
> "If SYSCALL_EMU is set, then the only reason to report is when SINGLESTEP
> is set (i.e. PTRACE_SYSEMU_SINGLESTEP). This syscall instruction has been
> already reported in syscall_trace_enter()."
>
> Since PTRACE_SYSEMU intercepts and skips the actual syscall
> execution, reporting a subsequent exit stop is redundant and
> inconsistent with the expected behavior of emulated system calls.
>
> [Changes]
> - Introduce report_single_step(): Add a helper to encapsulate the
>    logic for deciding whether to report a single-step stop at syscall
>    exit. It returns false if _TIF_SYSCALL_EMU is set, ensuring the
>    emulated syscall does not trigger a duplicate report.
>
> - Update syscall_exit_work(): Use the new helper to determine
>    the stepping state instead of directly checking _TIF_SINGLESTEP.
>
> [Impact]
> - PTRACE_SINGLESTEP: Continues to report exit stops for actual
>    instructions.
>
> - PTRACE_SYSEMU: Continues to skip exit stops.
>
> - PTRACE_SYSEMU_SINGLESTEP: Now correctly skips the redundant exit
>    stop, aligning arm64 with the generic entry infrastructure.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

