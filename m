Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE4C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 07:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a015or5h7JL8tqNC7E1K5CmxYio91AFRJMKPQrlypmY=; b=ttIlK8iciIC1ki+ickI9/eJ6y8
	2hU/rFC8UYQni1RnXhl51d3ynA5Ej+dPag2VU38elpqbBvmHwUGsr+5pFeawks/hnVSZCiSzr6oW/
	Vbf7cOV3j/xuQ2dFrpay03q4IUNsNdnX86nijenfKSNXvskcxf+d2jP00ee1QPcpHFjWWS71j413R
	mZKKRXrArg9+YN2LrIBAVe+Oww/3nNjLudrJ8jobPx259q56maKiR94FDpG2qQXPT9NlpqrAR8NeO
	avQdqbbXTiIz86TwG3XmeWPpiyOTqdGqdhtTaUos4Xx7yM3XwKHSNAWHXSIDBnIQVDT0Q4gosRuLO
	BpYvPGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdlfc-0000000A8Vq-3ziv;
	Fri, 31 Jan 2025 07:42:32 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdleI-0000000A8Rj-2vpu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 07:41:12 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35A0F11401A8;
	Fri, 31 Jan 2025 02:41:07 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 02:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738309267;
	 x=1738395667; bh=a015or5h7JL8tqNC7E1K5CmxYio91AFRJMKPQrlypmY=; b=
	p+EsdHEWP3ACTepGzvls4c/0QwGbxx3xvN3QEaZZHaoYBy36hl5JS782NvbP+5gx
	FQy/BYFtAl1h4TuHKji+nemnFcmbzGGFGFhZ8bgg/MW+KK3QkRbq/Lq4hQFRvUKN
	Ad/fYhn2iVQD7GsuGgLgfgDYB6Qh2IJrVRKWhZhun5+G2BWg2f0kik7ZEvZrhaM2
	yAMgzFhY9ctaQNkrsXc0wzGNr3w4n2YzGTPvxqoLjBt7iCL0LIbsvHJ2l+sFYHbz
	inWU2TgAO8ygzAKmUX1r+n9qpoqeBfYBwAntKortX9vuwgB+8CV0y/lMmMZbf3hg
	sP2dPlegAFnwCwir8+xhjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738309267; x=
	1738395667; bh=a015or5h7JL8tqNC7E1K5CmxYio91AFRJMKPQrlypmY=; b=y
	8oIAD6YrPt6RaDC4iEXqaoPMZ+rLP2Ot1ta/e7SAdgMQykevbTxws2acg6axZF2N
	DMEfncziUV1jLpm45YwpKL0dsQx3tJM/Ksn2p4S9pH5okoFuGYMi1HlBHkfrVodA
	CKFecCatC+ukmvC4b+BeZpQwWFrfFmKYdscVV2EmW1k/Q7xl2yx0CHyY+RaeSOsk
	XQTbASk1e4Xc+Z8Kss0q5GUv7oaFzHPATdYNv7JDdWf+RTegBe0Gn3VHCJ4rLOSZ
	n3ZBhaNp6/f1qXRjhqK8W4FL80s7obekgu8EsWZQ/U84cxTq5JkdGIvhvA7l3ZhR
	r6663SOfOHtlkdI++0ncQ==
X-ME-Sender: <xms:kX6cZ21fjPiVWWY0DiU5VCer0YajY4PqS6DzSHKQr8qhWdUrtlPyvA>
    <xme:kX6cZ5Gr8rcee_p03TnsWmCC2csbc2lBp9zhfTvpPga803EWw6SG7XJuOrNS9jcCT
    DJuWHIFDcyeUKinqfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrghmihgvrdgtuhhnlhhifhhfvg
    esrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdr
    uhhkpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprg
    hlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhf
    vghnghesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsihdrshgthhhrvghflh
    esghhmrghilhdrtghomhdprhgtphhtthhopehguhhpthgrrhhuugesghhmrghilhdrtgho
    mhdprhgtphhtthhopehthhgvshhvvghnjeefsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:kX6cZ-6qgze7ifRuQzdyUrUdU56UridTMZY33I91Py7f0jAzwicdWQ>
    <xmx:kX6cZ30H7SoCBveuIx8sGPVZItlQ62zfZN4Ma5ndKMsqfGE6J30dUw>
    <xmx:kX6cZ5FCJsXZ0-VxPQ3rqhxBgyXcq7QujXzSqjdIH398l68MRkdQpA>
    <xmx:kX6cZw86q-3LudYSqNIvo75vywydI1TG6lMKvsmXr9H6WDc0P8YTfg>
    <xmx:k36cZ5NRFc_rKWh0VOeaglgwkSnb_mnbkvBBtgJGtBxgt_RkhDENHa5O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 67C552220072; Fri, 31 Jan 2025 02:41:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 08:40:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Jonathan Corbet" <corbet@lwn.net>, "Russell King" <linux@armlinux.org.uk>,
 "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Geert Stappers" <stappers@stappers.nl>, "Andrew Lunn" <andrew@lunn.ch>,
 "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
 "Sven Van Asbroeck" <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_234110_820007_D9608419 
X-CRM114-Status: GOOD (  18.16  )
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

On Thu, Jan 23, 2025, at 23:40, Christian Schrefl wrote:
> This commit allows building ARMv7 kernels with Rust support.
>
> The rust core library expects some __eabi_... functions
> that are not implemented in the kernel.
> Those functions are some float operations and __aeabi_uldivmod.
> For now those are implemented with define_panicking_intrinsics!.

I see you are doing this part the same as the other architectures,
but I don't see why it's done like this in the first place:

In C code, we really want to get a link failure rather than a
runtime error in order to catch those bugs as early as possible
and fix them before even trying to run the kernel. Is there a
reason this doesn't work in rust, or is there a plan to change
this later when the existing callers of those functions have
been fixed?

202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 
> 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -130,6 +130,7 @@ config ARM
>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7

The ARMv7 dependency makes sense, but I think it needs
be disabled on combined v6/v7 kernels, like (CPU_V7 && !CPU_V6 && !CPU_V6K).

      ARnd

