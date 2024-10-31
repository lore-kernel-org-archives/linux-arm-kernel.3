Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A8E68961
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5/Px0qO0z9gpg/TP1fqvpFfkNubRgw8sys1UwdZVtw=; b=GuUw/qhfkG4vDa2TQI0TJUpYNN
	s7cpQD+Pdnp2Xo8q8Nn8+8CRS/aU6keM7AqY7F/7fXECzpZmmKWctkGzpkeFGJKWIBTZV0tZ95DOU
	eMLifWQKB1AGC8gqE8h1blimESbwl0cWotTKK6QyWr2eLAhboiPf4R7tUXaP7Knnktzi++APV2eiy
	QWZcsnsgbBwkw1DyaG86X073doxKYJgaF2NqntJ/7oln8oeB0PZeCPFBeAPavFkWisOUWyxfmHVwH
	5g++bJDG8wgcbWGpBPlEXymmDfi6/lUDI0kIuIoB24/lCXZmkqAzKdhYHQGoNzCtDM5NVxbAJ0i01
	AG2oyL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qtm-00000002zn0-3zwz;
	Thu, 31 Oct 2024 08:51:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QoG-00000002yov-1FU1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 08:45:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EDB1063;
	Thu, 31 Oct 2024 01:46:06 -0700 (PDT)
Received: from [10.57.66.133] (unknown [10.57.66.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 138CE3F66E;
	Thu, 31 Oct 2024 01:45:31 -0700 (PDT)
Message-ID: <cd0e114d-57eb-4c90-bb6f-9abf0cc8920f@arm.com>
Date: Thu, 31 Oct 2024 09:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
To: Jeff Xu <jeffxu@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com,
 shuah@kernel.org, sroettger@google.com, tglx@linutronix.de, will@kernel.org,
 yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Jorge Lucangeli Obes <jorgelo@chromium.org>, Jann Horn <jannh@google.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <20241029144539.111155-2-kevin.brodsky@arm.com>
 <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_014540_461709_6C5DCAB0 
X-CRM114-Status: GOOD (  13.25  )
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

On 30/10/2024 23:01, Jeff Xu wrote:
>> -static int restore_poe_context(struct user_ctxs *user)
>> +static int restore_poe_context(struct user_ctxs *user,
>> +                              struct user_access_state *ua_state)
>>  {
>>         u64 por_el0;
>>         int err = 0;
>> @@ -282,7 +338,7 @@ static int restore_poe_context(struct user_ctxs *user)
>>
>>         __get_user_error(por_el0, &(user->poe->por_el0), err);
>>         if (!err)
>> -               write_sysreg_s(por_el0, SYS_POR_EL0);
>> +               ua_state->por_el0 = por_el0;
>>
>>         return err;
>>  }
>> @@ -850,7 +906,8 @@ static int parse_user_sigframe(struct user_ctxs *user,
>>  }
>>
>>  static int restore_sigframe(struct pt_regs *regs,
>> -                           struct rt_sigframe __user *sf)
>> +                           struct rt_sigframe __user *sf,
>> +                           struct user_access_state *ua_state)
>>  {
>>         sigset_t set;
>>         int i, err;
>> @@ -899,7 +956,7 @@ static int restore_sigframe(struct pt_regs *regs,
>>                 err = restore_zt_context(&user);
>>
>>         if (err == 0 && system_supports_poe() && user.poe)
>> -               err = restore_poe_context(&user);
>> +               err = restore_poe_context(&user, ua_state);
>>
>>         return err;
>>  }
>> @@ -908,6 +965,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  {
>>         struct pt_regs *regs = current_pt_regs();
>>         struct rt_sigframe __user *frame;
>> +       struct user_access_state ua_state;
>>
>>         /* Always make any pending restarted system calls return -EINTR */
>>         current->restart_block.fn = do_no_restart_syscall;
>> @@ -924,12 +982,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>         if (!access_ok(frame, sizeof (*frame)))
>>                 goto badframe;
>>
>> -       if (restore_sigframe(regs, frame))
>> +       if (restore_sigframe(regs, frame, &ua_state))
>>                 goto badframe;
>>
>>         if (restore_altstack(&frame->uc.uc_stack))
>>                 goto badframe;
>>
> Do you need to move restore_altstack ahead of restore_sigframe?

This is not necessary because restore_sigframe() no longer writes to
POR_EL0. restore_poe_context() (above) now saves the original POR_EL0
value into ua_state, and it is restore_user_access_state() (called below
just before returning to userspace) that actually writes to POR_EL0,
after all uaccess is completed.

Having said that, I somehow missed the call to restore_altstack() when
writing the commit message, so these changes in sys_rt_sigreturn are in
fact necessary. Good catch! At least the patch itself should be doing
the right thing.

- Kevin

> similar as x86 change [1],
> the discussion for this  happened  in [2] [3]
>
> [1] https://lore.kernel.org/lkml/20240802061318.2140081-5-aruna.ramakrishna@oracle.com/
> [2] https://lore.kernel.org/lkml/20240425210540.3265342-1-jeffxu@chromium.org/
> [3] https://lore.kernel.org/lkml/d0162c76c25bc8e1c876aebe8e243ff2e6862359.camel@intel.com/
>
> Thanks
> -Jeff
>
>
>> +       restore_user_access_state(&ua_state);
>> +
>>         return regs->regs[0];


