Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF10BC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KGkwbFW8mc6saMp1e+KcFytRng7jGJzpGVkRT08ylU=; b=5ATKuK28NKGZyYHseLTEM9svKU
	NJxsKh+irCwxEFhJ32i6kN3GD03fhMcMjLRLzwfIltZTKj/G0GRJVMq+jKGvzG3NoF5zLG8IQbmwy
	Xgf9qrHtg3ws3AJoDQZagBmm0IgTCIsSxZA2w1Er/OQfQ1Ho478GX+vkeMVwWY+TCp5VL7GOyy8fF
	QncilKVkjdlLZ5SCcPB2O6Sa65fSBitxIBYyAhUrO6i7ugqqS0wifwjrrMsxj+m29HIPKaEtK91hA
	UJHOVKExVbf7LoBKsQVFpfHI+ug96mlfGFMSiVpeJJZxv+FSMwcE+wncUP85YIjIFhZ/nXSnUNqoa
	mmVhxD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8Y-000000085cM-3wA7;
	Tue, 22 Apr 2025 18:14:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EDH-00000007Pmk-2WNL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:03:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so891148866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330582; x=1745935382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KGkwbFW8mc6saMp1e+KcFytRng7jGJzpGVkRT08ylU=;
        b=fUDtmk7eZPK2gvtRzDrHN1CRH74TYZt0w+E4rYcJB7QgYUNNozWQ0VnS21naUqRKvR
         M0QY7ADlLNg1YKQOyziMPNnoZ94Bgf9Z/sUcexU+sglMpdBc1guKRRdwAwVj9Zyzla3H
         mwNdGTZuClJee2aKMqUepAQPs8fLGq3f/5/MN5pRfLF2/2NPqkh68JrXz+gTmFQvZfdP
         z/ghWumbHg/9DmJuZJKM4Gecq1TsRXJfJxYXsLsDIaK24vzI3cserX37JwAurESTLCrF
         I9m61UfET/Qdp3/I7Y+0jpnbz7X44Vr0lkZpGpW1fFQTBcVtFTJLzyRBVBPS+Tt7dzFx
         5Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330582; x=1745935382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KGkwbFW8mc6saMp1e+KcFytRng7jGJzpGVkRT08ylU=;
        b=v0r0opH2iCcJB1XU5fBBAgTQx72C6TTdjFpR4/PkOXemQnsbcGG9kedasUvW5dOuuL
         WhGFUcfJt+SB8aHrcSrTQwdhy5k9b+UQBYzUhdf3c4ijairwHEtpu9woT7YubEQnMflx
         dDlR2fu4O91rmQI4OMeBUnD8FpKqAa9tccLyzjoTFBIoNTahWskiOSpYJpeUM1FjjfNQ
         dUYfN68RUCqQRzGZHBPobf7iG9Ns9HpJtSvtz2yNYWyEanjxNmNMhWQeHlAb1/HQoSwG
         vLM2ZhVCvXzQmpzc6NDE8WMcCndjc/09NqXNGTg7B9guN9aqC5SRcBHmY1rftuhnUaWg
         xElQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX2e4SeJuHWvfoqNTFFg17sjy3RxFpLFvqpWSfxEaypQgj6iVWU5lXZzQvfeAcKQf7o9zfDvkbJ6TNTIG//7+z@lists.infradead.org
X-Gm-Message-State: AOJu0YzyrhuKZPDUtIfSzggJo6nIBxLfImn4zd2ltxRKKVaUp97+jJX9
	r+KR+6WYl+jL98yWo4tbv3eI0Vauti4jWTeqonXUcSBX/XRvdWL8S2Afjo5gOlk=
X-Gm-Gg: ASbGncsxgSqHarDkmQVfEhH9jhvua9tHWrwtTgf7kozSmL44JVzttfXRt26vLWHIveI
	CPAuY7o4NSwfA8gTmbZASm654lnDwsyP7G53jT3/dOgZ9PmmumYvhDBBAGFFjzSlCobdBQI2bdN
	wwMxWUAAchD5O2svy0i74chqPGrucVn5Ip7yBt6Zo3lmUQnrJokJ/bOE3janHj74E7AQLMrnP60
	rLb7b2biTpPSxqzQELOzuUG8H9zQLXTMgwVr+Rq8fUL4Muf1Y5FJ72NtjUo2vUNG6OTdBUSoOVC
	+kdhnaDhydcXWY+VBMe5cwgH0Gsp6vRqU+xKow==
X-Google-Smtp-Source: AGHT+IGXA0LtNrq/q99iH88FAI+tkMr5/gDahnmnJo4DPlV9/CFoB+qZ83sOLLUpScdf873PzsLhew==
X-Received: by 2002:a17:907:c16:b0:abf:73ba:fd60 with SMTP id a640c23a62f3a-acb74b862famr1643280466b.29.1745330581391;
        Tue, 22 Apr 2025 07:03:01 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm651907066b.162.2025.04.22.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:03:00 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:02:58 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] pmdomain: core: Add a bus and a driver for genpd
 providers
Message-ID: <aAehkpXAxh3bI0WT@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-5-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-5-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070303_645875_938858D1 
X-CRM114-Status: GOOD (  24.24  )
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

On 25-04-17 16:25:02, Ulf Hansson wrote:
> When we create a genpd via pm_genpd_init() we are initializing a
> corresponding struct device for it, but we don't add the device to any
> bus_type. It has not really been needed as the device is used as cookie to
> help us manage OPP tables.
> 
> However, to prepare to make better use of the device let's add a new genpd
> provider bus_type and a corresponding genpd provider driver. Subsequent
> changes will make use of this.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 035b65563947..da51a61a974c 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -27,6 +27,11 @@
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>  
> +/* The parent for genpd_provider devices. */
> +static struct device genpd_provider_bus = {
> +	.init_name = "genpd_provider",
> +};
> +
>  #define GENPD_RETRY_MAX_MS	250		/* Approximate */
>  
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
> @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
>  static LIST_HEAD(gpd_list);
>  static DEFINE_MUTEX(gpd_list_lock);
>  
> +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_drv, drv)
> +
> +struct genpd_provider_drv {

I'd replace "provider" substring and expand drv to driver everywhere.

I think that's more in line with all other subsystems.

> +	struct device_driver drv;
> +	int (*probe)(struct device *dev);
> +	void (*remove)(struct device *dev);
> +};
> +
>  struct genpd_lock_ops {
>  	void (*lock)(struct generic_pm_domain *genpd);
>  	void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
> @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct generic_pm_domain *genpd)
>  	return 0;
>  }
>  
> +static int genpd_provider_bus_probe(struct device *dev)

... and then here drop the "provider" as well.

Other than that, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

