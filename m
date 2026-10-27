Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451C60A3808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U0/5c308;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UGpMc23Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uzYeYiHrkcESUMf2Bad0aFg730ZfeR2cikrxrYtPo2s=; b=U0/5c308K6sHZnonflmp7Jb/Q8
	I0TO044INKgVtVSMpp6WO7KGfEybdctR/1gPZ9fwfdMxHb+3tnZ1GPMJ8uWefIkMsMlYVjX9yAUHc
	DcTyvVg84OEreNtzAnUtAeI+pybetwYNyjst66Nq3BAOYJHgvUHXw0xc89DXD1nvZENXAiLl8UOD9
	WT5HF2iYBreji+Z76OxsQYA7NF/hPj1rAC0NNCohbifj9EigUH3K816n03X+1NVSIfDdrKXVvDnoe
	0h/fT+xVb7607Omlk6z40X36oimiZIyZKNQUgZlinhQSKRfe+4F/pEDPVjM6fb7RecdNV4ko0p77Q
	pcPAZrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkIt-00000005PCj-2sZ4;
	Tue, 27 Oct 2026 16:45:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkIq-00000005PCF-4AlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:45:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5161B15A1;
	Tue, 27 Oct 2026 09:45:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE2993F59E;
	Tue, 27 Oct 2026 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793119535; bh=rnhwTZUYMyNC6LhGd7EvjwdU5unqPfJSXAia5nseGlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGpMc23ZVSkzbfErHN7Z6gjPhpk5iz/QK3wltY10jtOZwCRtPdr/HxKYmEsipfcbB
	 CNjzr+i4WdRJeAIOwgWPDEAbVJg91iMEk0swBau4nbXuczwWhyUkvFKk3uwBKwEl8m
	 kLp4KuoApUVM5xVs7KKu3F5Bf4L/7bOOfc7gQrfk=
Date: Tue, 27 Oct 2026 16:45:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auDVJ0tuVyvGGh95@arm.com>
References: <20261015161054.357595-3-blum@kernel.org>
 <auCVj80cR8LILhXB@arm.com>
 <auC6CbIclUCJK094@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auC6CbIclUCJK094@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_094537_071560_B0D117EC 
X-CRM114-Status: GOOD (  26.80  )
X-Spam-Score: -4.4 (----)
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

On Tue, Oct 27, 2026 at 03:49:45PM +0100, Thorsten Blum wrote:
> On Tue, Oct 27, 2026 at 12:14:07PM +0000, Catalin Marinas wrote:
> > On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> > > __parse_cmdline() detects "--" only if it is followed by whitespace.
> > > However, at the end of the command line, it converts the dashes to
> > > underscores and tries to match "__" as an option.
> > > 
> > > Detect trailing "--" directly instead of converting it to "__".
> > > 
> > > Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> > > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > > ---
> > >  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > > index acaf56234973..38aa28d19650 100644
> > > --- a/arch/arm64/kernel/pi/idreg-override.c
> > > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > > @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
> > >  
> > >  		cmdline = skip_spaces(cmdline);
> > >  
> > > -		/* terminate on "--" appearing on the command line by itself */
> > > -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> > > +		/* Stop at "--" appearing as a separate argument. */
> > > +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> > > +		    (!cmdline[2] || isspace(cmdline[2])))
> > >  			return;
> > 
> > I guess that's more of a cleanup. Does it actually fix anything to
> > deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
> > no functional difference.
> 
> Yes, it's a cleanup.
> 
> Functionally, the behavior is equivalent because it also happened to
> work before. However, commit dc3f5aae0638 removed the explicit detection
> of a trailing "--", so I added the Fixes tag mostly for provenance.

Makes sense. We might make it a comment when applying rather than a
dedicated Fixes tag.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

