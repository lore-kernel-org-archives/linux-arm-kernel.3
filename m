Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EBFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+kzz0G2TfqHbQUIov3lpQ9HROAv2YERrQ6BA6zwhRA=; b=ApKc9sJNryPBvkOTSuo140X7BG
	CTo+jCAu2d+nLydRK2ERAuXUimW0D5IRm3JZ8/6mpePaC6qdRrX4UzQVVSvtWDD+f3jcpIAmiEV1Z
	p3HKp+srVy2mLiwEzh9nWYhLOVSUBbGgFamCN7WUHnPg+/wrTjmnR09bs2NU9MWBUUGbRPynWXxa2
	CnUwOw7zQU57UFVLQzUgxrLu62DLy6v380z1EgKnyLCrSFjAYERmZGyXsqYQIBsm3F3grYls0FPWX
	RZ8EwYMEnhyR5AwInyCK6jzzT6kg1GiB3TqK1VczZ/85ishBGYYnmqnPB0wObZ0oLfqdPhLfUXgyQ
	Jl6dMZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPKx-0000000EkJ4-43ZF;
	Mon, 28 Jul 2025 15:00:23 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPDM-0000000EjHH-3jUE;
	Mon, 28 Jul 2025 14:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753714353; x=1785250353;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vuOTc4Bvw88QCnRkinoJm2PmxtHviY1eT67mzEy/ibY=;
  b=Uvah9iVftB3bQq/kK6GAue9rgUZpfCYRARHYMRmu2FwlK+7dWgvaEuw5
   ISVEQcG5DDOwHrH5kvngVDmTw++DGBwTQyM91ZFKK7xtNJGX0c7xLYlMQ
   DmQvXADB3Rm9p/k3uge8qIIhvGuyq9oHthrKrEns/twX3YTOPBBQDSibN
   Tm+ckHAa/ELGul+r/tyM6gBDEE7XukvFUuvRbFDJQxndxMYqLuNjlXpIm
   ZLQ7hTJCOdhXGVbyWl+48U6rphX8zuQDfBVbIAsQsGQLPWyJwZmg5ev4j
   IJZFOWamZJuARKEzPgay8wfezDnOPox+hv3CNVEhkAZM9M8RXMYfiFaUZ
   A==;
X-CSE-ConnectionGUID: ayo+u0tbSC2VfN3QIM/0Cg==
X-CSE-MsgGUID: cnOpQ2BJSa60X7uqdxvp5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66666811"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66666811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 07:52:30 -0700
X-CSE-ConnectionGUID: w5YfVOuqQySbs7vTCm6TKg==
X-CSE-MsgGUID: 5dqcD0ScSjuOwirYvwZ8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167843491"
Received: from hlagrand-mobl1.ger.corp.intel.com (HELO [10.245.102.40]) ([10.245.102.40])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 07:52:26 -0700
Message-ID: <9314b674-dadb-4749-a792-bd4053eaae04@linux.intel.com>
Date: Mon, 28 Jul 2025 16:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: mediatek: wed: Introduce MT7992 WED support
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Rex Lu <rex.lu@mediatek.com>
References: <20250727-mt7992-wed-support-v1-1-aad7da4dc877@kernel.org>
Content-Language: pl, en-US
From: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
In-Reply-To: <20250727-mt7992-wed-support-v1-1-aad7da4dc877@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_075232_978580_120933C2 
X-CRM114-Status: GOOD (  24.00  )
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

On 2025-07-27 2:50 PM, Lorenzo Bianconi wrote:
> Introduce the second WDMA RX ring in WED driver since Meditake MT7992

s/Meditake/Mediatek

> WiFi chipset support two separated WDMA rings. This is a preliminary

s/support/supports

