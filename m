Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E729FD69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=; b=Y2h8nEBj8suonT4lQPgev5V2kj
	mibgcbbMPaLHbOHGiWXURyI0QhmyZm3fzz5FR3wfNNbiL80w4CiiLPpvay0Bf94hjxPOTmrJCcp9s
	JJw8XhfqObyhgnW0vRSGWjYaoFgCSh4rfT6MAYNr3adDsRCNfv+IQBvF2NABzbLtXPhrEFjFMFYkV
	4ydOmxE2G7VZ3oQ8+VTELJaFhNCPsMEQHImwGW9ef06dlGt0RDTFhr43z08KYeM7euqnvjPjpfymd
	FUWUKJh74y+VKlem0aYH0nQpK0XHciTAVfhw6Sp1yccJ0LltIqCz3+KfmmFkxQn+cgvQ08z2mmLO6
	88vCmVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfXF-0000000Flm5-3xyI;
	Thu, 28 Nov 2024 14:30:25 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfWG-0000000FlZl-0PAL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:29:25 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso7522111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 06:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732804162; x=1733408962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
        b=LKXViKcgdRe2N8boyA9Hi9VLQOe95tf7GATSgNPm6N8//lHIF+OGPsMeRIdmxzxgVS
         DD8cCm+yP6Oqn5N9kmtQ1tQucR0NQKACWTnmfC2+gfwfON++qpzleCEktW7qvKoJQ2tU
         fNKcGXO1f0RHcGpel79dusTtbc3jNh/2QS68r55O4xLRleu4g45MIAeR6aJpb2XBgbcJ
         bb7DNC6+Ko8qUyoLJdV6eAyRgL5zks5oVqd1x9+CyPMoJZmd8WG38Qg5RaN15zJ7tTOJ
         CkiOqXjTq7fV6PxCFpivTTKmgwTgXtEQ2HgLu5GAo6D9a1Zk/CxVipUzVYbCTqrWyfPu
         Q0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732804162; x=1733408962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVTU1Tn1ipuhM+cKq2hwkSW2xDfrygz6twBX9l1uqsw=;
        b=g135V3D2ybg5VENG3BmbOIBSGq9VoWSsgX5nRwnj21toUL6kfbFM3ZhQFWn2QYbIX9
         52hT6qiox+h/S8F7m0uCM1MTi3PRFwSW+xJVLdqfAK6jJRlDyQUC5/HY3aB1rGpg44CX
         bok0+aFtGgG2ZTyyjDGHe377B4yauUKWYtTqO9sSN/q2wF7QJu9ihJt+rf2oOysLNeiR
         s8xhlTWbhgdrDnYRh2fA5XcZuGncosFt3ZD/Eew2VtdJIM9ubY55L1rKEeYagm4hRdE1
         dqpI42XR30XckNJqxWFhddDo/0A+xqvss+hbGaMevLYVW5NMfDFVECF06petSK553n7/
         Bjcg==
X-Forwarded-Encrypted: i=1; AJvYcCWdwpE3vUY4ERyQWe5YRJxO4Md2i8qXbT3uPJgBcxd108driRlhmXOnbI3UmdhGJBghftXKnQ9k2NU6gZX9/5g8@lists.infradead.org
X-Gm-Message-State: AOJu0YwSSbxVQBfpeztkES1gApNL6d02ZM+DhxqwYjXBKNJzKMlCakyw
	RdDDqInfwh5BZyxaQ0GoLA3iQjWxJxRGD6wEloRxlTTaE+gmmBYqKGQ/v9z2O18=
X-Gm-Gg: ASbGncvCp2h1l+s2R69Eg6WfsyPx9s24DyV6kmD/zq3awF588TbucsU/VhLfV3j4/gW
	UZjNC/vJnXqUNweU32ixdYuAsoBTqt2gNQgaQNUGYik7SuRCAi6r512fnfI9xwpVuAwkasDCfxO
	h/7IfnL6jgY/1FP8wh1dED503GMvqxdnVM3VgDksgqjvQ1hm9mXV4MPFUe/8S+iGwKFy7nNRWiS
	xgJc1/7JAIRAdMKdZFZ5Q/V1F7uDvujr4YJb2x6Dkkqksw+l4I2qeM/W8PHflzTZiItjoayXmNW
	m0xqIV+mDZGZkrFiKi/YInO/Mp1pWA==
