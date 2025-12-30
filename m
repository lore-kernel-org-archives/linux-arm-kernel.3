Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274CEE01FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j797tkRG/meb+wTyJA6C1cS77dXDDaZhFKPILW7Z/3E=; b=ov5unliJWrdbZfTfKi8aqvj3wa
	yfogUITxdjqnvn3GtRfzEl2rcOOJce3OUApDMc1LcHUbJmtoSNyg38l4+AXn4S5jgCotmbLLTAKYZ
	OtBM1Gn+GxAy/bQwbfY3EaH3nYZZbJiljdxSQmTgxxXC1yuw4yZPgu6/mipYxBVnMjnPn6YlosKkd
	oSLj3xSNH52UsnQj1fjYZEL/v+x7Cu3hhs+nj2xNwmFJUuLc/9ObJokgDFhrDVs+gWVFZj12eIR8S
	P82xWv8UOGe9BC+uYCCgyyhUBLnU7qejZubMNcwwn12I2ZdTmmhb3xNk16byaUU5EogwuVtTqUt/n
	cmvxdkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaaf-00000004vge-33mK;
	Tue, 30 Dec 2025 14:20:51 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaad-00000004vfv-0OMy;
	Tue, 30 Dec 2025 14:20:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0BEFF7A0120;
	Tue, 30 Dec 2025 09:20:41 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 09:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767104440;
	 x=1767190840; bh=j797tkRG/meb+wTyJA6C1cS77dXDDaZhFKPILW7Z/3E=; b=
	TmJ8ULiJvmNIrsm7/GvtPwWVBEZXe/TT6NFuBmOQkU/lD/tRK7XBevY+//lMCFI8
	rEXOOCNqAV5CTnU98ICu0cbX8MaQsA9Vekgpij9eJYc5Pr0p+cQEvMJlLVGaO5DU
	YE/964jtrClqjJITNZ2XGZnkpdoyX+lyXCQLB8HsfwsR+IJlNnAZ5/pBqn4mLEzB
	ouqaV9lcKzQeozNEQCaeiQvbjl4FVXXvW5NdDWGMzaDbmy8HoRNP+TMtad4XxhuR
	YaZBpOQskYevfD58woIkbYyi4yzV4wRF1lYr3N6lkv+AYHT5KokUFLie82R5TaS8
	ZXy/ffit3T9sYK9VPZ1vGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767104440; x=
	1767190840; bh=j797tkRG/meb+wTyJA6C1cS77dXDDaZhFKPILW7Z/3E=; b=B
	7ve9oP1gIacsmOjN2BBog6ts8ZcIMO99ncduZJMdIctIcFxsE49lOCWdzL0n4xF1
	RSHPauqOm5C8XjqZmPFs0DqLz0MFAFW0lhCfZMcj6cggyLeANVrjAcQvl5QaQrfl
	jBq3u4iaJpoCCQ1mLpYIuQoIDqWtZlIh01u2wkVr/LgHhCNAF5BqHWzyOXs1zlFm
	WzXc81JoC3SHCU0lWGjtcvA0BdNJhRw1hxk02OXAyr143A9cteyIdL/L0/rp3cMg
	uQvGnSo2Krh4A4x4p1kdgKGhBSnbaZ/VkZTNLl+5e6wxA8+9CT29KAQGGbiWzduR
	qAh1hbqbHiH8gUMAH6HJA==
X-ME-Sender: <xms:t99TaRc-_J89QObvrT1DXlX4054sswv-fCerUZP7AWJizWXjTFObaA>
    <xme:t99TaaDt8ch0qKpe3CrOm807rQTroRTEGXt3qT5kr0bsvK2EVh5X4fnX5A8LNqkEP
    lUlxHtRRp1jzlb78oLsriIB_Z57S0n4MjcVzznijj9TMYc1g5zqXYV3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdektddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhieehueehiedvffeuuddvveehuefhtdehkeetuedtffekfffhieeghfdtgeefhfen
    ucffohhmrghinhepuggvsghirghnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnh
    ekrdguvgdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepughinhhguhihvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvgh
    huphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgt
    phhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhg
X-ME-Proxy: <xmx:uN9TaQU688yxyFQjFfRyXYLltULsFccUVUb1W6KM8UxuvqMuW4XzAA>
    <xmx:uN9TaUJxajozySVRadHAkP3Au2LwIRD_01BSXq4Ehy7QM7NmSC37ug>
    <xmx:uN9TaYsYZwh9Yp85Vc6ddCcEika2HL2wFPknhPF8yeY9VK4VIROtKg>
    <xmx:uN9TaR3V9p54UXdeEQpPGfQh5qDmTwZX5rUgOKp3xZ-we4my2aW09A>
    <xmx:uN9TaYBaGDLq9ksEzojNYbTN5zN0nummAs1aIZ4SOm7rj4T5STlGSIEw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E30BB700065; Tue, 30 Dec 2025 09:20:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AeWvpOYieCaN
Date: Tue, 30 Dec 2025 15:20:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d2ad12f2-3d65-4bef-890c-65d78a33d790@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 2/5] ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8 reference to
 userspace
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_062047_461602_787B32F9 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Dec 30, 2025, at 08:10, Thomas Wei=C3=9Fschuh wrote:
> UAPI headers are not supposed to leak references to kconfig symbols.
> These won't be set when building userspace. Hide the kconfig reference
> behind 'if defined(__KERNEL__)', so it will be stripped by
> headers_install.sh, the same way other kconfig references in this file
> are handled. The result for userspace will be the same, but the
> exception in headers_install.sh can also be removed.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

According to codesearch.debian.net, there are no actual users of
this definition outside of the kernel, and there really shouldn't
be either.

It should be both safe and correct to open-code PSR_ENDSTATE
in the two file where it is used as

 if (IS_ENABLED(CONFIG_CPU_ENDIAN_BE8))
        regs->ARM_cpsr |=3D PSR_E_BIT

and then remove the definition from the header. Alternatively
it could be moved into the non-uapi header, or you can have
an #ifdef around both of them.

     Arnd

