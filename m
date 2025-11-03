Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C700CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=; b=UVg+p0t5qERwoIYGC8vhVb6RIL
	vg/XonkGANquhZQUD0F3S083+Cjrw6VdMJiUbUcgFrfnlJ4xD0ZzE6GlpKOAhccn7dxbhX9HTbuHP
	d8gElBSnz4elJ+MVAQGapIlB0XPEqTuIqm5EQl+pSHfRjQrkenpuFYbEzWMx7r52/3L4/QkTCxApJ
	dIURjJJTHik0WUudUJQAI1VRJ7PGVcXKOdY35IFTlWnoH+PINzSSmkMH0SBHh14GLIohZrM0fMhoa
	58j1N2xrSzIxqJo/YtUUYgPcNftUaRMWhhUOvV0Qq85AKzFTaaXlPLzwddD64xSZmzlXzHs8pK5tA
	MfL0w70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwsj-0000000ACFk-3gpx;
	Mon, 03 Nov 2025 15:54:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwsh-0000000ACFE-2RcW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:54:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762185242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=;
	b=oCOt/yZx3kUvthyRmlZKqoqG4xaLxSanrqzjBuSuGMhK0ADOJIdwmXrgK+thqnkfGMOwZF
	biLdv5N50vZ7OQA9Wz1K+4DGiXnSE0ull+3W6DDwqsKRe7jGwo3hQ9O7xz3mEtCN5xYo6h
	oKBGIuzKxH13tMYYNk49J/fJ7dT9o6meaxM7EmmMHbxFgmenNBMJ4E4mcrA2csMybSs7Iy
	QoraOgR92lpDiilGZjyWrtNCDF7HVmygpfE3Pa7vyhH+DYWdwEfqljn3eAqtC/kr7T45il
	JZvVcxk08oTaX6KlR5tuWm+xg4CmWAC/CmBVVN36FauRUSGSCVviTzGlT01EIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762185242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=;
	b=78T2WGDDnkw1/Y9Zii0VTpZZRyUxTVak/Sn/59YxAiAkUqWJQ/81eLe+PFGzq/g7O/QzM+
	rkRtAnHeFhncC/CA==
To: Mark Brown <broonie@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nick
 Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson
 <sln@onemain.com>, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
In-Reply-To: <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
Date: Mon, 03 Nov 2025 16:54:01 +0100
Message-ID: <87bjljw1ra.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_075407_766597_086C9BD1 
X-CRM114-Status: GOOD (  17.22  )
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

On Mon, Nov 03 2025 at 15:24, Mark Brown wrote:
> On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Wei=C3=9Fschuh wrote:
>
>> An upcoming change will allocate the datapages dynamically instead of as
>> part of the kernel image. Such pages can only be mapped through
>> 'struct page' and not through PFNs.
>
> I'm seeing some boot failures on some arm64 platforms in -next which are
> bisecting to this patch in -next.  Unfortunately the diagnostics aren't
> super useful, we seem to just stop making progress in userspace with no
> obvious output.  One sample log from the FVP is:
>
>    https://lava.sirena.org.uk/scheduler/job/2036229#L1268
>
> which isn't super instructive.  Not all platforms seem to be affected,
> I've seen this on at least the Arm FVP, Orion O6 and Libretech Renegade
> Elite.  The diagnostics aren't very clear here but given that I'm seeing
> the same issue and bisect result on multiple platforms it seemed worth
> mentioning.  Some platforms do seem fine.

Can you try

    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso

which is rc1 based and only contains the VDSO changes. That might give
us a better hint.

Thanks,

        tglx

