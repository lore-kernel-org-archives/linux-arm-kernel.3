Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8Snn3M2Xto80GFCTzGDH4eMJtf9SvjbeLQR53HTuGQ=; b=UH8PXoIQUKiJZm+s0PXTTRtv8s
	U/RWYD1M3wbMp/J+D9EJGPWOtPjxQNmmlDuixjViTnMW5d9+H2xE17L2iBueI/Kw+ON9/6lKJKtUT
	Eh+DVxlMX/BilqI8q65GRf9SZxEJnkYjHFXxw4WSEQ707VE/CR7LFC1fzNI+1ZTvhS0T7COAxE9qq
	y4OmQOJ3Ont1PsL053GjPrIsfSFEFao1nU7UiDzvvvk2kofDa6V5wcVNiX/4OCEczKGLA5MCWO2/J
	higYlSNfTfO0f77sL/lxSyMIP77QQkw9uR2IjxwqZNvsj/llz7KoR8txTWSRVvlHpAzxDJtbhB2/b
	SroC6V9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBq7-0000000CVjj-19ZE;
	Wed, 28 May 2025 08:08:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBny-0000000CVUq-1mdh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:06:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9370A44393;
	Wed, 28 May 2025 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748419586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8Snn3M2Xto80GFCTzGDH4eMJtf9SvjbeLQR53HTuGQ=;
	b=H0WSSbShJ0Gz7Vg8g+HKsOFdUBIafPRnGn2jUS3PRcl77WiUdJ9uR25cfFiY7ItPIDyii/
	gppDVRhJ/E+EiQx2GzxL/QxaIylJmxFNR8xsY5x5UqkpWbQfyAgVLQ0jq7JCE95lsooIL4
	QV0kYkFlCSVo0RDy3BGQK0+36/6pMrHGVySCDuQbk1Z8tJPL/YicoKHGZ0oR4fGJF00K9f
	loiiuW0yTVcTH+XXAI14PJROcA3E1HMWlO4t1VV4x4Y9xSu1negVKjX+EFApwCfZuBQoqb
	akMwK1VWuR5S1uEz1ESV/mFcLaOnDptzmhJrUPbOXs8ueYrooE10alPOZDnmyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 10:06:23 +0200
Message-Id: <DA7N0K4FSI14.QARGA1ALU2XV@bootlin.com>
Cc: "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Jose Abreu"
 <joabreu@synopsys.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Phil Reid" <preid@electromag.com.au>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] net: stmmac: add explicit check and error on invalid
 PTP clock rate
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250527-stmmac_tstamp_div-v2-1-663251b3b542@bootlin.com>
 <20250527183105.7c4bad49@device-24.home>
In-Reply-To: <20250527183105.7c4bad49@device-24.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepjhhorggsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtoheprghnughrvgifo
 dhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_010630_934243_30AB80DA 
X-CRM114-Status: GOOD (  20.06  )
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

Hey Maxime,

On Tue May 27, 2025 at 6:31 PM CEST, Maxime Chevallier wrote:
> Hi Alexis,
>
> On Tue, 27 May 2025 08:33:44 +0200
> Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> wrote:

[...]

>> +	if (!priv->plat->clk_ptp_rate) {
>> +		netdev_err(priv->dev, "Invalid PTP clock rate");
>> +		return -EINVAL;
>> +	}
>> +
>>  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>>  	priv->systime_flags =3D systime_flags;
>
> This may be some nitpick that can be addressed at a later point, but we
> now have a guarantee that when stmmac_ptp_register() gets called,
> priv->ptp_clk_rate is non-zero, right ? If so, we can drop the test in
> said function :
>
> 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
> 		priv->plat->cdc_error_adj =3D (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_=
rate;

You are right, my series makes this check a duplicate, I'll remove it.

> There is another spot in the code, like in the EST handling, where we
> divide by priv->plat->ptp_clk_rate :
>
> stmmac_adjust_time(...)
> 	stmmac_est_configure(priv, priv, priv->est,
> 			     priv->plat->clk_ptp_rate)
> 		.est_configure()
> 			ctrl |=3D ((NSEC_PER_SEC / ptp_rate) [...]
>
> Maybe we should fail EST configuration as well if ptp_clk_rate is 0
> (probably in stmmac_tc.c's tc_taprio_configure or in the
> .est_configure). That can be a step for later as well, as I don't know
> if the setup you found this bug on even supports taprio/EST, and setups
> that do didn't seem to encounter the bug yet.

I guess you are right as well, it may not make sense to try to configure
EST if we have a bogus clk_ptp_rate value. est_configure seems to be called
in both tc_taprio_configure and stmmac_adjust_time, so I'll add the check
in est_configure.

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


