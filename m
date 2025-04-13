Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFB4C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KYqWXMPG9QT4+d9/EIsutHTMWrOQHXovJYmJ2amFCQ=; b=UO+PlaoLyDu5g3+/fFLHTIqvQy
	n3PDxWvLyiI7v4OhlxL6S6gghO6W8DC/d3M6+3Hs5ME9umg8V1DgojoxZ0xrivyk5eqO6IwYKpQcd
	RxKPlGhDGPaZvI19tCIIk/kzf6mTMc7pS7+9eZnULXvbx+OZkHeAmFtWhbmH4QdZ6SizeyrFDPTaa
	0WR5ULSeSTXLHn2CaHzHUPh/nYoRnN07oR4/voLcH4pSLO8/yqv2L4/93c+YsXGVoVoVbWbSZa2As
	CE9E5aPuHJGFhHBB7YVwXwMNA8FcMb5aLcRNVt6ijw252JZmXrV7LRHrbwDgNlJ3eDJr6KaI07wnq
	RUPhXyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40ld-0000000HPWk-3zAj;
	Sun, 13 Apr 2025 17:05:13 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40jn-0000000HPIz-1FfS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:03:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7399838db7fso3346301b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563798; x=1745168598; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KYqWXMPG9QT4+d9/EIsutHTMWrOQHXovJYmJ2amFCQ=;
        b=xTERPvGKBW2WIW9lVDQfjbDCTLtrj8omw7eRqeYqgPo1f8P2//enSP0dYh8IAS3PEY
         aS2ppmjrGXbtTXvV/ls9zoEeDgftjDqIpO/yPZNjTfK8cjaeMJgqQR+K2Gl9iF8uRgo+
         RycTXev36BjEYj/BmkXBxZKoKPu3i73P+b5h5gFCOC7hFvUggFi0N5ypa97hnGpbCXVD
         Tepb0JiKyKf5hVHCD7AHBc38Gzmj46i7UwKLnLd2J5kJLUXiLlUakPLHUFFZG0Kf35Ea
         Gkr/F4SOR18PYzLr5MVuJpqZVp9C7Vxg7aKihhh9Z161qlIXGHCf6dfhIbPAjlbyNsSC
         Ieuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563798; x=1745168598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KYqWXMPG9QT4+d9/EIsutHTMWrOQHXovJYmJ2amFCQ=;
        b=DFJmEqxkWooTuucRs5dOLWVvOPK/OaF7MWESpfza31KPsALULghC9Nh8uxetApmzvG
         Aoj98Nqwppf5i5QyWna/X1ZvCsHB7UfsbVK8QGixxYtgefw0AETzxkhGJfFAYf3BtmAg
         CgvnLru1AzqZq89V5t7ZlqRWAwNBDAWckkMONjYWyg9IT0Korcb7OVTpJiPJxWRGegEz
         nz7+oc4Nmkzn/il55OgGRGzqzSpZqbqsBqSe/H/rmyefA3Gxoh51REe/J2RjiyUHqyiJ
         uTbOOEqWWM9RTJZzFJHD7DHa6+QxggDQrpnIfrso945IklQOIcbq4rvrse/By6xgu+6r
         Nmug==
X-Gm-Message-State: AOJu0YwRNkn+PeHM+F1baWHUbYa1UqA4pSwIbEExar28rcDWepTsySFH
	1EvsDyrhR/+n1xoFFjV8t5LMJuSZwrXoOibfSwzoHhGWtaozVZkw+UYblvY6Cg==
X-Gm-Gg: ASbGnctmpUTrBrsjLSMemk5Yy90Ot5UNv/9URnKnQ/DLZyHL5hB6m1i3wy6PpZNTxnA
	RyKaOW77rELqCT/52g0x1d6XUDdCORIZi3SvFkFxIAX7T5bspSl4GcK0JmGSoKENXZgmn+Z3/qz
	BGj4wNOb6a7GjDKlP6puJuLGuFsTOv2YIEaubbgJiOZfJbyt56javeUR17oWoASVf1ELuWh4SxW
	S0KiMOjxXXTxSL2LdB7SUqChEXVlrBFClqus9DUShzuAHPVNwL8Vb5y56jhCNldAVli0YAoguKx
	l73QtvLcdJ1varwC9NbnXVvvhvkW/WUm6Bimf5AvKv2oy2nVd0iM
