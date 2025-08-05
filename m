Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBBC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9PfLizKg70d67W/ACgWqZhftqduf4PsfH7Tp8r9oVU=; b=TkUfP1QQULbj3c
	Y8eOawLg1GGMoDkSqE5OLEvDyMFr3mvvNy93zu35WyTD8KNtOmkVV/12oVKF5aaJYJI5ROEISQMbC
	O+6Md+ax3ieatcCVTS25B0uygLH3VHZwyZULr7t8DZmFUZ8f5Ru5GPeLWp+SONyDskm7uRAOl02RJ
	CEEa2PV66dDBD76jrqBQhtyUJI5e5U2NrrwysgAy/UfmscO6NfQVin+Ur874tSDNegsuPMgK2Owoa
	xEm1+F6yfJJfUOuBgPN27yFB3G92d0QJBjAjI0TgBTk8UWjSpITN404cjt/EKgbniHJSH34IbMHgA
	GoqAbwBVtRNhd0+XCOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKNp-0000000DGMj-0C3H;
	Tue, 05 Aug 2025 16:19:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJG5-0000000D6OM-0NH9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ABA12BCE;
	Tue,  5 Aug 2025 08:07:12 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03633F673;
	Tue,  5 Aug 2025 08:07:15 -0700 (PDT)
Message-ID: <dbe56865-392e-4705-b841-5612aecd016b@arm.com>
Date: Tue, 5 Aug 2025 16:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 6/7] arm64: entry: Move
 arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-7-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080721_178147_5D378720 
X-CRM114-Status: GOOD (  21.64  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com, will@kernel.org, liaochang1@huawei.com, linux-kernel@vger.kernel.org, kristina.martsenko@arm.com, oleg@redhat.com, broonie@kernel.org, chenl311@chinatelecom.cn, catalin.marinas@arm.com, leitao@debian.org, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, mbenes@suse.cz, puranjay@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The arm64 entry code only preempts a kernel context upon a return from
> a regular IRQ exception. The generic entry code may preempt a kernel
> context for any exception return where irqentry_exit() is used, and so
> may preempt other exceptions such as faults.
>
> In preparation for moving arm64 over to the generic entry code, align
> arm64 with the generic behaviour by calling
> arm64_preempt_schedule_irq() from exit_to_kernel_mode(). To make this
> possible, arm64_preempt_schedule_irq()
> and dynamic/raw_irqentry_exit_cond_resched() are moved earlier in
> the file, with no changes.
>
> As Mark pointed out, this change will have the following 2 key impact:
>
> - " We'll preempt even without taking a "real" interrupt. That
>      shouldn't result in preemption that wasn't possible before,
>      but it does change the probability of preempting at certain points,
>      and might have a performance impact, so probably warrants a
>      benchmark."
>
> - " We will not preempt when taking interrupts from a region of kernel
>      code where IRQs are enabled but RCU is not watching, matching the
>      behaviour of the generic entry code.
>
>      This has the potential to introduce livelock if we can ever have a
>      screaming interrupt in such a region, so we'll need to go figure out
>      whether that's actually a problem.
>
>      Having this as a separate patch will make it easier to test/bisect
>      for that specifically."
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


