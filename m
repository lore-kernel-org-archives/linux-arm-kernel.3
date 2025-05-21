Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC2EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1vjCZ2YrVOnqQdYCBx5D9PYLZqTMP3oTUsm+b3jzTw=; b=rU4UgF8HCBTafnxMLL7pPTr8vw
	AJVU2THmg5XsiUrfbEaG8B2/CaLOKjdc2/ZLvQKvGpYfTYUHtGMp13ZVaJ2Zss9YJ0ulZZHSlagqU
	XWCsyZt0y4XMPfzKlSHUf3Fh0gQjBIupPSe5vpt4xfj+bbq4vUYCOLt82Gz7WxtRTfRGnQX+SzLW1
	kXCZreJd6y/RDpcn7NF9xogThmzCjQzzc+tk8qNJpxh1HK9AiLVwqv17mUIeYLdZbup4G1B3gywtx
	R4StYgJk83ICNhaRUoUyh7RlXJifSI6QDaXon+BtNGNqTc7pRx0s+WomtjzHd+chc7gykXIsQ6I69
	QYlfi5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghm-0000000FSo3-2JSK;
	Wed, 21 May 2025 10:29:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHg0V-0000000FMRn-3Fak;
	Wed, 21 May 2025 09:45:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2DD16000A;
	Wed, 21 May 2025 09:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF46DC4CEEA;
	Wed, 21 May 2025 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820702;
	bh=FZEEaVi5Z5wlFR4wqNKg2BEAk2iE1vh3bIqVALVnJN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjhjgSnAQckzuwu9psZRqGye7MuCDKWsuflqm5RH3Ls3rFxZwJWEhyEGDklBCIq0W
	 2ok6ePTvqpDkdaG+5pULv/53UNXzidBzKJGEKQ04pahsvE4RfM8YF3y84Xkzb3AsFe
	 MNtNhQ5bXF84GoYcadh+MiZs7wuB3yE3c7WcwoDyAL5s/ebbd9O3+z44d2BtRCJmBz
	 f2LiYJ7Yqo+Uh/HxgDC2YEmn0NbzJesB6E9BBO6qqOmFSZTtCmoUi1/KH3l5wU5W9w
	 dnw7GmkVfp2UhbXPZA0VFrPIOT0aaHKj4Z3VyeDHzz8NBnW8/XW/J7EXZxdaF9hdDe
	 cf+bfYlebTF4w==
Date: Wed, 21 May 2025 11:44:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com, 
	Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 04/10] PCI: exynos: Add platform device private data
Message-ID: <20250521-cheerful-spiked-mackerel-ef7ade@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f@epcas5p4.samsung.com>
 <20250518193152.63476-5-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-5-shradha.t@samsung.com>
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

On Mon, May 19, 2025 at 01:01:46AM GMT, Shradha Todi wrote:
> -static const struct dw_pcie_ops dw_pcie_ops = {
> +static const struct dw_pcie_ops exynos_dw_pcie_ops = {
>  	.read_dbi = exynos_pcie_read_dbi,
>  	.write_dbi = exynos_pcie_write_dbi,
>  	.link_up = exynos_pcie_link_up,
> @@ -279,6 +286,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct exynos_pcie *ep;
> +	const struct samsung_pcie_pdata *pdata;
>  	struct device_node *np = dev->of_node;
>  	int ret;
>  
> @@ -286,8 +294,11 @@ static int exynos_pcie_probe(struct platform_device *pdev)
>  	if (!ep)
>  		return -ENOMEM;
>  
> +	pdata = of_device_get_match_data(dev);
> +
> +	ep->pdata = pdata;
>  	ep->pci.dev = dev;
> -	ep->pci.ops = &dw_pcie_ops;
> +	ep->pci.ops = pdata->dwc_ops;
>  
>  	ep->phy = devm_of_phy_get(dev, np, NULL);
>  	if (IS_ERR(ep->phy))
> @@ -363,9 +374,9 @@ static int exynos_pcie_resume_noirq(struct device *dev)
>  		return ret;
>  
>  	/* exynos_pcie_host_init controls ep->phy */
> -	exynos_pcie_host_init(pp);
> +	ep->pdata->host_ops->init(pp);
>  	dw_pcie_setup_rc(pp);
> -	exynos_pcie_start_link(pci);
> +	ep->pdata->dwc_ops->start_link(pci);

One more layer of indirection.

Read:
https://lore.kernel.org/all/CAL_JsqJgaeOcnUzw+rUF2yO4hQYCdZYssjxHzrDvvHGJimrASA@mail.gmail.com/

Best regards,
Krzysztof


