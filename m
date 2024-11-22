Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A13CE69183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwR2oPIQAt5cBP8ivKC91SEZVyVQIhFtIJGjJD68WpY=; b=O2atCaor5W5LwI0zF6/bkNKdZj
	spR7uWBrEHRubzCIWUwpUaoQcsRcHscvKe4tVcgPWrG2ITooOaFOR6fp8Dj3VuesOgrQS77HS58Gu
	zqeNyBloX517/9RJyZztVw4H0uI6R1ZNHw/MGZd+tehX8YfP6znq6c0FT4LLKWobKQ+a8Qug3IYl+
	ipH4UkSYb8jqTkfcyUlgFRA384XHcg0PjsQ+308qurud0IOR1StrjcjhAMQOGsKXcqzpjE2lStmkZ
	4zZM2co8bWdZBp5oxw5kSXyspyQgbSRGeLhSU8p2cxuzNI1u4prOvH6TJvHCIDaS97zGnKR+5UsOa
	T2aspf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWmk-00000002so4-2TZL;
	Fri, 22 Nov 2024 16:45:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWlm-00000002sUZ-3UDa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:44:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e52582cf8so1779575b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732293873; x=1732898673; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwR2oPIQAt5cBP8ivKC91SEZVyVQIhFtIJGjJD68WpY=;
        b=PyvnyYe/f08WOOOciFWRADJKqiKEpTVCCWQnx4r9XygBL5hGKVseCpqiQDId6nAJBc
         BWgiUyUz3Oc6kLJxFuqN0WPnOPm0PVGsS0KBk2HIb21mbmxtASyouFhOdX71zrWjWv7G
         pf8CxcyFVuE1x7CBebAZ1kGMR35WSLHkURLKg2itL34I/qtq//BkZX/lbAIQ17E3qa4F
         8qYFF3ypwctT1s75/VfDxixi98FpiBKKwWnxex2K+gMfnmH87se4yTPG7buXx+gYn2xj
         j1NzOPD6YKFhuaozZ2Dnz0ThS2Ju/lcwQk1dMhHJ2D4oetC0RVKCNP+stf5/1Ucqrgj7
         lVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732293873; x=1732898673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwR2oPIQAt5cBP8ivKC91SEZVyVQIhFtIJGjJD68WpY=;
        b=iai5rabqS++ISqB84Owa7HexLbnw3iND5pPd2rf4oGnBWtyFwbTW1MWIs15k/k/cFY
         Nn7sgaGqQ1w+AtyVyzpylgBe7N9rcexj/3tSi/Fo+sVskRtk/dfG81m/uDElWf28oKBt
         ueCOA9BvYmPRoApWk2JiBjJElg8zHXfZ4YKgHnCCLBiAq1V8L4xTQbxvywJLgJF9Oiui
         S0wxP/PW37PmPOrwerk5kgrqAItVoJKSTXWWYjJJe7DaP9F0k+PgqpHimzzA1Cpfuage
         EbSZnRAWlmrqcgVR+bTGePcTnc/WnoUmaFmBbfUq7NLiOb3hfXeBrakFC9ZRcA42+5Yw
         FG1A==
X-Forwarded-Encrypted: i=1; AJvYcCXzsHJSBaK2t8TSDa2fXJdNExmxLP2TgjsHaIdY3bXQVmDJKvr/1MBbyLkNIErEU88nxGgHposGA6ibs23L+J5d@lists.infradead.org
X-Gm-Message-State: AOJu0YxcJnj1LRNknfNlyejgNtG+zKFdBZLcMEM6nx/1dDDkrQycWL3O
	JqyyoNtvXL2XWBeVth8kXt40f1mjeY09YudcIuJGKDvOq3fjKPibm09dzOEYyQ==
X-Gm-Gg: ASbGncsa3HfU71PjWjzi4ocFLso0LK3BwcS4FBIPdC0TGBuNJ3nJAjAwBIS5LKd/3E2
	US8ogGSDBVyhzkO12JeQaSq0nTHCH7MEgPCq2PYSgGJLq0673jbt20Rs9EZAiS/i6iu6+tcFRY8
	8ViMzk5NyB00hJg6+WZrf7DWvwoUellZVoNXFVrWnCARl9xpvepAajAvbMqzw+w0OKMD8r4k1i7
	0YnyPKlj34IE9zrlRNPUhYaclUU46sz9bLE1/pNX8bRNOuwE+yHFfNE7iry
X-Google-Smtp-Source: AGHT+IHgULISyXOq5TQcOtW3Twh+i1nObBb6S6wCbmH2FUwOM/cGRvZbPtQMUa46S4dJNMfTxBufDg==
X-Received: by 2002:a05:6a00:9a3:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-724df6b81c4mr4858528b3a.24.1732293873177;
        Fri, 22 Nov 2024 08:44:33 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm1607239a12.30.2024.11.22.08.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:44:32 -0800 (PST)
