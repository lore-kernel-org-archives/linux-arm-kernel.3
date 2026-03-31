Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EE61061B2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBD4ZaMYeajQlUupA2u/dnr3gLfQ/TrWH8zjCSrR4hI=; b=zwQ7ljOSNnDdXvM1V6Ppa67NPX
	kjtnAKlhsD5Ud73iYX8DjtjOWelsGTyvLK3Yz0UMaYdAS/woBivu1wC0ru4aJ2M3jEVSf8rLAzKN9
	2Eo5t3U4+HKdCa86Q+a9ufPdx+C6rTx0u3Ke/DjHf0Zb6K03yo7hCqv4biKlNcJd+ExZM5qFjExMo
	Xki6UBO/gJ6jCyemkAJK5m7QQTHjM3ClCdxsUH67qg2D8+qCaTFHsRukO8pLxhHL28W6B3NNrNMx7
	LXXruj/Os1DYoOclvkwCfAgrqwGjIhhyyXZ/vQfeIj+ojzN++UkSKt8yhZLvcy5B1Yd38lgKQZOES
	wEIRTYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PK2-0000000CCs7-0pna;
	Tue, 31 Mar 2026 02:59:18 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PJx-0000000CCrh-2xZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 02:59:16 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260331025903epoutp04ccb265fe11ce6737d740932f53e846e7~hzb3alvAZ0547205472epoutp04L
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:59:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260331025903epoutp04ccb265fe11ce6737d740932f53e846e7~hzb3alvAZ0547205472epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774925943;
	bh=vBD4ZaMYeajQlUupA2u/dnr3gLfQ/TrWH8zjCSrR4hI=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=A13puTKgadmv+Wtz+54/aDwnIKy2aeqiKSRw5ex26nyHHpVEpbOvGUJNw4/yzXvM+
	 SGIvErAz6O8fE1pP9vWRbGR85SLAfbQ+DVq/cJeUYgSb2z9p6Tm8ECd6DDbybzp23O
	 E5sgbi0LL0fe+8xRXcDMJ3qqC7yZ8WkgXmpUpyFs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260331025902epcas5p180487143998867ba76e637e5d2b9cb7a~hzb2_vdbR1436614366epcas5p1s;
	Tue, 31 Mar 2026 02:59:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4flCWB6rkQz3hhT4; Tue, 31 Mar
	2026 02:59:02 +0000 (GMT)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
From: Maninder Singh <maninder1.s@samsung.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "keithpac@amazon.com"
	<keithpac@amazon.com>, "linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260331025902epcms5p5cae9dc30771d4fc7e0218c28324b8ee6@epcms5p5>
Date: Tue, 31 Mar 2026 08:29:02 +0530
X-CMS-MailID: 20260331025902epcms5p5cae9dc30771d4fc7e0218c28324b8ee6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6
References: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
	<20260305070527.719073-1-maninder1.s@samsung.com>
	<CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcms5p5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_195914_399361_D7A8F03D 
X-CRM114-Status: GOOD (  19.35  )
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
Reply-To: maninder1.s@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Thu, Mar 05, 2026 at 12:35:27PM +0530, Maninder Singh wrote:
>> With Support of THREAD_INFO_IN_TASK, stack of task can be
>> freed earlier than task (even if task's reference is taken),
>> and it needs separate reference with try_get_task_stack()
>> before using the stack.
>> Otherwise if someone calls show_stack() for task, it can oops
>> the kernel like below: (Tried with normal race of show_stack when
>> task still exists, but its stack is freed)
> 
> Looking at x86, it also has THREAD_INFO_IN_TASK, but I see nothing like
> this in show_stack(). How come x86 isn't similarly buggy?
> 

Thanks for your inputs.

I sent patch for x86 also to report same issue, but no replies :)

https://lkml.org/lkml/2026/3/11/317

So I guess we will never know if it is buggy or not.
and why ARM64 has done the checkings and there is no need for x86 and ARM.

 
>> 8<--- cut here ---
>> Unable to handle kernel paging request at virtual address f8aebec4 when read
>> [f8aebec4] *pgd=83c2c811, *pte=00000000, *ppte=00000000
>> Internal error: Oops: 7 [#1] SMP ARM
>> ..
>> CPU: 0 UID: 0 PID: 70 Comm: cat Not tainted 7.0.0-rc2-next-20260302+ #26 VOLUNTARY
>> ..
>> PC is at __read_once_word_nocheck+0x0/0x8
>> LR is at unwind_frame+0x6b0/0xa90
>> ...
>> Call trace:
>>  __read_once_word_nocheck from unwind_frame+0x6b0/0xa90
>>  unwind_frame from unwind_backtrace+0x178/0x1e0
>>  unwind_backtrace from show_stack+0x10/0x14
>> ...
>>
>> ARM64 also takes care of it in dump_backtrace(), so same logic
>> is added for ARM also.
>>
>> Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
>> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>


Thanks,
Maninder Singh

