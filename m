Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB39C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t/wPcAuSutmt21ZbTdkTqGB9SRp5eZzuUAxIamiYVM=; b=dLPEklUViST6Ww
	LBTK68qkcYd1FzcPGSRsqm+P86JSQNWILurnX3gURgF5ZBZoDY2+QrbN07z9FWhONIvKUD6FBK+Yi
	BnJcFuIkpfvJ9Z+7IHjbBnsSSjEkuSYRLKHnb7+f9yLjJDR4/NNQq9lCtpl538cYouEIxOXN+LYI9
	OQpaXoUnG7RuOEVovn/xw0Be8ysKW1rot5DNU9eWnQQoW3Qm2sgQ8KCP/f0Tn00pJPZh80sg5peRO
	6/ouADG9b2sfz4S40P7mmyaxwjryGpspVUS5YxlhfB7/OWzPshq5EddO/kIovR1rivbQG0lj5Ykam
	Xco5/ZuNJbjirU+6pf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wja8V-0000000BX1S-1jlU;
	Tue, 14 Jul 2026 10:13:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wja8S-0000000BX13-48dN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:13:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEC23497;
	Tue, 14 Jul 2026 03:13:03 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D113F7B4;
	Tue, 14 Jul 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784023987; bh=aChVU7TtBHT3z0z96zTVexNzuowIbAYa5PO5RoYYBbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgW76V30VzVw9a6u4YwpC36e+EiPn+p9GFsyvWUe4gkftKETUsiy8j06/h+eqAHGO
	 pUKzMrs9QTw5CuPlk5M2EK5o9Siu+68pUEZaCC89m8vwrc++9w1lLWfq3ZdkY+Itg4
	 W18DWdJ8bz/0JfXx8Jb3pOjBGNbt6i2SdNMBC5lI=
Message-ID: <233f7245-7b58-4f1e-a2a2-9716602e8011@arm.com>
Date: Tue, 14 Jul 2026 11:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/36] arm64: entry: mask DAIF before returning from C
 EL1 handlers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-8-vladimir.murzin@arm.com>
 <495a9d3f-ad12-4927-84c0-6f8f89cf9a06@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <495a9d3f-ad12-4927-84c0-6f8f89cf9a06@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_031309_072382_C9EFE348 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 08:57, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index ceb4eb11232a..2be42d7f4eaa 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -495,6 +495,7 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
>>  
>>  	state = irqentry_nmi_enter(regs);
>>  	do_interrupt_handler(regs, handler);
>> +	local_daif_mask();
>>  	irqentry_nmi_exit(regs, state);
>>  }
>>  
>> @@ -540,6 +541,7 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>>  	local_daif_restore(DAIF_ERRCTX);
>>  	state = irqentry_nmi_enter(regs);
>>  	do_serror(regs, esr);
>> +	local_daif_mask();
>>  	irqentry_nmi_exit(regs, state);
> This is similar to my patch below:
> 
> https://lore.kernel.org/all/20260703100135.2512312-4-ruanjinjie@huawei.com/
> 
> I think there are at least three problems：
> 
> 1、disable_daif is missing for el1h_64_sync_handler() and __el1_irq()

Hmm, here is call chain for el1h_64_sync_handler()

el1h_64_sync_handler()
  -> el1_abort()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_pc()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_undef()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_bti()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_gcs()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_mops()
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()
  -> el1_breakpt() /* Doesn't touch exceptions, so exception on exit are the same as on entry */
  -> el1_softstp() /* Ditto */
  -> el1_watchpt() /* Ditto */
  -> el1_brk64() /* Ditto*/
  -> el1_fpac() 
     -> arm64_exit_to_kernel_mode()
        -> local_daif_mask()

similarly for __el1_irq()

__el1_irq()
   -> arm64_exit_to_kernel_mode()
      -> local_daif_mask()

all them mask exceptions. What I'm missing?

> 
> 2、The order after moving to the C code is incorrect. disable_daif should
> be the exit point for C, that is, after irqentry_nmi_exit(), it is
> unclear why this order change occurred ?
> 

Fair point, I'll fix that in next iteration.

> 3、local_daif_mask () has added some pseudo NMI operations and
> trace_hardirqs_off ().

Yes, similarly we have for most exceptions. Could you, please, expand
on what is your concern with that?


Cheers
Vladimir