X-Google-Smtp-Source: AGHT+IHyweCAzP9pLJO4NLISzRUT/iPlUo6AXMrkwOg8DkwU8W+NduHNwNsOOPQzb40Ox1rkWfW9sg==
X-Received: by 2002:a05:651c:1607:b0:2ff:d49f:dd4a with SMTP id 38308e7fff4ca-2ffd60293b7mr29667881fa.21.1732804162195;
        Thu, 28 Nov 2024 06:29:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbeb8f0sm2073581fa.35.2024.11.28.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:29:20 -0800 (PST)
Date: Thu, 28 Nov 2024 16:29:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, marex@denx.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <3jojqg2auvktifilp5qt7tcppsfagk3zrlrmjxlnwxnehd6fwg@y7nxhhtp5t6y>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
 <20241127151630.GA3515396-robh@kernel.org>
 <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
 <20241128-mottled-nostalgic-oriole-be31ce@houat>
 <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f9bee2-74bd-4150-abab-fbc1459d7e36@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_062924_146711_869E3CB6 
X-CRM114-Status: GOOD (  30.61  )
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

On Thu, Nov 28, 2024 at 11:57:16AM +0100, Andrej Picej wrote:
> Hi Maxime,
> 
> On 28. 11. 24 11:29, Maxime Ripard wrote:
> > On Thu, Nov 28, 2024 at 09:46:33AM +0100, Andrej Picej wrote:
> > > On 27. 11. 24 16:16, Rob Herring wrote:
> > > > On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> > > > > From: Janine Hagemann <j.hagemann@phytec.de>
> > > > > 
> > > > > Add an optional property to change LVDS output voltage. This depends on
> > > > > the connected display specifications. With this property we directly set
> > > > > the LVDS_VCOM (0x19) register.
> > > > > Better register property mapping would be quite tricky. Please check
> > > > > bridge's datasheet for details on how register values set the LVDS
> > > > > data lines and LVDS clock output voltage.
> > > > > 
> > > > > Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> > > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > > ---
> > > > >    .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
> > > > >    1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > index 48a97bb3e2e0..5b2c0c281824 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > @@ -58,6 +58,12 @@ properties:
> > > > >                      - const: 2
> > > > >                      - const: 3
> > > > >                      - const: 4
> > > > > +              ti,lvds-vcom:
> > > > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +                description: LVDS output voltage configuration. This defines
> > > > > +                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
> > > > > +                  details on how register values set the LVDS data lines and
> > > > > +                  LVDS clock output voltage.
> > > > 
> > > > Constraints? 0 - 2^32 are all valid values?
> > > 
> > > Not really, only first 6 bits, which also means that this can be uint8 then.
> > > Will fix with other issues.
> > 
> > Also, generally speaking directly using register values is really
> > frowned upon, even more so when they match a value expressed in a
> > standard unit.
> 
> Yes, I am aware that this is not how devide-tree/device drivers should work.
> But setting this values based on wanted LVDS voltage will be quite tricky.
> Matching a value expressed in mV would be quite hard, take a look in the
> bridge datasheet [1], Chapter 6.5 Electrical Characteristics (|VOD|).
> Basically both:
> - LVDS data line output and
> - LVDS clock voltage
> is determined by the CSR 0x19.3:2. So when checking which Reg setting CSR
> 0x19 should be set to both conditions should meet specifications of the
> connected display. Output voltage for the same CSR 0x19 setting differs
> between LVDS data lines and LVDS clock.
> 
> Anyway, I'll prepare a v2 which only sets a part of this register, a
> bitfield (2 bits) that is responsible for LVDS differential output voltage.

Please use mV to specify the value in device tree. Yes, it's not easy.
Yes, it is still recommended for multiple reasons.

> 
> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F
> 
> Best regards,
> Andrej
> 
> > 
> > Maxime

-- 
With best wishes
Dmitry

