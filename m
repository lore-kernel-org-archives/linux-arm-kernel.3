Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8160BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7un43lbel7mKoax4H54SGCUpO7TSRceePp36dvszoA=; b=POe+1Nl42YTQBzcuLAOmu/P83w
	hwuxtPfvSzLPzlUKH+5yUGGrWMD0htq8ytLctciGsa27nDOzJeR9ip2U5yvopD5Kux+Swo1RUe0FF
	kLH/4PbKot9o0VBsQVODIst8tb1jgL57nvtF2Za6Ynw3zvTxuvoXaW4n3e9y31zF/8OmrtDyFp7HW
	uYjxwyzf/uSCD1zKR3WPVSmZGNwAOrzuHPJVHko4ByPYn2scOEvguoJRKnn9giQJ4QBLs7KLdH4bt
	/M1Rn6uv0bZu9Mv8a1G5n9WhHZ8gZrWPaBZ472HCWxrrZlIlMUuvI5K/kkIzBN/rNz9VvspIUVOr5
	eAJ+GLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnEQ-00000007uTH-2Xmz;
	Wed, 05 Mar 2025 11:48:10 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmKl-00000007kGA-1AEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:50:41 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6033EA0A17;
	Wed,  5 Mar 2025 11:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=T7un43lbel7mKoax4H54
	SGCUpO7TSRceePp36dvszoA=; b=cdOFHZh99rGVM1sM8QuDv5R3kyaOh7HarjnF
	2Uk3GvTuA6nMgAvWverUak1vcWMlNSQuVoat5zyNOWSIY/aLVLWJYgLrf0wiMZeK
	R+FMUq+YoLHkRsRmpZF8qMgDcQ0W20fxzkOedgvKH3Pgubfm0sQaE8reTq1ZaFRd
	HLsiF00eoatIpkjREbC+xM7EIFZsSlSKyEYE5ri0dhyxL1QmRCEQRlzi5/yArL0y
	03Q0aXQqCBPW5pXT8T1uwrpztTZC8g8+tRBGAg8Xh2ABH3duLXPWW2VbD/ZE8Dar
	gE73ZZEPWU7yEjTGMcgxruJj7rUDqzLTP4i1EqnT72MdMb68mXcjYrRg7pUOO2f8
	ETByJwjviTWH/P0EsFCM/NSuyk+bdwuxQ9ZaFy9LCLTGB5rMGHl0WZpzWbIGOC0o
	4LUillFcFmL3nE/mZtRkXpEd+SLzBSEqVWXxXqmUa44OyGW3t+Q5roexu8Y8Bhul
	K1jZ1e+NrlxBsK3miDLoBtAUy3f5Lu/Pt0PzZ/2mjax4zpaLUBIGxJW4XJsuKyWu
	BrxhY5CgZ79SUlhZG+3wZNefo/j/bmiIhosSIa0u1twFf/t+pznyhXuxmTp7YH/7
	KXmRSa2wizhO/r1lUXcO615G32hiQK4wTbY1T79Sp4lXi9TivMGzgBDvQxv7J5vW
	Qu6SEeE=
Message-ID: <93ce1511-53f6-42a3-b1a5-b6732105e87d@prolan.hu>
Date: Wed, 5 Mar 2025 11:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix undefined counter
 channel state on probe
To: William Breathitt Gray <wbg@kernel.org>, Kamel Bouhara
	<kamel.bouhara@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637D66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_025039_787095_EA72AB6D 
X-CRM114-Status: GOOD (  21.61  )
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

Hi,

thanks for fixing this up!

On 2025. 03. 05. 11:01, William Breathitt Gray wrote:
> Hardware initialize of the timer counter channel does not occur on probe
> thus leaving the Count in an undefined state until the first
> function_write() callback is executed. Fix this by performing the proper
> hardware initialization during probe.
> 
> Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
> Reported-by: Csókás Bence <csokas.bence@prolan.hu>
> Closes: https://lore.kernel.org/all/bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu/
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>
> ---
> This should fix the issue where a user needs to set the count function
> before they can use the counter. I don't have this hardware in person,
> so please test this patch and let me know whether it works for you.
> ---
>   drivers/counter/microchip-tcb-capture.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
> index 2f096a5b973d18edf5de5a2b33f2f72571deefb7..c391ac38b990939c6764a9120a4bd03289f68469 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -368,6 +368,25 @@ static int mchp_tc_probe(struct platform_device *pdev)
>   			channel);
>   	}
>   
> +	/* Disable Quadrature Decoder and position measure */
> +	ret = regmap_update_bits(regmap, ATMEL_TC_BMR, ATMEL_TC_QDEN | ATMEL_TC_POSEN, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Setup the period capture mode */
> +	ret = regmap_update_bits(regmap, ATMEL_TC_REG(priv->channel[0], CMR),
> +				 ATMEL_TC_WAVE | ATMEL_TC_ABETRG | ATMEL_TC_CMR_MASK |
> +				 ATMEL_TC_TCCLKS,
> +				 ATMEL_TC_CMR_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable clock and trigger counter */
> +	ret = regmap_write(regmap, ATMEL_TC_REG(priv->channel[0], CCR),
> +			   ATMEL_TC_CLKEN | ATMEL_TC_SWTRG);
> +	if (ret)
> +		return ret;
> +

This duplicates a lot of `mchp_tc_count_function_write()`. I'd much 
rather have this code in a separate function called something like 
`mchp_tc_setup_channels()`, that, depending on `priv->qdec_mode`, sets 
up the BMR, CCR and CMRs, and then have both probe() and 
function_write() call it. Or alternatively, have probe() call 
function_write() at the end, but that's not as nice.

> ---
> base-commit: 8744dcd4fc7800de2eb9369410470bb2930d4c14
> change-id: 20250305-preset-capture-mode-microchip-tcb-capture-fa31550ef594
> 
> Best regards,

Bence


