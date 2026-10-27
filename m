Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7FC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pyldbny6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHE9aF/m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wi470fH/6NJAJZsJW9LEG6B+Nx4bCaf1TqCBljyhSYs=; b=Pyldbny6vsYO5h+XYb0yeQi0Jz
	BY7litVQw2MuCAjM9tvFl/px3tsRRQ4xM6S3jDSDinTd75VzPLgfLKFaE0OZaiBxYAVuRpowEyoTP
	SBtrLz210iSvjF2TYewhtovVJYtLHnM8OpD28jIl46b93wG909JKqzSg2nJnOfROpEG4anQn/DSf6
	jalTFPEFaNa/ysVXOAzmravR/kg0ebyTvbdwb9Rsnwhg1UTpd1P/dlQw3Yp/i6flDB/13JF7RTmGa
	StGdGA8O/yZX1zvOKAbiPvf7CMFJTDPbcyHuNr4oraIZ4Pd7vFUYEk2xPDBhoVhJ/+et73F/kLVnK
	M+65KXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiUq-000000054i6-3J4B;
	Tue, 27 Oct 2026 14:49:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiUp-000000054hn-3V7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:49:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DA5841896;
	Tue, 27 Oct 2026 14:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BCB1F01825;
	Tue, 27 Oct 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112591;
	bh=wi470fH/6NJAJZsJW9LEG6B+Nx4bCaf1TqCBljyhSYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eHE9aF/m0olFM2y2NwZjjYwCRmBvH7lmBHZRFn04xch9qN2blVyR530qFx1ajlZZR
	 sHXvWn7Rfgonr2KJw13NFFIGPrPPj8CIYIMHDybhwwGbhQuj3yFtbFlEZsxpGDhtBS
	 mGy58KLHw/Ft4Ogb3TT7GDqw4VjVyjZrWhIsXBYPwj45+RkKONxw6dXhujW8Sjtzkq
	 /PcGBzowaW+LZoNukqJ3XziFwgv2bJU8DqFKwSMUOvgjv90MiDg8+MJWpSE2bfvrZD
	 TO/gjvUcv304ye7BKL+L4BhzX7+wemUrOo73UOMBLYnueQkrxm4rQUVRn9QigO0hbE
	 jy/iRbf8DnOlA==
Date: Tue, 27 Oct 2026 15:49:45 +0100
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auC6CbIclUCJK094@kernel.org>
References: <20261015161054.357595-3-blum@kernel.org>
 <auCVj80cR8LILhXB@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auCVj80cR8LILhXB@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On Tue, Oct 27, 2026 at 12:14:07PM +0000, Catalin Marinas wrote:
> On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> > __parse_cmdline() detects "--" only if it is followed by whitespace.
> > However, at the end of the command line, it converts the dashes to
> > underscores and tries to match "__" as an option.
> > 
> > Detect trailing "--" directly instead of converting it to "__".
> > 
> > Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > index acaf56234973..38aa28d19650 100644
> > --- a/arch/arm64/kernel/pi/idreg-override.c
> > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
> >  
> >  		cmdline = skip_spaces(cmdline);
> >  
> > -		/* terminate on "--" appearing on the command line by itself */
> > -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> > +		/* Stop at "--" appearing as a separate argument. */
> > +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> > +		    (!cmdline[2] || isspace(cmdline[2])))
> >  			return;
> 
> I guess that's more of a cleanup. Does it actually fix anything to
> deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
> no functional difference.

Yes, it's a cleanup.

Functionally, the behavior is equivalent because it also happened to
work before. However, commit dc3f5aae0638 removed the explicit detection
of a trailing "--", so I added the Fixes tag mostly for provenance.

Thanks,
Thorsten

