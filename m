Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEA4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOGbjEMvho9DWS0i3tlr01jp4bYqQwHxD0wdftLlPDk=; b=4I6xFuDQbyNnaAdRvE5YAwBQjp
	T/fDovCK+5tu8n1o7YzRFCm9PWuS3hMy5LzI0FqUzDd4N62l9NtCkT4FwnlGmjbo5Z5jDaVuCiHr4
	hiaiVDcQm6ULyz9GFXQKvdp3dqrJB4/U1U5YrxXcfccPJ6IFwGqv8x6OLtumdeSDIaUyUb+WIDtG+
	fipfJ1vEePIMQDnYAq1D8HwJnsilPs5wRyJhEOJYu6CbLtyiKJDCj8ua1bLsa1HpraqC5yLJtXBN6
	sOKW82SxxWSROcVQF3LL4WRSQxbth4bwxdznPosBbuGewf2cLXdGOpVfTWlhR4ILw0wEjcUvPmz3H
	7icCGY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHW9w-00000001bBJ-27OI;
	Fri, 07 Nov 2025 23:46:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHW9t-00000001b9t-1SHw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 23:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCD5F40909;
	Fri,  7 Nov 2025 23:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29549C116C6;
	Fri,  7 Nov 2025 23:46:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YTujExV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762559174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOGbjEMvho9DWS0i3tlr01jp4bYqQwHxD0wdftLlPDk=;
	b=YTujExV99iq+x3/5TiVgxM3SNv/SNCs01cmQ8GL0Jpi/3NRgFfDths0Wd+AhJn/Zi+xdjz
	KJuL84DTYadQtc42UEd5WjaYhLFn9gbieg9iZN1PsrsuVKUou2TnnU4tSyt61zSLX6REJ4
	VbFmzErGcGRRuGr4NEC9WQjYO1r7QcQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a1e888cd (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Nov 2025 23:46:13 +0000 (UTC)
Date: Sat, 8 Nov 2025 00:46:05 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
Message-ID: <aQ6EvdukQytvqK-u@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_154621_428545_4ED4D0D1 
X-CRM114-Status: GOOD (  21.85  )
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

Hi Thomas,

I'm not a huge fan of this change:

On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
>  
>  /* Control how we warn userspace. */
>  static struct ratelimit_state urandom_warning =
> @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
>  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>  		return;
>  
> +	if (!static_branch_likely(&random_vdso_is_ready))
> +		return;
> +
>  	/* base_crng.generation's invalid value is ULONG_MAX, while
>  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
>  	 * former to arrive at the latter. Use smp_store_release so that this
> @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
>  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>  		return;
>  
> +	if (!static_branch_likely(&random_vdso_is_ready))
> +		return;
> +
>  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
>  }
>  
> @@ -925,6 +932,9 @@ void __init random_init(void)
>  	_mix_pool_bytes(&entropy, sizeof(entropy));
>  	add_latent_entropy();
>  
> +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> +		static_branch_enable(&random_vdso_is_ready);
> +
>  	/*
>  	 * If we were initialized by the cpu or bootloader before jump labels
>  	 * or workqueues are initialized, then we should enable the static
> @@ -934,8 +944,10 @@ void __init random_init(void)
>  		crng_set_ready(NULL);
>  
>  	/* Reseed if already seeded by earlier phases. */
> -	if (crng_ready())
> +	if (crng_ready()) {
>  		crng_reseed(NULL);
> +		random_vdso_set_ready();
> +	}

The fact that the vdso datapage is set up by the time random_init() is
called seems incredibly contingent on init details. Why not, instead,
make this a necessary part of the structure of vdso setup code, which
can actually know about what happens when? For example, one clean way of
doing that would be to make vdso_k_rng_data always valid by having it
initially point to __initdata memory, and then when it's time to
initialize the real datapage, memcpy() the __initdata memory to the new
specially allocated memory. Then we don't need the complex state
tracking that this commit and the prior one introduce.

Jason

