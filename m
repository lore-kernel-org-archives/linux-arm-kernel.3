Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA386CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxAx55vS2rggMZF7eTbs+MZ7ZqRsew9htCf8ptQSB2w=; b=KFQiK3n/b4tKbGaK0g5yBoINbP
	YnjewMBaS9yY0mBd5J/dg8YDJMXL0aeH/ZD1ugQ3k8IcO+Wbp5kbWJvlObWH/Y16cd4JEhiKgWorl
	vowgMGwns2pGcO7l3XwaF4GLPdeKSssgxjpOBKfL/IMQXHdnD8FVKq7tvxInpiUdcNEgaP2kmCX6r
	Z+KpGl37xASmNUL7hN6w2ozWKtzh8qDrQi+78Sns1u0r65AjavjE6J2w46N+wzD4rhQrTjADfgkiB
	YbhHdetHSopLs/skfMXM6jJVso2PYp5xtNE1uqiUbf+gb4OSN93W3afmDXVWnltVjQNrsaBi8cHQU
	Jvy3YaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1K7g-0000000FlQk-0t5e;
	Wed, 24 Sep 2025 07:41:08 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1K7a-0000000FlPH-2ov8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 07:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=oxAx55vS2rggMZF7eTbs+MZ7ZqRsew9htCf8ptQSB2w=; t=1758699662;
	x=1759304462; b=GFjoCDs2iW22JoICi1lAQj4Qlm63I97jexJ1Ev1zBZ6KBs6k+njJsOgrBZCJ5
	2A+DVkCpVIMMuQyigsZVVXXG84I74JFgZvg6Du8GIZTFM0Okq9dcN+jAQkgP3JpSZ0yQREE2pro0H
	OOG8nU2jg9eUky/QXv0mf2FA5FpfzmiJFihcEqEiX7yPq1Q6kwx8OiSamxtUAj/CTJX3/dPY9txOO
	dGDN40PbsKyIjm2NEoJWz5BGGMzVCuoEweU3MUOZMNy/tk3HUCtyaYluyHTvVsT5mONZk8PRJFVwE
	lIxJTgIe1qo1jC9QohVx6QkYQ/2BB/IWaq6AavQyII/nIGl4/g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v1K71-00000003rTv-3nNq; Wed, 24 Sep 2025 09:40:27 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v1K71-00000003D15-2K09; Wed, 24 Sep 2025 09:40:27 +0200
Message-ID: <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
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
Date: Wed, 24 Sep 2025 09:40:25 +0200
In-Reply-To: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
	 <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
	 <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_004102_876287_F3D45D32 
X-CRM114-Status: GOOD (  13.01  )
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

On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
> > Could you share a version of the series based on top of 6.17.0-rcN for
> > testing purposes? I would like to test the series on a Sun Netra 240
> > which is based on the UltraSPARC IIIi.
>=20
> Here is the git branch based on rc4:
> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.g=
it/log/?h=3Db4/vdso-sparc64-generic-2
>=20
> Does that work for you?

I'm getting merge conflicts with "vdso/datastore: Allocate data pages dynam=
ically" and
"vdso/datapage: Remove inclusion of gettimeofday.h".

Can these be skipped?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

