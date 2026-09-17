Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE785C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtQVsORJf5YjdUYVgRbJhrYEv0e/AxW5R9a9UzcxBDM=; b=GM4HFk76n5Km9YCiGsgbcAg9VC
	/Eaf3K5UDHc5iUpttLxgUXR8foly317DSvqaWCR6DA4ysuPdA78TSmHCgWpjVS+1v1Rw1dgtFaJIJ
	96HhcZKOS4TrOG3+/9z5jjCgTTHUa+jjEKx4dZfzMfTJyUgfXnKM+X7wjA/xvhwX+yu/1HMCEawHj
	27aqaAjFTPzC+T5mTtRZp+QT1Q6zfUwLSlT4Y8BVVhhvJifZAa2bx9eBKC53CyeelBMNkeyoVp8ov
	4lR/xSM18CWEUFkBmWB2ki6i3UjvGo9PtgbuMtkW6MAZQaV4exAhcoRzzBiTuzBcFFzRdBKT+G3fa
	wS8LdpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Egq-0000000Bqi0-3k4L;
	Thu, 17 Sep 2026 16:10:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Egn-0000000BqeT-0H37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:10:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E8F1C5CD7B;
	Thu, 17 Sep 2026 16:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40EF860580;
	Thu, 17 Sep 2026 16:10:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC80311C7B08A;
	Thu, 17 Sep 2026 18:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789661414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QtQVsORJf5YjdUYVgRbJhrYEv0e/AxW5R9a9UzcxBDM=;
	b=T26Iq4WvCruybNm+wSX/tzwZbma+E3x4Jg56jQ4iraisLYBILjMUtiWjArN9vHkHzo1DIA
	j7j6zFrGJHWyKS42h5T0QcLE9RwJy0jAR8gxDJQzE9HGHTuCAUnUwOJjrzw0+JtTGV5nBm
	9fwbni0C6s8S1GX5cvZvM1czN7+EMxtBjXIgIQhKmlOACkkTINRUwUmps+yYEnuAmuWYXf
	gr+A+6KX95Q7eTAcnfzTOkmrtYAizPiNI/Sfh5fARcptQ6zVwM69vV5765bXi60Du8oUzV
	N3twDeAmWvvDu4aqAW1rlt0iUzRKBK1qvdwt8fQuib4IDUZtLc9PCkAiHAESIQ==
Message-ID: <ff811e9f-4d4b-4b26-a0b5-84cb2eb52618@bootlin.com>
Date: Thu, 17 Sep 2026 18:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: request the MDIO reset GPIO only once
To: Linkui Xiao <xiaolinkui@126.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917125457.1353718-1-xiaolinkui@126.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260917125457.1353718-1-xiaolinkui@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_091021_287968_7E7623A4 
X-CRM114-Status: GOOD (  12.86  )
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

Hello,

> @@ -389,11 +389,21 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  		struct gpio_desc *reset_gpio;
>  		u32 delays[3] = { 0, 0, 0 };
>  
> -		reset_gpio = devm_gpiod_get_optional(priv->device,
> -						     "snps,reset",
> -						     GPIOD_OUT_LOW);
> -		if (IS_ERR(reset_gpio))
> -			return PTR_ERR(reset_gpio);
> +		/* Request the reset line only once and reuse the descriptor
> +		 * afterwards. A second request of the very same line makes
> +		 * gpiolib fail with -EBUSY, which devm_gpiod_get_optional()
> +		 * passes through because it only filters out -ENOENT. The
> +		 * reset would then abort early and leave the PHY un-reset.
> +		 */
> +		if (!priv->mdio_reset_gpio) {
> +			priv->mdio_reset_gpio =
> +				devm_gpiod_get_optional(priv->device,
> +							"snps,reset",
> +							GPIOD_OUT_LOW);
> +			if (IS_ERR(priv->mdio_reset_gpio))
> +				return PTR_ERR(priv->mdio_reset_gpio);
> +		}
> +		reset_gpio = priv->mdio_reset_gpio;

The problem is real, but this isn't the correct approach to solve that.

Instead of requesting the reset gpio on-the-fly at reset time (good example
of when not to use devm_xxx) , let's request the gpio at probe time.

I suggest you move the devm_gpiod_get_optional() in stmmac_mdio_register(),
which is called at probe time. Here, it makes sense to use devm_xxx.

Thanks :)

Maxime



