Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBF1CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=; b=V1VcOXH9D1GESnDV8841u6u9V2
	blHnwTC+cNZwzQaur6fN5ZihFG09ZS+NbSOQywTib21WK4ORkcQ/O7qNGQblqWY2LDKrU74a2mC4b
	m5d6sDD2AQw3WnFYP6yxEH1O5AmtDMC5phitzWnnhu0EmjzN2n02CC85IfoU2d1LO6Mo+SSNF6ZWD
	osMCcv6c8V06QwKKuJfnrXf9l0WhH+0VD7n0WoKn1UEGXDq9rVF0Pw+JXLXb/h5qaxSTaLFX+nQSP
	D3qsxmpJeWEOfKP24jxroZj3gKcNukbBho9PX+oGX22EBxgauSSxfboiQeu0gnAwKmkoy19HY0cH8
	UGHx2sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAo1R-0000000D3zi-3Oy2;
	Mon, 20 Oct 2025 11:25:53 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAo1O-0000000D3z8-25fN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:25:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6a7d3040efso1163135a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760959549; x=1761564349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
        b=ABSLhbFpJRfC8nTehMB29mHgnF+M6SlQ9MwgJk3yOyB6P6uJfiafLoqG5LwEAuCKFT
         lnU86Goq0Mrn4wILWjXE9hGvvLhpDULtmButCI3Kk5fPQoKoppfjVST1YIKUlJzFHnt7
         bBYExRyYPvFR8TGcN7Pv83sZSHqw0spZ4GRc0icmSkCg591wOWVEJgTK1UoTLwS8oQWs
         w0af8CMyuHv3evf9IKSy/d4yFpjKKG4sPAvosDFPdBQxyoQ7vyr+5u6kqRTpYY2nTXzB
         5dYCQzhkv3c4KO5dIIW+CeAflNr3FQQTYVTq9TEfo2EfedZiwSyB6uvXplHWO0kNnt28
         Z0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959549; x=1761564349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz+Xl2/NrMdS6fZi0EK9OqxzCdzOSL6WeQJpOQkz1Yo=;
        b=q+qOlnq5PNJIRKbz1rp08hWOWelU9QlkeGM0d96xmrGYsh5yS9Da2TagXWrZL69ZUY
         iExI7EGAw+NE1DHBERkVfJrZ7O3JIbAyZPNYhEm8YlFlfgVY1bFIioe0bcxB40nlyEtZ
         6gtr1RgFd13asGHsyn5uo/Y+/owBsPuazLepL5dz97MBv4jQoje9RiBGy33bvDlNw3Oz
         CkDq8qcDxJUsr0lFApTJaHksNtnAkVhNOwIvcZztcggMCN31FOEmrH4PmXl29vhcicrF
         sHwwh/tf403WKdxEzSsBf/AIiwuIr2zBIrEBeL0AxwHCSK7fPOx8rR0RcKo1GoXbWONU
         dfLg==
X-Forwarded-Encrypted: i=1; AJvYcCUgYP4NzdbuJylmtYeGdR9xLDnZ6ZAzks/MXZLJpSlc/GGX9ydJuebI+7h7huqOX9geaLyoqvr6wYsSOhQxZ1eY@lists.infradead.org
X-Gm-Message-State: AOJu0YxetlrhkD4aDHjYeoE/hd/kuARjUNRTivqveCP5K9z2711h9ioF
	EQQF1He4MCiXhk7LAWB/1NF8m46WRnGFumBoXMSmSeEkhzJcIz/oy6OV
X-Gm-Gg: ASbGncs3pwgQSUvAUIN9PsKbzU5JY9LlFhmpodlyqHScvLvr3RXssy+GWHFBo32ehGA
	+8Q93j2vhEBydzV2qtE1X8X4lkEAEAIjBmrVH9OBb0NDqJAXiSKO6wmB10+uJrU+f3Topk5y8qy
	BRtytvrEkAYaa5SAkylyeU4Ov+jShawGd9fWCNBU4N6XRg8lccLt8a+J7TwTMlUS7lGtMrT5wIK
	T1NI4KKd5A7Z4l8VWfg5ZS0VBT+/OYqzPrfqEDqzXMrB0SkHVLf5ar7h7SFF3YX9yC3pR1yAQGR
	KElF4hlpiyg+LPGd/IrC3jUjq/D6cofa50GmWfM1ulGRQ0Uz2kV5cnUgyckP5y9jt+cALBEN73w
	FRT0IT2igZ1wCU56Uc2oFUfAb5GJsWqVxEq84P14lFLWsLVNCiv8dcfUhPgVn/fGM3ewJD84ohZ
	Cb1gNjZISYmg==
X-Google-Smtp-Source: AGHT+IGmXkq5K8nuswuZOy/Q3vJ1q/fs2FggRu+CXIAg0ikFpAfPL8SJOtCn/E3IpbjQlSwX+Wyw8w==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id d9443c01a7336-290c9c89fa6mr155748285ad.11.1760959549499;
        Mon, 20 Oct 2025 04:25:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d598asm77433485ad.63.2025.10.20.04.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:25:48 -0700 (PDT)
Date: Mon, 20 Oct 2025 19:24:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-4-inochiama@gmail.com>
 <20251020110219-GYH1506524@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020110219-GYH1506524@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_042550_562824_AC77FEF9 
X-CRM114-Status: GOOD (  25.06  )
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

On Mon, Oct 20, 2025 at 07:02:19PM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 17:54 Mon 20 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> missed my comment in v1?
> 

My fault, I forgot to fix here

> > when init the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > index 3b7947a7a7ba..960357d6e282 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -7,11 +7,16 @@
> > 
> >  #include <linux/clk.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > 
> >  #include "stmmac_platform.h"
> > 
> > +struct sophgo_dwmac_data {
> > +	bool has_internal_rx_delay;
> > +};
> > +
> >  static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  				    struct plat_stmmacenet_data *plat_dat,
> >  				    struct stmmac_resources *stmmac_res)
> > @@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> >  static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  {
> >  	struct plat_stmmacenet_data *plat_dat;
> > +	const struct sophgo_dwmac_data *data;
> >  	struct stmmac_resources stmmac_res;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> > @@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> > 
> > +	data = device_get_match_data(&pdev->dev);
> > +	if (data && data->has_internal_rx_delay)
> > +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> > +									  false, true);
> > +
> >  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> >  }
> > 
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> static const?

Right.

> > +	.has_internal_rx_delay = true,
> > +};
> > +
> >  static const struct of_device_id sophgo_dwmac_match[] = {
> > -	{ .compatible = "sophgo,sg2042-dwmac" },
> > +	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
> >  	{ .compatible = "sophgo,sg2044-dwmac" },
> >  	{ /* sentinel */ }
> >  };
> > --
> > 2.51.1.dirty
> > 
> 
> -- 
> Yixun Lan (dlan)

Regards,
Inochi

