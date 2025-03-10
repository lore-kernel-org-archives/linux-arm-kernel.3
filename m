Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Mo5ZHNYkXR23YBEaYNTofBAo+myCtIHSCyNnU6Cy3o=; b=k15fPDYhZE1xJ4OMLpY8WGLxU8
	ocwOG4UTkRxveuf+hDHde3NyirGtUnBinOIWihm6PNRl1yz6sBdIrENPVzYBxDywRDefUxyUT8ByK
	jeNXfgwxmczQQ4BA/W0pOl9cP2TCOenO8CZRp5sF7h1zY+MS2Hfy+JK/cWAV7QSkVuRcoyw0IL7s9
	Fd1kYZ3x6QUv0kkAyKdZmb2+SGisiIEUa/vDMDMof+V1LQ63RuyBws3Udl5PNcMSg89uKSTLRUP2o
	jh0dw8xSN4Dpgm+Lz6y04gw2rbOWvgOfRvcmLJyTGLs8+xdI1BquSQNo4q9aIHtFuUmgPIQNTdEae
	TWoNznog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdRC-00000002peq-3qEE;
	Mon, 10 Mar 2025 13:44:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcSY-00000002f54-0IBx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0A66A45BC2;
	Mon, 10 Mar 2025 12:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3FDC4CEE5;
	Mon, 10 Mar 2025 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741610536;
	bh=ObpVnhp7/WvbJw/e+3sP5lgQP0HfPvs44VTr++TsRXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGfESHB/psqrhlcOLS+OwH6t7yooA+1QYsuVQnl8Ss5VqubkcbfYsnkx6p4bCfRmI
	 cJPbP4Q239ASJOSWlFY3vpa5YHVp1w3mCwD+HrIWQt+yc4aLNiZKLU8UPojZSCTzOc
	 LRTs1yk2A5OsO6ZykR8Z2WlysIWaXjW/BV7SsPrPnot9b9L+ZhGa37C/fvlXcABUjJ
	 0P4fTuROXrcaFGR5j2dsAAUWdPIYPGn3Z31Wg18FMqnQLq9pnLzgMDGktSiLGQksCG
	 mT5oZzh5PUtZYxMJS175ePcgJ5izvqCJCHu+JO1DKKSJfM7hsmUwo69gq///20jjSv
	 fyh7tVGiyhJ+g==
Date: Mon, 10 Mar 2025 07:42:14 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 07/11] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <20250310124214.GA3869453-robh@kernel.org>
References: <20250310092345.31708-1-ryan@testtoast.com>
 <20250310092345.31708-8-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310092345.31708-8-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_054218_234799_B4120D79 
X-CRM114-Status: GOOD (  18.22  )
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

On Mon, Mar 10, 2025 at 10:09:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - increase reg maxItems to 3 and add conditional for h616-de33
> ---
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad..274f5e632733 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,9 +24,11 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

What's in each region?

>  
>    clocks:
>      items:
> @@ -61,6 +63,23 @@ properties:
>      required:
>        - port@1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun50i-h616-de33-mixer-0
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3
> +
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.48.1
> 

