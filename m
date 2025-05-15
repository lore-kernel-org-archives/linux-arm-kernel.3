Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3749DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=; b=YlTCZ12sUlWb6sTncOjzCMPtw8
	wflXsOnqu2eMFx2BkXyuTUvKodvkKz/lEXELdC4LltH013984Tfe9tCepNR3FK/IWwPnKulXdDATc
	H7JhVIVZ6xtmVczKcpuZjaK0lpoIpPnSPgOyixS7s++/CbQc5xujnfRu5PZQscDwI4HTWPvXKo9KB
	VqcGjR2z3q6RNTpv/84kooCqGdErl6hDCBZem8C96KZQYhTvXqquzcXY7cTfTHrfLTEgaPCQ9qFsz
	hyVmX0biM5TGxpPi5Vmqmvx/Ux+vScwIgLGjNBFDKLQL2wWnY6XEZisuVE4F7+0UcgPY95KJg9nfI
	N0lugrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWpU-00000000Poq-0RXI;
	Thu, 15 May 2025 11:32:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWmF-00000000P5F-17P6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:29:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso522444f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308565; x=1747913365; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
        b=GpcXKawPM2poghNfxhJCuBlTQ+wUdKQRz66u5KHISxKtLWuxfu3HjZeGqfAELSpfBk
         f1YBWTd6zICCMkbVvemq4snCBarhk4+6LuY1UdUTR7yR6eTxj/r+L9YslBZRGBKp+Edn
         rk0Cl7fKaKnpdPRvrLBGmYNd/Sw0+7vElkUfC/mKIN8mnOUW2kU/fWA1hedh+M2R6Otq
         nTvwKvyUwUrbvgGjJyjYkRyCdWrWNnF8IkNiSGQU1OWrUCULIJ06ML5iZW1KfwcpjkwZ
         mKgQC2bk6POHiW7Ly7k9RqRPP3HgYzCVosBcWoMqh5qOH7Yh6oIUzz3rN7i2/tSeBfUk
         9eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308565; x=1747913365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
        b=ia61lzYX0C7DLrk7TYho3AWJ2V9r226tKLdIxx6SCVBUrtBvbWO3OcH9bhaP8u0rff
         zHUCZr5MgLeHbpruBaCtcjYn5runzsIVH4/sbPv14zb6FfSX2IqlTmFGgiey899cyOlz
         VSIMT0l6llJiYWltlL4I0ov+Lx9fJi9bynpRbOgBhrVaMZN0PgW6GbhrKfPGTiLeMpcO
         o1qfkS4I5eK54sQkftBMMkgEoqfP8+lff0INA+agcAcf/I3k0fRxd46f3/vSO/pCux9Q
         kO8UupRC3M7T/V4+KTTyS2V+/xVAklIYftFjjsJIKko8DxEjK1ILFNncDkdS1UAE8YoC
         2kPw==
X-Forwarded-Encrypted: i=1; AJvYcCXpn1g33ca4XqVifPgwGxIDSwawFs+9Wdf/jCqVE6OFAo+BMM4eTmZL1baig+D+kbLe6TFx46IE3/zlA1Z11ICp@lists.infradead.org
X-Gm-Message-State: AOJu0YyLSwt+HraR6g8330FhUl7zAnGr9X7f4Z+CtbkbGT8PZnRFEYyG
	EjBct9m/KaNF6bYSR6auvsguzVf1tt62qk8jJPs4rKNiz909WLzPl2+qI0u95g==
X-Gm-Gg: ASbGnctD7zDHMY0/4FOTrSviY4swRGPczJn41slT2ehbpfEjUYMiafvUZc8kdiEoT2N
	C9EUwPJuHsT8qhjIhs5WOdv/i/zaK7xPPIJpZyBEcZVVXfq0wGp/Qpnti4PZl29/wExt0sGeLI7
	cY+b1ii0BdFRX6rssUV2L3+hTinK8YtTyOjVqi2b68xSiXhLwr7KT2BVunlxl16XHlhUIQH2L3X
	F0bU3jrrlffRLhRTz3N3mzuAixbmvEVFFze7pQpL4tT1o4Y00CaViTHorM3I0Bjw/Ya7fpJVo+4
	64M65kZ68ibKxpYllGWHK4KoEQm8EIcvNwfg5SEpsPXQL3QVLAg8vmctMMlKEFP7dl2hNMG5Tif
	UFBaxs4nSUtXtpFZatoJxuW7W
