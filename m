Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=; b=KPVeSB22FSRRwrV51GsLpAqtL0
	gCucwNeGjQPqnXR8WBToi5fsp0gXkluIKZjsiT/9zseRybYfbSTIUvG3Uv6Fbwyxt0QOBfErDJS6M
	3Seno3iIKje9hHKwM68cAD+XixVzsGphOpTk6khJ2kdHvO7apBN5IPWKVd1+qs3OwH+OpR3FvGxPs
	ILC4ajgfujt0gYKeJy9yw/6C9DOPEOH2DAuouIaZThI6+CfVgof4WRkVpttVxjjjT8WLW0rw+jBTR
	TgtSqqvD5Nt/iab+ELz+3+ARm7xtkr6tUuFi0slUYNr5Raz7NpsXhASXgTTSye2jex3qOzoZAcil5
	y0TR5Iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2jC-00000007p90-2aMC;
	Sun, 12 Jul 2026 22:32:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2j9-00000007p7m-38Mg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:32:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1001385a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895567; x=1784500367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=OWMDliUqcwPv52xH3BWv5+jhmlhyUJ4QsHK34SAMdwRLYKhRsnGYY40F8BNBYWsoh7
         Ku7laPwj2hIfk0Nb5PDLuNdB8k1+h+tSPUKjZaIu2uD3F9WOjOB6HwsECcR7cwn8f5py
         WZ0U8+w/QeRATGgV1Ai4KTTiFV4DapTPUD3/s242G8dizaIwVwFGTHjXTjP4P+LaSiyg
         oUDKPP7OIeuVC7yVgw8WdKg47/f5ZOwhECTQYuFLxCyJiyu28UHFnWHE+JwVqadONuVv
         FHYBTEIHEr2f9CyNtl2DMit44M4odQqslFL+U+8BBszr78o0D+MxzQq2rl6jet10fbre
         XVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895567; x=1784500367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kQZPoHSijeo1tUSaMcbyM3cWe1NTKRtsDQpKGYRUEs=;
        b=E48U3l2C9jC3CU4bIPD8R6nOSg/8evhndlMwfgzjG1y3Xmq7HBqs2MuQ/e2xr+jBzf
         KLNOnCg8gPNsxT0M/uHeSnowFTEVnYyNfcA//bkfAsrvKRisKeszMkr3OK+S9Jwc35xb
         HPXyYt4Vi+4J+q+i6h/M5h77FT1ZNNJeiPAyP7n6DmCPDzpJReXkr/d0a5mL8Vdk4nFh
         TjutVXQM3OXdVvsfL29GhlSD3HSOh+vFYR3pZ9HXQI5hacLko4KN3e5LXT8ekDRSCsfT
         2GQRlUDYoJS3rxlwlStR16J9NpYr+oaK3CdSAAH2F1BKmUxkI3HmQZs46WJDkyW+1w8+
         BYjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfbPYPh+UJtacMZ+U9OsD3YgZ1bKOQhhzNVS2wpInTdIFrcJ1LPyh/IqXwzA1kxiYF8qDEULnbIqOcTZcGIPTP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6VOoyDCaBzA9D3gE9VgVgbzoKb/KCoVNj5bW+KnAuSc1Zik12
	wiDMuJ+2gcFcgJryXYALCJMBk4hZHo66aJ+wbMVwirSPYyzUbd/uFN/R
X-Gm-Gg: AfdE7ckIMpkOpf04iYq5eT+IIiaaGsr7ukLbILHfy2VkwG85F61tm3SEBuniXGWLM1g
	+DB5E6AXluL/OfmfQk3y131sZi874s8qZ98yyNFlqvX6TvJeJYgXXtZXMGEQfMeHAaecZjUALVc
	eYkpOLh5Q+NlOO7KUAm+nPv3Uh4Gd0e9Sqy7NLdi25ni+/YS4aJ0nyd2qSTpo4t2LHl1eGIkQUG
	1ZE/9U2ztLZ3jN47MZsBxfqcZZPHD5J6lZbr86TP86cNNrlIsYHfNsa9vcKNyjHH4zqEH1aWkNJ
	ztsPocJ1vf77Pgp9Jy/XxIAhEQDdJp/7Q3LAssqP2lpWT1FXcJPjT559eq6EQDLv7FYgpyNjNYZ
	5HwqqdGBngkBCpNvnlzc9cxzyZ2dW4AdEFs56k9fBVkpiamWvEMPIOXogOzoFaJpS
X-Received: by 2002:a17:90a:da86:b0:387:e0bb:5800 with SMTP id 98e67ed59e1d1-38dc7ba7310mr5970904a91.39.1783895566751;
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm61166210eec.3.2026.07.12.15.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:32:46 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:32:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVg3QqoIdwGEmR@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_153247_788848_E86FFD87 
X-CRM114-Status: GOOD (  20.15  )
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

On Sun, Jul 12, 2026 at 10:55:51AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 7/12/26 06:52, Inochi Amaoto wrote:
> > TL;DR:
> > 
> > The DWMAC on Spacemit K3 is failled to register phy after the reload
> > the driver module (rmmod then insmod). Because the reset-gpio is
> > asserted while unloading the driver and is not desserted before reading
> > the c22 id, which leads to a fault.
> 
> You're not the first one facing this type of issues, this is a long standing
> source of issues. The problem is partially hidden by the fact that often times
> the bootloader deals with the PHY reset (like the case you're facing)
> 
> Take a look at these discussions :
> 
> https://lore.kernel.org/netdev/cover.1761732347.git.buday.csaba@prolan.hu/
> 
> and maybe more intersting, Russell suggested an approach on how we could potentially
> address this here :
> 
> https://lore.kernel.org/all/aTBeVTlsElGXUCSN@shell.armlinux.org.uk/
> 
> 

Yeah, I have found these links, but it is something more than I want,
so I think I should deal with this carefully. I will have a try if I
have enough time, but currently I will send this workaround to dlan
to solve the problem....

Regards,
Inochi


> > ---
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -196,7 +196,8 @@ &eth0 {
> > 
> >  	mdio {
> >  		phy0: phy@1 {
> > -			compatible = "ethernet-phy-ieee802.3-c22";
> > +			compatible = "ethernet-phy-id001c.c916",
> > +				     "ethernet-phy-ieee802.3-c22";
> 
> Indeed that's merely a workaround :(
> 
> Maxime

