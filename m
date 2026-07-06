Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ACBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NgRHxctsTPxoUyR9GQ4f9QJgwWXpv4L/6p2ewn7Ais=; b=bH0fjrwQWXl/dCeB/TRxOy3+1a
	vy4mVdY644nLbgGRVH35rvQ5HAHb0c7bMfHJRoi/x92QU70h4c5uL9gQtLkM6AOHgiG5mQphN5ZvQ
	yjFESv4oMCKi+4AjaJl6+8i7/cBqBYSdFSpFjSlq2s45hnue5EGTfE9RcDDb0KfO8SuzKV358Ua+V
	oAtQ38/Jx5BrvZlyQcNJYJXMYV3kg67MANH/UxdcWlaK6s7rAOy8H9ksk59XqP8r38eCxF3OBdOlm
	HkZSsFWOiLJ6CptFNUXrrKsX1Ol79DyTMuTfTiCVmdZN+RcepTW6LsV3F0vcyveOuF7KNrJNN9hTy
	8jsjmBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdBT-0000000Bf35-3aHb;
	Mon, 06 Jul 2026 06:52:03 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdBQ-0000000Bf2J-3Edb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:52:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 82E377A009B;
	Mon,  6 Jul 2026 02:51:59 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jul 2026 02:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783320719;
	 x=1783407119; bh=0NgRHxctsTPxoUyR9GQ4f9QJgwWXpv4L/6p2ewn7Ais=; b=
	JAVtt0dZwEUX4jmhTkZJRTaw7vY7mAdxpczUZbqBThl0pIMvepIUSGtbMQrHKp/l
	3fBLHmQX8UoZTOVuJLyVAB9Oj8k5K8fW8LwELhywb+/xEo5VLD8X61wYlWDL7ACn
	NExtQw/ICm7O526GTJRrsIgM5xVcQoTP9sdhxfuSawAT35+JtJaKgRIjSFmv1yFb
	ghgVIrHvGAu2aE2h8gR0VfQR9EhJv/s/59xvW+1AWrZo/WtFRrh615M3/bI2HB9s
	lORDXDH6Ikrx+2m+n3IUqAiJDOgx4AHomESUsWGtoT0hrq2B0Y6717aRX06k1J1D
	JyCxwsVxRpclAke0kdRaxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783320719; x=
	1783407119; bh=0NgRHxctsTPxoUyR9GQ4f9QJgwWXpv4L/6p2ewn7Ais=; b=q
	rBPg9qhv1U7RwVKTeCkx0mQLaQjrXGs14LGWaaq6R3AjXvmxOcGtTk1Ln5T3lqAx
	0WN7GrDC4yycaFZrPHz1BgM0K+W/UsoaYXW3tJdT+6rYVZk/tbhOwt/Bz9ZGhAUd
	ESzb6B9N79PAxn01/bidxOJHYH89a4Ft8lkUgpJL++st7+PjgF0fFJLC6zYpi+w8
	PPSzus26a1Qi/InbDfOmQRrrOYR9tKQLQ+wOOzj9Pk7uQtrzAKbrZDtNmtrdvJbP
	z2HUJZ3rVe1isjsm1ORCVNh6OQ2sKpNIQ3/iEDgAT172c2AnmgmH75UPOERIRYdk
	G2NUhCscha9kD6vyMSjaA==
X-ME-Sender: <xms:jlBLauW9jj4hSlsjYnZXxxc1w_6J9qvuERQR_baGchkFFcS9hOaylw>
    <xme:jlBLalZsDWJ3LrjagWaULqtuD-eglBWfWoS9Ua6TTk43K1obZF0yqgw_nrlApXJJ2
    Tr2f_tAZL3IX2910Embtj_SPjU5J17NtjdHBJiwcy_N72_7FcVB0PA>
