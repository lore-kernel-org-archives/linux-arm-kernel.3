Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4545AC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 03:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDoKigPjvswwl+8EcyWhXKw2z+QvC5L4RMofPPBGe0Q=; b=WzBLL/OPDKvRBaiHDwE8i4O6ck
	g225WAXW56v0M7T/d4YDVlmPjEXTzftg3EZmznJPEpkSqMSVQtqM16DkqA8lsxnVOP50yyO9YQQsi
	TdUNbALxRQdeIbj2tbyjVs2TKAT4pZ+sXJa0G5iD6Iy6hLYltL9m9rSefHeAXynIGNRb49xNRaK57
	PMl1uhi+lu9gPeoxiqwSXdQ7zjOm5nqM5BRWtDiSo9CIwM7wZvuLKnYBfh81CZMvI2of3zKeJD4qv
	tre8yoVm3dRmxr3MKfbXgoXXgcYoEO2//klOk6tiEsV3ISbRFQsEH+hwzuMajJ27nVtFzmelQ/rNC
	hYvK8Nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4Px-00000001r3Q-484i;
	Wed, 26 Aug 2026 03:35:13 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz4Pu-00000001r2z-0dV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 03:35:12 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso397327e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 20:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787715309; x=1788320109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDoKigPjvswwl+8EcyWhXKw2z+QvC5L4RMofPPBGe0Q=;
        b=DK3bakfT9isqkoaTIr7W9M9O3bCLXxxnEeQ+QSxVzDvo3BcMWATIcbZN7n0YAkKQNc
         FSOVfjUSP206d8w58M0A6+JurnJX5nEegTMBgYaE3NzTIIHlWUGpI5w7nHQMIjvSioaT
         sloq9fAsoDqvSa/SxB4PzdNxxEoorB8tWNedQ2CYQzceFkEs5YT+33gTkSIZG8LaarD0
         SpJlocaGtcYH2uD9VXyJ6pp7Kh6n5UKJk+UB0XCz4dQy1yIcUOBKBrhb6+g5VD0c3VrX
         numez2d7PoUq4YK32SZbFhmY/+vkbnedqlnhaybjFksWPoRrNem5fmD4vlba2tssYGMI
         8TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787715309; x=1788320109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDoKigPjvswwl+8EcyWhXKw2z+QvC5L4RMofPPBGe0Q=;
        b=e4ALdoOu7g9bw7v+YfMItXyisP05g1DxdpHwZhDG9M5QyVaqHpIEztoIpPbVckr7hu
         qv8pgqN9BSbtIMaaKbfUm4neCLM2H1vxig0OXL6wXUnAmc5sGW+gBS4QDPtYI4wxEbtK
         c0BOebinF15IcD3JvUeefvo8M/vtJdr3L2a4AHtsLvvw/WxSOt1T5LH2hyuGUTUTeQyN
         jDh2Pl8r/+Ntg0W197Ac5hhxOQDPi1Wgqs43HcH8tMcCRWhKP1Vg7zeflwnPIwk/F92G
         HFfORvSatDNXXSU4Drzv7tVdkTKpJI67MLXlOxc0THG9eh9is2wphG4evvz6LL1VZZay
         Iqsg==
X-Forwarded-Encrypted: i=1; AHgh+Rpu9eVsF5+UqjkCW2+04LIng/CF31eRZ3LQfZmjYKriveifuDTYqDE9AlyD0NBU8lx1UBiZMtKcWvvv6nVjttnS@lists.infradead.org
X-Gm-Message-State: AFuF++mjadtwTh3VZARVhnlHACJUaZJHqTAt3RBCE1mjU+lzipmMGOOm
	SW8ZDH7Bop7lLmzwdABqN4bQvevckXirAIkvvHRlvW9ZA5AQjBcq/arG
X-Gm-Gg: AR+sD10ndHB1nAmJXpusMIHNkDtB0QOl7O/UwklcbOXBUjiO4J8oecBIFyAzgEwJVkU
	JKoW4BJK58GrbbIRCvWUgYP5FCfzLBDG6y9AV3orhE+Vav3T7aNOi1TUZeQ5HADrw7BilYY0A/N
	ibN1X1V1poO0ekzWWNmzIrrPGZCTt4NGtIJRl1GiretEI9XIr+7JBQTfg8NP6/vpDS2o2v28GQU
	LFpU0WdctQURH7tkN7P9TVxVBphs0o0P+Es1oQ35fR7xZim+3EE3a/iYv3J5NAMRiQ0VD5+r0z+
	g3jsj7J4ZFAYf+faS0SdxP+IGRXaW38C/kZFATd1NOofl3uFbUaVgLNrdjTEPyg5xs3e75AtQxm
	+7nWCjou6nPMwserpNnpYkzRWzXVd3ccptr3roUlBlwiWRGAbV/OtmSGm0LbWHPOUZk1+P9N3XL
	/vNhvj2k33LYoNsLGqsmA3OMjRB14bt2hm6Ogg6C585fCAYEzx3mQIMS7ROA8ddNtfRukp
X-Received: by 2002:a05:6122:507:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c65ba76c6dmr1360903e0c.2.1787715308746;
        Tue, 25 Aug 2026 20:35:08 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c660014355sm588803e0c.9.2026.08.25.20.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 20:35:07 -0700 (PDT)
Date: Wed, 26 Aug 2026 00:35:49 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] iio: adc: bcm_iproc_adc: use devm-managed mutex
 initialization
Message-ID: <ao5fFfdqPn5DyFJt@debian-BULLSEYE-live-builder-AMD64>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
 <20260825172155.250484-4-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825172155.250484-4-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_203510_204930_6F71971C 
X-CRM114-Status: GOOD (  18.69  )
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
> Use devm_mutex_init() to tie the mutex lifetime to the device and
> improve debugging when CONFIG_DEBUG_MUTEXES is enabled.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Though note the device driver currently lacks an include to mutex.h.

>  drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 1464c60bc83e..9b299e2c3e0c 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -530,7 +530,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	adc_priv = iio_priv(indio_dev);
>  	platform_set_drvdata(pdev, indio_dev);
>  
> -	mutex_init(&adc_priv->mutex);
> +	ret = devm_mutex_init(dev, &adc_priv->mutex);
> +	if (ret)
> +		return ret;
>  
>  	init_completion(&adc_priv->completion);

