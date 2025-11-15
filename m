Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B57CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 03:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBQ9HdtlTh/A22GR4c7+T/8PDljeHSm/KcXP8EIooJQ=; b=izxbX8adKCnPESjpQpe6BcmaI5
	I1xUFvBBZYdKEZL1vRaQIupyvguAjM3eKhQxaologVc1O6rqzM9zCh40d7tsWzzF4CUkefkxw/l3y
	oWfjx7CVuKgMfGPkJyLyrcJvxm5oAes+X7J2MgjpFNpLCmZwN3Jf8u5qwOKNJgVmWqAwUyfKO5w+R
	9mVobJuOj6HuPzkCPmMOl9RgfPKoWsqeT25ksEVBShwRWoT91MXDzdaKqGbW0ZElt14EvF0nVAyIy
	G1tZ9dF98GYJoD+T4HkBbbWJ63BrA+0OnCK5j9C/oB1bs85qrg0DQ8zdm4dQsuxaqw38LixyL3jXq
	LffMWLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7EA-0000000DQcR-0kyv;
	Sat, 15 Nov 2025 03:45:30 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7E5-0000000DQbh-0nDx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 03:45:28 +0000
Received: from wmail1.cc.ntu.edu.tw (wmail1.cc.ntu.edu.tw [140.112.2.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 8F153B4F4;
	Sat, 15 Nov 2025 11:44:36 +0800 (CST)
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 11:44:36 +0800
From: Bill Tsui <b10902118@ntu.edu.tw>
To: Will Deacon <will@kernel.org>
Cc: oleg@redhat.com, catalin.marinas@arm.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
In-Reply-To: <aRdVZmeOHYbm24NJ@willie-the-truck>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-2-b10902118@ntu.edu.tw>
 <aRdVZmeOHYbm24NJ@willie-the-truck>
User-Agent: Roundcube Webmail/1.4
Message-ID: <617369509d2fa1948b8851e070dd441e@ntu.edu.tw>
X-Sender: b10902118@ntu.edu.tw
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_194525_374144_9807C622 
X-CRM114-Status: GOOD (  21.68  )
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

On 2025-11-15 00:14, Will Deacon wrote:
> ... but you only implement this for the native (64-bit) case, so I 
> don't
> understand how it helps with the problem above.

Yes it is only for 64-bit tracer to debug 32-bit processes because
64-bit tracer always use 64-bit ptrace API (PTRACE_SETREGSET) regardless
of tracee, so only 64-bit code were changed.

>> @@ -524,9 +506,6 @@ static int hw_break_set(struct task_struct 
>> *target,
>>  			return -EINVAL;
>>  		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
>>  					 offset, offset + PTRACE_HBP_ADDR_SZ);
>> -		if (ret)
>> -			return ret;
>> -		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
>>  		if (ret)
>>  			return ret;
>>  		offset += PTRACE_HBP_ADDR_SZ;
>> @@ -537,10 +516,11 @@ static int hw_break_set(struct task_struct 
>> *target,
>>  					 offset, offset + PTRACE_HBP_CTRL_SZ);
>>  		if (ret)
>>  			return ret;
>> -		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
>> +		offset += PTRACE_HBP_CTRL_SZ;
>> +
>> +		ret = ptrace_hbp_set(note_type, target, idx, addr, ctrl);
> 
> Doesn't this break the case where userspace tries only to set the 
> address?
> The loop will break out when !count without updating anything.
> 

The case doesn't exist for normal use. I saw that as a validation
rather than an intended stop point. If in doubt, I can remove it.

The signature from man ptrace(2)
	ptrace(PTRACE_SETREGSET, pid, NT_foo, &iov)
requires all registers' values to be specified in iov in order. And the
unit of debug registers is the inline structure in user_hwdebug_state:
	struct {
		__u64	addr;
		__u32	ctrl;
		__u32	pad;
	}		dbg_regs[16];
and userspace uses by:
	struct user_hwdebug_state dreg_state;
	ioVec.iov_base = &dreg_state;
	ioVec.iov_len = sizeof(dreg_state.dbg_info) + sizeof(dreg_state.pad) 
+				(sizeof(dreg_state.dbg_regs[0]) * m_max_hwp_supported);

	for (uint32_t i = 0; i < m_max_hwp_supported; i++) {
		dreg_state.dbg_regs[i].addr = m_hwp_regs[i].address;
		dreg_state.dbg_regs[i].ctrl = m_hwp_regs[i].control;
	}
The only case of setting only address is to have iov length only reach
the first register's .addr, but I don't think that memory layout should
be relied on.

> As I mentioned before, I'd prefer to leave this code as-is short of
> removing the indirection through perf entirely.

I am working on that, the side effects are hard to trace, and I think
this patch can make removing perf easier by reducing calls to it and
make clearer what hardware API ptrace needs. This recurs to me and I
think it can be a separated patch.

Here is my progress on removing perf:
I tried to directly set by hw_breakpoint_control, which perf finally
use, but we also relied on perf event handling cpu interrupts when
breakpoints get triggered. This is the hardest part and I am learning
how the kernel handles it across so many others. I feel that the use
of perf has its reasons but definitely there is space to improve.

Anyway, I respect maintainer's decision. I just felt that you thought
this is complicated so I simplifed it. Now I explains the correctness
and how it relates to your final goal. If there are still concerns,
please directly reject me, then I can also stop holding on it.

Thanks,
Bill

