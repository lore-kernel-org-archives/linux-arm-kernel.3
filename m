Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A945E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=GiQ6L412nPycJbgf4pf9CK8AOo
	oICpyMLpHW4v+Yi6ler8IQNqufz0YjrQkPJpzcGajVGmCiMilyQEnAgDsTt72LZZvjr0MRCcc5HmK
	JUbvnDHrftRJ5w4+cbVJqv+yHAWPOtTvv9kcolIWBBIHmkCDNcMYotf+OtoHSzZRPWQQR9/P5fmNk
	kUw6A2goJDdW6HF3MCXlcE1Qgic7/XDGaghVZN4/cVYVjhJjf/DLKSoSOutd4R8Is0uvK2gQfVyzX
	29bLlGRPFj07a91Z7VyAPx1cd3ozkdwI8h+saa2pVBelaO/JC7NaX9aUyW7Ia1cb7aP0g8twnk30f
	OtxfqseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOglO-00000005dMd-4AM4;
	Fri, 20 Dec 2024 17:26:10 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgSx-00000005ZHM-1EDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:07:08 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D0B412540140;
	Fri, 20 Dec 2024 12:07:05 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 12:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734714425;
	 x=1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=
	cVwnjnieistFLbwIZ2ck2NZjatfgBOiKFR/kAQQ4K+FKRlL8KQQbjhZhOWU069zs
	+zgIU3AbXP9+gkyt95dE3SIBNNA3kvw4E6UfF6OherufYWAvX0YKfApKCxp2i6zQ
	77g1yeVh0zAyGNG0wE9mzRntgkKspASoDW22pp6IITndzi2lTJ4HKwNs5nqoii3w
	4+HCH21yGGTdbQnKhCQRJ8uTM84A67EBk6bF2z8ez9dzxMBOu+tSLlYPfnH3AMRd
	YFaO1Joe4dFYu/kUD9v5QjDF3u4hCIvbGv8Ior03+1p2/LvTO+X2ZwJGkdDw3QD0
	lNjjkbwJvjrkXka7ONY9IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734714425; x=
	1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=d
	CQGlbiemfZDolaPsSx6dIh3Zy2pEsHaBs/FZwjo7AmR7XFj4fZqn3BZLQdNw1iJT
	17ecwD/VcWs3jAAGF/y28KdkqdfS4RvC91W+gHU+NxdA07uf0Jy1dTliDTv2nve9
	uIN7IaraXNbD84wpTAQ3BQJ6F1LxqG79Bbx/yyD4aTv6AAzTy5aClB4clbt5FO2P
	bNAyX/j7Lb8biFooKHhqg6Y0ij1PqAFSytVswDMlf4cy7sk1Ilc7uzBMTfsTA/H2
	IUCSKaTPdpIAUeqgmK189ibMDmyW7sZqRv3FHL7xXnUDc4+A64Hmfa+y7OiZoAn+
	hI4XcznclYJ9zInqBynoQ==
X-ME-Sender: <xms:OaRlZ84R-kzFHFhkxsWwmtvoGpFX4liL6es0xQYwIJnB1iBIbzOgzg>
    <xme:OaRlZ97EVsjrhU7qvxO6iZHcXvuiYymsnzpAg2IH0XFadKew3I4Osk_NFfVU8vMWX
    Y7ShD4EnHxq3ihh1a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgleegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:OaRlZ7ee2TnH3FQ-LBboFcEmjH5NZAZmDHibOgB9dxwBhty6GDqMuw>
    <xmx:OaRlZxJq2G0x78tz8ranjIqb-HRx0z0Sc6uSXruoYjFja-nwQBHW3g>
    <xmx:OaRlZwIaTdUokn6guHcSSJk27WlOZv8Gly2XG0BNutc7tLGd2upGwQ>
    <xmx:OaRlZyx78E0kyHNq3r1UCyOgvVimBZkit4uOjMFCSjSgFHOvsIbixA>
    <xmx:OaRlZ9AwFtxX37i_8NvGG0tbPEz9bSRIyR74VdXQgqSEXJjnaCvnOuU3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15B872220073; Fri, 20 Dec 2024 12:07:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 18:06:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <c48b7e84-5287-4da0-84a0-7747581f49d0@app.fastmail.com>
In-Reply-To: <20241220125506.3157268-5-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <20241220125506.3157268-5-patrice.chotard@foss.st.com>
Subject: Re: [PATCH v2 4/4] ARM: configs: stm32: Remove useless flags in STM32
 defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_090707_647643_72F77816 
X-CRM114-Status: UNSURE (   9.86  )
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
> As stm32_defconfig is dedicated to STM32 MCUs, disable
> CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.
>
> Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
> CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
> image size for these platforms which embed a low amount of memory.
>
> Tested on STM32F746-DISCO board which embeds 8MB of memory.

Out of curiosity, what is the smallest memory configuration that
you see people using on stm32f7/h7 these days? I know we had
configs that kind-of worked on 2MB in the past, but I assume there
has been a lot of bloat since.

       Arnd

