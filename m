Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB3FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=; b=YzuuVL35dxSkxsfa6VhomT7Lx5
	dmHsen7iJ+FQnNb0ZnaLWjwfjLYSZlF4z1voxSCceCYFxv/xqdGahEIbxhaMJ2p6VMyGQiJ+0Msf5
	uO2+caWPcMlVPXloitxM5WMElNxzZZzMUY6ziZOIcVw48qRBdZsbPXEZJWlCkecXwZ762mHE4l/+N
	ef7dmyI5qV7oPDXn/EGXHds16sB3Oyd/IY/jYkIDjBExlXQPCefwzzESELVjI9KDaKnqzaNKWJUga
	G3pK6sseSreJQWm5cIb/gYKrXZPOcTBnCV1mP0fXSQ4J24Rkf/ivhRjEgMlkavhlCZJBFdrZcYuFo
	4EjelEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4adC-00000004n7B-2pqc;
	Tue, 15 Apr 2025 07:22:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4abM-00000004mlZ-2aNE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:21:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227c7e57da2so45511715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701660; x=1745306460; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=LbGrEUxGRRFDYsh6sVUMd9/cMwf0xgH5oCR6caUOxfJGkuD1OUFswRk2pBm7B3EXXs
         RQcZ9xfYvyLGHgzWLAgKyRH8ttKNCkwd4iD4VLACP6i2dy3w+ECWWgA+CsoEspu0qS7K
         qERHN25eMCV6fEfA5KiDvmiL6XBBaXY6sld3gEjdZ1UJ+juzqEBlCMWkFczitudqOIc5
         tmmotHqzNWDc1Df/dyeMTKcgZZKGfJT9mYYjeN+IueRiDMhe4LC9hd5w8OH1e4ZJzbSQ
         3o807XOMzIBzxP2OLAzmTGM9BbzRQzWJEiVJkJKHgpQYZTBUHXqPEugkoTwQTn+qs+MZ
         MIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701660; x=1745306460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCNk9Rod1k+bgkwurUtIjlivzVvS2RJvCje5WjdRCTk=;
        b=h4zGAwEZ5KZObpwXg0/4UnIEY7XKzqc4Z/wYp97KUgipTaWC4GC0/NC69aODBAuRdh
         TyME01vAulCqWna/SvOd4PYAmXBnMpUSoCk8z8kOMR3sjhpjflUOrdwqDYYDJPXjZ0l/
         9jlW1pzsUwjRxmT3JUPgiHTC+/xRCCMCAH2hm1y0wO9xyNCgsg1LAr5YyVGh4mPR+GbB
         hL0EAZMcE5bUNTHDoDVYh8cFd2eTeOw/Hk3iisJkwp6UfTybuOdS8Df39svCmnWZ2uty
         tRMgbfUSK/N2FHC/94k0YzihSYbYa72eXzLw8ewJUA1JtyktngK3OTw0Pd5GGIsklF4R
         +4OA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBK43uetlX69kcZBQKshI2wVgpiG5N2UxAg4SnkKNeWoGqiHd2JHJ+aUuGery6q5ik0luh4C8dy/rrF1zDR0X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx80Ra9cPNMX3cQJEHuryWk2UPRsU6Q2Nb/RaQT3VP098Pzy0f4
	r7WOj0PaShsiAq7O6AufkjtZRx0KLvQ0Pc3ilX91I0P/zlUXzfHaTQduTTD9+g==
X-Gm-Gg: ASbGncvm/cgkT5SJQa9YpcyBdXDs2X8Vf2ItFmiaogBAEXrhpDQvw9fV+BY5e46WEv0
	3xUUo0PPEsrrguimuZT+Siv+sZaksfDbC+0jyImiWl9YtU2lX2RXCHAwVu31Ff2J6H9bhKUkoRN
	Ons2HuNNWAIJsMetMvEgWZzEAQuSoiRjaDTOwbt0xptObebDDbW9H/t3IEFeDNUAi0jjOHtkO4b
	238USnY7O0cbTL9VPu0ObRcF2A6WYEFzpVKRKO1FKu1GFALbUYQvL4B34+twH0ljIy3TDSi1K19
	7jyABBIk3IT+81wWebDne3bFC2KVUmnlgQP3IfuXMARdtMiDBuuCZJHIzUoT
X-Google-Smtp-Source: AGHT+IHwx8NytA4HfmHYqY+ucueZxWfnA77QXqfaKsQqKRz4c9hbWsTrqA2PwtFUSZmcoIQDMTuTwQ==
X-Received: by 2002:a17:903:1b6f:b0:224:c47:cb7 with SMTP id d9443c01a7336-22bea3f02aemr222574665ad.0.1744701659806;
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cddfaesm111157005ad.257.2025.04.15.00.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:20:59 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:50:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <3wmkjmutepc2s2ookc3ces4eyxe6morhhwxzlpup4mkkoy5ocx@py6h36upgl75>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
 <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
 <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867619A464E923655EDEF4878CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002100_702454_C85AAC9E 
X-CRM114-Status: GOOD (  30.86  )
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

On Mon, Apr 14, 2025 at 03:16:46AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月13日 23:33
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
> > PCIe
> > 
> > On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> > > Add PLL clock lock check for i.MX95 PCIe.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 28
> > > +++++++++++++++++++++++++--
> > >  1 file changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 7dcc9d88740d..c1d128ec255d 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -45,6 +45,9 @@
> > >  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
> > >  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> > >
> > > +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> > > +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> > > +
> > >  #define IMX95_PCIE_SS_RW_REG_0			0xf0
> > >  #define IMX95_PCIE_REF_CLKEN			BIT(23)
> > >  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> > > @@ -479,6 +482,23 @@ static void
> > imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> > >  		dev_err(dev, "PCIe PLL lock timeout\n");  }
> > >
> > > +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie
> > > +*imx_pcie) {
> > > +	u32 val;
> > > +	struct device *dev = imx_pcie->pci->dev;
> > > +
> > > +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> > > +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> > > +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> > > +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> > > +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> > > +		dev_err(dev, "PCIe PLL lock timeout\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)  {
> > >  	unsigned long phy_rate = 0;
> > > @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie
> > *imx_pcie, bool assert)
> > >  		regmap_read_bypassed(imx_pcie->iomuxc_gpr,
> > IMX95_PCIE_RST_CTRL,
> > >  				     &val);
> > >  		udelay(10);
> > > +	} else {
> > > +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);
> > 
> > Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated, it
> > should be called wherever required. imx95_pcie_core_reset() is supposed to
> > only assert/deassert the COLD_RESET.
> > 
> > If related, please explain how.
> Thanks for your kindly review.
> To make sure the HW state is correct to continue the sequential initializations.
> The PLL lock or not check would be kicked off after the COLD_RESET is
>  de-asserted for i.MX95 PCIe.
> So, the PLL lock check is added at the end of de-assertion in
>  imx95_pcie_core_reset() function.
> 

But imx95_pcie_core_reset() is not doing anything for deassert other than
waiting for PLL lock. Hence my question.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

