Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E8CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 03:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2sfapyz3mFipoXtYTOmIUQmaSoNUdYGDEc35rJ/dmU=; b=zWZIIg5UAuCHMZZ+c+U6agybAC
	S1fij+0qTHO/i7kRcPlC9fv3bkWVQ84WyUS7aiCKqiz4wI2odGERl9IaTHa9QMKE+Lf0CGp8tS4Fe
	Qw6+jLDamVlMNWBif4DrCHoMSI6vfkW3Go07n+qDsIODGwzSs17ooahI6XMFKmheFOZB6fHRGm8cP
	KmoqmaX9bYR9C6eZ9ieJbdP0wkLzTN2uFYHucZTKdRAemEdutK7qCf//S/UoUUIxU7QWr2djON/UO
	nCC+CZ/rXHmzaonozhsvJaJSa+H01V4cZGQWQbvAJC6mfmigWYYO6/dhEpFIO3oZiqOqQkMR8+Bn+
	pYwt5ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTAG-0000000FwoW-04k4;
	Thu, 27 Nov 2025 03:59:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTAD-0000000Fwo8-2k6T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 03:59:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A7E21570;
	Wed, 26 Nov 2025 19:59:14 -0800 (PST)
Received: from [10.163.48.177] (unknown [10.163.48.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1563F3F6A8;
	Wed, 26 Nov 2025 19:59:18 -0800 (PST)
Message-ID: <34b20d6a-c5ee-4670-acd7-688d6b7f8732@arm.com>
Date: Thu, 27 Nov 2025 09:29:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: simplify arch_uprobe_xol_was_trapped return
To: Osama Abdelkader <osama.abdelkader@gmail.com>, mhiramat@kernel.org,
 oleg@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20251126223130.216302-1-osama.abdelkader@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251126223130.216302-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_195925_738816_F129AD44 
X-CRM114-Status: GOOD (  11.59  )
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

On 27/11/25 4:01 AM, Osama Abdelkader wrote:
> convert arch_uprobe_xol_was_trapped() from explicit if/return true
> return false pattern to direct boolean expression return in
> arch/arm64/kernel/probes/uprobes.c
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kernel/probes/uprobes.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
> index 2799bdb2fb82..b38c1dab7eb4 100644
> --- a/arch/arm64/kernel/probes/uprobes.c
> +++ b/arch/arm64/kernel/probes/uprobes.c
> @@ -103,10 +103,7 @@ bool arch_uprobe_xol_was_trapped(struct task_struct *t)
>  	 * insn itself is trapped, then detect the case with the help of
>  	 * invalid fault code which is being set in arch_uprobe_pre_xol
>  	 */
> -	if (t->thread.fault_code != UPROBE_INV_FAULT_CODE)
> -		return true;
> -
> -	return false;
> +	return t->thread.fault_code != UPROBE_INV_FAULT_CODE;
>  }
>  
>  bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)


