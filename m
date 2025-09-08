Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7DCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srx4MAFwGWE7Nwzpo2SsNjXaK3mzSAkkPEoW4/Hw/ic=; b=m9XA+6Q63Zt3PnT4LgBLP9R9tJ
	GbL7gT9xdpunAIHkQpJaM4B1MHmMhFnVCBZH2GrLEDh8WbH4QbvtAZr01jBa077Md+Y3gMfIl4KIJ
	ssN9PcoGe5ggoLGfW1QJFIPR+X6q6nxWGjsPHgkONnr6k3Lr/6Nv4UjaFC1rZ1joH3qboZO3eHAjJ
	dr48uGHE32LsCIS7WvSYayshYqI6oRl3Ik+noZRUX9llAO8wVXwPozAiPKyTuVw3bo2ziFBSOjtQi
	g/hfrO5e7Hz2ZbQKzUuumNiB68gEEeJFKZKt7by3xiQUICz0qac8i3g55hgQs6MPgA1slD0D8vgVK
	sURbS+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBP-00000004oTi-0752;
	Tue, 09 Sep 2025 06:50:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhKJ-00000001ow9-3VX0;
	Mon, 08 Sep 2025 19:14:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3341470f8f.3;
        Mon, 08 Sep 2025 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757358894; x=1757963694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=srx4MAFwGWE7Nwzpo2SsNjXaK3mzSAkkPEoW4/Hw/ic=;
        b=e/ISC6lQMXEWCLcg0dcM/VNCBNXsIWqJlxypTJs9qL55ySqJoFZzMSvroE/U7G/bjE
         kDB2Ouj8PjOrsUUswY0vDUgZIj77fxLdpc4S4cK76tgTWnAXPt62zHrTRhuNlQJkLAXD
         YkCcbfLBMvtFbwU0aYkC3N6sufzSYRArjpsMPHDq5eYnuOZtzBVk1diSF5JsYfP3D8zZ
         SRs2xfwZplOwIUK0tSQMSJoLsGNxEdACFl8AriHZksXholXsIxDlFyr6dHyJhHeRqv5w
         c5Gq7asA4YsahseOdtdEdEPOQN9WMXMwL04F+ijEuZvFlVvMOzj7Z8OwSUqQ9+gppgrq
         JC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757358894; x=1757963694;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srx4MAFwGWE7Nwzpo2SsNjXaK3mzSAkkPEoW4/Hw/ic=;
        b=lE8fpYD5FYRPGBCc6iwV1XtqVrcjY3Vw2Ymzeqs1tmEPhHY1IuL/mMQS79CHpABs3y
         k0zMZPTud2sIn4/UmpF0HAGUEVXyoRiD5QqruYBVkvtgH1qSK576+poYccLTmhgi94b6
         ePkkFbU7JT1msyj7z5WdZAen7Dzi8LtH/fHaF4KThMZbL1mUV8KI1DjER4RN+sC07emI
         lgSRujZC8pWFk6RI02LLdf9Zr+FcSECFmcloZATU8XvYy87zj77wDXtObz5+5jQOk+Gn
         6DwMmsrQ2idtMn581ySNjAj3uPuQ510yNoL+Uo3Adk77GU1l4c+zUcfMJMSD75Neb08o
         uq2g==
X-Forwarded-Encrypted: i=1; AJvYcCVsMBkmbFGaJgA6m4dej+2xzDHMMeDuww0wya/kr+IdnFSiE+z5T4gJH1RCpZk02s7qe/pcYl/GqiLkWVZMLNw=@lists.infradead.org, AJvYcCWwgOI0uVcP4KVlBsmtMPVo2hZCOcxr7L1kAAncR1rMgeQA5ZY4jmExckP9V5nSfUa4o0kMoGQO5Rx/NXxzmxkH@lists.infradead.org
X-Gm-Message-State: AOJu0YyxeM6/iCw5DpPRPyS1MV8XvEp73E1JuwRZWZUwiR24tXU2Kfc9
	MPyY9a0DfBShVPLZFPgG7uKKYirbxhdgjSloYwoJDzeqTF80/FU9yO5RMOhhnQ==
X-Gm-Gg: ASbGncuNA2bsJEaTWlQTwTKiVyWZvVS28xpfeA/AZYoVB1rwM7Bkw8oNUEpVvmKqfnw
	c0gfh2MW7afv2vAwJLgMT+KwT937hJMJJPuPktAtk6nlnptchNPZwDX+kBwAm0kUuPluYtm8pLx
	vPgdp1QSqRpyOfNoCAsSQMtMEd+WyjccmC66fYpPMBbHMB5fS/nk22wAqk8PmAEgFjidjCeK+8k
	89NCxyty7Y49KOb3GpwyJkdkVfU1seTGsxrmsLC2WYkynYpNYXZWgFDUmReb4z51y1lH+E5j9ib
	WCSjJeA7Nma+rjMjM9VBk8P8Yizju3MZUT1scXn7DwAt46+279pBbKgz3Ci5uYoKFaw12ToVci+
	mBtMtRbwGosVy6KtTqOlsdLtd75rpCcZjlCDqEVGnVouqCwv4LntFg3OyenAHq+RjTv9Z5KlO49
	a2AitO
X-Google-Smtp-Source: AGHT+IFziGLQzNAImKhYRQ8IDTrD1/2WSj934yaWV0EXCVxUAxpFR9rChLUkdsHXYck7WZfp1SktZA==
X-Received: by 2002:a05:6000:2389:b0:3c9:f4a3:f145 with SMTP id ffacd0b85a97d-3e64355556bmr7434762f8f.27.1757358893920;
        Mon, 08 Sep 2025 12:14:53 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm202559135e9.7.2025.09.08.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:14:53 -0700 (PDT)
Message-ID: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
X-Google-Original-Message-ID: <aL8rKX72YDo7iU_V@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 21:14:49 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
 <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_121455_872399_8F047BFC 
X-CRM114-Status: GOOD (  22.15  )
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

On Mon, Sep 08, 2025 at 09:06:03PM +0200, Andrew Lunn wrote:
> On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> > On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > > With further testing with an attached Aeonsemi it was discovered that
> > > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > > probably caused by the confusing documentation related to these bits.
> > > > 
> > > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > > is never actually set but instead it's set force enable to the 2 GPIO
> > > > (gpio 1-2) for MDC and MDIO pin.
> > > 
> > > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > > 
> > 
> > No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> > that the MDIO pin can be muxed as GPIO usage.
> 
> Then i do not understand this patch. Why configure the pinmux for GPIO
> when you want it connected to the MDIO bus device?
>

The usage of GPIO might be confusing but this is just to instruct the
SoC to not mess with those 2 PIN and as Benjamin reported it's also an
Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
(that is configured by a different register) but it's really to actually
""enable"" those lines.

Normally the SoC should autodetect this by HW but it seems AN7581 have
problem with this and require this workaround to force enable the 2 pin.

-- 
	Ansuel

