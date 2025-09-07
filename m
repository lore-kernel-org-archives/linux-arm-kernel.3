Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0036CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta1cFo0XDUArRgBS4UrHkNCAuCKCm6jMm0yBvo/F4kU=; b=b0JqEM5c0jP+wKbLA8r9k0XtjH
	nKLSPRPJOJqLAsC8t4VnEXkImfZfn5PLQcJqW2SXuCQl20+mK9vFQwfbwCsoGXFFzy3I46OzeBR5q
	xlqyWIdcXYGY6EpgV/nJwELL8Np++ENUfls2bINZH3ctwwi/eqmxutuLJdFZQFN+sFBe9Au+SJHJ0
	terQNPKcN3OeJzVOuJosib/O2mnbGnN6abgebGdmbb6AfwZ59gSxgxHDEZ4mG1h9qpksweypbtnMu
	GcIpMwE6JtXoLhdXzNgusOpzHV0GroiEfbdego2HmGUIkfWikrOdY+4WLY2TJZj4wakhTZvSw8Dq0
	U/L7RviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBDI-0000000AIZx-0JwA;
	Sun, 07 Sep 2025 08:57:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBAT-0000000AI4r-1XX4;
	Sun, 07 Sep 2025 08:54:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so4232569e87.1;
        Sun, 07 Sep 2025 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757235275; x=1757840075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta1cFo0XDUArRgBS4UrHkNCAuCKCm6jMm0yBvo/F4kU=;
        b=P0C9DzI3Wdm4CIDAwbgOfq7td1fPTjvoDkCTca4v+vF3CyriGJGLoqe1AcjK22H2lE
         wDj+U7vJunStzRoROt7iSi1mvgobAp9GZB0bgVt5mr1mjgOOuApTMirz4yUdIR1kg/I4
         etb+E42HqU3TvJXAm+kiCfvgBV2MzRhqIKQJZTIiLhdoke3ZfK86QzplOgmnJRXA7p96
         5lN+PdebMkEClqzNotYijw1BPivfCfXGHGbeKfIla3fPwVtut0u/f9Oz1Xs+H7YbiowO
         UGZu+LsX/0qCpPXXwJqlkOmYJ8dYFNVRT4eJD4I7BhgvS74zWH5YlJsj+sEBNNdlAGwh
         lrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757235275; x=1757840075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta1cFo0XDUArRgBS4UrHkNCAuCKCm6jMm0yBvo/F4kU=;
        b=aBp8LaFoFBgg/niMoER67FEy7H+VMIdH2JNiYZixDIYluMITpmKMUWriGrtRmohXBy
         Lv11UIdOOL4e5GOa82gcbI12xJHE1uKAlHhMBo0rHwcTSdrvIVqD79FR26XqcLtPhQbV
         GITFk3f56U+wi5Dzs+yS67ZzsT1i1QDN+zwwpjkzVPadDZiEMItBKq9JJYRCo7xSSNY8
         EytUj6VPdZkmcKXzgwJjfqT8mGVkDx2+ezZYZcvtyAJiBowtsYEC1iWwRIX6MtleOrrO
         5g6qPv5Jh/VM9BwtGYkQoUk28F2wF4C9Fr2SnIOVBgjvEqDkpUQ5Vp1oBA/g9oKvhGem
         BaGw==
X-Forwarded-Encrypted: i=1; AJvYcCWo+bdma+wOEPbmuTcWi4H8f/FiUOweuCsxM2W41s/G3FRzM8KiWvLC/D+C569RPwzG5YR0RySbOkjAq9IFgDlx@lists.infradead.org, AJvYcCXZ0ph+YhJ6dnbQVn355DKm9VQ3Gpb5agQt3UbCbIKswHHKennNy+4BS2QBUMjvgdiIkhICbAiHzoDx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2yd8qfodsKc5mZaHhifxvOaVKfvAXOvPt/X+RGhEhonQ4CJHI
	Y09XjKxNrDFlsD2g92Y1VU8taJr22oX7bQ0VW8zKKXO0PR30o/eUbbez
X-Gm-Gg: ASbGnctcWzAUytRnp5XDuJEQXktsiuL07AfdpMKeJIWj2rtsOjXAuf7szzjd9nwZWqe
	oEqcD/vf6OxS6GSot+Wb9IKLcG1RAZVcT5b79gCCB9usNrmGZb8bCvBfx+ngYp4lz4Y/DxmzhkG
	CfJgufhwcsJkLMcPYt7jS3z+xcnEefP+SkkicleSygwVavZ08KO1dxFJmJ4NjEbRM5mZb7glruz
	zYpBFSXcMBl13PPXpM1+6ygv6//wOnZH/hSJjmVK6jY6qXUISONdL99uGVla5daWZehfYvJaVDR
	QZ1lZ0bwqJ4ATlgA02e3yOxU8ZMvIcAd25BmX3OFD2JVN4PBghm3ovyehHCa6fNnoEGWn46CF6t
	ppl3aGSgxj41vPh7+fd+zxhv+c8MYrdcEn6CYQniDZMghE/aUzqZWbkURlBoIh/zj6Fl9lwSJrq
	Pm
X-Google-Smtp-Source: AGHT+IFiJ49HQNMd/IFx7xIzrrtqMETUdaxARpaq6+DVUgUYdtERBew8emcGESiiMQvJ8usHN1vC9A==
X-Received: by 2002:a05:6512:3e25:b0:55f:6759:a792 with SMTP id 2adb3069b0e04-562636d6328mr1074855e87.34.1757235275009;
        Sun, 07 Sep 2025 01:54:35 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:730:6bf5:b6a:8710:4129:8b95? ([2a00:1fa0:730:6bf5:b6a:8710:4129:8b95])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace8121sm2814508e87.84.2025.09.07.01.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 01:54:33 -0700 (PDT)
Message-ID: <f09dedfc-1f1b-4416-b854-9c4059ba264a@gmail.com>
Date: Sun, 7 Sep 2025 11:54:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] usb: typec: tipd: Update partner identity when
 power status was updated
To: Sven Peter <sven@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Hector Martin <marcan@marcan.st>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-12-52c348623ef6@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250906-atcphy-6-17-v2-12-52c348623ef6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_015437_411737_50386E5A 
X-CRM114-Status: GOOD (  16.87  )
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

On 9/6/25 6:43 PM, Sven Peter wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> Whenever the power status is changed make sure to also update the
> partner identity to be able to detect changes once de-bouncing and mode
> changes are added for CD321x.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/tipd/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index c7cf936e5a61a331271c05b68ff1b77b89c0f643..cd427eecd8a594b7e609a20de27a9722055307d8 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> -	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
> +	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unlock;
> +		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
> +			if (tps6598x_read_partner_identity(tps)) {
> +				dev_err(tps->dev, "failed to partner identity\n");

    Perhaps "failed to read partner identity\n"?

[...]

MBR, Sergey


