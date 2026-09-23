Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2AFC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=; b=aXe9j07Bj3Rf7IoKKlWLpkqpQn
	sQQDvHicvkvxc//Byg9Q+13Ki7SSQUAUKJu9yktN6vXFRWydWyWSaKi7q0l77TFUjkUEJzMk1/kNW
	TccIiDIDxw7OPqrdatnTS0/8cEe6xUk3bBliTDSBRZDumOPygQ98oVenIyQBGH52jN8ncpKglDA64
	YPyYyyFZyjyckuw9MlWt2tnxDbBoICDEwVsHPjKGMoapCOaYd27lyViW7KsighTkATQuyCS1DE7dW
	Bg5iN6XHWN60r1zknIJTeIrBn1SpLhWMWBkGM9tY1TdAjdKBZNr7zfGXWaHjeYqHg6V3SD+wqCbEO
	YQ3j90Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9U5U-00000009Wvy-0kgw;
	Wed, 23 Sep 2026 21:01:08 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9U5Q-00000009WvO-1Rsb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:01:06 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso821223a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197263; x=1790802063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=eJh6DOPniyCCMbs8DqA499L75prOqIVLYcqywwrHvB2w3gYZ1tL4yJ+iS1wZlVrvHy
         fPteK+NjXbzArjlV/0xa9LUVPfPRzjNL84Em1ayE+SlNo0VMNZU+eXitNxE1AdW29eu9
         kuF6ixtQsNarxPOVasBrhWI+nl2GGXYgYNwwjjspWsARVrvbPqhoZw9hLzz77y5oAfmV
         WzAfDtM744BfI3pT5vfvxXZ9KuQgEWN6Mkl2vGK9Pe6EkzX5d1IMYU22+e/KqT/xvPAu
         rmj/S6QIWCGsMHqKMZpK9nYKjDhkICWFPK29PHviTa7g3eUNaEx5yGC3Bgy0jJ4Znp89
         XWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197263; x=1790802063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=kqer6WnnhA9WsuSpcSdVeuoc3jiTduQuPllVAbD71aiY/q52xjx8SnhejLjiFPPXRW
         ZsU1Ei8EBcN0kgLWx3r/rjeXdAFFZhvvQ5nxIStcG7qGGXAgblbanTJObJV10tkO0MFg
         FYSs3jaFcilaWgg+aL19g6fAkxgewLRao3EaxPHcLOcSNMEHMo13hqWItKMutDwEaRAy
         aeQOIiKLFIEWUcsQQ1UH7WtSRNW/+TTri2VPm2o0nWj/dd3GGEGRYYFTuWcb23pF5ziQ
         aA/N72m6vSzl7X7/B2mtR6ZVwpJp2PgAgFJ/yhGT0+xgzK2eZOdY2QNbIGLaw5CqhdM9
         74tg==
X-Forwarded-Encrypted: i=1; AKwUvBySI7edDPsRnDOt4AHv5C9qqdWCD0wKU17W+2RpukLvweDc5E/h7teqIGKiaYxk4MIoMti6wbWw5YV/B9NHnmVn@lists.infradead.org
X-Gm-Message-State: AFuF++n/dTg3KHgQxGNLycq1jzX5SwZcoHYQhWA/Dg6oNlsqybM2gFLd
	arAhaNf41xpxF9FnluibFw9DsZFig/LDBzlrKudCapKkvVVYDTDD1HE+
