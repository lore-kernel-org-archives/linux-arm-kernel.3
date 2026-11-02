Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ahnP1DO;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3a8F3w6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uG7fhzN12tKnMsVMVFuJ5vI38xwZjGLr+R0JNhRW+dM=; b=2ahnP1DOA/C9RJ
	du/z9ghx76zFu4N1EB/hzYHBiOD/P9l/rDc+JiZtrxY9/7zJWe2EoJmCHnT16T+yxaxWLD58si6fR
	tuuMJgAhs7FC0IL3MBiequvVQyevXmZ4IGxSKsczeJOxF0SFHmF+mL7t5bJ39j1Ae/v1c6lXfp3zL
	JBmw+iURqwQxNeZHoKNEl/psrJoLJ3cyYQEEut8pehVUysArrKfczsYLkMWWIS6fAf1I39RaZarF+
	YlzlhGrAlC5Cb0Yeah57b0iA3aH+S96fd9i61EoGquagSxMlx+uZyxJiqEWAc42YRpx0ptXsbe0jD
	ohendl7cwPBUl0GVUocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmrz-0000000Fnw9-1Sp7;
	Mon, 02 Nov 2026 07:54:19 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmru-0000000Fnvi-3ySt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:54:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uG7fhzN12tKnMsVMVFuJ5vI38xwZjGLr+R0JNhRW+dM=;
	b=3a8F3w6NpIH15K4K3mbUbYPitJbvxRFftH7WHbNUu4Z0X5Cc70S+nSiTTnC552Gt7OoVsWRKw
	73TCW6ghLhCTvrs/IRQw+pNPSGVGrk5JlkRtUgPVOaDfKlBhOxcq45O3XojCa093YwCoBLhyvn4
	xrE+MbEYm4p7CuHwx5MplWc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jJ3qY4GrQzcb0L;
	Mon,  2 Nov 2026 15:53:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 889014058F;
	Mon,  2 Nov 2026 15:54:08 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:54:07 +0800
Message-ID: <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
Date: Mon, 2 Nov 2026 15:54:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
To: Catalin Marinas <catalin.marinas@arm.com>, Zhao Gongyi
	<zhaogongyi@bytedance.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>, <oleg@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <at-czRUYRPRxi9dy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_235415_663849_41618BD1 
X-CRM114-Status: GOOD (  18.22  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/27 2:32, Catalin Marinas 写道:
> On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
>> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
>> which calls ptrace_stop() without siginfo. If the tracer writes
>> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
>> NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
>> WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.
>>
>> Remove the warning and guard the syscall-exit-stop check against a
>> missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
>> syscall-exit-stops use either value depending on whether the tracer
>> enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
>> assignment to synchronize orig_x0 from x0.
>>
>> Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
>> ---
>> Changes since v1:
>> - Remove the warning and early return, as suggested by Oleg.
>> - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
>>
>> v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
>>
>> Tested on arm64 KVM at af32da41b032 with this v2 applied.
>> At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
>> NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
>> x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
>> with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
>> respectively). No kernel warnings occurred.
>>
>>  arch/arm64/kernel/ptrace.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f743cbec1..22fb9eeed 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>>  	if (regs->syscallno == NO_SYSCALL)
>>  		return;
>>  
>> -	/* We should only be called when target is in a ptrace stop */
>> -	if (WARN_ON_ONCE(!info))
>> -		return;
> 
> That's a slight semantic change since this function may now update
> orig_x0 even when !info. However, I think it makes more sense as the aim
> of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
> on syscall entry") was to update orig_x0 in all cases other than
> syscall-exit-stop. We can't have the latter with !info.

I think maybe we can refer to ptrace_get_syscall_info_op()?

> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.
> 
> Thanks.
> 

-- 
Best regards,
Jinjie


