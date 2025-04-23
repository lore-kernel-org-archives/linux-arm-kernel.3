Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EA9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=; b=oWfUUmOPqJN9siSvB9QjmyOXMo
	GTYDDHaBfJXzXSgvnQx3x1/R4XoXqiH6zdQ/pYWpDVVkYoczi+O2YvThIuJ1pYsU+SPGwn5JaHvwV
	5SIb7JdXpmUKVLZqkAALYPB2ZJYa0GUkFm1A0EgrNRKAsnY1xy45LexkKAkd82nr61yMxR4EuWCdC
	VdASf3SIrtbNJ4hCgROX4/JDXKKrFr2pbvpbLi/s9u95t7MeiaYvKZGJqjTARr0192CVbcyDNxD7j
	mm+ASigLAyEFTiKEWOa/5sfukwMNyIaz6XPk5BYI/q0TNfnxoDKGpmnNmIuo+UYGx97FsmpXMz5j3
	8lPWBU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eJC-0000000BQoe-48sW;
	Wed, 23 Apr 2025 17:54:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dfy-0000000BEI0-0K0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:14:23 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af51596da56so24267a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428460; x=1746033260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=EhHfTu6EsbJ/tvWfqYcKi+sIxAXiBkHGTFyPv7/3Tvzvt7NB9XtyCNBBWrODySDhoJ
         vUqsLWt2vuUTx9D/seWwMMcvdyQNm8kraMmEFkXtD3hLPs23zUI+v0KGqnX6VXnRoTyE
         VnLskzUibb/P3s2W19i6rPvNeEG4GMBbxIrQrW6X9hJ4BzQi8PKIgIoEGMJe7Pt2G988
         6ZinXtgjCbxXPquGkhdU28oZoeVKnC4JZCLCiHV0u7275+pc7r9SYcIW/3YjgwcIRtxN
         sboT1TNDVcbAls5EvvTxXmwCcBVyG7GyFjz75XjT8QqC2fll0VpkeeVsTAePlDchz96D
         2YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428460; x=1746033260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLeLRBd3ajsa68hrbyTw6z9ffqfpFHy6lvXZYFIJp+Q=;
        b=VkKV3GhT4CdeEaahwrdeSmo54KmpkFXYnNqyv9bMKPB/9Epok3rzhY0dyfwq2DtYn/
         QmOvaAtUcNQqLXhJ6SGb064QHLeOp1RS1G7vmTja852ohLgxHDZzhN5K0/Mmk7Aa7aux
         12Jq52FSTkaceKHfwl0VCboQJJulY3OlViv8RjBxJdlzLi9tpiAdNwVd3nh1Lwxa9uoO
         XHadBydqRtFU3JK2XRpqqXYz5FOdXzmQZALY8/r+xKQ1GCr6BA3dBYlf+WI/9swLh7bk
         xoILQq8EstficO/pRoYcpq4f3Y47jWr1T6qQbMUpe0Rhtn55FoKQmD05nm8TzRcDrdBJ
         CQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCWKwahtGnwUkWvd5Jtp6xprki1aAj52HTvra8z9o0MAXCiaV/ONcxiQf1uMw0/rZPyjq997rf8wMT42TjB4DL0L@lists.infradead.org
X-Gm-Message-State: AOJu0YyBk0VzTx7+TC8nfoMCO60v7rD0RDE+c9tqEmcFG4ajA5EMTx5Y
	1d+BOLkA2Q470TG6k+e6zkwkvpGqNnoBm1XO1Xwx3ByMezn2GekeUfV5Vt/+7nE=
X-Gm-Gg: ASbGnctdAmJYYLSWSq2FFqa1QihfVNfRiRWmuDOotNmaJVxT772x8+r3Fk7qpV7U/Rn
	0FL6CBdP43K5Or1rZptDG0gE8quzqPvBqQGp8WHwWnC9CvpFhn5hXk5hF6UewtdM6ub5CszgYHI
	OGOZAnmwW5H+7utxZjX2arW38SmCJXM22i3i+cEkrVxt0wXmmaxINcS8NOrqXi5Z+suwjCK4YlP
	VAzaHB2AqdddqPHdgwqvXg+I2JNs8hTLwfWcTBy45tWB+fWN42rsLHSrnAclU+ddyjrL/fUENh5
	s6SKJyFCtZ1ibh19bTB/SA14jUwRkwuyU2gwQL0+DSc=
X-Google-Smtp-Source: AGHT+IFAdKiHZtT60k9AyVm2AcUDq81Ye1OBOZptRf8Zz0DnworMkFqtL7ZoS2eCNp44RT+dD3uaJA==
X-Received: by 2002:a17:90b:3a0c:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-3087bb56439mr32154912a91.14.1745428460444;
        Wed, 23 Apr 2025 10:14:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:11cc:1a38:e0c:9482])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0a9dasm1908698a91.16.2025.04.23.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:14:19 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:14:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <aAkf6bxBLjgFjvIZ@p14s>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423155131.101473-1-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_101422_119588_8671D9C4 
X-CRM114-Status: GOOD (  22.83  )
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

Good morning,

On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> The "clocks" device tree property is not mandatory, and if not provided
> Linux will shut down the remote processor power domain during boot if it
> is not present, even if it is running (e.g. it was started by U-Boot's
> bootaux command).

If a clock is not present imx_rproc_probe() will fail, the clock will remain
unused and Linux will switch it off.  I think that is description of what is
happening.

> 
> Use the optional devm_clk_get instead.
> 
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..45b5b23980ec 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	if (dcfg->method == IMX_RPROC_NONE)
>  		return 0;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_optional(dev, NULL);

If my understanding of the problem is correct (see above), I think the real fix
for this is to make the "clocks" property mandatory in the bindings.

Daniel and Iuliana, I'd like to have your opinions on this.

Thanks,
Mathieu

>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		return PTR_ERR(priv->clk);
> -- 
> 2.39.5
> 

