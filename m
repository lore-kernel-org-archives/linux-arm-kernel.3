Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB2CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU5rDB+VrDABQDIH5NSBgXFhWETxK1QagBiSzme5jbg=; b=sZGaeZS2TQCSNOiTP2ufJU6qYT
	2/IMUi4OdqAWS4yX+TPDIaZwcm1CfoSDPVN4JmTzCLKgPJjCWk7ZlzcI61oX6xqjQfVN1a47sQvrL
	+S7enAJfx6+0lrykdqS8a/5EoIBX3RBwMuuGkbI9F5omRyT3MMuzt+ErNq5nI91s787zENfKRRXDk
	mnAUnQJk8x4uWtJHD4vJ1rFujwqtyOItvjpqD79jnikOXX7B5r9kmpekiaGFqS27Snviw+7ejouMt
	6lxZmQ943swPl7r7OFRwp3uWw/Xuv8ol/c8Ng/mq8CfsDYhxcrzJuP8vXyex6/QDObk7zIgGl+Tpo
	PdlRxYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0d7-0000000DanS-0SlX;
	Sat, 03 Oct 2026 14:22:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0d5-0000000DamG-1IkU;
	Sat, 03 Oct 2026 14:22:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BEA1432D2;
	Sat,  3 Oct 2026 14:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444FD1F0089B;
	Sat,  3 Oct 2026 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791037342;
	bh=wU5rDB+VrDABQDIH5NSBgXFhWETxK1QagBiSzme5jbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HupJsVVBF1dHKykTQ4kDj6W1v0bhCqz3zdZNM5z8Ua2I8J6c937ttT5WgloXKLeE8
	 vxqbwr6qEMHwnyXZ9IVNbXssGaaTYPFsjcVYcOOqEnOoAzOqNLYN0gl1rRtc2e51IK
	 S5XS0v6dBZWkMEru1s6uq63ih7+LVa840i2CC2Fhhnq6GhoXw/YY4jVaC9YY86Giz5
	 iFADACWg+h+gBa/4m9pvN04TpYbQWis4MhKNIv1hgvP+f17JDQDLIxtRjSnyA6jY8u
	 oKkGSZUp6GjuXpcahihgrxXGzVsYSV4PsQvWfDV9Iqk1YvncaLW5D6Is8IWrY2wytJ
	 rkQdqjWQ524dQ==
Date: Sat, 3 Oct 2026 16:22:18 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 16/20] phy: Add common Innosilicon HDMI PHY helpers
Message-ID: <asEPmpQTwXYADwTk@parshuram>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153242eucas1p1394a6a5e272f106b9cab2a0f709ddeb8@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-16-f0e4fd6f2cc8@samsung.com>
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

On 15-09-26, 17:32, Michal Wilczynski wrote:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
> 
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
> 
> No driver uses it yet; the users are converted separately.

Is there anything in phy patches here that has dependency with rest? If
not consider splitting it up...

> +static u8 inno_read(const struct inno_hdmi_phy_pre_pll *pll, unsigned int reg)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(pll->regmap, inno_reg(pll, reg), &val);
> +	if (ret)
> +		return 0;
> +
> +	return val;

why not just return regmap_read()

There is no logic here, nothing. This is really not ideal.
Also why add a wrapper and not use regmap directly?

> +/**
> + * inno_hdmi_phy_pre_pll_determine_rate - clk_ops.determine_rate helper
> + * @pll: pre-PLL instance
> + * @req: rate request, updated with the rate the PHY would produce
> + *
> + * The PHY can only generate the pixel clocks described by its table, so a
> + * request that does not appear there is rejected rather than rounded.
> + *
> + * Return: 0 on success, -EINVAL if the rate is not supported.
> + */
> +int inno_hdmi_phy_pre_pll_determine_rate(const struct inno_hdmi_phy_pre_pll *pll,
> +					 struct clk_rate_request *req)
> +{
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
> +	unsigned long rate = rounddown(req->rate, 1000);
> +
> +	for (cfg = pll->table; cfg->pixclock != 0; cfg++) {

Is there a chance of null/garbage if we reach end of table? You dont
know the size of table, and incrementing pointer without bounds does not
look good to me.


-- 
~Vinod

