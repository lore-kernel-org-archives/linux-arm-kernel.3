Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE60606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KyWKr8cr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dwX70xLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=; b=KyWKr8crGoo9ciZ84jRXxijdFc
	plgphKcMEsUDEUv1ede7zJBeF6hF9AhTI4WQgAofa64+2fXj33Vq0BIM6cdZbeCwYG75PsgwRMCiJ
	EoxxUC7g54nnZeMRdJSGU3YgymbmaLct/DKBlvLxGykOxxZZtJpXJ0tqdk4NHD1csnpoWYi0vqTUb
	KdFcr1qboV6u8Zw3QEQKkmjhKyCYono7Mwv9o4YSKHW5rTKOveWdnqhBqbSMN/9OsSJgQgBzd+Tl+
	CRXbXJ7QG4mtOICB5+32NAwnh9XesyPKqfSL4UVFooG7QQFAYv3rAU1lpZ4uAoyrejFH2jhMySwHY
	OZ7gtXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJle-00000002VJn-43iW;
	Mon, 26 Oct 2026 12:25:34 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJlc-00000002VJH-1Muv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:25:33 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-98febe968deso2233808241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017531; x=1793622331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=dwX70xLLLwc/QaGfPpaqQWTXVc4GfdHvCVqIcJXpLu/oHNC4d65VX+viHvu8Cn2F7B
         VFw16ZQwBOEyiSqHLPXqaHz8JJ6Pc4rBfjq7TV/tdQWXuxBhZbgi0cGGilvtTUOSYxs3
         ZX+1tOrOOKzIGXhhPT0Aq9Wh4o+eIvIt4hPpadYWVxyJnGWltPihny51SDK0hamFOrzE
         Kac/jE9GhSuDglru93vzB+zxdRfQsEeyW3T7m3P0bZr9HQisLww3MYIh8CZD2Ol/2i+2
         JDOBl8NWygOuFJpJfsOZ6BkKF/3gQgihG5K9ESdcvGuAUWGyX26fY3aY+skLngn7SUlF
         q1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017531; x=1793622331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=Ean29fCg5ytgybGwoaOE5r9g7LDftFEBqppmXu4zdIaNnQP+jf8FSemkuJYW6C3p7w
         uMABpF2fPdTSUBcT/nntwzQW5SF1qtrQvcDnhY7Sex6Vqs1tJcjocf6+tiiW8kdl++lu
         qpJSPAldK0CeXk1R9WGlGEbZA5HPZnq32XI6tyzxot5iQIG3QcrswTMZf/RHXUdk5Wjb
         kKo56W/SCn3H2zIF1f98PRvoTtYccW/14tC8ke+ywvyuO1g4fpQ+aMddJXemvlkuwhUy
         rqceHNVyi0oX5H2iVFehygMQtghscKAKF/58hi580nBuvfxLzSQDl6D9P1ZnF8b7JM8b
         fqGA==
X-Forwarded-Encrypted: i=1; AKwUvByQaOwjDzhCAp1aH96HG+iCo53xoMJA5YToDrF2O8lspiePBm7f1WEV6UiMo3axCZjKCCbT043pHNbyXXZkNUL3@lists.infradead.org
X-Gm-Message-State: AFq9FYJFPkmLaiMzDrKdIzyJi86hKACR/FMxlwwb25bx/s63mHZrk1BT
	gdIiRDE/QEYNOAapWJWITQyBXq5FLW9DKNkFWrFn/SYrsMdVZnM5KumU
X-Gm-Gg: AYBFou3707zcfUGBXYabQCxOM0Zy/AE7HypV0cmNusKuBlY4LJa3HlDzWvd79d6fhx6
	LLtm6RVa0fgcKXoCMldhq2/+1gfhqFgK3mBqLSqmQNfhsHIfuzRCcCXy2LOSxc0VEeUz5BCKrXW
	zycbgdzpJwhFLQjjHTvViGF48xZSXJ+F4uX6nu/K0p6u68p9dlI+OI57tEfcTETXQWW/GhpcpPd
	BiOOxcar6lmsot9kxI92zksVlHQLOWL2HxoFjCyAmJpQs0haeOn2CkfRSb5bBmpofa70lC71rYx
	QJdytoBpCR8l1rqYeoRyYRRpPYd+cRZfEwTQVRQs/jyUhySTRd5JBSKN6c3U5Ua4klZ0ZtNIt4N
	qhD2llFJlf/Dw1pIlVAQ6Yq1aACSmpcexKBbBr49p4Ezj02orUjTpkrNt5x1aHqyfch/RynaIfO
	zYxuBesl+wTN8wrJjUcXu2z2klY5W1mnvYGyVvasTkhTD7rUPQbH/UxDSJEYeKpD4UMydpgQR9M
	BOAIB8Mj00nyuYrsiKlddkNqeCFnGe8tKcfaLLkTWky8DFp9Txhy24p4yAx8g==
X-Received: by 2002:a05:6102:604e:b0:7cc:1b19:9258 with SMTP id ada2fe7eead31-7ce5ca1e48fmr1995133137.3.1793017530653;
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm8121766241.3.2026.10.26.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:25:20 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
 <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
 <ateQWqoTtXSBSBvm@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateQWqoTtXSBSBvm@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_052532_394821_1A2F5D77 
X-CRM114-Status: GOOD (  27.17  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Tue, Oct 20, 2026 at 11:01:30AM -0500, Frank Li wrote:
> On Tue, Oct 20, 2026 at 07:33:10AM -0300, Leonardo Costa wrote:
> > On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> > > On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay for the VGA output available on the Apalis
> > > > Evaluation Board, which is driven from a parallel RGB interface passing
> > > > through a non-programmable video DAC to a VGA connector, without VESA
> > > > DDC I2C signals.
> > > >
> > > > The non-programmable video DAC consists of a simple resistor ladder that
> > > > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > > > an active-low data-enable signal.
> > > >
> > > > The overlay is also combined with the various Apalis Evaluation Board
> > > > device trees to provide ready-to-use DTBs.
> > > >
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> > > >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> > >
> > > what's difference with
> > >
> > > https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> > >
> > > Is it possible share one dtso also?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > The Apalis iMX6 one needs to set up the connection between the IPU the
> > LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
> > Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
> > the bridge on the Colibri iMX6 doesn't have any control signals, while
> > this one on the Apalis iMX6 has an active-low data-enable signal
> 
> This make sense to use difference dtso to cover it. Is it use name
> imx6q-ipu-di0-vga.dtso, because this dtso have not boards specific part,
> which can reuse for other similar hardware? Or we can rename it when reuse
> happen.

I think the overlay should be kept as imx6q-apalis-eval-vga.dtso. As it
currently is, it's easy to identify the hardware it may be used with. If
another board is added which uses the same interface in this same way,
we can evaluate if it's adequate to change names for reusability.

Best regards,
Leonardo

