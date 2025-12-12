Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE7BD4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0dbF2KGAYM3vdkkaB9ys4HQSTDRocKJY/9bGXcOOVY=; b=oPvEa8pwKC6/cdWvvvmfoAurNg
	RZ8dPfcoJIZ/yUGzxrdsj/nnljJ/9boQg0OoHQOOMT2IHg1MbbuFSFyJqEIz0Ut4G2/B10HdXzR6i
	7nGP8tM9pPtJC8xvXzSNlg1HWj+fQPvG5FEhkIRzMpi54BiQCmeWQXoD85UqbXl+XIHDdfzX76iU+
	r/2KH7QXhoa3ckOW4QDoctHi/Ozq1rSWzZ1JVSXUKt4rjTXgIRJNAz5ZJajjazJx/npokOiFHurPA
	W++FpMtkroRKlTLU9EyaJaCYwe7Hho1IGayA2Ab2EdVlGmmpZVDvzBOqPIqWYKetvvELX9YALlt/T
	RYpxAXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwq4-00000000Acb-3diQ;
	Fri, 12 Dec 2025 06:41:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTwq2-00000000Ac0-2ojo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 06:41:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477aa218f20so5681575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 22:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765521672; x=1766126472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0dbF2KGAYM3vdkkaB9ys4HQSTDRocKJY/9bGXcOOVY=;
        b=RQI4RmlWhr4ZsX4DOYQvdkUf8OW15UXgVv5bqW2kXI6uVuvcoGXgcwIfnbGSC38vih
         GOkBZ8aKHKLtrxI9Gmj/5rZp988zRmNFM+ybWHzKgLIYkBl4bUta1zyI/geyodcWlZtN
         q0DOg9UOjLT42M5U8rsMZoKgJ3Dn8rA6MJlocIzZr91iRDTh7fZQjnbHGxEB/3j6+/hI
         puxNxhXl9g/oqY3G/CwaJFEdQhMbjlidhAWKY2SLOkO2+gzO4RpAXiLor8AjnE7chJzY
         ievwwBMFPMa88KogAkFPsa/Z9wlKES/MRJM6i0ScY5TfrWkMCb/vbUyie6hT4cbbG+vW
         XNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765521672; x=1766126472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0dbF2KGAYM3vdkkaB9ys4HQSTDRocKJY/9bGXcOOVY=;
        b=cjyXRe992MuO+BEJfaC4FyqG0YFGM8vuBuBmj1w/n6VZFlQYJPtQs2OLRO7d+6102P
         hjvQzddnSAQ3F24D2MHSqzRDAapi7e9+Pb1aIdiuN9cgm6VXRkrziSSULCSPmn86nRqL
         81HrwrulA1aj2OkLk7QC/BIpsCszozemkbFXKECCc0xJHoBWHfvKDG+1kCcjCQke8gIT
         XLAqOkXSOsyUm8TUcWt8HvJSh9MGZ0e9Kfrda+cqcQwatOKOS8hED9Hz3N0WFOeAILLF
         AN4adIoU6ny4eVhnuIK5h/LGDTaRA+5sV4R1wxYnSRkWT0mcOxAImwPQyovK9tk5aV+6
         q7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUYmkugMdPqTL4++8YH091DX0MQZHzqUv+01a+Xd8Jt7QqMv7Vt9wZ6XaGEyjguZ23tBaZEqUtzItpM9lznexwA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy57J/oDy0/b2Zr6LT9p4PnJaC1urvnS9Z/RAsk/ex3zCm/OcEM
	DO6YzpfD1N/yhuhP+ZSJrKpWGfKISuORNJsCB3pg/tbr+CeJnylDKrXHZPI90Ps9HYA=
