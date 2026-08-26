Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D8C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 03:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mu2NyNe4pBuXTFj+pt/gkLlRBQQ7TS/+O1WH+QLtskU=; b=rGqbb2jwtgYL4ZwqOhnTTMRmvq
	3Frip/MUA1GoNhFog1gSUNhjP2Q9UL8Y0chC3aJs6SI+zn5LGj7/obqzwfQo7q19mJY57+dCd5ELN
	H8ASZduxP2KFGDuGJ47b/N/qZQdd45x3/gOMAV1iD15M6yx5+p9UTLgTGAHc+f10+ZDImXPwJMeqg
	QCfzG7GrtqFDof31GlVF37BIsWC1per2Gax8UfwiuiL7Z5F3Ilm1+aQ2srLKA5TPuL+g34w5qa176
	/HU9cLSDgCOUVA0shQVVWTjhO0Uv21y7wTZISeJf9o/79m0vhdLqeIOlSAWdPVI+ukXhXws2DoyUg
	WO7gokww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4Nc-00000001qsN-2fIY;
	Wed, 26 Aug 2026 03:32:48 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4NX-00000001qrw-3cSf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 03:32:46 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-782af6c753cso387595137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787715162; x=1788319962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mu2NyNe4pBuXTFj+pt/gkLlRBQQ7TS/+O1WH+QLtskU=;
        b=IdLuhBgMZmdl4x/vudXIEau5VhqHCO/c0jHjZCo5BrxMaNn7BGqczll8Q/Ms2szoIk
         4A3gHBuA1Xh+fhEVJ0589ZvWp1PweYyNbwOnZla/0zcm4hoxHufO60kg/9kma2Eoa3p8
         Y/0IEGCvo8b3sDkwfe/CSzg1DjA9KwHhGKgYaptY9MrrTU2xAae39lvFl6PwQFF3ezwS
         stct9PKSlKxkxCtbFqa1czcjRKOnhfzoLUNi978dRXedigyuQfJEln9NxEuxgMmU/CMD
         awJv/JcGGgLhf7tpEbAjR6Ds7yUOHVD7LtXWB7wUv5UWWeLEOTeqOepij4tdG0s/ZQl1
         6cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787715162; x=1788319962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu2NyNe4pBuXTFj+pt/gkLlRBQQ7TS/+O1WH+QLtskU=;
        b=ZEA5phaR+0Xypy4+TpYiwRbRvUI0rehgZoIEwG/7iTT1zAgq8liP1z7ST+nt3e+pGV
         fOH/xjg0eqlhRO9t+gTPVnXf+7F38Ya5rEejADXOcng3Ubt+nOuXE2TFx4rZARhh2YB1
         CtTVQku2FLUVG2DbMYVwXxQuL/TZAvaaut5PE6wfHKsGBIohuALQSpjwNItBCGuw98VK
         t46zsqXYkGLfLxRVlULm99Qo+FOyEOKepsTm2KUkUnQ4qh8WVeaR076QAwJKZrD21iga
         ODOphCE/EHs27HnAsu6nXkiT2Q/RI0EyHZrrBe9CqTnMxW5W3UwUBJ7sMfr5H3RnavhC
         ZrjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa24pOHx3Px/vryBiJj012U1E6n+GaMsOP3NkcTQghi9qTztGavCEUfGx8p2MY7lGnCKnAggfPlwBt41Pmupto@lists.infradead.org
X-Gm-Message-State: AFuF++nW7n8814wxjQOuEC6XWaKgyOV94v9tl0nEeWxHCW6MfgIvXSr6
	0IA7g64BD8yv9M+BHadHU8iB7/TYylveM0tVxqSv0e0ds3Uz15JKz/qz
