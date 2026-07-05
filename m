Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF007C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 21:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1UXtT8BmOoe/s7y9k9MbPlbWZSkBpQj1qefN9muTjc=; b=2A+/l3Tmq47nm+F5gnHsNrJGQP
	iVmmZU+apwLjyH4Fm9jLPdszz08M2DmxJhuSbroMgMAaqbFMgW7TZm5o12yCnGTLXYAVpGwhZwfOU
	yPvDgaBHrDCbbS0ftw3nmRQFSxejSKa/He+jiU4Qv5MoTEwdPHf9mbyPqTSfZvyLT8S5tBsNMcIbN
	vb+P+lAdpvRuceeXkEZpYQyvEfvaQl4QYj7hVzQ2rrG+vVrILRL0WaiunZ48EEgz/JnUAj76upOO4
	xgemVvRRuVf8pAcf+7R6prWmfko5itjHuhBWU+U7ovPOK7wO99l160aPpetr1edlXP/wHh7BJdHil
	NQgadw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUXu-0000000A4nq-2luX;
	Sun, 05 Jul 2026 21:38:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgUXq-0000000A4lY-3oUX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 21:38:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 629834E40C02;
	Sun,  5 Jul 2026 21:38:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35EB0601A2;
	Sun,  5 Jul 2026 21:38:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 568AF11BB95F0;
	Sun,  5 Jul 2026 23:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783287510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Y1UXtT8BmOoe/s7y9k9MbPlbWZSkBpQj1qefN9muTjc=;
	b=f1C3e1rNwou+Okt6VZ8A38DgopxU0B2JHBR8wohTm2+ApRM9tmAnvP+BNoCh8yQeySo1Nj
	E6fCAYJ7JhR2CYLH/IyvaGs/RzFCzaSfyDYkkMhKjy/w3VyAuVQ+ylvTL1Z3nKmTP+TzF4
	qGA4X61SG1NCHMBbRQs80q/WKHO8l6RheElkrckh2+SvlFJCOQv1O0T9JrxXgjNDQ7G/Dd
	kAqulb+mG90oXfQdlJazkq6pSjj+iElLLCqg1nCcItjF0CsBhUAU6lTBFLQYrCWjrKV/XM
	S4L/rWssIMrEblxnfGpiwc36B20dxvOs1MSDC0vtxv/RY9b+r2C7M1jYdODFuw==
Date: Sun, 5 Jul 2026 23:38:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Message-ID: <202607052138277aa6b793@mail.local>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_143836_329632_49F0B0CB 
X-CRM114-Status: GOOD (  14.61  )
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

On 02/07/2026 10:10:01+0200, Jerome Brunet wrote:
> Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> peripheral oscillator clock gates of this SoC.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
>  include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 959a012c626f..f2b91186ed37 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -33,6 +33,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-rtc
>                - allwinner,sun55i-a523-rtc
> +              - allwinner,sun60i-a733-rtc
>            - const: allwinner,sun50i-r329-rtc
>  
>    reg:
> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
> index 3bd3aa3d57ce..5132a393ca4b 100644
> --- a/include/dt-bindings/clock/sun6i-rtc.h
> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> @@ -6,5 +6,9 @@
>  #define CLK_OSC32K		0
>  #define CLK_OSC32K_FANOUT	1
>  #define CLK_IOSC		2
> +#define CLK_HOSC_UFS		8
> +#define CLK_HOSC_HDMI		9
> +#define CLK_HOSC_SERDES0	10
> +#define CLK_HOSC_SERDES1	11
>  
>  #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */
> 
> -- 
> 2.47.3
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

