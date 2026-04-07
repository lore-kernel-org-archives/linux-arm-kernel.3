Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C26EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO0i5DF8EvnkES+hyeEAy75jRio1nx20ZDks5J2KtzU=; b=HZwNvICvqyc8nHNJFNtrkUNVgI
	jy3YA4W1CI2pTlGw7QalNDt7MFAnzJnFvmgoY+1hUABG4fOABYc9bWVYpW7IFzXi1sEgB0BQyKPLX
	on6TmkfSvn54BW2jVKOPLOhyc5f4nIZ1uyy0yGQpCyYDH3xthZGNNtE1xCzDV3uqOXd2rYWItd/Fb
	+d2wpX8o29wkKUbm+i5jiL8Y4truTBR4UNK32PpMe/MxQYoa2jo7UZcnngiyVLfP9FxgRSBP7xdx6
	0VW9X+cKiobc2cEijkM1sulgjRC1cMfWNoSgWfrFTAryYWBeQ78QCm9v1viBbVjOPNfErQ7kGrRGh
	8GSaYk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Oo-00000006CNt-0Yu3;
	Tue, 07 Apr 2026 09:07:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2On-00000006CNe-0iFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 090A1600CB;
	Tue,  7 Apr 2026 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41DDC116C6;
	Tue,  7 Apr 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775552823;
	bh=4NERHreOtOHtxPxrg9hJfCL0sb0Gtcuiwi8WJRXUxIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stgpB9oZ+np9GYARlzUA9ZMs/QvN4KIBqwa1qRYDAwyfYPqyHDzuHCzXPSnlyzgtg
	 EAHXWcSv4E0rrXHIwU/F9B+i1mivT8/hiuEewvUz63bUM7ytEH5SQzK2thj+lYKQTs
	 o2tisu8aVFvQIZG+/d8iAyn9lfuaOQqIZdUeq7k3DZiLr0hgqrYjSRZ2PwzXfNPDL4
	 eowKFIJwq3yekc5lX5NoSnG1UiqaPzINQrHDk6adQBuAm9YxWQDDa+YyftbK/zR8JS
	 kxyiSzhZcnKMojNpglf1PuMqJl8hSj8Ux7HAXRlz/T13loQq/CWQfn1V+eHwkI8KMb
	 5kNMKJjzp6Bvg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA2Oi-0000000AjGf-2EeN;
	Tue, 07 Apr 2026 11:07:00 +0200
Date: Tue, 7 Apr 2026 11:07:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Eric Dumazet <edumazet@google.com>,
	Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>, maz@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Mark Brown <broonie@kernel.org>, alexander.stein@ew.tq-group.com,
	andrew@codeconstruct.com.au, andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com, astewart@tektelic.com,
	bhelgaas@google.com, brgl@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	hkallweit1@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
	kees@kernel.org, kuba@kernel.org, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux@armlinux.org.uk, mani@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, robh@kernel.org
Subject: Re: [PATCH v5 8/9] driver core: Replace dev->of_node_reused with
 dev_of_node_reused()
Message-ID: <adTJNMhsghRs3qwy@hovoldconsulting.com>
References: <20260406232444.3117516-1-dianders@chromium.org>
 <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
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

On Mon, Apr 06, 2026 at 04:23:01PM -0700, Doug Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "of_node_reused" over to the "flags"
> field so modifications are safe.

This flag is only set before registering a device with driver core so
there is no issue using the existing bitfield here (with the caveat that
PCI pwrctrl may have gotten that wrong). I haven't checked the other
flags, but I assume most of them work the same way.

But apart from the commit message being misleading, switching to using
atomic ops and accessors for consistency is fine.

> Cc: Johan Hovold <johan@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Not fixing any known bugs; problem is theoretical and found by code
> inspection. Change is done somewhat manually and only lightly tested
> (mostly compile-time tested).
 
> diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
> index dab8f1ab4450..40e0f1a7ae81 100644
> --- a/drivers/regulator/bq257xx-regulator.c
> +++ b/drivers/regulator/bq257xx-regulator.c
> @@ -143,7 +143,7 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
>  	struct regulator_config cfg = {};
>  
>  	pdev->dev.of_node = pdev->dev.parent->of_node;
> -	pdev->dev.of_node_reused = true;
> +	dev_set_of_node_reused(&pdev->dev);
>  
>  	pdata = devm_kzalloc(&pdev->dev, sizeof(struct bq257xx_reg_data), GFP_KERNEL);
>  	if (!pdata)
> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
> index e66408f23bb6..8297d31cde9f 100644
> --- a/drivers/regulator/rk808-regulator.c
> +++ b/drivers/regulator/rk808-regulator.c
> @@ -2115,7 +2115,7 @@ static int rk808_regulator_probe(struct platform_device *pdev)
>  	int ret, i, nregulators;
>  
>  	pdev->dev.of_node = pdev->dev.parent->of_node;
> -	pdev->dev.of_node_reused = true;
> +	dev_set_of_node_reused(&pdev->dev);
>  
>  	regmap = dev_get_regmap(pdev->dev.parent, NULL);
>  	if (!regmap)

These two uses are broken currently though and should be using
device_set_of_node_from_dev() so that an extra reference is taken to
balance the one dropped by the platform bus code.

I'll send two fixes to Mark, any merge conflict should be trivial to
fixup.

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan

