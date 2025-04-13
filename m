Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9812DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=; b=WYigR4qrr1hM/yHdcB+kyiReQz
	CzH0MBqSEsv9Gal5QvYzBr626wkLyH/cuMTXDN8gw+VoUFI9FQkHt7AK0Hpdxs0pHhDmHUATX7hZ0
	JpqhSzQnLeI8RqMEAyu0Ux+YKinYhc26qLVYXhTxHmBT9n+neRMKWdJkpWSVXUpsbJWnZJNWQDEG9
	TpP+fKqOffMY5A0K8kpKUuFhSsjoNbLRnQWoLoTPFqk0ytoaj88ZwHvWycbHaQarR7RHXVAwDNv82
	wx9UKFVjLLVlBRnrHDlASmyCOWiu19UYueu23lgJUW2boz80SPsOSNJXoeR8kQ1GV5HbE9cF6mnAN
	yTvxCRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u416e-0000000HSPr-1g3v;
	Sun, 13 Apr 2025 17:26:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u413y-0000000HRWa-3mul
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:24:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736c3e7b390so2922949b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744565050; x=1745169850; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=WZPJdVwDDZfGqkIhoPxV2U/wWGMbd5E2ZeEriPvQAO+tdHfl/CD2lEa4u/u8cqGSQz
         JZzLht2FDHa62mp3jP4k7oaJuDhBX/iTWPhCw9Wznp5/hldrO/cC38WfbfQ/FQqTHCJn
         UWiV8YhFo7nJtna2IaxxSBJtUivAuz/zyFtEwnTYx74GgyZXJcGWBmFN2lKiB/vHf91J
         v7+oUatm+YvWZkxhioxDv1O0GRE3TYFkxsSzoltGzljrMER1TRaRsTWf1EQ/9RgpcAk7
         T4xgqvC6fhlG2MaAjfitruWnJw3sQLmT/Dk3SuwGFWz6/rXOrE3z9clnB3xvS7mV5kgJ
         c2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744565050; x=1745169850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=SqLMT3oKnhCmc1VGB9kPgWUrXtV2bRscoeypK3JFyfiUfV6VxQ2nmBcytzSXZY6b7B
         +v/78CsUmwK8+2r9zqTqd196X6bp+Tm7DfPtrH09vx34/2tU29Bs4ZangTJyXrk6m4Sh
         QnNFh4mx0srcgIFORrFHNgiZoY61wwUHiyBQ7CbhsnjKTClx3nSnda9gvIuQqG+xrUSA
         d6OYhyvhxna8+ehmE0nuEGv6hwlLhvXBt0mZ7SlPAwrdKipSo3N13D+hgyqUPDdBw4//
         7rkI5FnKJ6Rf8g9h2cmyiT0Tnv16J2vvYAqY2EOjixqL0Bc+hHwrjxY+flX/9j+aUBcp
         DNXQ==
X-Gm-Message-State: AOJu0YzjrxrU9Y0aeMdtz7kFSxZ4bq2gYiCUFj6V36WQfHlF3B0UowvL
	LEQxxocWKMMwNNTu3y/aaGO+p0fGddpfhlXBZWfl+ZkkAFV9X7P4o5MCRbUj+Q==
X-Gm-Gg: ASbGncvwW5YONP4tt+Z1Ua+pYhu3MMNtst1PZI0A3bjnqmivjQMFWSkCrQLjGzqWeYy
	g/nlr+qsPKDJ+phGCaSYrIoVWzVgQp8ywALz3d5T0gMSILS3rza9iAns33YOJBHaPJdvjX8NHHP
	gP5uiSDUqC7fLj278y/Jzk8dCVQTf3+zois1PGj1I4uUNfQH2FdJfp0PDpQtUy2Mn+jPJe9viPY
	ig00d0cx53ORablgCneezJ8tPAAvN3WCELiSPSxYtPCes1JRa4fV8SZuxOPYkZ08syaXFy8OPqI
	QOZ3W0LxIo2SAbPonQIPzGbCQM0ZmBxRMMweLeISmwCj4r7PQ2tE
X-Google-Smtp-Source: AGHT+IFM+YdieMiL9r0SStfI5t0k0rConT5oK7CRUa4UafAiZdqdwpgSv57rF8TAB6+nr1CsWpsXWQ==
X-Received: by 2002:a05:6a00:2e27:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-73bd12657e3mr11703409b3a.16.1744565049844;
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm5153419b3a.157.2025.04.13.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:54:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 13/13] PCI: apple: Add T602x PCIe support
Message-ID: <3mwdadqtt7733nq2okj47a5rsztgxuip3ukfsy44l7hhh2z7o5@njrv5c5l5fh7>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-14-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-14-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_102410_941487_2E55ECDA 
X-CRM114-Status: GOOD (  22.78  )
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

On Tue, Apr 01, 2025 at 10:17:13AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This version of the hardware moved around a bunch of registers, so we
> avoid the old compatible for these and introduce register offset
> structures to handle the differences.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 847cba753d28d..5b85d9497070c 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -124,6 +124,13 @@
>  #define   PORT_TUNSTAT_PERST_ACK_PEND	BIT(1)
>  #define PORT_PREFMEM_ENABLE		0x00994
>  
> +/* T602x (M2-pro and co) */
> +#define PORT_T602X_MSIADDR	0x016c
> +#define PORT_T602X_MSIADDR_HI	0x0170
> +#define PORT_T602X_PERST	0x082c
> +#define PORT_T602X_RID2SID	0x3000
> +#define PORT_T602X_MSIMAP	0x3800
> +
>  #define PORT_MSIMAP_ENABLE	BIT(31)
>  #define PORT_MSIMAP_TARGET	GENMASK(7, 0)
>  
> @@ -158,6 +165,18 @@ static const struct hw_info t8103_hw = {
>  	.max_rid2sid		= 64,
>  };
>  
> +static const struct hw_info t602x_hw = {
> +	.phy_lane_ctl		= 0,
> +	.port_msiaddr		= PORT_T602X_MSIADDR,
> +	.port_msiaddr_hi	= PORT_T602X_MSIADDR_HI,
> +	.port_refclk		= 0,
> +	.port_perst		= PORT_T602X_PERST,
> +	.port_rid2sid		= PORT_T602X_RID2SID,
> +	.port_msimap		= PORT_T602X_MSIMAP,
> +	/* 16 on t602x, guess for autodetect on future HW */
> +	.max_rid2sid		= 512,
> +};
> +
>  struct apple_pcie {
>  	struct mutex		lock;
>  	struct device		*dev;
> @@ -425,6 +444,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  	/* Disable all interrupts */
>  	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
> +	writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
>  
> @@ -865,6 +885,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id apple_pcie_of_match[] = {
> +	{ .compatible = "apple,t6020-pcie",	.data = &t602x_hw },
>  	{ .compatible = "apple,pcie",		.data = &t8103_hw },
>  	{ }
>  };
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

