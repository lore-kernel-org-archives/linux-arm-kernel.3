Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CBCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=; b=mczflxRzIEM8qPkaJ4UosXJjsX
	xrdCRojpXuwsR7xQoE5gYwobhUtpfQv0ND+ZCA7kM37QDpbxwiMEQXKdw3Iu8C0OVlQ7JQH/5yoBC
	a+VDQkEZV+lxEiSJmT5Sml9XRHmHUVcj0v/GwXpizQvcgnrHbJ71IA7HZAZ3YoOSRQYeRWCHJD0fJ
	LcgOfHaQEJ7qXtYFYg6GxLQo1RD6yyS76w0M98825Fqmv78qXB7m4w6+QGvKN4Efl9sv+EznEUc70
	fkltI52+eYzCsjUxLbm1VZ8Bbio194JvMx5ORuc2eRnGnLL+6V1l0+dCbqu/+/wVImS4gyK5p20+a
	LiuPqdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8lw-0000000FTVT-2JHO;
	Tue, 07 Jul 2026 16:35:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8ls-0000000FTUr-1qDb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783442142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=;
	b=fImhzVtdPqhFP3nMAH4vDZMibOdL2KajLaWP639DtPDf6y7Gq1oRheG+g9RGyqvut+CsYq
	5vITUtFWocoYOLm83B7htYjvBEWYHKffw6ftk3oDNx7NS3N7rusHbm3vDOIV3wTo34OVD2
	hkib9NTMXxQQ4FxGZkwU8lywCHqSnn8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-CNPxbjJ9NEqmGjgV2VJRUA-1; Tue, 07 Jul 2026 12:35:40 -0400
X-MC-Unique: CNPxbjJ9NEqmGjgV2VJRUA-1
X-Mimecast-MFC-AGG-ID: CNPxbjJ9NEqmGjgV2VJRUA_1783442140
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdf87be987so715732e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442140; x=1784046940;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLXdUDx40KUl+OrKm3kL+rKhY0e13ruPLiiJQQF/qN4=;
        b=ovfEfj1BA35xIoQ/B1doN9/Nwy0TkJ/HKIC9VCUiKLyjS5gDq1b1MNUfkO3qYb5XBH
         vOQHnqtsHjLBqa3OA0ty0UrLwELAuQLcTqBkaWOSHytfIyVX6vJS9ih1NWeWZ7TJCwpY
         8NnJtcjI9GmjBRGkuwCIS8n3n/QabeJRC4SKDSmq0jRvmmqdyElXkzKWxwXgCZxrVPPl
         XKahWskbgR23sbOmtUBcNKyG7Q0t09Azc60p2LnLgzgjneKpR/t7HQ+ceVdNw3Fs1D12
         u7cfuPyA3mUQN4Oa8DIZbAWOEG93e4ExOAYbf6E8HFNYbkFPI0FlQhRPMCJWfxEYCBpN
         xCWg==
X-Forwarded-Encrypted: i=1; AHgh+RpZPl0cZi88jVFh2Fi+EfqcliCi+ZZFVvBXM8dupxEqE0yx2c9CctrP16NVqdimHtmDJrSeWyVWVV1gkKjiGnM5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn4p/qliYN7Jfa6ey35X86LC66p88PfYIFhW5eJKyn/jlMiEA7
	ws0tCZ59wHATR0zj1HqxWssV4tzYYpXaMTmtShTmlwHv1+XVoLQ7x6J0VTFJ5tsIOte4Rd44V7q
	w7S81Ofebqe/TcyM8UxOGHn1y8xlRX2fWVJo4zD++u+EbcRCswrHqbLyy49zpXhQlMkZSZ5qTY3
	Pw
X-Gm-Gg: AfdE7cnzI28iVwn9PpURUDMMLBatCBVl1oBbhm63DjDjwjdIyrz9+HwihfDw3CvWxub
	lyPPLpcujj/2/pIVcQEbq+s8FcctFmhShJ7wb+M7E61sVojhAXHqts/qrmwIVs58ogCFtnCX5pe
	fHlMVc3LbyJr4qnBK89kpca/9UPnqgBZX4J796qBfSyqaqinswUJfm6yV6tJsafYoGF/pffmRM1
	xmcas7Pz3jbpm+99irvG2l1qwdzXmFa51cYLt6CQBulwYNlGJlwpyGXmrxhOmccmg4isKxwDk6O
	MdInXGbPwNJdVZcpMmtCdExtEZ+EPlSQsID/XSg8KTufszl4dK5LqTKrzA062XfCqfs+6NmsKMR
	7jqTMOs0F
X-Received: by 2002:a05:6122:1c84:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5be9076525emr3484141e0c.5.1783442139582;
        Tue, 07 Jul 2026 09:35:39 -0700 (PDT)
