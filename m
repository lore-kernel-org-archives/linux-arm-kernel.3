Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D5E66882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlPy/CGqNCGcU4xj6O8ddrlXpc7JHUlfmC6njU1qc/s=; b=WriNhCRrjoWOcKi+IH+7FyZWpn
	NgZ/IC7nBtj+bln9L5mZgaVLUwFyZfX9YTtpXu5DXdt74/wAwNZDpeH1gAM/J11QTqBoRyDGHwj2T
	hNFMQaDBRDpwSwKwnP7H/0rVy7gh6b1pSzaCfcXIlV4HDJ8BIMPIkjsWoDgQ0TvEJGWEvmKPXcxxl
	S7GtUZCvYtCMYq+ZN/3BbtsH2jTRy10gM2THAQOOhBg1ae+6gU9ZhDK8G0BbB4ouyXpa1B3cT0K4T
	he+2ETUmkC2RBLHtRxtcdQQQidNmZ5Qqr3xjBwNrgaEMhImbi3jwHY8fDeKH6xfyF0zDrIlqne85j
	xDi2ulqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw8E-00000004oVI-1gOH;
	Sat, 23 Nov 2024 19:49:26 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw6Z-00000004oIo-3pjv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:47:45 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id cada6636-a9d3-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:47:38 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:47:37 +0200
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
Subject: Re: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IxWdV8ZWhJ5Pp4@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114744_099304_D207B493 
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

Fri, Sep 27, 2024 at 01:21:02AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.

...

>  		rv = fwnode_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> -			rv = -EINVAL;
> -			goto err_node_put;
> -		}
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> +			return -EINVAL;

Again (yes, I know that is original issue, but with your series applied
it may be nicely resolved), shadowing error code. Should be

		if (rv)
			return rv;
		if (reg >= MAX77650_LED_NUM_LEDS)
			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



