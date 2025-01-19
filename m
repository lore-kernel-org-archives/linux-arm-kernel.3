Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C6FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMJ3GX6dkOYZdUXVc1wm3huqORVLg1qLuaKka3o+Bqk=; b=JWnmrAsYYcUOWo1X6KP4nHzdSD
	P4BhChowTI1vNelKoi+zkF0iuwWsZ2C3O+i1OJ+aOn5uFGqR8HUkVnmMlOhwtU0/kSQ0Zp3xBSgLY
	+Iy+yB+yKBBtDRA8b5B/fJUL7EbG9mfuuE93e9uMO9NipDCIRkprxWp0WrCpCz2FCbZwj3m9/Rgqo
	tDomhXXJiKu5/SEFA2OifAyRB5f6linP05JhtcCT0Da1dBOhf6QlPsCaWrPQANaKrLUtNawgfCFgr
	PzeYSapImskOMxicCmr+AtLbh/Aw4mqYwGoUxeKDhEShLPtSfqnOwBJDLXmfcp38p52F7eQwIY5mZ
	ApOm5BXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZPM1-00000003W2C-1EXc;
	Sun, 19 Jan 2025 07:04:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZPKh-00000003VtC-05KQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 07:02:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166360285dso66987875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 23:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737270174; x=1737874974; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vMJ3GX6dkOYZdUXVc1wm3huqORVLg1qLuaKka3o+Bqk=;
        b=p9XtruXva6uZVkvJ2HHByt86ZhFLP2G90uWr9eqNA0dAYUprkLSMaCWLlGlGmd3oP5
         KWFMmHe/KrPvlIE9A84XH7rDLa59R8GmAb7+9b7LiBxT8uE9nw1RPtAExzt26U3bFllJ
         E1gv9Ovd1Q9o/No0Yz7ZJFfAp6QVEk57vClgpQ43+ou33U26vBXkH0tF9dlP30bCoDys
         oOAjP2u2tap+r0h0N+k1od5q3TxoRbAgfZan48t+UM1Tm7sG6bQU9HoCb6opxCiy/Ua9
         PgvqRYmaSVluQV581/P3kcRnOS8dptgl8JmmlLIMo/31naA+Jo/2aw6cVX1n+Ehy/5++
         R9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737270174; x=1737874974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMJ3GX6dkOYZdUXVc1wm3huqORVLg1qLuaKka3o+Bqk=;
        b=aSsy9Atrs/yFdUr+t4O2uNwWQVzJa2q/CQ1AwXxwuW8PGjve7HmP6HKPTbOBzCasS4
         pv8+IThuJc0z+kb1k9ZwXGymccNZnBPq3cEMCBn0nUfMp+b4syRnkl/kwGOxQ/15IUWo
         LAoJA9gVVce4r25cQhgclOTwcNca8PzLZMdGA9VlLDW5ptcc8i4FoTvKPOHUiEWuggdp
         JqAdzw+UHs54K2Nt2qTKDgkeofMCAPxJzPNrDZG2K3mBL1Kt8jHYa8Qb13Q7iWTXp9O8
         DMm3/VqXgxJbuGT7SZtH0MWZEjl71zHwXFvd9cbGpQ8D1TpMRbTi3FTKNlIbywe6QPMt
         kjDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs+zSnsRVwdmi8kNtZxPE+ilY8BrpP/v3qyFpN0mbaYgXJAUuig1y1MUfgJtiSjqcI54pQdut70p7l+52Ymzqx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7unqAa4R7BPuvYCXyPYshznUll7SaH7eOPLumCMUp8eRoy9LR
	Ieo8f3c1C3EKwBXgQ5o7TJAgn1eiak1AHAuFXLa0TuA7Y/dzU9QlTJcoYLhdWg==
X-Gm-Gg: ASbGncv4XoMKyarPBEoB6lYY7phlY8wGRdU87w5s5IO59miRHg8m2cIl8pZWlwfDUmo
	uZPcPHxX0ZEgt7HwweCwC/3HivD4aW3nohiQta/3inDKgIwnVv5tPeyQg0l5MbIPP7KkOtdZuia
	8vTc6dgP7tycGcplsJAVOOItGF90zLYBJtBwNbF3EZxoQl6IFnxVaPY/a5nG2RYbm1FMlpD3j2K
	gJyUS6mPi4ZM1PDmKYR6XS4fu9R/kJiRa5f/lqp4pIucOUlwqp2RTlWJNghIT28gshms8JulWW/
	qW9pZw==
X-Google-Smtp-Source: AGHT+IEeTs48whwEN7rNg39TN9hpGQKSWq0W/VdR6tyAMeUyYliEEBAyt6ics9gbcWZ/8208wLwfuw==
X-Received: by 2002:a17:903:22cb:b0:21b:d105:26a5 with SMTP id d9443c01a7336-21c355becd3mr125597245ad.38.1737270173884;
        Sat, 18 Jan 2025 23:02:53 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3dd93esm40763455ad.164.2025.01.18.23.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 23:02:53 -0800 (PST)
Date: Sun, 19 Jan 2025 12:32:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, frank.li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/10] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20250119070246.yfxogn4vv3jqfvzb@thinkpad>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20241126075702.4099164-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126075702.4099164-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_230255_398430_B3AA503B 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, Nov 26, 2024 at 03:56:54PM +0800, Richard Zhu wrote:
> Add "ref" clock to enable reference clock. To avoid breaking DT
> backwards compatibility, i.MX95 REF clock might be optional. Use
> devm_clk_get_optional() to fetch i.MX95 PCIe optional clocks in driver.
> 
> If use external clock, ref clock should point to external reference.
> 
> If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
> which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 385f6323e3ca..f7e928e0a018 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -103,6 +103,7 @@ struct imx_pcie_drvdata {
>  	const char *gpr;
>  	const char * const *clk_names;
>  	const u32 clks_cnt;
> +	const u32 clks_optional_cnt;
>  	const u32 ltssm_off;
>  	const u32 ltssm_mask;
>  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> @@ -1306,9 +1307,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
> -	int ret;
> +	int i, ret, req_cnt;
>  	u16 val;
> -	int i;
>  
>  	imx_pcie = devm_kzalloc(dev, sizeof(*imx_pcie), GFP_KERNEL);
>  	if (!imx_pcie)
> @@ -1358,9 +1358,13 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		imx_pcie->clks[i].id = imx_pcie->drvdata->clk_names[i];
>  
>  	/* Fetch clocks */
> -	ret = devm_clk_bulk_get(dev, imx_pcie->drvdata->clks_cnt, imx_pcie->clks);
> +	req_cnt = imx_pcie->drvdata->clks_cnt - imx_pcie->drvdata->clks_optional_cnt;
> +	ret = devm_clk_bulk_get(dev, req_cnt, imx_pcie->clks);
>  	if (ret)
>  		return ret;
> +	imx_pcie->clks[req_cnt].clk = devm_clk_get_optional(dev, "ref");
> +	if (IS_ERR(imx_pcie->clks[req_cnt].clk))
> +		return PTR_ERR(imx_pcie->clks[req_cnt].clk);

I think you should just switch to devm_clk_bulk_get_all() instead of getting the
clks separately. As I told previously, the DT binding should ensure that correct
clocks for the platforms are defined in DT and the driver has no business in
validating it. Driver should trust the DT instead (unless there is a valid
reason to not do so).

>  
>  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_PHYDRV)) {
>  		imx_pcie->phy = devm_phy_get(dev, "pcie-phy");
> @@ -1509,6 +1513,7 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
>  static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
>  static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
>  static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> +static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};

And these static clock defines will go away too.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

