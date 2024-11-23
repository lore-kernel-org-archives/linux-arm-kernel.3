Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F263D75E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omCwbXAxblXgy2lEx2YkM0H50yCIOCnOZwzstmON1PY=; b=IhsQEZqj/cY8tg5kG5QumsF01n
	fP5jZZKraN1DoydC5Vu9iYlTGghHyI9wNs5Tw3Up6cl14XvG1T4DeI2hBl9ECNtXG77ehgPsjlPt0
	XZ+L8ep4qK0Mm4oTsV9SXeHHoBCWTmSvlJXHGbI3honfeg3kScmMRWv0d9EfHhULbQZmcEc9Ev6Ot
	c7wUz80Z2UAMK5O3NJv8DfupwesmJyQDfchWVvBjdnkVGmN37k2rVwm2lL1RI29lmALSWV4jTfhtU
	b578sO6cCEiTuIhjGCL47ZBym5qTfeURHNziV7AHee0PVJ7vYXGK2/936ozEMsJ1M2rlmgATmn5fY
	Zcf/Fv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvxN-00000004nEE-1DgZ;
	Sat, 23 Nov 2024 19:38:13 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvwQ-00000004n3u-3eTW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:37:16 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 541681c2-a9d2-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:37:09 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:37:08 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 08/18] leds: lm3532: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0Iu5Noc_-hTmNLE@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_113715_055409_C59458AD 
X-CRM114-Status: GOOD (  11.88  )
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

Fri, Sep 27, 2024 at 01:20:59AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'child_out', as an immediate return is possible.

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "reg property missing\n");
> -			goto child_out;
> +			return ret;

return dev_err_probe(...);

>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
> -			goto child_out;
> +			return ret;
>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "led-sources property missing\n");
> -			goto child_out;
> +			return ret;
>  		}

...

>  		if (ret) {
>  			dev_err(&priv->client->dev, "led register err: %d\n",
>  				ret);
> -			goto child_out;
> +			return ret;
>  		}
>  
>  		ret = lm3532_init_registers(led);
>  		if (ret) {
>  			dev_err(&priv->client->dev, "register init err: %d\n",
>  				ret);
> -			goto child_out;
> +			return ret;
>  		}

Ditto for all above.

-- 
With Best Regards,
Andy Shevchenko



