Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF505CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKaS4hCxNX+jV/z4muBtky9Wd1MnxmWx02nDIAULD6Y=; b=IqUAmjP7VuriuThDa5gzvJlu+G
	fg8q9y0I/3ibd++jig8TpGpZ9ZCoWQ8ti0IkkGIAYuRR4To7HKGpcLCrwtKzr0JStRtXUmLxMCPtH
	DjNRWak/nKAR/+IlPT+XBkTAfjJwtH1IEJxiHdyop1hJQNFfqSoYLMt0YZF7vDWn7YowZFpXfNJgD
	7QYztl+tDfGapvIVxmef7wq2FAtvKY+cfmxGVvpO+ISULf+IZdubQysNCo2tLeDt/7firKwLGUyex
	Z4A8LVbUrTYUbEzaRZC5HJwgj2S8INCYpReQgW9eVVC8vjsUAiRQGaiBu9r/JoQyTCY4AqFyJWEg3
	aapAK1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzb-0000000D3SI-2i0x;
	Mon, 20 Oct 2025 11:23:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnzX-0000000D3Nc-2hYS;
	Mon, 20 Oct 2025 11:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760959432;
	bh=GnLXgjSC+XvWVvG6AxTYWUBWwfWinq5PD6eyJ5swlv4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QB69WTGQfs5tYFLq+cGbUS3xFGghW1esdl+XaqcupXYgMa80T/6lP4BUd0Bpgljeu
	 8uw2vPTwZrTucpdTOheb/DNBoq/lLtjMlCoyb7HtOTa22SbPhtyr2Rj007aD15NL+C
	 9tccL6XzPOEBy3nMMhjnIwLjxCAGehgDNSrYWqkaUv4rioSMvDCD+QVtOMOl3g7VOa
	 D4n/frn1PqhaKRcbUwVIH1no8tJ4dqdDQCIc7VEEYEpZhulSZk84XfgJAlTB66Sh8F
	 7Wv9qQr+oYL7u0zK4k7FzWJdNunslGyLeA69dL++wjjpG+g8XSc8G3rIUryivqff+r
	 AxTCl5QNDSj2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B99CA17E131B;
	Mon, 20 Oct 2025 13:23:51 +0200 (CEST)
Message-ID: <5d34b941-d594-4386-8235-d8e6c24ba02a@collabora.com>
Date: Mon, 20 Oct 2025 13:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] PCI: mediatek: Convert bool to single quirks entry
 and bitmap
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 upstream@airoha.com
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
 <20251020111121.31779-4-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020111121.31779-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_042355_873739_78692150 
X-CRM114-Status: GOOD (  23.47  )
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

Il 20/10/25 13:11, Christian Marangi ha scritto:
> To clean Mediatek SoC PCIe struct, convert all the bool to a bitmap and
> use a single quirks to reference all the values. This permits cleaner
> addition of new quirk without having to define a new bool in the struct.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pci/controller/pcie-mediatek.c | 33 ++++++++++++++++----------
>   1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 24cc30a2ab6c..cbffa3156da1 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -142,24 +142,32 @@
>   
>   struct mtk_pcie_port;
>   
> +/**
> + * enum mtk_pcie_quirks - MTK PCIe quirks
> + * @MTK_PCIE_FIX_CLASS_ID: host's class ID needed to be fixed
> + * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
> + * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
> + */
> +enum mtk_pcie_quirks {
> +	MTK_PCIE_FIX_CLASS_ID = BIT(0),
> +	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
> +	MTK_PCIE_NO_MSI = BIT(2),
> +};
> +
>   /**
>    * struct mtk_pcie_soc - differentiate between host generations
> - * @need_fix_class_id: whether this host's class ID needed to be fixed or not
> - * @need_fix_device_id: whether this host's device ID needed to be fixed or not
> - * @no_msi: Bridge has no MSI support, and relies on an external block
>    * @device_id: device ID which this host need to be fixed
>    * @ops: pointer to configuration access functions
>    * @startup: pointer to controller setting functions
>    * @setup_irq: pointer to initialize IRQ functions
> + * @quirks: PCIe device quirks.
>    */
>   struct mtk_pcie_soc {
> -	bool need_fix_class_id;
> -	bool need_fix_device_id;
> -	bool no_msi;
>   	unsigned int device_id;
>   	struct pci_ops *ops;
>   	int (*startup)(struct mtk_pcie_port *port);
>   	int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
> +	enum mtk_pcie_quirks quirks;
>   };
>   
>   /**
> @@ -703,7 +711,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>   	writel(val, port->base + PCIE_RST_CTRL);
>   
>   	/* Set up vendor ID and class code */
> -	if (soc->need_fix_class_id) {
> +	if (soc->quirks & MTK_PCIE_FIX_CLASS_ID) {
>   		val = PCI_VENDOR_ID_MEDIATEK;
>   		writew(val, port->base + PCIE_CONF_VEND_ID);
>   
> @@ -711,7 +719,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>   		writew(val, port->base + PCIE_CONF_CLASS_ID);
>   	}
>   
> -	if (soc->need_fix_device_id)
> +	if (soc->quirks & MTK_PCIE_FIX_DEVICE_ID)
>   		writew(soc->device_id, port->base + PCIE_CONF_DEVICE_ID);
>   
>   	/* 100ms timeout value should be enough for Gen1/2 training */
> @@ -1099,7 +1107,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>   
>   	host->ops = pcie->soc->ops;
>   	host->sysdata = pcie;
> -	host->msi_domain = pcie->soc->no_msi;
> +	host->msi_domain = !!(pcie->soc->quirks & MTK_PCIE_NO_MSI);
>   
>   	err = pci_host_probe(host);
>   	if (err)
> @@ -1187,9 +1195,9 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
> -	.no_msi = true,
>   	.ops = &mtk_pcie_ops,
>   	.startup = mtk_pcie_startup_port,
> +	.quirks = MTK_PCIE_NO_MSI,
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
> @@ -1199,19 +1207,18 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
> -	.need_fix_class_id = true,
>   	.ops = &mtk_pcie_ops_v2,
>   	.startup = mtk_pcie_startup_port_v2,
>   	.setup_irq = mtk_pcie_setup_irq,
> +	.quirks = MTK_PCIE_FIX_CLASS_ID,
>   };
>   
>   static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
> -	.need_fix_class_id = true,
> -	.need_fix_device_id = true,
>   	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
>   	.ops = &mtk_pcie_ops_v2,
>   	.startup = mtk_pcie_startup_port_v2,
>   	.setup_irq = mtk_pcie_setup_irq,
> +	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
>   };
>   
>   static const struct of_device_id mtk_pcie_ids[] = {



