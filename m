Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2707E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NxSS3UCgqNEjxbkRhl2Uo3hryunKuA7CrS8ppApH70U=; b=B7wpe9AIpOM5DC
	3jzSXins7yud6e6cQSaCwqGy0Sz/TxE5fiqNYTDbg5Ij6KGzi7V7N4skVqdFHSfJzw/WR5xWqkzVJ
	5OtEik0oio0v/CAvPk7W+98z/Pez8NUmrxV/Ru8+BZlgupabCI0vgTdJb0E2x66fMzpu9t7pOO3e6
	IdDZnkfCDO51MfAtG78AK8/Ag7JaO56WvM2/JIys2fMwjMCmMUlgKNkRQ0B0dvPZOIlw4O5pEPPzU
	ddXvtIHt2DRItqcdhRdwfG7wHVZwhWfLq0zx2CKH1MdstHV9RE86wrS/T9Kup6VxVXUthVGIk15lS
	z/rCU6kV0+927M8dN6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnEJ-0000000Dp8S-0oEb;
	Fri, 03 Jan 2025 19:21:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTnD7-0000000Doxm-0CAZ;
	Fri, 03 Jan 2025 19:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5C5E5C647A;
	Fri,  3 Jan 2025 19:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8723DC4CECE;
	Fri,  3 Jan 2025 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931990;
	bh=UXGyxRlGmAmUaGZwDyufZzkZnBt8bnaVeYMR/tdNg+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=c+Deeg9V8VcFyWomkmsle9ozLucizmwJO5Gutz9vBqoQwXoCxuL8loK/x7obZvHEk
	 uHTo34zns+QN8AkiNsG7P+CS+Mvegxcq45X3iIPUO01K38zjW06iDv7iWC0lEdOOJs
	 LMGswkom9/wF+1cjL0RVIGvrV7OsvC8V6MgTeoNEHdIXdCVLGr/kacYmm2m9hLNbjg
	 YVw8AE6wINCaMy5MgoHSrDv8zWlck9GfZclIMh6cTY/N4OE+44l2RTDit1BiYL2Y9l
	 3MXb7vQx+pyFTev750QKolFs5hoi5ClshqRaToxvYoMrCg/MaHFu4WNzJCQsII+h1g
	 TuuddzAxEwQjA==
Date: Fri, 3 Jan 2025 13:19:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
Message-ID: <20250103191948.GA4190995@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060035.30688-5-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_111953_172779_D8935502 
X-CRM114-Status: GOOD (  24.21  )
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

On Fri, Jan 03, 2025 at 02:00:14PM +0800, Jianjun Wang wrote:
> There are some circumstances where the EP device will not respond to
> non-posted access from the root port (e.g., MMIO read). In such cases,
> the root port will reply with an AXI slave error, which will be treated
> as a System Error (SError), causing a kernel panic and preventing us
> from obtaining any useful information for further debugging.
> 
> We have added a new bit in the PCIE_AXI_IF_CTRL_REG register to prevent
> PCIe AXI0 from replying with a slave error. Setting this bit on an older
> platform that does not support this feature will have no effect.
> 
> By preventing AXI0 from replying with a slave error, we can keep the
> kernel alive and debug using the information from AER.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 4bd3b39eebe2..48f83c2d91f7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -87,6 +87,9 @@
>  #define PCIE_LOW_POWER_CTRL_REG		0x194
>  #define PCIE_FORCE_DIS_L0S		BIT(8)
>  
> +#define PCIE_AXI_IF_CTRL_REG		0x1a8
> +#define PCIE_AXI0_SLV_RESP_MASK		BIT(12)
> +
>  #define PCIE_PIPE4_PIE8_REG		0x338
>  #define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
>  #define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
> @@ -469,6 +472,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  	val |= PCIE_FORCE_DIS_L0S;
>  	writel_relaxed(val, pcie->base + PCIE_LOW_POWER_CTRL_REG);
>  
> +	/*
> +	 * Prevent PCIe AXI0 from replying a slave error, as it will cause kernel panic
> +	 * and prevent us from getting useful information.
> +	 * Keep the kernel alive and debug using the information from AER.

Wrap to fit in 80 columns like the rest of the file

Add blank lines between paragraphs.

AER is an asynchronous mechanism, so if you disable the SError,
whoever issued the MMIO read to the PCIe device will receive some kind
of data.

I hope/assume that data is ~0 as on other platforms?  If so, please
confirm this in the comment and commit log.  Otherwise, the caller
will received corrupted data with no way to know that it's corrupted.

> +	 */
> +	val = readl_relaxed(pcie->base + PCIE_AXI_IF_CTRL_REG);
> +	val |= PCIE_AXI0_SLV_RESP_MASK;
> +	writel_relaxed(val, pcie->base + PCIE_AXI_IF_CTRL_REG);
> +
>  	/* Disable DVFSRC voltage request */
>  	val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
>  	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> -- 
> 2.46.0
> 

