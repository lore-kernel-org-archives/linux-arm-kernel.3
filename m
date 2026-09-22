Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E14DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tRbI6XkA8MPG1ny+jKahsxINKgsku5yR+AT0hT9eCM=; b=ed539NFnrTqYyByc3Xh9VeYGOA
	kD7saNlJb/ASSK25oSqRciL7zCI92G77TfL9FAOFRqe1aDIVb9ma6wUk9FqELLPR7/+n/1eBdrnJV
	Xzknrxl/7G0TPVWbk35R+w85REnyHgw0anqXVO+0BARF8lXSYwHUdtzOLH+QV0sw71NNfjVmZbCa6
	i4sY5mgqyYDwPrhnSHTObkGNYberLs6JSmGKsTj0SZfLMHhYX8lO8o4iZMKIo1fR3g7HX/QIIyynn
	snrIGVbKwZEzZ33IHhoUqCUiOng8iei0AuSIOeUSPLAl7MqdozGk1fvumXBUBm7bcdQOrQy0NrPqU
	oSU/Q4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Yt-00000006iYZ-21Gn;
	Tue, 22 Sep 2026 23:06:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Ys-00000006iYM-0SSu;
	Tue, 22 Sep 2026 23:06:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 877A740877;
	Tue, 22 Sep 2026 23:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6EB1F000FF;
	Tue, 22 Sep 2026 23:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790118365;
	bh=/tRbI6XkA8MPG1ny+jKahsxINKgsku5yR+AT0hT9eCM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lXVfl7756EL7HSGKyR9mbEmgPPWnZRPR+y7JpN/HZlavwjdnB1Z/pgEDvNs9hfS7m
	 mmGMCU0mm754ETZabpB+yAIXjg6cd44aBfApfjVqey5ZvwSYRIyO/MXSvxPTQV8jRM
	 5VM68QWqrnGI3hxTbNtACtjUA7nVaqlqZCDVRADbz98iwyF7Sb/a1vCKEmMUh0+b2S
	 e8qcKrHmlbS56Gi/kSLADZB422ZgCrtRTvsc1Orv2iOrt5IksuzvX/khCSOtY/pjF0
	 xiAxBMWGk7rtsBe898hzXch3RfVvvKHX1hlJtUzdzzCEVPlHekF3CYFkincVW2ITTn
	 3qjfQ1wesTwvw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1306ECE098B; Tue, 22 Sep 2026 16:06:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:06:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] sh: Emulate two-byte cmpxchg
Message-ID: <43815338-7862-4ab1-a078-47161909a246@paulmck-laptop>
References: <20260911192540.20983-1-brads@mainlining.org>
 <20260911192540.20983-6-brads@mainlining.org>
 <1835e3f1b7e936479964f5e40583133484510d25.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1835e3f1b7e936479964f5e40583133484510d25.camel@physik.fu-berlin.de>
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

On Wed, Sep 16, 2026 at 09:16:16PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Bradley,
> 
> On Fri, 2026-09-11 at 19:25 +0000, Bradley Morgan wrote:
> > SH has no byte or halfword atomic memory operations, so the
> > __cmpxchg() switch routes case 1 through cmpxchg_emu_u8() and
> > lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
> > which is declared but never defined, so a two-byte cmpxchg()
> > fails at link time. Route case 2 through the new cmpxchg_emu_u16().
> > 
> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  arch/sh/include/asm/cmpxchg.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
> > index 1e5dc5ccf7bf..477d3025a441 100644
> > --- a/arch/sh/include/asm/cmpxchg.h
> > +++ b/arch/sh/include/asm/cmpxchg.h
> > @@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
> >  	switch (size) {
> >  	case 1:
> >  		return cmpxchg_emu_u8(ptr, old, new);
> > +	case 2:
> > +		return cmpxchg_emu_u16(ptr, old, new);
> >  	case 4:
> >  		return __cmpxchg_u32(ptr, old, new);
> >  	}
> 
> Odd, I thought this series was merged long time ago. Was there anything holding it back?
> 
> Either way:
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Thank you, John!

In my reshuffling, I associated the arch/sh/Kconfig change with the
cmpxchg.h changes, as shown below.  The idea is to show all the changes
for a given architecture in one place.  I kept your Acked-by, but please
let me know if this is in any way problematic.

						Thanx, Paul

------------------------------------------------------------------------

commit 662151462e30187c342cffcd250834a32a9eb67a
Author: Bradley Morgan <brads@mainlining.org>
Date:   Tue Sep 22 17:33:52 2026 +0000

    sh: Emulate two-byte cmpxchg
    
    SH has no byte or halfword atomic memory operations, so the __cmpxchg()
    switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
    through to __cmpxchg_called_with_bad_pointer(), which is declared but
    never defined, so a two-byte cmpxchg() fails at link time. Route case
    2 through the new cmpxchg_emu_u16(), which takes the old and new
    values as unsigned long, so the (unsigned long) casts move off the
    call and into _old_ and _new_ declarations that type check the old
    and new arguments against *ptr through (unsigned long)(0 ? *ptr : _o_),
    the idiom David Laight suggested, so cmpxchg(&p, 4, 5) no longer
    compiles silently.
    
    Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
    Signed-off-by: Bradley Morgan <brads@mainlining.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
    Cc: Rich Felker <dalias@libc.org>
    Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
    Cc: <linux-sh@vger.kernel.org>

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..09e556fced01 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -14,7 +14,7 @@ config SUPERH
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select ARCH_NEED_CMPXCHG_1_EMU
+	select ARCH_NEED_CMPXCHG_1_2_EMU
 	select CPU_NO_EFFICIENT_FFS
 	select DMA_DECLARE_COHERENT
 	select GENERIC_ATOMIC64
diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf..b87f59107b4e 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
 	switch (size) {
 	case 1:
 		return cmpxchg_emu_u8(ptr, old, new);
+	case 2:
+		return cmpxchg_emu_u16(ptr, old, new);
 	case 4:
 		return __cmpxchg_u32(ptr, old, new);
 	}
@@ -70,8 +72,10 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
   ({									 \
      __typeof__(*(ptr)) _o_ = (o);					 \
      __typeof__(*(ptr)) _n_ = (n);					 \
-     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
-				    (unsigned long)_n_, sizeof(*(ptr))); \
+     unsigned long _old_ = (unsigned long)(0 ? *ptr : _o_);	 \
+     unsigned long _new_ = (unsigned long)(0 ? *ptr : _n_);	 \
+     (__typeof__(*(ptr))) __cmpxchg((ptr), _old_,				 \
+				    _new_, sizeof(*(ptr)));	 \
   })
 
 #include <asm-generic/cmpxchg-local.h>

