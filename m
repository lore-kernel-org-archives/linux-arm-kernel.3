Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F415BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQZPrnDuGftEtbnqTGVPBifdVscC5mec8jxqTDh+SJM=; b=1HvfH3E/G/wApwDJeQFUtD4p6d
	S28F5n1Su6wbR5nG2t2GcjUTuL61unnetWGn6rrrXeDqeLq/ikNcAK0CORhCVvT2jrdx4FDS4zBe5
	UaQlEUkGSaKi0DYvFLSO5JcqoVxgt52frS1++RCRp9hzmSWfULL51UnDq0lNFgnYoQRtt9KWtHbqJ
	iYF7zhymEqjNS5aDNpVXENDli0YlEAoNFQ7N3d6cnNE1W/J+7tE8E6vmD+Uxl5eRyBFWSNV8DP80a
	lfKtsrPBhHI4VbcrrWB/ILmMdLRvQr0EaX/7E1AcKkAZQDq+QLWnxIKgI1K9D2aiIz99eiJCz8Ipe
	XgRDuwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Lr-0000000HHCx-48WJ;
	Thu, 03 Sep 2026 12:15:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Lq-0000000HHCn-3geQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:15:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CF786022C;
	Thu,  3 Sep 2026 12:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E7C1F000E9;
	Thu,  3 Sep 2026 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788437729;
	bh=BQZPrnDuGftEtbnqTGVPBifdVscC5mec8jxqTDh+SJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wlhg71sEdsZ12VOuBMKYZ+OVPWHR/+2qU3Rz9ebiVUVvBe7WpKVuelJcjp/f4b29g
	 TvaIJR7Bs94UulLQXVkUtxPvBuITBUbf8griasJlRHwVlIxThtbW/abkXrDWPSqgoj
	 GvsBJuxmwE5Rp0A4BaDO4rkO1HnG/xcQvGiivdPlhajCQe8tNk48XFKW5cVSrCzO5a
	 XBxEdnl1Zgl/vKnVppsBHS1LxNE7qUmBtm+k00PB060y3Mh2EwJiThCrltiKrDSoys
	 rAJCaAwHob/s9uZglPOtos9vt2YwyBKVPLTGIlpjF7I7qXIz87dpoB4c63gVX6XZeI
	 yM2S6inSkCX2w==
Date: Thu, 3 Sep 2026 13:15:22 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sven Peter <sven@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel
 sharing EL2 for Apple Silicon
Message-ID: <aplk2hHRB7Yw9FWW@willie-the-truck>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
 <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
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

On Thu, Sep 03, 2026 at 12:42:39PM +0100, Mark Rutland wrote:
> On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
> > On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
> > > This series adds a custom EFI table that points to a PSCI entry point
> > > (plus some other stuff that has to be available before EFI runtime
> > > services are set up) and adds support for this new conduit to the psci
> > > code. We can't directly use the normal EFI runtime path because that one
> > > takes a sleeping lock and we need to be able to call into PSCI from
> > > atomic context during e.g. cpu bringup or during idle.
> > > It also adds support for specifying the specific MAIR attributes for EFI
> > > runtime mappings as defined in the latest UEFI spec since Apple Silicon
> > > is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
> 
> > >       dt-bindings: arm: psci: Add EFI conduit
> > >       arm64/efi: Add and parse custom PSCI EFI configuration table
> > >       efi: Add EFI_MEMORY_ISA_{MASK,VALID}
> > >       arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
> > >       firmware/psci: Add EFI runtime conduit
> > >       arm64: dts: apple: t8103: Add PSCI and CPU idle states
> > >
> > 
> > I've picked up patches #3 and #4, which are useful in their own right.
> > 
> > I'm not sure if the arm64 maintainers will want to consider this, but
> > I think it's a reasonable compromise, as it puts the abstraction in
> > the right place.
> 
> Sorry for the late reply; I've been away almost all of August and I'm
> slowly catching up on things.
> 
> As with last time this was proposed (in abstract), I am not happy about
> bodging an EFI conduit into PSCI, given that the manner in which state
> is managed is completely different from SMCCC.
> 
> If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
> that's one thing we can consider. I don't think we should pretend that
> it is PSCI.

What do you have in mind for an alternative mechanism? I understand your
objection to this proposal, but at least it keeps the interface fairly
high-level and avoids opening the flood gates for a bunch of SoC-specific
idle routines. Are you thinking of extensions to the PSCI spec or
something else?

Will