X-Google-Smtp-Source: AGHT+IFamW2RPKGKJfE+U6UvXP5DVtS58juDRGBK81mdENW8tAkGVKABiwtzg+vRMFYjw66L5CqtcA==
X-Received: by 2002:a05:6000:2088:b0:3a3:55e6:eaaf with SMTP id ffacd0b85a97d-3a355e72142mr1087194f8f.24.1747308565358;
        Thu, 15 May 2025 04:29:25 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm22731199f8f.16.2025.05.15.04.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:29:24 -0700 (PDT)
Date: Thu, 15 May 2025 12:29:21 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	cassel@kernel.org, johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/9] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_042927_312584_43E3FD38 
X-CRM114-Status: GOOD (  32.32  )
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

On Mon, May 12, 2025 at 05:08:13PM +0200, Christian Bruel wrote:
> Hi Manivannan,
> 
> On 4/30/25 09:30, Manivannan Sadhasivam wrote:
> > On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
> > > Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> > > controller based on the DesignWare PCIe core.
> > > 
> > > Supports MSI via GICv2m, Single Virtual Channel, Single Function
> > > 
> > > Supports WAKE# GPIO.
> > > 
> > 
> > Mostly looks good. Just a couple of comments below.
> > 
> > > Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> > > ---
> > >   drivers/pci/controller/dwc/Kconfig      |  12 +
> > >   drivers/pci/controller/dwc/Makefile     |   1 +
> > >   drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
> > >   drivers/pci/controller/dwc/pcie-stm32.h |  15 +
> > >   4 files changed, 396 insertions(+)
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
> > >   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> > > 
> > 
> > [...]
> > 
> > > +static int stm32_pcie_probe(struct platform_device *pdev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie;
> > > +	struct device *dev = &pdev->dev;
> > > +	int ret;
> > > +
> > > +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> > > +	if (!stm32_pcie)
> > > +		return -ENOMEM;
> > > +
> > > +	stm32_pcie->pci.dev = dev;
> > > +	stm32_pcie->pci.ops = &dw_pcie_ops;
> > > +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
> > > +
> > > +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
> > > +	if (IS_ERR(stm32_pcie->regmap))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
> > > +				     "No syscfg specified\n");
> > > +
> > > +	stm32_pcie->clk = devm_clk_get(dev, NULL);
> > > +	if (IS_ERR(stm32_pcie->clk))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
> > > +				     "Failed to get PCIe clock source\n");
> > > +
> > > +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
> > > +	if (IS_ERR(stm32_pcie->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
> > > +				     "Failed to get PCIe reset\n");
> > > +
> > > +	ret = stm32_pcie_parse_port(stm32_pcie);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	platform_set_drvdata(pdev, stm32_pcie);
> > > +
> > > +	ret = pm_runtime_set_active(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);
> > 
> > Please use dev_err_probe() here and below.
> 
> OK, will report this in the EP driver also.
> 
> > 
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = devm_pm_runtime_enable(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	pm_runtime_get_noresume(dev);
> > > +
> > 
> > I know that a lot of the controller drivers do this for no obvious reason. But
> > in this case, I believe you want to enable power domain or genpd before
> > registering the host bridge. Is that right?
> 
> We call pm_runtime_enable() before stm32_add_pcie_port() and
> dw_pcie_host_init(). This ensures that PCIe is active during the PERST#
> sequence and before accessing the DWC registers.
> 

What do you mean by 'PCIe is active'? Who is activating it other than this
driver?

> > And the fact that you are not
> > decrementing the runtime usage count means, you want to keep it ON all the time?
> > Beware that your system suspend/resume calls would never get executed.
> 
> We do not support PM runtime autosuspend, so we must notify PM runtime that
> PCIe is always active. Without invoking pm_runtime_get_noresume(), PCIe
> would mistakenly be marked as suspended.

This cannot happen unless the child devices are also suspended? Or if there are
no child devices connected.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

