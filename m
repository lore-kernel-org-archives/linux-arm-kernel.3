Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C871CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 02:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:Date:
	From:Cc:Content-Type:Subject:To:Content-Transfer-Encoding:References:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHriPCstg+i0z+ONxMg+lO4AK2AiTlrmJeaS1ABljFU=; b=RSC3oP/LfR21p6axoYE20CnJ+C
	Z/HfcKnzkreKVim2/zvfgHlKCnd0QYvhRITU5lflAgwU/S+sXcWdFCBFDaRmtBw5v6M6VUoUbnQX6
	rXh2xY9V+0XDj9AbGEzqvnh2qCEh3ocH2JHVfpRqzXxb2jLxDJAWsFsiZ+hJzwueqnmmqm/BzU5fc
	MND6FrnDaBSLvWWlBeNQhWZK9TTPGz1bU0uifk2gRxem8ryciY9BUP431TlGk335RQGuAUYtAI9Y3
	JDSvwPNMO2RASzJqT/mbbGxTwcPkylNFkXztFef1stbOCudmIyVCTvEh5zPbmTKRgTCdD3zfShJQZ
	uY0myoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdEd-00000006TSq-0gc2;
	Mon, 19 Oct 2026 02:36:23 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdEZ-00000006TSF-2AT1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 02:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792377362; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=PHriPCstg+i0z+ONxMg+lO4AK2AiTlrmJeaS1ABljFU=;
 b=jFsG5ApjPDMjlMerIak1gTsjH8Eh7KCWxr9n74b75FE1A0K75zzGnmoWz0MichRc0kzFrT
 YTp0OAZS3y+bEHYdukgizOWqgMVZx0FY2XQrFeHWeUXilW0IWyRBncXp58wrGdF4Q4597k
 x6llivluwdsjC+EqdUoTLIxmx+yGMhIWGBxHb5SVC/g/b6PfyeAyu0vJAYl3i1LA6wb9lw
 gzNYMG1IzxokfaOiZBXlpvL7jpA4S+r6gtwNFfU1m4+1L310TDVzOLqNn6UoQ5cwgLc2sK
 dJTmW5mVYMp3yn+u6vaYtKMTXfAZ5UfLkTgLEpOoqZCvhWWwG8Ta4mOaws+ZdA==
Mime-Version: 1.0
References: <20261016024536.18938-1-zhaogongyi@bytedance.com> <atHHttWKtnKHJnVQ@redhat.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "Oleg Nesterov" <oleg@redhat.com>
Subject: Re: [PATCH] arm64: ptrace: don't warn on missing siginfo in a group-stop
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ad58210+525d0f+lists.infradead.org+zhaogongyi@bytedance.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>, 
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Mon, 19 Oct 2026 10:35:44 +0800
In-Reply-To: <atHHttWKtnKHJnVQ@redhat.com>
Message-Id: <b80c0fd0-498b-4c6c-93df-acee59d2be85@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_193619_976173_62A3C38C 
X-CRM114-Status: GOOD (  17.18  )
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

On 10/16/26 2:44 PM, Oleg Nesterov wrote:
> On 10/16, Zhao Gongyi wrote:
>>
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -573,9 +573,11 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>   	if (regs->syscallno == NO_SYSCALL)
>>   		return;
>>   
>> -	/* We should only be called when target is in a ptrace stop */
>> -	if (WARN_ON_ONCE(!info))
>> +	/* Only non-seized group-stops lack siginfo (see do_jobctl_trap()). */
>> +	if (!info) {
>> +		WARN_ON_ONCE(target->ptrace & PT_SEIZED);
>>   		return;
>> +	}
> 
> Perhaps we can simply remove this WARN_ON_ONCE?
> 
> Oleg.
> 
> --- x/arch/arm64/kernel/ptrace.c
> +++ x/arch/arm64/kernel/ptrace.c
> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after
>   	if (regs->syscallno == NO_SYSCALL)
>   		return;
>   
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> -		return;
> -
>   	/*
>   	 * For compat tasks, orig_r0 is provided directly through GPR index
>   	 * 17.
> @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after
>   	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
>   	 * return value of the system call.
>   	 */
> -	if ((info->si_code & ~0x80) == SIGTRAP &&
> +	if (info && info->si_code == (SIGTRAP | 0x80) &&
>   	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
>   		return;
>   	}

Hi Oleg,

Thanks. I agree that we can remove WARN_ON_ONCE() and allow the
orig_x0 update when last_siginfo is NULL.

I tested syscall-exit-stops on an arm64 7.3.0-rc6-syz kernel with and
without PTRACE_O_TRACESYSGOOD. In both cases, ptrace_message was
PTRACE_EVENTMSG_SYSCALL_EXIT, and an NT_PRSTATUS write succeeded.
The observed si_code values were:

   without PTRACE_O_TRACESYSGOOD: SIGTRAP        (5)
   with    PTRACE_O_TRACESYSGOOD: SIGTRAP | 0x80 (133)

There were no kernel warnings. With the proposed equality check, the
syscall-exit-stop without PTRACE_O_TRACESYSGOOD would fall through and
update orig_x0 from x0, which contains the syscall return value at
that stop.

I think we should retain the check for both si_code values, while
guarding the dereference:

         if (info && (info->si_code & ~0x80) == SIGTRAP &&
             target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
                 return;

I'll send a revised patch with the warning removed and this condition.

Thanks,
Gongyi

