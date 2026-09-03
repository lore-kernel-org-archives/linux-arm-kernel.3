Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1azHr/pFB85CwC7zH3lRMPgTlUgrQQX8vJrLWV7gSGU=; b=j/h4ZOQ8DH/rmdYJsWilUb4pu9
	FJ4Z5bxUIQnp/kvRUtEGPbrQlmAlHirjj85UCK6QKiMrqNmTL5Q3nL0mpt6kXLx1NKDE9tH3BSi50
	sueYQ6SVhAHoRXyLAqFn7RSBJotd8Tv86naxcA4fUp9PJfStiOWxcMAUUvt4W3ROA11WlqowPEHoK
	fFM49xfElLhLQ7/cWw4OJ/XY643RnVHwDcyutBFlka+aVgDUBdnHliC8LEmm6ictQV9P6rzN759x2
	23mr9GtWfGQFljbyK0kWkX0b7ymBXEowg2CGr8esFKdQxjzlFVBTQw2K/OPZjDt+4Iog40/jiVENk
	pioyCp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27Rb-0000000HOWP-1hqS;
	Thu, 03 Sep 2026 13:25:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27Ra-0000000HOWJ-2nBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:25:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E76044781;
	Thu,  3 Sep 2026 13:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF701F00AC4;
	Thu,  3 Sep 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788441930;
	bh=1azHr/pFB85CwC7zH3lRMPgTlUgrQQX8vJrLWV7gSGU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=iAScSK95bfJe+nKYfXcOiKnM4KisHtUhGA+EturTjomDTIr4BnzSTRK8OrKh7rQZa
	 +qNnkB8/KnXPk4a3UpOfEzbTV2lL+LVfGkoB9D/avwcXIBmI5bnKSgB/Tocb/4q4NX
	 /EwvjO5Dzmi4vA4kfKHkv3atdg4JsxQWSvxLImqzRVBBGV1s2myp8FGlKc5OPkxEjr
	 qoe2V+4QHK10sVjGdfXb7Tnjaufa31M28N6/Cn1CGBDbrlsvb/UxwSso2CQ1Ljvksg
	 JP6u7ziLCN86hAb3w98fdqocurNPVLmnjDZQjrViTpksRD2PIeGWWzt1rx1Ow+wmL+
	 HI9Oad3TBBO0g==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A95751980054;
	Thu,  3 Sep 2026 09:25:27 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 03 Sep 2026 09:25:27 -0400
X-ME-Sender: <xms:RHWZavYfB9IcqusGjjKg9YIjxTlGMDDVrZvksuer_zpwFsHeyaTzMQ>
    <xme:RHWZapNzFnoX2Q_vFyeWpTgHR63mSfzpYfEI8YU1p1B9UyyqCtKPM3A_2ClDO_hGf
    l15SZ62eBgDJHQ5GzSqmVtvmhiNm3uToZuJfS4eUM-it5ZAXI3MEmNE>
X-ME-Proxy-Cause: dmFkZTEBFahIaOgOchPvaJwkXi7OrDv/Fnn0kYaKRFOEQRaWDfkT+vLtdbOL8paoS8OOHH
    K5JclVIP75Um7tw21sHpu+ivQkbbHsI9NinbZp2VtxElur3ErbPWsd6GhM5viQMbvfjg+A
    0XA5KuxNYyJUpb3RQMWjV9dfEbe7zol+JOpzrfHexm/Zy8IMysnQ3g8NCXY3aBUMyTlH8Q
    2hHgvvWDRqoe1QAV1OHtiEtJreU+h+Ei6lPFEuruNeGyrouHtVol380KIeytBS08KTdbcG
    eTRvwCZXSYmlUrz/ZhWxvNyCaPPXouWq5siTiP7ZtiK9NrhcKLq+g7VGX9CXhLRQAZgdrN
    SksStJUoSUqOHF01TnOJeBjyug63zIvag1oGTCTXpZNrIu+sDDXZhKpj/XMg6QrHLfqcNk
    1dzRN0rwUXSm4CQXQ8xbwhs6hbwM2Y5OZ61HUEaP8ZZqbE++tDYWO0U/ws3fN4vf9L/0IG
    DGM502U78C15At/aU9FhO5tDI7eQW+2hAJjkZWxty2R6i/ODgDtgee0PsW8SnNTcm1QHzg
    hurkRkTMCkNKqNC3n0hsHopDmQI5V7LDIFVxRWYvQ1KMrdvmRS/NsVFFL3RkYnzFXKYlAd
    0cIV1/ixTMoY05S07kcAgmRv81f+iTKXId23IsEE53rjXVTmjxECGtRCd7MA
