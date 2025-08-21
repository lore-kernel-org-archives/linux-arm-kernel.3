Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4094CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsToxIhs3qij5k0TlvhYAZ6ZeEs2xGKM/ioIEqWZzi0=; b=1neA9asbrn9dF5MCeJnwqsvzuD
	1J4trnzpFcpqNzHFQqv/0ZX3jpBwgfngCBR7Pus9zDJQAboqSofZV0nsT1wiHPH8LNEKwDEF43nLj
	IAnjFau99v/TZR0AsfK1F2orKZft0gYxkTrBtEZHy2QWCNuEt5fH2DtZXeFh/cB/ViGcA7/xBVH0F
	OvgqbUj9HGzAvF7RrznJ9daF7l2HJ3MlQmO1CAIUoJArapbYALMQlXITYONVjQjYqGELIZLdfHtOf
	ujb6FJ1fR0n7Ul7oEAoR3PmxwqHne79mwqCIVA5ObAAHLIYXgBiQR7rodFWGEGBuspDLvYu4H+wma
	Us/ND5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWA-00000000ucw-1dRH;
	Thu, 21 Aug 2025 23:16:26 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Au-000000004zf-3f5L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:34:10 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6CA347A0118;
	Thu, 21 Aug 2025 13:34:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 13:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755797645;
	 x=1755884045; bh=EsToxIhs3qij5k0TlvhYAZ6ZeEs2xGKM/ioIEqWZzi0=; b=
	abHDYrrA/vmmbFsqKaWsekyFjqAQenTF53Q4QMvPFjsVbkp1+Nw2b49jaggY3rPS
	fVGfmin6KpS7A4zUDqkdvuXC6l/lvAmmNbaRzXD5wiDQmuWN6qSm7fEEJBHhBNSn
	hYzX8SH0gYiqg74oSH/w7JnRlkWtemnUcC6UjZPtxAuTNLYEn/n3tuRPuf10pvJV
	DqhBk7N+Bpwyttk13jAx1AGBO9NFrg+RHFlEa3ufXu+ZwiS8Ra810ndDetbLtZra
	PptpXllnirUJcm4h73jxY94zm+4dMI16L2TnYoup5k3lfpnDbkSf4WiaSSNUfR1+
	DrKWBDneywXdOCnxiNPRjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755797645; x=
	1755884045; bh=EsToxIhs3qij5k0TlvhYAZ6ZeEs2xGKM/ioIEqWZzi0=; b=D
	XvpxP7s61Tk2DhKAMJ7igPM6PTTHbsNykDIqzSiD97OJu2IehIjrnMG4v7oNodzQ
	0evzIvcLGai2qyT4Lh9giL5OxlqWHHbp3TbtpS5flAwQ/ujygtj+nSi1v0C3T6DM
	XEjPN1HLMztypf10XzF5z9j5h+BFe90Lj+AdZwMIkxTt59X7YClCH8+b55npyxru
	/O66eJadms/0qROA7BqKqjwkiX41Uu+1mVH98rxT123TdnaXltKkp4fox9RvgwUG
	Vv8Rb3K7tcjsZSOPO8XHg0mJetGn2CdSsEohGg8w3+iNwQrI1X7c2Quxxw1XJjqx
	em276y44T8SEtJus7BbnQ==
X-ME-Sender: <xms:jVinaG8bqCOpLQI3bpwxqGge9bNpEQb9bXBczVj8z8qDXDtEotP30g>
    <xme:jVinaGuEgwsJgPkENPrXdCs87CJ-I1T-SRSbEm86jwhlBKdJsM9j6yb9Mp17Y38P0
    V81DHsKv4C1QoG8Y1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedukeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrd
    hmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgr
    shgtihhnohesrghrmhdrtghomhdprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvg
    drtghomhdprhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    fihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhroh
    hnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehlihhn
    uhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jVinaK1915WI_Khi3OEhczruA7TAKWAB1bnxcikbU_ZTj2ds3zIjgA>
    <xmx:jVinaOrsLBKftU2e5p6s5_G0Y2gzLwH20MI3TIQe26r9CsrkQO9PFA>
    <xmx:jVinaJMCf-UKUaYgJMHwdLJQ9daLWh0_Rw2JlGuv5dAPTA-Lom-Dnw>
    <xmx:jVinaHpjjiC6S53VBrHRZ2nuiw6B_Etq2cVQmiLVe2ljgnETfscq3g>
    <xmx:jVinaA8KpTCkerWWNO0Q22sHlynbYhiWvnxV71zCih9jDoBrOaJpl0VC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EDD80700069; Thu, 21 Aug 2025 13:34:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARsIESC0lKmw
Date: Thu, 21 Aug 2025 19:33:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: "John Stultz" <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <8eac39c8-9db6-4dd8-92bb-3dbaee9d80ea@app.fastmail.com>
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-1-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
 <20250821-vdso-arm64-compat-bitsperlong-v1-1-700bcabe7732@linutronix.de>
Subject: Re: [PATCH 1/3] arm64: uapi: Provide correct __BITS_PER_LONG for the compat
 vDSO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_103409_112912_3639EB44 
X-CRM114-Status: GOOD (  14.43  )
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

On Thu, Aug 21, 2025, at 09:56, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LO=
NG is
> always '64' even when used from the compat vDSO. In that case __GENMAS=
K()
> does an illegal bitshift, invoking undefined behaviour.
>
> Change __BITS_PER_LONG to also work when used from the comapt vDSO.
> To not confuse real userspace, only do this when building the kernel.
>
> Reported-by: John Stultz <jstultz@google.com>
> Closes:=20
> https://lore.kernel.org/lkml/CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8rSFvU=
0fpurrJFDg@mail.gmail.com/
> Fixes: cd3557a7618b ("vdso/gettimeofday: Add support for auxiliary=20
> clocks")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> +#if defined(__KERNEL__) && !defined(__aarch64__)
> +/* Used by the compat vDSO */
> +#define __BITS_PER_LONG 32
> +#else
>  #define __BITS_PER_LONG 64
> +#endif

This should be fine as a hotfix, but I'm worried about this
coming back since there is not enough isolation between
uapi/asm/ headers and the vdso. We've had problems here
before, and arm64 more likely to be affected here than others
because the asm/ headers are not meant to be included from
32-bit compilation units.

A better approach might be either to build the arm64 compat vdso
against the arm32 headers, or to change the vdso code enough
that it only needs headers from the vdso namespace and not
include the uapi/asm/ namespace at all.

Unfortunately both of those require a substantial amount of
work, and are not an option for the current release.

     Arnd

