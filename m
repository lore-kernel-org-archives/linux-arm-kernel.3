Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE4C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6xKNCU6TxHelF7oYa+V4m2Mm/ihEQlKH7ETH/jDzGI=; b=hEdyZF7KOAw2op
	zxjW68jt9GM1EVdI15hmM9YKRKlRshnyKJHVKwdmOU5xUXccXEbRLMdbgx0U8IEdPS01OPSYmDKTV
	FsB/CXlHXev8MY4jn2KW8/Lilhg2JkajumDC3UCQSPpTk4Hg6cMJDz/qKt70yuCfv3djuz8ftmkPY
	S2Anw6K+IYDoGSQQ0fgvbODs3de3aeMkUTxmVxhhkRpOfnQoadiWUuOHX+GjdRO1Pdgr8iXb9fVw8
	BUXsn6bqwcSmok8ANImZmEu630ilBJYjgA/5xEldWDuRjFoWFIuRR3rKWjGKhk1IMDD+5pfUHFdaA
	HHRGyMANwqIrfhLzP3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHYw-0000000DLQn-30qc;
	Wed, 28 May 2025 14:15:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH8O-0000000DHid-0KEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:47:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCBE81A2D;
	Wed, 28 May 2025 06:47:38 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE95E3F5A1;
	Wed, 28 May 2025 06:47:53 -0700 (PDT)
Message-ID: <acf1ee9f-fc5f-4a69-9e93-b75d7cb25456@arm.com>
Date: Wed, 28 May 2025 14:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: debug: split hardware watchpoint
 exception entry
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-9-ada.coupriediaz@arm.com>
 <20250520165938.GA19257@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250520165938.GA19257@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_064756_162233_9EF27CC4 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 20/05/2025 17:59, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:23PM +0100, Ada Couprie Diaz wrote:
>> [...]
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 8814ad24e707..6e70130d2741 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -530,10 +530,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>>   	arm64_exit_el1_dbg(regs);
>>   }
>>   
>> -static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
>> +static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
>>   {
>> +	/* Only watchpoints write FAR_EL1 */
> nit: But maybe scope the comment (here and in the el0 handler) for debug
> exceptions?
> e.g.
>
> 	/* Watchpoints are the only debug exception to write FAR_EL1 */
>
> ?
>
> Will

Good point. The comment felt somewhat off to me and that's exactly why.

Updated the wording for v3, thanks.

Ada


