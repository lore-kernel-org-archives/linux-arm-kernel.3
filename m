Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=; b=iwN4/kzfv11ke59RcbYKVFPzNQ
	aUJaNUF1q9x7cm/m6TbP7ip+s7QbTwMun9G+LedO1e4qaOgX5dX6AuWm5Sxh/0DYyCdVwvhKwPOzB
	z/hEdc8HPB7qlLyM5X3RG2RtyWW5Xa2oCcpl0k2OfPAmrQ33ndCzPooutqGeHkv6cLNZEbzK4yG0H
	kZnxV/6phZYYPfLKvBdggEZ/3Q5IHbKkgjCMi6xpYeXOnawcBdmevJCT9HzeBeD401AOu+ZCVGeXt
	1zYZ8NiQgBrGuFjk5Q6w+DIYlvbN/vOuqrKyrFWHa9wFCfGnXcDv4U0N1teWmA50ARtq5bIm9+smi
	CbprnW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7K-0000000DtKo-47HG;
	Thu, 19 Jun 2025 18:36:07 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGOs-0000000DIOy-3vMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:38:00 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-40a55314d06so212263b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343878; x=1750948678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=ZSEAbgrIFOr5U+Qc15eqcS5GmDC2WjddP5kfWuev2TxgO1UmcEhcrJw6TNEE8G8ZCl
         7kFhMD7CMmPsRhDvv7q9m4/DuJG3/5+kN0kjC9EjomGV33ccyLkD0ba2MZtW5LWnAe3q
         5YaFG2plbOF2sY81S+sas+N4pJN6PYpj5l2/NiPGV/UaBUsLHMDNt2UnQqlLKEB/5Zld
         JUxcP9KNnRwXKFhL6HQXjg9QG/btU73xgm9h6WIyB4RPoeSjj3wcjNxgYSkx+B5EhJwY
         yoYlhD3ngO1Euzejd2+ul0HArQjTAJKb8OPgUIxEY3D/sbR6hx4uQDt/1MNQXAKArTJi
         3+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343878; x=1750948678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hItRQ/EsWDhhIfBWpBCEk7E1LEl+Hcojb2DJh97cbHY=;
        b=G+ndcIHECCoVNWsv0RH4mQkAm8+r74llwBePnUz7nHBF2ddKKPk2OtudQh0zz0A8zE
         +XUn423UZe5Fo6hPjRGJ89j70bJtiJCX9+xrjxuyobNyNXs9fiLSSqnTQipQmUwN5Y4h
         UhZEDVQMhpBiCVe8Usn9YVYSP5lWGx3nrqaDVSlGE/Aq2TdzOUhBC+AG/JaFb+BeSoNu
         OERR5S5Qzh3PHNL6zzIxqUP/eqgQ9eBbbcABUuvmeYASmRq/rDA8rsqEjBp0iZJ8Nedz
         04C16xoRLtEaQxiZj3HfsCmH41ojdSw8Qdk+ofvbBOsvM0VT9+vTz5Jg1cM0FluNV3pR
         DB6g==
X-Forwarded-Encrypted: i=1; AJvYcCV8F4GQl5Fie+IftPp83jEaiG7hulsTcTi18k8UySpSehEZmtRuqbcC6GZeTFm3kZnjfFYEnr6uPGrzg3UO090r@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Bsw2cr8grIkL1YGN16yTB0QDui1zgtyVWBZoysykpk2k9Meo
	iXRzE3QiF/7qhKbJT3PEwMBmE1l4XSOPsF5/ZNmwOUBszknkUwHgRHLtuJgm4h0gqpk=
X-Gm-Gg: ASbGnculN3rh0YUs89jzHvqYNhmAlJk8LmS6PxDgViDLbhcUkNho8AfkJHfnhZvtTal
	lQDXl2PcNOORwCeX7simMtxR9qm1mcvKnlUykLaLOZ5wxNtpkro4g3jVFH9ytZP5AKWVC774TFT
	//sRu/yldOYsxu4xvh5X7X9MEgdQ8n5uwOfxB+gmzfBP/+mVojalWmpbLp0ymK4e0SGi4wP+zky
	yt3gDXQXNILPEMONhdMVrZg4vg3E9Ecp7H6EA3eK/0VElsP431tdeu3aLn7VAJWYLyyHP7jiTh1
	R8ON87Z3r2clgsXEtXXDCdsHFG/3ljj5JKaaX/c6mg+PUacm97X2HJUzGjiaUmhCZwknPw==
X-Google-Smtp-Source: AGHT+IF5wWj1FQ6BbyupArvuY9tJtohfhdhFBgl6f0a/VE3YSxqXuNxxcAbMe+rm13ajKH0dqzjQsg==
X-Received: by 2002:a05:6870:d0d5:b0:2d5:2955:aa6a with SMTP id 586e51a60fabf-2eaf0830607mr11507270fac.7.1750343877826;
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba625607dsm358428fac.45.2025.06.19.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:37:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:37:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <514e4b89-d48a-41b9-bd63-0d52249bba7a@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-5-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-5-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073758_975879_6632F3B6 
X-CRM114-Status: GOOD (  17.55  )
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

On Thu, Jun 19, 2025 at 12:20:04PM +0000, Philip Radford wrote:
> Adds scmi_inflight_count function to fetch the current xfer
> inflight count to use in trace
> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h   |  1 +
>  drivers/firmware/arm_scmi/driver.c   | 17 +++++++++++++++--
>  drivers/firmware/arm_scmi/raw_mode.c |  5 +++--
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index ad9232c982ce..07b9e629276d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -505,4 +505,5 @@ static struct platform_driver __drv = {					       \
>  void scmi_notification_instance_data_set(const struct scmi_handle *handle,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
> +int scmi_inflight_count(const struct scmi_handle *handle);
>  #endif /* _SCMI_COMMON_H */
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index c6657582c9ab..d128d497f96e 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1443,7 +1443,8 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
>  
>  	trace_scmi_xfer_begin(xfer->transfer_id, xfer->hdr.id,
>  			      xfer->hdr.protocol_id, xfer->hdr.seq,
> -			      xfer->hdr.poll_completion, 0);
> +			      xfer->hdr.poll_completion,
> +				  scmi_inflight_count(&info->handle));

White space is messed up.  It might be better to fold this into patch 3?

regards,
dan carpenter


