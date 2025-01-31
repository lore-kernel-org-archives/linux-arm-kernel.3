Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B5DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 19:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1Oq2awpWzl8pN+Yfslwu6iHpW3ylkSeTv0k6RL5fz0=; b=unC7G9kXyPO/TzFnqrmoZntkC3
	1tTjxWGfsPB2gpSB3G232gNXrys7yovJADvkeq7Rzm5j/mLSRbZurGjvBUuX1Z0DJI82dz6G39UPO
	kg4d/4oBNb0s6EvF03iq5A+fVSduopku9PRn9qvoRUE9eOUsiJuOCmpeVuv5YBUUnRnrrFJQXmHh9
	fKcsdrXCxFgTmMS+aOIsIiKiPs1ugoJVUcR9Wod3tOY4AxszgCpmvXy59izhJhclcZSEYfNb0njWa
	GjJFZOlfJKNHHt+KOlDksmnzRYj5GO7uMQuGQltqwFfEOhy8lPjGAbH1vhqjdqis9bf+AZ8A33iS6
	VIUmPMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwZ7-0000000BHLV-2xUy;
	Fri, 31 Jan 2025 19:20:33 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwXn-0000000BHFw-3xM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 19:19:14 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3A03711401CA;
	Fri, 31 Jan 2025 14:19:10 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 14:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738351150;
	 x=1738437550; bh=d1Oq2awpWzl8pN+Yfslwu6iHpW3ylkSeTv0k6RL5fz0=; b=
	Wnh90Mf6xrqZN+p2GBubtQNRzQcbytoMXOIMW1Mfu7FeyeQH6Iqhen/VpP75YqYw
	Yq/WVmBrz2PSR7A7D0ZE62ASHERC+EokTtAn70SzlC55D6xQXfqD1yOcahSt3sPs
	dZQrFN3G7J3ZPiC6JYCbKzk/eHJTfKl/80PlW+mxfpC729e/eQvGZLSFs0sgZmKv
	JZY3/LUPpSQ352FTB6UbjbVnhu12kPQIThban2xpNiu/t3osijtkm/qalk2Sc93x
	OfuFHV1fefX0ALB5wKu+cjmTk2nUHkTIl+fnqrr1I8pG3ygz6ByJDkZLi54fZTsB
	4VzgYoZmYkgbxGG9r7hp4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738351150; x=
	1738437550; bh=d1Oq2awpWzl8pN+Yfslwu6iHpW3ylkSeTv0k6RL5fz0=; b=V
	Q6tyt7cdxgnYAFWNma9c/opH0VWYsTY1Z29qSYxVHU+QMuoWAgghY5sJpxIePeJ9
	dGG6/YNSP0l1hfnC9PvBBGxkZUAfd29O2La1sCDvk0+35fRznQ0jpPHtK7z+cP01
	XSszqPt4oiYZIVLl7RWmOk1AGlUj7sp6lXrqQbYotmxoOCTRo1u894OBKOOsxWZo
	qI8SxtyMjrFBbbdN/QPV4omuEDYxCZ4hDzYtvXVAz9ktm9jYwNWM3gFlCw/SgWsF
	8M81vF7s/ICb96GDH6TsdtdotXYYJSd3QUHtWix2kT7smr5tg7Sm42Ha5z9xLaw2
	7ak2ozirbtyApTJCPIH/Q==
X-ME-Sender: <xms:LCKdZzmOX1dGpCeW8x-jxGiQIntAD3TCV5RT3-EsCnEp9EA2JNc22Q>
    <xme:LCKdZ23g-N_lKSZCiLjQRE_io98db2Tzi0wcfEImiHiQ7znM3XX0ltmwCXiYYnn7k
    PxyNre1sB3mudnvmUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeliedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:LCKdZ5rUdVhmLgFDheLOQc3t0d4L_2yXqe9g4n1XXM2XkSnhYOhvhQ>
    <xmx:LSKdZ7lNCVZ1AKw4MqbxQ80lkHuepbCD0kd7eFDKrwjwdnFqvujczQ>
    <xmx:LSKdZx0Smk49vdDv953HH9k9yiaPnLIJvPaV27UhD_bpKV12uh0BJg>
    <xmx:LSKdZ6tggj0tWGRu2VaTYxeE7j19sjEr6ZSkPdrSnw7AH0-9OAIB-w>
    <xmx:LiKdZw_azkzA9v1-mkNsWM1OLyHLhA4xAqRX6wWlpqZQFXvcZtTu5lwJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6F752220073; Fri, 31 Jan 2025 14:19:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 20:18:37 +0100
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
Message-Id: <45bc6648-5f3f-4d88-bbc3-3d5a0ff84386@app.fastmail.com>
In-Reply-To: <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_111912_857362_F929FE0B 
X-CRM114-Status: GOOD (  16.57  )
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

On Fri, Jan 31, 2025, at 16:34, Christian Schrefl wrote:
202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 
>>> 100644
>>> --- a/arch/arm/Kconfig
>>> +++ b/arch/arm/Kconfig
>>> @@ -130,6 +130,7 @@ config ARM
>>>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>>>  	select HAVE_REGS_AND_STACK_ACCESS_API
>>>  	select HAVE_RSEQ
>>> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
>> 
>> The ARMv7 dependency makes sense, but I think it needs
>> be disabled on combined v6/v7 kernels, like (CPU_V7 && !CPU_V6 && !CPU_V6K).
>
> That might be correct, I don't know much about the build
> system for the kernel. I've tried it and it still builds
> with this change.
>
> Also it should probably be relatively easy to support 
> armv6 as well.

ARMv6K should be trivial to support, as it contains the same
set of barriers and atomics as ARMv7, the main difference
being the lack of Thumb2 mode. The plain ARMv6 may be
a little harder to get right since that needs special barriers
and can only do 32-bit atomics but not 8/16/64.

As there is only really one relevant machine left with the
original ARMv6 (Nokia N8x0), we already plan to drop that
in a year, and I wouldn't put too much work into supporting
it. ARMv5 and earlier will stay around for a while longer,
but are getting rare enough that you probably don't need to
worry about those either.

     Arnd

