Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95DCD5A6FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYkHVMyuFjcjBWSX1BhusXr3LBDBnLMTyVCPBzyBdfM=; b=USaembd3m24Aqkk7csecW9K/kH
	HMC0rfsfHX2TtbGHOZ37vSbkmbf5YDlqqjGEkeZ9CnVHE1lheeHmVD10lWp7OeSRqXptUa4DuWHvJ
	SP30v/y/+E+VSULFKo3io674Ufd2ikJar01Mar2c3XwoiJ2zNnlJ87twMJovd7BBlpORVA0c3LR6v
	71vummAC1ouklltlkSBTh7/M5EEq4wgGjBHHiReyQnaJ0l9RqipR+JtRtoDIJT6RMyyQUS5+cnNlZ
	pEdB6l6NpucpQciXohNOYJg7HKoB7QL3YznrPk9kFdJx55kWh6drrnT+h2lSBkFltVHqr3jx1K5tP
	HzrlC57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrIe-0000000A0N6-20ZF;
	Tue, 26 Nov 2024 08:52:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrHe-0000000A0GE-18nJ;
	Tue, 26 Nov 2024 08:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732611055;
	bh=DD5KEenRbXh7Urnj+j3PXHTTd/zkE780TJdzO7LND4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R3YB630qDaKpg13hc2Fa8pIP0ESyLbSrMeq6oa807g0qeYitRqkUhKZQUHW4DS64Y
	 iuU9pSA5RXq46QwZC+ZiHKfpPOMe94mnU3DgZkiz3LjlfBXYbRzSd3KmIKK0PUQT4n
	 M/vLZ4+guHcLr2Z8pChR203Qf5WxNisjomoKpmQCWLB6H72fuGISBrPIVgoNB272Mz
	 whnfGiqH4Mz6pxTz8Vn5xYbpWgeRTfPY6Y31F2W0QzPxwl+TZzAbIHKhUc1NPMcvZm
	 1StzofXNG6p5n8gbrkbSDWmp1xIE6VUbXuylmFqERJU87YNahNd5MFFGctyii9bCIi
	 rLty49tFonm4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B8AA17E1366;
	Tue, 26 Nov 2024 09:50:55 +0100 (CET)
Message-ID: <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
Date: Tue, 26 Nov 2024 09:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
 <20241126025507.29605-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241126025507.29605-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005059_274345_6C2F278B 
X-CRM114-Status: GOOD (  16.30  )
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

Il 26/11/24 03:55, Chunfeng Yun ha scritto:
> There are 2 USB controllers on mt8196, each controller's wakeup control is
> different, add some specific versions for them.
> 

Is there any MTU3 controller in MT8196, like all other MediaTek SoCs?

If so, then please just add the wakeup control to the MTU3 driver, otherwise
we are going to duplicate this for yet another SoC, like we've done for MT8192,
MT8195, MT8188 and MT8186 already...

Cheers,
Angelo

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 3252e3d2d79c..31223912b0b4 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -113,6 +113,12 @@
>   #define WC1_IS_P_95		BIT(12)
>   #define WC1_IS_EN_P0_95		BIT(6)
>   
> +/* mt8196 */
> +#define PERI_WK_CTRL0_8196	0x08
> +#define UWK_V1_7_CTRL2_MASK	0x5
> +
> +#define WCP1_IS_EN		BIT(7) /* port1 en bit */
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -129,6 +135,8 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
>   	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
>   	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
> +	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
> +	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
>   };
>   
>   /*
> @@ -381,6 +389,16 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
>   		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
>   		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
>   		break;
> +	case SSUSB_UWK_V1_7:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = UWK_V1_7_CTRL2_MASK;
> +		val = enable ? msk : 0;
> +		break;
> +	case SSUSB_UWK_V1_8:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = WCP1_IS_EN;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;




