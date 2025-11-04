Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADCECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=; b=NlWlKRiamgOZs6PXPAXrHO3F0n
	FHBMCFlr7PHMSnZD3UmX13jhLmT4YXCwwm0QL4nJGUtYYthF2evvNbvn0wTVvTObEWwY7905pVtFq
	rrh9DXGH9A3bLKzb6UAnZSw6aoL6pysdYO1FyL9kU9aAnzoEWw10A8DQRz3a4ET5xhEImKiKu9vEB
	FkAi3/hdPlQmwzzLOXBTBfP26kdejXoZHh2Ujc4Pix6H7amVG8b6gmlIIyzWNMX0kniw4SXHru9fG
	zbW0amFej5Z6pq25g7RhMEiYhJeMS92irbAHnopSveDI1jEKfOiV8Z3P5YvUgnobE6j6j+uEphZqQ
	tmRihV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJVP-0000000C9lx-3ck9;
	Tue, 04 Nov 2025 16:03:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJVL-0000000C9lL-3ZSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:03:33 +0000
Date: Tue, 4 Nov 2025 17:03:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762272209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=;
	b=bCAJkSmIzBJHojDm0KwmGmGWsC3n03i6WCc33ZaQkkge47R+7l1saAH6blSD0ZcrD6t1+k
	SA4SqaEwkJ+TDe/W1zQ8LTYjWa5RWNLQbAfIZM+Y+AU9p4PAC1jduZobAX0xoB8rwl0Rcf
	M48fxss71NzXcEx0CMI2zKV0ZH5sHbuLnO4VKDpnaH0pQlAdBlWLr8PyNUBpCmRFSLjQX6
	q5H8QxYqM7wyitM/U8xUreRnLtjBS6s3mWTKfzwJz5XToqIIPoSbtgz7MpOkUtm14JG4ei
	ZIAvxu9YICBZcukK1G/oAgbfZ24wqdhKPQwPstAHkfdm8JBXQruiwn1UOMWiFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762272209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=;
	b=izkXgs1Oks6O1p19fpLoG5rO6SL/s7yAl4p4D5Myex7HUGGkSZYk39IZs7dnxM/choRDJb
	t0IdWzTWBxSakZCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
 <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_080332_031612_17D6127B 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Nov 04, 2025 at 03:47:13PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 04:43:34PM +0100, Thomas Weißschuh wrote:
> > On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:
> 
> > > I've now got the results for this specific commit, it looks like every
> > > single arm64 system is failing.  I didn't test any other architectures.
> 
> > Which one do you mean exactly with "this specific commit"?
> 
> > 6a011a228293 ("vdso/datastore: Map pages through struct page")
> > 10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
> 
> The one in the thread being replied to here, the first.

Ack.

> > Any chance I could get remote access to one of your test machines?
> > I don't have access to the exact machines and that should reduce the chance
> > of chasing down dead ends.
> 
> I can let you submit LAVA jobs to my lab (there's an API, a web
> interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
> that works?  That's how my own access to it works unless I go pull
> boards out.  You should be able to resubmit existing jobs, it downloads
> test binaries over HTTP.

Sounds good.


Thomas

