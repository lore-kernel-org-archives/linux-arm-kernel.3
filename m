Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87330C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEElue2tYW/hBjcRseiSqCB01x22XFA+AuPsh/D6E9s=; b=Y7nxbdDhm/RruaRAGA4YK9VA3c
	KDpBHqsIfS0ICwcLuUn4JhK2DxqJk/aTDSq+NGhH02EvD9UcMTdXobUWb91REmB6zkbiJxJqADaP8
	/qOYf7GxPUwPEHS6rv2MyT3VZP1247HxRC//39AAm6peEjkDxC0bSVcwzIG/5e5r+DOtcMGfZACPP
	bNyfUi1UAJsO+32kRrhWUGGccN8/D0pzSQ2r0rZGzJXuO9u+ByKooM290EUNvpsCuIErBxjoKO6jL
	BONYmvBgi+aD4f71dgJ4UpSen+omF18WfNW79/VDBKEpDkjbGOJXUrs0bTu6dm/HTx4WxgsHO0Z54
	FpjQRmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40pH-0000000HPuI-1QtG;
	Sun, 13 Apr 2025 17:08:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40nP-0000000HPfj-43cv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:07:05 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-ad51f427054so2567065a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564023; x=1745168823; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEElue2tYW/hBjcRseiSqCB01x22XFA+AuPsh/D6E9s=;
        b=F9DOUE+mSUqh6eo4OfvSsvT8LPsjEV+c8b7rG0z64kQqGyXezqBUgk5mhVKWUu5Yzx
         whZg2fpenXFPJPVDOFYfgjtUFFOF6lQS8T73F7zuAeb3T7L8KAMRexKrT61w4MAIXN8P
         d/sEQyycPN6E7ACnScXqeLOAZ3boRmMZtMQqjtmv3RQCArGh0cs0xOrn/F6or1ULWk75
         zzOBENftubqxU9V8j8fwnxPTSxCoDBeeH3pMuT+h+NZ8biBlxwRN++GwLngVOlZbmkdB
         y8P3hfnS1bVkCjhq8oGUpdQzTIi9ru0evNr1AB/WPaFerAOymKbk/Ib4vGuNULFiFUwB
         Mn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564023; x=1745168823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEElue2tYW/hBjcRseiSqCB01x22XFA+AuPsh/D6E9s=;
        b=Jho9prb7CLRuwNXXmrYqjbMp1BeGqYuog7VC2W6YsfPzqhwrWT87K8Qqsq2wyMqCAo
         2DlIpThvHjZSIHk8lK+IMJ4PNxtZ64RhDeFMETo/1Op6frzhg2QlMTolqhbLwqzmebh0
         Eho6ZXPna08v0JnYG/QpETihBhxwo2Z8bDguCM9nhIdcdGDZupPNF4oVvn6SYg9KJ0cY
         NdW2NfzEZNr/s0ZkIYZyUGBME8r39urZ5WPQdM0SkCK8DdmFRWTzc2/L9OotRr8XxdDU
         69G/yC532uyuoI6uZaFtpqFEZLcqsnmc3DbM5pR1T+qz5vX9bl+OVLpjOXtgsYXqjnEi
         In7Q==
X-Gm-Message-State: AOJu0Yz8cliIK1ZrlgKP+VhQ5HzlR2joC7h9sG0UpFWfHQJ8jtYf/2C9
	j1vG28CVNs9TdrZqbhYxRBWWvkQZZPwztVtYDLB/SZg0iIT7AGaPO/Nyauq0rg==
X-Gm-Gg: ASbGncsVd0gN+ApBYnBVUO1RGiixkLf4EHjYOnUAMJcVXBkDJG0JFEjUpHBON0PkRaX
	YoSDiy7waOkeFrL1DqUVxD5y5OUcd12Lral4C7FzVeFPIDV0DomIL3/82IUWU3KC8/Q5YDhUn5Q
	duIbkdGnAXpQYPN2ZFjOX2cX1VkLmH1n20il5Flmt+aaEhvuMqGnB9cya1/FwzXEI7FeRer7mtQ
	obB4Jd8EGinVNWrXirU5QyIWu2ioWPZ/1WcVcSA1PgDLgjwv72d7p0yYANQCFNknvtkcjj7zEm+
	zvRwd+iLwz68QBzMLDe5rBCii3uhawP583dPKO171gBS0rZ0hp2J
