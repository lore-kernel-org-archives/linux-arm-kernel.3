Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0643AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0y8uBx3shNoDx7XeM2Xo0zJgnxxZH7YN+MAcnT5fj0=; b=4kvQoN/IJfr2lZcN4iAlmS6M/K
	iA6h+qkGWSey1ZMwccJ7fkmfg+xm9tf+VOpNsgGfVprkRMff+afjcFt047uevHro2xUhl2xB1m9SJ
	3p94z7gCnl/2rQs/o7lq/v4La+UjKFWAmZFMBDbcoAqlr4Jd6CkXXOo0bT4rUjGTOJI5/aMxgAaGQ
	3gysQHyCGWdCz19GAEVQhVH/6bUwng1krig8hmIIYZKlaSQ17vpyDdZZfs7NsdgjEjhw27uRZK3A0
	Z18/+0UPH7MOEvc45nWUNCIXBmjx4QHzB8nWmPJLimho25oVmW5yp9DB8U3otCvWVht+0XA0RFzzE
	RsZFc5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJVX-00000007PKx-0VzW;
	Tue, 18 Feb 2025 09:03:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJPn-00000007O7l-0UBG;
	Tue, 18 Feb 2025 08:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739869033;
	bh=mhaR2Trnlsu8FfYdF9a/LlPy376WKizOyZDhx/r8OTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FERSaw+wUWOJgkTZm1leH65FcMticAx2ZDEkReE80eTRzAVt9txumwGUCAKfspNmc
	 C7NTo7l5jcGXmclVLKA82mcoI9NhdambccpMm6NoxeGrBSWIjXXqnJvodIo8Zlqvdl
	 kJGFbw6dkqivDA7MHQDyPm+tbw67VX4q/JFzzS4+N34JS6krZhHcoEgcLtASxkGi/G
	 iN68mETOMiboV58T8sC8CJtWImg/gj+22aU39j2m/hu65ldnzLP2Dlb2c2j84xIcRj
	 YUxcmNcGkgFA191chGVGDoM8uzYl/kdzIonJjEbp9vKidJMvFwWLJfeBNc2Yahw5y3
	 qPgbOc9Auxzgw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 329F417E1562;
	Tue, 18 Feb 2025 09:57:13 +0100 (CET)
Message-ID: <7804ef70-efe7-476b-ae5e-bf665bfb4a47@collabora.com>
Date: Tue, 18 Feb 2025 09:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] usb: mtk-xhci: add support remote wakeup of mt8196
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215100615.808-1-chunfeng.yun@mediatek.com>
 <20250215100615.808-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250215100615.808-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005715_302423_4A15EDD2 
X-CRM114-Status: GOOD (  17.27  )
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

Il 15/02/25 11:06, Chunfeng Yun ha scritto:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Since all of the USB controllers of the MT8196 SoC are behind MTU3, and
since the wakeup control for all of them will be handled by the MTU3 driver
and *not* by the xhci-mtk driver....

NACK!

Please drop this commit.

Cheers,
Angelo

> ---
> v3: no changes
> v2: modify marcos name
> ---
>   drivers/usb/host/xhci-mtk.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 904831344440..3f8e37b25322 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -113,6 +113,14 @@
>   #define WC1_IS_P_95		BIT(12)
>   #define WC1_IS_EN_P0_95		BIT(6)
>   
> +/* mt8196 */
> +#define PERI_WK_CTRL0_8196	0x08
> +#define WC0_IS_EN_P0_96		BIT(0)
> +#define WC0_IS_EN_P1_96		BIT(7)
> +
> +#define PERI_WK_CTRL1_8196	0x10
> +#define WC1_IS_EN_P2_96		BIT(0)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -129,6 +137,9 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
>   	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
>   	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
> +	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
> +	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
> +	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
>   };
>   
>   /*
> @@ -381,6 +392,21 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
>   		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
>   		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
>   		break;
> +	case SSUSB_UWK_V1_7:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = WC0_IS_EN_P0_96;
> +		val = enable ? msk : 0;
> +		break;
> +	case SSUSB_UWK_V1_8:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = WC0_IS_EN_P1_96;
> +		val = enable ? msk : 0;
> +		break;
> +	case SSUSB_UWK_V1_9:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL1_8196;
> +		msk = WC1_IS_EN_P2_96;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;




