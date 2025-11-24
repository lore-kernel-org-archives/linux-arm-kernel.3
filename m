Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7DCFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvxeS/74nBAEFSf4nVKv65BSIxiE58qrGcTM82uuMOU=; b=UKo1QIEz0UEuuvk2ZY+klcwci8
	QRAPT2t0Pb4+s5/sSh2eEWP9DXLtvUSmRuuoCl6jnyYHK2ImOLV0csCIcCAlKgjrP9tV038WUNqWA
	TDiS57LkKwaEBIOQTA+SSS+N4bPHDOdLav67HZdRDW9Zio4murm4NEJOTUxcGvpJ7quASdk9qziS0
	KtQZsbrmS30544mibGL0g7QwbECtJJsH/1eOKi5TlyLooE3q5RDHcxetUc+lYB0QVPDNUSDtWnqzg
	qi7hmg484H7YWEDm6ia4E7Ibg3R9g3ecCZvBVIlkAotA8jaXBJ/53Y6aj/pRMXlsuGT3BFKrPzyjQ
	XZ0AgCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU50-0000000BRxm-0F1Y;
	Mon, 24 Nov 2025 10:45:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU4x-0000000BRww-0XsG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:45:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5957e017378so4274062e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 02:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763981152; x=1764585952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvxeS/74nBAEFSf4nVKv65BSIxiE58qrGcTM82uuMOU=;
        b=cLJ6D51sZFOXVADphZsc1mNfwjwSdMGv4NxLIOgZdYz2MGhTIcX6MymBT5Mk27XwkF
         uVHghWX6NqDxgE1PBMni9Ra5PHQF1Zs1R+Wa0ZXwjdH0pQCzptP/gT/R3CITRCvszBrS
         xISQL/RTu9+pHY+JTfM4qh9FJpnNQbtmVBLBFVOjsZPX6enxCDk0WVOB9VH3DqhkeZsd
         ldW9fcunA/lkCjsb8glmOr5MVeYGwQh35u6HAdJ+y2lXxLfIYXU6vQJW/jIdRjJOZvRE
         9ezcpiNZn3xx8L2i19scYeVySaRi9SV418L3SSJqUqBiyYTSoN1651UZdYnbyfXfW0E7
         ez8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763981152; x=1764585952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvxeS/74nBAEFSf4nVKv65BSIxiE58qrGcTM82uuMOU=;
        b=Nk8XeuZsrXwdwRmx0JtoPrIDVBibrJIzZBGGkuF0EA72XeG7bfS7Aw1ow0S61ehLYU
         IoYswirGwQOd9EIhgbFnnF7Xv/QZgBM+iFXBIsMhMboJsLXO+CkEAdvsyjvvgCf629dc
         gWC3U85OT0CV2c17GNeiy+KZBmRbDX29qh17e8HLJKKJQgBvGE5EsU9It3F5ZQzBZ4vL
         LfMeZ2BG3b18WOlzvzTYUZh6jVe8ASX1EOmI0SLwHLdYdu27Rj636lmqPjaEMlOkLb+z
         ssVjEPCSCIeMlt18pxExzifLlNsFFZItj/PIMTfo4ZbipS91MuoTTMfSNTrUua2QDNTk
         ohcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa7HTwkXqPOKtyFTa74/lzt2hhiKzbW5HamXUXS9mWvqAQW5ogOsFwrma7K+TCIb3wX3T5mFgkvhiCCtNB0j4z@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXwhLfti62Wrw93ujiY8aYLzcUHH6uSfUGDNu9YE7vhfNr6hG
	0uNh6q6A0m9bwnfWsiU1w8q9LGE7dYau/4YnfNczT3A3r6jTwDioctor3P5ve8VX
X-Gm-Gg: ASbGnctyjQZg5+rOeNU8MJxoWQZSy4zUlHjUzQDPfv1PvSng+pt333b9e2ze9JEzh8L
	NSArUOoptxYAia2qRcmAbEFdgqYmpAHUj84OT2DT8W4lawPyJ0YDh5tHQqJGT4S6nCHfrXtcF2R
	DbK2Lapsmwb3B1Y868mVseyJX2ndhT9deTKeYMa6Go+2vDK/DEESftRJT8MA/rynwSSA4dl78pu
	jKdJRj4qOrv/W739g7xScRy0zjwxQNzskFMmC+M6bsAZZjrVOFr/eE9iUlvcZNlJZrwR+PvZyyw
	rhlGPG2O1L96R3C30r5k+tnSYSKrcWzcgfRbvipUeQMAJLRoaA3pqB784BD7WUaBv0rS6sfl7vt
	OLbOqLw/ty6vWZ4ajGRmUOzI16NLhF16bgnInkqqn5KYX06W7r8JvaIxCCTig94FjmrQIOxgYRB
	qSpgrJUOjFN3pTdw==