X-Gm-Gg: AY/fxX4WS5hQtQwiiglZFtWsqT9QOsNGuHgaVpJkwfMBavPhNRV3PSN1EvXwI7m3ShC
	mH4+AOx43ZaFd/W9Agp11QYYowhyq/cUCUTNmUh7SrP5nLv58IVEt5xPZ6i6+UZS1X/UgyYeoaq
	ujDSJkLZDynEFcaJQfefuNx8r4dvq3KHcpXr6AmXUIOGNCvKdwhbWnyRfrV/2UkDOr5JtWjmqPX
	i0LKgWwMxdnKjznYpbOQmsNT48ewyB98PySRb45m+W+I1W3AezHTo9/LY+32vcNylF6UcycnbZ/
	IzPSebyjA6s2s+gmPu+KfbYMX4tRDee1WuoQl/vf7Y905L2kLN2LgQPB3MHzUHEsNve3SUQ7vYS
	gBPcJgB1fDo+gGXq9bJffF4K1MFKiNUSK75inZnaqJm7KlwodVHqbkk4c7rzGRnbUtRKPq5bV7V
	2+rLaafXdTVBv1CGVT
X-Google-Smtp-Source: AGHT+IF5qezNkUaAJ9catHYZZtFdsT9KvXk7hbPAPFs0cPAp04mHo7MQ82wa12a1D0dIkmm73s4oQQ==
X-Received: by 2002:a05:600c:470b:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47a8f8c00d1mr7099105e9.9.1765521672165;
        Thu, 11 Dec 2025 22:41:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3a1b17sm5503315e9.2.2025.12.11.22.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 22:41:11 -0800 (PST)
Date: Fri, 12 Dec 2025 09:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH 1/4] net: stmmac: s32: use the syscon interface
 PHY_INTF_SEL_RGMII
Message-ID: <aTu5BB0pMfgzIodh@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
 <aS3GzJljbfp2xJmW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS3GzJljbfp2xJmW@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_224114_735956_AC68F36F 
X-CRM114-Status: GOOD (  27.53  )
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

On Mon, Dec 01, 2025 at 04:48:12PM +0000, Russell King (Oracle) wrote:
> On Mon, Dec 01, 2025 at 04:08:20PM +0300, Dan Carpenter wrote:
> > On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
> > Originally, accessing this register was done in a sort of ad-hoc way,
> > but we want to use the syscon interface to do it.
> > 
> > This is a little bit uglier because we to maintain backwards compatibility
> > to the old device trees so we have to support both ways to access this
> > register.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..20de761b7d28 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > @@ -11,12 +11,14 @@
> >  #include <linux/device.h>
> >  #include <linux/ethtool.h>
> >  #include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_mdio.h>
> >  #include <linux/of_address.h>
> >  #include <linux/phy.h>
> >  #include <linux/phylink.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >  #include <linux/stmmac.h>
> >  
> >  #include "stmmac_platform.h"
> > @@ -32,6 +34,8 @@
> >  struct s32_priv_data {
> >  	void __iomem *ioaddr;
> >  	void __iomem *ctrl_sts;
> > +	struct regmap *sts_regmap;
> > +	unsigned int sts_offset;
> >  	struct device *dev;
> >  	phy_interface_t *intf_mode;
> >  	struct clk *tx_clk;
> > @@ -40,7 +44,10 @@ struct s32_priv_data {
> >  
> >  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> >  {
> > -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	if (gmac->ctrl_sts)
> > +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	else
> > +		regmap_write(gmac->sts_regmap, gmac->sts_offset, PHY_INTF_SEL_RGMII);
> 
> Sorry, but even if that regmap_write() is targetting the exact same
> register, these are not identical.
> 
> S32_PHY_INTF_SEL_RGMII, which is a S32-specific value, takes the value 2.
> PHY_INTF_SEL_RGMII is the dwmac specific value, and takes the value 1.
> 
> If this targets the same register, then by writing PHY_INTF_SEL_RGMII,
> you are in effect writing the equivalent of S32_PHY_INTF_SEL_SGMII to
> it. This seems like a bug.
> 

Yeah.  Sorry, I forward ported this, then back ported it, then forward
ported this again and I messed up.  :(

regards,
dan carpenter

