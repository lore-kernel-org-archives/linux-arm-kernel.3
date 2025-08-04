Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F43C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 03:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCSJQUPk49ff/9BMF1sJEd7Q29NI+un6RLbOjGpw9p0=; b=VIiEYiXCvpJ5MWFTfZOydACSuN
	PlyG+qEF/7SpDj/L7P62M9rnPF8ndVMilqDL9vn7OOduk3aALbbSQWKKS6K6xiImzoCqlEhxkZ74Q
	XwlOOXqz7oVSWERX0HICQe5Jw7H+nhqoTHGZkc6KsW6JyeR+9d2DTVzwrnHZILT8TlZKsYFYhh1xd
	zvTSYbkXWH5F4E3l6dJNaXlIL7mJ1XNf+JDNy7o2rUYr2JHj+onJka51ZDW8HkeGKFKuvkFaPwN7Z
	fakiw4UcOSuwa9iWOHuYvp5UjvDXsGpHexbZnB1QhmJS8Q4S6cXl26cyBz4ROryYxNZ/N/Sb7GwW2
	/QLM+fPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilts-00000009YnK-3Mzi;
	Mon, 04 Aug 2025 03:30:12 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilrJ-00000009YcM-072j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 03:27:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bwMPJ40Tfz23jf6;
	Mon,  4 Aug 2025 11:24:52 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D25E1A0188;
	Mon,  4 Aug 2025 11:27:20 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 4 Aug 2025 11:27:19 +0800
Subject: Re: Question on the scheduling of timer interrupt and FIO interrupt
To: Marc Zyngier <maz@kernel.org>
CC: wangwudi <wangwudi@hisilicon.com>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangwei24@huawei.com>, <yaohongshi@hisilicon.com>, Zenghui Yu
	<zenghui.yu@linux.dev>
References: <8c6eb963-0a3a-8b75-8ab4-a0b2e10f3d40@hisilicon.com>
 <86y0s36yjh.wl-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <917dfd6e-b8be-03b0-bfda-ce1108693bc2@huawei.com>
Date: Mon, 4 Aug 2025 11:27:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <86y0s36yjh.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_202733_265466_7AF2FBBC 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Marc,

On 2025/8/1 20:01, Marc Zyngier wrote:
> + Zenghui, in case he has seen this before.

I haven't heard of it before.

> On Fri, 01 Aug 2025 07:26:20 +0100,
> wangwudi <wangwudi@hisilicon.com> wrote:
> >
> > Hi, all
> > When running some FIO tests on ARM64 server(Kunpeng), frequent NVMe interrupts occupy the
> > CPU, and the CPU's hardirq load is 100%. The watchdog feed interrupt arch_timer cannot be
> > responded, triggering the hardlockup.
> 
> I am extremely surprised that even with a screaming NVMe (or even
> several of them), you end up in a situation where you don't have the
> resource to take the timer interrupt.

+1. I will probably have an offline discussion with Wudi today, or a bit
later, to dig out more clues about it.

> > GIC driver uses GICV3_PRIO_IRQ to set the same priority for arch_timer interrupt and NVMe
> > interrupt. In GIC spec, "If, on a particular CPU interface, multiple pending interrupts
> > have the same priority, and have sufficient priority for the interface to signal them to
> > the PE, it is IMPLEMENTATION DEFINED how the interface selects which interrupt to signal."
> > Shell we consider setting a higher priority for the arch_timer interrupt to fix this case?
> 
> Linux only deals with two priorities: the normal interrupt priority,
> and NMI, where the NMI can preempt any other interrupt. obviously, we
> don't want to make the timer an NMI, as it would break a lot of
> things.
> 
> Which means that even if you were to give the timer a higher priority,
> it should not be allowed to preempt any other interrupt. Which means
> that you'd need to set the binary point so that both the NVMe and
> timer priorities fall into the same preemption bucket.
> 
> But it also means that you now are eating into the few bits of
> priority that we have, and that will cause problems with the NMI
> priority. Also, how to you decide what interrupts should be of a
> higher priority?
> 
> I find it surprising that your GIC doesn't have some form of
> round-robin scheme to pick the next HPPI, because that's clearly a
> fairness problem, and punting that on SW is pretty ugly.
> 
> Thanks,
> 
> 	M.
> 

