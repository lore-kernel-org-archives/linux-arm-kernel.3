Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFFCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPnFVgPXFfqoYAL98IXJMUDkT5195axrCCachgtVSGM=; b=ko6OMjMsNsNq3Z/IAgl4MQRNzh
	ktadQmslrpa4K9mHTDhZsD0HdJcsOcCmMJURTMhO3t5y5yWlkBmv97VfbeKMEdiVBHJkqMADWfbW+
	aoobb87z6S7zFnV1MRuCjFPHd+5iCIsqQmaNG85VaRO/gIs/cgnZKz8TsriJ2KV7NAiYLWyUFwZwm
	YB5Fwleq3GvwMQ9RM7haPdKatQ62/hGAlVheKfLjNvm1SbEA/EjXXdvT4fineGXnCBY1EhdIuwKAY
	4lR062HexQnVuIcA/IPTyE/SWxIwSRHyB2s2n1kt15MKE8gYvLLt+CFGuxGKtKCsrse7vNVFZpaL3
	VIyBRgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrN-0000000GxqR-0pTi;
	Fri, 07 Nov 2025 09:34:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrJ-0000000Gxpu-1EUn;
	Fri, 07 Nov 2025 09:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762508053;
	bh=a5UV+lpy9dJymplUqRI6ybHCajuv+eTwea9Ciur0RJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fEglRBsPOQsTZmKXs8OKcLH0cWVanEagjfT04Qjlwm4ZuF27ym/Sjv9+KBKd20oiL
	 PnLIyErMJ3DYtEnAaB47eEveSPBg38+YWCKY49ISzuiBAozG6wW4K3buwuDchX7QDN
	 jEJge2CO6mPLeiXUGXN7is7jvmirC1WEcblWgoOlJsKrSu9lHmnQezKKubpf9mxvpS
	 1OZ/cAp9k9PwvrdQHBx3cY9gW3oF4XhKR5VthJYIP0CSPrzwaGdjZcivalB5SNFc0b
	 V1MgH/4a/XlmjhwqgN/Kwyis1+sms8+fu87uiJqs2XShNfPoLVHOyQr8+30TPH6WFA
	 I9Oywewz2w9qg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B10C17E0097;
	Fri,  7 Nov 2025 10:34:13 +0100 (CET)
Message-ID: <5faabbd0-2e7b-46ec-8da0-7be24f2e888e@collabora.com>
Date: Fri, 7 Nov 2025 10:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/21] clk: mediatek: fix mfg mux issue
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-4-irving-ch.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251106124330.1145600-4-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_013417_499242_3FB443FF 
X-CRM114-Status: GOOD (  18.10  )
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

Il 06/11/25 13:41, irving.ch.lin ha scritto:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> MFG mux design is different for MTK SoCs,
> For MT8189, we need to enable parent first
> to garentee parent clock stable.
> 

Title:
clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG rate

Also, please add a Fixes tag, this is not only useful for MT8189 - for the
others, this worked because the bypass (alt) clock is already enabled due to
it being a MFG power domain requirement, but the parent still needs to be enabled
otherwise there's no input clock to MFG during the PLL reconfiguration.

Besides, please clarify the commit description (and no, 8189 is not special
and doesn't really have a mux design that is all that different from the others).

> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mux.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index c5af6dc078a3..15309c7dbbfb 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -414,16 +414,20 @@ static int mtk_clk_mux_notifier_cb(struct notifier_block *nb,
>   	struct clk_notifier_data *data = _data;
>   	struct clk_hw *hw = __clk_get_hw(data->clk);
>   	struct mtk_mux_nb *mux_nb = to_mtk_mux_nb(nb);
> +	struct clk_hw *p_hw = clk_hw_get_parent_by_index(hw,
> +							 mux_nb->bypass_index);

Fits in one line, 84 columns is ok.

>   	int ret = 0;
>   
>   	switch (event) {
>   	case PRE_RATE_CHANGE:
> +		clk_prepare_enable(p_hw->clk);

You have to check for error here - if you can't enable the clock, your system
is going to crash as soon as you switch parents.

Cheers,
Angelo

>   		mux_nb->original_index = mux_nb->ops->get_parent(hw);
>   		ret = mux_nb->ops->set_parent(hw, mux_nb->bypass_index);
>   		break;
>   	case POST_RATE_CHANGE:
>   	case ABORT_RATE_CHANGE:
>   		ret = mux_nb->ops->set_parent(hw, mux_nb->original_index);
> +		clk_disable_unprepare(p_hw->clk);
>   		break;
>   	}
>   



