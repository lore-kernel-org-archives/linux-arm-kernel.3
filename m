Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D44BC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWKiyNN+ZwBt0vGFx3kkNpOpb4m1x6useaF3SDDlZcY=; b=3wNXv/U7AqKyqdhWOwOAEfN1hF
	vExwb/e5fj04ynOOpcOpl4kTcfEB+6lC1eKG8EYZBlEvbKbXOFCd7LcIC6VRC75Ce4AejPEvtiKiQ
	AJ5rycVv/6rVYTQIpH9cm0/48TArEFwKO/PC9PSV5oZnGkojMwEQCnV4f+WyNkJIio+1iB2J+fdZg
	Rcc4J5Q4hYmuV95JI81+EMaDLZ7ySEUHqBpE+PAk+J7BlWbMzTjpISC0UTBWuoFM+LbiXC7G59iU8
	aLv/8YCO7OWZjR9YRfWlBow2OVBFBJY5VE2qw066toWN6H2n3W+hzaYb5D4gM2Koeg6dhrhoL+OWT
	QPwCkFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Wuf-00000000y5O-40Jv;
	Mon, 21 Sep 2026 05:50:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Wue-00000000y4o-3wGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 05:50:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 241A96020F;
	Mon, 21 Sep 2026 05:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0021F000FF;
	Mon, 21 Sep 2026 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969799;
	bh=cWKiyNN+ZwBt0vGFx3kkNpOpb4m1x6useaF3SDDlZcY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mKSPhQSEAQbQUk/qpzd9pxG3/Q9UaKEzaTWtXTB1NHN4Y0Bhif/tAxpMtiFvEXzvO
	 eDGM2VDLdzLY0XJVzY+tWiCstMULIjcbwjIO0SCPsFU2HXZAB6DSoWqB5VDrUpsh/p
	 kSWD90CG4yYY38Jun/glqpWGzkVQmMgscHHYRbFGQbzKMm2J5tgZBjZk6Zbs1XCtlx
	 N6NnuQ2+GbbqV1DBDflPCrlJ0cmpOj1k5Cc2SyRimXB295sVlzzVuQDdkQsP+qhu1a
	 CjqX1oqvQdUyPsGI6Hm6ETua7PBH7aQs2IAI4fCDWSD1el0ZRtAT0Gj29L14WLzwIa
	 0mBhEi8p9t4Nw==
Subject: Re: [PATCH net v2] net: stmmac: request the MDIO reset GPIO only once
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaolinkui@kylinos.cn, stable@vger.kernel.org
Date: Mon, 21 Sep 2026 05:49:58 +0000
Message-ID: <178996979856.2160803.6509728485884520489@kernel.org>
In-Reply-To: <20260920054703.1897755-1-xiaolinkui@126.com>
References: <20260920054703.1897755-1-xiaolinkui@126.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Guard mismatch between where the MDIO reset GPIO is acquired
  and where it is used: stmmac_mdio_register() acquires the descriptor…
- [Low] The new devm_gpiod_get_optional() call is placed before the
  driver learns that the DT MDIO node is disabled, and is not…
