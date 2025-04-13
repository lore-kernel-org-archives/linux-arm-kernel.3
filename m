Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AF6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4okzS3ojN6lnY5RLqGdFM+gAcZSW3E4D3okjWrQCtE=; b=dNLfCLYAb0OkeX8CW2z8hMr1FV
	YBRp5B4uw+jzp+KlsQwBuhHtw4sr8dK+zqiJZLctA6QRPd0dC2JGbQxnWkoIRjBPnrrzeazkPTwSO
	+PIoNVhu64OaqNWVU8a3WWJtjJMV+nB4xYghIlybACSP04vWj36Y7wdSc6fXzFHz9fl0jqoD4mEed
	f8jg0r1sVhgHU7mLCuIsBr1OoDJe5kqN47rYZzRrz0NSJ95IZlCFjNLO7Snv1u8xc9dDefMoKluoJ
	s1My7nJR4rAyKcH42AX/ArJnTEB0CckegReHMIOFRxuyJ0mwMfw5URhqrk+JOo/lWzPeBBAxvjAkY
	TAzNjwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40y5-0000000HQwo-1ZDi;
	Sun, 13 Apr 2025 17:18:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40wC-0000000HQk9-3Sap
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 17:16:10 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so2316566a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564568; x=1745169368; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F4okzS3ojN6lnY5RLqGdFM+gAcZSW3E4D3okjWrQCtE=;
        b=mqJRQ6DJN3nshMeYvIe5xn4THocOLcnG5M04TobKP2LdqsMT0WwbGBN2jR43epIbSS
         Yvw2cO6Xh6jwHgv7naXKcDZCOCU6OjE8KWKE5FJAca15GhXcJk+TE0r+LDHQcSqe0mRj
         GJvyoPDC8cVkDGvXIV0Zx3mURqmQl/bw7aZG1WGhWVu8ULDngEyDPmBUh3H0lQif3SsL
         hDdayN8HBLq/UviI4ojGCBylS5l14ny9iy+s1S6hrZJJjyNk9xEBXp2NDvrs66ovybIs
         ++lxMpPbpepaasf4sjC5JxZoDWPb4m3MSZIR9JOdWC0FcK07eAW2HoKf4cYzuVmgyakE
         107g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564568; x=1745169368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4okzS3ojN6lnY5RLqGdFM+gAcZSW3E4D3okjWrQCtE=;
        b=Qoz6ZP82cqwdg0LoAR4A+wpQYG58wNRb7FrroMA7vsq/SA2ZKv258iEjBDtEGdIgwz
         VnNSOqUzk/6IOy9sWr00/6+ISjyvJReS8QyT5AKBKyyP90TnBUbHOCooBaCGcHs7Ypou
         Fs3NdXcxLHPd7KeSULU8bbEPo7EQHBg/65u+Xfy6X625/BtV2PSickOHAgS8yQyhpYF3
         aKkkX6X/fxPc2GCbhc3cz0kM+7sP03+OBS1dQkK2AcESeLvyYNYR2OvWsAGjXEPgBY90
         n/jf4A84O3WDiBN1pS1pNAhAlMSgdv44bkbwyuw5n89ljbdp3oxqroScYs1/cwuWfY12
         A2ng==
X-Gm-Message-State: AOJu0YyksgRfnnRpdQY919puav8X272awmrzAzwUzuw+QeXhNGnCTI2Q
	hFkKu/RlUhasWUbir8Vf7KKCin6z+RsXaa7lFdvW0OpAkQGQUGw1QRM2icASxg==
X-Gm-Gg: ASbGnctRXlV8CYPmwmI38TcArRgBEiMgkd88A9b2prLfB4dj7ppRJbXKBsUKJ9S76ps
	nY7Dg0DQyVRHCmwcuC0xlCECwgZ+4nMTU1lE9oJbnR4g3rrvo7KbYS9EH89nI9YWWjVZBi3CbIz
	xZVitwyKLtgRdJY4m/T4kMblye+ydZ1pXpEHP532AcPgihgxfrROJhkk6shvBg+wclocQXJNK0h
	bhUDSfNJc+lq2EeOTeTbIUBwCm3iseut7hq0/JGV6T/h7awrgEue1LdJKxB4olvjv97SqsXX2fG
	ayL4PCu3epT6o41/BBgBha5erwA472kUAaZcfEIiXX0DBJAn1/DyHMrN08MLCDw=
X-Google-Smtp-Source: AGHT+IF3vhmu+FLpO8zsp8cPRlhnO7CmvXQvRW7kWOQy1JPST9WHz5upmUYj9aLgD93hoRV5zqzCaQ==
X-Received: by 2002:a17:90b:2b44:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-308237f2b39mr14281049a91.31.1744564567714;
        Sun, 13 Apr 2025 10:16:07 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm9724031a91.46.2025.04.13.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:16:07 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:46:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 09/13] PCI: apple: Move port PHY registers to their
 own reg items
Message-ID: <fvjlxc2gwhhs2sv5mbag7m43s5cbmuyygjvlynpkq2jd43bqlm@pcgwo3usbdyf>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-10-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-10-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_101608_872510_5A15D00C 
X-CRM114-Status: GOOD (  23.34  )
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

