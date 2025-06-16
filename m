Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F7EC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fozdmCAWMyOAs3p72EEWYMApG9+X4azDWL8aPdMiZic=; b=hKBGcA7+85XKkwwyF98z0jn62K
	4vfAcAwXoVtvbwwcZ6yAbPmqaNDsraBdxwSbeMmw9OBTMY1c2mS4poHP7IbMYKqnJu0QkgXzlELZm
	G0rw2XhVk5TuWGd48KSg2iXrWJis7HJnhHKYT0R5Og4VITws8Fi/NIISJq4yTY6eds9hwU9OG7h81
	vzNjG8PhHI2+0o1NJpA5v0WAQkS0IzbRYVfow7NAR4jX6SIqFyt63AX0l+OXYUybmPwVjA/XAIUdX
	pY4oG2TSjhBF206eHYhVzLjxwBh/CYAjmW3EzWJDN65mmKCYp28U8Lxyws/AzwAKKqydaAtTfJKne
	hEPu79zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLB-000000054hO-0rLW;
	Mon, 16 Jun 2025 17:09:49 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAis-00000004guL-41Vn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:22:08 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a44b3526e6so61200061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 07:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083726; x=1750688526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fozdmCAWMyOAs3p72EEWYMApG9+X4azDWL8aPdMiZic=;
        b=Wl8FYUMv0QXHbHdcf2TYssurAX2hAsU5nk+D9tZdiGTnzVftCwZGl3kHOCjmSyQFrC
         KtDx47mGh74+Ht/qiB2P9KP2V79HatCW9ZC4BCeD+bt6yzcZqEoDNW2Rh520nINsBMw7
         hWKnuVnZm3z07SPwXWl5ay+L50/cb1sY7yOfQPgjcsc7zxBUS/4ZTJWQrQYA9k7O4woD
         ZvkvZeqKnBZbZbC1Y5v+cPn9IpBJjoO5KQ7On294tPcPiUWmMJ2bg7elX3PxxujN9a3v
         1842+bHQKzuXlwb7lXwZ8DC8RhEziOt065EFmHU1Hyx1AQwlk6aNtnxcTUBpSaobCBuw
         BPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083726; x=1750688526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fozdmCAWMyOAs3p72EEWYMApG9+X4azDWL8aPdMiZic=;
        b=UJofwztxTjWtfcXcb8UZy9FxmN8vjQhj35P2XiDeRxgJTqqoDf4+CgtCaplQghmAby
         Vqfo0KobX09fkVYdGqjRnUrST1lxIHcdaIbiEvXHnIAVn3Vn3MdFmUmQFZ3MaMHVYIGC
         6I5QAzxbtv1sevQ2UNZvKbRIU9Oq2++TCKV6mW1udL3IxzWBl+BuukZujyLXKoV6QE0W
         n/Yo6adxdTjb/M0U97JmNvPyGHka7TmyF+QntB33KOHgnP/+fNAJ7955j4+P570JcncK
         5Kr2y+sloYKmGdyQralod2Mspo9omtRlbDRDeaqEKv6xB0+bsY0k06aCsjDF1hGm6m1m
         22Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWoecr3BP01NcNErECOf1aNAvNMRvYeq3KWthLAI+H1V2DzAs6piFGxOlPK1IaNH0NYhsMeBF6BYNQdyHEg+Uqb@lists.infradead.org
X-Gm-Message-State: AOJu0YwnkAmcsJoZqT6+x9gVQpelXLyku8XkdBZa1dk1eMyhsvcmODH6
	Yus/CKbVyjjaBFwDj4c+QqfDi8T3SJZofGwlotcxHFO60/4wTRBJmoFE+63Rt1rKHA==
X-Gm-Gg: ASbGncs1tBRGLFsRh/BC4JR3Q7679mxiU74zmYsQRdDCP++h1RlNqfDFC1mabrz5IDE
	/SFBhmtAm+QR+vdNLBQTQkztLwENTyrA3HO8F2RRgS8DqtN79a00keyXGwPUx7Mm4ffTywAS7FC
	HzK3L24gLs5/AsnVBkyfS1b11gEnh+bkOxLySWS7UrFTQ4JOCNnAQO9ocrk4xzhfbz9qjkGBbmG
	JhBIpWFMzn9KpSHswySFLPZp8qE3pajdrtRf5EdAtWI1dQ9z1nRQgRwyg962FNI1Wv6L9howCer
	a/UGD85/ixQGe96F8CoT1BobE8K5hY+X/omyAnfm/sP1fxQV90XQujOEhkbD4qbBA94yoz3uL49
	X4CEn
X-Google-Smtp-Source: AGHT+IF+uW7h6BydcaXEhoofxRMfhUEGoTFOUQys1M++I5eYRv90JMsfWUu2mw7xHfP3lolLk7Wl8Q==
X-Received: by 2002:a05:622a:303:b0:476:8288:9558 with SMTP id d75a77b69052e-4a73c5c1853mr140268961cf.46.1750083725716;
        Mon, 16 Jun 2025 07:22:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a313418sm49589591cf.34.2025.06.16.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:22:05 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:22:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <7378855b-7ff0-4f9b-bb7a-f187aeb41956@rowland.harvard.edu>
References: <20250616061759.3384-2-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616061759.3384-2-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_072207_003837_7725B9D0 
X-CRM114-Status: GOOD (  19.96  )
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

On Mon, Jun 16, 2025 at 09:18:00AM +0300, Mihai Sain wrote:
> Use the dynamic device name instead of the hardcoded string "at91"
> when creating the OHCI host controller driver.
> This ensures that the device name is more flexible
> and correctly reflects the actual device in the system.
> This will be in sync with ehci at91 driver.
> 
> Before this patch:
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: at91
> 
> After this patch:
> 
> [root@sam9x75eb ~]$ dmesg | grep usb
> [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
> [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
> [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-at91.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
> index 5df793dcb25d..12fdb18934cf 100644
> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -193,7 +193,7 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
>  	if (irq < 0)
>  		return irq;
>  
> -	hcd = usb_create_hcd(driver, dev, "at91");
> +	hcd = usb_create_hcd(driver, dev, dev_name(dev));
>  	if (!hcd)
>  		return -ENOMEM;
>  	ohci_at91 = hcd_to_ohci_at91_priv(hcd);
> 
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> -- 
> 2.49.0
> 

