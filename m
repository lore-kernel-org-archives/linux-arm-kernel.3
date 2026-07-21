Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA6C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=; b=ffou41Nj0XTZbktV0vOMgO0VmB
	zLqhutzB6AVgarpsm4ReWhd0AVTkIwABtnEI1gKZGrCRHf6XaEcsi7l6NceDNSvuTm/ER/NstyyUJ
	jSBkycLoXqD7xFUNbXekAAFicGTj20NwAXMsqxWDXCudtGoi8E3ZpwlSyTcx73yvk5JtppO1L3xaa
	yP5+TtXrqCmqJE+3fwT5HlHFj1uRewMaQ4eb2uTrJkJ7+sJbBR9FusHskH+AR88OOtQ1b81bNHhmW
	YJ/UTFpqp8+9sdwz9EhUH3PZMHd+QCziyuR9wRx/jsaB2dQQSJITdCKQI2050ZytOFLhRWfpDrVvr
	IKNUDOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJlS-0000000Aa2J-1XrE;
	Tue, 21 Jul 2026 23:20:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJlN-0000000Aa11-3rus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784676036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=;
	b=b3Q8TgQXKmX5YGc5NU1eav9/m1SfuKo+NDp8LpkJOHCO73SuvyRmzEsFr/70VzGFCK4WPR
	K454fDz9z2Fjt7b4IKWNIkcvCO0Nwq6DtUgNKf1eoKBqw3jgnhE2t6t49F03xVnOgoI5SF
	k+673HpKErforf1F5FJ4Qcv5NZ/t24Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-55HFI_a-O9mq2uNNbV7vlQ-1; Tue, 21 Jul 2026 19:20:35 -0400
X-MC-Unique: 55HFI_a-O9mq2uNNbV7vlQ-1
X-Mimecast-MFC-AGG-ID: 55HFI_a-O9mq2uNNbV7vlQ_1784676035
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7ee64b25so1443558785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 16:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676034; x=1785280834;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=;
        b=lw1qALSsSP3UNFRYAjlXuaWXSFZG+Ki7bfVSRX7IfQQG5toGNKS9JPn/zrR5G4tlLI
         6DAATG49WNTEfetS62gGrEhULsT+9Sso0QkYKNryCfkXDNekNt54Ty00fg3/q05w+6xe
         W6rDjYcHdOLXEjABt6NgZNLN80tilE7cDAgQlR3OUn/f0xkw1zsBeECIPgEvR7YKSNQP
         /4sjZuhTOqaT3Y+dNONKFIfobGBiXpQs7dzoQd3zCc9ldCc6Zy87C0BQ7uIfuYtHMwPA
         0bgML9VfY3ogJFrrEwskd9CoAM3c8ogko2AkTpBQWS2PqaSG7DaXMCyZY/5P0dGbA5Gq
         9i6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJ6zTdRsoF0vnAnUwTPW7zaUH+/q3RTV461A9us4VJwx6BhTpm5hUrfHlpUUoBhQg0mfNv8JzWYaJW3e9lm7vQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv3WvJSqJHUFZ12TttHv3uOU6xFFZ+7ZFXNYUEeU57XTrLh02p
	MfNd2PIPUj3SbxSyJrAwCHvhjloK2OYKWN7n6fpGyuDmbYWsi0Q8CuG0Dkl8ItA5gcNzuIlskdd
	NsX4hx9FrCCsCTVFMPmFfOw7ue97hmPESJtd13p7ZjU2VhVBYOdmaGt9pSgi/H6c8/nEQ/vQEjw
	vV