X-ME-Proxy: <xmx:R3WZanwLas00yLMNlYOuic2WR4zFwZzmBuwtPUx2G-dtfVTJJ9bCYg>
    <xmx:R3WZap8kbv0kRlsByFuEDBcQwUm-SQy43hkfLRp6CceCgdmauGLPDQ>
    <xmx:R3WZan8kII6MPPoPwX_T-ZQT1cRBfC528oFpLUqi9lbpvMmk5RqqBQ>
    <xmx:R3WZasc_tsgnbDREW1sS2PsNW3bpJqfMruw51VLAwCTvKgCAngPrkg>
    <xmx:R3WZajsR-dqZDeJSqnSl5cvXn04GCZ9y20d62gSDhBDPvnzwNO3qvdBg>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AC653F8007A; Thu,  3 Sep 2026 09:25:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 15:25:04 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
Cc: "Sven Peter" <sven@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, asahi@lists.linux.dev
Message-Id: <eb75b82a-8910-4198-b89a-5c8b487c0fd5@app.fastmail.com>
In-Reply-To: <aplk2hHRB7Yw9FWW@willie-the-truck>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
 <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
 <aplk2hHRB7Yw9FWW@willie-the-truck>
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel sharing EL2
 for Apple Silicon
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Thu, 3 Sep 2026, at 14:15, Will Deacon wrote:
> On Thu, Sep 03, 2026 at 12:42:39PM +0100, Mark Rutland wrote:
>> On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
>> > On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
>> > > This series adds a custom EFI table that points to a PSCI entry point
>> > > (plus some other stuff that has to be available before EFI runtime
>> > > services are set up) and adds support for this new conduit to the psci
>> > > code. We can't directly use the normal EFI runtime path because that one
>> > > takes a sleeping lock and we need to be able to call into PSCI from
>> > > atomic context during e.g. cpu bringup or during idle.
>> > > It also adds support for specifying the specific MAIR attributes for EFI
>> > > runtime mappings as defined in the latest UEFI spec since Apple Silicon
>> > > is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
>> 
>> > >       dt-bindings: arm: psci: Add EFI conduit
>> > >       arm64/efi: Add and parse custom PSCI EFI configuration table
>> > >       efi: Add EFI_MEMORY_ISA_{MASK,VALID}
>> > >       arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
>> > >       firmware/psci: Add EFI runtime conduit
>> > >       arm64: dts: apple: t8103: Add PSCI and CPU idle states
>> > >
>> > 
>> > I've picked up patches #3 and #4, which are useful in their own right.
>> > 
>> > I'm not sure if the arm64 maintainers will want to consider this, but
>> > I think it's a reasonable compromise, as it puts the abstraction in
>> > the right place.
>> 
>> Sorry for the late reply; I've been away almost all of August and I'm
>> slowly catching up on things.
>> 
>> As with last time this was proposed (in abstract), I am not happy about
>> bodging an EFI conduit into PSCI, given that the manner in which state
>> is managed is completely different from SMCCC.
>> 
>> If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
>> that's one thing we can consider. I don't think we should pretend that
>> it is PSCI.
>
> What do you have in mind for an alternative mechanism? I understand your
> objection to this proposal, but at least it keeps the interface fairly
> high-level and avoids opening the flood gates for a bunch of SoC-specific
> idle routines. Are you thinking of extensions to the PSCI spec or
> something else?
>

I can't speak for Mark, of course, but I could imagine EFI being used as a
conduit to provide a callable set of interfaces (with a rigorously defined
set of constraints such as the ones in this patch, i.e., reentrancy, no FP
or SIMD, not relying on ISA features that the OS needs to know about and
enable, etc).

There is prior art here in ACPI PRM, which does something similar, and this
also relies on EFI runtime services.

You'd still need to implement the CPU ops and a cpuidle driver afaict (no
expert here), but at least those would be coded against an interface that
the kernel itself specified, and can be made as generic as we choose to.

Not saying this is all great, but it might be a worthwhile compromise to
consider.




