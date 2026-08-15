Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE5C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbHMIsoCRlNfajLWOuMVJl4LohBIc8gg9TOwM7bibzs=; b=E7L+ubavwK3JaDOns02r0whmE0
	18gaaMjAe+CAJNDhIuIbSxgMNOv1fazfttjJ1IhqsS7YDwPow50/izlpzLYpGVgKQkZecj/JL/ZJV
	K7WIqep0oC0pATkBbvzHB6P67h6IMKzxSSnIVwDtLq0nZP1eb3Mr6tmGam/QSToPCbVaX6k1q1BB/
	nGFacx3ZqxLum9jb9QLYK58FBgaHqJWLENr3Oy6J9LalqZf4XwIesn2cnC7u1d1cLFWqXuyLmimJe
	r7Lc98YYcazX3dSuH5SeC5EDyqb7BkHyG8rpTfy8mYD605xwQ0pXf7jmvuKSag5U6GNKFBd8O4wxN
	I5UZUraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvF3r-00000003rzV-2Khx;
	Sat, 15 Aug 2026 14:08:35 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvF3o-00000003rz5-195O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 14:08:33 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 83C52C366C;
	Sat, 15 Aug 2026 17:08:22 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 83C52C366C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786802903;
	bh=QbHMIsoCRlNfajLWOuMVJl4LohBIc8gg9TOwM7bibzs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RiSXPrcFeAWgwP1fYOAjdWvKw0HkZBirsJqLerREW/twRGajpLwUevBXg7pUgkXmf
	 6bKIKbLyOD9BDoH3KZ/bwCbBfqc3jtMX3bM1lJtSPKAIl9VAPchyVTPUY6JNaL4s7k
	 lwa4x+CC+Ng5C9Mm523JTcW8WDndznvvkihpkzJej+1Hq7DioCV6Gkf8nLtmRh9dM+
	 nKnUiC1g/lbtU2DI/MiFIGTBtgsZ7R+6yPvSVYy0MlRjVDK7SDbvj3TpQCsMV15c6q
	 VnIKZ+WjNT0J0H9nqVeUGaUFzmgWWdUQPGgszcgkuW0kEYGSMCRORba1fYbUvnLAyO
	 3sSLHkMXK4qAA==
Message-ID: <0748a117106e6ae41ae5361ba053af3e96feed40.camel@rendec.net>
Subject: Re: [PATCH] irqchip/stm32mp-exti: fix the unit of the hwspinlock
 timeout
From: Radu Rendec <radu@rendec.net>
To: Ju Nan <junan76@163.com>, tglx@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Sat, 15 Aug 2026 10:08:20 -0400
In-Reply-To: <20260805032139.35420-2-junan76@163.com>
References: <20260805032139.35420-2-junan76@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_070832_635872_964FA472 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, 2026-08-05 at 11:21 +0800, Ju Nan wrote:
> HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
> timeout argument is in milliseconds, not microseconds:
>=20
> =C2=A0 atomic_delay +=3D HWSPINLOCK_RETRY_DELAY_US;
> =C2=A0 if (atomic_delay > to * 1000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;
>=20
> So stm32mp_exti_set_type() asks for a 1 second timeout where the comment
> next to the macro says it wants 1 millisecond. The semaphore is polled
> with udelay() from a section that holds chip_data->rlock, a
> raw_spinlock_t, so preemption stays disabled for the whole wait on every
> configuration, PREEMPT_RT included.
>=20
> The hwspinlock core documents this explicitly:
>=20
> =C2=A0 If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) th=
e
> =C2=A0 timeout is handled with busy-waiting delays, hence shall not excee=
d
> =C2=A0 few msecs.
>=20
> Pass the value the comment always described. The core retries every
> HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled ten
> times before giving up, which is far longer than any plausible hold time
> on the coprocessor side. A timeout is reported with pr_err() and fails
> the trigger type configuration, so shortening it degrades gracefully.
>=20
> Signed-off-by: Ju Nan <junan76@163.com>
> ---
> =C2=A0drivers/irqchip/irq-stm32mp-exti.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm=
32mp-exti.c
> index a24f4f1a4..f5f0109bf 100644
> --- a/drivers/irqchip/irq-stm32mp-exti.c
> +++ b/drivers/irqchip/irq-stm32mp-exti.c
> @@ -23,7 +23,7 @@
> =C2=A0
> =C2=A0#define IRQS_PER_BANK			32
> =C2=A0
> -#define HWSPNLCK_TIMEOUT		1000 /* usec */
> +#define HWSPNLCK_TIMEOUT		1 /* msec */
> =C2=A0
> =C2=A0#define EXTI_EnCIDCFGR(n)		(0x180 + (n) * 4)
> =C2=A0#define EXTI_HWCFGR1			0x3f0

Reviewed-by: Radu Rendec <radu@rendec.net>

