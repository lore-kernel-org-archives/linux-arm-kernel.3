Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A78FD5311
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+3BcJKrbmh5HDXIlppj+4J9SMA+tEFmqsXlBVhyu40=; b=2QTPIxyMdP0laH3TT37qabPE3O
	dRNXc8Kgkksz3XSFV06jIeKR/8fl/ECAYegkTp5GTEX6mFPFCJOvBsjOJpNt6uy9msmIXfbWrn4ia
	B6G8i7mndcg3PRE0bloBRzbE+GlrvUmZx2X0on11CWMng24x2JXQG0CqIz4/hXFd3/jIHkdNU7c2r
	E8lEsW/5nVRVqm/eRGeuokAnG/LzkVzQXoel1avnaCyfNoscL4TlaMgr+RG+zYd7jAJ8L/obfWFtr
	EWoh9N4q6WKU5InAhGD5+GsrQTMcdQMi1BQBzYzTChLbgWUmPNMubk+f5k0Mm/rZCO+DVszinlnVm
	74CBYI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtUr-000000081Z3-08rW;
	Fri, 27 Feb 2026 08:46:53 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtUo-000000081Yi-1sXM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:46:52 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 16B9E1D00147;
	Fri, 27 Feb 2026 03:46:47 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182006;
	 x=1772268406; bh=F+3BcJKrbmh5HDXIlppj+4J9SMA+tEFmqsXlBVhyu40=; b=
	cGvNnKUwExIKhugmG3txxHJKsmYF7sQOwK4ZFPWd3YWKyXSMYAvngw9Kh8yQdsV8
	AzyyVFf3ZJcdrfJii3QFpJn/2gJOVgaDRD3Vq73CDw9t2oQ3Ga/2zZjtv1gSd3HI
	ikm/fHOfDFZAOro++75wFTe4TXopEGt6Uzr40J9TaubVGUlWRILEYPwTQsarfFfs
	MWORvyQObYvojwJtpyjFEsmedVxXnd6i74sxVm7nAZm4zKFJlT9e74xKTWLiw7Xp
	OIqbMV+sQqtJJDXEVW8Fa4mS29pFJyOtM1dShfUT5S1f553juzm0b3MB16EDRJTl
	nDSSC0lC42tekS3HS1soCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182006; x=
	1772268406; bh=F+3BcJKrbmh5HDXIlppj+4J9SMA+tEFmqsXlBVhyu40=; b=v
	Sr2hfZw59Q8neZEcZ8v0I4dpVvdYjE/ofJV6gLELXY95W7UWgeb3aYrG2jUz3xpA
	wfpNl480fLte+YUDJ1QkekZGDlAUxwIqPKIetIbwpPD7HDTf7YGdbJEzLuFw5+e+
	UKJUmors6vDjbFQEve6ArLpuosycSVZl3HjGmuv0EQyCReWVsdV+YEl1n4KyTRSo
	eu5MRRfvy+K6g3sPPzjgqCtPPDiDg9YPmXbsekks8rWFjIrlcN+FS2Xb6YzFz7La
	ltqrX9F6WlzcP2WWoCSA/nf3C+GL3euJBrjiQZFzHqVv9rciY3gwrpt+2KpoAj6O
	OFVWk5sTPkhZ5X7+XnOXw==
X-ME-Sender: <xms:9FmhaQEMS6SVdcYdRZgW_kT1IO55F7UdfwskkFSJwNwPf3pQgqLR6g>
    <xme:9FmhaULWNyvqb-9if6HIEi9E8dBdfdgEeviL-8RAECb2NrSySW54U97ZesSYhui-x
    uBcI8h4j4xdxAtC9YJSYwM8ZL49_0HB9Z0aG4ob1JSwJbs9H2wE_PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:9FmhaTgeJf8JakorKAw7334pjkusPDME-O6xuYJGuiYYBToV_lIUMg>
    <xmx:9FmhabnUpS3zRA3x5jyvpdBF6zC2epEpxNq0b5cSVGVkIA5Dadq6kA>
    <xmx:9FmhaTFlQMPBza8GR8LZ5S1Fpbf-o-agGmzpPeS8JMDHtESMO1MRCg>
    <xmx:9FmhaVMP0saCF9AaIT-zzAYDh428TuJ-YSKQomKcDsIyI56PeTlk8g>
    <xmx:9lmhabF0NvNVXamTn40LHRKq3s_HXqsl0SmilA9rziUipV6RkGmWh2P5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C38D700065; Fri, 27 Feb 2026 03:46:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AC9z6Mxcl7jk
Date: Fri, 27 Feb 2026 09:46:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_004651_033881_3A90C179 
X-CRM114-Status: GOOD (  18.03  )
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

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> This configuration option exists so "that we don't provide the symbol
> when there's no possibility of there being a usable clocksource".
> However it only covers __vdso_gettimeofday() and none of the other vDSO
> functions which should be affected by the same circumstances.
> As these are more widely used than gettimeofday() and nobody seems to
> have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completel=
y.
>
> The removal of the ifdeffery will also make some upcomming changes
> easier to read.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
Fix gettimeofday() in the vdso library") as a bug fix. This may not
have been the correct fix because I don't see how it addressed the
case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
CPU without the timer registers, but I think we should try to make
sure that there is no regression from reverting it now.

> -config MIPS_CLOCK_VSYSCALL
> -	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
> -

An easy alternative might be to drop the entire VDSO in
configurations that turn off the gettimeofday vsyscall today:

diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 70140248da72..4f6fba9e108f 100644
--- a/arch/mips/vdso/Kconfig
+++ b/arch/mips/vdso/Kconfig
@@ -3,4 +3,4 @@
 # the lack of relocations. As such, we disable the VDSO for microMIPS b=
uilds.
=20
 config MIPS_DISABLE_VDSO
-	def_bool CPU_MICROMIPS
+	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)


    Arnd

