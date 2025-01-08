Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5phQoGXUXWNzfm5vQetw+BXe3YP1Q8hlRL5Lp1GLVaw=; b=2Um5WRVGjBrwhzZ+tkN5Gek6da
	LZvXq6TdWcp8CEN/WY2XKTZLNITgvRmNsw+CMxdTmIWEoP4xaVJwgX3dl852VRrC4eY9TEmKYqHVE
	9CaQWD14YueAHzzOC+V8zXCr1RlUOiO1UVdQ9Cuw7dFb+Vprkmiv44XUbTpDwNebPVB4OtxDJG7Vs
	DZe+9dXRqZyoC8Yk07gGu6zc2LoPr17We5wlLhN0NwLisQDLuTedCdiGjSe6NDQ27q/XotyKG2iun
	UKwlWhkMdRStQLr7P3tCgLu5/EFcw1IIqY5gPokTHoARB5BX8M3VjEEDCMFddhULWXZVAgX+HTc70
	hTc2U3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfoW-0000000ABua-3PHB;
	Wed, 08 Jan 2025 23:50:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfn7-0000000ABnP-3LPz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 23:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A173A41DB5;
	Wed,  8 Jan 2025 23:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ECDC4CED3;
	Wed,  8 Jan 2025 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736380088;
	bh=ESRJ1GfGU3MEBCTm3oBsNj+1YXHsyQuA8Y9s6R22loo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugheSgSbDS6hkRB7HGXL3laCrlZxbxaHkELksEr8U6G2shFSLX5jXoxpp/lQF/XDX
	 fKZX05yJSKLKNDhgHUtDtEP05NbPvlI/9+cbhQI0l+PE/FDN7lJWGDz42j7gq/udmf
	 kBoUCzqLu5Ywl23r5nW3c5wvpZCZ7UGWhxnLIymHPGVlIwYuQjQQENYEVdo4pmEjca
	 pdcq4X3bRJvuNuUP32F7QuOq3p2BzT2bbkbQeVFTb3XmLhHRoYNLt1xPBrqBCQeY3p
	 UdWIQBAaN10nJVjRsMrCJzH5izPzpeCcG5dukXzA0PjpmXt03ga4GHH0fS6SQs+Z9O
	 SXqyTL9IkqaXA==
Date: Wed, 8 Jan 2025 17:48:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
Message-ID: <20250108234807.GA1247672-robh@kernel.org>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_154849_967431_2C957D95 
X-CRM114-Status: GOOD (  17.27  )
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

On Sun, Jan 05, 2025 at 07:14:16PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> index ae9e5b26d876..c345d3ff3fc4 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> @@ -77,6 +77,26 @@ properties:
>        Phandle to system configuration controller. It can be used to control the
>        power domain circuitry.
>  
> +  st,ssc-modfreq-hz:
> +    description:
> +      The modulation frequency for main PLL (in Hz)

No constraints?

> +
> +  st,ssc-moddepth-permyriad:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
> +    minimum: 25
> +    maximum: 200
> +
> +  st,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for main PLL.
> +    items:
> +      enum:
> +        - center-spread
> +        - down-spread

What's the default? If there's only 2 possibilities, then you can use a 
boolean instead. Though I assume you want to support spread-spectrum 
disabled.

Are there dependencies between these properties? 

> +
>  required:
>    - compatible
>    - reg
> @@ -97,6 +117,10 @@ allOf:
>            const: 1
>            description: |
>              The clock index for the specified type.
> +        st,ssc-modfreq-hz: false
> +        st,ssc-moddepth-permyriad: false
> +        st,ssc-modmethod: false
> +
>      else:
>        properties:
>          '#clock-cells':
> @@ -118,6 +142,9 @@ examples:
>          reg = <0x40023800 0x400>;
>          clocks = <&clk_hse>, <&clk_i2s_ckin>;
>          st,syscfg = <&pwrcfg>;
> +        st,ssc-modfreq-hz = <10000>;
> +        st,ssc-moddepth-permyriad = <200>;
> +        st,ssc-modmethod = "center-spread";
>      };
>  
>    - |
> -- 
> 2.43.0
> 

