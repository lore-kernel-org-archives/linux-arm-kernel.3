Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543F110AB83C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNTiOwptuWCFL75qrnEQ7468cCcswAjztz8iN5Iz26g=; b=JBpc76kd9011io
	lKMPW2dreFfIDc5yllEPYd77d6mEGmNDRQ6x6z83m0Zwa07Lwz2FBiG3KcvV841uBYMFUPVTO1VEa
	VBCvCcqtdanlDJ9TmJOAjGT+BqulpgD2yqA4JLAq4S0CkCPAbEfU597jVh1J0dWmdczmqDa3x1LwZ
	GkweK+5yPyPbueEYqrPuhn3PiTdfc5K6FMhK+vhotJjKenIpCT219Nx7AFjUI0V6WIwR6abR3y9G2
	dTkFvFnfbuGFzdjORDHa14y7aNEkcaPWZj5xmL7rLLu/Nkft3V17kLn5mULxUq8EfpNOD1B2qzE3A
	eWf6IhUQ0IJrUhhQiPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vz5-00000006U8Y-1WUt;
	Fri, 27 Mar 2026 01:27:35 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5vz1-00000006U7y-3Mun
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 01:27:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kNTiOwptuWCFL75qrnEQ7468cCcswAjztz8iN5Iz26g=;
	b=SV4LXG+l7Gm2hE7ibi5DUm21Osr/F4BoY61mfe9nIsNF9cRvZUfYRfWvJOyPHRCXQhBR+hNCU
	TY8u2En1cl58v6N+EF8yQ4ILKyrqsmYixdENQmOP2eoMNRtETnJoSPIbU6ZbsjzK+Y6isFySyja
	U+sgEJ+KUg3JW05IEMJradw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fhjXC5GGBzKmTj;
	Fri, 27 Mar 2026 09:21:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E2AA40563;
	Fri, 27 Mar 2026 09:27:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 09:27:22 +0800
Message-ID: <d4db0c35-78ef-5372-7c18-4b258ce112aa@huawei.com>
Date: Fri, 27 Mar 2026 09:27:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@kernel.org>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com> <87fr5six4d.ffs@tglx>
 <acPAzdtjK5w-rNqC@J2N7QTR9R3> <87ecl7gbeu.ffs@tglx>
 <acV2552t5X4OlNYi@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <acV2552t5X4OlNYi@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_182732_368660_008B15A8 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/3/27 2:11, Mark Rutland wrote:
> On Wed, Mar 25, 2026 at 04:46:01PM +0100, Thomas Gleixner wrote:
>> On Wed, Mar 25 2026 at 11:03, Mark Rutland wrote:
>>> On Sun, Mar 22, 2026 at 12:25:06AM +0100, Thomas Gleixner wrote:
>>> I *think* what would work for us is we could split some of the exit
>>> handling (including involuntary preemption) into a "prepare" step, as we
>>> have for return to userspace. That way, arm64 could handle exiting
>>> something like:
>>>
>>> 	local_irq_disable();
>>> 	irqentry_exit_prepare(); // new, all generic logic
>>> 	local_daif_mask();
>>> 	arm64_exit_to_kernel_mode() {
>>> 		...
>>> 		irqentry_exit(); // ideally irqentry_exit_to_kernel_mode().
>>> 		...
>>> 	}
>>>
>>> ... and other architectures can use a combined exit_to_kernel_mode() (or
>>> whatever we call that), which does both, e.g.
>>>
>>> 	// either noinstr, __always_inline, or a macro
>>> 	void irqentry_prepare_and_exit(void)
>>
>> That's a bad idea as that would require to do a full kernel rename of
>> all existing irqentry_exit() users.
>>
>>> 	{
>>> 		irqentry_exit_prepare();
>>> 		irqentry_exit();
>>> 	}
>>
>> Aside of the naming that should work.
> 
> Thanks for confirming!
> 
> I've pushed a (very early, WIP) draft to
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/entry/rework

The patch also looks good to me. Looking forward to seeing this move
forward.

> 
> ... which is missing commit messages, comments, etc, but seems to work.
> 
> I'll see about getting that tested, cleaned up, and on-list.
> 
> Mark.
> 

