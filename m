Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A230C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=; b=vt3quUlCXro83KqWQBevvkZpWe
	BxlOLvyasOnVr1ejkv9vctdEsnbbp3y+X8Tr4M1wUeU36WDUlLIHgE0Pdnx3Np+umSK1dKnHrCUTW
	ktBIBI+phOs58Ojo8BKHDNpSbVamvTNiO1pjUpar60EaGT7Z95LI9uMBw2t+rQNa3yEQ2MMOIwrZF
	nG+KSWxERA1w0SRrrFMCHbcUyOzb1KlANnqdhvgVnbF4QuKmvWXPfRmQJKaiRsmKMx5L64Fj5BCjl
	9/+Hm3KNbnLJ0WzOc+Ld0UruN96WQxT7cGtbYv4Lf/P8b8kf0/bqOYAgT4dz3y1quDlOkaYYFjZ/N
	GprZFYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkmQ-00000007di2-3OHM;
	Sat, 22 Feb 2025 08:22:34 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkkw-00000007dQw-2Zh1;
	Sat, 22 Feb 2025 08:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740212460;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ndlk6Xh1LDQ4IVzyCwXm+//RroUMYlrg93bkaGOnu/PB6zPDKJjYVM1f8u1zbnorm
	 6Wj9dxVkDjMZ8iYBCSeLLJkBb4sDAbSbTyaqhai1+lbpRWyuiyTuixexNlOL6xLK8h
	 Mbghzm1Uih9WOBd+JPF+dxhjdCJtmTB+W3bP4HQ8=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF6C9676E3;
	Sat, 22 Feb 2025 03:20:52 -0500 (EST)
Message-ID: <afc16fdc2417c3a761b880950c6c03998366e92f.camel@xry111.site>
Subject: Re: [PATCH v3 10/18] LoongArch: vDSO: Switch to generic storage
 implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen	 <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"	 <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	 <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen	 <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King	 <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao	 <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar	 <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,  Arnd Bergmann	
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	linux-csky@vger.kernel.org
Date: Sat, 22 Feb 2025 16:20:51 +0800
In-Reply-To: <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
	 <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_002102_660984_928FD4C8 
X-CRM114-Status: GOOD (  10.68  )
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

On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Tested-by: Xi Ruoyao <xry111@xry111.site>

/* snip */

> diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch=
/include/asm/vdso/getrandom.h
> index e80f3c4ac7481ba7f9f5d9210fefa78c3293243b..48c43f55b039b42168698614d=
0479b7a872d20f3 100644
> --- a/arch/loongarch/include/asm/vdso/getrandom.h
> +++ b/arch/loongarch/include/asm/vdso/getrandom.h

You can drop "#include <vdso/vdso.h>" in this file.

> @@ -28,11 +28,6 @@ static __always_inline ssize_t getrandom_syscall(void =
*_buffer, size_t _len, uns
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_d=
ata(void)
> -{
> -	return &_loongarch_data.rng_data;
> -}
> -
> =C2=A0#endif /* !__ASSEMBLY__ */
> =C2=A0
> =C2=A0#endif /* __ASM_VDSO_GETRANDOM_H */

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

