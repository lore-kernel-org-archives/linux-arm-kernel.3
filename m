Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC9C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L67AfugbK6S5Wt9f/sHrdUMhkKNobB//DXK8z9JUhBQ=; b=gD2Rkk1Hzalww+GiheatlZzGm6
	pej+RkbR7k03uH9NK+p/MyKZpek9c7jx/o5lR7bhaj4xFzSkkPTUn5eyWprmAfmyGxjdlHshfGi8q
	6VpTcN9RP/tyu64IcVxxsPVO3aPI59nSOjqAXTo3jJ6wYCjFI42JQIq4AWUKRdMJnopeSBQQu6AAU
	je4Zt1NHRlY9yOXgP58LAdeQv94ff3GGnwgSzNCrp2aKYXEzLF+GAfQ4AIbC3oA35dt6PVJZRpcYt
	xtT2g8nFUXX3vqh5x+I9BB4/upjKCVDXNbGu/Ike6YLzvPWD+55XBjbYNPs2dzOK8Gwup4kys6aoA
	4ZUwTRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qE-0000000HEA1-3iKb;
	Thu, 03 Sep 2026 11:42:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qC-0000000HE9R-1rKD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:42:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 468011596;
	Thu,  3 Sep 2026 04:42:41 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65C403F7D8;
	Thu,  3 Sep 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788435765; bh=siMXG41iJ3X/vqbf8RYp8LNhM43Y0Ves9W+OMagA4eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4o2G78xVRbsEO8NNa92eegrUnoKRBkTQi5AK6Z+uyRztqM2xYpbSXDOO3g4HxV/d
	 W90CrGzaqSvWPTyHSZfMLw7Nf3Z27pletfVGLZwuwVUni4e2ZVUjRQ/BQfh4zPbzAP
	 y2n+SDFMuPdpwTRzFydlZNGoYWT0LHGwitc3+Aa4=
Date: Thu, 3 Sep 2026 12:42:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel
 sharing EL2 for Apple Silicon
Message-ID: <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_044248_523513_FAAC5607 
X-CRM114-Status: GOOD (  25.58  )
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

On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
> On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
> > This series adds a custom EFI table that points to a PSCI entry point
> > (plus some other stuff that has to be available before EFI runtime
> > services are set up) and adds support for this new conduit to the psci
> > code. We can't directly use the normal EFI runtime path because that one
> > takes a sleeping lock and we need to be able to call into PSCI from
> > atomic context during e.g. cpu bringup or during idle.
> > It also adds support for specifying the specific MAIR attributes for EFI
> > runtime mappings as defined in the latest UEFI spec since Apple Silicon
> > is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.

> >       dt-bindings: arm: psci: Add EFI conduit
> >       arm64/efi: Add and parse custom PSCI EFI configuration table
> >       efi: Add EFI_MEMORY_ISA_{MASK,VALID}
> >       arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
> >       firmware/psci: Add EFI runtime conduit
> >       arm64: dts: apple: t8103: Add PSCI and CPU idle states
> >
> 
> I've picked up patches #3 and #4, which are useful in their own right.
> 
> I'm not sure if the arm64 maintainers will want to consider this, but
> I think it's a reasonable compromise, as it puts the abstraction in
> the right place.

Sorry for the late reply; I've been away almost all of August and I'm
slowly catching up on things.

As with last time this was proposed (in abstract), I am not happy about
bodging an EFI conduit into PSCI, given that the manner in which state
is managed is completely different from SMCCC.

If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
that's one thing we can consider. I don't think we should pretend that
it is PSCI.

Mark.

