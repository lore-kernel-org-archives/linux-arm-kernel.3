Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7ADE66882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLNxwOrmjjyOfqrAIYUtQtyPadLoGsBMiHf/FdDfEFI=; b=OFp1W7547JPObTEjnrduhEeeJ/
	SEFuZ38KQit9g22HmZ2XBaia0LkGk5ZWZZqwes9VcGvroTB3Ah5bju65kBzNf/4OakKxlwOPLXS1y
	YHYI/33WgsBm2BgwbldxUgibFBkTK306JmbSm5ipccD/VOsDfsSgrEt9nwCMUiWBvp8QHLT83TjgC
	+//i7aJU7Hk1zdvDsuS076c8cy57VpW9rKeGXitMzzn6eL6hBZaKGTFrEM/VKYp22ngn9x3ioVT4R
	8Z624hIc46gDJTUYve3vuy2X4ob7IH2kircGiuo1NWJAEGyPTT4o1aOhO7wqZIW+4kuDOKKfWz2uq
	Knpsgsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw1y-00000004noL-2MPA;
	Sat, 23 Nov 2024 19:42:58 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw12-00000004nfK-2dRU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:42:01 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id fe29a33f-a9d2-11ef-827a-005056bdf889;
	Sat, 23 Nov 2024 21:41:54 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:41:54 +0200
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
Subject: Re: [PATCH 15/18] leds: sun50i-a100: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IwAug906PT4Db_@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114200_811202_59A4440E 
X-CRM114-Status: GOOD (  14.14  )
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

Fri, Sep 27, 2024 at 01:21:06AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> The error handling after 'err_put_child' has been moved to the only goto
> that jumps to it (second device_for_each_child_node()), and the call to
> fwnode_handle_put() has been removed accordingly.

...

>  		ret = fwnode_property_read_u32(child, "reg", &addr);
> -		if (ret || addr >= LEDC_MAX_LEDS) {
> -			fwnode_handle_put(child);
> +		if (ret || addr >= LEDC_MAX_LEDS)
>  			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
>  					     LEDC_MAX_LEDS - 1);
> -		}

This is a misleading message, what should be done is to split them:

		if (ret)
			reutrn ret;
		if (addr >= LEDC_MAX_LEDS)
			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
					     LEDC_MAX_LEDS - 1);


>  		ret = fwnode_property_read_u32(child, "color", &color);
> -		if (ret || color != LED_COLOR_ID_RGB) {
> -			fwnode_handle_put(child);
> +		if (ret || color != LED_COLOR_ID_RGB)
>  			return dev_err_probe(dev, -EINVAL, "'color' must be LED_COLOR_ID_RGB\n");
> -		}

Ditto.

-- 
With Best Regards,
Andy Shevchenko



