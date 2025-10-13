Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B757CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LTZrufjVKydnAeeBf8iH9nQwzPwEyxniOmlDYsFckI=; b=KctmSrt7e0/bH7mN9NnO1atCma
	MlptcoK9Unpg8VJb9p/6hQRovMLtubtzToD+qKh2GoST/+/5voJWt86wN69zuJyRfBBv3BZR6/uGr
	cws76/AEDqv5EQNPomoiWcslMuJW5HDu+ZqMT6XeWi2k+psq1iFWY6N1b1NuSJ1PBPVVjYGUH4Iez
	ACPJHLYWfP5bsiATblaSEh7RNwXKrDj6o9MpW4CFC0shvK2CIcmdIafSgtKKO+90KEEGG9C12strz
	oIq/VWXyV4sheesEJwFwUt/s8wiRAJ67xihtNhtuZrhLumcNi9F5flQ+LHTnM8LCtpJJT9lbvsRWB
	i1As48PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HFZ-0000000D4ns-2qSl;
	Mon, 13 Oct 2025 12:02:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HFX-0000000D4mK-2xHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1262D40659;
	Mon, 13 Oct 2025 12:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BE4C4CEF8;
	Mon, 13 Oct 2025 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760356918;
	bh=enYvefS/Tikr/Df0tXu3N3tbv+xh83SSpDgp+gSP1uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsAxw18d3PhgxxvJaH7gROC84TX83T9iXdI0WW3ryh6GyGpvb2HybHDhYwaksZIIX
	 OZHcBEKDRss5TPORXs4HIusjwGIcokEs6oLikvf3cf8zE+5SSOEkdI4IZB5rVm64w2
	 I7yBw8baqbvGjLcIQUmuByGrjP3cGe6wcwDdn3ZrkvPMckqVMjHi59CMurDQtUn/Td
	 8nrb6KA1wUnJoPtYa2lJiSqKU+DJBneu4qjVETnFv/2X3/bU0UQfnfvjiCovDKOC0v
	 vGrMBaQ4CxRoBmEooLgLQ2uyj+ZsVUMqPaFxqd8qvZnTsxijPXBJ8CxyBHD26nBxHb
	 v+EdaYr1041hg==
Date: Mon, 13 Oct 2025 13:01:54 +0100
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix fdb hash size
 configuration
Message-ID: <aOzqMj1TbzJCZrRk@horms.kernel.org>
References: <20251013085925.1391999-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013085925.1391999-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_050159_811031_3C88143B 
X-CRM114-Status: GOOD (  22.54  )
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

On Mon, Oct 13, 2025 at 02:29:25PM +0530, Meghana Malladi wrote:
> The ICSSG driver does the initial FDB configuration which
> includes setting the control registers. Other run time
> management like learning is managed by the PRU's. The default
> FDB hash size used by the firmware is 512 slots which is not
> aligned with the driver's configuration. Update the driver
> FDB config to fix it.
> 
> Fixes: abd5576b9c57f ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> Please refer trm [1] 6.4.14.12.17 section
> on how the FDB config register gets configured.
> 
> [1]: https://www.ti.com/lit/pdf/spruim2

Thanks for the link!
And thanks to TI for publishing this document.

> 
>  drivers/net/ethernet/ti/icssg/icssg_config.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
> index da53eb04b0a4..3f8237c17d09 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_config.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
> @@ -66,6 +66,9 @@
>  #define FDB_GEN_CFG1		0x60
>  #define SMEM_VLAN_OFFSET	8
>  #define SMEM_VLAN_OFFSET_MASK	GENMASK(25, 8)
> +#define FDB_HASH_SIZE_MASK	GENMASK(6, 3)
> +#define FDB_HASH_SIZE_SHIFT	3
> +#define FDB_HASH_SIZE		3

I am slightly confused about this.

The patch description says "The default FDB hash size used by the firmware
is 512 slots which is not aligned with the driver's configuration."
And above FDB_HASH_SIZE is 3, which is the value that the driver will
now set hash size to.

But table 6-1404 (on page 4049) of [1] describes 3 as setting
the FDB hash size to 512 slots. I would have expected a different
value based on my understanding of the patch description.

>  
>  #define FDB_GEN_CFG2		0x64
>  #define FDB_VLAN_EN		BIT(6)
> @@ -463,6 +466,8 @@ void icssg_init_emac_mode(struct prueth *prueth)
>  	/* Set VLAN TABLE address base */
>  	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
>  			   addr <<  SMEM_VLAN_OFFSET);
> +	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
> +			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
>  	/* Set enable VLAN aware mode, and FDBs for all PRUs */
>  	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, (FDB_PRU0_EN | FDB_PRU1_EN | FDB_HOST_EN));
>  	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
> @@ -484,6 +489,8 @@ void icssg_init_fw_offload_mode(struct prueth *prueth)
>  	/* Set VLAN TABLE address base */
>  	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
>  			   addr <<  SMEM_VLAN_OFFSET);
> +	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
> +			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
>  	/* Set enable VLAN aware mode, and FDBs for all PRUs */
>  	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, FDB_EN_ALL);
>  	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
> 
> base-commit: 68a052239fc4b351e961f698b824f7654a346091
> -- 
> 2.43.0
> 

