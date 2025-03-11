Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C78AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5s9uXgF/dn4Q3Rw5Hr1vVRyzTBUq/ZrG/JwNAj8gXI=; b=EkVSQ10vZ/YWTDtD1auIrhrGEB
	dmUJXUHbI6SEW5EnlA3OQM4x1coKw/vqEeDuFB9sXHdJCGBpQNfggR1RWY3Q/ph5GOPl/nD/cRdDz
	UiSgVwyd3rdEBDocpHHAY4UD/0cCrXKPa1KinJk0IVMCvlyBQu7lrBuOz0X8k82ze9V5o5tZBbB58
	5R015fgadM2ib28FStb5hSSvu0PfcPMTiQWLVc4wrwMH2aSumkXiD0wFsb25cfOOxJcHyWVOoe2OK
	FpQfKlouB3Hro3juoJT0q+0UbE+PEqqdmnATVEhMQSFw4fvr9KaORVENdP9sNwIAPuTj3k2p0a3/B
	g74y+4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4v0-00000006ira-2Q9O;
	Tue, 11 Mar 2025 19:05:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4qM-00000006hiy-1B09
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71906A4614D;
	Tue, 11 Mar 2025 18:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D776FC4CEF5;
	Tue, 11 Mar 2025 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719645;
	bh=DJE3hrk9AdamWIG94xUchIGvrt68FJeglEzl24bMVIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noD6Dzl6CI/9uwK7fCzJAuLvtMDhUifR+zkPqMtS82Pbm3M/HB43Gvb3uUjktjPSQ
	 3p9P8RphfJrCAlmTjDb47syFRwFczUq9TmWfrkkkAJUXqA4UNfxIQPR27ojOegA73S
	 20A/hH2NQ9XNesAzO3EUIE5WiNQ90Q/qfwZfeUx3XvRInbaultpVpizrR/vSxD+4UX
	 wkbvjTxBnjjOj5mMuIei4wspAPJtR53NpQAZyoXhlBDBJzYzmhW+1xkptCrZjQF6Z9
	 Z883MEpS7mQiCtLWJgokj4AMw8AOcbxIzxWdotiB2/+ntvMeWXOk49aq/zM32mB8K7
	 jqZu54PpSj7Bw==
Date: Tue, 11 Mar 2025 14:00:43 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 08/16] dt-bindings: media: i2c: max96712: use
 pattern properties for ports
Message-ID: <20250311190043.GA3972023-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-9-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-9-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_120046_437092_883E41C6 
X-CRM114-Status: GOOD (  17.97  )
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

On Sun, Mar 09, 2025 at 10:48:00AM +0200, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index efdece2b33b9..bf8c861c836b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -40,27 +40,15 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -    properties:
> -      port@0:
> +    patternProperties:
> +      '^port@[0-3]$':
>          $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 0
> +        description: GMSL Input port

GMSL Inputs 0-3

Though generally every port needs to be documented. So really, this was 
correct before.

>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 1
> -
> -      port@2:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 2
> -
> -      port@3:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 3
> -
> -      port@4:
> +      '^port@[4-7]$':
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: CSI-2 Output
> +        description: CSI-2 Output port

The input port numbers are 1:1 with Input numbering. I imagine that's 
not the case here, so the relationship of port #s to outputs needs to be 
documented.

>  
>          properties:
>            endpoint:
> @@ -78,8 +66,11 @@ properties:
>                - data-lanes
>                - bus-type
>  
> -    required:
> -      - port@4
> +    anyOf:
> +      - required: [port@4]
> +      - required: [port@5]
> +      - required: [port@6]
> +      - required: [port@7]
>  
>  required:
>    - compatible
> -- 
> 2.48.1
> 

