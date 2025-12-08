Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFDD3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irJb6cvU/fom+A8NIoGIACpM9tMEXj6ECbx53ePW9ag=; b=d4+IIZ8xKl7BKFrXkZ6vuOy2zv
	1yygBdKCAA1XKy77ue3w1U8zb8CSZfH8faELmSmTB/4kM6OAouCLmgDE/ryp1c+LTz6aqPwosgz+g
	JGxfxSIQCvimaeKBDHF0JhS0O6Nacisp+ZWueX1ve99fi1wWSfLiZcy5FwIiXNOgNYh1wZbeemEI9
	rWrBSg+VyGvJWw5yGZnPYAYzK4oo/PRrv5GFz/nu9G60Ggjt74JeP6GO9vNmYh1Lj3N/E+vyWRYuB
	dMHgeD7fX3and2GJO3dYgz6yIXA3jeu+jJXr1U8HP+DpTBC5hZFXCQGCvKokwwUmGNxfL4brpBdpZ
	wuI3lAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUmi-0000000ChBL-3CGI;
	Mon, 08 Dec 2025 06:31:48 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUmf-0000000ChAk-2HgL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 06:31:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=irJb6cvU/fom+A8NIoGIACpM9tMEXj6ECbx53ePW9ag=;
	b=YiyFltbAWDbuPL00L926hXQ9g4gDJaXdZikPQI1HzTLoLx3qdCdgRP++xwx3a8ZKtZbJSAyAS
	C2PwNZb1cLhMxnC8sv44DyTg+uHZP+HB17EKTAEWyxvhTVXvmH5T2/dEsDwhIggjuidirhRqCNT
	FZJH1cl9v8gauwBkKv+xZSs=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dPsWz2CyTznTXP;
	Mon,  8 Dec 2025 14:29:19 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 06D23180042;
	Mon,  8 Dec 2025 14:31:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Dec 2025 14:31:36 +0800
Message-ID: <1f919820-2c8e-f041-b38d-963b55c8792d@huawei.com>
Date: Mon, 8 Dec 2025 14:31:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 03/16] arm64/ptrace: Return early for
 ptrace_report_syscall_entry() error
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <kevin.brodsky@arm.com>, <ldv@strace.io>,
	<mark.rutland@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<ada.coupriediaz@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-4-ruanjinjie@huawei.com>
 <7c7e5c66-f618-466f-b353-54fad71c0e14@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7c7e5c66-f618-466f-b353-54fad71c0e14@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_223145_953652_147AFA27 
X-CRM114-Status: GOOD (  14.49  )
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



On 2025/12/8 13:24, Anshuman Khandual wrote:
> On 04/12/25 1:51 PM, Jinjie Ruan wrote:
>> The generic entry abort the syscall_trace_enter() sequence if
>> ptrace_report_syscall_entry() errors out, but arm64 not.
>>
>> As the ptrace_report_syscall_entry() comment said, the calling arch code
>> should abort the system call and must prevent normal entry so no system
>> call is made if ptrace_report_syscall_entry() return nonzero.
>>
>> In preparation for moving arm64 over to the generic entry code,
>> return early if ptrace_report_syscall_entry() encounters an error.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 4532e9831856..3926ce6aa268 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2346,15 +2346,18 @@ static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
>>  	return saved_reg;
>>  }
>>  
>> -static void report_syscall_entry(struct pt_regs *regs)
>> +static int report_syscall_entry(struct pt_regs *regs)
>>  {
>>  	unsigned long saved_reg;
>> -	int regno;
>> +	int regno, ret;
>>  
>>  	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
>> -	if (ptrace_report_syscall_entry(regs))
>> +	ret = ptrace_report_syscall_entry(regs);
>> +	if (ret)
>>  		forget_syscall(regs);
>>  	regs->regs[regno] = saved_reg;
>> +
>> +	return ret;
>>  }
>>  
>>  static void report_syscall_exit(struct pt_regs *regs)
>> @@ -2381,10 +2384,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>>  int syscall_trace_enter(struct pt_regs *regs)
>>  {
>>  	unsigned long flags = read_thread_flags();
>> +	int ret;
>>  
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> -		report_syscall_entry(regs);
>> -		if (flags & _TIF_SYSCALL_EMU)
>> +		ret = report_syscall_entry(regs);
>> +		if (ret || (flags & _TIF_SYSCALL_EMU))
> 
> A small nit.
> 
> Could report_syscall_entry(regs) be checked directly in the 'if' conditional
> code block thus dropping new 'ret' altogether ?

It’s perfectly fine, but on the one hand, the upcoming refactor of the
secure_computing() patch will be able to use this ‘ret’, and on the
other, the intent of this patch is to highlight the differences from the
generic entry so we can switch over smoothly later. Simplifying it here
therefore doesn’t help much for demonstrating those differences.

> 
>>  			return NO_SYSCALL;
>>  	}
>>  
> 
> 

