Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B68FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWLxqy2XxHNDJ45y2GRnMApq01ZR05zbJQqImjZgPHQ=; b=UQf9mmRZk1NXHhMV3okSTrli6g
	OyeGpeNzguj0rvqfeD/nSCevkktR04YrB2tCfmo+LCvxPWinopN9qSFTis/3kOl4k4rD2/956GeYK
	3tRp2gjUzpeikT33xwTAC8wbdT7RVtdroH+OUqiO/gJOW2Kn10oGopyc4g6DCm7EGhsok2F9pH9oZ
	Y4a+J1QhoLUCar/bOeL5UbeOpMrZnOHQUr9ACd1eLZv48Phn70axe1yhJSD6q7oXwCkt/gSKvY1i+
	b6d7JSOYEBBeJHygxfo/mFcBTCQrKxgb1rZQUTScP7RG3O14PKGdPWYILkpGRptV3ilGau3Fgx9Jr
	F/l82uxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdMP-00000002p0p-05iJ;
	Mon, 10 Mar 2025 13:40:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcQb-00000002ebD-1E1V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D2FBA45B73;
	Mon, 10 Mar 2025 12:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40BC4CEF0;
	Mon, 10 Mar 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741610416;
	bh=H8MkukXKrs1gXyaQdWlj/mYQZibbo5Fhpikh/80QqZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU7eweTUodKoVT9kzSHOX2+bCR2sRfjGewUj0AL42sokgzxf+zbLLoCvkUBRMkYHr
	 YqnVHTLHzG8wBV9cQFVqvTFOfjOWP5vIlPsnRotGJQD5OIbBlvPQDqO7Xsuf/L0heg
	 Frq89NR/lx7PZ39bM3gmfQgOjzXS3ZrX95CjIZn3m+32cf8DBqseFi667hvz6QONN3
	 hVb2aCfOLeMOHgO6/Jb+ffvfv0m/foHouvTQ44LvzUaBYY1TN0f8Fls4iOUWjThlqE
	 BgK6bUDdsTF8X3lA7uovbQc3BT/2WTsUg33dxKagtAxdQOjCUFzc1bjTfJhfdQz230
	 mxjaGxJJgTEkw==
Date: Mon, 10 Mar 2025 07:40:14 -0500
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
Subject: Re: [PATCH v8 05/11] dt-bindings: allwinner: add H616 DE33 bus
 binding
Message-ID: <20250310124014.GA3866055-robh@kernel.org>
References: <20250310092345.31708-1-ryan@testtoast.com>
 <20250310092345.31708-6-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310092345.31708-6-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_054017_402027_52864F6A 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Mar 10, 2025 at 10:09:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33 and increase reg maxItems
> to 3 to accommodate additional register blocks.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - Increase reg maxItems to 3.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf6..317a27cf590b 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,11 +24,14 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

You have to define what each region is and the order.

And there should be constraints such that the existing cases don't 
now allow 2-3 entries.

>  
>    allwinner,sram:
>      description:
> -- 
> 2.48.1
> 

