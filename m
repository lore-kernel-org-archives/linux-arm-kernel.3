Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A5C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEumZT6SLNWNFCH1gp9i+xFRviyBiPY2gHItWhklHn0=; b=KnWIaIcBuOxP7ZWcoYpwJKR34q
	rHZAR+s2+O/DbDvTQLiHmq25ZOh74hIVGT+ZSmlkvY1UbGSSWtLU7DGyFF07D4jmurEf/K63OP4U9
	oy1kO2e+v1laS+c5cbN36Oo9cCllzFu5Jd2JyA1TCoB3E1kZEz7jjN+EB5648InSr4nyexozGsy8a
	5QtUK8iezQWa1uepkS+JI1k/dQeBk0ItG3NwDbimZcS+gj/JaEl2EzSKQK5H0GLxupJjXmkDUiDnZ
	+3hZjyzWIyjr9xQ8TbXA5U3U8xcGzoOOwexhDsKIp0vafNLlUSpZIGG5qQMqjNmQ4/mSk/z7WHK+Y
	bEeZpMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMix1-0000000CoCk-0OAg;
	Wed, 04 Jun 2025 07:54:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiuu-0000000CnzA-2ct7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:52:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDE31758;
	Wed,  4 Jun 2025 00:51:49 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A64BF3F673;
	Wed,  4 Jun 2025 00:52:05 -0700 (PDT)
Date: Wed, 4 Jun 2025 08:52:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug] task hung in ret_from_fork in Linux v6.12
Message-ID: <aD_7IrjJUMRUCoP8@J2N7QTR9R3>
References: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005208_753021_03FE04FC 
X-CRM114-Status: GOOD (  29.86  )
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

On Wed, Jun 04, 2025 at 12:16:53PM +0800, Luka wrote:
> Dear Kernel Maintainers,
> 
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.12, corresponding to the following
> commit in the mainline repository:
> 
> Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

In the bug report linked below, the kernel identifies itself as:

  6.12.18-android16-1-maybe-dirty-4k #1

... which strongly suggests that (in addition to uncommitted changes),
the kernel is based on the v6.12.18 table kernel, i.e. commit:

  105a31925e2d (tag v6.12.18)

... in the upstream stable tree.

Please note that between v6.12 and v6.12.18 there are 3929 commits, any
of which could be significant to this issue.

As with the other report I replied on:

  https://lore.kernel.org/linux-arm-kernel/aD_zu4GNfOKxXXQk@J2N7QTR9R3/T/#t

... I do not think you are providing accurate details.

> This issue was discovered during the testing of the Android 16 AOSP
> kernel, which is based on Linux kernel version 6.12, specifically from
> the AOSP kernel branch:
> 
> AOSP kernel branch: android16-6.12
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
> 
> Although this kernel branch is used in Android 16 development, its
> base is aligned with the upstream Linux v6.12 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 16
> platform and identified that the root cause lies in the upstream
> codebase.

Based on the information provided so far, I don't think this is true.
You have not identified the root cause, and you have not demonstrated
that the issue exists in the upstream tag you mention above.

Why do you believe that the root cause lies in the upstream codebase?

It's not clear which kernel specifically you're running, but I'm fairly
confident that it's not built from a recent commit in the android16-6.12
branch.

If the "v6.12.18" prefix in the kernel tree is accurate, then your
kernel is no newer than commit:

  b3fb80bdc64b ("Merge 6.12.19 into android16-6.12")

... in the android16-6.12 branch, and there are 1000+ commits since
then.

[...]

> Bug Location: ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

This is misleading; ret_from_fork() has nothing to do with this hang.

Is this something you've guessed at yourself, or is this what syzkaller
reported to you?

In the linked bug, the kernel reports:

| INFO: task kworker/2:7:5593 blocked for more than 143 seconds.
|       Tainted: G            E      6.12.18-android16-1-maybe-dirty-4k #1
| "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
| task:kworker/2:7     state:D stack:0     pid:5593  tgid:5593  ppid:2      flags:0x00000008
| Call trace:
|  __switch_to+0x424/0x798 proc/self/cwd/common/arch/arm64/kernel/process.c:617
|  context_switch proc/self/cwd/common/kernel/sched/core.c:5911 [inline]
|  __schedule+0xa48/0x1018 proc/self/cwd/common/kernel/sched/core.c:7737
|  __schedule_loop proc/self/cwd/common/kernel/sched/core.c:7818 [inline]
|  schedule+0x54/0xdc proc/self/cwd/common/kernel/sched/core.c:7833
|  schedule_preempt_disabled+0x2c/0x4c proc/self/cwd/common/kernel/sched/core.c:7890
|  kthread+0x180/0x25c proc/self/cwd/common/kernel/kthread.c:382
|  ret_from_fork+0x10/0x20 proc/self/cwd/common/arch/arm64/kernel/entry.S:860

Note that ret_from_fork() is the assembly stub used to start any kernel
thread. Here it just means that a new kthread was started, and that has
blocked for some reaason in TASK_UNINTERRUPTIBLE state.

Whatever it's blocked on is due to code elsewhere.

Mark.

> 
> Bug Report: https://hastebin.com/share/xiyapaboxu.shell
> 
> Entire Log: https://hastebin.com/share/kibohuxobi.yaml
> 
> 
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
> 
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.
> 
> Best regards,
> Luka
> 

