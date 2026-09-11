Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B7EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU36CAMH0As/+hgtL4nBfeMCbZVDxdToFschpTypMpk=; b=kpbDSBGEG6Zq8wsm2Lkg7R/TXz
	W/kb0W2CGUhwOt+2VEpYAbfBWKP/AHGwrFGGHxIXO6YbT41+nhEm/OwPYNjCM7TPq+3Py5imz0dY6
	n3zU6+ozpp6r8LoxpKQHtcoLFvcJiFAKFLn92T9FoQsscFv9MDz5WEetgp4s8sb7WO+E1mFdGq+hZ
	CJvDTN37OQ2Bdri6pq/fUwfxyKR34yu5sW+9bJQ+y4AHaQtPwJAKPJ/t3dsSK+RF+B4XZ3s+z+35K
	V4apPm7AlGg/P4GjM4jDq5f+6vCjxbL0iRol3Hr/re5SOEJbnnvZibg7E3/vpYPPwVZxmxnKHLBKx
	OKq+8RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AMy-00000000LSF-0FXD;
	Fri, 11 Sep 2026 23:09:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AMw-00000000LRo-0cY2;
	Fri, 11 Sep 2026 23:09:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF7F60202;
	Fri, 11 Sep 2026 23:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF35C1F00899;
	Fri, 11 Sep 2026 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789168156;
	bh=PU36CAMH0As/+hgtL4nBfeMCbZVDxdToFschpTypMpk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PaDhcCeJrRmyZVEHXfccDKlvdH4Yuxb/QOXqXlQycswXlFl28NI27ccPXuXxRArHT
	 yM5NU+4/gMXCPAcMhMIzs9mmSbPBZf5HXfkmd5Y20oNzaOEgHJiV7l7EKgq5rtkJPs
	 IkaAHoU5iSvKmShAPGc8nW8gG/N2LgMXnP8Etgw2+xIKW/oq5UHszgY6DgNY7JlPip
	 XO3HrjW1agQaIQHri/He2ow5r6gNKazbTo0cr5dfBrR6SMwDeNCos7JOD6mRKZmZBo
	 0s4OE+q+SnJ86WtiwiagG0K76s/MkPJubu16vNILQXzhCOgALZOZry16bcI0xbhxBA
	 xCgBdxqC6pDdg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A3C83CE09DD; Fri, 11 Sep 2026 16:09:16 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:09:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bradley Morgan <brads@mainlining.org>, frederic@kernel.org,
	neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
	rcu@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
References: <20260911192540.20983-1-brads@mainlining.org>
 <20260911192540.20983-2-brads@mainlining.org>
 <20260911231017.550f8cd1@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911231017.550f8cd1@pumpkin>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2026 at 11:10:17PM +0100, David Laight wrote:
> On Fri, 11 Sep 2026 19:25:34 +0000
> Bradley Morgan <brads@mainlining.org> wrote:
> 
> > cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> > cmpxchg() for the architectures lacking native one-byte atomics.
> > The same architectures also lack native two-byte cmpxchg(), where
> > such an operation is not supported and either fails to compile via
> > BUILD_BUG() or fails to link, because the bad pointer sentinels
> > these architectures declare are never defined.
> > 
> > Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> > word with READ_ONCE(), splices the two target bytes through a union
> > and loops on cmpxchg() of the full word until the compare succeeds.
> > Like cmpxchg_emu_u8() it is fully ordered.
> > 
> > The Kconfig symbol gating this file is renamed from
> > ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> > selects both the one-byte and the two-byte emulation.
> > 
> > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  arch/Kconfig                |  2 +-
> >  arch/arc/Kconfig            |  2 +-
> >  arch/arm/Kconfig            |  2 +-
> >  arch/csky/Kconfig           |  2 +-
> >  arch/sh/Kconfig             |  2 +-
> >  arch/xtensa/Kconfig         |  2 +-
> >  include/linux/cmpxchg-emu.h |  1 +
> >  lib/Makefile                |  2 +-
> >  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
> >  9 files changed, 40 insertions(+), 10 deletions(-)
> > 
> ...
> > diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> > index 998deec67740..fee8171fa05e 100644
> > --- a/include/linux/cmpxchg-emu.h
> > +++ b/include/linux/cmpxchg-emu.h
> > @@ -11,5 +11,6 @@
> >  #define __LINUX_CMPXCHG_EMU_H
> >  
> >  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> 
> Why uintptr_t? Shouldn't it just be u16?
> (Which probably means the code would better if it was just 'unsigned int')

I suspect that Bradley is just following my cmpxchg_emu_u8() example,
which also returns uintptr_t.

I remember that *something* broke when I made this be u8, but I cannot
recall what the problem was.

Bradley, could you please try making it be u16 as David suggests just to
see what happens?  Who knows?  Maybe it was a compiler issue that has
since been fixed.  Or maybe the macros and asms using cmpxchg_emu_u8()
need that uintptr_t for some reason.

							Thanx, Paul

