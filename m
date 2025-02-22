Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E7DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=; b=xm3pfCDr48khKJI8QqWDL+2qUg
	zqq6D3zSRnKO4r/JFwlqZSFq65VgASXxw9Auic0T85PGNHAd51J+rJ/r1IcI5xMIFbezs4cdeeQ3I
	a/d75IhTEvw2ILc3Pl9s9JEnAhmsWfJLZ70MonJ9QLdRnj7ApRStrmZ9QVAx7t1/BvLmQzEYB9EDs
	ejHf+na9HWpLYL0D8Mgr+/ks8u+F/c/+TmpwvvnB4iO+f+HQqrzbBCcgC6i3VDzvuWmVdbDm2rsMk
	NyjXRHfiikJswyXuoY4Q/n3ZSndpfKuFkjWwTXiOQ2f6UHgMBFxXydvcWG3SwW9yg2Qe0fz+WmrJ5
	oN/D+aXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmYE-00000007oZ2-3Tv8;
	Sat, 22 Feb 2025 10:16:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmWj-00000007oKT-28QK;
	Sat, 22 Feb 2025 10:14:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=E0xbOLPRJ+XD/M3Ao9By6szoKCsyLxcxtVTGsSbhAcE5NU1NK5C2+Dfl+zJ4+rpk8p2vce
	IgpgL+eLpTnyqk83xyrJHvEqqHTXl3g07KURIn1lsZ0aq6OKRUYTD54okHfdjXqNbDsSjC
	8vSMloBPM2AV4QgA0stwUEWMG6uZx3A9biypqi3p4tS6E2BLtlPpYMDvXniwVQOifJQaz1
	6Qig6O/uBgxjjBbGrOo71YvA2kL4peLeza5WOnn/Kdf4/Lf3rBALBWYLzmAVI3S8o31rMK
	Fy+Fe19AlwTl2IsoJXlYAVNRDdBMW1sP8B0maDlcTMTjaB57ZbWi7eIerkehlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=z74TsqYtERi/FO28k1WNxuOk/eCrttvKrCalx/NPgzVgRgvry4d1qCKiaSmbcNlhBsMonW
	bE0L5AunrFXssYCw==
To: Xi Ruoyao <xry111@xry111.site>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH v3 09/18] riscv: vdso: Switch to generic storage
 implementation
In-Reply-To: <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
 <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
Date: Sat, 22 Feb 2025 11:14:23 +0100
Message-ID: <87a5aegubk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_021429_741896_CE7928AE 
X-CRM114-Status: GOOD (  11.58  )
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

On Sat, Feb 22 2025 at 16:17, Xi Ruoyao wrote:
> On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
>> The generic storage implementation provides the same features as the
>> custom one. However it can be shared between architectures, making
>> maintenance easier.
>>=20
>> Co-developed-by: Nam Cao <namcao@linutronix.de>
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> I made a RISC-V vDSO getrandom implementation on top of this and it
> works fine.  I'll submit it when this is merged.

You can submit it right now. If it's reviewed and if Jason agrees, this
can be merged through the timers/vdso branch on top of the pending
changes.

Thanks for testing it!

       tglx

