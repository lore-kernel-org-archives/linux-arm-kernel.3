Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qTjLlkN9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irjFoygH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O3d/n16SRIaChoquul/22MyjLciFyvW1PFCW6xdG56M=; b=qTjLlkN93JoAfgc1RDywepKV+l
	unSYGKFlQd9N14l1K3q0k6zHc0f3cLMQn3SaPt2nFD211jFEBkGy9UdMOISwLzpNf00FwoHlAr/3D
	GIlleUlScz+/8YCvihPVgxs5lAMhT1PESGoIrbacGYPNXB067aGAJjjvV67Bd4XzILFdzCamIo+HA
	5kJxORiQzDDxrtehCJD5qAYirBrTGgogtwU4xbg2TFr0j47tBDf9N59QzjhUGCmnZae9pFFHtMUz/
	iWR3BRIkhoQdJkYOSvJ6kCBOv3n9NCcpxnTVLi4gzpEMksBGv1+atHIZ0nL97ol9zCJVRxliXPwPV
	VCjEy8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqiB-0000000CIB4-1OBu;
	Fri, 30 Oct 2026 17:48:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqi9-0000000CIAp-2Rvm;
	Fri, 30 Oct 2026 17:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 561B060233;
	Fri, 30 Oct 2026 17:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3751F000C1;
	Fri, 30 Oct 2026 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793382496;
	bh=O3d/n16SRIaChoquul/22MyjLciFyvW1PFCW6xdG56M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irjFoygHPc/M/KH5DfQMRxGakSHaMvelsussg2LmGkfibkxqOCylGUH21ktk/XnO+
	 X7fALqcy9SIw1snW2Ix79NQSFiuoatfgUcgqvKrSe8rD3iCCIT+5iWWWFdOvyt1Z6U
	 eZ+ghZwRYBbGAFatwkqOYt2+LTU7IAwi7rm7JlKHnAfkoJ8hrn5HFUGwsj0M5wJ+mR
	 +xLIhFzCSsOY/O3AsVTeyVZ4++O6InBpPKhkKt9xYC6GO+ZROE764ZP/CjCiidmMGK
	 AqOjJ948YHkvfZVZMoVCiyELzhUYmi/EG4B3HmYiPGzPPsT57C/P7TpdTz6+C0FyNM
	 hjA2/Gu/bE8bA==
Date: Fri, 30 Oct 2026 12:48:12 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Message-ID: <20261030174812.GA985982-robh@kernel.org>
References: <20261021153953.285222-1-ansuelsmth@gmail.com>
 <20261021153953.285222-2-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021153953.285222-2-ansuelsmth@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 05:39:52PM +0200, Christian Marangi wrote:
> The same I2C driver is also used for Airoha SoC with the only difference
> that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.
> 
> Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
> Mediatek SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/i2c/busses/i2c-mt7621.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 0a288c998419..19dde7c4069e 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -65,6 +65,7 @@ struct mtk_i2c {
>  	u32 clk_div;
>  	u32 flags;
>  	struct clk *clk;
> +	bool have_scl_stretch;
>  };
>  
>  static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
> @@ -83,6 +84,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
>  
>  static void mtk_i2c_reset(struct mtk_i2c *i2c)
>  {
> +	u32 reg;
>  	int ret;
>  
>  	ret = device_reset(i2c->adap.dev.parent);
> @@ -93,8 +95,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
>  	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
>  	 * configure open-drain mode, this bit needs to be cleared.
>  	 */
> -	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
> -		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
> +	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
> +	if (i2c->have_scl_stretch)
> +		reg |= SM0CTL0_SCL_STRETCH;
> +
> +	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
>  	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
>  }
>  
> @@ -249,6 +254,7 @@ static const struct i2c_algorithm mtk_i2c_algo = {
>  
>  static const struct of_device_id i2c_mtk_dt_ids[] = {
>  	{ .compatible = "mediatek,mt7621-i2c" },
> +	{ .compatible = "airoha,an7581-i2c" },
>  	{ /* sentinel */ }
>  };
>  
> @@ -296,6 +302,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	/* Set SCL_STRETCH only for Mediatek SoC */
> +	if (device_is_compatible(i2c->dev, "mediatek,mt7621-i2c"))
> +		i2c->have_scl_stretch = true;

Add match data for this. Calling device_is_compatible() doesn't scale.

Rob

