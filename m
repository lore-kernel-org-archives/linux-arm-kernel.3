Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE94FDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8OlnfIQ6DaoOFXqEFv4KaZ+j1lhQuHlCxjm4TTzoe8=; b=sGwGuG+cr4E9XboH5QVXgvxXGB
	aKxGuGBdNbtgqNye5KnOzDZh2BivfUXSdoQwoL5Pkzd6METKsCH4v4ygmKFnJWWvWxaxj5y30zc0W
	FIZF1orYaruu7PJo+ptI4zljZvackJTt1EStZnLBGUFGR4kWUt2RuydXnK1iqQsjsFLz9DnSXPQeu
	v+lXd1EOIbmA0YLUbEBBXukV2rY9c4P33boKE/X+tgt1wkck73Cn7Bq3YgCDtF632P+9o2DF9WGHw
	UdRnUOcEurHCKVljZ5JKXzTAgZ5wbyK9MaXfjItwJ/nCW1DiwRcaDU66frwYte1O9H1MzXUQzqDfK
	8P6K5Nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz1M-0000000C8Qn-0wEV;
	Thu, 23 Apr 2026 18:43:28 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz1J-0000000C8QK-1dt1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:43:26 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 258AB1D000BB;
	Thu, 23 Apr 2026 14:43:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 23 Apr 2026 14:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kevinmehall.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776969802;
	 x=1777056202; bh=+8OlnfIQ6DaoOFXqEFv4KaZ+j1lhQuHlCxjm4TTzoe8=; b=
	UuJ3GWYI/vEoO8/n2VwjlhLFGi8m2FzBfK34GUG+vSwe/o1bWVG3OWDI27v4jhtm
	Yys7mwU7OZWdOWwPtiBsVRhqYO1gD7hfMPZcYLJ7Jn2MmdUvq65RRNjBS1D4rkeI
	tWjMHD6loTHRokL8rCGWrHoG0SjiMKCY7Fyl5y1IdJm1WY7tES9p+/lKTE7lRqZ8
	fWS4pDDSJZk2PiZ4cX6Rxo1P/ym76AxgbSQ8IVoYQMH92TQsUG4FEYKn66vh3zx/
	Qyrz9b60RI6ybJ8ezckhar0toZnJKeLndfg93vM6bWFJxOo1MYKwwaXxFXOxNqSJ
	ur01+qEPSGHW/MajBb9UiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1776969802; x=1777056202; bh=+
	8OlnfIQ6DaoOFXqEFv4KaZ+j1lhQuHlCxjm4TTzoe8=; b=OEKyQRkpuXRjBFVLT
	2UDjIEJ4x6Z9l79sjc6h50wuIqBGYCoop/fKyzmx9vJHpZ1WxY11e0T8ZSZktKzd
	xUnS4MxcUwZvn+yqlM9mWid0FhfD2OzZCn8l4kKLGQHOL7FIDqeqX0DZvEQMaekW
	HDH6vZXRtFkcWqotcm9uVzkX0dvh3wL2oOpizuoquj51M+4QhsBZ8ZPl64qarV0O
	QStbcbRFUCNO83NdzDVY8cZt4So7RujEQygVIGRRz861F7o6tyvd+c5r9ijc8o+R
	6thSoBvbSWmLIIFOMsp2/dqsRruxUNBtZL2b8Q0FW7bOT7OTOIfVNp1ngdA+mYD9
	9rsqw==
X-ME-Sender: <xms:SmjqaZxU4NZx2tziwcznkcxv4xUg70wEAvQDbN3tfbSe0gtM1VlAnQ>
    <xme:SmjqaUEC5yzwi0um-GQQ1wLGU7Aep4Nvrzr-r7zXTjSYNnU3kd2qznYq5bWOsBAQg
    RORipk7ypRhh63s-bj-auP2PbBHRM3ywtWQY8VOwENvYbGML0yVAwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfgvvhhinhcu
    ofgvhhgrlhhlfdcuoehkmheskhgvvhhinhhmvghhrghllhdrnhgvtheqnecuggftrfgrth
    htvghrnhephfetkedtgfffgeelfedtteetffelffehffegueeuueeuudefvdegfeffffet
    ffetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkmheskhgvvhhinhhmvghhrghllhdrnhgv
    thdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegsrhho
    ohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnsheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhunhigiheslhhish
    htshdrlhhinhhugidruggvvhdprhgtphhtthhopehmihhrkhhoqdguvghvkihlihhnuhig
    sehnrghnlhdruggvpdhrtghpthhtoheprhhstgesrhhunhhtuhigrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SmjqaQ-6urYPgsDOLcAicbp_1ZGnER3UxE1h4scnEgZkG6LMBBtv_g>
    <xmx:SmjqaW8493rN-YaEdWfugKX-HwEeJNU1I5_nyT71oxVaidLxkTfAqg>
    <xmx:SmjqafUEmbd6lzL0jgWSXFiGULmX-lTYQJX37Irt3O2ohxJWerSR9g>
    <xmx:SmjqaTcNXKUVgvChzfTmPfg-MS0d7J0sKpiDEjHygXc8_M3c6Z0NXA>
    <xmx:SmjqaYFRzbHeyhvU7IVeD_-0oF6aKyoSmm8Mz2dZucRwh6gDUTnV4G5x>
Feedback-ID: i421842c8:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06D0D700065; Thu, 23 Apr 2026 14:43:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 12:40:34 -0600
From: "Kevin Mehall" <km@kevinmehall.net>
To: "Mark Brown" <broonie@kernel.org>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Mirko Vogt" <mirko-dev|linux@nanl.de>,
 "Ralf Schlatterbeck" <rsc@runtux.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <53c2d366-2d76-4a6d-a72b-99544026ee27@app.fastmail.com>
In-Reply-To: <20260423174001.2797797-2-km@kevinmehall.net>
References: <20260423174001.2797797-1-km@kevinmehall.net>
 <20260423174001.2797797-2-km@kevinmehall.net>
Subject: Re: [PATCH v2 1/2] spi: sun6i: Honor CS setup delay on the first transfer with
 native CS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_114325_586706_BAD900BB 
X-CRM114-Status: UNSURE (   8.04  )
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

I realized this is incorrect. With a GPIO chip select, sun6i_spi_set_cs() is not called,
thus CS_MANUAL would not be set, and the hardware would then automatically
assert native CS 0 during the transfer. My testing was with native CS 1 and a second GPIO chip select,
so I didn't see this because native CS 0 is not used on the Orange Pi Zero 3.

Therefore, I think the best place to set CS_MANUAL is in sun6i_spi_prepare_message
as I had in my original patch [1], unless you think it should be duplicated in both places
or have a better suggestion of where to set it. sun6i_spi_prepare_message() is still called
before set_cs(), so it still fixes the skipped delay.

[1]: https://lore.kernel.org/linux-spi/20260420164755.1131645-1-km@kevinmehall.net/