X-Gm-Gg: AR+sD13fPOG3HrUJVcL4WKzXGrS8gDLOUa74EQwGRhUEAKJeGHdddSoRnsRipfLPYlX
	3spb93HAF32HtNoej+Pkz8YFe9z41Fza4MZM023Q0nOKOrTypIwUDZVargw0+Ymx+2G+ajfKiDA
	FX903QjhQPHa9Ebmjj4Wt1Ab+dD+KLfAcdZXDBUicEFBzrxQU03FXGtrPsE6V1LryWRuvR8948F
	GwGD9iDD8PEchbD4c6fQ2Tn1+KQA+S9RXrz4+KSm2dY2T8HmjlTmkUtAj31Sw4y8CkVT0Qmnqbt
	dpV28Ok0iwadYT+UeiuwGbqxRCr7oKUUubzagrtOvQtm1SYTa7YkpOS+/hl140RQWThXqOj0XtU
	iKCugpWXcddDkiuKGqN6IQJn4W3YjnFLNesw=
X-Received: by 2002:a05:6214:20e9:b0:8ed:29f2:32ea with SMTP id 6a1803df08f44-907783bee71mr224973316d6.48.1784676034709;
        Tue, 21 Jul 2026 16:20:34 -0700 (PDT)
X-Received: by 2002:a05:6214:20e9:b0:8ed:29f2:32ea with SMTP id 6a1803df08f44-907783bee71mr224972896d6.48.1784676034224;
        Tue, 21 Jul 2026 16:20:34 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm7307666d6.28.2026.07.21.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:20:33 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:20:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: rockchip: Add clock controller for the RV1106
Message-ID: <al_-vioCVeQxVo-f@redhat.com>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-3-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20260714193656.2196447-3-sjg@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jcc8NeEt3-gFjPF7iszCgnEmaG61aTNyylMYWRE0gvc_1784676035
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_162038_042393_E4B3345E 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Simon,

On Tue, Jul 14, 2026 at 01:36:39PM -0600, Simon Glass wrote:
> +static void __init rv1106_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	unsigned long clk_nr;
> +	void __iomem *reg_base;
> +	int ret;
> +
> +	clk_nr = rockchip_clk_find_max_clk_id(rv1106_clk_branches,
> +					      ARRAY_SIZE(rv1106_clk_branches)) + 1;
> +	clk_nr = max(clk_nr,
> +		     rockchip_clk_find_max_clk_id(rv1106_grf_clk_branches,
> +					ARRAY_SIZE(rv1106_grf_clk_branches)) + 1);
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base) {
> +		pr_err("%s: could not map cru region\n", __func__);
> +		return;
> +	}
> +
> +	ctx = rockchip_clk_init(np, reg_base, clk_nr);
> +	if (IS_ERR(ctx)) {
> +		pr_err("%s: rockchip clk init failed\n", __func__);
> +		iounmap(reg_base);
> +		return;
> +	}
> +
> +	rv1106_pvtpll_init(ctx);
> +
> +	rockchip_clk_register_plls(ctx, rv1106_pll_clks,
> +				   ARRAY_SIZE(rv1106_pll_clks),
> +				   RV1106_GRF_SOC_STATUS0);
> +
> +	rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
> +				     mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
> +				     &rv1106_cpuclk_data, rv1106_cpuclk_rates,
> +				     ARRAY_SIZE(rv1106_cpuclk_rates));
> +
> +	rockchip_clk_register_branches(ctx, rv1106_clk_branches,
> +				       ARRAY_SIZE(rv1106_clk_branches));
> +
> +	/*
> +	 * The MMC drive and sample phase clocks have their control
> +	 * registers in the GRF region, so they can only be provided when
> +	 * the rockchip,grf property points at a valid syscon.
> +	 */
> +	if (!IS_ERR(ctx->grf)) {
> +		ret = rockchip_clk_add_grf(ctx, ctx->grf, grf_type_sys);
> +		if (ret)
> +			pr_err("%s: failed to add grf: %d\n", __func__, ret);
> +		else
> +			rockchip_clk_register_branches(ctx,
> +					rv1106_grf_clk_branches,
> +					ARRAY_SIZE(rv1106_grf_clk_branches));
> +	}
> +
> +	rockchip_register_restart_notifier(ctx, RV1106_GLB_SRST_FST, NULL);
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(rv1106_cru, "rockchip,rv1106-cru", rv1106_clk_init);

Can this be registered as a platform driver similar to
drivers/clk/rockchip/clk-rk3528.c ?

Brian


