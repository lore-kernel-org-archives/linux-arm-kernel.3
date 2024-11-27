Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E7D6D231
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g141tCONTqB5hpfb+ItfP7sq5bc8beb7Ysknq11Dyc=; b=qDBhK9ilw5msfHEGiqrrAPGdlG
	xp9mdN3UjovBfi/0fKrrqIQqcAeosQZXMZCWH6YqX9o+IShhfPpYVGcFK4X9iWDw97BdAE/nE0gBe
	EflFml0cVthA9LWCM7Fbt2rsoMtdPUOgurM6b0Pgp3uhUtMrkh85QufniFUcRSdQaOqMJGOQooAHo
	/SjWRG2El8ct9FgPW7z2H8zPU5Vwf0+MW6xpnbqIxLCAf4QQe1zVc4NZlqzPPQ1YwO8gTr4XBUiUd
	jxareowfSic+PFX6Rf0koEztzExbnOVOzcB723ibn7AYD1iEL9SDqocMYiQlfzCOln/wZbknk6Nmd
	n0S8hlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNml-0000000Dwxw-2sez;
	Wed, 27 Nov 2024 19:33:15 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNl7-0000000DwZF-3j3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:31:35 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 4AAF113801A0;
	Wed, 27 Nov 2024 14:31:33 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 14:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732735893;
	 x=1732822293; bh=+g141tCONTqB5hpfb+ItfP7sq5bc8beb7Ysknq11Dyc=; b=
	siZX0ijyS3KKZQCQM11sRK0aYL/UGLpWhzzNoHuhzO9W2scObICm0ksLv3/1yCfV
	WekG2ob/DsOMJvkCJhpw59Z91c5gjT7/Hr1yLXGM3cZYsWVfyzxrOmUQu27YwCC4
	ZZ5tgKl8RJBC0L2qgFANSSiYCxDiroZInomlUPIiPwN6v6E0if2v6UAf2Vyu3Cit
	MbpbrtvrgEklRco0Bbk/+Ug/j8qawVqgW1hB7OmebHKcvmWIbThrmcg1hEtCkdy3
	3P4OJjlBpi5S1d8Ey/7b1CiLix44Zl7zE07Pk+yCDwKS/LlU0jLeBEZHG6ftf2Es
	4l1ECrUGI0xSUL/H1P9AJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732735893; x=
	1732822293; bh=+g141tCONTqB5hpfb+ItfP7sq5bc8beb7Ysknq11Dyc=; b=2
	+JaBt9xs18XWLsAsQ+VisxWQtvO2htE5bTFmB49/EBkz/pJKBa4LH+63jf40WmXK
	YVyAtYofNRfrLkfFZoBBC69LAjULnPC1fJSopQXuYBFHSXG+NWYmUP/OqSMD26El
	x/wN9s4hkj/CgQZrHc0cN0Hhw+QPIYYA27+OdyzTMFN7aFaaXZQPxfV+kDL72IqO
	1kKmVXCk2pc38sXxNtw1pbEUUqckYuH8Z8B3c/UP7muzErSXMkdqcCxcFgtyvmPs
	nQmsOWOHGWtnG3hoxt5orEzcSOr+gPVHh0gu+5McRpxzy6+KfCZbpdb8kc/lvEmX
	zNJKC1/M4kLPGlzgBTh1Q==
X-ME-Sender: <xms:lHNHZ2M3pV3CO9sxbtRIO-ydbzLs-oGasGR6gaCS_w9x-p8ex7n-dA>
    <xme:lHNHZ0-jVYAkQkFl9EmMuU75hN57JMA8yOuRNyVOz8uIBiFFNeTzfsDeMJR0usHHm
    K5rljsq7l9FB8DWQi0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehf
    vghsthgvvhgrmhesuggvnhigrdguvgdprhgtphhtthhopegvshgsvghnsehgvggrnhhigi
    drtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphht
    thhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhush
    drfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehsrdhhrghuvghr
    sehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:lHNHZ9TaY5tMEt0Ui0Dot4mCBCtUO9P_ld7HATWIcAkYpw29Z06dPA>
    <xmx:lHNHZ2sQcrgJVpCZTa7eHzLLyAvJn3F472FTnKiZmIetMyVV7fdWIg>
    <xmx:lHNHZ-fjOCzxTyxuf0bZWQSbCTvmkextzTW8FxTOKRIZOIOIsYEyCg>
    <xmx:lHNHZ60v1dz30FzdC7rla7_oL4y7H_RbrZlRWas8VAVKhGB6DvI5NA>
    <xmx:lXNHZ-4hqGZTt3JHMK7QxYK5TEXZ_OB_8VcxGo4iGfsvd9bB_Y3Aj6VB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 314472220071; Wed, 27 Nov 2024 14:31:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 20:31:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fabio Estevam" <festevam@gmail.com>, "Shawn Guo" <shawnguo@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, "Guenter Roeck" <linux@roeck-us.net>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <f65d65b3-b60c-4c5c-a002-81370821ee1f@app.fastmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
References: <20241127190605.1367157-1-festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113133_999652_95D695FA 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, Nov 27, 2024, at 20:06, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: 
> https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd

