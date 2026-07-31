Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4040EC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=; b=G5k3YNotQh/k6tokDTQTs6SLTt
	4G4dM7PLSzMDnYkeCw6wr2S0/5Oo3MpT7BpGABL0ndNCaXtLUahwPfO/yvA7eJtijk2XoTZ8dnyW0
	Ql5U39qtabobabysjwYHowxdoKn8xkiXkAXAfIx+ueMoqRFO3RCk7h/0i0/nCyuIkfCF2UtwbJb3N
	zBjBx13uBLb+Zr8ygGXo3oYf9Xkn2hGQc4fd1zAGNTN7kW5CbqUyDwKHa9sICITOqzELOjxdKuWnN
	ET2IIj/0DZPAv+TpjP7XiFcQYGSOmia8ibw2Gw5iNK3dEufw8Eakyw83LAziBrWHfLbRWzOdoozGC
	D9jm69Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wph0C-0000000BuZT-0RPX;
	Fri, 31 Jul 2026 06:45:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wph08-0000000BuYL-2cT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:45:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so78891766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480347; x=1786085147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=MaSirrKnFdgmzgGNqGPpKxnJHZ8Zalc0hbgYOHay2s2gxYATqdhazh8stqmnsTEaes
         SSu0ZMAY4iZHBW/fmd2rqTjmURPWiFklJcWatKUmPXK9iXDX2irL8i2d6jTHL/Jmz5Nn
         KkhgsVO+tJ+59xq2BW3JreoYBafZUEhj1rBb1kpRa+wGPczj12X9ZCjGPsG4kY4HciSL
         NDIEj12XHKnE7ZmGmihXv0xizqHHPViv6ZW9/5veycHUg1Cz13oUQG5o621fl+OqQade
         agNbdIoRxbcGYt5jM6uXJxVTujH5lV9r6FOXhyYlu/6jnsb3B10Ay7NLZsa1RZbTTZj9
         E+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480347; x=1786085147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIbPeVG4258G9HKd8kCy72K/NwqK4KgRygqC+exQgG8=;
        b=BOEKNqb1g0vvLWhP4tVSA+krdyFsz4g+gkSbYP3sIT0ZxyyociMbkxsGBFsO/O8DNa
         /f07YaHec7rYxbQKOHcUR3pks5zer0hDPoA/eCOcnWvxg7aXVcB3xZ8yESM1FE0zHHdr
         InnATArsCcjGFKNGyi8+0PTeZnhQfl6YvS2fTjXksQ/syJwAu0D7EZUhiGGWLqTBu9Oi
         pWTy6kDpnRlN8/QGQK4VYyw1DzTRaa6I3HVH1fDl3HvvtDcFmxhrpXCCVWVq/As8kQpz
         pD4iafRc3ShchgX+uYTtWMmXXsmqvAe5KTIOswZMhiB6bQm5/fTcD3HQNc9X3VqM7nzq
         blww==
X-Forwarded-Encrypted: i=1; AHgh+Rr00BM8k0CY8thJDgp9uekIJe7/A1MB9NkDhCRnLkCKW8+dT6MfUR0RXmN3QGDFIFLK/8xl+VT1wKawFXxwucZ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3xYGPqI6PUxEyBfZYMdqEK1t7UbaGxyPJV6FKyjjUAwCWvbKe
	4PBaLk/AUVasTQfyXRV3qu6suqKQsVen3XzzeNNW3sWhsJosAPnn4A7/
X-Gm-Gg: AR+sD100PO3CzdijwZDfqGdBbjfm725qJ8d40bfo7nCTZbAnIeS7cyqDpyaS3zXaoyu
	F5joZ3S0Kyy38HGlvcCJkmjgHOIzJw2gMOEtlz4oPaJH+KR3bsXAIdsV87OPxyB8TcDU0FrDTtb
	ijVaCmx/LK6adKxziBCHP/eDjwxaroIqOd/tkdBULw8mB4qPlmKHJcLBs0Oo18oy/UOyQxlW8bi
	L95OEUOnVUDpDROCZuM3c9HmpPwCVACf78AOK7I0CDfunnzJu6nkPMn5qjkg909YMWkvZg7bfBs
	2zps7cqu3SrheYLgGcSrrNUC/HJ+WSPJH+8NXSTAs/0Vs7xpKgy2NHJIQ+IsyGgyRna/I9td8TO
	2ZXE4DCU9G7P5VpAR31Qt6I9WEeySs0+vdYZIB9MQvuGX7jRMxqmddjc+ohPYO1ccwdu/cj2TN+
	W85sAehdAzBUEyMsDTFw5kb7iZ1JoZTZEtOTu3/1hWwFzeSP0+VTaiKCbXb1whCjUMzLfSX+rnx
	2yWIuiAnHIhtsUgdTS5wF05luCAXHgb0nmle17zLyQeujx+
X-Received: by 2002:a17:907:ea8c:b0:c1c:3b06:ed1b with SMTP id a640c23a62f3a-c1fd23f9c06mr42429466b.22.1785480346401;
        Thu, 30 Jul 2026 23:45:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b0fasm33332166b.5.2026.07.30.23.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:45 -0700 (PDT)
Message-ID: <6a6c4499.797cc74e.266cba.6533@mx.google.com>
X-Google-Original-Message-ID: <amxElLesKZE9DX3u@Ansuel-XPS.>
Date: Fri, 31 Jul 2026 08:45:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card.
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-2-ansuelsmth@gmail.com>
 <20260531-spicy-sassy-woodlouse-b2674e@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-spicy-sassy-woodlouse-b2674e@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234548_682678_DAC01E6E 
X-CRM114-Status: GOOD (  19.64  )
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

On Sun, May 31, 2026 at 02:39:32PM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 07:48:29PM +0200, Christian Marangi wrote:
> > Add YAML schema for Airoha AN7581 AFE SoC sound card.
> >
> 
> Nit: subject, drop final stop.
> 
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > new file mode 100644
> > index 000000000000..80d9e87f1470
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AFE PCM controller for AN7581
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-afe
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> 
> This looks incomplete - missing at least clocks. Are you sure that AFE
> here is so limited, comparing to other Mediatek designs?
>

Sorry for the late reply, I checked documentation and the SoC doesn't have
a clock for AFE, Airoha reported that it's always enable from reset
condition. The clock driver doesn't expose it.
 
> 

-- 
	Ansuel

