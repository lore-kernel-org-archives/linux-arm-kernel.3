Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E1DC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWIuLilHx+0m0PNW09Z0k4xV/guGg8/Qmv8ZqaHqGFA=; b=Gr/+Gnd5ML2DSpmBGqbFR/YZw8
	lWGxKsvZwxZd+49ILva8oy9BFYmedHjPQioKQp6WfOWhQKkYf3z+EtO1ILBi7csNnC1AivLIglqSi
	vLiQVBA6Hu/weJvujitjvTwfI0UUk475AfZAXCTFZU0/O9vNhJM9lYFsQSrpMVJKujk6EWFrffESs
	09CmGch5UAa4XS6tmGmtEqAwNLRB50qnfiiXMqGyri5H3Kal58vdh/rL2DYsIeLBO7sG3lc7KeR7N
	vwe/4CZfG6eM3SDADCgNgECl1QvGvLODJPWuLe4DuH09umbZ04DVSwHNUzv3TPsR6RGdlOoRFjN7l
	imGRKy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u63iw-000000012nv-0FJk;
	Sat, 19 Apr 2025 08:38:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u63h1-000000012a8-2smx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 08:36:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736c277331eso3269815b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745051815; x=1745656615; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWIuLilHx+0m0PNW09Z0k4xV/guGg8/Qmv8ZqaHqGFA=;
        b=GsP0I+oNLhKdxue3j4wtkzzCCSJzxm5tb5+7+D2hmBVFtiDZcfvrSEoelhFkRX9DLn
         HTtQaqPhR13fsBTOBKNmB1V8Ow6IV1oAM5IMIVgLuk9NA5X5lzHS/JR5hVQOB/Rfm8HC
         jC0egWzreRnE2F066m3bcFpw6UVAJceP03x5T45YzrI/EMGa78gmqvZ+pKJpwBnFHWym
         DaH0lVa39YtjR7wwsk6SF7fvs1wTW2ofI6osDDNTqTRYmqOT60FJauy12n4dNi0Vyf7L
         MmNUaXYWDqn5KUe0M8Q4YO5qVXVY256EBzCa4a19cPzA9T5ccs9WTGlJL8FeEO6L1OnY
         iMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745051815; x=1745656615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWIuLilHx+0m0PNW09Z0k4xV/guGg8/Qmv8ZqaHqGFA=;
        b=KRGDAvGkmfqU8x0vayMS+UmUWg18KvLOuMQZuVr0MKcZucWngzpbVCAWLxVWXZQL1y
         2enW3+OZSmtoUtgWZ0QmYi2AJU8tBY53KA9JXL021voCRKt3SMqNbburt3Xwk8vpEaX8
         fpGV2NfT/7ok7uMGowSyjCgozBpy4OJHmaAecBmucmCCnDGcej+Sln2+fq0WnRg+cfoj
         UbqDsxFIY1l2lZAGjfULWZEBMItsjEM/rad1zLnuorGQeF+XqClQ4gjDPWvcXHJhrzGp
         bYmCsTZqW8bzj48LDlKixt5cPwvwV594XGhZYrJ/T2wL2iS7A3d/CEMeMXQ+w+/2mQtF
         +DYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvtYJz9zyk56Hm4KJ1LBEX++fxD5xFcDSTOxBHVqX5VzYn7khRl+TKRb2BLv4brgfiEbgvmI0UKUFwwY8uaMve@lists.infradead.org
X-Gm-Message-State: AOJu0YzO/ttB/vozM1W4FrMajbChA7KWen1b6pQjXWqUo2SSrKoJdFmm
	e0qRsGCmKj6X5Ly6HslQfMgvuQPoMGYosMvZ+ETmXuIg9Wn60/e9lZMcjEHMhQ==
