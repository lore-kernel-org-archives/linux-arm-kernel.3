Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C569C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQiLw6osaoomL6XHJIB9L74mE4TG/l+SOI/9v+iCbZ8=; b=oLWMd12KaABNXz8OlkzOR7yLQA
	AtIv25w+cwna79kFm8gocwUllYQ/rg8IxyAXrAD0lSbtS00rzystDlacj7OHod5aQULnpNquLlRyS
	2aEA75LGBoiWbcP7xtBCHySggGdfAZ9Qad3EBmR/BJPanWDTIeYcHTwi7ZWiT5w1PRaoTPqdzZ801
	L0rcZD+TCB5pKf8woOWg10a16XmR6yBiSnPpEGvSSA+dcW2z1LNPcXAnCi5sKezjvDInrWd91W4rW
	bXY4L4bEPPElf0KJlyxHZSyYnUIhRe95kfrMXglfTStlADdNWC/s55vjJEhrdyKwLZaYLbGYgxrEL
	zIhzTrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlkP-00000002X4r-2vTq;
	Mon, 07 Jul 2025 13:19:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYli5-00000002Wfi-15dS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:16:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751894198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQiLw6osaoomL6XHJIB9L74mE4TG/l+SOI/9v+iCbZ8=;
	b=PrO4gOCBQEoJQOvNC3cnV+csw9i+Ur2uK9M4JKRkiAKSRka78oeRLBGLJEQLWPLTzcvLde
	B72lqCPZwVKzt0Rk2TAIP4CHqOhJ6bk7388uEd4BYoCY8kzhH/iIRyJy0lOz/dN0bghjyb
	ctyYspN4Gd+leLUCjfZ0KeMrMrXMdnkybe85qKE/YOBvBZk865ojJ4tXENm5HWYvY5sm8E
	LEqyiC0+NrsVIqCnWex3WsRZ0rg0cd1f2CG9Iwn/NH68TLKd/+4SU+DeZqfY/SgMK4S+sA
	bJGNZV+wj/InA+qcf5gUbIPFevvVOWSz0uH3TbO2OKrdGc5TFSxOCvGyhMRSug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751894198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQiLw6osaoomL6XHJIB9L74mE4TG/l+SOI/9v+iCbZ8=;
	b=yIMzXGKAosqPgDmoRSm/jdewQDjBi7L2WNRXVi1+obyTr33OQ2/6chzHQkAFEiKXfITk2N
	ANyVRY9NUhvkxyAA==
To: Arnd Bergmann <arnd@arndb.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Linux-Arch
 <linux-arch@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Christopher Hall <christopher.s.hall@intel.com>, Miroslav Lichvar
 <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, David
 Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, Nam
 Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 11/14] vdso/vsyscall: Update auxiliary clock data in the
 datapage
In-Reply-To: <2078551b-c0b0-4201-b8d7-1faafa3647e6@app.fastmail.com>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
 <877c0ksd1p.ffs@tglx>
 <2078551b-c0b0-4201-b8d7-1faafa3647e6@app.fastmail.com>
Date: Mon, 07 Jul 2025 15:16:36 +0200
Message-ID: <874ivorvij.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_061641_437706_3BED393F 
X-CRM114-Status: GOOD (  15.05  )
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

On Mon, Jul 07 2025 at 13:34, Arnd Bergmann wrote:
> On Mon, Jul 7, 2025, at 08:57, Thomas Gleixner wrote:
>> On Tue, Jul 01 2025 at 10:58, Thomas Wei=C3=9Fschuh wrote:
>>>=20=20
>>> +#if defined(CONFIG_GENERIC_TIME_VSYSCALL) && defined(CONFIG_GENERIC_GE=
TTIMEOFDAY) && \
>>> +	defined(CONFIG_POSIX_AUX_CLOCKS)
>>
>> CONFIG_GENERIC_GETTIMEOFDAY requires CONFIG_GENERIC_TIME_VSYSCALL, but
>> that's not expressed anywhere. This stuff has grown too many config
>> options over time:
>>
>> GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO, GENERIC_VDSO_DATA_STORE
>>
>> All architectures except SPARC64 use the generic code and the generic
>> VDSO data store implementation. That config maze wants to be
>> consolidated.
>
> Would it help to replace the custom sparc64 vdso with the
> thing that parisc does and call the fallback directly?

Definitely.

> I doubt anyone still cares about the clock_gettime() performance
> on sparc64, and removing it would remove all those special cases:
>
>  arch/sparc/Kconfig                  |   1 -
>  arch/sparc/include/asm/vvar.h       |  75 --------
>  arch/sparc/kernel/Makefile          |   1 -
>  arch/sparc/kernel/vdso.c            |  69 --------
>  arch/sparc/vdso/Makefile            |   2 +-
>  arch/sparc/vdso/vclock_gettime.c    | 340 +++---------------------------=
------
>  arch/sparc/vdso/vdso.lds.S          |   2 -
>  arch/sparc/vdso/vdso32/vdso32.lds.S |   3 +-
>  arch/sparc/vdso/vma.c               | 265 +---------------------------
>  9 files changed, 28 insertions(+), 730 deletions(-)

That's definitely an argument :)

> (the added lines here also fix the missing clock_gettime64,
> which was equally blocked on the sparc64 oddities)

I'm all for it.

Can you post a patch to that effect?

Thanks,

        tglx

