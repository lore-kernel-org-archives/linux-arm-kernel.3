Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72547606D83B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1lUl+2Io;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0x3VAey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SxWl47Zl4zSv6hrWucnwr8CzOQ1TbBYqBciLqiXEt4I=; b=1lUl+2IosGoy5+/eyM6yTJPxrh
	V3wGzOEITiehCZuJR0DM8Pn5zdb/6APrb70UJWTkyvUeLhcjLe3YsZMvzvH02IAq98bVsDbyrQjDe
	ZXLVouF5dRW5FAKsKAR832KxLAAbMU0W/OhwxNzifVTLtSJ4hYamm9IhsowOt4buO+Insl4gs6Bq2
	bRuXiskKY6m1NxXRQKNNEGgk4dcZMlZwGs7mbYKDAd2P6rHKMYqfymy/fikLPCnie5W5sYki7Ilr7
	NnvTc3eNi4rNmnc7UHZjlE8/UWbo4D9y7Mt74074+IqrCteDqQ+Y+tpcDbgDUk9nMtCQQgYiWf1tL
	1uLlI8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAzt-00000001mDx-41VE;
	Tue, 03 Nov 2026 09:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAzs-00000001mDF-25Kj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:40:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C797441898;
	Tue,  3 Nov 2026 09:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C31F00919;
	Tue,  3 Nov 2026 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698803;
	bh=SxWl47Zl4zSv6hrWucnwr8CzOQ1TbBYqBciLqiXEt4I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j0x3VAeyyNguDXq1IJjZYYg+GvvhKVj3fvRwGxj6NTwPtHsudPFQGdx9DMI9DPGrX
	 uQE4IvwwRe3RzpEqDw7Fp58QS753x14hObD8t/NZt/lRbtqtlw5ZGS79hajQgiTKUh
	 FJ076WtpetDHuPyZV9LOX3ZWTyxX6e+iMe0Ezrfq2rmI+hD31h7S1BVUico0ReqK/C
	 RTzGaXLXwsp4aZosxhCAe8vIokPCduI8XopjPm7Fu/JkYCQl9sype3mH1AfbPzZv5C
	 PrD4/oIfUhW+KzmPH4rbhR9GGpL5NcwqlWT4DEZMJxUHchi/KYdtm50fakytqv1jUq
	 y2JjFGnFB1Xiw==
Subject: Re: [PATCH] net: ti: icssg-prueth: Fix device_node refcount leak in
 prueth_probe()
From: netdev-bot+sashiko@kernel.org
To: laixiangwu@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 09:40:02 +0000
Message-ID: <179369880262.488856.8946204452140783033@kernel.org>
In-Reply-To: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
References: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The SR1.0 sibling driver keeps the same device_node refcount
  leak, and this patch does not touch it.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the port-
  node loop in prueth_probe()…
- [Low] This problem wasn't introduced by this patch, but the DT binding
  and the driver disagree on whether "ti,mii-rt" is required.

--

net: ti: icssg-prueth: Fix device_node refcount leak in prueth_probe()

In icssg_prueth.c, prueth_probe() returned directly with -ENODEV when the
ti,mii-g-rt or ti,mii-rt syscon lookup failed. This patch changes both
returns to goto put_cores, so the eth0_node/eth1_node references are
dropped on those error paths.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 591be5c8056b4..9b971d1dfd8cf 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -2258,13 +2258,15 @@ static int prueth_probe(struct platform_device *pdev)
>  	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
>  	if (IS_ERR(prueth->miig_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}

[Severity: Medium]
The subject says this fixes the device_node refcount leak in
prueth_probe(). Does the SR1.0 variant of the driver still have the same
leak?

drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c has its own
prueth_probe(). Its port loop takes the same of_node_get() references on
eth0_node/eth1_node, and it still returns directly here:

drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:prueth_probe() {
    ...
	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
	if (IS_ERR(prueth->miig_rt)) {
		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
		return -ENODEV;
	}

	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
	if (IS_ERR(prueth->mii_rt)) {
		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
		return -ENODEV;
	}
    ...
}

That file already has a put_cores label that calls of_node_put() on both
nodes. prueth_put_cores() checks each pru/rtu/txpru pointer for NULL, and
at this point those pointers are still zero from devm_kzalloc(). So the
same "ret = -ENODEV; goto put_cores;" change looks like it would work
there too.

CONFIG_TI_ICSSG_PRUETH_SR1 builds the SR1 driver, and in-tree DTs use it,
for example k3-am65-iot2050-common-pg1.dtsi with compatible
"ti,am654-sr1-icssg-prueth".

Should the SR1 driver get the same fix, perhaps as a companion patch with
its own Fixes: tag?

>  
>  	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
>  	if (IS_ERR(prueth->mii_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}

[Severity: Low]
This is a pre-existing issue and was not introduced by this patch. The
driver treats ti,mii-rt as mandatory here, but the DT binding does not.

In Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml, ti,mii-rt
is only listed under properties. The top-level required list has
ti,mii-g-rt but not ti,mii-rt:

required:
  - compatible
  - sram
  - dmas
  - dma-names
  - ethernet-ports
  - ti,mii-g-rt
  - interrupts
  - interrupt-names

The binding's example node sets ti,mii-g-rt, ti,pa-stats and ti,iep, but
not ti,mii-rt. A DT written from that example would pass schema
validation and then fail here with "couldn't get ti,mii-rt syscon
regmap".

All in-tree users (k3-am642-*, k3-am654-*, k3-am65-iot2050-common.dtsi)
provide ti,mii-rt, so in-tree boards are not affected.

Should ti,mii-rt be added to the binding's required list and to its
example?

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. While
looking at the eth0_node/eth1_node references, the port loop earlier in
prueth_probe() also seems to have a few related problems:

drivers/net/ethernet/ti/icssg/icssg_prueth.c:prueth_probe() {
    ...
	for_each_child_of_node(eth_ports_node, eth_node) {
		u32 reg;

		if (strcmp(eth_node->name, "port"))
			continue;
		ret = of_property_read_u32(eth_node, "reg", &reg);
		if (ret < 0) {
			dev_err(dev, "%pOF error reading port_id %d\n",
				eth_node, ret);
		}

		of_node_get(eth_node);

		if (reg == 0) {
			eth0_node = eth_node;
			...
		} else if (reg == 1) {
			eth1_node = eth_node;
			...
		} else {
			dev_err(dev, "port reg should be 0 or 1\n");
		}
	}
    ...
}

When of_property_read_u32() fails, the code only logs the error and
keeps going. Can the reg == 0 and reg == 1 checks then read an
uninitialized reg?

In the else branch, is the reference taken by of_node_get(eth_node) ever
dropped?

If two available port nodes both have reg = <0> (or both have <1>), the
second assignment to eth0_node (or eth1_node) overwrites the first. Does
the first node's reference leak in that case?

Related to that, can this check ever fire?

	if (eth0_node == eth1_node) {
		dev_err(dev, "port0 and port1 can't have same reg\n");
		of_node_put(eth0_node);
		return -ENODEV;
	}

Each iteration stores a different node into at most one slot. The two
pointers can only be equal when both are NULL, and the earlier
!eth0_node && !eth1_node check already returns in that case. So a DT with
duplicate reg values would probe successfully instead of failing.

The SR1 copy of this loop in icssg_prueth_sr1.c has the same pattern.

>  
>  	prueth->pa_stats = syscon_regmap_lookup_by_phandle(np, "ti,pa-stats");

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030085651.1944-1-laixiangwu%40cmss.chinamobile.com

