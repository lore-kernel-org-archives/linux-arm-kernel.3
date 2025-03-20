Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCjUOo6f4f2aKtsFcj76bOGdnL6cLXXHgqxOtND+w7Q=; b=KQj3WPZlOZTTM492+23uExJ7Ws
	whIzxSOX5QRFYaNWOg2QW6tU/00pO7Y4jQHOzNRqXDzAT4rLHKzOJBGzI3cmt/CKH+InJ023Yztdn
	0NyHGtZJAx1VD+2JpaqpRQonbSYz6K1SK3QTLqFm55o89JZBne1iOv1+eOka7nVcHpDppTWtRrl5O
	W8EcIbYt4NlOsNMJlcMXz4AhoGFh/fjvG4Ej89qjr6SbQCxKveU20zSzfgNPVk0eB4Xgl3sswIzq7
	oQF5Jy8QMqBTY5W5FaGiM+UE3Ec4tzFNal6qlypd6uLtQpWj3xEOTklUR3ljXjR/5g+4u0ezlM7Fx
	4mMw6p8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEx4-0000000C6dU-2hcB;
	Thu, 20 Mar 2025 12:24:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEkh-0000000C4d0-2Lke;
	Thu, 20 Mar 2025 12:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742472718;
	bh=G3JcQ/BlgiQc0S/ReTq/dq8fSXnz9sfijl/eiZ8CcP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FffAY59isVRHorZrbhXD+n65VxxVz63oUb0XIQRTjRlee6CWGE+r42VpQhlM1ylq6
	 /szAIG3T8mtS3pVeLHYE7Y7gOkeW5fzMECbCdvo2EwMhsRucGnIYMh660i0K9VHubV
	 AAbH2F7u57j+nI98KomtsbGkemVqS+DwThJVrMiHNmNd8CI/jhYIG14bBS5g+aotEx
	 wCeKeO7T9n9cM8WzC6+a86Itp7Z3eOnRSfu1iKjs7SA+Uz+pV0cIvANNHs6fqxMUO6
	 ew/rWmHaUgRZDGlXAUEmynRp1ajG4k/sjYtdfhCPEB5Q9S5m1ef4JaCpEbXUFz1nbu
	 kHuS9cYcgEnkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F1DD17E0607;
	Thu, 20 Mar 2025 13:11:57 +0100 (CET)
Message-ID: <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
Date: Thu, 20 Mar 2025 13:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
To: Xueqi Zhang <xueqi.zhang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wendy-st Lin <wendy-st.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250320073625.25225-3-xueqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_051159_749982_40B666A8 
X-CRM114-Status: GOOD (  21.90  )
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

Il 20/03/25 08:36, Xueqi Zhang ha scritto:
> MT8196 SMI commons is backed up/restored by RTFF HW.
> It doesn't need SW control the register backup/store
> in the runtime callback.Therefore, add a flag skip_rpm
> to help skip RPM operations for SMI commons.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>

So the MT8196 SMI common doesn't require any clocks?

That's fine for me, but this looks bloody similar to MT6989's SMI common, which
is SMI GEN3 and not GEN2....

....so, are you sure that you need a `skip_rpm` flag and not new MTK_SMI_GEN3 and
MTK_SMI_GEN3_SUB_COMM types? :-)

Regards,
Angelo

> ---
>   drivers/memory/mtk-smi.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index a8f5467d6b31..b9affa3c3185 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -123,6 +123,7 @@ static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1
>   struct mtk_smi_common_plat {
>   	enum mtk_smi_type	type;
>   	bool			has_gals;
> +	bool			skip_rpm;
>   	u32			bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
>   
>   	const struct mtk_smi_reg_pair	*init;
> @@ -547,6 +548,9 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
>   {
>   	int i, ret;
>   
> +	if (smi->plat->skip_rpm)
> +		return 0;
> +
>   	for (i = 0; i < clk_nr_required; i++)
>   		smi->clks[i].id = clks[i];
>   	ret = devm_clk_bulk_get(dev, clk_nr_required, smi->clks);
> @@ -783,7 +787,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>   	common->dev = dev;
>   	common->plat = of_device_get_match_data(dev);
>   
> -	if (common->plat->has_gals) {
> +	if (!common->plat->skip_rpm && common->plat->has_gals) {
>   		if (common->plat->type == MTK_SMI_GEN2)
>   			clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
>   		else if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
> @@ -814,13 +818,14 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>   	}
>   
>   	/* link its smi-common if this is smi-sub-common */
> -	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM) {
> +	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM && !common->plat->skip_rpm) {
>   		ret = mtk_smi_device_link_common(dev, &common->smi_common_dev);
>   		if (ret < 0)
>   			return ret;
>   	}
>   
> -	pm_runtime_enable(dev);
> +	if (!common->plat->skip_rpm)
> +		pm_runtime_enable(dev);
>   	platform_set_drvdata(pdev, common);
>   	return 0;
>   }



