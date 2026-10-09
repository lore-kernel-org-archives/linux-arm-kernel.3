Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB8CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI0teZcXrHycO5RdYnELojTgh/o+UFCV/n+9LzyZqFg=; b=3i6Q7tBarvia4vpqSI2coMhVzL
	0qfbEZQBh9lm1s5diFSU6TQ9mV4w/iyBquMl2MWqQc7qAwnoJ9Rt5HM0XX8T+leGH1u26azb1ZPR+
	MNMn5IotGinurAhsUiM9HHogSwgK4BBNmgWdt3S2SU5BKlgfGjdv9LdG3nTyLFUWYf47MvivYFPvv
	99s7vAkCrD0Axy7HKywH9Xo2+RLz8RWgpeqKJD+KaX2x0JOmO384nA/ZWAjPIcUpi/orlR9VeezOY
	9qYethw1zqJQ6IGX3BC8zsRleHMgLy0/UbUFraLQNvulJnJGYR6kLNvyTn2joCZQBzS04nVL00I7e
	IDr7DZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4lx-00000005hDd-09aI;
	Fri, 09 Oct 2026 07:12:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4ls-00000005hAP-2sN1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:12:02 +0000
Date: Fri, 9 Oct 2026 09:11:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791529915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI0teZcXrHycO5RdYnELojTgh/o+UFCV/n+9LzyZqFg=;
	b=X3sIV03mGRKoi7W8A8eLx21lFQPk9jNvzBAIVcDFgpTgkCEXR3BOBvxukpbzsI6qt4reRZ
	u0U9jOaAH9hG4rsvdpa5JfYLRg6VRuPfnFUq7Yn7lOM4/Z6sGhlDTN0vKoiRGnt81Z+F+t
	hdjl51it/uC+VSPkeIkGsx+iMqOV3+MNtthUdtUovz4Sl8emgaCgXLtCTygyaF16VvJbeL
	oJlMBJtml6YpUkxWTRq88TIww9eXnU5zJsL2WMBK8asW+vZ3qAYVVSRVNUoOrmCIxiYBfT
	khqmkEyZMoPwM6v2b9ZOnpwYdUPQdCp/VJfgwTy1ags17xJmfPS+WkjPsdU5/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791529915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI0teZcXrHycO5RdYnELojTgh/o+UFCV/n+9LzyZqFg=;
	b=+soDEjPxyf7SrT/DzxVpdDu44pE7aWoLjRK7cUgf3pcfnbJ8WFq2o6tDuDmZbsjly7XNh0
	ErnOHbhE1ujbCWBw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT
 registers
Message-ID: <cfhxi3zbkkhnslbocne3moqdm34zre7x2qjdizlrlpmurcl5hj@vdvp5aevi7gk>
References: <20261009003201.68288-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001200_872490_2590D3FC 
X-CRM114-Status: GOOD (  30.02  )
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

Hi, 

On Fri, Oct 09, 2026 at 02:32:01AM +0200, Karl Mehltretter wrote:
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
> 
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
> 
>   sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
> 
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
> 
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
> Tested on a Raspberry Pi 500+ with v7.3-rc4: the message is gone, the
> SDIO card is detected as before and Wi-Fi works. Suspend/resume, the
> only user of these registers, was not tested.
I have seen this error a few times but newer looked into it. Thanks for the fix.
> 
>  drivers/mmc/host/sdhci-brcmstb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 1de2f05..7c17a3c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>  	struct sdhci_brcmstb_priv *priv;
>  	u32 actual_clock_mhz;
>  	struct sdhci_host *host;
> +	struct resource *boot_res;
>  	struct clk *clk;
>  	struct clk *base_clk = NULL;
>  	int res;
> @@ -534,9 +535,13 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
>  
>  	/* map non-standard BOOT registers if present */
>  	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> -		priv->boot_regs = devm_platform_get_and_ioremap_resource(pdev, 2, NULL);
> -		if (IS_ERR(priv->boot_regs))
> -			priv->boot_regs = NULL;
> +		boot_res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +		if (boot_res) {
> +			priv->boot_regs = devm_ioremap_resource(&pdev->dev,
> +								boot_res);
> +			if (IS_ERR(priv->boot_regs))
> +				priv->boot_regs = NULL;
> +		}
>  	}
>  
>  	/*
> 
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

