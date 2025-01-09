Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B26E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VJ2LE55e7WKjgSs0Z9QRHW4bskzk/pdBRzNAdaUokw=; b=XEcSsq0KxqIt6QkJfzFpSTxSPz
	bSkMbsmwEWLMjPsJ6mRwhUUeRlDB/JuUB1MgluvxZnsDFm8LRAT5bUFjw/z/DpUgCV9+WO/vw2FkW
	OjnA86PrlJkUywzxOnh5Jx2x7HvrFbl9joIAQWllarV4+zAAHqyVtF0Fvi+3hRQ+NUyzUfTPBCruh
	guwPyWTc6WZ2bO2CSnj4oHeY8x8JEUcAz8ExIhw1Zjm4NgJfJuNlrJ6YVlcoeZvILlknzNDqyZO6/
	4L+14rRpsdDFG0zKKqvOkgorLB4s6K2K3UcmLnB8qeNlfbzSJ8+86OPNOUCnFgfIeAE3wprGp/dY7
	n4I4luGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq7m-0000000Bb7z-1Wqb;
	Thu, 09 Jan 2025 10:50:50 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq6Y-0000000BaxJ-1NHb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:49:36 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 84C4D114016A;
	Thu,  9 Jan 2025 05:49:32 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 05:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736419772;
	 x=1736506172; bh=4VJ2LE55e7WKjgSs0Z9QRHW4bskzk/pdBRzNAdaUokw=; b=
	ebIvzsk62xUMNlMjBu9sJAMm9Td8vqAwaHO9TMLfNzhKdJhBGKMFGO9Hhmm+heS0
	prNCxt429yQ5vnM1NsysaM99UfZD2x/jUt4SaWOM4QA36w9sNeG2A5PpqN6MeGHZ
	pWtlkdpfJcScCFGaDfqOpZGxgwHUiIJtcz/ycqiLUJ6sW7FVGTSMzv7dZixm1khh
	+6ZYZlEia0z53wmKFwRjLx8xJIz2qJ1lG21mPZiUZFrpWjsf7PWOsmKRIVE553rD
	6IGfIX7Ah1iU1EqtgCFygzBIbzEeuDgdpaQIW5poFZntDaOwEofwgYEz1S28uFUT
	DCvLDpi3TlVB2Rjf0zbF3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736419772; x=
	1736506172; bh=4VJ2LE55e7WKjgSs0Z9QRHW4bskzk/pdBRzNAdaUokw=; b=q
	53kOrkvO5G11JmND8Wor6aLTkQZAU6JeJ7Wbt5QZBjWH10VEZmKhXgLMm8Lqx8jN
	6aTQ1mZV245AZa2nv7Qof8lxy+c+SLXeQE4uX5/tUsKcAsNWMNVQiC7QSPAQRXSy
	jxWBt4UX0W3g4r8Yz53CuE1hNY3SYCB6tTJQT+qtxgMGUELMJkuRnGcY5ytvVQc6
	DY1HO+XlZqqYC9dnetmLhZg8OTh+z3CiTPOB2dDDgBxoTnCay7v5aRQnEJcikGOB
	6GwaafNTzv8sD1GiolWANuL6sZiOVApU1aoDPGDi9ONDLZKM+X8dv7Q5KZqM/IaC
	B0QxClTFmosFaXUzSRLBg==
X-ME-Sender: <xms:vKl_ZyyuoqbaX3KhGlldO7HkJQSaEwypFqujJ3KOxFtqZSoLVsgXcw>
    <xme:vKl_Z-TMRRwlACArMnAzzjDKdh4i8ZmdLhKYZoSmbJ4jbSAohHoLgodHTklMLR_9G
    bP7QyccTD2QcpaMBVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrsh
    esrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:vKl_Z0VtXVFe2P2-hYRzbbZYWiebYWbS58iESSOdfCymmonECi5Rng>
    <xmx:vKl_Z4jwcmu-S_UhWbOdlB1nDIcR081N6hNJgVm3-W-5SQPxrO40hA>
    <xmx:vKl_Z0Beru0BSgUFG7T32SNDyWTCfH3Aapqlgx3SvEN7ga38SWkDTw>
    <xmx:vKl_Z5I90r8qs_YnIRNwAssKzLLHIIaFh-0ZGQItrkUsM_SnYDRPVA>
    <xmx:vKl_Z39pxFLfhaEeBYq-6IgTuvRIc3Tje5W_pXhHUJvof9ilEDbflRDy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 254A92220072; Thu,  9 Jan 2025 05:49:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 11:49:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <faad9d05-a3f7-4b05-ba88-4cb4891879df@app.fastmail.com>
In-Reply-To: <20250109104636.124507-2-thorsten.blum@linux.dev>
References: <20250109104636.124507-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] arm64: Remove duplicate included header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_024934_954930_B4F61774 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 9, 2025, at 11:46, Thorsten Blum wrote:
> The header asm/unistd_compat_32.h is included whether CONFIG_COMPAT is
> defined or not.
>
> Include it only once and remove the following make includecheck warning:
>
>   asm/unistd_compat_32.h is included more than once
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Arnd Bergmann <arnd@arndb.de>

