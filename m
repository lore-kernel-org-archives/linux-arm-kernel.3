Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F49C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mefQhuFSpESwaWyEeCQcodcETTlSwT/UegGsRwZi/b0=; b=T3Di/6+IFld37x6MHy0DGyDHTq
	PsQsclTQIx50UQkkAVA0DoiXRhfI58IcnbG0dT0ROa8oe5/YUVoMuXZQSFHSU6YJn0DGQrs+dNHvs
	/IA9OqgwEmyaYeoWy218DQif4Y3APyskyd98HScQHDfyvBG8aTO1lq7zPOPLo/8iEIMRax6iDtSX2
	uljCRm6nf0bV4py+T3zSjRUq0xSoXZ2PmGk1uTzzAk5or/fZgWKYO4Obp8LzpzmSDZ3T0jf+l/KCY
	9C0vyGeXm+JtWIctNzRFqLC7lpgscpwIWC2QM19p7oubhZ9fMldhxVBZwFfKo1B8ZOXBcns/fXxyY
	A50Tz1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Gj-0000000Cc1w-43JN;
	Wed, 15 Jan 2025 17:33:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7FR-0000000Cbn1-3v3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:32:11 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so81815a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736962328; x=1737567128; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mefQhuFSpESwaWyEeCQcodcETTlSwT/UegGsRwZi/b0=;
        b=Y9Yj9mMLtDVcXfBVGb58eL8lJGE1EXHqFoXrfK10TPkrq1rkEihQUHThXkgIUmZLHd
         ptO5PdElFbE/Doqty4i2HLJ/F7zA0Txda4MUOCBxlpX4ARBm+a3s/TPq4ryeJgRjX8RQ
         5EOAe/7vQMV65ZSAjVL5m6mCoTzIqNJurniGYAiwIkWJkZijBB1pkxAndKslhLcatrLG
         6+OfwV0Dj2esfQEYVOArhPIeTdvuttIzeAwBNJZaKnPeJwc0jdyAMmgckLaowPDSvN9S
         9JZFYlGh51fxUYPoGbDzxV7TO/n4i5rTpn/0FIT/FDp5JwuwsHNlk8netYIVUWBZ66Lg
         1D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962328; x=1737567128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mefQhuFSpESwaWyEeCQcodcETTlSwT/UegGsRwZi/b0=;
        b=RlUIe5zwNlsE1PoSmefXJtgLAUK7SrBa0Mnf3GrBHeSTgN8FwJl8ZWnbAUJI8jkt/V
         e+w5sI9APDK4BF8gr/kpx5H/dlnUi0clmyNCvnL//hyWLB4XdnXVTVPuw2o0A3hoFpl6
         FoUi7QREVG3p9pvbNTOVdJqyLxFok5DijwGAq2fHHojOolZiCGaUdDMFhOJEY9knzKpV
         xOACdvBBi+QDeTt/+17EZnh2lt0cISL5vFfe1IVG02kC+/0BeRJxNEgENhzBl+vb/RDV
         4r/4iIiqmmLVHWz0eRYtWERvTmnSPjpGqhTfznWVkbKUgCv3fnPPM118GxtMGR3EzVmm
         MkGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzC4ndStjyHMCc+6qgh5gGvAsP6Zas6HlPm49mq4BMn8zbhBirZPa8cM+L5hOw4dp8MANVjM8Bp7U5elziABXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwunQr294CWsgz9G0nq6kK9IpqFowJHXalfIIJ6iSOii4uiSkAG
	4pJJfprOz6T0a1Ya/Ua8d6A9B06HXAMxF9IoU56ZEOu3hIJ0g9rtMfn5YZcJnA==
X-Gm-Gg: ASbGncvFyOYkb03PXcRyOotWftbiLJzwKCAMwvk25rsLlJIfE8KBv/czuWweDw/jeyt
	kfW8/9Jlc/qfJ7oSNTtVCH/1dUVs5RmMO2CGZKT/nBcB7TpDp1cvG126IC0lqiRX32HtlnBki1G
	15Is55JfCkC77bwDuVZ3Lf0TTnOAJvrvXr6gbZBxckMbU24pNt2i/1LsN3tgVzYWDiFxsWFx53r
	+sK188aqbMrQp3roOX9SssVwOzTInZfKvhhXrT6AdXbqdL22BSRS32rRtDuEuOiBR4=
X-Google-Smtp-Source: AGHT+IFoPbnCjN1tgNPCYljOFQm2tsMB7bBFWGIOdh7Y1887G14VhNx7Fz3KiZvw9oD86u6cjeHF0g==
X-Received: by 2002:a17:90a:e18f:b0:2ee:5bc9:75b5 with SMTP id 98e67ed59e1d1-2f548ea6493mr42162362a91.4.1736962328427;
        Wed, 15 Jan 2025 09:32:08 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1cc867sm1643077a91.26.2025.01.15.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:32:06 -0800 (PST)
Date: Wed, 15 Jan 2025 23:01:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250115173156.a73ntoyyn3xy52ze@thinkpad>
References: <20250107052108.8643-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107052108.8643-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093209_966259_59232448 
X-CRM114-Status: GOOD (  23.41  )
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

Strange. What are those warnings and platforms?

- Mani

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
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