> patch to properly support WED for MT7992 in MT76 driver.
> 
> Co-developed-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/net/ethernet/mediatek/mtk_wed.c          | 33 +++++++++++++++++++-----
>   drivers/net/ethernet/mediatek/mtk_wed.h          |  2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/mmio.c |  6 ++---
>   drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 12 ++++-----
>   include/linux/soc/mediatek/mtk_wed.h             |  2 +-
>   5 files changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 73c26fcfd85e7be3040abea8e80ff4bee881016c..44a7b4b9d5a4e7cb2c6173ff97024ef74c241058 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -59,7 +59,9 @@ struct mtk_wed_flow_block_priv {
>   static const struct mtk_wed_soc_data mt7622_data = {
>   	.regmap = {
>   		.tx_bm_tkid		= 0x088,
> -		.wpdma_rx_ring0		= 0x770,
> +		.wpdma_rx_ring = {
> +			0x770,
> +		},
>   		.reset_idx_tx_mask	= GENMASK(3, 0),
>   		.reset_idx_rx_mask	= GENMASK(17, 16),
>   	},
> @@ -70,7 +72,9 @@ static const struct mtk_wed_soc_data mt7622_data = {
>   static const struct mtk_wed_soc_data mt7986_data = {
>   	.regmap = {
>   		.tx_bm_tkid		= 0x0c8,
> -		.wpdma_rx_ring0		= 0x770,
> +		.wpdma_rx_ring = {
> +			0x770,
> +		},
>   		.reset_idx_tx_mask	= GENMASK(1, 0),
>   		.reset_idx_rx_mask	= GENMASK(7, 6),
>   	},
> @@ -81,7 +85,10 @@ static const struct mtk_wed_soc_data mt7986_data = {
>   static const struct mtk_wed_soc_data mt7988_data = {

In the patch description you mention the mt7992 chip, however you are 
adding a second rx_ring definition for the mt7988, is this correct?

>   	.regmap = {
>   		.tx_bm_tkid		= 0x0c8,
> -		.wpdma_rx_ring0		= 0x7d0,
> +		.wpdma_rx_ring = {
> +			0x7d0,
> +			0x7d8,
> +		},
>   		.reset_idx_tx_mask	= GENMASK(1, 0),
>   		.reset_idx_rx_mask	= GENMASK(7, 6),
>   	},
> @@ -621,8 +628,8 @@ mtk_wed_amsdu_init(struct mtk_wed_device *dev)
>   		return ret;
>   	}
>   
> -	/* eagle E1 PCIE1 tx ring 22 flow control issue */
> -	if (dev->wlan.id == 0x7991)
> +	/* Kite and Eagle E1 PCIE1 tx ring 22 flow control issue */
> +	if (dev->wlan.id == 0x7991 || dev->wlan.id == 0x7992)
>   		wed_clr(dev, MTK_WED_AMSDU_FIFO, MTK_WED_AMSDU_IS_PRIOR0_RING);
>   
>   	wed_set(dev, MTK_WED_CTRL, MTK_WED_CTRL_TX_AMSDU_EN);
> @@ -1239,7 +1246,11 @@ mtk_wed_set_wpdma(struct mtk_wed_device *dev)
>   		return;
>   
>   	wed_w32(dev, MTK_WED_WPDMA_RX_GLO_CFG, dev->wlan.wpdma_rx_glo);
> -	wed_w32(dev, dev->hw->soc->regmap.wpdma_rx_ring0, dev->wlan.wpdma_rx);
> +	wed_w32(dev, dev->hw->soc->regmap.wpdma_rx_ring[0],
> +		dev->wlan.wpdma_rx[0]);
> +	if (mtk_wed_is_v3(dev->hw))

You also have mtk_wed_is_v3_or_greater() defined in the header, why not 
use that?

> +		wed_w32(dev, dev->hw->soc->regmap.wpdma_rx_ring[1],
> +			dev->wlan.wpdma_rx[1]);
>   
>   	if (!dev->wlan.hw_rro)
>   		return;
> @@ -2323,6 +2334,16 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
>   		if (!dev->rx_wdma[i].desc)
>   			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
>   
> +	if (dev->wlan.hw_rro) {
> +		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
> +			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
> +				   MTK_WED_RING_OFS_COUNT;
> +
> +			if (!wed_r32(dev, addr))
> +				wed_w32(dev, addr, 1);
> +		}
> +	}
> +
>   	mtk_wed_hw_init(dev);
>   	mtk_wed_configure_irq(dev, irq_mask);
>   
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.h b/drivers/net/ethernet/mediatek/mtk_wed.h
> index c1f0479d7a7182919e77c40efc30ade37abfad58..b49aee9a8b65156310e4f66a17921e5320b3077c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.h
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.h
> @@ -17,7 +17,7 @@ struct mtk_wed_wo;
>   struct mtk_wed_soc_data {
>   	struct {
>   		u32 tx_bm_tkid;
> -		u32 wpdma_rx_ring0;
> +		u32 wpdma_rx_ring[MTK_WED_RX_QUEUES];
>   		u32 reset_idx_tx_mask;
>   		u32 reset_idx_rx_mask;
>   	} regmap;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> index 4a82f8e4c118061fc76459dc0e38f7ee27e25a3a..36488aa6cc20117de4f5b76b80beca149015e055 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -664,8 +664,8 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
>   					 MT_RXQ_WED_RING_BASE;
>   		wed->wlan.wpdma_rx_glo = pci_resource_start(pci_dev, 0) +
>   					 MT_WPDMA_GLO_CFG;
> -		wed->wlan.wpdma_rx = pci_resource_start(pci_dev, 0) +
> -				     MT_RXQ_WED_DATA_RING_BASE;
> +		wed->wlan.wpdma_rx[0] = pci_resource_start(pci_dev, 0) +
> +					MT_RXQ_WED_DATA_RING_BASE;
>   	} else {
>   		struct platform_device *plat_dev = pdev_ptr;
>   		struct resource *res;
> @@ -687,7 +687,7 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
>   		wed->wlan.wpdma_tx = res->start + MT_TXQ_WED_RING_BASE;
>   		wed->wlan.wpdma_txfree = res->start + MT_RXQ_WED_RING_BASE;
>   		wed->wlan.wpdma_rx_glo = res->start + MT_WPDMA_GLO_CFG;
> -		wed->wlan.wpdma_rx = res->start + MT_RXQ_WED_DATA_RING_BASE;
> +		wed->wlan.wpdma_rx[0] = res->start + MT_RXQ_WED_DATA_RING_BASE;
>   	}
>   	wed->wlan.nbuf = MT7915_HW_TOKEN_SIZE;
>   	wed->wlan.tx_tbit[0] = is_mt7915(&dev->mt76) ? 4 : 30;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> index 30b40f4a91be81d429d11f15036167396756d2dc..fb2428a9b877899a0a6fb879aba84e1f6e7840f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> @@ -503,9 +503,9 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, void *pdev_ptr,
>   		}
>   
>   		wed->wlan.wpdma_rx_glo = wed->wlan.phy_base + hif1_ofs + MT_WFDMA0_GLO_CFG;
> -		wed->wlan.wpdma_rx = wed->wlan.phy_base + hif1_ofs +
> -				     MT_RXQ_RING_BASE(MT7996_RXQ_BAND0) +
> -				     MT7996_RXQ_BAND0 * MT_RING_SIZE;
> +		wed->wlan.wpdma_rx[0] = wed->wlan.phy_base + hif1_ofs +
> +					MT_RXQ_RING_BASE(MT7996_RXQ_BAND0) +
> +					MT7996_RXQ_BAND0 * MT_RING_SIZE;
>   
>   		wed->wlan.id = MT7996_DEVICE_ID_2;
>   		wed->wlan.tx_tbit[0] = ffs(MT_INT_TX_DONE_BAND2) - 1;
> @@ -518,9 +518,9 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, void *pdev_ptr,
>   
>   		wed->wlan.wpdma_rx_glo = wed->wlan.phy_base + MT_WFDMA0_GLO_CFG;
>   
> -		wed->wlan.wpdma_rx = wed->wlan.phy_base +
> -				     MT_RXQ_RING_BASE(MT7996_RXQ_BAND0) +
> -				     MT7996_RXQ_BAND0 * MT_RING_SIZE;
> +		wed->wlan.wpdma_rx[0] = wed->wlan.phy_base +
> +					MT_RXQ_RING_BASE(MT7996_RXQ_BAND0) +
> +					MT7996_RXQ_BAND0 * MT_RING_SIZE;
>   
>   		wed->wlan.wpdma_rx_rro[0] = wed->wlan.phy_base +
>   					    MT_RXQ_RING_BASE(MT7996_RXQ_RRO_BAND0) +
> diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
> index d8949a4ed0dc9d41b3364e85a21e15d258519c45..c4ff6bab176db1f51cd94ac4198df0caeb557df2 100644
> --- a/include/linux/soc/mediatek/mtk_wed.h
> +++ b/include/linux/soc/mediatek/mtk_wed.h
> @@ -147,7 +147,7 @@ struct mtk_wed_device {
>   		u32 wpdma_tx;
>   		u32 wpdma_txfree;
>   		u32 wpdma_rx_glo;
> -		u32 wpdma_rx;
> +		u32 wpdma_rx[MTK_WED_RX_QUEUES];
>   		u32 wpdma_rx_rro[MTK_WED_RX_QUEUES];
>   		u32 wpdma_rx_pg;
>   
> 
> ---
> base-commit: fa582ca7e187a15e772e6a72fe035f649b387a60
> change-id: 20250718-mt7992-wed-support-456a50d51f81

Best,
Dawid

