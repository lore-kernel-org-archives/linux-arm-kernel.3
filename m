Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12CA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAf90zzM;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nlhFEcMR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:References:Mime-Version:Message-Id:Date:From:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L0VbpmrkDXp5SRFASfh5Wj4ga8p/F6MDKjY6zQhL8g8=; b=hAf90zzMHUISPQ
	JSimZcDln15O07gN3d1UBLp6DuGqzLnQRK+UbLb2eU2Y3kqxt+NYhBTaRY57yJmU0YIzAZQ2g1aov
	gwgG1f4rfZYjp6nsW5gC2T6tj5kE8id0ifsXPel8egjycW+laj3RhQYDiU/L7iIKLdyd1vK3itz84
	GdoFt6GfDTrdWCdhoNWAfIccpt39ZCW2I6AIlvdLw5Hot7uuWuH9Cqn7umQO8sToivCTw55LL/qne
	Ngu7mjnY09wBc/G5l732p1mS7scQhkLazoF52H1ZTI3nskJqYORS3S4hP5ue/KeZ2J9ZFuDfGgBMB
	9XWDsL2WwtgNqzufqF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd4s-00000000HE9-3uwz;
	Sat, 24 Oct 2026 14:50:35 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd4p-00000000HDh-1EWE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 14:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792853422; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=L0VbpmrkDXp5SRFASfh5Wj4ga8p/F6MDKjY6zQhL8g8=;
 b=nlhFEcMRiuEK6eDh9q6wPx028q61zJYF5UGz5FnQnK/VQDeZUEyrCz8JuhTiRsmq1nk5Sz
 U/k9OM4ggQ23zoBJYL5ODC0oyE11hN1uRmAHs4KQkiKv5MEsamFszfgWtiQeMmvVaNhCmI
 90Hx2aW1ZpH8eYebBNhNMcvXKNqBf/4gLuXusb9tesvbIlIKksVUnFI4nXJhSSTNhzRJHU
 S4UW9kGFlUqJOKptbnqbOcMbDNN8vSEBS8hiqBbpZhmwRHwn1NE0RGaQGgqKYp565D8dXr
 0xgn+tbBb+DKnPp2Ky9BlY0JHxF20z/evnRO38Jt1BiUD6XJ3As98vf3/2gKJQ==
In-Reply-To: <attf9KALBQyOGyco@redhat.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Sat, 24 Oct 2026 22:50:06 +0800
Message-Id: <beb5fc93-4cca-4dc9-a4e3-f406e8c9cd58@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <attf9KALBQyOGyco@redhat.com>
To: "Oleg Nesterov" <oleg@redhat.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>, 
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Content-Type: text/plain; charset=UTF-8
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26adcc5ac+0eddb5+lists.infradead.org+zhaogongyi@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_075031_411724_875E40A9 
X-CRM114-Status: GOOD (  19.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 9:24 PM, Oleg Nesterov wrote:
> On 10/23, Zhao Gongyi wrote:
>>
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>   	if (regs->syscallno == NO_SYSCALL)
>>   		return;
>>
>> -	/* We should only be called when target is in a ptrace stop */
>> -	if (WARN_ON_ONCE(!info))
>> -		return;
>> -
>>   	/*
>>   	 * For compat tasks, orig_r0 is provided directly through GPR index
>>   	 * 17.
>> @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>   	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
>>   	 * return value of the system call.
>>   	 */
>> -	if ((info->si_code & ~0x80) == SIGTRAP &&
>> +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
>>   	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
>>   		return;
> 
> LGTM, but I don't understand this arm-specific code.
> 
> And... Do we need to check target->last_siginfo at all?
> 
> ptrace_signal() -> ptrace_stop() path sets ->ptrace_message = 0.
> 
> In all other cases: if info != NULL, then .si_code == target->exit_code.
> ptrace_event(event) users always use event != 0 and != 0x80.
> 
> So it seems that we can just do
> 
> 	if ((target->exit_code & ~0x80) == SIGTRAP &&
> 	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)
> 
> ?
> 
> I'll recheck... If I am right, perhaps it makes sense to simplify
> ptrace_get_syscall_info_op().
> 

Hi Oleg,

Thanks for the review. I checked target->exit_code when the tracer calls 
PTRACE_SETREGSET after waitpid(). It
was 0 at syscall-exit-stops both with and without PTRACE_O_TRACESYSGOOD: 
wait_task_stopped() clears it when
reporting the stop. last_siginfo still held the corresponding si_code (5 
or 133).

I also used temporary kernel logging to check orig_x0 before and after 
writing a distinct value to x0 at each
stop. orig_x0 remained unchanged in both cases. Using exit_code in this 
condition would instead fall through
and copy the new x0 into orig_x0.

So I think we should keep the last_siginfo check in v2. The same 
exit_code lifetime also seems relevant to
ptrace_get_syscall_info_op() after waitpid().

Thanks,
Gongyi

