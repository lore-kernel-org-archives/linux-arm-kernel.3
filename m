Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E88CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv65kSjXoHh5kZbIWKr7i3/NioyZJdRuwp5qAQi17S0=; b=vecWd6T+FMe3p1nCuCQqwlRwoo
	cdxKO+UxtbSyGyY8o1SZAO1MdWLeGv1QQCQnQUV3Fo0T/JVFpuQLGner3xlg3AWSJzw9VKLg56HQk
	pmqr5yak6tu1c8ELA1GztOGgCdeAgDUyNR5LhGLdqbtbrOn3iVrHGzm83GptKPoUDZmLEW06Pk6RP
	6wEl85RBSaBVbFv5rjLX4n6yaWN1rIR+t//a7MLzvh/gmevHQmYqSH5alx/S50Yfqc2IvdoHQHNiM
	oOrQ/KSJBUwGAf2mbRY5siuumCMrky8DOdiYeQ92sjH9k6hNzW+LvmoinQ4A5vHanz21EEQ5JaI4c
	tg/jkHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KsB-0000000FsOa-37He;
	Wed, 24 Sep 2025 08:29:11 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ks9-0000000FsOB-1kHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=fv65kSjXoHh5kZbIWKr7i3/NioyZJdRuwp5qAQi17S0=; t=1758702549;
	x=1759307349; b=mz4pTR2HtGMELObgz6n88FKyYxsahmBPK93/2b0FyqaZtDkAXFHSAAg7f+ntt
	xuIm5JXcdF8I1FS1kFb/yJo1HT0/l0PcmqydtQFctiXVvhEVjDSkUIXNORs+nqQQ/NlXqjuRi0eZz
	NIdAZ23GniNussiNgqSV2pf4btQKnhEM1t6TvdjaKVKd+AJJ5QNeg7uTX0AjMswOHiFHtNALTbj17
	CxFpjmcRVeAoizrWU+SWXgtgjp6Kwc9t8r9dybz1dYlkRWVYCPwQ9S1tTPOshlAur3U8CJpMBpY23
	dmG2dftHXPnNiw4DbmWX8FExxS99Jcd+YwzRlD/ZNkqbJaiCWA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v1Krw-000000002th-3piT; Wed, 24 Sep 2025 10:28:56 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v1Krw-00000003LPw-2L5t; Wed, 24 Sep 2025 10:28:56 +0200
Message-ID: <ec0894011cb4403f45ad8b30095cc333edc1e5e6.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,  Andreas Larsson
 <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, John Stultz
 <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>,  Russell King <linux@armlinux.org.uk>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman	 <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy	
 <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui	 <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson	 <sln@onemain.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann	
 <arnd@kernel.org>
Date: Wed, 24 Sep 2025 10:28:54 +0200
In-Reply-To: <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
	 <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
	 <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
	 <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
	 <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_012909_600627_55DE2179 
X-CRM114-Status: GOOD (  19.20  )
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

Hi,

On Wed, 2025-09-24 at 10:07 +0200, Thomas Wei=C3=9Fschuh wrote:
> Sep 24, 2025 09:40:47 John Paul Adrian Glaubitz <glaubitz@physik.fu-berli=
n.de>:
>=20
> > Hi Thomas,
> >=20
> > On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
> > > > Could you share a version of the series based on top of 6.17.0-rcN =
for
> > > > testing purposes? I would like to test the series on a Sun Netra 24=
0
> > > > which is based on the UltraSPARC IIIi.
> > >=20
> > > Here is the git branch based on rc4:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/lin=
ux.git/log/?h=3Db4/vdso-sparc64-generic-2
> > >=20
> > > Does that work for you?
> >=20
> > I'm getting merge conflicts with "vdso/datastore: Allocate data pages d=
ynamically" and
> > "vdso/datapage: Remove inclusion of gettimeofday.h".
> >=20
> > Can these be skipped?
>=20
> No, these are important.
>=20
> What are you trying to merge?
> I can probably give you a merge.

I'm using v6.17-rc7 plus all SPARC fixes in Andreas Larsson's linux-sparc f=
or-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git/lo=
g/?h=3Dfor-next

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

