Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC14EFD877F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m298PNh82awEbCZpesQjsjOICXMLWI9vSli586MPFag=; b=cXZDdpfGnj9nORe9SUKeU+T1cv
	1/CEzSL9+50/eXiyQqnUwVAxVkrGMeVLpbL33GDIUi8LS+hd4mynpHV3/snbwXtDlz73ehdK5cZ8H
	DsTGg0EtMN7U9ydujikE9H1ZyL6NWN3HKHpobr8sFkoIn+V6qlu/PUNhk886BZmjanMxNLxFvECOq
	kusnV3/jYpqJ4raRJFGWIXly09gRk+E8aHR+oiNuGBqFj49RvW7hP/b8EQ+oEvJUGG53n5k8amVtG
	3w0ljmWwgJnUFdYFciNZdpLqqCNV+6W5wBo8PLfyUTVtUITAjlZortiLsJIfzF9YtsJ1imBuFAd3o
	exv1BK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VPR-00000006c4T-46bO;
	Tue, 17 Mar 2026 14:28:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VPP-00000006c3W-0T3l;
	Tue, 17 Mar 2026 14:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773757712;
	bh=xgA9BPpIqrsMRDp2X5EBDamcJXXwz037wPU/0xzBjXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KxwL5XwDzOo2dXu5guQMaRtmYSOakVuYSjawFEVhrmjjgslkFJ0noVqhN1WzvQLBl
	 7iZHFQWsMcCvHGEMCYPD0+FNubqjxdkcGlBUnJU+33NDtX6YAVIPv41MrMaef3GGq1
	 WkaXv6Orc5Aqu4esjTzo5nDrtQ/WwirFrGesMlLp9JwrlYRmmKeuBEkDJy7jEe3Iie
	 jdOdLZwhOdV8DB3E8X+ikCn+0FDL84bFeT84ffg72TUvNqxc9scl3JI41hfZKLzt8+
	 5KSD6aU2c5XYDjfim+xaaEXQ4r/vRKmGld5OZcyH2gtUAqOM/xwH3cxfkhL48O4Go3
	 P71eGIWuPcQwg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDA2317E0E3F;
	Tue, 17 Mar 2026 15:28:31 +0100 (CET)
Message-ID: <4e120931-9ae0-4332-aeb7-ab11926c4e00@collabora.com>
Date: Tue, 17 Mar 2026 15:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices
 without EINT
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260317110249.391552-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317110249.391552-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072835_310774_C1E8C020 
X-CRM114-Status: GOOD (  17.12  )
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

Il 17/03/26 12:02, Luca Leonardo Scorcia ha scritto:
> Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
> the mtk_eint_init function is always called and returns -ENODEV, which
> then bubbles up and causes probe failure.
> 
> To address this only call mtk_eint_init if EINT pins are present.
> 
> Tested on Xiaomi Mi Smart Clock x04g (mt6392).
> 
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

That's right. Not all do - and the ones that don't have eint support also won't
have the pm ops, so no further check is required.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index d6a46fe0cda8..3f518dce6d23 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1135,9 +1135,12 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   		goto chip_error;
>   	}
>   
> -	ret = mtk_eint_init(pctl, pdev);
> -	if (ret)
> -		goto chip_error;
> +	/* Only initialize EINT if we have EINT pins */
> +	if (data->eint_hw.ap_num > 0) {
> +		ret = mtk_eint_init(pctl, pdev);
> +		if (ret)
> +			goto chip_error;
> +	}
>   
>   	return 0;
>   


