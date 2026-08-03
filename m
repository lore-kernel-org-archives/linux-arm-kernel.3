Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A861DC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He2QS3aqruPkEmo3ml3RnizkSIK2y54nrSWG7gf9bV8=; b=wOoY4O13zVBbfptwi3N8qm5Uk+
	6ZPpZs1M+WFUzREOPmlyZtzr3oFXdwd3MO/dCRPyTKytVGUUlW6vWNfepExs9XVLlOs3wH3+j7e5h
	8RYEPeRI12uWkh/0A2XrE1PCgACbY9mb1sHOMortKN+lLQfvUH52ZgRjE1UmvlAZ1OjaPfftSUfQv
	80bSmoMHaov/9o1xQBJcT+Mnx5bzzE6EHAtnTvZVXBtY+e8sQ9EdCRZ19QbC9R1rMMnCeeuRwNOef
	Lljxurd2Vc4xf63njWDri4e+CEovTl7MZswjiRglOLPyPEdHbOnQvvLcQ46vWUevtzzv00TqCm6Fx
	eUvY4gHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrdY-0000000H0Y5-1VA6;
	Mon, 03 Aug 2026 12:19:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrdW-0000000H0Xd-0c0X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:19:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so9704715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785759555; x=1786364355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=He2QS3aqruPkEmo3ml3RnizkSIK2y54nrSWG7gf9bV8=;
        b=nqHCxcIg02t8EeMC6VWW9aCJh3qVNUiDLrMwOR4qKmUDqx7jhSlweToqZ2oupVAM0C
         O5LSHC+AIlGVRAXs9tOKIv95OcX0ZXJMhx7iKi7K/CTC3MDBefQ71ouvpYHyc2LIwxjK
         z0/LbAY+tuCxUox7ZJDpYoWAs6ckw+RNMIz9zUov7hapgWrYZtdr4pkeKB/2J+oIaYfZ
         fb2EJY/QGN/2y+RomUYReWor7BC4V2KTc/jYBZ7KTT4S/lri+LAuvZT24PPayZ109BeB
         ZbAnSDwoL3APEo9VkbEfzUdzCcHWMp4elyyCcfpZPao6M82v4iB7vR/V+WgaNp/Qmcbx
         zkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759555; x=1786364355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He2QS3aqruPkEmo3ml3RnizkSIK2y54nrSWG7gf9bV8=;
        b=W0OJIjZVVGlGXI6Py7Y6Ga3f7icFay+2e+TkPqTInbS18zOX0aE7GON4nY0Ur5XCjK
         V5Z12IT07jKNtH+W95vmFCBTWH+DChRQdl3g4XYKi3xK068hZaad/hguNHgpCAJAPva6
         7jpVuhpQZ/4bznjPN3qFi74VeibLEwN82ZoUGf8+7XhKqb5qBgUCRpG+jrzKt49s6yKH
         BuE1aSw4Bg7Ou+NuH4+XoYKewv2JHtB8uuSfcerObaKmUCy4THiwiXSfm0C12NeS027H
         q/rXBgxYqQ67aKePE5cPOUe1vva8ozWEBwNWVYNc20WrODGFeH6t40gTUS1WIQUNY7ga
         +5mA==
X-Forwarded-Encrypted: i=1; AHgh+RpLmSLZRyKOmFnml1xbfZ6Zcmv0SduO81+/ntjiFKXraufrWjh/D23KC+DcMI1/aaC6/nh0Ke6mRnWihGU/1AsT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq3UT7XApiWEtiuK880nuIVKGHdoXggYIS7D0lIc0AoF/Jgt2T
	mRB2pReg6urIyQtX3H2G/4Pszc9N77VMPUkuGd/yRNINcut8HvV6QPRZ
X-Gm-Gg: AR+sD13nrOWNOKkVTTytv0bGzUP1OfXMtwSIYS2PEZeNYeW6bfbhTsrXDtVqitOX7VF
	DEdiOP/KBy0ATlcbvNc9Zt7O2pA8Bq17+iUR7NlOwnMZ2lU26zLC1X0EEkAi4c9cF5jc+agXAey
	utAJT+2e7g3+rQHfIa2NA9QF418lPmKjKF+gj76F14jVvMGAYfuKc8R+YngGw5fQGTdU5sGD7rh
	nR6nNjh3JRIEBMEQSnkXh8VfFkNBn9eirZ9gO0/fApIHkodZbGDx6+n83dmF7h8VIQU+qIfCyj4
	nbMhSUSteBseOjwUXn4+nGX1R6mwPyTfjciZxiMr1S/JBDcOrM0eqqSDJbwL1ktV1UGv1xcYfVp
	4RjD4eyGnvFgOvIqesQirrF2lxRdyGMnhW+VoS6AEdlpADobn75pSp7iCs8artQd0foMS9hFeMh
	RvPW0HAAlLBoNqHNGwymimMTVY5TAMRdlwUGWE7hZ0Z48bDv/4ASL8IMc00pwwBZpeICh5wJuXa
	WQv9h/fNGcywcG7YfnGMVlRK0zDj23/a3VqiTlsOWm88mIJbulrPTmPy9jCwmOemYmiyZhGcjz9
	Bi+m9MnbK9wzQpgaEoFovfD79CDLp7bFi/Tr3QdObwUHklQJ0dt+af/JMtJNXRGW/kTjUPSFTwO
	r6KZVhKLeDo6vzSnoLi7z/lnM5bTtzW3a+aAPJSh1cAFGIrjkb/O50FI+T6RCeEVi/ZFDUYA=
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr223317955e9.3.1785759555358;
        Mon, 03 Aug 2026 05:19:15 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b7afe6sm213206215e9.0.2026.08.03.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:19:15 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:19:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Joshua Crofts
 <joshua.crofts@broadcom.com>, Broadcom internal kernel list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v4 1/3] iio: adc: bcm_iproc_adc: Remove redundant probe
 error messages
Message-ID: <20260803141910.00000263@gmail.com>
In-Reply-To: <20260801090953.61603-2-mdshahid03@gmail.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
	<20260801090953.61603-2-mdshahid03@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_051918_204612_77A5BB56 
X-CRM114-Status: GOOD (  20.90  )
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

On Sat,  1 Aug 2026 14:39:51 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> devm_request_threaded_irq() already logs an error when the request
> fails, making the explicit dev_err() redundant.
> 
> Similarly, iproc_adc_enable() already reports failures, making the
> additional dev_err() in the probe path redundant.
> 
> Remove both duplicate messages.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index cf4738b16e62..7c2e2770cd61 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -551,10 +551,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  				iproc_adc_interrupt_handler,
>  				iproc_adc_interrupt_thread,
>  				IRQF_SHARED, "iproc-adc", indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request_irq error %d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ret = clk_prepare_enable(adc_priv->adc_clk);
>  	if (ret) {
> @@ -564,10 +562,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = iproc_adc_enable(indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to enable adc %d\n", ret);
> +	if (ret)
>  		goto err_adc_enable;
> -	}
>  
>  	indio_dev->name = "iproc-static-adc";
>  	indio_dev->info = &iproc_adc_iio_info;

This is good.

Side note - I noticed that you added the email joshua.crofts@broadcom.com to the
Cc list, however I don't work at Broadcom - there must've been a mixup when you
were Ccing people as I only use the address this meesage is sent from.

Thanks.

-- 
Kind regards,
Joshua Crofts