On Tue, Apr 01, 2025 at 10:17:09AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> T602x PCIe cores move these registers around. Instead of hardcoding in
> another offset, let's move them into their own reg entries. This matches
> what Apple does on macOS device trees too.
> 
> Maintains backwards compatibility with old DTs by using the old offsets.
> 
> Note that we open code devm_platform_ioremap_resource_byname() to avoid
> error messages on older platforms with missing resources in the pcie
> node. ("pcie-apple 590000000.pcie: invalid resource (null)" on probe)
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 55 +++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 23d9f62bd2ad4..94c49611b74df 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -39,14 +39,18 @@
>  #define   CORE_RC_STAT_READY		BIT(0)
>  #define CORE_FABRIC_STAT		0x04000
>  #define   CORE_FABRIC_STAT_MASK		0x001F001F
> -#define CORE_LANE_CFG(port)		(0x84000 + 0x4000 * (port))
> -#define   CORE_LANE_CFG_REFCLK0REQ	BIT(0)
> -#define   CORE_LANE_CFG_REFCLK1REQ	BIT(1)
> -#define   CORE_LANE_CFG_REFCLK0ACK	BIT(2)
> -#define   CORE_LANE_CFG_REFCLK1ACK	BIT(3)
> -#define   CORE_LANE_CFG_REFCLKEN	(BIT(9) | BIT(10))
> -#define CORE_LANE_CTL(port)		(0x84004 + 0x4000 * (port))
> -#define   CORE_LANE_CTL_CFGACC		BIT(15)
> +
> +#define CORE_PHY_DEFAULT_BASE(port)	(0x84000 + 0x4000 * (port))
> +
> +#define PHY_LANE_CFG			0x00000
> +#define   PHY_LANE_CFG_REFCLK0REQ	BIT(0)
> +#define   PHY_LANE_CFG_REFCLK1REQ	BIT(1)
> +#define   PHY_LANE_CFG_REFCLK0ACK	BIT(2)
> +#define   PHY_LANE_CFG_REFCLK1ACK	BIT(3)
> +#define   PHY_LANE_CFG_REFCLKEN		(BIT(9) | BIT(10))
> +#define   PHY_LANE_CFG_REFCLKCGEN	(BIT(30) | BIT(31))
> +#define PHY_LANE_CTL			0x00004
> +#define   PHY_LANE_CTL_CFGACC		BIT(15)
>  
>  #define PORT_LTSSMCTL			0x00080
>  #define   PORT_LTSSMCTL_START		BIT(0)
> @@ -146,6 +150,7 @@ struct apple_pcie_port {
>  	struct apple_pcie	*pcie;
>  	struct device_node	*np;
>  	void __iomem		*base;
> +	void __iomem		*phy;
>  	struct irq_domain	*domain;
>  	struct list_head	entry;
>  	unsigned long		*sid_map;
> @@ -476,26 +481,26 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
>  	if (res < 0)
>  		return res;
>  
> -	rmw_set(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
> -	rmw_set(CORE_LANE_CFG_REFCLK0REQ, pcie->base + CORE_LANE_CFG(port->idx));
> +	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
> +	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
>  
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
> -					 stat, stat & CORE_LANE_CFG_REFCLK0ACK,
> +	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
> +					 stat, stat & PHY_LANE_CFG_REFCLK0ACK,
>  					 100, 50000);
>  	if (res < 0)
>  		return res;
>  
> -	rmw_set(CORE_LANE_CFG_REFCLK1REQ, pcie->base + CORE_LANE_CFG(port->idx));
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
> -					 stat, stat & CORE_LANE_CFG_REFCLK1ACK,
> +	rmw_set(PHY_LANE_CFG_REFCLK1REQ, port->phy + PHY_LANE_CFG);
> +	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
> +					 stat, stat & PHY_LANE_CFG_REFCLK1ACK,
>  					 100, 50000);
>  
>  	if (res < 0)
>  		return res;
>  
> -	rmw_clear(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
> +	rmw_clear(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
>  
> -	rmw_set(CORE_LANE_CFG_REFCLKEN, pcie->base + CORE_LANE_CFG(port->idx));
> +	rmw_set(PHY_LANE_CFG_REFCLKEN, port->phy + PHY_LANE_CFG);
>  	rmw_set(PORT_REFCLK_EN, port->base + PORT_REFCLK);
>  
>  	return 0;
> @@ -515,6 +520,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	struct platform_device *platform = to_platform_device(pcie->dev);
>  	struct apple_pcie_port *port;
>  	struct gpio_desc *reset;
> +	struct resource *res;
> +	char name[16];
>  	u32 stat, idx;
>  	int ret, i;
>  
> @@ -542,10 +549,22 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  
>  	raw_spin_lock_init(&port->lock);
>  
> -	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
> +	snprintf(name, sizeof(name), "port%d", port->idx);
> +	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
> +	if (!res)
> +		res = platform_get_resource(platform, IORESOURCE_MEM, port->idx + 2);
> +
> +	port->base = devm_ioremap_resource(&platform->dev, res);
>  	if (IS_ERR(port->base))
>  		return PTR_ERR(port->base);
>  
> +	snprintf(name, sizeof(name), "phy%d", port->idx);
> +	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
> +	if (res)
> +		port->phy = devm_ioremap_resource(&platform->dev, res);
> +	else
> +		port->phy = pcie->base + CORE_PHY_DEFAULT_BASE(port->idx);
> +
>  	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
>  
>  	/* Assert PERST# before setting up the clock */
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

