Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F17DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=; b=esbw9jM2imX8KcEj0PA3BUPbMA
	orjOUz8uu2MqpLXsrpzvCarQv9Dp6Tya+rJ1yquDse4YJDnyOKkRk52Ese2a2ti1WWf38Red9Xy6v
	UCBDu6tP3+E/KvUmOY52J1qmUPhDtLvdm3zmzjLsbaTRBz3nADgBA3zVJ4J9QvvPc6hOO7SS0Cegm
	QO2CpEhIKb+mKaZQ9H1ALEjOqZk1HdUmvtLP5u6xOXdwaklc8867HttvRrwk91hQV1O43PL0PxHLu
	AdQz3td2FErlkkSfz3RJj7wZJ/PS4lSAS3YLVLhQM1HIHy+BjSGRqpujINz/+rRJ+SQSaMXi3bCyJ
	S/WVLo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKCM-0000000Eolh-2arg;
	Fri, 24 Jan 2025 13:58:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbK5o-0000000Eo1P-0h1O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 13:51:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436a39e4891so14394995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737726686; x=1738331486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=y7nPahbpYxdA/4ofUQSo7RQ8gL/7jwfZzG3AP34kCcLpwpecS8Ke0FikVApt1uFROJ
         wOzZLaFxJv0h5482a/ZWbt4hUCt86SCV1y3xSX6MTupSELg8tHU8AJO5rkLea/QTARTV
         otw4MrwkoOhR0knZAyFFtp9z2Hp5IDz0tHc2Y9SKGsG3rJRfJCqRQiCQ+2VWlTfcsRN3
         r4AYFSNbRVcsU1cFX3BjPIuxLOz5il+aoRXsOp9Rvj7WBSrK+NGGVt85UAuebkpPaqd6
         N67sA+npOmM/WMNneT2xi9D6cfrtenD14nrNkNemExhfw3/UTgZzGp0UQ90LpbNTVUGU
         NsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737726686; x=1738331486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=YU+drxNpugpwsfv/lRUdAZ8bOouyRw0CpraQiLRvqCafRUofYHBQtxzmOxS0crMrkI
         oPYkl9XwFu0CJzFFw/XTka62zwwXLDw6nBIySb4HGecY9S2NkadD/b6UW8Y6DkarQhDF
         UeejanJDwVHJHBgGQXk6YsKUODxDHv+gJhIpUKHBeg6qdDpfjx7DHAdhsPXMqZgEksMn
         bVyhMSE/uRmuvwPcfL8Bj9X4XEdbdn1M95PTFKDVjP6E8kxie5OzkCs26Oy/e78TLa8r
         CGENv1OpmtyUh9dTzAzDGhCPH7GeQl5qOkx6PrIKqRFeHTP+XH4lOeI3+YN2SHCukr87
         VgOA==
X-Forwarded-Encrypted: i=1; AJvYcCVyV3uRfPhlTm7i/fC3mZO4ebjSlGv1PznxLV0e+3zcwGuR6EeJlN+wcW7ZGh6I3Xuftkm1Sl+iIiRR0z8uVkO2@lists.infradead.org
X-Gm-Message-State: AOJu0YwUmLmGTTlizOQKI4dyS9Z9OXJzR/bJGT/K8nYMptry2ASz4P74
	2qF3FAcfumSB8bLEE63vPwKclYfysikh6fvjOsBYO1an8JngGvfpFdEMcX1QT1Q=
X-Gm-Gg: ASbGncvrlGdAg2s7sn9Op5Szhuaad1lmIoWpBkpdKz2SdNrOEBUgCQR+tLzevTt760q
	NbEyyUu0Gr2kc4RT869z3z2D6jsRXITeQZsE0wp8X3Ryn9D6uCSgN4Q9xJqTA/8pgQkh0gBvKMg
	ptPj4U6jVQFgldIiDejIjdt1YO8k4XkJoOrx6zK2fayrZVBNwGoMGuAJ+0fy0Hb2sd3c6JKRolk
	LLMZAaML+IBtcGP9ynC6cdoMARthlo6LdZ34GEZ0FlMLkqfZPw0zOR+8GjE/P2jOX3S+sDVq5Wz
	akedMlT16w==
X-Google-Smtp-Source: AGHT+IETFMJJrZWr/EDBakUelIAVIlOvrzgYZmGp+ZA18dqs2i5tih8sUMHw8uH4sD7esRtqKjCpXw==
X-Received: by 2002:a05:600c:3585:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438913d5da1mr323417065e9.10.1737726686177;
        Fri, 24 Jan 2025 05:51:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd485007sm27717805e9.12.2025.01.24.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:51:25 -0800 (PST)
Date: Fri, 24 Jan 2025 16:51:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <f83759b4-8e8a-4497-b032-341c8538c293@stanley.mountain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_055128_219449_A4159A7F 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, Jan 24, 2025 at 10:25:17PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +			    unsigned int spreadpercent, unsigned int method,
> +			    bool enable)
> +{
> +	struct clk_spread_spectrum clk_ss;
> +	struct clk_core *core;
> +	int ret = 0;
> +
> +	if (!clk || !clk->core)
> +		return 0;
> +
> +	clk_ss.modfreq = modfreq;
> +	clk_ss.spreadpercent = spreadpercent;
> +	clk_ss.method = method;
> +	clk_ss.enable = enable;
> +
> +	clk_prepare_lock();
> +
> +	core = clk->core;
> +
> +	if (core->prepare_count) {
> +		ret = -EBUSY;
> +		goto fail;

fail is too vague to be useful as a name.  Also this should be
goto unlock;

> +	}
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +	clk_pm_runtime_put(core);
unlock:

> +	clk_prepare_unlock();
> +fail:
> +	return ret;
> +}

regards,
dan carpenter


