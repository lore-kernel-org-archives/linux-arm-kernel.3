Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D1E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=yOZZcNJFoj3mED1ypeCuB/Ksf5
	mUqYtvycLqeQWCBea+JJo+tFrnLsR1GJSBQB1EixAa5UqKdj++TIIH6EpnSSJ9MaTwDi8XjNynYde
	k+fleD/WNHslgjYVS243RkM2YEbRzc6ZjXFmIfXlDf4KGbEMrmSYOV2o1lbp19wBDHhi3u2P6Pd9/
	LLfVfIeXsg2yLnwYmKTbTWyTKJP2r0WGe+wGF28Ep23mcsn+s/S6DggLNRYCCtc+qhBZ4hgbYkzPM
	4DBFc2bubLk5EQzIEp+9q8+EM79x7sUjcukrEFzq8+Kqmh7lqidPp+hr4UTf3/sBn0InA+IcaneXe
	DuwaAGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx3s-0000000HCrT-3hxR;
	Wed, 18 Dec 2024 16:38:12 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx2N-0000000HCZd-0nPL;
	Wed, 18 Dec 2024 16:36:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 604441D40442;
	Wed, 18 Dec 2024 11:36:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 18 Dec 2024 11:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734539796;
	 x=1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=
	ZBQAOqwWg2K05L5uK2bYuwdACrxkLsoc2PIgD0cQgiEZ7YYzhpCxLlGgVZW3DVx6
	RnHtDGYZacvkFOApE5i8PpEKXJJGSLMPZi1/7zYeCxngLwFiuC9mIs0r1MfRf1d7
	ljvkEfr+wDzKKBBc+aurNSqkpq8ZRtQDdq0HUTxnfOR5XzEt97aJE7dwOdFVZ/hQ
	G7NwA6xY0dgZ+/xg4YILY7/7WbCEybiUYNzp0z8/igRlYf8NVwKiJsF4kOTG+iqu
	JyrXPLjrjW44Sllz4+cRSo0lIJniQhepEl9dIW9Ha7JzvHs7+IVaGL96wRRmTQVz
	/xIay+l60aHEAef4QHVc4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734539796; x=
	1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=K
	qJZWQVI8dLKjsLZD5P9G0J1qUuKhEEsdqq+hKLVZma8PcO0rePXvzMeh3Gx+vBOD
	4nrPDtjhBHF33PiCb2oLKtLN8BuhIxgjeQHXotN9690yJVqb/PXCqLhFT2gY2knP
	SHOoAC5zDrv2o7AYcQSL9H9AgGMdlkVSHmV5ZjLFwBX52jgdNDzgyVppGNX1wod9
	7ttZ7ZLraiTYPJxQ1MR/SR1x3wO/EGPAqJ0WFhEdeVI7D2KnDKbbNvBechT+mDuz
	cpPDpxvu0YbekmHfrUlPuFeXsXgCSELupq6HK7beqkIp0QrURFeBQbSN0zMiN8me
	L7v+l+rQqTjKGKfPI+cXQ==
X-ME-Sender: <xms:EPpiZ2PhewnaDdeTezsY7UHZ-8MZHheQgg2o6m05zEshehzpenow1A>
    <xme:EPpiZ08FeD-PHv9DfxkMbyU44Z2agIt5ndVb5bJvAT7p7tClm27qKJ2TH4eLJ14WB
    FQJfPGZ_sMFiMW81M0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvh
    hinhgtvghniihordhfrhgrshgtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhn
    uhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphh
    gvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggr
    sggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrd
    gvughupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:EPpiZ9SUEzmB8m4BWTnSvNTtSXRoY8pckW1eK5W5rKnWC0lS5naOKQ>
    <xmx:EPpiZ2tCYDXsXEJFpJcBW2DlzBqmukOXYouat3DqxhmhFciRrpQLMQ>
    <xmx:EPpiZ-ctkHakbRRswX0-1x3fLnbcgCLh6ogHHQVM_Yz1HDnHdPdaLw>
    <xmx:EPpiZ62xeygOoJZVhzcxu1Lkfiip8AzfGhxGF4meBhl3PD_5MD0-1Q>
    <xmx:FPpiZ3eUuVl_kIXn3EabUXk14dEdg5IU1747WEAAdir6NevQA5VhmJtW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B4AC2220075; Wed, 18 Dec 2024 11:36:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 17:35:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Conor Dooley" <conor@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Russell King" <linux@armlinux.org.uk>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "Nam Cao" <namcao@linutronix.de>
Message-Id: <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
In-Reply-To: <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage implementation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_083639_890642_FA9EF485 
X-CRM114-Status: GOOD (  17.38  )
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

On Wed, Dec 18, 2024, at 16:46, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
>> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Wei=C3=9Fschuh wrote:

>> Might be a clang thing, allmodconfig with clang doesn't build either.
>
> The proposed generic storage infrastructure currently expects that all
> its users also use HAVE_GENERIC_VDSO.
> I missed rv32 when checking this assumption.
>
> I can add a bunch of ifdefs into the storage code to handle this.
>
> Or we re-add the time vDSO functions which were removed in commit
> d4c08b9776b3 ("riscv: Use latest system call ABI").
> Today there are upstream ports of musl and glibc which can use them.
> (currently musl even tries to use __vdso_clock_gettime() as 64-bit only
> on rv32 due to a copy-and-paste error from its rv64 code)

Adding back __vdso_clock_gettime() wouldn't work on rv32 because there
is no fallback syscall for it, and it wouldn't really help since
there is no existing userspace that uses time32 structures.

> There is precedence in providing 64bit only vDSO functions, for example
> __vdso_clock_gettime64() in arm.
> I do have a small, so far untested, proof-of-concept patch for it.
> This would even be less code than the ifdefs.
>
> What do you think about it?

Yes, simply exposing the normal time64 syscalls through vdso
should be fine. I think this currently works on everything except
rv32 and sparc32, probably because neither of them have actual
users that are able to test.

       Arnd

