Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065EDCFA478
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXg8+7/IaBeahjUcoxp7tnRw/aA/6ViGCJ49LoFeOZY=; b=cogsy3iG5awhP+5KNf8jY7f/ha
	ptoW+TZbSWW75JvE+m3lNv8AONuREXalyBMM0GPoBEi3JW0Bfj2wWBl9x+lWwdf8biHPNnb2sFP41
	AvyOBo4L/b8jox6OVN8rovdVPCe3rb1mWSrssCQksmWm5fgj0IK/xr6Ckzxl+dt3F5t+Jckv2ByH0
	NAImY9QkoT0+j4po5+QnDSyjy/nLE1gU4yyzsXDJEs/m6VIo0X6aruwkMVcmNLobALzXNyRTKD4xQ
	9DLYM8bzD1zgFbpvO6vhPfcMwBVk4T1nS11Wzl1MCLiZmhjx8NKOyeyF8Q5uK6+1ILHAWD25FpYI0
	dpiY7QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLao-00000007yak-3EhU;
	Fri, 21 Nov 2025 07:30:06 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLal-00000007yZO-2wFb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:30:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yXg8+7/IaBeahjUcoxp7tnRw/aA/6ViGCJ49LoFeOZY=;
	b=BWDCPuIZauSbS7kpISZx+lbXlOQi8ORkqYVjuyrDXbFs+yIsiwHAMLmUx67uxxMQYnbwxF5cO
	+sRHBt+QaAhe81TOPUfdEfqV5/LIYtAUsrAWxcF437IxQk1g3joCkF0PFG6DIi/I7/a2XncjiY7
	mY0/l7JUeQCu0RV2xJYRHWs=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dCRdk0kPQz1prL2;
	Fri, 21 Nov 2025 15:28:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D5DB6180BCF;
	Fri, 21 Nov 2025 15:29:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 15:29:53 +0800
Message-ID: <a383b3c6-e036-294e-5c62-c7719349c75c@huawei.com>
Date: Fri, 21 Nov 2025 15:29:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 06/11] arm64/ptrace: Expand secure_computing() in place
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <macro@orcam.me.uk>, <deller@gmx.de>,
	<mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <kmal@cock.li>, <lihongbo22@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-7-ruanjinjie@huawei.com>
 <e33d0fdb-e8a5-4abd-8e40-773349008b6b@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <e33d0fdb-e8a5-4abd-8e40-773349008b6b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_233004_222828_AF5B1E1B 
X-CRM114-Status: GOOD (  13.70  )
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



On 2025/11/19 1:12, Kevin Brodsky wrote:
> On 17/11/2025 14:30, Jinjie Ruan wrote:
>> The generic entry expand secure_computing() in place and call
>> __secure_computing() directly.
>>
>> In order to switch to the generic entry for arm64, refactor
>> secure_computing() for syscall_trace_enter().
>>
>> No functional changes.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 707951ad5d24..9af3046a2ce9 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2387,8 +2387,11 @@ int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>>  	}
>>  
>>  	/* Do the secure computing after ptrace; failures should be fast. */
>> -	if (secure_computing() == -1)
>> -		return NO_SYSCALL;
>> +	if (flags & _TIF_SECCOMP) {
>> +		ret = __secure_computing(NULL);
> 
> No argument was passed to __secure_computing() in v6, as expected since
> it was removed in v6.15. Not sure why this NULL reappeared.
> 
There is a typo here.

>> +		if (ret == -1L)
> 
> ret is an int, so should be -1, not -1L.

Right, not -1L.

> 
> - Kevin
> 
>> +			return NO_SYSCALL;
>> +	}
>>  
>>  	/* Either of the above might have changed the syscall number */
>>  	syscall = syscall_get_nr(current, regs);
> 

