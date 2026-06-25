Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33307CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgG6+D68sy9iRTc5R0iCJ3olXs5OjWjTcVd+XbrgDPE=; b=cBBqioxA0bD7VXm3S0+CFl63Rf
	XMv4dADSjxOaSB+OVU+bw8x5E1EmRdXLP1yVK0HbzGwUBiFGiYY52k6Gvsj5cZAZWwrru2d1i7Pbg
	FxnT34hZczcwSwQZH4QE7COLSYsalkrHGg9BtHw6IF52Tkv1Euxb+BtUJgrjmSkJBdj36IfobpAwo
	4FqIFjiQl+rgRV4Pv+4v7o5OjsApnZr5EqwL2CxPnu3ZDNp7TzOiKVu5bHSfr+JthZMFbFfRf2t9n
	F0KMFqpNDcBqTNROINhvc9+3Psw1/J0iuxK29f48JmO8PX0n00Cs39ct693zgPdccReu+sCLrgS04
	/DxWtMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfnu-00000008r5W-1Wp1;
	Thu, 25 Jun 2026 08:51:22 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfnq-00000008r4g-1nFV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:51:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vgG6+D68sy9iRTc5R0iCJ3olXs5OjWjTcVd+XbrgDPE=;
	b=pXE2/Lq89Ou8/Tcgq+tmjFS4Q/beQPc2UPLS3CkVp5jPHIyNLyCKSsCNxMkJYTRGrIvvkiyY6
	eBebrAR6GFM6wFm5jYHV4vL91naBsZeJqwaVWWpAjt85V/rnTITtnz40/YSgsImntltOOgu4VO6
	RvRnqWpfx0JjCqBVOB0XZkg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gmC3n0Jrwz1T4H1;
	Thu, 25 Jun 2026 16:42:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 440EC4048F;
	Thu, 25 Jun 2026 16:51:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 16:51:09 +0800
Message-ID: <190f6862-25a8-495e-b96d-8a1a6d244bd3@huawei.com>
Date: Thu, 25 Jun 2026 16:51:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 03/11] arm64/ptrace: Use syscall_get_nr() helper for
 syscall_trace_enter()
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <mark.rutland@arm.com>,
	<yeoreum.yun@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<ldv@strace.io>, <thuth@redhat.com>, <james.morse@arm.com>,
	<song@kernel.org>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-4-ruanjinjie@huawei.com>
 <5ea376d7-388a-418c-acde-9ebe1da96202@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <5ea376d7-388a-418c-acde-9ebe1da96202@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_015118_994469_E8D2081F 
X-CRM114-Status: UNSURE (   8.46  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 6/24/2026 9:42 PM, Ada Couprie Diaz wrote:
> On 11/05/2026 10:20, Jinjie Ruan wrote:
> 
>> Use syscall_get_nr() to get syscall number for syscall_trace_enter().
>> This aligns arm64's internal tracing logic with the generic
>> entry framework.
>>
>> [Changes]
>> 1. Use syscall_get_nr() helper:
>>     - Replace direct regs->syscallno access with
>>       syscall_get_nr(current, regs).
>>     - This helper is functionally equivalent to direct access on arm64.
>>
>> 2. Re-read syscall number after tracepoint:
>>    - Re-fetch the syscall number after trace_sys_enter() as it may have
>>      been modified by BPF or ftrace probes, matching generic entry
>> behavior.
>>
>> [Why this matters]
>> - Aligns arm64 with the generic entry interface.
>> - Makes future migration to generic entry framework.
> This is missing what it makes the future migration . Easier, possible ?
> (Same in patch 02, but I missed it !)

Hi Ada,

Yes, a word was missing: 'simpler' or 'smoother'.

Best regards,
Jinjie


>> - Properly handles syscall number modifications by tracers.
>> - Uses standard architecture-independent helpers.
>>
>> No functional changes intended.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> 
> Otherwise,
> 
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 


