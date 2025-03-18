Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE761C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNc4tvjs7UEVHPSTl2yB6rVJEl8KpRQ8DgAaMm11bgo=; b=jOaRe+QmH5wCDtVnBDIcJcnWw2
	QoZYMVJNJVW7LvIcPtzzh/GFgRuCRXSoVtBZGrfFAD2XpkM/SAAZkduo7Nn+OsqGEoxit92VJ0RX7
	Ah5ALFzpH/Tk7aglAs4qNgQ1YvQCQvrC8lr/pcxUb2qGM9/+ooR4+LbRsmb5vugsMdrrlr0QvSOJL
	mV53qlgQhXH3rhPZXu61C8S81BwkuAV06m1auONOPqRHAF8E/e9/bc2wbWZRM8QZW4Mazwez18l7Y
	42LU3GOG6NFQJ1WucxGNRmlivXictoLI+94Ucp4RJouwD9DeFMEe07uikEQaVK2sisYvtuzRGuKEA
	RKgw9cbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZYr-00000006TTo-3yco;
	Tue, 18 Mar 2025 16:13:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZXA-00000006TIp-18Hu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:11:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9F3EA45311;
	Tue, 18 Mar 2025 16:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498B4C4CEDD;
	Tue, 18 Mar 2025 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742314275;
	bh=DJznTK9wfd62bjKGxd9NXjtY5194EOGALbaCxEQznmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3SK5kFPf+I1n2yaBNQdeHZ7nbDK4HwSYUCTPIp6e1WnEbAAQyeQdxTVYHTiDIIq+
	 0mFupGyj9oN152XWl+pezZkAf+PC72c3CYsqn79vYsl0NAnork4vLYM5qVG0NppMFN
	 2OpkeMfFUEOUyUmGaMBej8SzUgvyBVWvtQ+RnzIHecHyCNyrZbFB5n4s+nhCj1JkwS
	 mByYoLxpL83jpG/ANwdEMmpX/4vxhWzlOu4LT8cln0o7aUOi2DK3KAdbReDmBouHum
	 XXAz8daETMwGL4GJiiuFAJn1QHE9ghY3+3xCSEf2/neesNhTITmM3A1RUrPthElo7E
	 7a+EOJ62O+hwQ==
Date: Tue, 18 Mar 2025 16:11:11 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Don't use %pK through printk
Message-ID: <20250318161109.GA13981@willie-the-truck>
References: <20250217-restricted-pointers-arm64-v1-1-14bb1f516b01@linutronix.de>
 <20250221145513.GA20567@willie-the-truck>
 <20250224150920-87b1bf56-9520-4cd1-ab51-93da2eece162@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224150920-87b1bf56-9520-4cd1-ab51-93da2eece162@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_091116_371675_A464FDBE 
X-CRM114-Status: GOOD (  25.19  )
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

On Mon, Feb 24, 2025 at 03:12:54PM +0100, Thomas Weiﬂschuh wrote:
> On Fri, Feb 21, 2025 at 02:55:14PM +0000, Will Deacon wrote:
> > On Mon, Feb 17, 2025 at 08:39:06AM +0100, Thomas Weiﬂschuh wrote:
> > > Restricted pointers ("%pK") are not meant to be used through printk().
> > > It can unintentionally expose security sensitive, raw pointer values.
> > > 
> > > Use regular pointer formatting instead.
> > > 
> > > Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > ---
> > >  arch/arm64/mm/physaddr.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
> > > index cde44c13dda1bc0924d2d50369ad87f544a0a802..7d94e09b01b35094e883875a46b979666549095c 100644
> > > --- a/arch/arm64/mm/physaddr.c
> > > +++ b/arch/arm64/mm/physaddr.c
> > > @@ -10,7 +10,7 @@
> > >  phys_addr_t __virt_to_phys(unsigned long x)
> > >  {
> > >  	WARN(!__is_lm_address(__tag_reset(x)),
> > > -	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
> > > +	     "virt_to_phys used for non-linear address: %p (%pS)\n",
> > >  	      (void *)x,
> > >  	      (void *)x);
> > 
> > This is part of a WARN() and knowing the actual address may well be
> > useful in debugging. I suspect it also ends up being dumped as part of
> > the register dump _anyway_.
> 
> That makes sense, especially the value being part of the register dump.
> OTOH in the default kernel configuration (kptr_restrict==0), %pK is an alias to
> %p and also hashing the pointers. And so far nobody seems to have cared.
> 
> If you prefer I can also change it to %px, to specifically show the value.
> My main goal is to remove %pK, as it's prone to misuse.

Probably best to ignore me, then, and keep the existing behaviour with
your change (as your patch is doing).

Thanks,

Will

