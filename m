Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B759C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/0gv1xdDEWympNkHlAQyUphyAsRGcD5bqrBHHzRvQE=; b=V/hY2Sg+bSV1Xp7zXXC8pdKBIs
	nsNF/LdRx+snKq7+SISo1V0cXTLGtJkOG+xiw6/FWiVyFf27mSbG5ZwG1E0KfhTfqUOtvTaCsBUM+
	KowGxCbUY7UKh/Qn5GpGfyOZXHeckcZ6PpGT9HCRqzIz5US5d0ISVw7E/KVl4fbrnIs/lASGAZG3m
	gxB8zOGshwpubF3zCvuAt/1HPw6Rs8jKfmxVaERcBGw6/FUwuqRZQfMdBEXCZSezKEg38Q2Gy9kWg
	qLLrz9iHaxafb1nrAyZE4NtDD8kMm3P5RupvlxNEC3RsTowHMKtE0sU4FXaZ1KnMucbq7qyuxKG7H
	Zbtnh+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJU6-00000007P3Z-0kPv;
	Tue, 18 Feb 2025 09:01:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJPm-00000007O7E-0hvR;
	Tue, 18 Feb 2025 08:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739869032;
	bh=SquZsIzoLNV/ScddoBqqYtNvHls6hV/j6HdDoLuHReA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WTYsTaJLxwvClHM0Xq6WIHtoyBSL4dL6tezkvyILCOs1tgmLcLlY4r/j9KnkN/GfU
	 wAZbYFsYZl3SjAqw7eRPmNjPD3WTu581lgBWZPqr65DpRKadXDpYfJffKo27Dw+VbA
	 /SY/EmUjFZzmIjAr68nXCFld45VGRO9aWZnhEpamVGGuna+O5OVXs7yv+v0grFiAna
	 yHUOakkZCarmgwOSwrbQLJugGJ9VOLuViJ9iUM2F1sH8IG6Blbxc80wnIS0KqAuEqT
	 ZBVWtYmIkek5ttyiLDW/06u8OmyAkrifsoCjXRu09bmYoDgFvHNY2X5yVRktYPAnbj
	 TSb3zfHDyOx9g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B63B517E0E8E;
	Tue, 18 Feb 2025 09:57:11 +0100 (CET)
Message-ID: <dac4879c-4354-40bb-91f3-3e7e4eb98c44@collabora.com>
Date: Tue, 18 Feb 2025 09:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] usb: mtu3: add support remote wakeup of mt8196
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
 <20250215100615.808-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250215100615.808-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005714_357048_9BC7ECF5 
X-CRM114-Status: GOOD (  16.01  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v3: add the ommitted third dual-role controller suggested by Angelo
> v2: add wakeup for dual-role controllers
> ---
>   drivers/usb/mtu3/mtu3_host.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
> index 7c657ea2dabd..8138b3f3096a 100644
> --- a/drivers/usb/mtu3/mtu3_host.c
> +++ b/drivers/usb/mtu3/mtu3_host.c
> @@ -46,6 +46,14 @@
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
> @@ -59,6 +67,9 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
>   	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
>   	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
> +	SSUSB_UWK_V1_7, 	/* mt8196 IP0 */
> +	SSUSB_UWK_V1_8, 	/* mt8196 IP1 */
> +	SSUSB_UWK_V1_9, 	/* mt8196 IP2 */
>   };
>   
>   /*
> @@ -100,6 +111,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
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
> +	case SSUSB_UWK_V1_9:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1_8196;
> +		msk = WC1_IS_EN_P2_96;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;



