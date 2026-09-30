Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74FCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqQYTKm2Wdd7b1tVU8c2yXO4zrRthLuiQutkjRT8Vuk=; b=IMEIyi6e/ZkOyDUZIvSCbhJu27
	EdAyy69i/l8gJRi/QtMsVPLe7R5CdQPVcZUsX2qQJ+eEtZUGbBGXnPrnT2pAgT5EOCLInsUfMhwDw
	chciKglsrct+ZFRI7UNPuUZNHm4AgZI97q+UBzZB44YbTpQIu1RF+ua2OHnN23/dJSsy5yKb2pdx9
	mL091GYnTgw0725cUq4WpBB2lbVlH86f3rKMdRw9iPdnyCcyBQGsR/BIK/7x36SU1bW/laE8P1OBi
	2TdW34ZQPQSZ75M3oxsOoaNnzWNIk15Sv7ozC8NQR0oKTP5w0K//w3UbDZrIkOqvhCva34/v9fyry
	gAm8coZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Qz-000000077yf-3ElM;
	Wed, 30 Sep 2026 19:57:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Qv-000000077wm-2y0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:57:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E31D84E410D8;
	Wed, 30 Sep 2026 19:57:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7EA60749;
	Wed, 30 Sep 2026 19:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345F01032A657;
	Wed, 30 Sep 2026 21:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790798253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uqQYTKm2Wdd7b1tVU8c2yXO4zrRthLuiQutkjRT8Vuk=;
	b=F48e8l/i+EUn005g7ZmACDDnUwircTAMsIs7ExYiV1VMgZDoVPm/NDfiMOqM3RoBDhAbt4
	UHEGekREDTi6XilPbdHtrNlnLMBaX3dz4EA1ktbESOT8ojwEEvS3JWC/IKKLJfKikGE/t0
	dFQPwRi0VRPIY72S42yYn5JNMI+CO/cv+Xjuvu1FnfCsPX12LMrWkU/alP0hEvLdSrjiSW
	U7bfR/2Kkz73m0TrSJKwcFSDe3TQjnfbq+UdL8lRQr+ebax2Z8edfV9L/OX7rKmlGQeG05
	kSt957cM+cFLyB5RrMJH5Cap+qKKP1IWmbNQEcX/OFbYL8i+pnC9Lwz6Shzfsw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: orion/gpio: use __assign_bit() where applicable
In-Reply-To: <20260920022551.3145595-1-peng.fan@oss.nxp.com>
References: <20260920022551.3145595-1-peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 21:57:31 +0200
Message-ID: <871paa8qc4.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_125741_890628_D045C786 
X-CRM114-Status: GOOD (  11.11  )
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

Hello Peng Fan,

> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with __set_bit/__clear_bit to the
> __assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

this file is now removed by the series "soc: deprecated platform
removal"
https://lore.kernel.org/all/20260701212353.2196041-1-arnd@kernel.org/

Gregory

> ---
>  arch/arm/plat-orion/gpio.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
> index 49e29b7894a3..a8412dba97f0 100644
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -275,15 +275,9 @@ void __init orion_gpio_set_valid(unsigned pin, int m=
ode)
>  	if (mode =3D=3D 1)
>  		mode =3D GPIO_INPUT_OK | GPIO_OUTPUT_OK;
>=20=20
> -	if (mode & GPIO_INPUT_OK)
> -		__set_bit(pin, &ochip->valid_input);
> -	else
> -		__clear_bit(pin, &ochip->valid_input);
> +	__assign_bit(pin, &ochip->valid_input, mode & GPIO_INPUT_OK);
>=20=20
> -	if (mode & GPIO_OUTPUT_OK)
> -		__set_bit(pin, &ochip->valid_output);
> -	else
> -		__clear_bit(pin, &ochip->valid_output);
> +	__assign_bit(pin, &ochip->valid_output, mode & GPIO_OUTPUT_OK);
>  }
>=20=20
>  void orion_gpio_set_blink(unsigned pin, int blink)
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

