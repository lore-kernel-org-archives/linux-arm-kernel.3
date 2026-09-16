Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAE2C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuXdN9aGbtMyg5CPBRFzrLlbAoIxrshk4vqYbfwx7zk=; b=m96MBxDCYSnWB9Ak5gdBxASDWW
	eObciuOzRz/F0OGKPb6u0eMw9M2hkV3ahmTdFxsbbgCUD+CYZQNSbJFdvgcZ9H8eHQyV+twmZE5bH
	G9uyBW+6GMzqezfnWTNx4nyFj14TxEwS79Tq1PUqKxGxCxCj2i8/wIjToyYMZG3BnjMQAVydI3/qq
	FIaSnbUM4V1g6h/mJ5XLli8w9e2f607JYZ08w8qP+oPN+cg/wAuBQUDhDHmG6kTtDIMPusEu5pLyY
	PO60fYgKH3g9hXPI5h/nQL3WB/oyuaXQH7+lo01U0iHJ1r+cDvu6wvmupOrcaKpkiOwsVyofArsNh
	g7DEsstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wki-0000000A7A3-2xp8;
	Wed, 16 Sep 2026 21:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wkh-0000000A79m-2Owk;
	Wed, 16 Sep 2026 21:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4C57601EF;
	Wed, 16 Sep 2026 21:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EF91F000FF;
	Wed, 16 Sep 2026 21:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592470;
	bh=AuXdN9aGbtMyg5CPBRFzrLlbAoIxrshk4vqYbfwx7zk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=VLsv+qLjeEIuF/7HFCetYAKnkSVM5+afDqKwl5Y8elt8ggAsqiPrhgm4AUridwMkZ
	 JUa/cwQ/dxaF73pjj0bh5Ea48hlBTsaO7xkt7UY85+gDWHJAiA0zaZcTgyxZpgv6EC
	 ELBkBjoksOM7pw9H8botxyJsD9MYY7j8/DYTvyTL9MFcP0HCWvkWWRUJ9ByrjCfXQl
	 KWduc61DCtV4CGtkrPp5KybVTRm4pkPGA+/bKX+YtW1sYJGir6pRy5Jxm0D9VLtQ6F
	 Rvf6IRZo1UuWBgHDIs6r1Nd0FO/i2zgnCWxdK0D/W252zvXizTdtNEbtUXvhoLsSVW
	 0jXP1K4b/uJ6A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9923BCE0503; Wed, 16 Sep 2026 14:01:07 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:01:07 -0700
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
Message-ID: <ed3ef87e-b9c8-4aa6-90ca-c1da3e97a8e3@paulmck-laptop>
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

You might be thinking of the cmpxchg_emu_u8() series from a few years back.
This is cmpxchg_emu_u16().

							Thanx, Paul

> Either way:
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> Adrian
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

