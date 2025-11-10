Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF03CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=; b=PulFWsZE//T9TcbkZZ4Vm9QSR0
	pi2vFVN+K1GoVfXLptqOgwAd0z4yORs4HZLvPB3hcqneXjReZOOQT/o/WQz3nQT0z8C6d8HXXbyhH
	7HCadx11ou7GPztB9CsNGW0YL0j50KgyPxk6nxEhOywG7b/p6xEns/rCOblI6U//tqxdO5GfJYQ23
	NZr/fJwdZckiwWtyVHHvI9k6HhCEXggtYQFdWz3aVzECnNanMb3ZDCpKurJX2o6ZqGxTh6J1xuGVF
	0DQV48JEXCewUrIz7GAewP8VetgjpwdmozjFZLMxaVx7wUpPNlehYlIhxh/GcEUgAOG69eVe9Mzjx
	KHNwSaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINXF-000000051AU-18zs;
	Mon, 10 Nov 2025 08:46:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINXC-0000000519Z-3uT5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:46:00 +0000
Date: Mon, 10 Nov 2025 09:45:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762764350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=;
	b=zc0jjKjAsp0YnhtHKw7eM1+liJCO5iSx7CCFd73BS2XJvvlXwflG1NFICzbDNPrMliB1Zz
	z9oijqTWuNr9uWvpbtAZJfvjFOWQZE3AFkPNDdET/ElQz/Xv3oLQmA/M6PJ/hhmHAX6Cpy
	Iay9FeMMRFmSX+WRkJbz/WiJ+lqtk6zlCxe5YYD/aR+0JWiaTbiZdKvflk/K+zTAKAHRyh
	iNT7oqeaQjzbbX4GfH8HcmR7cfsveFd4GJFxHPGpcHUVJs+ns0T1guWntAt+nL8WuHcQAH
	YY2YP6EklQ3einkrNDniOoe3mo7Bw4HTblfZNZoJk+qiWUqrtmRZ9kBC4KKy5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762764350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=;
	b=dKrT84JkcQPBJNqu6XZmJfzmvsjkLpa1AvSOPwrcdFwP4VawI33FMJzCLV+t2ZRC2Nv2Nq
	0e6oPX/MtzX04lDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	Russell King <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 17/34] random: vDSO: remove ifdeffery
Message-ID: <20251110094145-462671cc-1f51-466a-b448-3dc541e764ca@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-17-97ff2b6542f7@linutronix.de>
 <aQ6Cq_5kiIXllEoS@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ6Cq_5kiIXllEoS@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_004559_143445_74760258 
X-CRM114-Status: GOOD (  13.53  )
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

On Sat, Nov 08, 2025 at 12:37:15AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 06, 2025 at 11:02:10AM +0100, Thomas Weißschuh wrote:
> > -#endif
> > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > +		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
> > +
> 
> This is possible because vdso_k_rng_data is now defined in the C source
> on all platforms and under all configurations, even if
> !CONFIG_VDSO_GETRANDOM means it's null? Whereas before, some config's
> headers didn't have this at all, so the #ifdef was necessary?

This is possible because vdso/datapage.h is now included unconditionally.
(Which was made possible by the previous cleanup patches in this series)
vdso_k_rng_data is only defined if CONFIG_VDSO_GETRANDOM=y but declared
unconditionally. If CONFIG_VDSO_GETRANDOM=n all references to the symbol
are optimized away by the compiler before the linker is invoked, so no
unresolved references are created.

> If so, can you mention this in the commit message?

Will do.


Thomas

