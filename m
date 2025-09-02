Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26529CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=; b=0fNSLNG+Yoqb1CZzVLlRu1T3hS
	TQIJqCEPfm2GPqXU+XauLKGTl+ehR5s4urRr0CehDnx1NFY5vsWX6DZ7mIAGLm45ZD462Gq/594wg
	y8mjcljEZEq3SEvhWL4hWg2GWuEadmLcOgtu0ui+JT7zpwGdISJqN3fN8Fu5hhV7FJZK7Uun+cm7w
	Hr7poaN2X1/oi7CbpSl5eAR/wc92ZXLAfJ1rZN7KYI1HAT1I+ygVsVbxkC7dUZJMDxW6cJfAbAlBw
	1nUT1tU9Mw1MdnqGeZWyI2axfNd8xjq52Wcfg+Lw705uOcDyHh8AQYmiq/lMRmbg4GfdCyjsv1mYm
	VWBp4MoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbe6-00000002sgA-2o2W;
	Wed, 03 Sep 2025 00:46:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYsV-00000002G30-16mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 21:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756849762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
	b=DxT/Gj4qMk6XPrAdMMvLHM6wCVg+N1kwsv0ie69OmtY1rP/QbKpVDJYnLdvorzaRdZnr4g
	tCX47aMazn0goIu70OmDn6cfmDQ5AvfC0Po0OdOPZ5ykwF/RYX44cp5oiVb74smuoawF1O
	b1tS7/rnY/LAV97Phr8KwJ9spHob+Bg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-Kj65i0pnPKefASoHblHnfg-1; Tue, 02 Sep 2025 17:49:20 -0400
X-MC-Unique: Kj65i0pnPKefASoHblHnfg-1
X-Mimecast-MFC-AGG-ID: Kj65i0pnPKefASoHblHnfg_1756849760
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-71ff3e1256cso29571456d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 14:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849760; x=1757454560;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsHmX5g0hW2RuOd+pFemlGczz+YYMgcCD+tzI6cEH+Y=;
        b=mNHMr05IixAa+NKhjOWapnJ63JGRzI7aFCkBQ54bPJfnB8M4k57MCU/60k1sRQRUDe
         MvWDtlY32j+xlB6b+AkYZh6P0Xk14zF6UVwwCtwiNDMUeRLxvCtX0K7JA95IlheJUn0L
         gpDQS0oP2GG1QV7U/a832mvVTZhDdb7oY2n59ftaf2u1sRsWbCZJ9geuPXQTMHZ6mO9J
         VCcbsDRrOr2ZkxcgMRGlEPGsrv+H/5Qrtwlezm0Gy7IZRAV1lJOwbSlLrvGZurebkNDs
         nhnrUBm+6v5t2LFtlLhA76TxeNE4P2cj3rlBc/c/JlYLeLG0sF5448m7KnK1oVnhpMZB
         Q09Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0j2Zjo1DkHFRGRmy2zOPwD5ZIpeSKgvgi/pbPW/EDonaHQbUfhCvkpFt7mXTHB9pHeqCkd3mevYQtMinXN6oR@lists.infradead.org
X-Gm-Message-State: AOJu0YxtzD7Zzv6qK8M9dUslcrhkPIc2qlS6g8sQG9ZZdRi+kk0GYBTc
	Zyzt5EIcPkAcDjZ50uIbRxM2xb2mCOO28h83DJAa3tc6I2TZKCQCoeCtx/IwfB3oHI0I6X2QuQU
	970yybNbSQzlhtbUoUNNdmrpP65qADAoecS6IsDIPqHUl82mDcoXtJPwqY7XUNAUnTDdjIRXnin
	HJ
X-Gm-Gg: ASbGncua4AVVWSaaN0cw1nF6vqelJlyX+otvdMP/oMkCvj+rJrY98PxpGp0cItFgld/
	lcuYMkPphOnSqCWZTpB+RAwXKhbo0vOBfuaUIO4868FreyXc9KbuPJcS1DVpNExMjEnQJ7O3I8v
	q0+Sc0lksBBTzxzqW5PeZPxIgbuLbNBfnzwLVsQA3BVMrbMQ43LnD9NIHPpa5gRqiWvi6Ja6rxV
	P99lMXw8qfHr6t3PVPku72cg1NyOWFY8x8xhhO5qzxChvbHtMlGg46MhFZ2DZXJIpKUuTjZwnKt
	Kx0dx+0s/td6eYFZBKF4cHn7PEceBPpHM9Fg0gNxoodyzzHGnib7FNV5hGif0IrhNk0rsGdC6Kf
	KGj97/ohN717ECXJAVVc=
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595596d6.51.1756849760164;
        Tue, 02 Sep 2025 14:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgG5MrCRiY+YEj7wHA6pGiT+So5GhjsjCrEdcrEastQ86ZBZAbzbVRYsDLAAf8z1862oXzQ==
X-Received: by 2002:a05:6214:c67:b0:71b:f511:7228 with SMTP id 6a1803df08f44-71bf52ff870mr81595306d6.51.1756849759591;
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b475d63asm18667696d6.48.2025.09.02.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:49:19 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:49:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLdmXcdJnoeXEJaQ@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: st52XYoVkSNyIsGeQQLFJJDQsQ_-Hvyqml-eCTyv520_1756849760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_144923_375852_C51612ED 
X-CRM114-Status: GOOD (  25.60  )
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

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-conf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..dd6083597db3f8f27d86abf5640dfc3fb39a9b88 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,71 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>  	return 0;
>  }
>  
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
> +{
> +	struct clk_spread_spectrum *sscs __free(kfree) = NULL;
> +	u32 elem_size = sizeof(struct clk_spread_spectrum);
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
> +	if (count <= 0)
> +		return 0;
> +
> +	sscs = kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
> +					count * 3);
> +	if (rc)
> +		return rc;
> +
> +	for (index = 0; index < count; index++) {
> +		struct clk_spread_spectrum *conf = &sscs[index];
> +		struct clk_hw *hw;
> +
> +		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
> +			continue;
> +
> +		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
> +						index, &clkspec);
> +		if (rc < 0) {
> +			/* skip empty (null) phandles */
> +			if (rc == -ENOENT)
> +				continue;
> +			else
> +				return rc;
> +		}
> +
> +		if (clkspec.np == node && !clk_supplier) {
> +			of_node_put(clkspec.np);
> +			return 0;
> +		}
> +
> +		clk = of_clk_get_from_provider(&clkspec);
> +		of_node_put(clkspec.np);
> +		if (IS_ERR(clk)) {
> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> +					index, node);
> +			return PTR_ERR(clk);

This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
v1. Otherwise the rest looks good to me. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


