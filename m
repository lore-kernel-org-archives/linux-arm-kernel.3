Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXbezUHKcYvu1Ptzr6+1Xx+ex3X8GOpunRzS3Jp2Cx0=; b=JCPgbCum9QYmwAvaxp31bzLAfo
	5Mq/e4hV0dWvhj1uLo9WqSYHqrpct6W2BHKTij/S+CQyvpKqX6Wta6eMsrWRipV07562Nqjen7rCC
	1RwYnBReOrlJUg9e3V5bCRUvo7AwT5NPgKiX11DhMBaqld9DyUfe2pMo9sLT70Uw9RSS3wPp4F59o
	LZhxyPZ1rJw3bGSuWUnk/QegD7e+I/H68c1pP6MUOI/Fsbk6h52MZ8Teqg8z4dqSanBnAoP5p+xWB
	Qz8a0n4SGJI3eQU71xXM9Mkb6Y/PVYzL2DQd0gUW6c8eBbQTK9ua4vJzDEt7FwylT2CQvyjVDmJeU
	UmDPNtWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSPK-00000004ZGX-1slk;
	Fri, 09 May 2025 18:25:14 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQMn-00000004F9h-3PKP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:14:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4FC21114011B;
	Fri,  9 May 2025 12:14:28 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Fri, 09 May 2025 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1746807268; x=1746893668; bh=OXbezUHKcYvu1Ptzr6+1Xx+ex3X8GOpu
	nRzS3Jp2Cx0=; b=DaE/t9uss9mpBJoxg8WG84xuq9HK3gkZs7C10WZatQSUBvcW
	N7LQWH2kCi+VAVRsNjj3kWjcdUU6b2p4Hc0huz+0LN46xMdIpEGJYNAQ38ORqhOb
	ExrTby5c0RLt0NIe5AZ3+kw4zwrD+nLzTYYWx/4UHz+AJ4mBd2cOk+Ach49rRA39
	MCt2IdNJKFLWyqxJvsngKoNvtTXT0ma+SkVrv1u2liE+7Wcy3IzM6X1bwwgNj7GX
	S2aGVQ1Ue2vPsfdxJ2U9jt1i71C1O70Rulee4QpqLnEhAfLsp1QnDZxLpj0hrfMd
	sfIZJfJG+bdyVahYVVMiL8UMnqcDo5hP7d5FwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746807268; x=
	1746893668; bh=OXbezUHKcYvu1Ptzr6+1Xx+ex3X8GOpunRzS3Jp2Cx0=; b=c
	saqIxHMcu+VEiQmjFN4OZFefjyF47XLBIMrCPMbfHpIqkHCvwSSJGaFLiybkaV5d
	Jz9hSQR/49ozNx020jkMYxI+81Ohvp2Ibyohj31qnq4jEKsMvoLKyf+YEmuFgRc3
	C/7/PA5u6CPQQp4Jele7AkZCvtORwTBnDHLhL475VMUAzsn34f2DwyO9dY9+ktW5
	DIyKbS+Thw1jg0i2siLWI+Z5BZqskjUeOKJC1G1X6Poq3eYq8D5MEgdyAwjYgMJ7
	pNOsDCawDTd4Gn7KXwtG56/lFMPydrktp0v+PS9zN6x3iJ+Y2oN8kWNuzVowlY+M
	8vEQl64Pa4Nsg/ZcEPWwg==
X-ME-Sender: <xms:4ykeaCJOg2jKgtx7pKFznBIP6u7nmFfH3ZzoxhtlUVhUiLltKKog8w>
    <xme:4ykeaKLsaENKTxDUu4N1BGOZVGZ7VtDQpIbt-15tSGdrteaRt25QLiWZNNYbA3Onl
    xbbD9GJeARVwsGuY-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeftdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhmkhdokh
    gvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghrghhlsegs
    ghguvghvrdhplhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtth
    hopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4ykeaCul_pCvPXQDFfMwRyhKptftWme9TqBcC63VhwBW4LYz6JsDKQ>
    <xmx:4ykeaHZhWFevFxHrPdMCFEF5MBsiGKQejjaTiJys0MTt1kczdZoNRw>
    <xmx:4ykeaJZHPQEdBgNbzM7NINTFQD42j66G5LNH_BbwrLL13tFtJZWnaQ>
    <xmx:4ykeaDDblii-Ktq1U2trbst6o-SBPUSkjI9lL_W-3cntbNWMWCU-Qw>
    <xmx:5CkeaH7A37GhqngamR_x-oDBc0s_YAmK8Aaxd2kNXJqprE5kDLwul7qM>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7072E1C20069; Fri,  9 May 2025 12:14:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T4bf42f97a4fae5f2
Date: Fri, 09 May 2025 18:13:09 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>,
 "Hector Martin" <marcan@marcan.st>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Lee Jones" <lee@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Message-Id: <196f84ea-6567-4fe3-9bee-743bb289223e@app.fastmail.com>
In-Reply-To: <aB39iJm9759RYAKW@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-6-500b9b6546fc@svenpeter.dev>
 <aB39iJm9759RYAKW@blossom>
Subject: Re: [PATCH v4 6/9] power: reset: macsmc-reboot: Add driver for rebooting via
 Apple SMC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_091430_105527_DA1EFC50 
X-CRM114-Status: GOOD (  13.42  )
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

thanks for the review!

On Fri, May 9, 2025, at 15:05, Alyssa Rosenzweig wrote:
>> +	for (i = 0; i < ARRAY_SIZE(ac_power_mode_map); i++)
>> +		if (mode == ac_power_mode_map[i])
>> +			len += scnprintf(buf+len, PAGE_SIZE-len,
>> +					 "[%s] ", ac_power_modes[i]);
>> +		else
>> +			len += scnprintf(buf+len, PAGE_SIZE-len,
>> +					 "%s ", ac_power_modes[i]);
>
> Nit: { braces } at least on the for loop...

Will fix that.

>
> (And might be more concise as
>
>     for (i = 0; i < ARRAY_SIZE(ac_power_mode_map); i++) {
>         bool match = (mode == ac_power_mode_map[i]);
>         len += scnprintf(buf+len, PAGE_SIZE-len,
>                  match ? "[%s] " : "%s ", ac_power_modes[i]);
>     }
>
> though IDK how people feel about it.)

imho it's less readable that way but I don't have a strong opinion
either way.

>
>> +		mdelay(100);
>> +		WARN_ON(1);
>
> ...What?

This is done in a few drivers in drivers/power/reboot. If we haven't
rebooted after 100ms something's wrong with SMC. I'll add a comment.

drivers/power/reset/tps65086-restart.c:	WARN_ON(1);
drivers/power/reset/atc260x-poweroff.c:	WARN_ONCE(1, "Unable to power off system\n");
drivers/power/reset/mt6323-poweroff.c:	WARN_ONCE(1, "Unable to power off system\n");
drivers/power/reset/gpio-restart.c:	WARN_ON(1);
drivers/power/reset/regulator-poweroff.c:	WARN_ON(1);



>
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Failed to register power-off handler\n");
>> +
>> +
>> +	ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART_PREPARE,
>> +					    SYS_OFF_PRIO_HIGH, macsmc_prepare_atomic, reboot);
>
> Nit: squash double blank-line

will do.


thanks,


Sven

