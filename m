Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF320C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daUQqa2kpEYUS8HX6HUWfM49OoQ/Na4MuPRQCVSrCI8=; b=SHtafJ+r014+jUw8/SHU/OhzUw
	/B24E5JXhGSRjMtRzGxWSP8hilEXmoJHGjjel+MMAttt+s7LnAv+uyCEhagukqEMv1GIgmuxdYY7n
	tvOxbR+wpDH8CplnCW0mct+b23rCWeO1Bs5RuK/5KmrJtMe5TnGP0T2v4X6eUfJcwEtVzocyq4THQ
	yEqaOoBZ3W49hygRY3JJcx/35zZDt6m1Y2Sw41reO8P63Rw5ZWD5yJaasqmu4PYHxGochC8nyMPvR
	7WnblTKq8ZGBIIk0jL8YX3ub3s/F7kKeXY65xTMfsV3shdoKIDV4xoXe5QA4PaaSz1yZdaXDgKr70
	AeG3Tr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taX5n-00000009nnP-3DcE;
	Wed, 22 Jan 2025 09:32:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taX4V-00000009nWS-1SgR;
	Wed, 22 Jan 2025 09:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737538248;
	bh=f3TdHQgZjQ8L5oODCWQZ/pftlSD3qAwzW9nADsGUQVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxNnV5ziBxgSSQnhSyNRNjrYLI6njp5+IJWq6yBSmeYYFNucStibYGwUhAvnnS4y7
	 tbfMVyI/OYnNeaD1R03M0JhBteCbY6ySLuU3rSJctlhbYQeZm8IWTn6DDPEopZQkvl
	 Sea5zzgn5+y6KFplvayDOYF/fzhmJlyjrAVNlbMuURmRsAM53m6nnUutrY6OkTT/bk
	 pjx4dSm96vBm44l06labARjeTvY5xvckP+r5KMVsGaC3U6VQOe2UCPCDbmFJ0NH3zb
	 /jw2RWn+CXEfFHT2+nFUWMg0rox2NSZmhyu6jCC1hTSGxLFW/7XryRTKo4HzyoQopf
	 Qw0vrW5+g+8Ig==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AE6F17E09E9;
	Wed, 22 Jan 2025 10:30:47 +0100 (CET)
Message-ID: <e63fdeba-04dd-4b88-a6d6-ca8a64e28e36@collabora.com>
Date: Wed, 22 Jan 2025 10:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] usb: mtu3: add support remote wakeup of mt8196
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
 <20250121145008.22936-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250121145008.22936-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_013051_585340_1FC36FB6 
X-CRM114-Status: GOOD (  20.61  )
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

Il 21/01/25 15:50, Chunfeng Yun ha scritto:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them.
> Here add only for dual-role controllers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

 From the datasheets, I can read the following:

IP0: host -> 0x1670_0000  device(mtu3) -> 0x1670_1000
IP1: host -> 0x1671_0000  device(mtu3) -> 0x1671_1000
IP2: host -> 0x1672_0000  device(mtu3) -> 0x1672_1000

...this means that you're missing the IP2 here, which you did not miss in the
commit adding the wakeup control in mtk-xhci instead.

So, since I see that all of the USB IPs are behind MTU3, and that there is no
USB IP that does *not* support gadget mode (so, there's no USB IP that does NOT
support MTU3), you shall add all three here, and you shall drop the commit that
adds the wakeup control in mtk-xhci entirely.

This is because there will be no DT node declaring only XHCI.

Since after the proposed change all controllers will be MTU3 -> XHCI, there's
no need to add the same in the mtk-xhci driver.

Cheers,
Angelo

> ---
> v2: add wakeup for dual-role controllers
> ---
>   drivers/usb/mtu3/mtu3_host.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
> index 7c657ea2dabd..d65b0f318436 100644
> --- a/drivers/usb/mtu3/mtu3_host.c
> +++ b/drivers/usb/mtu3/mtu3_host.c
> @@ -46,6 +46,11 @@
>   #define WC1_IS_P_95		BIT(12)
>   #define WC1_IS_EN_P0_95		BIT(6)
>   
> +/* mt8196 */
> +#define PERI_WK_CTRL0_8196	0x08
> +#define WC0_IS_EN_P0_96		BIT(0)
> +#define WC0_IS_EN_P1_96		BIT(7)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -59,6 +64,8 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
>   	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
>   	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
> +	SSUSB_UWK_V1_7, 	/* mt8196 IP0 */
> +	SSUSB_UWK_V1_8, 	/* mt8196 IP1 */
>   };
>   
>   /*
> @@ -100,6 +107,16 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
>   		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
>   		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
>   		break;
> +	case SSUSB_UWK_V1_7:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = WC0_IS_EN_P0_96;
> +		val = enable ? msk : 0;
> +		break;
> +	case SSUSB_UWK_V1_8:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
> +		msk = WC0_IS_EN_P1_96;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;



