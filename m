Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B9D167FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPWdvhWqUP8z4tQ2SIcyZFEb5oJzFhbi88/4PvVGk9U=; b=JKRm2IBucjMpSV45hGWoK7QUbo
	RQMzA8MjJrQgBCkk3XtQjXgcoSuS6kUVmGxvMxZlVVa2BNLNtzSAWdqwpYUOtOdE6p5NiKfgGJrTP
	mMfrXCR3MAq2dkf+wSKJ3sAS+AvybHcT3Fb71+VyCTpdTOueaFyFc+xQtUdVXpwcaf+LLHTwQT9EE
	Dkz8yHsFr73BuHOWDowJNkm/6JusUX5kCKU2cYFtmemPpkPVgocX70GU8FMRNsUPphh4rrrU7hMwj
	1RIHuZjfcmZJZ0/iY1fRI20rsKaYfnKwg9tShD5+hbERvL16DOVftngZjGPj3NmmkOwXU1xD1zAHZ
	hx6QkJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9aT-000000027Le-3rXQ;
	Fri, 09 Jan 2026 10:19:21 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9aQ-000000027KF-1uAL;
	Fri, 09 Jan 2026 10:19:19 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F22617A012C;
	Fri,  9 Jan 2026 05:19:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 Jan 2026 05:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1767953956; x=1768040356; bh=nPWdvhWqUP
	8z4tQ2SIcyZFEb5oJzFhbi88/4PvVGk9U=; b=cK/JBHt+1mwfnuAPXuR8+vt4uJ
	bWFdyGs278GocEhnBzm6hHuOhkPgdBxTWrq+pFfC0Wi79ALBNaM55BuxUXCGv+rW
	6Bugu3MKJ66KAyNm3AW9gK6QFZnNO0/0QP4U85ajpnk6JGJxoImuhwL7/r9mW3G0
	/mT+uYDP8IUFSosvQRu0HM2DBr36yVdVyUKFkjmpdSEmhgSbjdMMWhRk5T+bBQDq
	iPFEhnVXveL/jRxH5m3MfmlUTC68RRVU5AMMSoFtbZDmLePO0y+CKp3OYHcdWO7e
	s9yed9kto0x/3IeFKrGh+WQTOStaqkNWkBtYLVzT82k+n2bYqu4iY30qYauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767953956; x=1768040356; bh=nPWdvhWqUP8z4tQ2SIcyZFEb5oJzFhbi88/
	4PvVGk9U=; b=uY6nHXoQWY7hWun4DoF2HY01QiXsKb4YTboCe+6akDQSQLng7hH
	MJAGNCNPRbi29XgPJk1IUY6Qn34b5On1lFXQyehgU8JaE0s0swDEoSExs94ul3CX
	Uh78zHqmcrwnVWJhgIDd3RjCDmiwMqdS5qNMI2C6CSTDT6ck2yRafeNVm9fhmTep
	2VAsIlKV1vgtllw2/dumINEz+e9u494DO/LYt9k+Mkp3HeBgDYnQNCTVpp5IQvV1
	bjS2pL8xCaE9xEha0BPYcQu+T/C2CSbiNXj3Y+79eOnIIeepUoTUt3eyi2vunecd
	CGqmexAyaYP6pYvFiiuhK+/jnZiSgJwvNyw==
X-ME-Sender: <xms:JNZgaR3n2FWAIFtiFRXS0SXQZ7SpDyM4IncmvjvauyZwhNwsS1CT7A>
    <xme:JNZgaUpchhk9FqRsUwUE3Xsgy2Sy3fNx0xvpr6MJlQresB9cCS9mGF2ETctO8xid9
    ryAK41UeKZInVGEcKKr_ENH_TjhmyMQfkLOGfq1xzs89ojiTD-36Xc>
X-ME-Received: <xmr:JNZgaWUA_kgrxxzg1pd6_vzR143MTs4YCaEtvy5WA_Y6GlPRg0IPdz4-JjilKqnidCbDO8KDvfWJRyuuTtdGLC1FkNhR3T4Z7IU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprg
    hsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhphhihsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:JNZgaVrqEWwiF5SEbzGOUHnDFslecCbM6XkSjv__N5LhbXpBwbNoAw>
    <xmx:JNZgaVB8Q4-AEkMmWLlp7puSRS9Mv6k8GfxqDWdVH3sUk2CE1Qrz8Q>
    <xmx:JNZgaZhFLnSivm_8rg8JcfISGUoY4heyANyNuUGwkyLPKPKkJwAnPQ>
    <xmx:JNZgabaaGpZW4H_bVifG5BJlhNL85ht9R_ySRUP91xVgxL67ASbdCg>
    <xmx:JNZgae6uc6VjHMIEr9eEyHxKUGdcxK1cgwwwMkDpNIuv40pA6qgA7nGu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 05:19:16 -0500 (EST)
Date: Fri, 9 Jan 2026 11:19:15 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Calligeros <jcalligeros99@gmail.com>
Subject: Re: [PATCH next] phy: apple: atc: Reset USB2 PHY during probe as well
Message-ID: <20260109101915.GD4068972@robin.jannau.net>
References: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_021918_537257_4ED76C14 
X-CRM114-Status: GOOD (  14.88  )
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

On Thu, Jan 08, 2026 at 08:12:06PM +0100, Sven Peter wrote:
> Now that the upstream Type-C PHY code is getting broader test coverage we
> got reports of USB devices plugged in during boot or those plugged in for
> the first time after boot occasionally not working correctly.
> This is partially caused by the USB2 parts of the PHY being left in an
> unknown state by the previous boot stages. We reset all other parts during
> probe but forgot about the USB2 PHY so let's fix that and actually reset
> and power off the USB2 PHY as well.
> 
> Reported-by: James Calligeros <jcalligeros99@gmail.com>
> Reported-by: Janne Grunau <j@jannau.net>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/phy/apple/atc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..ab0b40b72533f1b3878b646b59820c730239e85c 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2227,6 +2227,7 @@ static int atcphy_probe_finalize(struct apple_atcphy *atcphy)
>  	_atcphy_dwc3_reset_assert(atcphy);
>  
>  	/* Reset atcphy to clear any state potentially left by the bootloader */
> +	atcphy_usb2_power_off(atcphy);
>  	atcphy_power_off(atcphy);
>  	atcphy_setup_pipehandler(atcphy);

Reviewed-by: Janne Grunau <j@jannau.net>
Tested-by: Janne Grunau <j@jannau.net>

thanks,

Janne

