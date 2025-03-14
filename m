Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D56EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxoNAJ8poPsMtUMQJHQt1h97zN2rgzRrd5utLd/+xZA=; b=4/whCQ1wonegNd6s08Trjawb7u
	6Sfkrm8kP1YRN9FhOc7lMkys/OlaimDgpu2Z+eugis0Eoi1Bez+3aDjFLS2QfeykrL8Mmk6VEKrHJ
	waZi1yVpgC9LKKdeM078CpG4cND35NLjRigibmbFP1Q1U+JzyFXRMJUmwq/3ta78KJc2592YdTukr
	+Wl7nqRvuNuAs94tl/EVjNS0BKDt9EB2LR3oZ/ii86g86Wn7kzR0XIX+0oTc5pv/2s4+SxeBbONUH
	06LHw2F0rCkj57WRHD0yDLM6U+o0/CwYqO9gnHAwgypty9CM0RAD4nIA3Jz362U2zLsf/S/DuFN4j
	L8T8IXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3On-0000000E23e-1BGT;
	Fri, 14 Mar 2025 11:40:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3GX-0000000E0Mr-0lJ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 875AFA45BA4;
	Fri, 14 Mar 2025 11:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D1CC4CEE3;
	Fri, 14 Mar 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741951908;
	bh=YgTxtawVTwqVrsIanp4JgigiPn9sO0G0cXdeTcArrgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drFHfaDfovZf9GOFxyy0AnpqYpfAaFkc0IL2UZ9ZetWEoaIY/veVHwSOY2zxe0Nmn
	 id/BsYalBwZE5wPD5lNAJb9rofUHb8FcbOH3C26LoaHt7QsmuY+zVRexeaBvTDAdr1
	 Hy09FVDAXlxbHOqyTgOTuBEcsyCFYU4I6m/oDKgS/wt7j0Jga5HscfjzeBI9ZkOjRN
	 nilFzqfaroEI/zXVH9+JJXEHmFBY+zUQ39ZwVWcoUFuE2P8LzeuiM4jL2+iADrj4M2
	 a39TxFUXv3CXfPY5kg7MYZOxYfaHdC6ANsw1j1UOlxF+24UTk7SrtlzxV0NCWDtskX
	 hXJoCoioAkE9Q==
Date: Fri, 14 Mar 2025 11:31:38 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Enforce whole word match for
 open/close tokens
Message-ID: <20250314113137.GA8865@willie-the-truck>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-3-james.clark@linaro.org>
 <20250313215622.GA8101@willie-the-truck>
 <36968527640d231882444ba7065317fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36968527640d231882444ba7065317fe@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_043149_290308_4A58AF8E 
X-CRM114-Status: GOOD (  22.77  )
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

On Fri, Mar 14, 2025 at 07:40:36AM +0000, Marc Zyngier wrote:
> On 2025-03-13 21:56, Will Deacon wrote:
> > On Wed, Jan 15, 2025 at 04:25:56PM +0000, James Clark wrote:
> > > Opening and closing tokens can also match on words with common
> > > prefixes
> > > like "Endsysreg" vs "EndsysregFields". This could potentially make the
> > > script go wrong in weird ways so make it fall through to the fatal
> > > unhandled statement catcher if it doesn't fully match the current
> > > block.
> > > 
> > > Closing ones also get expect_fields(1) to ensure nothing other than
> > > whitespace follows.
> > > 
> > > Signed-off-by: James Clark <james.clark@linaro.org>
> > > ---
> > >  arch/arm64/tools/gen-sysreg.awk | 31 +++++++++++++++++--------------
> > >  1 file changed, 17 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/arch/arm64/tools/gen-sysreg.awk
> > > b/arch/arm64/tools/gen-sysreg.awk
> > > index 1a2afc9fdd42..f2a1732cb1f6 100755
> > > --- a/arch/arm64/tools/gen-sysreg.awk
> > > +++ b/arch/arm64/tools/gen-sysreg.awk
> > > @@ -111,7 +111,7 @@ END {
> > >  /^$/ { next }
> > >  /^[\t ]*#/ { next }
> > > 
> > > -/^SysregFields/ && block_current() == "Root" {
> > > +$1 == "SysregFields" && block_current() == "Root" {
> > 
> > Stylistic nit, but could you just do:
> > 
> > 	/^SysregFields$/ && block_current() == "Root" {
> > 
> > instead? That way the diff is smaller (well, same number of lines) and
> > you avoid the ugly $1.
> 
> The code is trying to match the first field of a line such as:
> 
> SysregFields	ZCR_ELx
> 
> while you seem to try and match a SysregFields all alone on a line.
> 
> That being said, my perl-foo is sub-zero, so I may be very wrong myself.


Ah, and this is *awk* so $1 is the first field.

So my suggestion is totally broken and the original patch looks correct:

Acked-by: Will Deacon <will@kernel.org>

Will

