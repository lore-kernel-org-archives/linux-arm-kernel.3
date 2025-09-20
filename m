Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DCDCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2U0S+R40JA/8Y/UUs6naRgYG7DrA2GyrAQ3SGnFjZ4=; b=UIFk8owdiFThrNo9NNCwE3pmVK
	X03yt9Lo2xLatwSqzkH6btEaDzWe6NOkYSZuhtTcGe87EpcwaaRoiLUB2ve1Ob8J4UzfJFdNeW15j
	yLimCQpwvrgc7A/tbALyX5te0mPCiHuttblz1MjmjOIeN5yx7LMWqd2lxzwZIGDkKp3RlxobVhNGU
	fONkGPE/jftbSZhJSLFKiKqSC2fwTPVTppKX27PFaEqz4lsSZg16CMoyRaWzLoJMlsFf67SW0+qbh
	qgZDYedbop/KRM6FhQ0YJUIBY4nK07D3IXy14/cTFrPZ02QZiT7lmLaDAaEC68q6R9EdfMtG3Jn0K
	4VCZ/blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzxaf-00000005Oim-01Wp;
	Sat, 20 Sep 2025 13:25:25 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzxab-00000005Ohz-2dOG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 13:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=e2U0S+R40JA/8Y/UUs6naRgYG7DrA2GyrAQ3SGnFjZ4=; t=1758374721;
	x=1758979521; b=cssF68qum6nHIWvMjojY9r8bDfJ+Uk68b4TsLXuX2cYIlABWuEwaHkS01JMDB
	GwDOjjHIMIW3a13XZN1XIiXcFW7X1d7NpUSHjqjyU3E98ufxunQJx2gq8aMay4D26Pp5uoCGvcoVn
	BanUM/2vpRJFWdYCbX+f3WIgwS6feqVAX0UYrGQcAkkB+HUVdpaWw9M7R3DyK/e0bsy3nqeHvRkDl
	uy9YBP8l0v9VR71tPhrX1wBCBFzcxuvIpwItTRNONd0yIq7UavRn5aaGP5DyRXOyS9PRnQueenqcM
	4JmVRuzzIcLvPww6j7JpcO+oeCp2zHZRkyk5hrybwBmoObbSKQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uzxa9-00000002Tuo-1mKc; Sat, 20 Sep 2025 15:24:53 +0200
Received: from dynamic-077-011-103-224.77.11.pool.telefonica.de ([77.11.103.224] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uzxa9-00000000uE8-0N7C; Sat, 20 Sep 2025 15:24:53 +0200
Message-ID: <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Andy Lutomirski	 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino	 <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller"	 <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Nick Alcock	 <nick.alcock@oracle.com>, John Stultz
 <jstultz@google.com>, Stephen Boyd	 <sboyd@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas	 <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Theodore Ts'o	 <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Russell King	 <linux@armlinux.org.uk>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy	
 <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui	 <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson	 <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann
	 <arnd@kernel.org>
Date: Sat, 20 Sep 2025 15:24:51 +0200
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.103.224
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_062521_814210_E7317277 
X-CRM114-Status: GOOD (  16.10  )
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

On Wed, 2025-09-17 at 16:00 +0200, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>=20
> Make use of the generic infrastructure.
>=20
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>=20
> Tested on a Niagara T4 and QEMU.
>=20
> This has a semantic conflict with my series "vdso: Reject absolute
> relocations during build". The last patch of this series expects all user=
s
> of the generic vDSO library to use the vdsocheck tool.
> This is not the case (yet) for SPARC64. I do have the patches for the
> integration, the specifics will depend on which series is applied first.
>=20
> Based on tip/timers/vdso.

Could you share a version of the series based on top of 6.17.0-rcN for
testing purposes? I would like to test the series on a Sun Netra 240
which is based on the UltraSPARC IIIi.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