X-Received: by 2002:a05:6122:1c84:b0:5bd:b2d2:a1b9 with SMTP id 71dfb90a1353d-5be9076525emr3484104e0c.5.1783442138832;
        Tue, 07 Jul 2026 09:35:38 -0700 (PDT)
Received: from redhat.com ([2600:382:7726:2cb:ada8:1d9c:fd6a:977e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983899f28sm7201271241.3.2026.07.07.09.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:35:38 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:35:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <ak0q1pWZREYsvJ4f@redhat.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
 <20260630124413.1814379-3-joakim.zhang@cixtech.com>
MIME-Version: 1.0
In-Reply-To: <20260630124413.1814379-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xM9wJeNuruS7U-FN3sEZflr89Hb58Z9gDg5XUCoLtOw_1783442140
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_093544_573655_CCC02B11 
X-CRM114-Status: GOOD (  20.26  )
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

Hi Joakim,

Thanks for the patch.

On Tue, Jun 30, 2026 at 08:44:11PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

[snip]

> +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> +					      const char *name,
> +					      const char * const *parent_names,
> +					      int num_parents,
> +					      struct regmap *regmap,
> +					      const u32 *mux_table,
> +					      struct muxdiv_cfg *mux_cfg,
> +					      struct muxdiv_cfg *div_cfg,
> +					      struct gate_cfg *gate_cfg,
> +					      unsigned long flags,
> +					      spinlock_t *lock)
> +{
> +	const struct clk_ops *sky1_mux_ops = NULL;
> +	const struct clk_ops *sky1_div_ops = NULL;
> +	const struct clk_ops *sky1_gate_ops = NULL;
> +	struct clk_hw *hw = ERR_PTR(-ENOMEM);
> +	struct sky1_clk_divider *sky1_div = NULL;
> +	struct sky1_clk_gate *sky1_gate = NULL;
> +	struct sky1_clk_mux *sky1_mux = NULL;

Reverse Christmas tree order please.

> +
> +	if (mux_cfg->offset >= 0) {
> +		sky1_mux = devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KERNEL);
> +		if (!sky1_mux)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_mux->mux.reg = NULL;
> +		sky1_mux->mux.shift = mux_cfg->shift;
> +		sky1_mux->mux.mask = BIT(mux_cfg->width) - 1;
> +		sky1_mux->mux.flags = mux_cfg->flags;
> +		sky1_mux->mux.table = mux_table;
> +		sky1_mux->mux.lock = lock;
> +		sky1_mux_ops = &sky1_audss_clk_mux_ops;
> +		sky1_mux->regmap = regmap;
> +		sky1_mux->offset = mux_cfg->offset;
> +	}
> +
> +	if (div_cfg->offset >= 0) {
> +		sky1_div = devm_kzalloc(dev, sizeof(*sky1_div), GFP_KERNEL);
> +		if (!sky1_div)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_div->div.reg = NULL;
> +		sky1_div->div.shift = div_cfg->shift;
> +		sky1_div->div.width = div_cfg->width;
> +		sky1_div->div.flags = div_cfg->flags | CLK_DIVIDER_POWER_OF_TWO;
> +		sky1_div->div.lock = lock;
> +		sky1_div_ops = &sky1_audss_clk_divider_ops;
> +		sky1_div->regmap = regmap;
> +		sky1_div->offset = div_cfg->offset;
> +	}
> +
> +	if (gate_cfg->offset >= 0) {
> +		sky1_gate = devm_kzalloc(dev, sizeof(*sky1_gate), GFP_KERNEL);
> +		if (!sky1_gate)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_gate->gate.reg = NULL;
> +		sky1_gate->gate.bit_idx = gate_cfg->shift;
> +		sky1_gate->gate.flags = gate_cfg->flags;
> +		sky1_gate->gate.lock = lock;
> +		sky1_gate_ops = &sky1_audss_clk_gate_ops;
> +		sky1_gate->regmap = regmap;
> +		sky1_gate->offset = gate_cfg->offset;
> +	}
> +
> +	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
> +				       sky1_mux ? &sky1_mux->mux.hw : NULL, sky1_mux_ops,
> +				       sky1_div ? &sky1_div->div.hw : NULL, sky1_div_ops,
> +				       sky1_gate ? &sky1_gate->gate.hw : NULL, sky1_gate_ops,
> +				       flags);

Please use devm_clk_hw_register_composite_pdata() to make sure that
everything is cleaned up in the expected order relative to the other
devm_*() calls.

Please go through the Sashiko feedback at 
https://sashiko.dev/#/message/20260630125936.E186A1F000E9%40smtp.kernel.org
and I'll do do a thorough review on the next version.

Brian


