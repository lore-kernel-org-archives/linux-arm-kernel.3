Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B337C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EmssTNCr+99wEauNZhvmFZIV1XarqFKTNUjJg0+VSI=; b=Lslj+JdNEO4jzI90cHihHWW9P2
	fEcnB/M2gajbrs5SkSN/MhJKwCOT9AQfsU753MZlT2O5Bz2VnUZ7LhyNP+VLP4jA4s/r+7FrZOIEo
	ultfp62kx/14QDgqFYmSIWDtrO592JoAtfjUEwwNQScs/hkKI3y8eR9DegCDxi+iIYEuKAKGUhchE
	bwfHVSMwg0xLyAg+uCxQXHTyqnaLjYT1wwqpWWliOlOW4eOaCaoqvh56tOeuKiifKshJRL/MOryjv
	XhvDL37QIM4JTeXsxr6/IAXMpRaH3getxscZMx3UcEGUqsodE3O37+4B+X62Q4hvKn2HCTdxezgw8
	sIjayMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKpO-0000000HCR1-0q3N;
	Thu, 16 Jul 2026 12:04:34 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKpL-0000000HCQ0-2dtb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:04:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3EmssTNCr+99wEauNZhvmFZIV1XarqFKTNUjJg0+VSI=;
	b=1X13I+q46AXMroRm3GhECnKGvd8zQWZA4Ur3gHBN+enRDIHNwy3jC194ZKnIGUfMtquZJxq0r
	hojsC+q1SC+8nbX9F9dQw7Vt339GwS0NdK9uwveXv1xApEX/nLZ4Ei97p2pzRBwTb0MfBlx76Kk
	aRzR9jDzQ8Sl/bso+zpPOa8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h1BLD5nT8zcb0T;
	Thu, 16 Jul 2026 19:55:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CEDEA4057F;
	Thu, 16 Jul 2026 20:04:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 20:04:18 +0800
Message-ID: <afcd731c-f304-460b-9552-a0d9c9ab5a82@huawei.com>
Date: Thu, 16 Jul 2026 20:04:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yiqi Sun
	<sunyiqixm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20260714143600.23853-1-will@kernel.org>
 <ac39d21e-8800-4c4e-885e-4baf7af2a106@huawei.com>
 <aljGHQW92uz1HAwI@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aljGHQW92uz1HAwI@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_050431_998837_A2BD5075 
X-CRM114-Status: GOOD (  21.48  )
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



On 7/16/2026 7:53 PM, Will Deacon wrote:
> On Thu, Jul 16, 2026 at 10:57:34AM +0800, Jinjie Ruan wrote:
>> On 7/14/2026 10:35 PM, Will Deacon wrote:
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 4d08598e2891..57e8c6714d44 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
>>>  	}
>>>  }
>>>  
>>> +static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
>>> +{
>>> +	/*
>>> +	 * Keep orig_x0 authoritative so that seccomp (via
>>> +	 * syscall_get_arguments()), audit and the restart path all see the same
>>> +	 * first argument the syscall is dispatched with, even if it has been
>>> +	 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
>>> +	 * or the tracer), as regs[0] holds the return value (see the comment in
>>> +	 * el0_svc_common()) and can be unwound using syscall_rollback().
>>> +	 * For compat tasks, orig_r0 is provided directly through GPR index 17.
>>> +	 */
>>> +	if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
>>> +		regs->orig_x0 = regs->regs[0];
>>> +}
>>> +
>>>  int syscall_trace_enter(struct pt_regs *regs)
>>>  {
>>>  	unsigned long flags = read_thread_flags();
>>> @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
>>>  		ret = report_syscall_entry(regs);
>>>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>>>  			return NO_SYSCALL;
>>> +
>>> +		/*
>>> +		 * Ensure ptrace changes to x0 are visible to seccomp
>>> +		 * ptrace exits (SECCOMP_RET_TRACE).
>>> +		 */
>>> +		update_syscall_orig_x0_after_ptrace(regs);
>>>  	}
>>>  
>>>  	/* Do the secure computing after ptrace; failures should be fast. */
>>>  	if (secure_computing() == -1)
>>>  		return NO_SYSCALL;
>>>  
>>> +	/* Ensure seccomp updates to x0 are visible to audit. */
>>> +	update_syscall_orig_x0_after_ptrace(regs);
>>
>> I think unconditionally updating orig_x0 here is unnecessary, we could
>> Expand seccomp check in place as below the same as generic entry.
> 
> Let's leave any micro-optimisations for later, please. We're going to

That sounds good. We can make these changes that are not closely related
to this fix when we switch to the generic entry.

> need to backport this fix _way_ back, so I've been trying to keep it as
> simple as possible. You're also going to end up replacing all of this
> with the generic entry code, anyway.
> 
> I'll send a v2 with the comment changes shortly, then hopefully I can
> send it as a fix for stable.

Thanks for the update. If v2 comes out, I am happy to help test it again.

> 
> Thanks,
> 
> Will


