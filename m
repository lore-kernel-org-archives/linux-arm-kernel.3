Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wKaJFVXl;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0eXB7wZO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AYm9Q9rTGdSI8SAFJ5HmZUi3JZl+WGAogmiit+aiQf8=; b=wKaJFVXlBA7tAT
	tm8efzvtZHezQxGODSlJ7PUrVUHI8gw05jlpdqNNJLpT7dn0mO5U16AQ/8SE2BiWepJa/3D05EzwL
	dotlb36WPTbr4decaLHXZVeU+jLzU1wLfhu2RzQRJAuZVGkgAuvfcVfYcGOrC/4tjM18GnBgF7w1g
	rW2Gdh/B41e2BPhuOFi6UFKtDF9brrr4syw1dWTnb6IP0g5EoQC4qI49neSjygTBH9BLg45WxFtdT
	IQ2EuUHDZpcxSAjiA8NwPmrOamv5vmPjuzEdZjeJP42ICMF5JJNYEryK8rR0xbWa0+AFDV7cKcaaC
	JRRrsysg1gB3DLhHLHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmgx-0000000Fm5B-0jxM;
	Mon, 02 Nov 2026 07:42:55 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmgt-0000000Fm4W-2GLu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:42:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AYm9Q9rTGdSI8SAFJ5HmZUi3JZl+WGAogmiit+aiQf8=;
	b=0eXB7wZOLoo05itWdaoxZegg/PmVPUaIxoXlY8h2+4ZwsqG2y/DUQE8Tn06efihwyXtilk5PE
	bdu7uOP4OqsXhLGLzB7JUHrN1GEDfN4sR47fOpBChYZxOmA3XQmjSpidTkAiDMzVFqaZYyOtaDa
	3vjqYYTIJiari3dO2XBS9fQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jJ3Zm4Ngnz1prLD;
	Mon,  2 Nov 2026 15:42:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F2EBC4056E;
	Mon,  2 Nov 2026 15:42:43 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 15:42:43 +0800
Message-ID: <5dc79bcc-c61b-4caf-82e3-602aae8a88c4@huawei.com>
Date: Mon, 2 Nov 2026 15:42:42 +0800
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
X-CRM114-CacheID: sfid-20261101_234252_321169_44DBA42A 
X-CRM114-Status: GOOD (  18.70  )
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

I agree, our original intent was to avoid the return value contaminating
orig_x0 at syscall exit; apart from that case, it should be kept in sync.

> 
> I'll wait for a couple of days to see if Will has any comments and queue
> it.
> 
> Thanks.
> 

-- 
Best regards,
Jinjie