X-Google-Smtp-Source: AGHT+IFzcTIcJAVCdciwF5W12Gs6hhpKts4y4tqwIfl35r96ytiQ8WM9loQM2BZkZ8y249PrujZoeg==
X-Received: by 2002:a17:90b:5245:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-308236640a9mr15187310a91.11.1744564022954;
        Sun, 13 Apr 2025 10:07:02 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c35sm85022145ad.143.2025.04.13.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:07:02 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:36:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 05/13] PCI: apple: Move over to standalone probing
Message-ID: <mcb56cuupmguo3eeinj5b2bk67aki4optle5ht2hu7a5eskpxu@qmngxpm2lmrn>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_100704_014205_74DED543 
X-CRM114-Status: GOOD (  27.35  )
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

On Tue, Apr 01, 2025 at 10:17:05AM +0100, Marc Zyngier wrote:
> Now that we have the required infrastructure, split the Apple PCIe
> setup into two categories:
> 
> - stuff that has to do with PCI setup stays in the .init() callback
> 
> - stuff that is just driver gunk (such as MSI setup) goes into a
>   probe routine, which will eventually call into the host-common
>   code
> 
> The result is a far more logical setup process.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 54 ++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 842f8cee7c868..d07e488051290 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -730,35 +730,15 @@ static void apple_pcie_disable_device(struct pci_host_bridge *bridge, struct pci
>  
>  static int apple_pcie_init(struct pci_config_window *cfg)
>  {
> +	struct apple_pcie *pcie = cfg->priv;
>  	struct device *dev = cfg->parent;
> -	struct platform_device *platform = to_platform_device(dev);
>  	struct device_node *of_port;
> -	struct apple_pcie *pcie;
>  	int ret;
>  
> -	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> -	if (!pcie)
> -		return -ENOMEM;
> -
> -	pcie->dev = dev;
> -
> -	mutex_init(&pcie->lock);
> -
> -	pcie->base = devm_platform_ioremap_resource(platform, 1);
> -	if (IS_ERR(pcie->base))
> -		return PTR_ERR(pcie->base);
> -
> -	cfg->priv = pcie;
> -	INIT_LIST_HEAD(&pcie->ports);
> -
> -	ret = apple_msi_init(pcie);
> -	if (ret)
> -		return ret;
> -
>  	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
> -			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
> +			dev_err(dev, "Port %pOF setup fail: %d\n", of_port, ret);
>  			of_node_put(of_port);
>  			return ret;
>  		}
> @@ -778,14 +758,40 @@ static const struct pci_ecam_ops apple_pcie_cfg_ecam_ops = {
>  	}
>  };
>  
> +static int apple_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct apple_pcie *pcie;
> +	int ret;
> +
> +	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> +	if (!pcie)
> +		return -ENOMEM;
> +
> +	pcie->dev = dev;
> +	pcie->base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pcie->base))
> +		return PTR_ERR(pcie->base);
> +
> +	mutex_init(&pcie->lock);
> +	INIT_LIST_HEAD(&pcie->ports);
> +	dev_set_drvdata(dev, pcie);
> +
> +	ret = apple_msi_init(pcie);
> +	if (ret)
> +		return ret;
> +
> +	return pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
> +}
> +
>  static const struct of_device_id apple_pcie_of_match[] = {
> -	{ .compatible = "apple,pcie", .data = &apple_pcie_cfg_ecam_ops },
> +	{ .compatible = "apple,pcie" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, apple_pcie_of_match);
>  
>  static struct platform_driver apple_pcie_driver = {
> -	.probe	= pci_host_common_probe,
> +	.probe	= apple_pcie_probe,
>  	.driver	= {
>  		.name			= "pcie-apple",
>  		.of_match_table		= apple_pcie_of_match,
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

