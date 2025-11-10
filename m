Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818DACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WrguxH4pokigxxkQ8JIMem650725yeeLwdoGz6ziPQ=; b=WntIrIhCfdnAK0aTHg4MNFstA9
	QU1lve2PYYDb2O1GDYuT+MnpMD5S0PtBMEyM54Q9UD77yocqu3W+9RS1ixJAUs1Q/Bqrusxu3AsMa
	N41sHIQ+2yrFhbqpQoRescfxNPDOhLE9OYlLjRtpDrzWcKwHa65FeotfVXl7apS1xiQ/fZEfxU8JZ
	UbsVg0+I15+fEKF8IlJ69FhzFRt/Y5Xlp9/Rnn317M3GiCxW/pM3q6cBNBlELHtlnQs8CiSS6OgSG
	RJ9uyA0b/xWINIUR2LKRS8KRMPHCgg5gdcEY9+ew2JVxDRS13XzxbdDdLN8k6b7G5hLYpWiqdFAFe
	i5mTQ5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPH1-00000005Boh-02ho;
	Mon, 10 Nov 2025 10:37:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPGx-00000005Bno-09AX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10DD5601A5;
	Mon, 10 Nov 2025 10:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E76C4CEF5;
	Mon, 10 Nov 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WTAHFhLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762771032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WrguxH4pokigxxkQ8JIMem650725yeeLwdoGz6ziPQ=;
	b=WTAHFhLQBM9L4uVZANImYYYEpEwrJCJmpUsPeVS7opyWT3kewXLiJpB+S7cWvpyOqmRlk0
	jOvTCsms0UYDa7uYKl2FQdhRurOUoi+bCEX1pnKZador3BykkqFb6xAp1lo4cuCgYvgUtd
	mk8NOd2uY8oXx8TZ6HnEj3LlqXVn94g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 190dbf96 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Nov 2025 10:37:11 +0000 (UTC)
Date: Mon, 10 Nov 2025 11:37:07 +0100
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
Message-ID: <aRHAU7bVAIyaOrpA@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
 <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
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

On Mon, Nov 10, 2025 at 10:04:17AM +0100, Thomas Weißschuh wrote:
> On Sat, Nov 08, 2025 at 12:46:05AM +0100, Jason A. Donenfeld wrote:
> > I'm not a huge fan of this change:
> > 
> > On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> > > +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
> > >  
> > >  /* Control how we warn userspace. */
> > >  static struct ratelimit_state urandom_warning =
> > > @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
> > >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > >  		return;
> > >  
> > > +	if (!static_branch_likely(&random_vdso_is_ready))
> > > +		return;
> > > +
> > >  	/* base_crng.generation's invalid value is ULONG_MAX, while
> > >  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
> > >  	 * former to arrive at the latter. Use smp_store_release so that this
> > > @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
> > >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > >  		return;
> > >  
> > > +	if (!static_branch_likely(&random_vdso_is_ready))
> > > +		return;
> > > +
> > >  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
> > >  }
> > >  
> > > @@ -925,6 +932,9 @@ void __init random_init(void)
> > >  	_mix_pool_bytes(&entropy, sizeof(entropy));
> > >  	add_latent_entropy();
> > >  
> > > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > > +		static_branch_enable(&random_vdso_is_ready);
> > > +
> > >  	/*
> > >  	 * If we were initialized by the cpu or bootloader before jump labels
> > >  	 * or workqueues are initialized, then we should enable the static
> > > @@ -934,8 +944,10 @@ void __init random_init(void)
> > >  		crng_set_ready(NULL);
> > >  
> > >  	/* Reseed if already seeded by earlier phases. */
> > > -	if (crng_ready())
> > > +	if (crng_ready()) {
> > >  		crng_reseed(NULL);
> > > +		random_vdso_set_ready();
> > > +	}
> > 
> > The fact that the vdso datapage is set up by the time random_init() is
> > called seems incredibly contingent on init details. Why not, instead,
> > make this a necessary part of the structure of vdso setup code, which
> > can actually know about what happens when?
> 
> The whole early init is "carefully" ordered in any case. I would have been
> happy to allocate the data pages before the random initialization, but the
> allocator is not yet usable by then.
> We could also make the ordering more visible by having the vDSO datastore call
> into a dedicated function to allow the random core to touch the data pages:
> random_vdso_enable_datapages().
> 
> > For example, one clean way of
> > doing that would be to make vdso_k_rng_data always valid by having it
> > initially point to __initdata memory, and then when it's time to
> > initialize the real datapage, memcpy() the __initdata memory to the new
> > specially allocated memory. Then we don't need the complex state
> > tracking that this commit and the prior one introduce.
> 
> Wouldn't that require synchronization between the update path and the memcpy()
> path? Also if the pointer is going to change at some point we'll probably need
> to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
> solution for this but didn't find a great one.

This is still before userspace has started, and interrupts are disabled,
so I don't think so? Also, you only care about being after
mm_core_init(), right? So move your thing before sched_init() and then
you'll really have nothing to worry about.

But I think globally I agree with Andy/Arnd -- this is kind of ugly and
not worth it. Disable vDSO for these old CPUs with cache aliasing
issues.

Jason

