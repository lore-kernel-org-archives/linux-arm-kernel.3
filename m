Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD8AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9BcveS9bJ2hUNKExpwZbpno31qDfmJMMPHesU3EtOA=; b=PER6ma9GCIShrOt8OMxT5caegu
	6kJbNqxndnngywXN7HnrOG3NuyCZv8mU5gG5H1A/P+hfd1ZLNxAM5KR+oseVXCAWoncc7my5rjij5
	8H6LwC+sM55r58dwq21Np3Z2F1QaOjrGRv99pcQAzivngYAPU7GQ+0OKHZEyWXrlVAhCM6DIstTnr
	bOWsa3NJw2ykeM0kf12vmmGZBOn/cz1IXZftRlrs9H8rdhVf4FUYmy76ARb7/f5RLTc062xsfL8KT
	tytfj6O5ybBh9xvUen37jPxEgBohohTP5Ge3H5ACJZZiaQIUF6srcGbJJQb0sEtTxLakHDI5DXl9U
	hxmbVuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2CI-0000000C2iq-1Itc;
	Wed, 30 Apr 2025 07:49:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1uK-0000000BzsY-2buO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:31:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223f4c06e9fso6360915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998263; x=1746603063; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f9BcveS9bJ2hUNKExpwZbpno31qDfmJMMPHesU3EtOA=;
        b=JWAnIIDWhhRptAskSC9S5ZD+9PHaTImORuCSrw4LUGLTUAGVZM1N+wFagIjQTlEpBF
         a2oDnBf/tN4cF4vgUTlc4yC9JN7Lafv6HN9X/NvfZjhweuw3z96Qsm1FnQ+tYDVoNn8S
         KIlhZSHjXchJjrrE69h8aqhA/TqdJRobNR6fjJXh/K6WcZ/Y75d9pDpV8BRZqO9GRj4u
         s48eMJCRSDpjlKCzNBtwaiiO2d8lc4eVSfTyLAM1yjPLrTqGJy5TqEYQBEwlP0bpwLC0
         ieC2EntoV+3jU7WPBpwpb3/EjOk7MMgsmeNHF8xyUyvFQTAGp6rbMErmbHhIAQvAwh6D
         HX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998263; x=1746603063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9BcveS9bJ2hUNKExpwZbpno31qDfmJMMPHesU3EtOA=;
        b=B+GC1SEjbCp/2d7XZB2bwtKmsfTHa4pMlKPqTvrcmlttcdstyYEGsy7uFG46Ha1XSM
         lB9OgyyUTtN3vCMUxR8fSNVb7xk3p++4gKMuRI+qmSwht3J1a7ykBC89EvuN3tAr6WrX
         H4yhIcgLhMQ5AGHSMAaWYNbMdjPboEoJJrplnaweyZxyKjjoepG2JVctECDVxj05egOf
         c6m88RYspPYeHwpDgKa3GG3vp+rHu4AS2/tPgduHphYMIxCOCvYUmyAgY+9SpOBLPRxD
         JJnwcFkUg7IS2su80OEV/lPbQ0i0t8DpPP1M1JEGcjt92uSEIjYF5Qd9N0H2Hse+TqQX
         lWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6h+sUCSyVSwG6yHTgoU3GwnsQsS9CAiYty5PQJykE6/qEuKLn4oDmjVRBhOIW6sj52CCFmpUQ6nuexk52f+eV@lists.infradead.org
X-Gm-Message-State: AOJu0YzM8I6le7RJkuHNPRI+2NDKXt0WWOZUJvKX89/UYORfWdoDEAZc
	fPSbYzrVNc37OeBp+YwnQajZFp+iPOTuTD/xhsJ3zwdu7GMDkNONnxLf2wDPsBUf4+NryiIREj0
	=
X-Gm-Gg: ASbGncuafk0Lpgq3GQ+3wtZG3GxonO++TzUnx1USFmRmc/Wt6t96fCblKeOzDAwHAMw
	YilNEwrBYY0R+y9OjYKoal0vSFCbLyOYZfKU9Au88LlEirLunxGLAdd7rh5QzFc24vLTffOKPOQ
	kGUE26fLf+N09gvyCA1V1kg39glmm5daCZSt1PANtGENphaKY57n2A2jbPHceV/5csKD4/qB445
	JYMf09RbSvTkS53qIJo62rQVBOh0kd/QoFQ5hdl90uNZp3w7BYIZ9vOfFGGBLGI4M/DCoepAKoD
	kIHMj+i+HLkpKjdH+1apwSEUnyQewyKWQPWfFQkkuHQGtcZRai7Uz/oewWsMWF8=
X-Google-Smtp-Source: AGHT+IGvuUKCFE89zlztyMs58PdQPaZwbdcUg7B/Z8lPi6W5exJgXq8dwQDiTzUF/X2QftM+XSATqQ==
X-Received: by 2002:a17:903:946:b0:220:e91f:4408 with SMTP id d9443c01a7336-22df481a867mr25135935ad.22.1745998263295;
        Wed, 30 Apr 2025 00:31:03 -0700 (PDT)
Received: from thinkpad ([120.56.197.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fa2sm115884365ad.19.2025.04.30.00.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:31:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:00:56 +0530
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
Message-ID: <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423090119.4003700-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_003104_664268_F5E58AA3 
X-CRM114-Status: GOOD (  19.95  )
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

On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
> controller based on the DesignWare PCIe core.
> 
> Supports MSI via GICv2m, Single Virtual Channel, Single Function
> 
> Supports WAKE# GPIO.
> 

Mostly looks good. Just a couple of comments below.

> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  drivers/pci/controller/dwc/Kconfig      |  12 +
>  drivers/pci/controller/dwc/Makefile     |   1 +
>  drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.h |  15 +
>  4 files changed, 396 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> 

[...]

> +static int stm32_pcie_probe(struct platform_device *pdev)
> +{
> +	struct stm32_pcie *stm32_pcie;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
> +	if (!stm32_pcie)
> +		return -ENOMEM;
> +
> +	stm32_pcie->pci.dev = dev;
> +	stm32_pcie->pci.ops = &dw_pcie_ops;
> +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
> +
> +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
> +	if (IS_ERR(stm32_pcie->regmap))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
> +				     "No syscfg specified\n");
> +
> +	stm32_pcie->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(stm32_pcie->clk))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
> +				     "Failed to get PCIe clock source\n");
> +
> +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(stm32_pcie->rst))
> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
> +				     "Failed to get PCIe reset\n");
> +
> +	ret = stm32_pcie_parse_port(stm32_pcie);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, stm32_pcie);
> +
> +	ret = pm_runtime_set_active(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);

Please use dev_err_probe() here and below.

> +		return ret;
> +	}
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm_runtime_get_noresume(dev);
> +

I know that a lot of the controller drivers do this for no obvious reason. But
in this case, I believe you want to enable power domain or genpd before
registering the host bridge. Is that right? And the fact that you are not
decrementing the runtime usage count means, you want to keep it ON all the time?
Beware that your system suspend/resume calls would never get executed. 

Also in any case, you need to call this before devm_pm_runtime_enable().
Otherwise, PM core will suspend the parent and enable it during
pm_runtime_get_noresume(), which is redundant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