X-Google-Smtp-Source: AGHT+IHJl9qy9zlA671Ghf76u4hAfg8o0WkGbqOTRDuANRuFVtoUszAvnmcGPP3MsPAP/4ftUIljgw==
X-Received: by 2002:a05:6a20:c995:b0:1f0:e2b9:d163 with SMTP id adf61e73a8af0-2016a1cfeacmr20268545637.12.1744563798241;
        Sun, 13 Apr 2025 10:03:18 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a08180e2sm8053734a12.14.2025.04.13.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:03:17 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:33:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 03/13] PCI: host-generic: Extract an ecam bridge
 creation helper from pci_host_common_probe()
Message-ID: <bgawumksxn3dbiwu6oeifte4wxcwqed63x5kkvgyeg4emtfqmz@biaouwkqsag5>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_100319_343054_06FC6DB6 
X-CRM114-Status: GOOD (  31.69  )
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

On Tue, Apr 01, 2025 at 10:17:03AM +0100, Marc Zyngier wrote:
> pci_host_common_probe() is an extremely userful helper, as it
> abstracts away most of the gunk that a "mostly-ECAM-compliant"
> device driver needs.
> 
> However, it is structured as a probe function, meaning that a lot
> of the driver-specific setup has to happen in a .init() callback,
> after the bridge and config space have been instantiated.
> 
> This is a bit awkward, and results in a number of convolutions
> that could be avoided if the host-common code was more like
> a library.
> 
> Introduce a pci_host_common_init() helper that does exactly that,
> taking the platform device and a struct pci_ecam_op as parameters.
> 
> This can then be called from the probe routine, and a lot of the
> code that isn't relevant to PCI setup moved away from the .init()
> callback. This also removes the dependency on the device match
> data, which is an oddity.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pci-host-common.c | 24 ++++++++++++++++--------
>  include/linux/pci-ecam.h                 |  2 ++
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index f441bfd6f96a8..466a1e6a7ffcd 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -49,23 +49,17 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
>  	return cfg;
>  }
>  
> -int pci_host_common_probe(struct platform_device *pdev)
> +int pci_host_common_init(struct platform_device *pdev,
> +			 const struct pci_ecam_ops *ops)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct pci_host_bridge *bridge;
>  	struct pci_config_window *cfg;
> -	const struct pci_ecam_ops *ops;
> -
> -	ops = of_device_get_match_data(&pdev->dev);
> -	if (!ops)
> -		return -ENODEV;
>  
>  	bridge = devm_pci_alloc_host_bridge(dev, 0);
>  	if (!bridge)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, bridge);
> -
>  	of_pci_check_probe_only();
>  
>  	/* Parse and map our Configuration Space windows */
> @@ -73,6 +67,8 @@ int pci_host_common_probe(struct platform_device *pdev)
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> +	platform_set_drvdata(pdev, bridge);
> +
>  	bridge->sysdata = cfg;
>  	bridge->ops = (struct pci_ops *)&ops->pci_ops;
>  	bridge->enable_device = ops->enable_device;
> @@ -81,6 +77,18 @@ int pci_host_common_probe(struct platform_device *pdev)
>  
>  	return pci_host_probe(bridge);
>  }
> +EXPORT_SYMBOL_GPL(pci_host_common_init);
> +
> +int pci_host_common_probe(struct platform_device *pdev)
> +{
> +	const struct pci_ecam_ops *ops;
> +
> +	ops = of_device_get_match_data(&pdev->dev);
> +	if (!ops)
> +		return -ENODEV;
> +
> +	return pci_host_common_init(pdev, ops);
> +}
>  EXPORT_SYMBOL_GPL(pci_host_common_probe);
>  
>  void pci_host_common_remove(struct platform_device *pdev)
> diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
> index 3a10f8cfc3ad5..bc2ca2c72ee23 100644
> --- a/include/linux/pci-ecam.h
> +++ b/include/linux/pci-ecam.h
> @@ -97,6 +97,8 @@ extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
>  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
>  /* for DT-based PCI controllers that support ECAM */
>  int pci_host_common_probe(struct platform_device *pdev);
> +int pci_host_common_init(struct platform_device *pdev,
> +			 const struct pci_ecam_ops *ops);
>  void pci_host_common_remove(struct platform_device *pdev);
>  #endif
>  #endif
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