X-Gm-Gg: ASbGncsDw8/8w0hkBBuMyYo36XLvG45zuYckIzIGQS8CHHgkRy/sXJnde2+wSBgxUyi
	ghsEuB9NLnjo3YvDy/OQgUoUst90JThAj6HRW+TuiFyYzhhA20cqwXt6+nBwkiT5q3ZIkjj5vN0
	6G4qTLJwTkeCCSeaIOffmCX7SyI+y7oeHX12uJke45EIBQGRaIpUIfR1w7HZPTIxb4GNvZENSEF
	up+2fhFbIA9wE0ZqBYNuAcy2/fACOt5M/vk5C9sr5X4ezRPWNAuj95zW0ytCO7nkfIy6buzThIh
	GzBFhTiu+w2RTgundsL7vffLSz5nh9uutIEKX8zwVMP+qcaBeDo5fA3pprOIjQ==
X-Google-Smtp-Source: AGHT+IH3NDcdNNb8pbSv2t3bDQf2H8zk313Y64ucJBKvLy8gNjS7N5oRSvDjpG+wLPNMUPr2fDtP/Q==
X-Received: by 2002:a05:6a20:9c9a:b0:1f3:20be:c18a with SMTP id adf61e73a8af0-203cc60880bmr6254890637.10.1745051814740;
        Sat, 19 Apr 2025 01:36:54 -0700 (PDT)
Received: from thinkpad ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db14488casm2467771a12.56.2025.04.19.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 01:36:54 -0700 (PDT)
Date: Sat, 19 Apr 2025 14:06:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <oiwee2kiwex6dz3scmvpwc2x25tq4qmdah6kcvgqhhukmku3uj@va465i7ofstd>
References: <20250107052108.8643-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107052108.8643-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_013655_739898_1BE8B780 
X-CRM114-Status: GOOD (  23.71  )
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

On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> Remove the usage of virt_to_phys, as it will cause sparse warnings when
> building on some platforms.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

I'm changing the status of this patch as 'Changes Requested' in patchwork. Feel
free to submit the next iteration incorporating review comments.

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 3bcfc4e58ba2..dc1e5fd6c7aa 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -178,6 +178,7 @@ struct mtk_pcie_soc {
>   * @phy: pointer to PHY control block
>   * @slot: port slot
>   * @irq: GIC irq
> + * @msg_addr: MSI message address
>   * @irq_domain: legacy INTx IRQ domain
>   * @inner_domain: inner IRQ domain
>   * @msi_domain: MSI IRQ domain
> @@ -198,6 +199,7 @@ struct mtk_pcie_port {
>  	struct phy *phy;
>  	u32 slot;
>  	int irq;
> +	phys_addr_t msg_addr;
>  	struct irq_domain *irq_domain;
>  	struct irq_domain *inner_domain;
>  	struct irq_domain *msi_domain;
> @@ -393,12 +395,10 @@ static struct pci_ops mtk_pcie_ops_v2 = {
>  static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> -	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>  	msg->address_hi = 0;
> -	msg->address_lo = lower_32_bits(addr);
> +	msg->address_lo = lower_32_bits(port->msg_addr);
>  
>  	msg->data = data->hwirq;
>  
> @@ -510,10 +510,8 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
>  static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  {
>  	u32 val;
> -	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> -	val = lower_32_bits(msg_addr);
> +	val = lower_32_bits(port->msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
>  	val = readl(port->base + PCIE_INT_MASK);
> @@ -913,6 +911,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  	struct mtk_pcie_port *port;
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct resource *regs;
>  	char name[10];
>  	int err;
>  
> @@ -921,12 +920,18 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  		return -ENOMEM;
>  
>  	snprintf(name, sizeof(name), "port%d", slot);
> -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
> +	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!regs)
> +		return -EINVAL;
> +
> +	port->base = devm_ioremap_resource(dev, regs);
>  	if (IS_ERR(port->base)) {
>  		dev_err(dev, "failed to map port%d base\n", slot);
>  		return PTR_ERR(port->base);
>  	}
>  
> +	port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> +
>  	snprintf(name, sizeof(name), "sys_ck%d", slot);
>  	port->sys_ck = devm_clk_get(dev, name);
>  	if (IS_ERR(port->sys_ck)) {
> -- 
> 2.46.0
> 

-- 
மணிவண்ணன் சதாசிவம்

