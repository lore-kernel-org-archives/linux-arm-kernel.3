Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE396E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+IMBLM4U41kKgRvFiSq4x/aDvCnzjCMF1l8hqPeff0=; b=cDU1RGT0D+ZsT7x0ydhwmdG+gS
	fmCOL8Nl0qZdsG1kKkZv+esTE66Y1sKvxnqJi1anO6M3x4lS6qCz3Kkap470uRhI4EhdWI8q2KD1P
	DGnAeqX7dZY/N+gZW3b9ZnfY7yWAzrNufvfboxx9PkgWIu9ZhQNfhzgCy0rl2co9ogL4K0bylk67Y
	RC2gzn6W8n1yQtk7uDbxXd3EDdeTLmyeGm+OvzcEjo+Loz94+LiaxGhicMftOmsnFhbLJC+OFVzKA
	DdQQmajvqw08Ltl3kLwgPehMh4LPhyTLfve8mnyqNqGWyljZP+Jl5dxFWu9YFtDb35da1TuiSXnPb
	SNNzmFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRJF-0000000CnS1-3caD;
	Sun, 21 Dec 2025 21:49:49 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRJD-0000000CnRS-2SSw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 21:49:49 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ABB2A7A0070;
	Sun, 21 Dec 2025 16:49:43 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Sun, 21 Dec 2025 16:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jmay.us; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766353783;
	 x=1766440183; bh=1+IMBLM4U41kKgRvFiSq4x/aDvCnzjCMF1l8hqPeff0=; b=
	idmkJZpw99YFCVVnJ4jojUegdS9blxxGYtD+rLNYGwkRPDUm4t3U2NsBKpZUElLa
	+w6NkOxv7lmFZsfdXoJJBW+NqoW2CeVTRfnhetqUCcrMzqRbLCSPqhSTSNEnsGJX
	qDo1qT3v0ewHzHUeTbQ6dFUZfeQfPaLRmNGlJMcD5RZqNjGt/0Oz8pm/xESBCwbi
	3aGcKU5SgMlOwuXXaIKyRHoUjSuGObwCptCmgAUtq4EBGro9rh9QjhGcYcduvGqi
	sr9FFCv4P5R6ikv9YbuLjeS/AN6gVHe2Vhp/oadYMWTdCtMXmEnN9s93GXibv0j3
	lQAaqZuOTNanpnCWR3BPlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766353783; x=
	1766440183; bh=1+IMBLM4U41kKgRvFiSq4x/aDvCnzjCMF1l8hqPeff0=; b=c
	N3Gf7XFkjmtgLgky447e/pxXedMFKDFSpSsTa+55yvYD0dUvvdhfdhZMNB8JC1hm
	HE1Zh9w7DrZbLuLOS0/STVwtYphtIcTar/91CnWuRXV+vbZjIrE8fj1ZaF4zgKw0
	8umn5MU/JWS31+3Yo4ctR6XcQXKeGstia0GNEoTQreT8n+/zUPoQGu7+twaJXwyH
	utwMJtLaBGpir5bc5wdadJSh73m+6aD1NloDmQGJsUUY5+4Wl8wQhpkOBr15NcQe
	0HrtLCV4j/7+NidiQqa29P0Gsb+Sn/8bktWnE/OkUeXgwIghCcX5TLI6VTrrkVbL
	N7AT1huQcaY503d483EOw==
X-ME-Sender: <xms:d2tIaVewh-o9TgVESZQvK4028DpLjoicHCuvfQjiwpT-8Ojzk00LcA>
    <xme:d2tIaeAS96ElWzkrCMZKtLVQq9abm6iV1mcTNZQlmHicm28BwMJ6D6fJuwyADXNa5
    1Rf3mkYZNA01JdDM1tkr_VgQHXBSvQCEvbHS-V2O9qstI15LQn3cEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehhedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflohgvlhcu
    ofgrhidfuceojhhovghlqdhlihhnuhigsehjmhgrhidruhhsqeenucggtffrrghtthgvrh
    hnpeevleehvdeiheffudekffejtdeffeeghffggedvteevffdtvddvffevvdetgfffhfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhovghlqdhlihhnuhigsehjmhgrhidruhhspdhn
    sggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrg
    hlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheplhgvohdrhigrnhes
    rghrmhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoh
    epihhrohhgvghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjrghmvghsrdgtlhgrrhhksehlihhnrghrohdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhpvghrfhdquhhsvghrsh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:d2tIaa-2XMguZXZw0ohNW9OyR8ERMCpIGdIyH-S4oXfMExaaxnirXw>
    <xmx:d2tIaWsAp6e1IWIPG3xpiMOiK2xWLho5auDRTH6ouyhPUo-CDcSNew>
    <xmx:d2tIaSOg4huBcvhAQdTF-DaFHo_eWKUo2ekmYzq_CNOPXTl9VyBQrw>
    <xmx:d2tIaTiBVajAxzRPrZkfFh6iieaE3bJIb4too7lEo74Dlp4H-naItg>
    <xmx:d2tIaWby7W6ntYRgE6y2s-AvvFjRR-7ZAZWsiF_n-35H3TXBwhEJ2QLa>
Feedback-ID: i86164869:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 34BFE15C008C; Sun, 21 Dec 2025 16:49:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AvQW3Rw2Mc4g
Date: Sun, 21 Dec 2025 13:48:56 -0800
From: "Joel May" <joel-linux@jmay.us>
To: "Leo Yan" <leo.yan@arm.com>, "James Clark" <james.clark@linaro.org>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Ian Rogers" <irogers@google.com>,
 linux-arm-kernel@lists.infradead.org,
 "Linux perf Profiling" <linux-perf-users@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <c8161700-ad9d-43d3-8c45-cfc110ebcd49@app.fastmail.com>
In-Reply-To: <20251215112818.GB681384@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_134947_999187_4C18D8B7 
X-CRM114-Status: GOOD (  16.39  )
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

On Mon, Dec 15, 2025, at 03:28, Leo Yan wrote:
> On Mon, Dec 15, 2025 at 12:52:24PM +0200, James Clark wrote:
> > On 15/12/2025 11:33, Arnd Bergmann wrote:
> > > On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
> > > > On 15/12/2025 00:12, Joel May wrote:
> > > > 
> > > > Hi Joel,
> > > > 
> > > > There is a similar fix on the list here:
> > > > 
> > > > https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/
> > > > 
> > > > I'm not sure if commit 1 alone will also fix your issue, or we'd need to
> > > > collapse both of the commits in that set.
> 
> We need to apply both patches in the share link - we need to apply the
> second patch to revert generating unistd_64.h in libperf.

Yes, applying both of those patches will mitigate my problem.

Neither of those patches update syscalltbl in
arm/arm64/kernel/Makefile.syscalls though.  Based on the context in
scripts/Makefile.asm-headers, it looks like syscalltbl is always intended
to be relative to srctree.  So, my patch increases consistency, even if
it's not fixing any known problem (after the other patches are applied).

Whether headers are dynamically generated or not, it seems like this is
something that can be improved anyway.

This is my first time contributing to the Linux kernel, so please bare with
my ignorance.  I don't know whether it's acceptable to consider patches
that conceptually improve something without an actual problem they're
solving.

Thanks,
--Joel

