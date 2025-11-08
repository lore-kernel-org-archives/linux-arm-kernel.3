Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D92CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqrig/ICHvWgtJzEoNeYVDwQd4i37MdMTA/ueCaWo50=; b=rdVUyLjw6gR5YuCeT74k7R2Ssu
	UfELKgvzybcwBBnUsw4zJoCFWN6O0DKnQRc3domJMnX4FXDbukET4khdZV3h283febbgw6IrI7LuL
	wketYPGQyrl6ktEpPzQtzUn3pqrroQEAIIlu/oI9Jsb23zDgwmMTiA1OCgXYLDgVGrADU95L/sQhf
	UyN7ehbijaIJDNudyBv2V1lxfDMYbkd5eaiEP/7n2dhvCZUwNuEc4droX0cNp3yR+R+LqcPqk4cUJ
	x1lUqxMjTNanTVfUKAKWQDT/72U3UhKaiyoDjQaRgbED+Jc5Dk6sKBexOovxLtXf+DVC2aCROo2eT
	xo1l6l1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWeC-00000001hTj-0O6L;
	Sat, 08 Nov 2025 00:17:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWeA-00000001hSf-34kt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 00:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC01D61934;
	Sat,  8 Nov 2025 00:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570C7C4AF09;
	Sat,  8 Nov 2025 00:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762561057;
	bh=XUsG99xBjGBf0mGGPX30fWGrjmuEuoRvSI6cNRaW3uk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZPZ3Vy4+Mwtd9u64BlwFmY6DmILtaZrSzmob9fOqpBDxe0Vricl0BZr8nconsigNL
	 SYTDEJnaAeh2wKWKSpK71sYHmGNBfLi/udKjbzUvREvUi9BIO85f4fGuhHjLV8Ul+z
	 8qEZnZe1tF/KaqDUNx9F1cVDDWxSyrWlYSD7e41mB7erF4YEJpMPeMGKvUaCSr8Kmu
	 t9Q4lJ8QnwFq9H/ubkLYOjrZFTc+Xp0zqdPZHWEynJx9onXQCbbC3x7TWNl/JspQ9H
	 GaMIKkq4WYKrixfV9Zg5Hw2UA54Qy7FuO7SwVRkjS8gm9KrB/c3pWQxLda/3j9cQAR
	 fRFaQ1dnyywMA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F54BF40068;
	Fri,  7 Nov 2025 19:17:35 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 07 Nov 2025 19:17:35 -0500
X-ME-Sender: <xms:H4wOafrNzNh3F20iEtzGYLwdnG5HUk8owEhFzBq4bC4yrZFPBzDpnw>
    <xme:H4wOaUcjSdohJ-lHpvtmDCy99XFBkf7MtPoTsUirPUpTjN2r6oDNLQ-LiaoJ013Zx
    OSsZ3wJ9MR_FlQDZoIpMISCvYFbT_IdXYQn-RQ8McO3in1UX_e7ymo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledutdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephffgieeuueevvddvffehiedtteduveejtefhuedtteehfffgieehhfeg
    ffehvddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguhidomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqudduiedukeehieefvddqvdeifeduieeitdekqdhluhhtoh
    eppehkvghrnhgvlhdrohhrgheslhhinhhugidrlhhuthhordhushdpnhgspghrtghpthht
    ohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhi
    nhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrghstghinh
    hosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhg
    rdhukhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheptghhrh
    hishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghv
    vghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrg
    hnrdhiugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomh
X-ME-Proxy: <xmx:H4wOaYj7xvXA29_Bib9C5PIR7PR0nsrqVdk5HtTm2H3d-R4y6hN7cA>
    <xmx:H4wOaWyOOyhtvDHw5EQUulR9nlXXe4Ffhpq_shBAWohS0jRLkL-01g>
    <xmx:H4wOaW5NDwwwriLNNzBHji6Fxg-C2vRU0eXN25y76ZiKUVW1dC5How>
    <xmx:H4wOaQdjDWMtCC-ZhzLIVmqqVcgCiXSqauLHNTpK8yyJ4JDQQasaWw>
    <xmx:H4wOaWqC_OPjl_9AhrIU-MZOmt6l20JMDdKC6pSM7VJpUei1L8Bhd8QE>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E114700054; Fri,  7 Nov 2025 19:17:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdW-VwKItdLc
Date: Fri, 07 Nov 2025 16:17:14 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Nick Alcock" <nick.alcock@oracle.com>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Shuah Khan" <shuah@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Shannon Nelson" <sln@onemain.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO library
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


On Thu, Nov 6, 2025, at 2:01 AM, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>
> Make use of the generic infrastructure.
>
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>
> SPARC64 can not map .bss into userspace, so the vDSO datapages are
> switched over to be allocated dynamically. This requires changes to the
> s390 and random subsystem vDSO initialization as preparation.
> The random subsystem changes in turn require some cleanup of the vDSO
> headers to not end up as ugly #ifdef mess.
>

I hate to say it, but this patch series seems like a step backwards.  Yo=
u're adding a whole lot of complexity and opportunity for screwups (boot=
 failure? corruption?) to support SPARC, where other architectures have =
no problem with the existing code.  And this complexity appears to infec=
t basically every kernel subsystem that supplies data to the vDSO.

Can you at least explain what the problem is and maybe give some discuss=
ion of why SPARC has no workaround available?  The closest I found was t=
his bit from "[PATCH v4 24/35] vdso/datastore: Allocate data pages dynam=
ically":

> Allocating the datapages as part of the kernel image does not work on
SPARC. It is also problematic with regards to dcache aliasing as there is
no guarantee that the virtual addresses used by the kernel are compatible
with those used by userspace.

Now I'm not an expert on any architecture that has these aliasing (color=
ing?) issues, but from my limited understanding, it ought to be possible=
 to choose a correctly colored address to map the vdso data given where =
it's being mapped from.  If there's an issue with gathering a bunch of b=
asically arbitrarily relatively positioned physical pages into their nec=
essary arrangement in usermode, you could presumably fix it either with =
some linker script magic or by rearranging the C code to stick everythin=
g into a multipage structure.

Or maybe you could arrange to allocate all these pages during early boot=
 and to fudge up some relocation to get all the existing generic code to=
 find them.  Or create some pointers that all the generic code will use =
that, on non-sparc architectures, will be statically populated with the =
right addresses by the linker.  IOW, conceptually,

struct the_type some_vdso_thing;

could change to:

const struct the_type some_vdso_thing =3D &the_actual_data;

and SPARC could fix up the initialization of the pointer.  And generic c=
ode would use the pointer instead of the_actual_data.

If you really really really need to have non-arch-specific kernel C code=
 running before the vdso data is allocated, can you give a very clear ex=
planation of what, exactly, is wrong on sparc?  And maybe put that expla=
nation into an appropriate comment somewhere so that future kernel progr=
ammers don't look at the headers and the code and think "wow, what I mes=
s -- I bet I can clean this up by using statically allocated data".

(Can SPARC really not map things that existed during early boot into use=
rspace?)

--Andy

