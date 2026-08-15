Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC77C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebqxWaZEqKRkKJxOKbi5xPVzyiRrHaZdHEkKyvqD7Vs=; b=WuDI4WPxn3fRAWHULkQeZYky6y
	gKjYEgvmByxlUCOgSZBx4ysdx9Wfvlbzx7iFEo39umDF1jx9vtcl69GWO4XNF/uTSkQbcUVpVFKsg
	4ae3Lm4oVPxuLKlxEFoeGPDkX5QXw8CaQP8yedyCVE+4cWnNTyBCY/zlw5Z29Xe2hETSynfqlW9QX
	hTXdEToEtZ62/XogTce3F6/QLA9JFb30x7kxEx9BUyjgDOA9H26cK9negq1FEn10RzZC+7u6+7Iyf
	g6X6gJw/fLlJiBYndjCSN5a58BdDPlKvb7hcE2kFVqxH6w7OS2La0j75Ehtw6MPQVOkP4ivC88ibj
	2z9kwYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvFEV-00000003sNw-2E8L;
	Sat, 15 Aug 2026 14:19:35 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvFET-00000003sNX-3cpo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 14:19:35 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 247C9C366C;
	Sat, 15 Aug 2026 17:19:27 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 247C9C366C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786803569;
	bh=ebqxWaZEqKRkKJxOKbi5xPVzyiRrHaZdHEkKyvqD7Vs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LR3+UsHbae2GUWnAzjovQ8VKzWsUj7r5coZYjX8AVSCYj24/abW0RXrAAwgvKQDW4
	 o/aALiJaSLeMX3e3zzGbWYBzlDIDX5Gp+fz8OzVMYufTD6+B5uiZdWY32atBKVXcdq
	 mUKr9XYcqOAeFx+7hgbAAxxHym/hE+bd4Xu78tkPOYMFk6L2gF0YrOWmlCScrteq7T
	 UQwQyhPr01ppBI26uQLOLANvgScNa9M3DXldLSyuNS0x4C+8rOE/Z76d+z4OZvc8/1
	 Vxvh5h9VongRAniUjiw9L3KoJwpil/3nuFz+mdnTQKgfJ85LNhnYH8ytCkl6boK9u7
	 em6zDzaSwJw3w==
Message-ID: <ffa83b72ad30bebe1ebcab30b04703e9d7c935ce.camel@rendec.net>
Subject: Re: [PATCH] irqchip/stm32mp-exti: fix the unit of the hwspinlock
 timeout
From: Radu Rendec <radu@rendec.net>
To: Ju Nan <junan76@163.com>, tglx@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Sat, 15 Aug 2026 10:19:26 -0400
In-Reply-To: <0748a117106e6ae41ae5361ba053af3e96feed40.camel@rendec.net>
References: <20260805032139.35420-2-junan76@163.com>
	 <0748a117106e6ae41ae5361ba053af3e96feed40.camel@rendec.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_071934_090645_1DA38429 
X-CRM114-Status: GOOD (  22.60  )
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

On Sat, 2026-08-15 at 10:08 -0400, Radu Rendec wrote:
> On Wed, 2026-08-05 at 11:21 +0800, Ju Nan wrote:
> > HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
> > timeout argument is in milliseconds, not microseconds:
> >=20
> > =C2=A0 atomic_delay +=3D HWSPINLOCK_RETRY_DELAY_US;
> > =C2=A0 if (atomic_delay > to * 1000)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDOU=
T;
> >=20
> > So stm32mp_exti_set_type() asks for a 1 second timeout where the commen=
t
> > next to the macro says it wants 1 millisecond. The semaphore is polled
> > with udelay() from a section that holds chip_data->rlock, a
> > raw_spinlock_t, so preemption stays disabled for the whole wait on ever=
y
> > configuration, PREEMPT_RT included.
> >=20
> > The hwspinlock core documents this explicitly:
> >=20
> > =C2=A0 If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) =
the
> > =C2=A0 timeout is handled with busy-waiting delays, hence shall not exc=
eed
> > =C2=A0 few msecs.
> >=20
> > Pass the value the comment always described. The core retries every
> > HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled te=
n
> > times before giving up, which is far longer than any plausible hold tim=
e
> > on the coprocessor side. A timeout is reported with pr_err() and fails
> > the trigger type configuration, so shortening it degrades gracefully.
> >=20
> > Signed-off-by: Ju Nan <junan76@163.com>
> > ---
> > =C2=A0drivers/irqchip/irq-stm32mp-exti.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-s=
tm32mp-exti.c
> > index a24f4f1a4..f5f0109bf 100644
> > --- a/drivers/irqchip/irq-stm32mp-exti.c
> > +++ b/drivers/irqchip/irq-stm32mp-exti.c
> > @@ -23,7 +23,7 @@
> > =C2=A0
> > =C2=A0#define IRQS_PER_BANK			32
> > =C2=A0
> > -#define HWSPNLCK_TIMEOUT		1000 /* usec */
> > +#define HWSPNLCK_TIMEOUT		1 /* msec */
> > =C2=A0
> > =C2=A0#define EXTI_EnCIDCFGR(n)		(0x180 + (n) * 4)
> > =C2=A0#define EXTI_HWCFGR1			0x3f0
>=20
> Reviewed-by: Radu Rendec <radu@rendec.net>

Oops! Hit the "send" button too soon. The patch is OK, so the r-b tag
stays. But it also needs this:

Fixes: 5257169ade8c ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_at=
omic() API")


