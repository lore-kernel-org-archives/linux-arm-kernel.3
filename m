Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF9CFC26F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwncLbpZ14oVgdgwdCOKoQWKYtVEcuz2LgYhgoPSLgs=; b=lZR5+eKkDvYh+ryw/YD9SSszgr
	u06dc3NoOGY+a93TGoFn1ktqjOXUC4Pj+Gh+ZYCk5Cp5clVBPrNDFh+0iGvj0q+C4NVD478Q8f8uE
	ijL8uSj9rkIeP5A3uS2EzUSiC/6NCcpR2wnGiw2X1OMR6oAPMlkT+8PYkkDEzcIr/cc/2PlVwej9X
	1QF/dGTPeGrOwVeRvOh8tBl78wEjulHD0koax4GrQipvtQUsnKNyDPjdRjUgIx4HHD6oU96iTa0Rq
	coT1cyTX+hwhaAP9G9MWagdgP9utIqghXRr9QVN44qU/VBrYBA/jeZyGhBcasik53BG2HskDfXtTK
	w5uVQngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQke-00000008Nne-2cx5;
	Fri, 21 Nov 2025 13:00:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQkb-00000008Nmr-2slQ;
	Fri, 21 Nov 2025 13:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763730030;
	bh=l+liJeHp0JkLlcj+7/9/4BqCexY09/RYvw3Uz3/qIX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qR8YYg9avpuPHoD1vt/phejYpeMFiuCav/44bcWP07kFaS6Zaq+l/++kBCzpHhQQE
	 BBkzZv2aUe+G7xBCNotgAFVaNcntSqi/LO2OrT9bHyQfqsvc5u98YlkragcAsbeBof
	 H4vpYAxrJpxJXwXu90oQ8CUE61Qm3swXuv5X2cQy1e1R3kkjf9QJB88TFUAvvWdrUc
	 OvAhUQhIqV8f0WiIff0MAbRpYpj5gFlvOe2/aKJLNBNwASr6x2OpKktLqcDT/hCQeQ
	 boVZwKoAuAUEIhgx/Os69bCCkin9qKPsIkhq1XvvqPDPxxNL4EfRGZZORs4J2Hc3lf
	 8y/VEVTNovyvQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A81117E05BE;
	Fri, 21 Nov 2025 14:00:29 +0100 (CET)
Message-ID: <acfc088f-7c54-4281-b816-a5f2eca23ecf@collabora.com>
Date: Fri, 21 Nov 2025 14:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] thermal/drivers/mediatek/lvts: Fail probe if
 temp_factor is zero
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 wenst@chromium.org, fshao@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
 <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_050033_906689_8C07FB83 
X-CRM114-Status: GOOD (  14.78  )
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

Il 21/11/25 12:16, Laura Nao ha scritto:
> temp_factor is used in lvts_temp_to_raw() and lvts_raw_to_temp(). If
> platform data is incorrect and temp_factor is zero, it could cause a
> division by zero. Fail the probe early to prevent a kernel crash.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1c54d0b75b1a..b49441d82ffd 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1346,6 +1346,11 @@ static int lvts_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	if (!lvts_data->temp_factor)
> +		return dev_err_probe(
> +			dev, -EINVAL,
> +			"temp_factor should never be zero; check platform data.\n");
> +

		return dev_err_probe(dev, -EINVAL,
				     "temp_factor should never be zero; check platform data.\n");

That's the only nitpick that I've got here, and I'm fine either way, anyway, as
this then kind of boils down to personal preference, in a way.

So, regardless of this getting fixed (by the maintainer or by you) or not:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   	golden_temp_offset = lvts_data->temp_offset;
>   
>   	ret = lvts_domain_init(dev, lvts_td, lvts_data);
> 


