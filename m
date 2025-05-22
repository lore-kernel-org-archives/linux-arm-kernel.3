Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D04C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBTpQbywQFLmTTQkFgXTxm8iWE7BxybCg7tJBMmOGUE=; b=cvYwQZkyQGddUFJQtddkAJNtnb
	jzuMTXwxm1+lZm3OzlhkX97ybTJ6ewOB/PpMJNQotUlYsHtpjxipkq+6Kib5BdtzZar/1dpPPxTbv
	ucR3aJCHwpAgFbNIzxblWZAXvoEF+feo0Vp0TONlaTaCfVBiPFpBYU+Bqp8/mw5+8HR1Pln1NxbVj
	KMA4ssPQimVH2VhK//R8tKauRy2s3iJmSiLaz9Z7lDHTTlIdiBEWplpZej6s0UsJQJ/93imMOVltT
	LeHtCtjS4tEvU6/ocftlnuYZ2c2YGriYbmt/KehppY4/71SNf3d5IMbDBHoX3iWKVCFiJhXIz+yVA
	dT9bBcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8m7-00000001ZIF-0L1d;
	Thu, 22 May 2025 16:28:07 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8Zk-00000001XsO-0MTH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 16:15:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0CE1B1140132;
	Thu, 22 May 2025 12:15:18 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Thu, 22 May 2025 12:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1747930518; x=1748016918; bh=MBTpQbywQFLmTTQkFgXTxm8iWE7BxybC
	g7tJBMmOGUE=; b=B9bi2B7CnXLp+kb3svPCNRju5PNb1KDnU3lYD+Av3i6+nC9u
	ZvsKUnNz8B3qR+bpqQhrRkJ/tNK/EPeHwR3q0HvbrP4o5t0ZI9NOBGq8SAd97b4U
	IRk0o5K6L/EVV3clXwO75WQyPrYaN+AOVlkaJAgWowzoiV9WHZwKnpxyMIB96H2u
	Xz1JKahUhemA57TD5aQlD12gabc5tSKsLg1m5JKrSPZrhx6UwNv4kcHAi91tBJGk
	QVrN9HXlxmP8FOOigVYyOxreG4sndqgq9mdd7SgoRWykdarUtQr/3KKd/di1oLmT
	Bu01KhgXsmm+Y3YkYzmBzq37R3DpLTPkpbMyag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747930518; x=
	1748016918; bh=MBTpQbywQFLmTTQkFgXTxm8iWE7BxybCg7tJBMmOGUE=; b=u
	LmBJdr8kFFwLUwi/cjQSCYXQVB9Uz1AyTJsKsdyUvCLeV4Cajkel7vYFbr44H8H2
	2wN6DGAWhh0bX6dVycyKg0CVxvxqVL660C+WECr9YRhSk/fdJH59JJvU+dkLQqjx
	r65gVedaz3Rd1TAa+86Y35yvz+1WFbs4KS8AFegqg6cBGiEcCFV5xjPZ4ZWS9Ols
	AYNOnNxia1ESHyABFa1SymftWehQlH8CDYfTqottz1EMpfTVpjzMdh7cOcRCXc51
	zL3TFaEUM2SiA7uYx6AKQhvK04FNd8ew5BffznD3NgMN9p1yCsoAxD1KJgoBZYyQ
	ul24bFzAir4OBJUQFh94g==
X-ME-Sender: <xms:lE0vaMLwUSNRHe9rOlIek5IH5yF1gV8ngvEu7TxwvM_2pAWd44KyeQ>
    <xme:lE0vaMLq_x5JbBPSX3_vyoDwGlpR8hotcQFKCwrTyPXFDdIsKBSn-ICtAL5soh1sD
    PEY4DxEt_yo36F9Pfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeigedvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugedu
    udeuudeuhfefheegveekueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvght
    vghrrdguvghvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghp
    thhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehsvggsrghsthhirghnrd
    hrvghitghhvghlsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhgvrghlsehg
    ohhmphgrrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoh
    eptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdought
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehmrgiisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lU0vaMuYGb6UxDNM1d0uvsMQ1SVzVN0tQzwa7-l5gpNzDQ3Ywa-1YA>
    <xmx:lU0vaJbcMxqM-lsGnAR5bi1sA-GIq1fseQpq0MuUrw8aihaAhFgVaw>
    <xmx:lU0vaDZ0z2pFdHEn4tFzNMqjza0UtBIudtqWGeF_bzARYUjoBzHDFg>
    <xmx:lU0vaFCba1PF5PlMgKRZ3JWfKdbvKkCHSNIDnChfdYzrmXHTxSSsdQ>
    <xmx:lk0vaFK4eE6CWoBCW1Z_aUsWMLN7jZMKiOpnCa_bOWHa5-zsFSGz4dof>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D14D01060063; Thu, 22 May 2025 12:15:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6f92ed75002c46d1
Date: Thu, 22 May 2025 18:14:56 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Hector Martin" <marcan@marcan.st>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Russell King" <rmk+kernel@armlinux.org.uk>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Message-Id: <706858ca-7ebf-4419-a096-3907aab923bf@app.fastmail.com>
In-Reply-To: <gk656zq44i6ls6bbcb6qpd42typzkw3hqbft6b6rvfaw5aocsd@2fsiokbcnbtf>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
 <20250515-smc-6-15-v6-7-c47b1ef4b0ae@svenpeter.dev>
 <gk656zq44i6ls6bbcb6qpd42typzkw3hqbft6b6rvfaw5aocsd@2fsiokbcnbtf>
Subject: Re: [PATCH v6 07/10] power: reset: macsmc-reboot: Add driver for rebooting via
 Apple SMC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_091520_755020_93E0472C 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Sebastian,

On Thu, May 22, 2025, at 15:06, Sebastian Reichel wrote:
> Hi,
>
> On Thu, May 15, 2025 at 06:21:19AM +0000, Sven Peter via B4 Relay wrote:
>> From: Hector Martin <marcan@marcan.st>
>> 
>> This driver implements the reboot/shutdown support exposed by the SMC
>> on Apple Silicon machines, such as Apple M1 Macs.
>> 

[...]

>> +
>> +static int macsmc_reboot_probe(struct platform_device *pdev)
>> +{
>> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
>> +	struct macsmc_reboot *reboot;
>> +	int ret, i;
>> +
>> +	/* Ignore devices without this functionality */
>> +	if (!apple_smc_key_exists(smc, SMC_KEY(MBSE)))
>> +		return -ENODEV;
>
> Is that a leftover? I would expect that you do not have the
> 'apple,smc-reboot' sub-device described in DT for such a case.

Yup, that's another leftover, will remove it for v7 as well.

>
> Otherwise
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>


Thanks for the review!


Sven