X-Gm-Gg: AYBFou1OmU65w5J+S2LTqMk3PoHfUtEmmbSA1IzC4ia1D/TfmAXYqgylj7DBc/IdHHa
	gf5VH/X0G7V9tTd9jn6bQFe18vDNuF2As7cb1wLyiR+2v2CnjRRUZf1mJhXlMZdoFTjyHSwCkyX
	A63gOPzfL8ZYRkzLqtfW8JHFoRQKo9B90pUBOm7JndqqQXL0hKyQ286kIydU0Akv4F7VoMD7CKA
	3k3WGw2NkeoFfS1q/e1HBYPzuUdByKNuaP9h2tZGYkSF2JbfpcSdDjTLYOZWUa0OipFrZigUMBV
	OOgJPqFAO4/UY9qMDZMHnsqj+coTV8xuLnrH1Zakh1mU7LX3MRzUE2tUuGi6EFzmTE7WfRO/h8f
	giTV7XVRJaDOYOyNHjGov/FJD3A5UQIjYOO+A5Q9IDlNXynoxvDiDK0ecWNq4n9ZO+7z113NGDQ
	EkMH+R2svwVgBntmEwNW/aTg3n/bwsOuxbiGUDKE5lRZYaNivA9TEEljqeSwKjvkzjb1bjQ0MDq
	P/zUhm7ixD+
X-Received: by 2002:a17:90a:d406:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a09872c528mr260420a91.21.1790197263197;
        Wed, 23 Sep 2026 14:01:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097344841sm850282a91.10.2026.09.23.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:01:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:01:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923111719.2032012-4-primoz.fiser@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_140104_391783_C465356B 
X-CRM114-Status: GOOD (  28.90  )
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

On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on DT
> binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no DT binding is specified the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Note: This patch requires that the config register CONFIG_I is
> configured as writable in the da9061/2 multi function device.
> 

Please reword to something like:

Implement a method to change watchdog timeout configuration based on the
"dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.

If no devicetree property is specified, the WATCHDOG_SD bit stays in default
configuration, not breaking behaviour of devices which might depend on
default fuse configuration.

Specifically, "There is a possibility ..." should not be part of the
description at all, and "Note:" should not be part of the description
and be moved below "---".

> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  drivers/watchdog/da9062_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 3d7bf2f351db..7ceef8cd7425 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -204,8 +204,11 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	unsigned int timeout;
> +	unsigned int mask;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
> +	int ret;
> +	u32 val;
>  
>  	chip = dev_get_drvdata(dev->parent);
>  	if (!chip)
> @@ -245,6 +248,30 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
>  	}
>  
> +	/*
> +	 * Configure what happens on watchdog timeout. Can be specified with
> +	 * "dlg,wdt-sd" dt-binding (0 -> POWERDOWN, 1 -> SHUTDOWN).
> +	 * If "dlg,wdt-sd" dt-binding is NOT set use the default.

This is not really what he code below does.
It sets the mode to shutdown if val is != 0, not if it is 1.

> +	 */
> +	ret = device_property_read_u32(dev, "dlg,wdt-sd", &val);
> +	if (!ret) {
> +		if (val)
> +			/* Use da9062's SHUTDOWN mode */
> +			mask = DA9062AA_WATCHDOG_SD_MASK;
> +		else
> +			/* Use da9062's POWERDOWN mode. */
> +			mask = 0x0;
> +
> +		ret = regmap_update_bits(wdt->hw->regmap,
> +						DA9062AA_CONFIG_I,
> +						DA9062AA_WATCHDOG_SD_MASK,
> +						mask);

CHECK: Alignment should match open parenthesis
#157: FILE: drivers/watchdog/da9062_wdt.c:266:
+               ret = regmap_update_bits(wdt->hw->regmap,
+                                               DA9062AA_CONFIG_I,

Also, this does not require an additional variable.

		ret = regmap_update_bits(wdt->hw->regmap,
					 DA9062AA_CONFIG_I,
					 DA9062AA_WATCHDOG_SD_MASK,
					 val ? DA9062AA_WATCHDOG_SD_MASK : 0);

> +
> +		if (ret)
> +			dev_err(dev, "failed to set wdt reset mode: %d\n",
> +				ret);

			return dev_err_probe(dev, ret,
					     "failed to set wdt reset mode\n");

Thanks,
Guenter

