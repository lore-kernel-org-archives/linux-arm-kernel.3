Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E166E66882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u3M3w02LezEjOptMF8hHSnJFAOyRfYUWSJ4V7C/EzM=; b=il7azXplOwLKTfiLmr6arfDq3s
	ScFNqUGr/mvNr0J2UZiYXLHswjyjVC/UvnOgiJCE8joNzOHaa+Cok/J3cAhUcXCBaxh6gPyY7xVtq
	iSplZO9GHEY5oCMayXGqAH+6ogMyW6++O7m5PW1jN23ndhCX2oI3ZrAOq2qVMcGFCtpD7pcDKlve9
	//VqMxwLzP1x7xpFtasQNljCSKq22iD5I7FbrW+UYbqsItgCVIP+qgcPmfS23+wHLf0smuKzITxxP
	aJUTbcERAd3ovyN/1nYwyLJQbuo8QS1spVyA/aWHnDDZn1IXA2GmXFbnip5vnpoMHOjig79wYKeIh
	BiUjZa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw5n-00000004oAN-1wkz;
	Sat, 23 Nov 2024 19:46:55 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw4r-00000004o2K-12pG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:45:58 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 8b65e59b-a9d3-11ef-8881-005056bdd08f;
	Sat, 23 Nov 2024 21:45:53 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:45:51 +0200
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
Subject: Re: [PATCH 13/18] leds: pca963x: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0Iw77gpGgIE6fLT@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114557_443218_33EFBEB0 
X-CRM114-Status: GOOD (  14.32  )
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

Fri, Sep 27, 2024 at 01:21:04AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err', as an immediate return is possible.

...

>  		if (ret || reg >= chipdef->n_leds) {
>  			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
>  				child);
> -			ret = -EINVAL;
> -			goto err;
> +			return -EINVAL;
>  		}

I'm not sure how interpret this message, but the problem here is the shadowing
of the original error code. Hence I would split this:

		if (ret)
			return ret; // possibly return dev_err_probe() with another message
		if (reg >= chipdef->n_leds)
			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' property for node %pfw\n",
					     child);

...

>  		if (ret) {
>  			dev_err(dev, "Failed to register LED for node %pfw\n",
>  				child);
> -			goto err;
> +			return ret;

			return dev_err_probe(...);

>  		}

-- 
With Best Regards,
Andy Shevchenko



