Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A6D6D231
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMTKICLAk8Ul19wYWrq/UHHGVaNn10wFQLO8Ht338L4=; b=GSWyW29vjdznl0Kbo5urtCHL5o
	/tvegJXNuw7mXCDxcg5dv70Yp0vmrIBHj0NK6zZlHmdkjZ4TapnImxrSCiT+zY0sJcMzOlbQvqAio
	CoWJz8u+jCmtAh3rYeJCfL/7BGOFu7u6jy3Uic9CbtnJ+cBlsPLAxoWwCcqLdTee3NiNZgqrJaWpm
	cDL9QqpGrc9Jq48XV0Dj0yUXaCFnMrNZzI34Y9K7uHwbU5RORCQsLEhrO1iA6Y+KmhxDqzfGcS1ly
	/WXp7sbkcOj8V96uXr95oLa1BZev8UJpLoGjajjeyt1WZadHeD2DGdj+NTOs0vG0Mr4WpyJRasCqJ
	SkQVWSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNlp-0000000Dwij-0DpV;
	Wed, 27 Nov 2024 19:32:17 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNk6-0000000DwRW-20HY;
	Wed, 27 Nov 2024 19:30:32 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0A9F51380756;
	Wed, 27 Nov 2024 14:30:29 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 14:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732735829;
	 x=1732822229; bh=PMTKICLAk8Ul19wYWrq/UHHGVaNn10wFQLO8Ht338L4=; b=
	fD2zUlVDRIa6UFm+LgOzMT9Zp9jJvynzA2AtXaUueyiT1VXO0MHD0GHhMHfyCICt
	mTeuNlqUl2p6BX3M9tcPG4Egw8L4SYmcdKDrQQxYPy8sE+oE08fj9cPUUJzBEbRh
	Gf51HgGfDcJE+O2czHENn4LQ4HuyXQ3SL2XwQ8xbZDXIfORO9Xe3M+H0B3sIFWeR
	9uM1TD9ufZsT4WzTwdiODGBNs/mSXV+R9I2/8/OvcoJYnYYBxQ/PoBj4cSLEE+5/
	lqMS9+GVWRWyKrbhC6RPqb0JB5roS41BjNUtwpUhij4FdMSUiemlSNU0XnRfxKg9
	4dtkBKPpqKxE6QhBAoGBGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732735829; x=
	1732822229; bh=PMTKICLAk8Ul19wYWrq/UHHGVaNn10wFQLO8Ht338L4=; b=H
	5pOV3yHAV1aXVBIGJ8YQfrresq2YqIFjtLtk/Fvp/XOj+Kv4v1SPbk3zFZRySLBV
	LJcxdnyBlc+keML7Yn5jCPmXjKvygEp16dKnymIdFyOk74Gs0ynICO/sgEe5zL2r
	uOZhhiiKEjnhGDs4YMmtakiqoEF8axEJHBcZllBkP5WCO+GlnfzSQZQV6LqJAJ+P
	CWGCdpkfmrbn2mykq1XNq06ss2ZhtsKFMB+yWhInrf6KT9WEfz9HLzw4krbu5gGy
	HwA2rlysZk3IV2LH+eeQtjHEZlw/AR5pjR9ZkQLKV4Pjar9J1I3ZokxEJEiz8Ipr
	GaC6aK8AiK4LyB6I8NcrA==
X-ME-Sender: <xms:VHNHZymJ-B8FSBgSfNQtcO69NdeQHxiqYGUcfnlKXKRESNgSDlNTXA>
    <xme:VHNHZ51Yzy9o5AQpK6W2dCEGc1soTxW8zeBaqrdPpNhc9-IcaqEG3TdqRQAHTyHCq
    O5SkLpHzd23bbilMpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisg
    hrvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdp
    rhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpth
    htohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgt
    ohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshht
    rhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrmhhlohhgih
    gtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:VHNHZwohAnM6qcGvYt57x8rZYujNQDRAXuOvGZJFQ7FzDqB3MRsTTg>
    <xmx:VHNHZ2l5skdIkAlbpfZ3uoruVk1hadaOboTgL5v2EayCDq2mudDMKg>
    <xmx:VHNHZw3MIRdevzqJejuGzilVwfBFRQvJJD21Nq8Tcdx4pbpz708zvA>
    <xmx:VHNHZ9srmhntVifpTVlUnu8iACTzYA1YER8tWYne4F4_YrwFUAa9Ww>
    <xmx:VHNHZ5t7dwmXGd_wtkgHJ4-mlfxy7bHCgRhToztkEPC_dHMpKqOizRo3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7D7EF2220071; Wed, 27 Nov 2024 14:30:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 20:30:07 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
In-Reply-To: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113031_187189_24628ADC 
X-CRM114-Status: GOOD (  16.71  )
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

On Wed, Nov 27, 2024, at 19:47, Jerome Brunet wrote:
> Depending on RESET_MESON_AUX result in axg-audio support being turned
> off by default for the users of arm64 defconfig, which is kind of a
> regression for them.
>
> RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
> COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
> necessary for every axg audio devices. Those are now deferring.
>
> Select RESET_MESON_AUX rather than just depending on it.
> With this, the audio subsystem of the affected platform should probe
> correctly again
>
> Cc: Mark Brown <broonie@kernel.org>
> Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency 
> on RESET_MESON_AUX")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 
> 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>  	select COMMON_CLK_MESON_SCLK_DIV
>  	select COMMON_CLK_MESON_CLKC_UTILS
>  	select REGMAP_MMIO
> -	depends on RESET_MESON_AUX
> +	select RESET_MESON_AUX
>  	help
>  	  Support for the audio clock controller on AmLogic A113D devices,
>  	  aka axg, Say Y if you want audio subsystem to work.

You should generally not 'select' a symbol from another
subsystem, as this risks introducing dependency loops,
and missing dependencies.

It looks like RESET_MESON_AUX is a user-visible symbol,
so you can simply ask users to turn it on, and add it to
the defconfig.

I also see some silliness going on in the
include/soc/amlogic/reset-meson-aux.h, which has a
non-working 'static inline' definition of the exported
function. Before my fix, that would have caused the
problem auf a non-working audio driver.

      Arnd