- [Low] The new devm_gpiod_get_optional() in stmmac_mdio_register()
  (stmmac_mdio.c:604-609) is not wrapped in `#if…

--

net: stmmac: request the MDIO reset GPIO only once

This moves the "snps,reset" GPIO lookup out of stmmac_mdio_reset() and
into stmmac_mdio_register(), caching the descriptor in
struct stmmac_priv::mdio_reset_gpio.  stmmac_mdio_reset() now only
pulses the cached line, so repeated calls no longer fail with -EBUSY
from a second devm_gpiod_get_optional().

A few questions about the new placement of the request.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index afe98ff5bdcb..346f93f86abe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -386,15 +386,8 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  
>  #ifdef CONFIG_OF
>  	if (priv->device->of_node) {
> -		struct gpio_desc *reset_gpio;
>  		u32 delays[3] = { 0, 0, 0 };
>  
> -		reset_gpio = devm_gpiod_get_optional(priv->device,
> -						     "snps,reset",
> -						     GPIOD_OUT_LOW);
> -		if (IS_ERR(reset_gpio))
> -			return PTR_ERR(reset_gpio);
> -
>  		device_property_read_u32_array(priv->device,
>  					       "snps,reset-delays-us",
>  					       delays, ARRAY_SIZE(delays));
> @@ -402,11 +395,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  		if (delays[0])
>  			msleep(DIV_ROUND_UP(delays[0], 1000));
>  
> -		gpiod_set_value_cansleep(reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->mdio_reset_gpio, 1);
>  		if (delays[1])
>  			msleep(DIV_ROUND_UP(delays[1], 1000));
>  
> -		gpiod_set_value_cansleep(reset_gpio, 0);
> +		gpiod_set_value_cansleep(priv->mdio_reset_gpio, 0);
>  		if (delays[2])
>  			msleep(DIV_ROUND_UP(delays[2], 1000));
>  	}

[Severity: Medium]
Is the pulse site still gated on the same condition as the new
acquisition site?

Here in stmmac_mdio_reset() the only guard is CONFIG_OF plus
priv->device->of_node, while the request added in stmmac_mdio_register()
is additionally gated on mdio_bus_data->needs_reset.  For a DT device
where needs_reset is false, priv->mdio_reset_gpio stays NULL, so both
gpiod_set_value_cansleep() calls are no-ops, the delays are still slept,
and the function returns 0.

The caller that the commit message identifies as the victim does not test
needs_reset either:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_resume() {
	...
		/* reset the phy so that it's ready */
		if (priv->mii)
			stmmac_mdio_reset(priv->mii);
	...
}

needs_reset == false together with an of_node is produced in-tree, for
example:

drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c:tegra_eqos_probe() {
	/* MDIO bus was already reset just above */
	plat_dat->mdio_bus_data->needs_reset = false;
}

drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:loongson_dwmac_dt_config() {
	plat->mdio_node = of_get_child_by_name(np, "mdio");
	if (plat->mdio_node) {
		dev_info(&pdev->dev, "Found MDIO subnode\n");
		plat->mdio_bus_data->needs_reset = true;
	}
}

In the loongson case needs_reset stays false when there is no "mdio"
subnode, while the device still has an of_node.

On such a configuration, before this patch the first stmmac_mdio_reset()
call did request the line and drive the pulse; afterwards the pulse never
reaches the wire.  Would gating the acquisition on exactly the same
condition as the use site (or not gating it on needs_reset at all) avoid
that divergence?

Related, the commit message says:

    "The request is still gated on mdio_bus_data->needs_reset, which is
    the condition that installs the reset callback, and on the device
    using DT, as the reset itself is."

Is that accurate for the stmmac_resume() path, which calls
stmmac_mdio_reset() regardless of needs_reset?

For what it is worth, no in-tree DT was found that combines
needs_reset == false with "snps,reset-gpio" (all in-tree users of that
property go through stmmac_platform.c, which sets needs_reset = true), so
the lost pulse depends on a firmware or vendor DT, such as the
firmware-provided Loongson one.

> @@ -608,6 +601,14 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	if (!mdio_bus_data)
>  		return 0;
>  
> +	if (mdio_bus_data->needs_reset && dev_of_node(priv->device)) {
> +		priv->mdio_reset_gpio =
> +			devm_gpiod_get_optional(priv->device, "snps,reset",
> +						GPIOD_OUT_LOW);
> +		if (IS_ERR(priv->mdio_reset_gpio))
> +			return PTR_ERR(priv->mdio_reset_gpio);
> +	}
> +

[Severity: Low]
Can this request run for an MDIO bus that is disabled in DT and will
never be registered?

stmmac_of_get_mdio() does not filter unavailable nodes in either branch:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_of_get_mdio() {
	if (of_match_node(need_mdio_ids, np)) {
		mdio_node = of_get_child_by_name(np, "mdio");
	} else {
		for_each_child_of_node(np, mdio_node) {
			if (of_device_is_compatible(mdio_node,
						    "snps,dwmac-mdio"))
				break;
	...
}

so a disabled child still reaches stmmac_mdio_setup(), which sets
plat->mdio_bus_data->needs_reset = true.  The MDIO core then rejects it
before the reset callback can ever be installed:

drivers/net/mdio/of_mdio.c:__of_mdiobus_register() {
	/* Do not continue if the node is disabled */
	if (!of_device_is_available(np))
		return -ENODEV;
}

and stmmac_mdio_register() turns that into success:

	err = of_mdiobus_register(new_bus, mdio_node);
	if (err == -ENODEV) {
		err = 0;
		dev_info(dev, "MDIO bus is disabled\n");
		goto bus_register_fail;

Before this patch the lookup only happened from the reset callback, so
nothing was requested in that configuration.  With the request moved
here, three things change for such a board:

- a lookup error (-EPROBE_DEFER while the gpiochip is not yet present,
  -EBUSY from another consumer, or anything else) is returned from
  stmmac_mdio_register() and aborts or defers the whole MAC probe, for a
  reset that can never run
- on success the devm descriptor holds the line for the device lifetime
  with no user at all, since probe succeeds and devres cleanup does not
  run
- GPIOD_OUT_LOW drives the reset signal to its inactive level for a bus
  DT asked not to be used

Would requesting the GPIO only after a bus has actually been registered,
or skipping the request when the MDIO node is present but unavailable,
be preferable?

No in-tree DT was found that declares "snps,reset-gpio" on the MAC node
and marks its MDIO child disabled, so the probe-abort and early
de-assertion parts are not demonstrated on an in-tree board; the
reserved-but-unused line follows directly from the code.

[Severity: Low]
Should this request be inside the same conditional compilation block as
its only consumer?

stmmac_mdio_reset() wraps its whole body, including both
gpiod_set_value_cansleep(priv->mdio_reset_gpio, ...) calls, in:

	int stmmac_mdio_reset(struct mii_bus *bus)
	{
	#if IS_ENABLED(CONFIG_STMMAC_PLATFORM)

so with CONFIG_STMMAC_PLATFORM=n the function reduces to return 0, and
priv->mdio_reset_gpio has no reader, while the new request above is
compiled unconditionally.

That combination is buildable: DWMAC_LOONGSON, DWMAC_MOTORCOMM and
STMMAC_PCI sit after "endif # STMMAC_PLATFORM" in
drivers/net/ethernet/stmicro/stmmac/Kconfig, and dwmac-loongson.c
includes only stmmac.h and stmmac_libpci.h, so it links without
stmmac_platform.o while still setting needs_reset = true on a device
with a firmware-provided of_node:

drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:loongson_dwmac_dt_config() {
	plat->mdio_bus_data->needs_reset = true;
}

In that build the "snps,reset" line is claimed for the device lifetime
while the code that would pulse it does not exist, and a transient
lookup failure aborts probe.  Before the patch acquisition and use were
always compiled together.  Putting the request under the same
IS_ENABLED(CONFIG_STMMAC_PLATFORM) guard, or dropping the guard from
stmmac_mdio_reset(), would keep them paired.

No in-tree Loongson DT carries snps,reset-gpio, so this has no observed
effect on in-tree boards.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260920054703.1897755-1-xiaolinkui%40126.com

