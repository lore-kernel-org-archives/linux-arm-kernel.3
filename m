Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB6C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OPYTPXQqsC4hS7zw8e+Dc/1g7hm/IJ2+WXTEbvt4/Y=; b=jKGXHEAoawZvRfLWF2ycSuKrfQ
	nrMZrmwZBVufxkDvkuhuCROk5JtbfgDJ9kYf7peXRH975XZcbvrBbF7GOpSiMdgymf4wHhAKsG9+U
	vlUjoo+jZzKFkLxIgJ9zPOgtQJ+pRdVvmYm7sPA6ErP1Iad57qCupolCF7VZLPbBGqmLa/vWza9/c
	lmMobZRH67GweKTcvzzT6N4L8kpKPaoukucc+KH1baQvhBdI7aF+OIbqmlKai9Z9DwbGM4ynPUltr
	eN1EuQCwklM0vIN4I7k7H4m6q9Fj55mGOt7oe00b5p2Pa9/zaIP6MOAiLHcB2lNIVN8b+kCTV5El2
	5s+2orcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmQ9-0000000AUQu-2sMA;
	Wed, 19 Aug 2026 19:57:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwmQ8-0000000AUQY-2hxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 19:57:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F739405BE;
	Wed, 19 Aug 2026 19:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2035D1F000E9;
	Wed, 19 Aug 2026 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787169475;
	bh=+OPYTPXQqsC4hS7zw8e+Dc/1g7hm/IJ2+WXTEbvt4/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B/PnaBQNnMu2ijZDpPYgNJkwqocajh+rvx78qxP0wq6l4J7CZMG0miRt3umbqzQeW
	 HLe7agf8zXYNCglv2A9RsCbHjbHVqQF66U62EHNjN2UnsY2RqxQ74pYz3P5RKhIf2m
	 H3UPj8prnE4OSgCSjGopobch9ZSuAkgxMbZCW9NA/URtkPxdz5LjsWIBjaBhH9fXis
	 gVGALsCGjLBTrH+qu3mzgMxUZ9015E+O4nGaG4MNtb/AOE+EdhlEH35juKOJyzNZDD
	 yPEImQafHIUaTyR371kLcufNl05Ju9Qft9VKPGb+ocUKn2JP/hVra/A8QNi33p3Zeu
	 V00h4/BJwByKQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>, Ju Nan <junan76@163.com>,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/stm32mp-exti: fix the unit of the hwspinlock
 timeout
In-Reply-To: <ffa83b72ad30bebe1ebcab30b04703e9d7c935ce.camel@rendec.net>
References: <20260805032139.35420-2-junan76@163.com>
 <0748a117106e6ae41ae5361ba053af3e96feed40.camel@rendec.net>
 <ffa83b72ad30bebe1ebcab30b04703e9d7c935ce.camel@rendec.net>
Date: Wed, 19 Aug 2026 21:57:52 +0200
Message-ID: <87cxvdkhmn.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 15 2026 at 10:19, Radu Rendec wrote:
> On Sat, 2026-08-15 at 10:08 -0400, Radu Rendec wrote:
>> On Wed, 2026-08-05 at 11:21 +0800, Ju Nan wrote:
>> > HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
>> > timeout argument is in milliseconds, not microseconds:
>> >=20
>> > =C2=A0 atomic_delay +=3D HWSPINLOCK_RETRY_DELAY_US;
>> > =C2=A0 if (atomic_delay > to * 1000)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDO=
UT;
>> >=20
>> > So stm32mp_exti_set_type() asks for a 1 second timeout where the comme=
nt
>> > next to the macro says it wants 1 millisecond. The semaphore is polled
>> > with udelay() from a section that holds chip_data->rlock, a
>> > raw_spinlock_t, so preemption stays disabled for the whole wait on eve=
ry
>> > configuration, PREEMPT_RT included.
>> >=20
>> > The hwspinlock core documents this explicitly:
>> >=20
>> > =C2=A0 If the mode is HWLOCK_IN_ATOMIC (called from an atomic context)=
 the
>> > =C2=A0 timeout is handled with busy-waiting delays, hence shall not ex=
ceed
>> > =C2=A0 few msecs.
>> >=20
>> > Pass the value the comment always described. The core retries every
>> > HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled t=
en
>> > times before giving up, which is far longer than any plausible hold ti=
me
>> > on the coprocessor side. A timeout is reported with pr_err() and fails
>> > the trigger type configuration, so shortening it degrades gracefully.
>> >=20
>> > Signed-off-by: Ju Nan <junan76@163.com>
>> > ---
>> > =C2=A0drivers/irqchip/irq-stm32mp-exti.c | 2 +-
>> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>> >=20
>> > diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-=
stm32mp-exti.c
>> > index a24f4f1a4..f5f0109bf 100644
>> > --- a/drivers/irqchip/irq-stm32mp-exti.c
>> > +++ b/drivers/irqchip/irq-stm32mp-exti.c
>> > @@ -23,7 +23,7 @@
>> > =C2=A0
>> > =C2=A0#define IRQS_PER_BANK			32
>> > =C2=A0
>> > -#define HWSPNLCK_TIMEOUT		1000 /* usec */
>> > +#define HWSPNLCK_TIMEOUT		1 /* msec */
>> > =C2=A0
>> > =C2=A0#define EXTI_EnCIDCFGR(n)		(0x180 + (n) * 4)
>> > =C2=A0#define EXTI_HWCFGR1			0x3f0
>>=20
>> Reviewed-by: Radu Rendec <radu@rendec.net>
>
> Oops! Hit the "send" button too soon. The patch is OK, so the r-b tag
> stays. But it also needs this:
>
> Fixes: 5257169ade8c ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_=
atomic() API")

That's correct, but the real problem with that culprit commit is that it
just used the existing HWSPNLCK_TIMEOUT define without looking what the
units are, which in turn is a stupidity of the original code which
picked the most generic naming convention for that define. That should
have been:

#define HWSPNLCK_TIMEOUT_US		1000

which would have made it entirely clear what the unit is without the
stupid tail comment.

Now this "fix" just proliferates the same stupidity instead of changing
the define to:

#define HWSPNLCK_TIMEOUT_MS		1

No?

Ju, please send a V3 to that effect.

Thanks,

        tglx

