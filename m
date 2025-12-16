Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7326D5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc+M3qj6l9c1qd+Gf2wEg1e0pGluVkxlO0+eMlH9HN8=; b=lrj4oRi8ihcLFE8Lt35YYvTZVt
	cGv4GqqxeA+jxQSnJ31e5ccjEwC+AL4dSPpYz6j3nq7fRHOVXJwhT32xH/zUmzvlgdM6JTGWeGbSR
	Snlx6nqk+yUynfABifu5vrOAnSTsJZ5PUFpGtmjTm1nKQtRzKDSmjEkwRu5+Xc+5pIGFOwPS/YcmW
	4M/hPDAFT2DukRXedzfjK8gblfsd1otuY0MWUrUxnNFaHz5dKuS8ztY38ZYU8aDH785Sxaqtqq/Yu
	XkLvAMPCcxb6rLCMxcUpH5aAF9i8HqZ1FNaGIVwy7VFLyWk7hyQSK108xWgH5CQ800bq6mvJqNIz9
	sOUd8iuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO8B-00000004jsF-1mNm;
	Tue, 16 Dec 2025 06:01:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO88-00000004jro-3JSI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5B324391D;
	Tue, 16 Dec 2025 06:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D71C4CEF1;
	Tue, 16 Dec 2025 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864911;
	bh=I95cDlcRjf1+/2faDF4bEDUMeInHLZs8Kq3NLwEe++A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YITzAch0mk5AlPQuPIPKdKc372t6AdmNCQ7JhwR1AzVoruoh4VvWmrgNNYMPwHYvN
	 B8trJ37+YZNC09WuHa3aK2dIOKZsu5m+MAAjxw3vXrtosM5PXcbh77W+Y+/KOnrSHS
	 YUyN9FnLNYC8z9HvFVqPxYQ0Spb9LIBXU7yF0XcYMiqymkGxAnqzYMP/bD3G+dmapt
	 chzyxvZbFb6tGPRA2DdfFm/CwBdVWqyJdO77Z4bCWIjAheZBaF6QnUuMY8KMiNg7Bg
	 yEz2QtlrBlyeMLzapXkH6xKysyJLiy1KjWfzJvx64DaX4PAqNiZ/QmEZiuyLNvFngk
	 d1ZXWB+U8k7fw==
Date: Tue, 16 Dec 2025 07:01:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20251216-capable-eccentric-nightingale-b09037@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_220152_869177_82C6333B 
X-CRM114-Status: GOOD (  19.41  )
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

On Thu, Dec 11, 2025 at 05:38:45PM +0100, Kory Maincent (TI.com) wrote:
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
> new file mode 100644
> index 0000000000000..34ac1fd04d5c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml

Filename based on compatible, so for example ti,am33xx-tilcdc.yaml or
worse case ti,tilcdc.yaml (see writing bindings and writing schema docs)


> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
> +
> +maintainers:
> +  - Kory Maincent <kory.maincent@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am33xx-tilcdc
> +      - ti,da850-tilcdc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Name of the hwmod associated to the LCDC
> +
> +  max-bandwidth:

constraints? Is '1' valid? Is INT_MAX valid as well?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum pixels per second that the memory interface / lcd
> +      controller combination can sustain
> +
> +  max-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32

constraints?

> +    description:
> +      The maximum horizontal pixel width supported by the lcd controller.
> +
> +  max-pixelclock:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum pixel clock that can be supported by the lcd controller
> +      in KHz.
> +
> +  blue-and-red-wiring:
> +    enum: [straight, crossed]
> +    description:
> +      This property deals with the LCDC revision 2 (found on AM335x)
> +      color errata [1].
> +       - "straight" indicates normal wiring that supports RGB565,
> +         BGR888, and XBGR8888 color formats.
> +       - "crossed" indicates wiring that has blue and red wires
> +         crossed. This setup supports BGR565, RGB888 and XRGB8888
> +         formats.
> +       - If the property is not present or its value is not recognized
> +         the legacy mode is assumed. This configuration supports RGB565,
> +         RGB888 and XRGB8888 formats. However, depending on wiring, the red
> +         and blue colors are swapped in either 16 or 24-bit color modes.
> +
> +       [1] There is an errata about AM335x color wiring. For 16-bit color
> +       mode the wires work as they should (LCD_DATA[0:4] is for Blue[3:7]),
> +       but for 24 bit color modes the wiring of blue and red components is
> +       crossed and LCD_DATA[0:4] is for Red[3:7] and LCD_DATA[11:15] is
> +       for Blue[3-7]. For more details see section 3.1.1 in AM335x
> +       Silicon Errata
> +       https://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tilcdc: tilcdc@4830e000 {

Drop unused label. Generic node name, e.g. "display-controller" or
"lcd-controller".


Best regards,
Krzysztof