X-Google-Smtp-Source: AGHT+IGzb+yApYHtjewkoQzx7FPWIVvgfb9lCElhP6A4EWOQNvayCoMjjLyY5L5QUpilRr8Cj3haxw==
X-Received: by 2002:a05:6512:104a:b0:595:90ee:f476 with SMTP id 2adb3069b0e04-596a3edab46mr4292946e87.28.1763974136131;
        Mon, 24 Nov 2025 00:48:56 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5c5dsm4019850e87.79.2025.11.24.00.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 00:48:55 -0800 (PST)
Message-ID: <6ee209b3-4d7a-45a8-bd65-6a51730d458d@gmail.com>
Date: Mon, 24 Nov 2025 10:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Saravana Kannan <saravanak@google.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com, Wolfram Sang <wsa@kernel.org>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, Matti Vaittinen <mazziesaccount@gmail.com>
References: <20240411235623.1260061-1-saravanak@google.com>
 <20240411235623.1260061-2-saravanak@google.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20240411235623.1260061-2-saravanak@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_024555_221850_970FA52D 
X-CRM114-Status: GOOD (  22.75  )
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

On 4/12/24 02:56, Saravana Kannan wrote:
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>   drivers/bus/imx-weim.c    | 6 ------
>   drivers/i2c/i2c-core-of.c | 5 -----
>   drivers/of/dynamic.c      | 1 -
>   drivers/of/platform.c     | 5 -----
>   drivers/spi/spi.c         | 5 -----
>   5 files changed, 22 deletions(-)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 837bf9d51c6e..caaf887e0ccc 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -331,12 +331,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>   				 "Failed to setup timing for '%pOF'\n", rd->dn);
>   
>   		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> -			/*
> -			 * Clear the flag before adding the device so that
> -			 * fw_devlink doesn't skip adding consumers to this
> -			 * device.
> -			 */
> -			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>   				dev_err(&pdev->dev,
>   					"Failed to create child device '%pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index a6c407d36800..a250921bbce0 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -178,11 +178,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		client = of_i2c_register_device(adap, rd->dn);
>   		if (IS_ERR(client)) {
>   			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 4d57a4e34105..19a1a38554f2 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -224,7 +224,6 @@ static void __of_attach_node(struct device_node *np)
>   	np->sibling = np->parent->child;
>   	np->parent->child = np;
>   	of_node_clear_flag(np, OF_DETACHED);
> -	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>   
>   	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>   
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 389d4ea6bfc1..efd861fa254f 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -743,11 +743,6 @@ static int of_platform_notify(struct notifier_block *nb,
>   		if (of_node_check_flag(rd->dn, OF_POPULATED))
>   			return NOTIFY_OK;
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		/* pdev_parent may be NULL when no bus platform device */
>   		pdev_parent = of_find_device_by_node(rd->dn->parent);
>   		pdev = of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index ff75838c1b5d..17cd417f7681 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4761,11 +4761,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		spi = of_register_spi_device(ctlr, rd->dn);
>   		put_device(&ctlr->dev);
>   
Hello,

Test system testing drivers for ROHM ICs bisected this commit to cause 
BD71847 drivers probe to not be called.

The devicetree blob overlay describing bd71847 enables I2C1 bus on 
BeagleBone Black aswell.

Probe is called when the driver is used with HW connected to I2C2 bus. 
I2C2 bus is enabled before overlaying devicetree blobs.


---- BD71847 Devicetree overlay source ----

/dts-v1/;
/plugin/;

/{ /* this is our device tree overlay root node */

	compatible = "ti,beaglebone", "ti,beaglebone-black";
	part-number = "BBB-I2C1";
  	version = "00A0";

	fragment@0 {
		target = <&am33xx_pinmux>; // this is a link to an already defined 
node in the device tree, so that node is overlayed with our modification

		__overlay__ {
			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
           			0x158 0x72 /* spi0_d1.i2c1_sda */
           			0x15C 0x72 /* spi0_cs0.i2c1_sdl */
         			>;
			};
		};
	};
....
....

	fragment@2 {
		target = <&i2c1>;

		__overlay__ {
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <100000>;
			status = "okay";

			pmic: pmic@4b { /* the "test" defined as child of the i2c1 bus */
				compatible = "rohm,bd71847";
				reg = <0x4b>;
				....
				....
}; /* root node end */

---- END OF BD71847 Devicetree overlay source ----

Reverting this patch from linux-next from last friday fixes the issue.

BR
Kalle Niemi

