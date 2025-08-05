Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C82C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGMraVebn0O/hdPtC4vOLkDXmr42WhTqDgKL7UUA1Nw=; b=a5vWtu+Y9FEjJx
	5xNNzvHVcxg/WWfO0lNkm1QN4Kqo3Loa6NrQ6op45PbqDch6U0vRotkGj5JSjOJjWcZHJocp3LB02
	mfxgzCOGNHral3sPge79+UTvqRxt2hti2zIJS2bMX7O9XDdWbZd8T6LvdI//HY9v8NQgxcGxUVy1Z
	5BlZD7jKiWtAR6CS21Hpv+Qba+FC/Pqy/oWYQxvzIgEP5H8CUcwRC8rNOqmMx3abO0YiF9Idk2UF6
	TggxrLcnGNzbod30uxvz5Y9wF+IFekZdJCHeC28BFeeIizyurxkqXDoyVgagEM2IbifLwXTzc/hLV
	gIEez/s0xo5fE1oQoy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKFz-0000000DF8J-2OKe;
	Tue, 05 Aug 2025 16:11:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJFG-0000000D6DU-0r9q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:06:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74E5E2BCC;
	Tue,  5 Aug 2025 08:06:21 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBD3F3F673;
	Tue,  5 Aug 2025 08:06:25 -0700 (PDT)
Message-ID: <b8adfbad-2a7d-47d4-a925-2f93c09cc414@arm.com>
Date: Tue, 5 Aug 2025 16:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 3/7] arm64: entry: Rework
 arm64_preempt_schedule_irq()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-4-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080630_296130_E5107881 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code has the form:
>
> | raw_irqentry_exit_cond_resched()
> | {
> | 	if (!preempt_count()) {
> | 		...
> | 		if (need_resched())
> | 			preempt_schedule_irq();
> | 	}
> | }
>
> In preparation for moving arm64 over to the generic entry code, align
> the structure of the arm64 code with raw_irqentry_exit_cond_resched() from
> the generic entry code.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