Date: Fri, 22 Nov 2024 22:14:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20241122164426.55zgf36oewcjxjvz@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-3-hongxing.zhu@nxp.com>
 <20241115063816.xpjqgm2j34enhe7s@thinkpad>
 <AS8PR04MB86767205982E13C2771614AB8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676DFD33B926A2EC57577CC8C202@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676DFD33B926A2EC57577CC8C202@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_084434_927674_A35246AE 
X-CRM114-Status: GOOD (  33.74  )
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

On Tue, Nov 19, 2024 at 05:38:30AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Hongxing Zhu
> > Sent: 2024年11月18日 10:59
> > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de;
> > festevam@gmail.com; imx@lists.linux.dev; kernel@pengutronix.de;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
> > 
> > > -----Original Message-----
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Sent: 2024年11月15日 14:38
> > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > Cc: l.stach@pengutronix.de; bhelgaas@google.com;
> > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org; Frank Li
> > > <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
> > > imx@lists.linux.dev; kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH v6 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
> > >
> > > On Fri, Nov 01, 2024 at 03:06:02PM +0800, Richard Zhu wrote:
> > > > Add "ref" clock to enable reference clock. To avoid the DT
> > > > compatibility, i.MX95 REF clock might be optional.
> > >
> > > Your wording is not correct. Perhaps you wanted to say, "To avoid
> > > breaking DT backwards compatibility"?
> > >
> > Yes, you're right. Thanks.
> > 
> > > > Replace the
> > > > devm_clk_bulk_get() by devm_clk_bulk_get_optional() to fetch
> > > > i.MX95 PCIe optional clocks in driver.
> > > >
> > > > If use external clock, ref clock should point to external reference.
> > > >
> > > > If use internal clock, CREF_EN in LAST_TO_REG controls reference
> > > > output, which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> > > >
> > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++------
> > > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > index 808d1f105417..bc8567677a67 100644
> > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > @@ -82,6 +82,7 @@ enum imx_pcie_variants {
> > > >  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
> > > >  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> > > >  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> > > > +#define IMX_PCIE_FLAG_CUSTOM_PME_TURNOFF	BIT(9)
> > > >
> > > >  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
> > > >
> > > > @@ -98,6 +99,7 @@ struct imx_pcie_drvdata {
> > > >  	const char *gpr;
> > > >  	const char * const *clk_names;
> > > >  	const u32 clks_cnt;
> > > > +	const u32 clks_optional_cnt;
> > > >  	const u32 ltssm_off;
> > > >  	const u32 ltssm_mask;
> > > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES]; @@ -1278,9
> > +1280,8
> > > @@
> > > > static int imx_pcie_probe(struct platform_device *pdev)
> > > >  	struct device_node *np;
> > > >  	struct resource *dbi_base;
> > > >  	struct device_node *node = dev->of_node;
> > > > -	int ret;
> > > > +	int ret, i, req_cnt;
> > > >  	u16 val;
> > > > -	int i;
> > > >
> > > >  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
> > > >  	if (!imx_pcie)
> > > > @@ -1330,7 +1331,10 @@ static int imx_pcie_probe(struct
> > > platform_device *pdev)
> > > >  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
> > > >
> > > >  	/* Fetch clocks */
> > > > -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt,
> > > imx_pcie->clks);
> > > > +	req_cnt = imx_pcie->drvdata->clks_cnt -
> > > imx_pcie->drvdata->clks_optional_cnt;
> > > > +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
> > > > +	ret |= devm_clk_bulk_get_optional(dev,
> > > imx_pcie->drvdata->clks_optional_cnt,
> > > > +					  imx_pcie->clks + req_cnt);
> > >
> > > Why do you need to use 'clk_bulk' API to get a single reference clock?
> > > Just use devm_clk_get_optional(dev, "ref")
> > It's easier to add more optional clks in future. I can change to use
> > devm_clk_get_optional(dev, "ref") here if you insistent.
> Since the clock fetch is not distinguished by platforms explicitly.
> devm_clk_get_optional(dev, "ref") can be used only when i.MX95 specification
>  is added.
> -       ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> -                                         imx_pcie->clks + req_cnt);
>         if (ret)
>                 return ret;
> +       for (i = 0; i < imx_pcie->drvdata->clks_optional_cnt; i++) {
> +               imx_pcie->clks[req_cnt + i].clk = devm_clk_get_optional(dev,
> +                               imx_pcie->drvdata->clk_names[req_cnt + i]);
> +               if (IS_ERR(imx_pcie->clks[req_cnt + i].clk))
> +                       return PTR_ERR(imx_pcie->clks[req_cnt + i].clk);
> +       }
> 
> Or
> -       ret |= devm_clk_bulk_get_optional(dev, imx_pcie->drvdata->clks_optional_cnt,
> -                                         imx_pcie->clks + req_cnt);
>         if (ret)
>                 return ret;
> +       if (imx_pcie->drvdata->variant == IMX95) {

Why do you need this check? If there is no clock, devm_clk_get_optional() will
return NULL, so you can just do IS_ERR() without any checks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

