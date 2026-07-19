Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C35AC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAtcnOfqiiOyUAHauK6NUyg4WFqcLnTDUNxtGWK9Lr4=; b=y54vc/6ac8yi2PD6jNIX6jSVAY
	o+A8q7y0ey75aTjl1s7178LxkDDziqKlbWEdAtvz/E4u0AYdcrFe520LMgh3zDiTucn7pz2L/AcOt
	C85d9TsazjNItTJTcksawJLTYlrL+ozhafzxS0gQtExrxhdzLDQ+duGDmYJyPG38qHLG57+KfJ62A
	JInjVb8QXl8HbwVe1TAcO0xxykkYbT/sldKSaM+DKixaaO2JrI8PTSfKgTcZj39ms6A59dyYWsmVl
	6VtiSi1qTX/SoOJ/4iq0LSdP2tq6+SNIeX/YEApyYd/3kjxdTYDZHXymNUV62QTFAGurnzjodTozy
	D3EW+3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT2e-000000055MU-3StT;
	Sun, 19 Jul 2026 15:02:56 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlT2c-000000055Lz-18oK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1784473372;
 bh=VAtcnOfqiiOyUAHauK6NUyg4WFqcLnTDUNxtGWK9Lr4=;
 b=YAQBmvZvERXiNbjmMR840zToAVAxdqFV4v/2J4bcK8Ydsi2r73HvAFGsItb2BlKckXOl/Wub5
 Mo1msTlSKzEozQKrNVLNpoG1qiIDZBC+3b7p4+y3VwgvUNrn5PQTyoKT8XWaDobRL28ktNp4UTf
 B0YDJ+b7yHHtWUdUy6gwej3hhD7HunoUWbw48sG4qOrnngAzReJezDtraumLv6ugkRxGfZm4RlU
 P+f2TjQTEVNJPhV/IGjXTDVzM4GWBBFZuiXKPUD745JKsS6dqRVIsILrJQh6kse1sm6PyKOepvC
 ENvnhOTNYKC6JJ5CXjoOOcx17PvMqgSJQlZQ3JYCdP2g==
X-Forward-Email-ID: 6a5ce717e6d4cb6492a15b36
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.11.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 19 Jul 2026 11:02:45 -0400
Message-Id: <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Lee Jones" <lee@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
In-Reply-To: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_080254_695667_54FC91B3 
X-CRM114-Status: GOOD (  16.19  )
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

On Sun Jul 19, 2026 at 9:00 AM EDT, Sven Peter wrote:
> SMC firmware returns the value of the #KEY key in big-endian unlike most
> other keys. Reading it through apple_smc_read_u32() into a plain u32
> and then converting with be32_to_cpu() makes sparse complain:
>
>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
>
> Read the raw value into a __be32 using apple_smc_read() instead.
>
> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@i=
ntel.com/
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/mfd/macsmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 358feec2d088..514cba7dc897 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device *pd=
ev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct apple_smc *smc;
> -	u32 count;
> +	__be32 count;
>  	int ret;
> =20
>  	smc =3D devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct platform_device *p=
dev)
>  	dev_set_drvdata(&pdev->dev, smc);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
> =20
> -	ret =3D apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
> -	if (ret)
> +	ret =3D apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
> +	if (ret >=3D 0 && ret !=3D sizeof(count))
> +		ret =3D -EINVAL;
> +	if (ret < 0)
>  		return dev_err_probe(smc->dev, ret, "Failed to get key count");
>  	smc->key_count =3D be32_to_cpu(count);

This makes sense, it just feels weird reading because u32 is.. not a
be32 (that gets passed into be32_to_cpu).

I guess it doesn't really matter.

-Josh

