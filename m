Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91847C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L40GxX58S7CkvQid1FvkGF3NrNusAOGvB1a5qsmUhk=; b=45eDOhpUSgdWht5Q10DdkXJlzb
	pJP64KluYspOVqAgVHk34p6+eUbT0za1/txSp/RRtUWhmEpsg4UNiJJGJMJPRwubptqeY0XEz0kVn
	5exrbS1ehRFXVCt+nMRLLjkcOekGm0eLMPGhMfECSQpT/UA8Dqy/Zs0gsTvzs20ozl6nraB2xJvqU
	dFlk2UZnm6EYQmwzmQk2Rq+29yTq0Y6jH8NFDSclkdcsb4NQ8EioV4dL2VK8p1MWottdLqt/2vkTo
	KhQq+ETX3/yxNddb2J6sMMkPY0nmLc99Em4/UUHXhY9/71uXUpttaqov6zUHFXQxarkB/qO3N4T2E
	xfRhouSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh5U5-0000000FXb4-0X41;
	Sat, 17 Jan 2026 12:32:53 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh5U2-0000000FXag-0RZR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 12:32:51 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 08BB314005F8;
	Sat, 17 Jan 2026 07:32:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 17 Jan 2026 07:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768653169; x=1768739569; bh=8L40GxX58S
	7CkvQid1FvkGF3NrNusAOGvB1a5qsmUhk=; b=b5agoghei+XC3YU9yIN0HvH3fD
	7iGLJI+UrK7QHBQMTbWFx0qvqUitgwrrikEIcT0+jiej6oPfEhpichOsqYdb9d7F
	znD/c9m2rzQXXHLvkyTPQxqYX2eZZ3lNwemaaU9iasS6Q6RSxTCw0Y/XSJpN1Gct
	T5085Vi34TJRYFHC54THZKmh815Ic9TSdbxKV9hM8Aaydz1luXTDcoheZ4ZT1cs4
	PL2Hh3rKRuXiY8pFuMpyBfLvlKkuVGx6xP9A3HZmXWdHxPYDzi6QalZhWhs0tPW9
	UUZj28IBiPyWZ+VAAb3mbigy9tcsMuOt8neGhlM8MzV1ayZO4TKauR30UG5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768653169; x=1768739569; bh=8L40GxX58S7CkvQid1FvkGF3NrNusAOGvB1
	a5qsmUhk=; b=iM31dSo7NqAgwSdTfIYk6+9yvCK2gs9XN7XyrQCN4iU0FvCpR8z
	/IyHJmxkBiYq2qjohNkEAnHrnMVV7Xl4Xgd8GVx09ikhhopz3FB5eMbAhKiNJeet
	YvgVV2xT8hmGvi6YmBYsVTcncsYqcqOw99mauPh85mJDK3kaD7BHpJTBZeZ5922R
	nTBccoe6ujX0d6RPeyZcGAkngR859/yBp/RZx8hCXb6jtwkAXQlAKZW9IUPow+vm
	5vhlBL4kHIUr2GIA9vnXXnIvgfcmrvkAwqVlrosxMz2kotVbuNRpXsyIBi8pBDij
	aS74LJ2iVelpvCrS6b4pDWsPAR/oSp+Ip3g==
X-ME-Sender: <xms:cIFrafmj9dh9dTFF_0Myi4B8NjCso6-O9lhRz5aRKA1Pc1dW0ePhOw>
    <xme:cIFrabCX5uuEHISu8ABaBNoy0Qae6Qin3vu98reU8mYyHjtJMYLowEPeYb9RX62RM
    33mEzjOLpmISDXZmMwAK6yvLqJsKcTFPG-sXuGTmC_8c7aSN7rHNhs>
X-ME-Received: <xmr:cIFraRN4MZ1cmWI9_FAJpwFmQjd4wbScRXnubYKDh_r_S3-hY6I8SlLF2JqFFSqmPK4_jrUPVfQKVHraiODUMXBi-i_GwsktUh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedukedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmihgthhgrvghlrdhrvggvvhgvshdtjeejsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshhrvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhope
    hlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:cIFraSO47e2aFImcnjy5_bvphqXunbfadMue2o--1ZL4QB8CHx-nuA>
    <xmx:cIFraZkcOfOyO0tdM2la3R_yZX31ZNs9HTgkgO-eHUM7K779QpQfQA>
    <xmx:cIFraQt28-CxnGJBFOWhtswlJf8AkD049iWMNHNMO39uZpyS99V26w>
    <xmx:cIFraco_pq_Dse5SF_d0m7GZthsNhTRig45KPEiv_VUzW-YB3j8LFg>
    <xmx:cYFraRXD_kyNszl39fo-88v_K5KJvpqdFeD_mwliSZY3d6iN6_2cMBCU>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 07:32:47 -0500 (EST)
Date: Sat, 17 Jan 2026 13:32:47 +0100
From: Janne Grunau <j@jannau.net>
To: michael.reeves077@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 2/2] mfd: macsmc: Wire up Apple SMC power driver
Message-ID: <20260117123247.GB58217@robin.jannau.net>
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-2-c236e09874be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-b4-macsmc-power-v3-2-c236e09874be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_043250_233906_A6EC8684 
X-CRM114-Status: GOOD (  15.60  )
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

On Thu, Jan 15, 2026 at 06:08:16PM +1100, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add the cell for the macsmc-power driver so it is probed by the
> MFD core.
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Co-developed-by: for a single line change as simple as this is silly.
Please just keep Hector as author and just add your SOB

> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 1b7e7b3e785f..358feec2d088 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -46,6 +46,7 @@
>  
>  static const struct mfd_cell apple_smc_devs[] = {
>  	MFD_CELL_NAME("macsmc-input"),
> +	MFD_CELL_NAME("macsmc-power"),
>  	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
>  	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
>  	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

This patch does not apply on top of v6.19-rc1. The base-commit helpfully
provided by b4 does not exists in my tree. I assume it's either a mfd or
linux-next commit? Please note the branch/tag this series applies to in
the cover letter if it is not the most recent -rc1 from Linus

Janne

