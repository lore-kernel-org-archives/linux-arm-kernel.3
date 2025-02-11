Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC6C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PX0S4n/GUFq/po2Vsm3oMYFGCFnrTqQbPojhcQqFgZo=; b=nxvMw6xD6LtG4Ayj/qt9DcedjG
	VtfZhjjXnNkA9RHfNFRO5Lsi3tE+uQ/qsyuIdWiVdellRvA6hpglEIqNigNmgXBcIYdK0Z/wyMaVY
	ziyQ1d/koo4GEWOoThwfDFIWSScav3DzBRIvt+Yqya5eGvincqJG4ytWV/ZqutseqkAd7ybSGApNG
	Rzbl3bYXI0D+naBhr948qLdZc2gLrCz1DU/Hw0rmydpXtZao4U/C9IHs2z8XvsNoniRqppVYwB5gs
	MGaF69tkJQBeoY+LZ4bUw0QnkoAPqCnV29WGxPPWyaL/9qccEHtHEquNuQ5tpIuLJzq1iZv6f7JI3
	Dvh3WTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpb3-00000003oXy-0i52;
	Tue, 11 Feb 2025 12:42:37 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thogH-00000003bs3-0uFd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:43:59 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ysfjx48WNz20qDJ;
	Tue, 11 Feb 2025 19:44:21 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 52E87140153;
	Tue, 11 Feb 2025 19:43:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Feb 2025 19:43:50 +0800
Message-ID: <a715dd5d-f353-371c-f542-7430668f2e12@huawei.com>
Date: Tue, 11 Feb 2025 19:43:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<masahiroy@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>, <ardb@kernel.org>,
	<sudeep.holla@arm.com>, <guohanjun@huawei.com>, <rafael@kernel.org>,
	<liuwei09@cestc.cn>, <dwmw@amazon.co.uk>, <Jonathan.Cameron@huawei.com>,
	<liaochang1@huawei.com>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<broonie@kernel.org>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<joey.gouly@arm.com>, <liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
 <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_034357_560573_D85156E9 
X-CRM114-Status: GOOD (  13.69  )
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



On 2025/2/10 20:30, Mark Rutland wrote:
> On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
>> On 2024/12/6 18:17, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>>> to use the generic entry infrastructure from kernel/entry/*. The generic
>>> entry makes maintainers' work easier and codes more elegant, which aslo
>>> removed a lot of duplicate code.
>>>
>>> The main steps are as follows:
>>> - Make arm64 easier to use irqentry_enter/exit().
>>> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
>>> - Split generic entry into generic irq entry and generic syscall to
>>>   make the single patch more concentrated in switching to one thing.
>>> - Switch to generic irq entry.
>>> - Make arm64 closer to the generic syscall code.
>>> - Switch to generic entry completely.
>>>
>>> Changes in v5:
>>> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
>>> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
>>> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
>>> - Update "irqentry_state_t ret/irq_state" to "state"
>>>   to keep it consistently.
>>> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>>>   the generic entry.
>>> - Also refactor the ARM64 syscall code.
>>> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>>>   arch_pre/post_report_syscall_entry/exit() to simplify code.
>>> - Make the syscall patches clear separation.
>>> - Update the commit message.
>>
>> Gentle Ping.
> 
> I've left soem comments.
> 
> As I mentioned previously, I'd very much prefer that we do the syscall
> entry logic changes *later* (i.e. as a follow-up patch series), after
> we've got the irq/exception entry logic sorted.
> 
> I reckon we've got just enough time to get the irq/exception entry
> changes ready this cycle, with another round or two of review. So can we
> please put the syscall bits aside for now? ... that and run all the
> tests you mention in patch 22 on the irq/exception entry changes alone.

Sure, it is ok to put the syscall bits aside and split it out .

> 
> Mark.
> 
> 

