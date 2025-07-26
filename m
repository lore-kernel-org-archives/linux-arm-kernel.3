Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A7C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLI+bwgAyYHVhyi87lwVwQoEjhWitZId0wvrbdQW7/s=; b=mmoH1o5zmw7/55+Zpe70gIoMad
	HaGKiCLn7RIT9iTAEX6q+mqdd0Qbj7MZ17xPj5ms6SoICN1nCbPuiWy5zaabfRKkkQ7JDhxUcwwSr
	7JZvEuWvYRNKiNbHEKs7iDzq8BCAdnlXOz6fD2pwpgtHE/C2PjKGP1Jw0T5pXWG4YMZx+lG4xCSgw
	o3Iecg8SNIAgO3siAygSiznkV3HKJGwNqtgGBq/DoEtynzYPRoi6cdftXyj2h2wNPKbIRnu3nIFeF
	gsvL+Krfv4Uxd9gq0rpQnSjmrJlRirjNzYdQorhbhpxW3Ec+GTOAvk4OEJeO5lTul7xzoVYqC8vj9
	FBE7Kiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcQD-0000000BN8F-0b4X;
	Sat, 26 Jul 2025 10:46:33 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcET-0000000BMKC-3rWm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:34:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4CF0014001E4;
	Sat, 26 Jul 2025 06:34:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753526065;
	 x=1753612465; bh=KLI+bwgAyYHVhyi87lwVwQoEjhWitZId0wvrbdQW7/s=; b=
	Xfzysom26R2RjyJrrIW92okcrl2+vzW9m0tBjhhDAvvD4rEl1N8bcVdROz5KpEQz
	WAi2RrM2aRT85kDROYIG3Q0SLxDzRhX36CnYfMEVfnHzUAvFMo2VxwJXQgvt3xUj
	WXg/45NYPIDGczaWAwI7QtXvfYoe02SD/T0RGJI4q3/OJMgJYAjZCoJ12CtuJ0+v
	neVpmUmz8ChIk4UEL+72sXXihfl9igPcsOZODYbXGAGVxOgOwitQQzP8THTN0vLV
	KiMqKw1DBR/ZTC7XdT6CIsK5qtBT77IL7albR78O+aVvtuV5bMc3vReZw6yVqJYh
	ky1Q9hbhqArLZ9peYDP30w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753526065; x=
	1753612465; bh=KLI+bwgAyYHVhyi87lwVwQoEjhWitZId0wvrbdQW7/s=; b=m
	x03dr3uTx5r+GnddzjZCzbHSy0Gm6lGiEMIQXr+MvCLUtUsm6ME2drf/yDHa6NHm
	zVnCT0JFpAU7fM87WwF17fL4IovU2fJqkFF5P8qKfnbIk8gaNBtf45cfVEFowcQP
	vMor86izYByV8pQmuoAP5juDsNC0vLrUeT2EyNj/UJsU9GWsrwqVcGZ8qvs2uqos
	/SrfmnuVxMBJD+RUfsT6PMg+2rwU1aVl8DgVZIC6B6CP0+cYW64+BoWk+U0gzK6w
	Q/BNz5N1H+qxCGt/YJ3hthbO8N5RDymisMsTL6qfcNBn0oRj2pMaWptKgz/+Hn2V
	uWDSz1PIr0TJ3M5sS8llw==
X-ME-Sender: <xms:Ma-EaPpN-lIJuF-oNg8egt7lr7-ypen3shPYycjMWceQboN_mFm4vw>
    <xme:Ma-EaJrrDy0G51qEb3Hl8zZd9CmeNv0GsBqSxOk7H2F8vBL5k2me16f3p5rTTndyr
    TG7xzdssgjFf80d09Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ma-EaDrtn148dgbNIN-Fc3r4_fu1Yqz5-kO5lFBYQEfL4FygR9pxIw>
    <xmx:Ma-EaJKwxJl0UOy94DctHqxasSgEXuZkSLcrJflBVS_Jj34LjoqGsg>
    <xmx:Ma-EaGqEmxcTI0mIV3kUZtWcFy5MxismkOUa27AJgGsCkrBhn0d4Ew>
    <xmx:Ma-EaBxa_PjZSkYA2QjULikhUEiFDSAe8qzg162hoYj3TUG3v4ki0Q>
    <xmx:Ma-EaMxiZcLc_iMiL3M2pZGNE4WXy0Hk_ic2VJGYzIxGdBLC5r-Jymob>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E014E700068; Sat, 26 Jul 2025 06:34:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tf28ea043109521c0
Date: Sat, 26 Jul 2025 12:34:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <4dcacf2f-90b2-4f24-9f72-91707b77b9dd@app.fastmail.com>
In-Reply-To: <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
 <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
Subject: Re: [GIT PULL 0/5] soc: new SoC support for 6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_033426_037477_5441DA67 
X-CRM114-Status: UNSURE (   7.41  )
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

On Sat, Jul 26, 2025, at 12:31, Arnd Bergmann wrote:
> The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:
>
>   Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> tags/soc-newsoc-6.17

This should have been [GIT PULL 3/5] of course. The order between
the five branches does not matter this time though.

    Arnd

