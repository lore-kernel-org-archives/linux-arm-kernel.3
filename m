Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F52ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUP/wtp+QdGXlvt3yNjaBtNTKb3hr2sjUsHqlx5bmiE=; b=E3ob+Yt0UIb6xE2K6kN/PWhHtL
	MamScc7tNhysjS0yTbsflOAQdfmxptz682nCdR2NkUOOdFtg1rihIUzwdMrjeqaCEanYOzOYhDujq
	FO1kBl0pK3g9NCcVL8KHFO51T0WaS5zNo5MK6ieQ4tU8W4HR0TmnKKFCDIOI6A9crVEj3UFoNi/5F
	XIHmQ5KBVVf/WdC41iVuDuMr0vE6F2tGkjeFwsj7f6zZYJbIhT/H1fTK+f5vbBm3sxTmn2WLdzhNx
	1wd3ApqKHU29NZmhlCwQClPHBsYJ6sVvf2XSX9+1LlrNPaWnSLG5+xxhmHoksyM5pIWhIBj5PfA8b
	fVMfkWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQG7-00000005L2I-3Rg5;
	Mon, 10 Nov 2025 11:40:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQG3-00000005L1T-2pZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A194D429C1;
	Mon, 10 Nov 2025 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A8C19421;
	Mon, 10 Nov 2025 11:40:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MkcLnaBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762774821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUP/wtp+QdGXlvt3yNjaBtNTKb3hr2sjUsHqlx5bmiE=;
	b=MkcLnaBThnMlfY6qf22oV4PqRJxxV9sAEsGKWW9vBI8C6fduJC1phQC/KL5eRD3v2F09zD
	SMKKUag6VL9wsRLpIcAWX8HR444SZKLYuhbVw7XsNVIJ5uIDVyRfrdP33rS+EubmBkHMzC
	XsknOx/WV33HVZ0CEH07YX7KePjg4M4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d386279 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Nov 2025 11:40:20 +0000 (UTC)
Date: Mon, 10 Nov 2025 12:40:17 +0100
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
Message-ID: <aRHPIXATFJAEv-CF@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
 <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
 <aRHAU7bVAIyaOrpA@zx2c4.com>
 <20251110114550-a3f2afa8-4f86-4048-be5b-2dc4f4ef340d@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110114550-a3f2afa8-4f86-4048-be5b-2dc4f4ef340d@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034027_996339_9577971A 
X-CRM114-Status: GOOD (  27.94  )
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

On Mon, Nov 10, 2025 at 12:24:13PM +0100, Thomas Weißschuh wrote:
> > > > For example, one clean way of
> > > > doing that would be to make vdso_k_rng_data always valid by having it
> > > > initially point to __initdata memory, and then when it's time to
> > > > initialize the real datapage, memcpy() the __initdata memory to the new
> > > > specially allocated memory. Then we don't need the complex state
> > > > tracking that this commit and the prior one introduce.
> > > 
> > > Wouldn't that require synchronization between the update path and the memcpy()
> > > path? Also if the pointer is going to change at some point we'll probably need
> > > to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
> > > solution for this but didn't find a great one.
> > 
> > This is still before userspace has started, and interrupts are disabled,
> > so I don't think so?
> 
> Interrupts being disabled is a good point. But we are still leaking
> implementation details from the random code into the vdso datastore.

It wouldn't. You do this generically with memcpy().

> 
> > Also, you only care about being after
> > mm_core_init(), right? So move your thing before sched_init() and then
> > you'll really have nothing to worry about.
> 
> The callchains random_init_early() -> crng_reseed()/_credit_init_bits() could
> still touch the datapage before it is allocated.
> Adding conditionals to prevent those is essentially what my patch does.

I think I wasn't very clear in my proposal, because this isn't an issue
in it.

Global scope:

static struct vdso_rng_data placeholder_vdso_k_rng_data __initdata;
struct vdso_rng_data *vdso_k_rng_data = &placeholder_vdso_k_rng_data;

Then,

void __init vdso_setup_data_pages(void)
{
    ...
    vdso_k_rng_data = blabla();
    ...
    memcpy(vdso_k_rng_data, &placeholder_vdso_k_rng_data, sizeof(*vdso_k_rng_data);
    ...
}

If vdso_setup_data_pages() is called early enough in init, this is safe
to do, and then you don't need to muck up the random code with awful
state machine ordering stuff.

Jason

