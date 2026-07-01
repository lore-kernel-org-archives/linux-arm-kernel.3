Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E26C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzaTPoH0/Jbz15YM7OdwlqoyPsJkrqrtqSoCOmHvtKA=; b=QLzqCWkT21XxUDlIPylr8gtVI4
	6VK3A4GKKobPm2cf2FvCRZdD7Pd8rfYVx94SCjFrfZtDXvfGkR7481GYVmum38pCLRM/x8X1Y/yJW
	8wFzT31uUygXbwdXuqqG6XP3vPR2nIvZ/7IMsDqAhZKNGdz3IvWWecQBso7TpTRtxLlKgjYLmRygu
	XoR/NkgbdQAXtmvAdyzozJfctySeeKPC9hE+3yUgd5CJeSBmypd3xh3RD8o6a3vkzUdmjeD6MrQ1E
	wCcOLb61jdEpNUVvJqLpe8g+jIblGrva8n1p1603LdoHAZ999U6mgiUU/4OrujOlXJdNLHoDyI+MD
	R0ciI7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqUp-0000000136O-12d0;
	Wed, 01 Jul 2026 08:40:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqUm-0000000135d-00zu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:40:37 +0000
Date: Wed, 1 Jul 2026 10:40:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782895232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzaTPoH0/Jbz15YM7OdwlqoyPsJkrqrtqSoCOmHvtKA=;
	b=shJRu5vDUP7ZDKQSHsK+hm5YzMgosdS81oqGJoO7WyU/KYkL+sjeEnqx02Vf7vGu0x43Ry
	uv6fAueFoRpJ4Xm9fSuHL9YZ7rkYM4cHiFQyvecXnQY0kyodiLeLDYy0hJhNzEafujjp1V
	4VPvIVU8ENW3zH8WQmLPMJWXGjv3azZz4S7EcH9XIzvV8SgR9veRJvvUkBalD1CoSrGzoV
	LUCKXOnXTb6ujHmRmax4+2WJA6Xfad6AmRnq70bALY+fNfyXQpi6N0l1bc4wGICwqzsR7f
	4PF/coqct+vO1K0YDcsduOPh91BO43A+uz4vYcgsqDb3FgEpWf9orTC78wUw0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782895232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzaTPoH0/Jbz15YM7OdwlqoyPsJkrqrtqSoCOmHvtKA=;
	b=g0vhUs9WNGqHZUgF7RfmzHiuDSnx9FCObdSlzDF54pp2Ic5gy6Dobr2Cf6z2yhnU/uvjVU
	UB1UH3naQir8cmAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	linux-api@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 1/9] time: Respect COMPAT_32BIT_TIME for old time type
 functions
Message-ID: <20260701102912-ea8f3291-7bba-407b-9a7d-7c367a4c9398@linutronix.de>
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-1-520d194640dd@linutronix.de>
 <0cda7366-2eb9-4ecb-b76a-b3b68ee10043@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cda7366-2eb9-4ecb-b76a-b3b68ee10043@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_014036_190649_5B95D272 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, Jun 30, 2026 at 03:00:37PM +0200, Arnd Bergmann wrote:
> On Tue, Jun 30, 2026, at 09:38, Thomas Weißschuh wrote:
> > The "old" time types use 32-bit seconds which are not y2038-safe.
> > Respect COMPAT_32BIT_TIME for functions using those types.
> > time(), stime() and gettimeofday() are disabled completely.
> 
> Looks good, yes

Sashiko found an issue [0], which I think is valid. I'll change that for v3.

> > settimeofday() is kept as it is required to do the initial timewarping
> > after boot. However the 'tv' argument will be rejected.
> 
> Not sure about this part, did we already discuss this last time?

This is my interpretation of [1].

> I can see how keeping the timewarping functionality is the easy way
> out, but completely disabling the settimeofday syscall the same
> way we do on new architectures seems so much more consistent.

Shouldn't we then do this completely? Irrespective of COMPAT_32BIT_TIME?
And then remove all of the timewarping and kernel timezone bits.

It would be nice however if this series, and my other ones blocked behind it,
are not blocked on that larger rework.

(...)

[0] https://sashiko.dev/#/patchset/20260630-vdso-compat_32bit_time-v2-0-520d194640dd%40linutronix.de?part=1
[1] https://lore.kernel.org/all/e9487ebe-3730-438a-9c23-e45f75986ecc@app.fastmail.com/


Thomas

