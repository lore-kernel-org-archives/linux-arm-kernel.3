Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDF1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxqnySUc8Q87H9Bf1NcMH+aFYiamz3WK9FMyyvPdOHQ=; b=n3VNRybK5vVW5k15m5bm2eYs/g
	ckdhX9ZaH75nknd9bGxeQNgonmCS3E0u3F5KsguDZcGAQkWUhRtlFoVjU1891ZVB7OEyKix3ePQ86
	5w58lRXkEW3XvWdJQC075SpnWU82hOxi2MV3m+FSyBNmmSL8hw+t5ljfXxH38xbem76aDiCVC2ycL
	iAIzGckRfvhe0xnUL40re2/TjzuP6GRYoDme9Rv+tEgjqhSFzal0X+CXJzJpxokUtK0/nCloQ3Xxy
	cGkmHQAjRvdFRltFnOEnDfRkiZycGpkrgO/raK3PmK9rqSl0ssZnWyTvJ/n9PuCx7QXM6DIABuR39
	zC/smDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3l-0000000E1kI-0Awa;
	Wed, 15 Jul 2026 07:29:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3g-0000000E1iC-0qGD;
	Wed, 15 Jul 2026 07:29:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86669600BB;
	Wed, 15 Jul 2026 07:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC081F000E9;
	Wed, 15 Jul 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100571;
	bh=oxqnySUc8Q87H9Bf1NcMH+aFYiamz3WK9FMyyvPdOHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RJ0obCk28CVa5NZXZuu1pUdenmJYIQlEs6MMF67avt9Mea6LpcXDIVL7emcqswy6r
	 UgkNH7iltfdTsoSvDqFc79LhJfEhvqLhukc8Y/Q7laC5Z3yORMErsR1kYSgdpXfpDv
	 H294L8Bf0ZCUGCplE4gq8sNMKQkSdNub3bGtTv3li48WsKckEvHNQXqbU3oeh1YSIp
	 LcPVP513nmLfDBhvxLMKjr6P7w/49KZEyBsdIErNONwnpRw9kAf9IjWCSHp51bmaed
	 mJ2iLNKEjZ3M2DA8TSMw2ugIPQced7dtn11Lt7Kygqdu+qA7a2QO/oKJt7ahGJJVzL
	 mLJU3KRFXEyxA==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann
 <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 09:29:26 +0200
Message-ID: <87zezsogmh.ffs@fw13>
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

On Thu, Jul 09 2026 at 13:32, Thomas Wei=C3=9Fschuh wrote:
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index 15df9dcb42a5..2bc00c67dc54 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -62,6 +62,7 @@ mandatory-y +=3D topology.h
>  mandatory-y +=3D trace_clock.h
>  mandatory-y +=3D uaccess.h
>  mandatory-y +=3D unwind_user.h
> +mandatory-y +=3D vdso/clocksource.h
>  mandatory-y +=3D vermagic.h
>  mandatory-y +=3D vga.h
>  mandatory-y +=3D video.h
> diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic=
/vdso/clocksource.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
> index c682e7c60273..63ee8c4ea15c 100644
> --- a/include/vdso/clocksource.h
> +++ b/include/vdso/clocksource.h
> @@ -4,9 +4,12 @@
>=20=20
>  #include <vdso/limits.h>
>=20=20
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>  #include <asm/vdso/clocksource.h>
> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
> +
> +#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKM=
ODES)
> +/* Unlinkable dummy stubs */
> +extern int VDSO_ARCH_CLOCKMODES;
> +#endif

I'm utterly confused by this. What's this unlinkable stub for?

The only usage of VDSO_ARCH_CLOCKMODES is in enum vdso_clock_modes where
it is guarded with CONFIG_GENERIC_GETTIMEOFDAY.

And your change log says:

> Provide unlinkable dummy definitions. These can be used with
> IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).

which is even more confusing because that's related to the actual
architecture specific defines and not to VDSO_ARCH_CLOCKMODES.

None of this makes sense to me.

Thanks,

        tglx

