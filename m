Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD39C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHxN1cJYA/N06QjEqFReiwPXLdQZSTCuNsi3b9gHzjE=; b=Df1U5xvXMSJQVuGqmI3x1msqZR
	/h+WxnJSJxmTjWirVSbVj5ExEEW3jAVo3IIF/aDzg+eo4zJ+5lHMrIfru4YH7KXT835XzW36/fATz
	Gj+/e5FKHOhJzpFphQpmdlBN1TS2EjRuM7hHY9PeteOt5D+ggxYJSiaXVdDVvoLos+7cJ/4GeL1Ss
	EmyLULYOiBeH8XAcsL3dZd1nsqZ0GZm/BISUpvxkbwPW5EOE7V9gKUa1m+Yw27AQMInJ3qBq3iu/c
	VyVos5V+IyD6oeHV0oKEVSd8jCZDE5BgC8Xlvm3u6ch3RX/bJA0f7fPYZPt0fOJsZQ13xdJI1KwNF
	EbZeH8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL18-000000096ha-2MJx;
	Fri, 07 Feb 2025 09:51:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKzj-000000096VJ-3luA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:49:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso3318346a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738921794; x=1739526594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHxN1cJYA/N06QjEqFReiwPXLdQZSTCuNsi3b9gHzjE=;
        b=RmaYxePq+aKCcyzZK1mRFIHMbViznpZMsJQy1PrBT7c+aRFdCWVXRM7Nh3srtabcY+
         gHj78njrEyRaDno2qcNKZXbdZtYKbuTWFAjXreW2VTgl5oGH1foeJ3rNDu6pKjE3ijTA
         rpyMhBZsuNnDKmLIUy10+qSxr+cxN4k34WA1M3lwept++EUz8+3STBPdNiR65iQxpIyv
         9X3+hnBIr/Ga7+JPZH++nzNegRJeAl/hXQFIb79v50B6YiYVhRKj2g9oaGAqU1CzK5/r
         hbLNjAK3/D5Qwx80kW1uT2p40cx9D5fPTYWcbdwROEdPQT2w34+WeuJ1rdX5pSpz7rSj
         q74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921794; x=1739526594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHxN1cJYA/N06QjEqFReiwPXLdQZSTCuNsi3b9gHzjE=;
        b=k+PmRAfx744CZkv3V4yikgsFpFtr2WBZ4SAa9U+5HSu9X8A7wqebIcNuQ0XZwFGVWf
         Cy+ly3l3hTS3xM88Mi/f5KzZheV+aU2ziBbTwoigzXuW6XiDBK5MNKdmd9QVFwzmw1Ys
         cZe3m9i7zh6qk9xR3t6gl44Qzw5Bgj15jPX2tWQLT5ZCIx+Z6ZN9Z8mYGDFzHD0bE2Da
         CeSyFFer6LCxOj19ePWprFCngOzzISgm45Pl7YRy1GJ8i0UwZoLE7wvYsm1CJG2oFTSE
         phuKLN5XKCloNTekrENhPQfWuQ21rSNElz5Qbf/7bx0J2WJHBmoADm4jdNBGBmRfJw73
         TVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8v7FKZwWM/Ke+3leqJ2zp916Dca0dz7BtqeIB6Nbn2gmdVKjAKm5Zull+8J0gOtOE5vgZchyTX9lPWtdzGx80@lists.infradead.org
X-Gm-Message-State: AOJu0YxfEAqXm7Y+hzgZZZTKCd+qyYo/mVyaYlQ6Fyg8HtJo1rUwdPUh
	fnkLXmwkfqo2V9Hmn7Xm0pMP/uc++DJauR2iVdFtgHzMLSlfT3QzSDi1z+dT64I=
