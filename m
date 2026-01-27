Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7139BD2D8F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1lvjaqhQkj8mEhgS24AJuAb84AsUGZxYBbZPk8F7T0=; b=uAS1QxS5WZ37tq
	JZkzuQCHED61RY9LdGCSc9nkul44pVQpDvrcDw8byBQEnsdELMOxvc4HEShHHfvDNE77X65xCUZ6u
	6ZoqPIAFDWWyAvwdNqEvw/wdpftPsodoZuZeYsTsKozS7hysRVURVwFL8wxLwMbEQCDLz1ZfrlVD1
	/wZob8HxpyLyLd1asK+c8tNXwu0DcghcqSKJgCno2EFJlcG/9rVX5FxBNTpbjSw+7SaX2Q+4h0jwl
	yVdiwHspzNLWWCXZCCNa3apC1Sg6AWf68a2owYkOK8mJ70gSWQ9G9s07hUZY0UBrzhDV2pU/2I3Cc
	ubKOg/o/+YB5JZN89DnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgqe-0000000E7GG-3Mee;
	Tue, 27 Jan 2026 11:03:04 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgqX-0000000E7BZ-1RK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:02:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N1lvjaqhQkj8mEhgS24AJuAb84AsUGZxYBbZPk8F7T0=;
	b=QwPX77kTAsPwEGUrVO4XKyg2YdoWDEWGAFhgbz7Ies+eHt/UsfIeyjihwTY4t4E0HZjIXkQ/a
	spYLNzK4fiuuiJACK7ymK7g6u2GjAMSV5316vf9LN8VKUFu2VSitTuDGq5ZCkBKGM1EZIqDAc4+
	KczS/IDtVMrt0z5qDVCO/w0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f0j7t5Z0Zz12LD7;
	Tue, 27 Jan 2026 18:58:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A6D40567;
	Tue, 27 Jan 2026 19:02:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 19:02:41 +0800
Message-ID: <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
Date: Tue, 27 Jan 2026 19:02:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
 <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030257_822540_D37B8B58 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/1/27 17:43, Kevin Brodsky wrote:
> On 27/01/2026 04:01, Jinjie Ruan wrote:
>>> I understand that you're gradually making the arch code more similar to
>>> the core code so that we can switch over to it, but I'm struggling to
>>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>>
>>> Even the core code just seems to use it as a local variable, which it
>>> overrides before it ever uses it. What am I missing?
>> Hi,
>>
>> You're absolutely right. The 'syscall' parameter is indeed treated as a
>> local variable and gets overridden before any real use. Should we
>> refactor to remove the parameter entirely in generic entry?
> 
> I noticed this as well, removing it from the generic function would make
> sense. AFAICT that removal could be propagated quite far in fact:
> syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
> even arch implementation (do_syscall_64() on x86).

Not really, it is the default return value of
syscall_enter_from_user_mode_work() as below, so we only need to remove
the parameter in syscall_trace_enter().

static __always_inline long syscall_enter_from_user_mode_work(struct
pt_regs *regs, long syscall)
{
	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);

       if (work & SYSCALL_WORK_ENTER)
            syscall = syscall_trace_enter(regs, work);

      return syscall;
}


> 
> - Kevin
> 

