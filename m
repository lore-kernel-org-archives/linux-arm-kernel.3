Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8881CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcHw8P5EMslNisFsrgaPX3AJmmyXYUwkEC6T9yd5ARw=; b=DdN1Zuyg9/lCu9Hav4hKtpAZ/y
	CrDUfFaNxesVWkncaQTOVFZJQsMYZ44NlQoRxHD/TyWBM9j//ssheRWqMWxMs+JxNLFQQ36oTJAne
	GjkhT1fWzqvTv2334DQ4oooeq/e+U5ThgBHAr0GRGzqURyJkkJe41CjiV22055pw4UeEDw9uYIaJA
	Jwx9julmCigcUAl7Bdmu8jZ7lwobqXynSfdcYZA8VoBDoSZI4K63mHZIkI0/yb91A4E8FTZsHGacQ
	x6fRYg8NVhPwGBzHZ+QIxmZiGLCHQjibUeH6AkGyPyqTxHskOI/Eg9YrVmNm0+ZlcvvRFjreRqAHO
	T8rLhSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlem-000000033Hk-2Chb;
	Mon, 08 Sep 2025 23:52:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfyZ-00000001JBu-20bl;
	Mon, 08 Sep 2025 17:48:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so3610240f8f.0;
        Mon, 08 Sep 2025 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757353702; x=1757958502; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YcHw8P5EMslNisFsrgaPX3AJmmyXYUwkEC6T9yd5ARw=;
        b=C6ffJHj9WKiG4mFbanNo3xzl5tSH6UNSKrWsawUpfDiEQQ46/8ELXmq+cMSQsC1A6q
         zbpNak7jiWQ9JqLaI2H/L4H2M6/rj8kAOS8UOTlM+AxiODMWtiLcrp7gsZftgnlgzcsp
         fkB0rqUibZiKGrkv9thuKjJsxRJbNVypFDoW+gznmepBQ/Xw7/2Vi/IgFw6iDWK9iLc9
         USRVv3PvlAWcCPPwmD5ZicuR0xhbUF1Le3Nuv5LF0kF8VVFoNbdRsIbSsBShYJdX3Wpx
         iDxTYS0o/ZokFMbIl1g0UHcs/YXdYsM/E2jz20jNPIl0AKIqSabplyofgYEdymx2NoTZ
         3bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757353702; x=1757958502;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcHw8P5EMslNisFsrgaPX3AJmmyXYUwkEC6T9yd5ARw=;
        b=vKAwXelOR5NZAFsco/aSTqKxU8Bjv3xMYbNnQvsqcJwS/NxRLAwW1BX747VLhWZnqK
         ysIi0pJCuDU6gTIDHbEiJ5HoPiUryrEqaNeqBMJ7GIxjQnQ6OCsPfOpSftCXw8xp38lj
         7jfrEIqvamH7ZeRddAAfkCOMCg32hNIRhLzQnRqiGiZs8K8VeRoEtc3ZxhYacfFLxlPC
         8x7d55+s2X2vGhy/gmFCH1do5KxkzSpSu7fZfkjIVSLqVpV9MYjNHRzBu6e5ahQi2Dh5
         9BaHx0fOlUUPn8fCxdZ7lSbz3Lf8pCMVxE2gvGjlEPevdHGAR6rqCXS83SPHorof8Sja
         wuww==
X-Forwarded-Encrypted: i=1; AJvYcCUxpIBRYImvBh+xhLYc6+oVAxHSXrW9LUAOs4u9VE6+4XmR5Av1jCq3KN+zgc2G3YU/Hm4F2z99tvyaLaR1cS/c@lists.infradead.org, AJvYcCWf8HxMgAXqEzebftTiI5Dj24tgmGDXZIgCAdSahd6b6ycMvkY1vtReaUAIxM55mLLIYkLOQwLkVzRkzrj/XuM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7NIGL57s2NrSWRpYVyZIB/SlscUOaYGDUnrkZW3gMmAxYbkt2
	Mpyh3OYzX/vFFZKOgjte5p4qHStFCKPd5fRRLQm2jbR+WksgtRRMPlha
X-Gm-Gg: ASbGncsXZLB6NT3BWm75x05k0yQuPoy7Q08SWAtCLE0ppJurwttt4arKa/PjQMwnpFC
	wCygb5duPx3Xnhcs4GKHx08m60LIdJpn5/P9mD6QUTFFNebx1Q2qBW2sFvKRKubgm/bfeSCMM53
	EwX8QTPeEDYWehZTR3mo/YQHkLYFA827vy9lA9l/BxA+jM/TvnC8vY4Va7Ptnn51HBcv+DJJKoe
	DJeiE0FffnHcm9fx1shmtMgC+slsQDugx3kMWRvX0yvRIuCCNVT87sXSP7hwBmJMk6q3IXzwrUR
	SWKvZh/gZ9LpET3htupWf0CZ78cQva5VfyPDbBe03QdICdUMkKoRTA4NWz5qpLAG6XYYs7enBc1
	yG586V7UoJA6U/fUwjR+n4VJkIG5Z5LKpHaBBLp7wZ1BB8aNsKwmr5R2rrU6OLl3lbWVubndUiR
	ItI0XR
X-Google-Smtp-Source: AGHT+IFq6o1EpTze8lAPdy/p+9IIgpxXlJzHOvrLDm8Mz2ZpQF7/Pb8OvU3JVQI7GB8uGSBt0UZ7Lw==
X-Received: by 2002:a05:6000:2084:b0:3e7:45d1:9d91 with SMTP id ffacd0b85a97d-3e745d1a116mr4929204f8f.28.1757353701694;
        Mon, 08 Sep 2025 10:48:21 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e1a31c69e4sm16547400f8f.44.2025.09.08.10.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:48:21 -0700 (PDT)
Message-ID: <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
X-Google-Original-Message-ID: <aL8W4dEEI22W73DF@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 19:48:17 +0200
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_104823_515210_0EE5A800 
X-CRM114-Status: GOOD (  15.75  )
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

On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > With further testing with an attached Aeonsemi it was discovered that
> > the pinctrl MDIO function applied the wrong bitmask. The error was
> > probably caused by the confusing documentation related to these bits.
> > 
> > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > is never actually set but instead it's set force enable to the 2 GPIO
> > (gpio 1-2) for MDC and MDIO pin.
> 
> Is the MDIO bus implemented using the GPIO bitbanging driver?
> 

No it does use the MDIO bus integrated in the MT7530 Switch. It's just
that the MDIO pin can be muxed as GPIO usage.

-- 
	Ansuel

