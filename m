Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0498ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZtc2WpoNcz6XbHbCoqRq76rCEZjFybGJyPL+73RnEI=; b=hobCT+2DVn9mKoSaFuP62SRQVO
	nSVVUdkkuNBY4gICZLisjBg1V3j2hm5IV3xmNm1W22V9/ds019ruwhGJm5MisvbOq0zx94r2tgJHK
	2cGTlbMo9QOQ5+OCuOZKdAdlFRcA9Ba3ciLo64+3PZaampjk8PsG1FWTvP11gqnjg29STJDQIRz2Z
	4xcLoXPNdR1OxoEA68TLx8V0auu9NsTUsSv27VXypVmCHmuEXsNB4JVOsjh/Tc8np1YVELjgCqQVg
	J3Z5Y5wFvyX58gBwwjA/wyt6+mppx1qnan9slFQBpK3PnLRXovzGh8e0G/7QCir9668LeswbG37P3
	JQoW8wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dTl-0000000G8hs-3G6K;
	Tue, 14 Oct 2025 11:46:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dTk-0000000G8hO-0Sxt;
	Tue, 14 Oct 2025 11:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760442365;
	bh=zh3gtbXSbad8n/WFENsjqEdQRtU1t+VuBKeLZcIuCyo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TWReYMcOyfclxK+44jSQmchHsdlk6IIef/vqhGJE23lcMjrpnO1Et34zR/cQq9kAk
	 rF+UbcMdgKjdvHYxxYigA1FNNnSZ3nfkkodefswzCN001LJtvDcFzbeXa6Owr7s6iS
	 9qqkgib6MMZl3D+nKgBqOxrHD5fUnuPrRb7+EqtlOF3CWMNmEaxwfKLLK1CAzdFR4A
	 l8Mar11CgfjWBkTS8lRDK2CziF+KrWXUnkTzhes4Ic1hPC5QEg7omk9FlxRTNwsn15
	 yn5LdbSMY6dILtHYJxYEPEhzlfYPFESHmJnhXXqvrF09tA+TzQNy52wKKmcriF2AiQ
	 3u2sVnc+uOG0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 516D217E013C;
	Tue, 14 Oct 2025 13:46:05 +0200 (CEST)
Message-ID: <675d5338-09f0-439b-b22c-a3d50b243b5e@collabora.com>
Date: Tue, 14 Oct 2025 13:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] PCI: mediatek: convert bool to single flags entry
 and bitmap
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-5-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251012205900.5948-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_044608_333029_1DB0F8FE 
X-CRM114-Status: GOOD (  24.47  )
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

Il 12/10/25 22:56, Christian Marangi ha scritto:
> To clean Mediatek SoC PCIe struct, convert all the bool to a bitmap and
> use a single flags to reference all the values. This permits cleaner
> addition of new flag without having to define a new bool in the struct.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/pci/controller/pcie-mediatek.c | 28 +++++++++++++++-----------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 24cc30a2ab6c..1678461e56d3 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -142,24 +142,29 @@
>   
>   struct mtk_pcie_port;
>   
> +enum mtk_pcie_flags {

enum mtk_pcie_quirks seems to be a better fit here, as this is used for... well..
quirks.

> +	NEED_FIX_CLASS_ID = BIT(0), /* host's class ID needed to be fixed */
> +	NEED_FIX_DEVICE_ID = BIT(1), /* host's device ID needed to be fixed */
> +	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
> +			  * external block
> +			  */

Also perhaps... MTK_PCIE_FIX_CLASS_ID, MTK_PCIE_FIX_DEV_ID, MTK_PCIE_NO_MSI

> +};
> +
>   /**
>    * struct mtk_pcie_soc - differentiate between host generations
> - * @need_fix_class_id: whether this host's class ID needed to be fixed or not
> - * @need_fix_device_id: whether this host's device ID needed to be fixed or not
>    * @no_msi: Bridge has no MSI support, and relies on an external block
>    * @device_id: device ID which this host need to be fixed
>    * @ops: pointer to configuration access functions
>    * @startup: pointer to controller setting functions
>    * @setup_irq: pointer to initialize IRQ functions
> + * @flags: pcie device flags.
>    */
>   struct mtk_pcie_soc {
> -	bool need_fix_class_id;
> -	bool need_fix_device_id;
> -	bool no_msi;
>   	unsigned int device_id;
>   	struct pci_ops *ops;
>   	int (*startup)(struct mtk_pcie_port *port);
>   	int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
> +	u32 flags;

u32 flags -> enum mtk_pcie_quirks quirks

Cheers,
Angelo

>   };
>   
>   /**
> @@ -703,7 +708,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>   	writel(val, port->base + PCIE_RST_CTRL);
>   
>   	/* Set up vendor ID and class code */
> -	if (soc->need_fix_class_id) {
> +	if (soc->flags & NEED_FIX_CLASS_ID) {
>   		val = PCI_VENDOR_ID_MEDIATEK;
>   		writew(val, port->base + PCIE_CONF_VEND_ID);
>   
> @@ -711,7 +716,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>   		writew(val, port->base + PCIE_CONF_CLASS_ID);
>   	}
>   
> -	if (soc->need_fix_device_id)
> +	if (soc->flags & NEED_FIX_DEVICE_ID)
>   		writew(soc->device_id, port->base + PCIE_CONF_DEVICE_ID);
>   
>   	/* 100ms timeout value should be enough for Gen1/2 training */
> @@ -1099,7 +1104,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>   
>   	host->ops = pcie->soc->ops;
>   	host->sysdata = pcie;
> -	host->msi_domain = pcie->soc->no_msi;
> +	host->msi_domain = !!(pcie->soc->flags & NO_MSI);
>   
>   	err = pci_host_probe(host);
>   	if (err)
> @@ -1187,9 +1192,9 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
> -	.no_msi = true,
>   	.ops = &mtk_pcie_ops,
>   	.startup = mtk_pcie_startup_port,
> +	.flags = NO_MSI,
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
> @@ -1199,19 +1204,18 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
> -	.need_fix_class_id = true,
>   	.ops = &mtk_pcie_ops_v2,
>   	.startup = mtk_pcie_startup_port_v2,
>   	.setup_irq = mtk_pcie_setup_irq,
> +	.flags = NEED_FIX_CLASS_ID,
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
> -	.need_fix_class_id = true,
> -	.need_fix_device_id = true,
>   	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
>   	.ops = &mtk_pcie_ops_v2,
>   	.startup = mtk_pcie_startup_port_v2,
>   	.setup_irq = mtk_pcie_setup_irq,
> +	.flags = NEED_FIX_CLASS_ID | NEED_FIX_DEVICE_ID,
>   };
>   
>   static const struct of_device_id mtk_pcie_ids[] = {