X-Gm-Gg: AR+sD10gUTirh7mScB2bJysiHSbe6ICvjO+oY0OhWNbxvyThhTJu3v9yGIENckdQ/CB
	LhXKKLxezvHCFJxI/eq1Ox8D3G/6NHW1SQGWeCjU/YmS9i5zNdXRNb3zZVTd+k5V4JdJAwTUM6s
	0AyzmNZLGZl5PgWpbbh0U2eZWQwMvI3mFOqO68Hmovn1pDq7QDJ7h+2pvEjd7/QD+UXYUxQ7H04
	J6tIUOYAWNEpfo0Eb20uFg9WAOXELdTYSPfc+KW3ouVHo012da/eVGlP+CAhQdTnOLO+5CctBWi
	BlC5T4oe2R3u8cLooPG9K7Z3isMKPTloZASIKF9qNk1idCDhY4i9x6+wYXyfKnspEtDx6T12KdP
	iVaKkjml+aOogv4GzHQGxsvfe+3K9ZK3UqsV0dq13+zxCaUE5ZNXhFlLBIYIFgrNEhKjN8PV719
	0blYG00KkGCwERWgBW8Lrc7OYZPrJs0cCe0KwUInpnm7rzQFvI6HcO5Sox0E8Mue9V8i8r7Q==
X-Received: by 2002:a05:6102:c48:b0:77d:a23d:ae70 with SMTP id ada2fe7eead31-782c3b0ffa0mr1308304137.14.1787715162180;
        Tue, 25 Aug 2026 20:32:42 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe0f633esm703861241.5.2026.08.25.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 20:32:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 00:33:23 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] iio: adc: bcm_iproc_adc: use
 devm_add_action_or_reset()
Message-ID: <ao5eg99l_FNHDosp@debian-BULLSEYE-live-builder-AMD64>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
 <20260825172155.250484-3-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825172155.250484-3-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_203243_940040_8CE503BD 
X-CRM114-Status: GOOD (  21.83  )
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

On 08/25, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Replace the manual ADC and clock cleanup in probe error paths
> and remove() with devm_add_action_or_reset().
> 
> Register cleanup actions immediately after enabling the clock and
> ADC so that the resources are automatically released on probe
> failure and device removal.
> 
> This also allows the cleanup labels to be removed and the
> iio_device_register() failure path to return directly.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
...
> +static void iproc_adc_clk_disable(void *data)
> +{
> +	struct clk *clk = data;
> +
> +	clk_disable_unprepare(clk);
> +}
> +
The above callback is not needed with devm_clk_get_enabled(). See comment below.

>  static int iproc_adc_read_raw(struct iio_dev *indio_dev,
>  			  struct iio_chan_spec const *chan,
>  			  int *val,
> @@ -551,9 +565,17 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to enable clock\n");
>  
> +	ret = devm_add_action_or_reset(dev, iproc_adc_clk_disable, adc_priv->adc_clk);
> +	if (ret)
> +		return ret;
> +
Hmm, the whole clock get/add_action/enable sequence can be replaced by
devm_clk_get_enabled(). Unless the ADC needs to clear IPROC_ADC_AUXIN_SCAN_ENA
before tsc_clk gets enabled. Otherwise, the update can be done with fewer
LOC by calling devm_clk_get_enabled(). Also, since adc_clk is only used during
device probe, it can be declared as a local variable rather than a field of
struct iproc_adc_priv. So, in addition to updating to devm interfaces, patch 2
can reduce struct iproc_adc_priv size by keeping adc_clk as a local variable of
iproc_adc_probe().

>  	ret = iproc_adc_enable(indio_dev);
>  	if (ret)
> -		goto err_adc_enable;
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
> +	if (ret)
> +		return ret;
>  
>  	indio_dev->name = "iproc-static-adc";
>  	indio_dev->info = &iproc_adc_iio_info;
> @@ -562,29 +584,18 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
>  
>  	ret = iio_device_register(indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
> -		goto err_clk;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "iio_device_register failed\n");
This looks good, and can become even more concise with iio_device_register().
In addition to patch 2 (clk and adc) and patch 3 (mutex) device managed patches,
add a patch 4 updating from iio_device_register() to devm_iio_device_register().
With that, all device resources shall be released on device detach and
iproc_adc_remove() won't be needed anymore.

>  
>  	return 0;
>  
> -err_clk:
> -	iproc_adc_disable(indio_dev);
> -err_adc_enable:
> -	clk_disable_unprepare(adc_priv->adc_clk);
> -
> -	return ret;
>  }
>  
>  static void iproc_adc_remove(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -	struct iproc_adc_priv *adc_priv = iio_priv(indio_dev);
>  
>  	iio_device_unregister(indio_dev);
> -	iproc_adc_disable(indio_dev);
> -	clk_disable_unprepare(adc_priv->adc_clk);
>  }

