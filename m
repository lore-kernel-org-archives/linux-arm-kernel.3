Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35168C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPye3ew1a3LqRzVB13ZlWIDx0RqJAzodAjF7DeEyrpY=; b=TURAFcr4RhY5Bdlhhgqv1p9lKQ
	NdS0JRo7QDRxK71QvIdxCPTsRV5dOk8KWbJzm4wphk2A2+QgHmzUpzyxRuj7JmmPagL3SSbja0SuN
	u6y/jbTd/S8NknCnigUMAtaG2nlOmdqxbylBxK5eipjyFhY3hblyptWgCcQO/ST+RpBu8E4CNinuu
	VSESaaaVydeNGUkFUAdd2TiRVdkDYQjRb/Hh2x1Y+548a9mhWQis2eoDQbT/g1Ny2+v9BxjcD3fAl
	We3Iy3ChAOFp6czhdeH55g/EurBxEhgF5akCEW+b5kTNHNBU0SzZkpINZl2Ueq4OdV+A3GoMq24kP
	ya5EaMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXO8-00000004cXI-0CrM;
	Sun, 16 Aug 2026 09:42:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXO6-00000004cXC-2lTW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 09:42:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E22C9419F3;
	Sun, 16 Aug 2026 09:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE9E1F000E9;
	Sun, 16 Aug 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786873359;
	bh=zPye3ew1a3LqRzVB13ZlWIDx0RqJAzodAjF7DeEyrpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MYx4iFH7kfrR8wSTb6FDSpQseWfn0kL9+TZHUiSzEnYuhOzE8N/hwidYgEhooh6zP
	 l1tNT9bY0NdKzpBiuxftuNzVcyao2JvSGiLWSESW74d1RRZXO+uQVunjo0pnp+GS0K
	 r6Vxa84TYoNFVfaYAw56NDPGnFs52Cgera65J9JnpxwUUowvjlE8BfC+KHezr8B9jM
	 EyYVIWEkS0vIHw9TT7VN0hsJEYzEBPKnjwuSuhNwGBKVqICeHi5f3O8Bw1+kjAHpp9
	 dWRhCg/olJiGYi2/+HgPu6fdY62RZmQcckuaFqcRCt6wWz5Kele82uY4KrU6gWtGIm
	 63tTbBpXvK8HQ==
Date: Sun, 16 Aug 2026 10:42:34 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Message-ID: <aoGGCqMdb8iZvZSM@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
 <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
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

On Tue, Aug 11, 2026 at 05:04:43PM +0200, Ard Biesheuvel wrote:
> On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index 87a822e5c4ca..8951ce693552 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
> >  	b.ne	0f
> >  	mrs	x19, sctlr_el2
> >  0:
> > -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> > -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> > +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> >  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
> >  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
> >  	csel	x19, xzr, x19, eq		// clear x19 if Z
> 
> There is some more code that can be removed here - see
> 2ced0f30a426c7301350681f838344d5aea711e3

Good spot, thanks! I'll do some more surgery at -rc1.

Will

