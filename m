Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=; b=loDpNWq/CkFAh0Ot7OnOv4RaMy
	HHV0Rtydo1uRlb5U7qUDF0XJSiMKrLe8dXUJ+q+q5QZVSOhmHz5tF7PpxhkhG4Eg6z2mwZrXo0K9r
	6T4osHzOzEaPabZLpNsxw1TzA3VQItmN5+cFsZl7wqzJW8ju+CJpcNRYQFAGozjutN4AQ0VSFu9p3
	8nbN6bPPMo6FC8ZSJ014fq/Qnu4dhkJB4JIXSYy/CSod2rGt7m9TcvG+95bU+dtQLwlzMzUweBZN4
	BVqbGUWDkeLwNZKcVLGWsWfdK3q0XVHhIPyS8GESutD/0ZoiJDDQvQd9EXya9t+amUccMT4HeAI2o
	WPMSHyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPC5-00000008Wuv-0Ch1;
	Sun, 22 Dec 2024 16:52:41 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPAt-00000008Wqf-1dSp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 16:51:28 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ee1be3d496so71902b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734886286; x=1735491086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=ndi27m8kURXTMdfYQNJQlSrM78ycTByd1ettlqWoi5t4WwVSfx3Q5YXXsqWxBCjgGY
         twX8p33uAj/UZ0yzMLPaS9YR0e7LN2r1G15oPnH4Jumr/gUMrvWwPyanTDkkPWBwKm14
         LlaEofIaZ226gkMQ/yitG6Dg5h1upHiLHLvp7Ny45ohIovSQI98zc1fENE1eZLgGXwzc
         4OtUkALHMWslAeNm0tGxaj6Ox9lk7sCfQEMdQ0/HDH8Sia58M7PErirQl9izo1nAHW+Z
         z3CbaJGutwTf+k2NTjpLPXZxZ0L4K0AOqoYVJdrUrujTlI48yh8c5DBgt1Yqb2HeI3NK
         B1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734886286; x=1735491086;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=vc9+nsq4GlHGEAVNa1pdimLW8ck+B5CoANEmqoUpkV7M41TJrKK3uiVtKAPO6qNgL6
         Q1YEhSKNQwekCI/jM6aSHx+I+brfKqDXFoPStQCO5hCt8IGixcL9w7jvwxtosJwavT99
         nkdjCcw8FNJ3MrOkUSlC6/ODyVrXktE8rD0jm/zwS++mQZsMdqbjsDmW+DRLrcm2XCiU
         kJ9b58PG/t+Zjfp36tBM8DsREavn58sgiG2v9LE8I0vegLrtOv70JFoaQ+O/Dynpzbxb
         jlXGsCbMCT1UuP49s853OgreBTHZBBshMQudCSTFvxLr+j1dSoPdXPtI7hR73hlQ73U7
         lVFw==
X-Forwarded-Encrypted: i=1; AJvYcCUEW03AM61j8ruHnJPpCO610WrynlbPWCEdXU+fxgH3H4kWGegqy9Us7r6rEz+Lkmz0A16wgvQDA58uiEVTP1wD@lists.infradead.org
X-Gm-Message-State: AOJu0YwASynyjp6FHEVDxCkJDRYa8AFo1BxhhHjJgjoPMr9B6oFmUETM
	knuvnE1LEBzTFnD3wsQYOhcbweEKU9gpd97cg5oGJugVVp+wEywt
X-Gm-Gg: ASbGncttx4LEUVIUsIU64/m59s6xQyEdWg0uTIeJTQlq3N1ytmEt8GlQbInyhOUgirj
	+h+2Fn+vepp8K/ohfidSxzyebwhxqc+BqIi6Q1XpKVAK9nTSVyE31ri4BeggSIuCpI+70+lgW23
	u72HkLOFL2UgphPfs9cIchTeQqR3IOoAG32ioaJvUH/CIvYzaBSG5Euzh9+GW1bjsqQFD+MYeAq
	99I4e34/3DuLX5V5kL+IKkt9W3vc8HLEV+djenB7gQ=
X-Google-Smtp-Source: AGHT+IGOSjWT5nZh7oa9tWjzH86Cpa0paHAdKsw6pkoTi7D+l+JPXI73dPghgcyucCe8yUcH/SZBQg==
X-Received: by 2002:a05:6808:178b:b0:3ea:490f:da54 with SMTP id 5614622812f47-3ecdd77f492mr8640803b6e.19.1734886285936;
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db755632sm1757228eaf.27.2024.12.22.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Message-ID: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
X-Google-Original-Message-ID: <Z2hDjJqf3YH5BEUo@neuromancer.>
Date: Sun, 22 Dec 2024 10:51:24 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221094122.27325-2-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_085127_436293_461A3C53 
X-CRM114-Status: GOOD (  24.12  )
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

On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Devices integrating Allwinner SoCs may use line-out or headphone jacks
> with jack detection circuits attached to a GPIO. Support defining these
> in DTs.
> 
> A number of Anbernic devices featuring the H700 SoC use this mechanism
> to switch between a headphone jack and an internal speaker, so add these
> to the allowed routing items.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index ebc9097f936ad..b4b711e80b65a 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -98,6 +98,10 @@ properties:
>      maxItems: 1
>      description: GPIO to enable the external amplifier
>  
> +  allwinner,hp-det-gpios:
> +    maxItems: 1
> +    description: GPIO for headphone/line-out detection
> +

If possible, I wonder if we can keep this without the vendor prefix?
It looks like for now Nvidia and some Rockchip codecs have the vendor
prefix, but audio-graph bindings and Freescale codec bindings have this
as a non-specific property (and it looks like simple-audio-card does it
either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
upon the circumstances).

Also, the behavior of this is very specific to just the Headphone sink,
so we should drop the line-out text from the description. If someone
sets the routing as `"Headphone", "LINEOUT"` the state of the GPIO will
affect the audio path, but `"Line Out", "LINEOUT"` will not be impacted
by the state of the GPIO.

Thank you,
Chris

>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -247,8 +251,10 @@ allOf:
>          allwinner,audio-routing:
>            items:
>              enum:
> +              - Headphone
>                - LINEOUT
>                - Line Out
> +              - Speaker
>  
>          dmas:
>            items:
> -- 
> 2.47.1
> 
> 

