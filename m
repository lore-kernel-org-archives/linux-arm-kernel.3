Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133AED5B861
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 02:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqV6xttGRjVmfRIwftVP4LvBCEmeqbETUITG7bu2gdw=; b=jAa8+9ePBrlYASaWohsyzViWNT
	kPrsfr6LnraTRtFKFgh6Mc1Q77USGHtYU8sHUHoofMflD8twqxaJxIlbgUaHeu4X6Iy8pZEsUU0ma
	PDyY1HNqyKPHrtV7KNv1sYPA/rHFWT2YD+ut74dJTJOZRIhvhcIoijja4R94ekXbihBCSelCTjgMj
	YWh6s2E5yORRdxiAscV9ddMkA3mNdWf9SeKNs+2ivp84rjmj9AvQ9IPyPbpK8+h5V8XuNS01xj4wn
	kXzA+/whxunN33/ZPFK7FBCW1WoN6ElqWUjld61xpM5OE8Ew6ez+sFLoJhpyGFETCxicwU8liAQzi
	Z8nG3HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cFW-0000000D11z-1NVi;
	Tue, 29 Oct 2024 02:46:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5cCA-0000000D0JK-3MN3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 02:43:00 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XcvfY30GPz20r5l;
	Tue, 29 Oct 2024 10:41:57 +0800 (CST)
Received: from kwepemd200013.china.huawei.com (unknown [7.221.188.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D88414013B;
	Tue, 29 Oct 2024 10:42:55 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemd200013.china.huawei.com (7.221.188.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 29 Oct 2024 10:42:54 +0800
Message-ID: <ac6b0f63-69f4-4f7f-87d6-319c3027ffff@huawei.com>
Date: Tue, 29 Oct 2024 10:42:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Return early when break handler is found on
 linked-list
To: Will Deacon <will@kernel.org>
CC: <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<oliver.upton@linux.dev>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241024034120.3814224-1-liaochang1@huawei.com>
 <20241024145028.GA31224@willie-the-truck>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <20241024145028.GA31224@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200013.china.huawei.com (7.221.188.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_194259_009487_E427F1ED 
X-CRM114-Status: GOOD (  15.68  )
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



在 2024/10/24 22:50, Will Deacon 写道:
> On Thu, Oct 24, 2024 at 03:41:20AM +0000, Liao Chang wrote:
>> The search for breakpoint handlers iterate through the entire
>> linked list. Given that all registered hook has a valid fn field, and no
>> registered hooks share the same mask and imm. This commit optimize the
>> efficiency slightly by returning early as a matching handler is found.
>>
>> v2->v1:
>> Remove all WARN_ON(!hook->fn) in v1 as Will suggested.
> 
> nit: Changelogs like ^^^ should go after the '---' line, otherwise they
> end up in the git history.

Will

Thanks for pointing out.

> 
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  arch/arm64/kernel/debug-monitors.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
>> index c60a4a90c6a5..58f047de3e1c 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -303,7 +303,6 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>>  {
>>  	struct break_hook *hook;
>>  	struct list_head *list;
>> -	int (*fn)(struct pt_regs *regs, unsigned long esr) = NULL;
>>  
>>  	list = user_mode(regs) ? &user_break_hook : &kernel_break_hook;
>>  
>> @@ -313,10 +312,10 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
>>  	 */
>>  	list_for_each_entry_rcu(hook, list, node) {
>>  		if ((esr_brk_comment(esr) & ~hook->mask) == hook->imm)
>> -			fn = hook->fn;
>> +			return hook->fn(regs, esr);
>>  	}
>>  
>> -	return fn ? fn(regs, esr) : DBG_HOOK_ERROR;
>> +	return DBG_HOOK_ERROR;
>>  }
>>  NOKPROBE_SYMBOL(call_break_hook);
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> I assume Catalin will pick this one up (but he'll need to tweak the
> commit message as per my comment above).
> 
> Will

-- 
BR
Liao, Chang


