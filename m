Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D1CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Vwn9sPRO5eXk4lNtjAHB9sj4SoIXWEcgGa4IAJMV2c=; b=n7hdN4ZngcJdKBZke2nuv5PBAd
	eg7xh9TcOezy6I1zJEQSXK8m+tx/hzPB/DKQxB79VHEnei0YFz0gCzzIpFjl3NLI2HQuLKNWKsuDs
	bUv3pKF5izuT7gucSebH7JDlM/pEbM943RCtec0050D1VlJ0BsnvQO4RrQJQ1ma/+kWx42Baz0qTC
	LSfMwPqhoz8m+9QK27Nzr7iEngdabs2jtXZTzTBknG9ssfgHsWwCZyHBhzNbuj+CR99p+IqMsIwlH
	a2jPG/k90mdmeufempMxk3EN1xMJHHXNwb033yyVVxlZxY/Mlc1BzZWJvhBleHlaD1gM1baG7mXDM
	FulmtEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhDo-00000005jB3-1vtr;
	Fri, 20 Dec 2024 17:55:32 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg9s-00000005VB6-2FAU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:47:26 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id A338011401CE;
	Fri, 20 Dec 2024 11:47:22 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 11:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734713242;
	 x=1734799642; bh=2Vwn9sPRO5eXk4lNtjAHB9sj4SoIXWEcgGa4IAJMV2c=; b=
	iP9uhXBCxVGpcfYFBt207T2nrth6YwPzH7dQoG1qT5qevs6d4YoYdjWTakplF/zV
	L/oP3JPYRhD3HIwuIIIDsTN1QRs2m8gySAYsMt3YHnZ+VQSphAsQbC6QDk1Q0qcX
	lULVZOdr3Goe1SqAq5Bl+vJeDhpSUYsV5qCnLcBgoh7TBn/Lf1SBry7o9XVeawDK
	9d7RaS/c7oDqz49L39pQpFAr6hPu9e5Eo5Ncn6og+WzV+3B8yEmvF5s2UcRIcnIp
	l2pjajI908rkwTSxvKPgbO9xXVcRS9UR6v8pCfMZFK6JKeFIZdq+N/c02kVxZz2w
	DZl1+Na65bmofS+68QxXBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734713242; x=
	1734799642; bh=2Vwn9sPRO5eXk4lNtjAHB9sj4SoIXWEcgGa4IAJMV2c=; b=M
	AxsBQ4HIpcH9/5msVU/NdbIfaU1VYVkWcaiYLZtpttmvfnK7dtft3o7XKsRaKhCb
	SHeSFjTC8AuvTrz6T35ZRmcRjdYI315BtrNvNuoJczcN/aWuZhUA9A9E6v5b17+a
	omOmfHIrC4k2QFUozKpAUdrUql5yY2m9myuiNzkxHSh1jnWOZn4jpe6zIniVrh2V
	n8Kkc2SUVpdWrnwR/w55gkc2QajbNheElu/FVcurgnWVy3gPe4XIyTZ6ZxPK4AY1
	Xgo4SrcCxSH6fcNVB279v9pc9fQ9ePMQSmCb2t+qWcPwHlgwB6I9dNAZbTxyuukb
	xTZQA0qjT+SlwIjGfQQAg==
X-ME-Sender: <xms:mZ9lZzMg3hFefTeRsmLQIIKcU5CnbwsS-ARE9nSnmWk5GLCdmH2V1g>
    <xme:mZ9lZ9-je13yHkgQVOIERT2q_svlSdVEbI312NCqtqafTUgelUKTQ_2cUWPPgJ8_D
    _8obROLuVUQuGfw92o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugi
    drohhrghdruhhkpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhs
    shdrshhtrdgtohhmpdhrtghpthhtohepphgrthhrihgtvgdrtghhohhtrghrugesfhhosh
    hsrdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtohephihorg
    hnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehlihhnuhigqdhsthhm
    fedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-ME-Proxy: <xmx:mZ9lZyR4000kkMqIPe6HcbMy5Isv4Nf6VEfMQcLEHrLuDXbbPB3DNg>
    <xmx:mZ9lZ3vrDV_WE5VSHAYyOdfLZF4A-5a3QaKNO8JnIvZ8R8R_S8FSWQ>
    <xmx:mZ9lZ7eJJfYKEzcdurHJWUc2o4cdmHiXTjYvny44R8WqFRskQrLGGA>
    <xmx:mZ9lZz2pUK9WfJmxtEL_WDJ6pltcdA3qr_hY1c9pDKOSzmlXyl-8wg>
    <xmx:mp9lZ8X37WHXI9_v-PXg2wdPQcTcCSfmpcBhdxl8W-KuJxogGlRLepcK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5A682220074; Fri, 20 Dec 2024 11:47:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 17:47:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_084724_945138_02C01ECC 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Running "make savedefconfig" highlights that some flags are no more used,
> remove them.
> Remove some flags to reduce the kernel image size as STM32 MCU's board
> embeds low amount of RAM.
>
> Changes in V2:
>   _ squash patches 2-7
>   _ split patch 1 in three parts and add epxlanations about flags removal.

Looks good to me, thanks for the update. I assume the plan is to
have this in another pull request rather than me picking up the
patches directly, right?


Acked-by: Arnd Bergmann <arnd@arndb.de>

