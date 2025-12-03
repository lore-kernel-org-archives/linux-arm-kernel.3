Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6643CD1268E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP1b87XN1txUdIILpB75Gj5e9ga5Dx1y76JAdpg5jUA=; b=JYmTz37RJbZm/Xx2zndZLbnEy8
	dkRVqaQS57Jt1Pkkgf7Vdkz1sV3Wjs3sUGVBs6dAf2dvCVf8kHYJYtwXdi3yr4L+DnuQttITeMB5g
	Mn3zvi4+QtMcDt1nR0FgVnnpV674DhLxjsAh06P5j/388u6bHgv/hir+D0nFtaEYIzVBcyYBVnNbm
	wlBRI4EdcSsfGqkFckb6+g76z0njJ2YPGPlMJnuVzG//1l3U+omMx4JP0SU45+ZMTIXV1nMoWCEnv
	7gup4APlNPZAVz8KoCPjQZPC9v3XdwZpFblBAn8ALR40UdbEWDndcxYqKg+eHzsQJGpLP+HXABfUT
	0Nwk0EVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQftl-000000069py-448w;
	Wed, 03 Dec 2025 05:59:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQftk-000000069pY-0Snb;
	Wed, 03 Dec 2025 05:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764741567;
	bh=LfyQogt3DTFM7ha1LnLUaFOYzUdqSi1CQDR8mI30/CQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EmrhFwSnfdP3y87GlznXzY59fm3cTbYDYYc8JRk1l0wBks5RrzzhaopOpyKtbiULx
	 uGok86swZtfkzzYDD7urbm8wa7S8EuFjnrK2gRKFhMKeSGSbGOnlrHVLgxnZ3uUBuX
	 n5JNjySLs1BgsMlDTTsHCacNtV2z3cDKwNpS0RrkbzIjUG7n4WXh5cMPjQtji8ZZXs
	 3dsNHsKDVqkc9N36jx0gS/zqLKR17iUOytRZUIhQ5Pgtt6touv/QrB57KgT3WdtZ1n
	 1gNVo8SQ5PZogZ/4Yi85dux94xE6rl0r0CA7w7pwD9cvohiSh2iIj1H9zgIJTuk1ca
	 HT+yyZxSr8VDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDBE317E12D5;
	Wed,  3 Dec 2025 06:59:26 +0100 (CET)
Message-ID: <a709ada6-eb68-4609-ae8c-b3bb8bcf01ae@collabora.com>
Date: Wed, 3 Dec 2025 06:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: mtk-xhci: add support remote wakeup of mt8189
To: Mingjin Ge <mingjin.ge@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
 <20251203013521.2038888-2-mingjin.ge@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251203013521.2038888-2-mingjin.ge@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_215932_356757_F4BA80E4 
X-CRM114-Status: GOOD (  17.02  )
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

Il 03/12/25 02:34, Mingjin Ge ha scritto:
> Add remote wakeup configuration for the mt8189 in xhci-mtk driver.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Signed-off-by: Mingjin Ge <mingjin.ge@mediatek.com>

This is not the first time that I say this - and probably not the last one.

Please, stop hiding hardware - the MT8189 SoC has their XHCI controllers behind
MTU3 controllers.

Please add the wakeup configuration controls to MTU3.

I didn't check the datasheet and going by memory here, so here's what to do:
  - If there is no standalone XHCI controller (all of them have a MTU3 parent)
    *do not* add the UWK here in XHCI-MTK, but add it in MTU3 only;
  - If there is at least one standalone XHCI controller (which has no MTU3 parent)
    add UWK *both* in XHCI-MTK *and* in MTU3.

Regards,
Angelo

> ---
>   drivers/usb/host/xhci-mtk.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 8da05e9dfa28..134a46907db5 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -96,6 +96,10 @@
>   #define WC0_IS_P	BIT(12)	/* polarity */
>   #define WC0_IS_EN	BIT(6)
>   
> +/* mt8189*/
> +#define PERI_WK_CTRL0_8189	0x0
> +#define WC0_IS_EN_P_89		BIT(18)
> +
>   /* mt8192 */
>   #define WC0_SSUSB0_CDEN		BIT(6)
>   #define WC0_IS_SPM_EN		BIT(1)
> @@ -140,6 +144,7 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
>   	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
>   	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
> +	SSUSB_UWK_V1_10,	/* mt8189 IP all */
>   };
>   
>   /*
> @@ -407,6 +412,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
>   		msk = WC1_IS_EN_P2_96;
>   		val = enable ? msk : 0;
>   		break;
> +	case SSUSB_UWK_V1_10:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8189;
> +		msk = WC0_IS_EN_P_89;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;


