Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F9EC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=; b=u4wIw4fnr3K1R75rhXiO3adWAw
	zPqNlXhPq20EBeSWvo0F9RedhqAHX1qASedoYfABqfBK7eE2XH3/G6UT10twe68TkWsiQI2j6LKnc
	e1VhlHYFQNpiLmRT6Ek2mhzdVRKBqto1SlgCKs3bq8AHXTax0WEX2JxJjAMIQ1eBRTEQPmp6oObkv
	TX+rdo4fcYOnq7U+3XtoW2kFDFkSEsrz1+SzY9oORZbfEeQkU2DdyHDyPvUyAPtgBM1iicbfxWx+J
	myNT5+U5QtMnHJ7aWoYI4P6z6skf8LcTmoCDyDNTljbZwzQtDzvvLLUa5bwC+NxAqgJNRVzGFufX7
	PIgltJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBp9-0000000641v-1kk6;
	Tue, 08 Jul 2025 17:09:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBMN-00000005znl-2oLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:40:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23c703c471dso877775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992799; x=1752597599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=gir9TUJOpn1a3VFAKxc+v0T5AXXz3QugWwvfWY1jkg5Pax4vrIQt2fCVqZ48bNNhG2
         /w/Owo4faUdx+np7ZBQQJouEpdFB8zAWG2nxO7s40/XYXTDRCsVj4ArjwCUFMtxDhGR4
         s83wTMTvA87110zz5AkPigEYDcWI9LPezHnUIPoP8lmJ0pydTct+Jiv3Gl5CLE8ikXJJ
         Y5xCDAD7+dgy0M2m9x43aY3oAY7fPkNVVhP8Xyjx0BeoD9t8xwD//2aHaZt03csicm/1
         KgcTQ8Gj+NhTKyzPx6Kt5Nb/WpjSWqP1CLlOYQirzG8++7YAwbdxtjDyX3Z6Pn+eP7Ql
         2ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992799; x=1752597599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=h4PgFq6zkeYuW49IfuQ26lbDAYTBP6PWvFug4r7m/TGrAgR1YfBgrhikCstgylT0hq
         ocqEbanT7cbkAnYOG3f2BjBjWdHyFUbFCDuWi4QFNrgU727ZskBneClWovCMe3oJ8foR
         GJCOOvsqyo0dTJIKqmhfZUPpMqmwl8ujYi9wcXu0zDCQktyWf0I+hPXt2muXUipQvvfo
         6w3JoR7XS40shWHkOhdiLoyRSLPyQiogJa9G8XXMQR0NgkgADHD8qj7FOSR+y4BGqGgK
         KBfSHxwagYn7gA6DCMmDt0ulaneENNIk8mPxBNDsw8Pazu4p2KB2gEtgH6Mq8gUYOYfW
         dIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbUxXSIfzGUBamk/aGj10MPZF3QcMgYHFQfze3Lj/IPu3B8vTfW6b6xSUwntIBt4WNF8gnkYOpKwlsU5rIs9Ye@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr282UMiyL8fsSKkeHB2NNm3IDQA0BmLDvDBIRZf8uxKKBYfUR
	0eJoLWr5wVS04LKBJUN+cCoq95jBbMGD5+jiNII71GtHMaEGIizcn7Wae5QuhzFzFGo=
X-Gm-Gg: ASbGncuw0WZfE3L4IlO4WzaSflB0TGaF4HAdkeHZBGCUrbVRGtRqEPshAoDLvvjeSf3
	A1InJICwgT8A3P/AKmJq8/A4lvMJjqtNYL5bNhi6zm0d0Z/f8ScFkKxH2KrSH4d44cOjv7DFq7h
	4uFb5GuyPH3DlvD1TkCi+g5iV9Rkqr9pmmoouZufczl0v/4xqYb0NPpxfDGWw37qzxx9LNhpBG8
	1Lf/XOxeF96VGhLxlZlaMu8PGKcLUJsV80m1n6VIcSh0VVw/huoh2KJ6191cqYOG99MgsFE92dl
	pY2v/ZMtvvqEB6NR8QILWuqzweUT2XP8WKaCHn6m74U+js/0Ww0ftBlssDsHIpd+7w==
X-Google-Smtp-Source: AGHT+IFj8nhxMS1GDmay5meyEAJ4wmQBHnfoxVzxfQ/DjVHpn1xffU3YRdB8/FjZpsJTq7vNTw85+g==
X-Received: by 2002:a17:902:f74e:b0:23d:d290:705 with SMTP id d9443c01a7336-23dd2900d0amr27843715ad.3.1751992798824;
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c5cf:9364:ea5e:99f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e1c8sm123626055ad.42.2025.07.08.09.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:39:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG1J2_nK-LkLQVRj@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_093959_712875_C0FEAF9A 
X-CRM114-Status: GOOD (  21.07  )
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

On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -73,6 +73,10 @@
>  
>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>  
> +/* Must align with System Manager Firmware */
> +#define IMX95_M7_CPUID			1
> +#define IMX95_M7_LMID			1

Any reason those aren't set in the device tree?

Thanks,
Mathieu

> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -126,6 +130,18 @@ struct imx_rproc {
>  	u32				flags;
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.method		= IMX_RPROC_SMC,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.method		= IMX_RPROC_SM,
> +	.cpuid		= IMX95_M7_CPUID,
> +	.lmid		= IMX95_M7_LMID,
> +};
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1301,6 +1325,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> 
> -- 
> 2.37.1
> 

