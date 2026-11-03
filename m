Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F8606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/7/hore;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VB2YJGf6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ax+Y1NYJ7G+p3oM+b1SjSykoPY3EvHvOyGpyknFiIuU=; b=Y/7/horeqYIY2UdxHyt1pZq73K
	Rytu4kfWHMrI54YNcwtsAAsVvOowCXALwGMiGWImpMw1S3oqJalBkBDaOgq6KhbspN916+ifjtQEY
	Twh4dNSJJlAVtPZAxCaV68P64U9iJBrfBElt6g44yMhWIlsYHwKeOkPB6FgjPztyucsO2VbKBtcxt
	n5AKgjPrM2kPESSPB0pPiMnlrO3BP5veQtUoqBf3xtw8QQ9m1xivuIL/mokHiU9vQ04NGq/2TwwRy
	HYSJbGaH6dXaHoPdYuFbApCrwa7QswdkBku6rGngcZOU0HAkMJESoeddBn5OEjny7C4zkgcsT13CW
	LkAWjbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB2y-00000001mx1-2NRH;
	Tue, 03 Nov 2026 09:43:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB2x-00000001mwj-3Ka2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45BCA410A8;
	Tue,  3 Nov 2026 09:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7E71F000C1;
	Tue,  3 Nov 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698995;
	bh=Ax+Y1NYJ7G+p3oM+b1SjSykoPY3EvHvOyGpyknFiIuU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VB2YJGf6qTqPTT2o1HMhTrsJ1ggNEmsUspWeULkwX39iyMgek3DLLLcNMIdCtakZN
	 XP/S56xZo0yC3yRCBTTQWRb4QzGrR7c7Hbpy5ygVo65+UA7Z6pAcPnxIObdaxTar2+
	 c+k61U8oa/6OBp10g812TMh6x2JQFtQxvBk9+iBeBVwt7/xo9XenP2fNnWU3uvDkFh
	 6PYvH8ImiFTiMscwKX4YJgVQwAjWrK+2NSRv8uvUhfkYvptnsn+Bjw48Cdv+bpAdUW
	 JWdFfmlJ398b3HrqKsQGvcSMV7yGSi0cSUzWoC317d851Kc4nbO4m5SaMfL5MVm4Tl
	 YpZyeh04NGDlw==
Subject: Re: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak
 in prueth_probe()
From: netdev-bot+sashiko@kernel.org
To: laixiangwu@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 09:43:14 +0000
Message-ID: <179369899417.488856.4974450054291603730@kernel.org>
In-Reply-To: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
References: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
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
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The same leak is still present in the sister ICSSG driver.

--

net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()

In the SR1.0 driver, prueth_probe() returned -ENODEV directly when the
"ti,mii-g-rt" or "ti,mii-rt" syscon regmap lookup failed. That return
leaked the eth0_node/eth1_node references taken with of_node_get(). The
patch sends both error paths to the existing put_cores label instead.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> index b8115ca47082f..ef1dc32ff8b46 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> @@ -963,13 +963,15 @@ static int prueth_probe(struct platform_device *pdev)
>  	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
>  	if (IS_ERR(prueth->miig_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}
>
>  	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
>  	if (IS_ERR(prueth->mii_rt)) {
>  		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto put_cores;
>  	}

[Severity: Medium]
The SR1 change looks correct. Does the sister driver still leak the
port@0/port@1 device_node references the same way?

prueth_probe() in drivers/net/ethernet/ti/icssg/icssg_prueth.c parses the
ports the same way. It calls of_node_get(eth_node) for each port and stores
the results in prueth->eth_node[]. It still returns directly on both syscon
lookup failures:

drivers/net/ethernet/ti/icssg/icssg_prueth.c:prueth_probe() {
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
put_cores:
	if (eth0_node || eth1_node) {
		prueth_put_cores(prueth, ICSS_SLICE0);
		of_node_put(eth0_node);
    ...
}

Both returns skip put_cores, which is the only place eth0_node and
eth1_node get released.

The same ret = -ENODEV; goto put_cores; change should work there without
modification:

  - prueth is allocated with devm_kzalloc().
  - prueth_put_cores() NULL-checks the core handles.
  - of_node_put(NULL) is a no-op.

Valid DTs can reach this path. The ti,icssg-prueth.yaml binding does not
list "ti,mii-rt" under required, so an AM64x/AM65x SR2.0 DT without that
phandle would leak these references on every probe attempt.

The SR2 driver would need a different Fixes: tag, so could this be sent as
a separate companion patch rather than folded into this one?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030085851.2019-1-laixiangwu%40cmss.chinamobile.com