X-ME-Proxy-Cause: dmFkZTED04CFhy1s05JMFOCCkbEX2PSxzqKY2P54CvKh2fnCFT3gOAR45IdpWaA2eWTpp+
    VcgaOEImNhNzNk496602jhKWemln2LjFzeQHlxbehkTQF6ZqX+sqEa6Ibkxbke3m+ZE73h
    7a21jBImbC2T6FcoVdexMRHW6Dg3l4/5nxRSm5ok4Lmnhkuq+YHzq3t3+mWqY6RZofw18N
    lmMLeGO6mZBkF0EV66CSJ/gyOL+Gbx1DQxSjDr+oIJF8jHfu+3iDnGu5yl0D99dBpvHKDf
    +qcYDwBtMy9FIgw/bLC5z9Fh3LmcwJEOMBrhZiN/GJaTqrkoiH8sO5qys3sUBPThX1Joa0
    yag4mwvum2i66OEtgLQxWKn2hyOHrolLJ/G3AK4+iNHbsKIGG38FoqKqFP7P6HTUbAK0nk
    vetsDVBGNXJBFdco8tQT3n+d3DS6XB50Q/+59I2Z6FLjKqGQnP5cS3Ye6nKpSG6QTqBo6w
    fKMhi6RiECKiRRXuP+spnCrn5XLp90MuVPPdVfpIsAOo5TdNLpHKBRfKdYImehaG6zUBiB
    qIKPm5255a+APXowELbcgKkuCDQWewnmOWITYWpLfJahVsmHnlS6ExBk/aLegELK5rlZQz
    f1mShFueOkZ6xFY/NrJrQzcO8JShjA6By88KasO/GaegaZd9shjVYnurKbjg
X-ME-Proxy: <xmx:jlBLavH_KQDIFAGXrVFIbWAOg2YfcblyUa287jUUw9ZPSXmRlrGNrw>
    <xmx:jlBLau5ftPBahO0h9PrIXRfgQZAz1uwKBmpcWl9RCigriGsVmbiHZg>
    <xmx:jlBLakyBguV2m2ga7Zs4Sou5XLPueDs3_2lZzD0iPTpwzbyaHgBYIw>
    <xmx:jlBLatMKWCBboK5YPylmwOwTzGwAbKLsD61hgIFuKaFF_WaQG8hxtQ>
    <xmx:j1BLaqsQNzmgEIoySJqtb0G5VnZTwMjRRjQZVH6W6Iojv2YxUuiJv9lR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9DD54182007E; Mon,  6 Jul 2026 02:51:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9WOz104Gfyk
Date: Mon, 06 Jul 2026 08:50:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
In-Reply-To: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
Subject: Re: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_235201_291886_0DAFA138 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Jul 6, 2026, at 03:29, Dmitry Torokhov wrote:
> This patch series converts Marvell Orion and MV78xx0 board setup files
> from legacy platform data to software nodes with the eventual goal of
> dropping support for legacy gpio API and platform data from gpio-keys
> driver.
>
> The series registers static software nodes for Orion GPIO controllers
> during gpiochip registration in orion_gpio_init(), allowing board setups
> to reference GPIO controllers via PROPERTY_ENTRY_GPIO(). It then converts
> gpio-keys setups to software nodes across MV78xx0 and Orion5x boards
> (Buffalo WXL, DNS-323, MV2120, Net2Big, QNAP TS-209, and TS-409).
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Dmitry,

These all look good to me. Unless there is an objection from the
platform maintainers, I'd suggest you can send them directly to
soc@lists.linux.dev for inclusion in 7.3, or alternatively
keep them together with any other gpio-keys patches you have in
the input tree if that lets you finish off the platform_data
support in the driver more quickly.

As you probably saw, I have sent the patches to mark all these
board files as deprecated in 7.3, with the plan to finally
remove them in 7.4. I don't think there are any users left,
so it probably doesn't matter either way. 

Are you planning to also resend
https://lore.kernel.org/all/20240819045813.2154642-14-dmitry.torokhov@gmail.com/ ?

I think that is the only Arm board file we'll have left
in 7.4 using gpio_keys.

       Arnd