X-Gm-Gg: ASbGncsAZ0tqrIvBml7E+pM3z7tc1sxhUFnAflHh/uZKKV3mjrNze68L7rnSf2WMwgh
	p9hFFoVUizwaE0euwtr07ccYpmkczOVxsl8tB6UPRKTNvCIZZiYaH/vFUlysJgxQBOwteWXkbmC
	POSDtHYuiHODrzd7GRLyQ0/z95OZ9CQQUv4ljLtVfJBjOEmldHaGFI0RZHT56pqEXncIunBBKBA
	faROOc/yjxiSHnEJF+z0aLJEVGCKkWkhiDa8Z05x0BMw14mRqITXl1DWP93sUnzOdCNOrOTZ5Nc
	DSdcIpKtBuWehhe+szlyFTIEK8cxe7qgJabIcc3uP1JFWcXVKGtoLDaxTNY=
X-Google-Smtp-Source: AGHT+IHCzEFvSIhfMGLJjDLN8sAOhYITMeHBywqkNc2QJXqBWAThFj4V/KSvjovgix5IZ8ADaCm//w==
X-Received: by 2002:a17:907:1b27:b0:ab2:f8e9:723c with SMTP id a640c23a62f3a-ab789a9ed0amr257773366b.5.1738921793776;
        Fri, 07 Feb 2025 01:49:53 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fd6ba1sm235401366b.79.2025.02.07.01.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:49:53 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 7 Feb 2025 10:50:52 +0100
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 05/10] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Z6XXfL1-ER2dLmZI@apocalypse>
References: <b12caa1c8c674a56afa7b2de780d9ae5423159a3.1736776658.git.andrea.porta@suse.com>
 <20250203234443.GA810409@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203234443.GA810409@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_014955_938868_CC8F0DB8 
X-CRM114-Status: GOOD (  19.73  )
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

Hi Bjorn,

On 17:44 Mon 03 Feb     , Bjorn Helgaas wrote:
> On Mon, Jan 13, 2025 at 03:58:04PM +0100, Andrea della Porta wrote:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
> 
> > +#define PLL_PRIM_DIV1_SHIFT		16
> > +#define PLL_PRIM_DIV1_WIDTH		3
> > +#define PLL_PRIM_DIV1_MASK		GENMASK(PLL_PRIM_DIV1_SHIFT + \
> > +						PLL_PRIM_DIV1_WIDTH - 1, \
> > +						PLL_PRIM_DIV1_SHIFT)
> > +
> > +#define PLL_PRIM_DIV2_SHIFT          12
> > +#define PLL_PRIM_DIV2_WIDTH          3
> > +#define PLL_PRIM_DIV2_MASK           GENMASK(PLL_PRIM_DIV2_SHIFT + \
> > +                                             PLL_PRIM_DIV2_WIDTH - 1, \
> > +                                             PLL_PRIM_DIV2_SHIFT)
> 
> Maybe this is standard drivers/clk style, but this seems like overkill
> to me.  I think this would be sufficient and easier to read:
> 
>   #define PLL_PRIM_DIV1_MASK   GENMASK(18, 16)
>   #define PLL_PRIM_DIV2_MASK   GENMASK(14, 12)

Ack.

> 
> > +static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
> > +					 unsigned long parent_rate)
> > +{
> > +	struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = pll->clockman;
> > +	const struct rp1_pll_data *data = pll->data;
> > +	u32 prim, prim_div1, prim_div2;
> > +
> > +	prim = clockman_read(clockman, data->ctrl_reg);
> > +	prim_div1 = (prim & PLL_PRIM_DIV1_MASK) >> PLL_PRIM_DIV1_SHIFT;
> > +	prim_div2 = (prim & PLL_PRIM_DIV2_MASK) >> PLL_PRIM_DIV2_SHIFT;
> 
> And then here, I think you can just use FIELD_GET():
> 
>   prim_div1 = FIELD_GET(PLL_PRIM_DIV1_MASK, prim);
>   prim_div2 = FIELD_GET(PLL_PRIM_DIV2_MASK, prim);
> 
> It looks like the same could be done for PLL_SEC_DIV_MASK,
> PLL_CS_REFDIV_SHIFT, PLL_PH_PHASE_SHIFT, CLK_CTRL_AUXSRC_MASK, etc.

Ack.

Regards,
Andrea

