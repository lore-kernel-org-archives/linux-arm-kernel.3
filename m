Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5648C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnmIazdeQHYpzKblSLNalRrkT+9gaVkxnchblPLJi8Q=; b=sOrN9/lbUKhLGf5U2D0WXgXtoC
	8mkCtUdiYPcmS8szBIii4B959z2MYyOMhfgfyyHYYfDfQY5xTW1UrgDZiuSpCSK/gU/kwJVo6cFK9
	1qE8A0JhPxnwX824uHI1Ii8mG/RQheiAbXcjH371dLxgrFAxbIsvHjKsQ3JKWSvjobM1LppWL1QO6
	r1HE8dzWSfKHreYH2ovgX3qfazltG8iEnIRjXGECEqNdlDV2VirqJGnUSS6BbD9HcLf2QZkmOveuP
	EauDkiSuB5abKQxeMbnDO/1CJ2TzaJirmxGDQsvlgjlLMsDutfHgIr47NBUUFztTXbfTM4H/LqDHS
	dd5BPJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkF0-0000000G52I-0Bil;
	Wed, 21 May 2025 14:16:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjsg-0000000G0EQ-2t1Y;
	Wed, 21 May 2025 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747835592;
	bh=hutYu+1ngX5Dt7IvfZMnK5eZXB31NtkXbIx/qn2SlPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R62vDqmrOkMKkmZxrNQeM1WnDBjhH9iGq2aBoELIjuvSW21xQwdOdspMpv9vY2XBn
	 xMlTG2M8DraIIaaBwmThC672MJYyytmXLcyGxoikKpfi0QhJ/6rui18W1vJblW50FZ
	 Qvugdm/jtNygoUE6njUoSB8FUMkXPHGwlo2TY0LUCgIxbFvz9g5QuTVcnZyxqjizJK
	 jSYBMy1xNX5g3uVv+p32u8fn2hGZ+fEy2YM9se/iUTd310tASWUhD8cbWjw9qYoTI9
	 r55n5ABClwoAHRSHB6p/swieW20LjJDQrxiXAsTc9Hnq5o7h2YeNtuoKIq0aVigBQc
	 207PIFL9zBhrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AD2E17E02BE;
	Wed, 21 May 2025 15:53:12 +0200 (CEST)
Message-ID: <557a5182-4843-4925-953e-09e3b1e41f0c@collabora.com>
Date: Wed, 21 May 2025 15:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hao Chang <ot_chhao.chang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_065314_885579_9A602E0D 
X-CRM114-Status: GOOD (  27.44  )
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

Il 20/05/25 23:15, Nícolas F. R. A. Prado ha scritto:
> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
> 
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
> 
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
> 
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
> 
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Completely changed approach to make mtk_eint_pin a parameter of
>    mtk_eint_do_init() as suggested by Angelo
> - Link to v1: https://lore.kernel.org/r/20250519-genio-350-eint-null-ptr-deref-fix-v1-1-07445d6d22c3@collabora.com
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c              | 26 ++++++++++--------------
>   drivers/pinctrl/mediatek/mtk-eint.h              |  5 +++--
>   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  2 +-
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c    |  2 +-
>   4 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 16af6a47028e67bb53db4041a37ebbbb8b9a1e43..d906a5e4101fb10968035fc48e9cf4a444d063a9 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -22,7 +22,6 @@
>   #include <linux/platform_device.h>
>   
>   #include "mtk-eint.h"
> -#include "pinctrl-mtk-common-v2.h"
>   
>   #define MTK_EINT_EDGE_SENSITIVE           0
>   #define MTK_EINT_LEVEL_SENSITIVE          1
> @@ -505,10 +504,9 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   
> -int mtk_eint_do_init(struct mtk_eint *eint)
> +int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   {
>   	unsigned int size, i, port, virq, inst = 0;
> -	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
>   
>   	/* If clients don't assign a specific regs, let's use generic one */
>   	if (!eint->regs)
> @@ -519,7 +517,15 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   	if (!eint->base_pin_num)
>   		return -ENOMEM;
>   
> -	if (eint->nbase == 1) {

Okay, dropping the nbase == 1 is sane, but that statement was actually documenting
the fact that *eint_pin is used only for multi-base EINT case, so please add those
comments:

> +	if (eint_pin) {

		/* EINT with multiple bases */

> +		eint->pins = eint_pin;
> +		for (i = 0; i < eint->hw->ap_num; i++) {
> +			inst = eint->pins[i].instance;
> +			if (inst >= eint->nbase)
> +				continue;
> +			eint->base_pin_num[inst]++;
> +		}
> +	} else {

		/* Single base EINT */

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for fixing this!


