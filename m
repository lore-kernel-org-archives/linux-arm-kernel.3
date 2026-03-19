Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52287108E1ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+PpVZE5erbrPF9dFh6ddAFYHha57vLbnGheajyGRz0=; b=nn8yP+VBL+jRAS26IUi6fr9hnh
	ToQt/R0nN+7sRxeFG3VPNdHgn23svn8NaVXYCEhmDUn+K9y+peW+kO04A3X5CiNjoPz1CWITYlZpe
	/2Hi8IiW0YruNgLEvyCnb9dxUqbvlJ0myQOGNc1VQky+oSFoqpojFLKFu0ZWiY4mKG0vT/qw8UQxN
	CrP0pJxtwx4pfGd/2dt34fJ77/Ne1xlUmxz5KpKFwAM5WYJm/2ZPGk1iH+lcfyQFCiLckAJJChYRc
	n2RwkWWgNHlf6vJdN+ZAaKuhV6mLlp9m1Qk9KaZLXGRjtVxxVOMQyGPBQNXXhnSwFoUieI3hAXNwx
	x57xRU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BU7-0000000AWF4-46RL;
	Thu, 19 Mar 2026 11:24:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BU7-0000000AWEy-09aA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 753F66011F;
	Thu, 19 Mar 2026 11:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13790C19424;
	Thu, 19 Mar 2026 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773919454;
	bh=qyYfHN3/rEddBDUxIvXPa1XmaXZUY9tQUYPYQxlmioI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql9sZNAJ5IJDjLCE93U34vjaePEdQ7ctkWPb/kks8sNCMuk+0pfl/hPLsUo7j54T4
	 bsbKOtQNUkMuhWfl9eHcdrNWA1jeHqW4N8v8IdEjs/7H1vsZRpMbIEirhEUa7TE7x+
	 sZDfX2SdQ3BMx7DAUNnY3muvx1eEoRo6WfAxXQDk+AuBE5JnSA7RY41EapzfUCxeDU
	 82sSgkOCGnJba1aFvm0S77EWd9d3+jzwiKjXruyui57pXMVZiO9GjbvfxgJACffHuV
	 h+qr+TQHZ4C4Lh4LcGt1u8361xGnHVQ5fZzPOFDBQRXegb/zASSzKNJi0O1g6C8BKj
	 WxHrDSZ1X6oZA==
Date: Thu, 19 Mar 2026 11:24:05 +0000
From: Lee Jones <lee@kernel.org>
To: Akashdeep Kaur <a-kaur@ti.com>
Cc: praneeth@ti.com, nm@ti.com, afd@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	s-ramamoorthy@ti.com, vishalm@ti.com, sebin.francis@ti.com,
	d-gole@ti.com, k-willis@ti.com
Subject: Re: [PATCH 2/2] mfd: tps65219: Make poweroff handler conditional on
 system-power-controller
Message-ID: <20260319112405.GJ554736@google.com>
References: <20260310111846.1084623-1-a-kaur@ti.com>
 <20260310111846.1084623-3-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310111846.1084623-3-a-kaur@ti.com>
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

On Tue, 10 Mar 2026, Akashdeep Kaur wrote:

> Currently, the TPS65219 driver unconditionally registers a poweroff
> handler. This causes issues on systems where a different component
> (such as TF-A firmware) should handle system poweroff instead.
> 
> Make the poweroff handler registration conditional based on the
> "system-power-controller" device tree property. This follows the
> standard kernel pattern where only the designated power controller
> registers for system poweroff operations.
> 
> On systems where the property is absent, the PMIC will not register
> a poweroff handler, allowing other poweroff mechanisms to function.
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  drivers/mfd/tps65219.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 7275dcdb7c44..beb816707d8f 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -541,13 +541,19 @@ static int tps65219_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> -	ret = devm_register_power_off_handler(tps->dev,
> -					      tps65219_power_off_handler,
> -					      tps);
> -	if (ret) {
> -		dev_err(tps->dev, "failed to register power-off handler: %d\n", ret);
> -		return ret;
> +	/*
> +	 * Only register PMIC power-off handler if system-power-controller
> +	 * property is present.
> +	 */
> +	if (of_device_is_system_power_controller(tps->dev->of_node)) {

The function name `of_device_is_system_power_controller()` is quite
self-descriptive. Is this comment really necessary? The code seems clear
enough without it.

> +		ret = devm_register_power_off_handler(tps->dev,
> +						      tps65219_power_off_handler,
> +						      tps);
> +		if (ret)
> +			return dev_err_probe(tps->dev, ret,
> +					"failed to register power-off handler\n");
>  	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

