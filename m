Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F09DC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpywZ61GVDAOFR+Mi4XGw0+j/0Qz4uq1MFfiy1m6+CM=; b=admy3xRCru8/X5x6E38dQf0D2b
	/ndjY6dw/1Jra+nTN8NCLL8a16S4phCU3jjQfNdhH/5xBHob0ANN0U7JEET7qW/9QzDcBNOjIlpAH
	ndajTcF4RN3VAlPiXH5oTr0HLdv84iZlVNgkmM8rGoaScBXFBu3lzzflcOIXcKTeAiXfvh1iPMzN/
	1UJju3bghLBW6YCsLZU98MzGegG4UYErBU/nsdIzZ0i6nSEV2ofh0cLRbKasldS2QpiYs4XcRcGnc
	G9hm64RDGr+lVJKliuTuB1oEJx4elxNfxehp4xyyrBDq27GtZgddoIJFraY0bP8eLDNljuKPIlnUi
	UcS2SGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKR2-0000000GUW9-1xeS;
	Wed, 14 May 2025 22:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKIe-0000000GTKW-1GbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46B01629E1;
	Wed, 14 May 2025 22:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965E6C4CEE3;
	Wed, 14 May 2025 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260602;
	bh=+AHy91Zm18iqzvNONIywPewRCFhZPA5DZZNdhCtRybk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad1Bi3K8PAVcJOJglaeuy+lYOjyjLoUx5ozjJYMmLg2/Rae5Eyq7mtCKh657YkgHw
	 Srtm1SiImLwHY7QI9mRalOId5l/i0wjlTcQucBFGxtnttev7XeUsA06lKiWa9oARrf
	 K2DKEfQWdS2toqXqeYYGC5YbOX/dpXaC/R4jREBpDgUONYMq7JZDctkUa/LNCZ4uxj
	 JUzQUW0O6KA4UnbZsBwKB2mCL8EPeKy9MQPMtNi+1WynLhK4VxlpXlw4ivNNdl0NPC
	 fC8K+JA1Wuwn818qcyPTt1qWHYGBelDmeiVCnLX9s5tFeeXUS2fhiMegE5Xb6IyosZ
	 m4hcvHXRl3fng==
Date: Wed, 14 May 2025 17:10:01 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 10/19] dt-bindings: media: i2c: max96712: deprecate
 enable-gpios
Message-ID: <20250514221001.GA3125068-robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-11-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-11-demonsingur@gmail.com>
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

On Tue, May 13, 2025 at 12:28:19AM +0300, Cosmin Tanislav wrote:
> The MAX96712 actually has a GPIO named PWDNB, which will put the chip
> in reset state when held low. Esentially, it works as an enable GPIO,
> but the naming is different.
> 
> Deprecate the enable-gpios property, and add powerdown-gpios as the
> rest of the GMSL chips.
> 
> Change the example to use powerdown-gpios.

I don't know that this is worth changing because then we have to 
maintain both forever.

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index b345305acc4c..e38213209973 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -35,7 +35,13 @@ properties:
>      description: I2C device address
>      maxItems: 1
>  
> -  enable-gpios: true
> +  enable-gpios:
> +    maxItems: 1
> +    deprecated: true
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
>  
>    i2c-alias-pool:
>      maxItems: 4
> @@ -128,7 +134,7 @@ examples:
>              gmsl0: gmsl-deserializer@49 {
>                      compatible = "maxim,max96712";
>                      reg = <0x49>;
> -                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
> +                    powerdown-gpios = <&pca9654_a 0 GPIO_ACTIVE_LOW>;
>  
>                      ports {
>                              #address-cells = <1>;
> -- 
> 2.49.0
> 

