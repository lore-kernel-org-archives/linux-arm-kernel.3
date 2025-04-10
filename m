Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D25C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+Yzj2sNit6Ca9Nf2dt31SOFg8bHzMrAn7WYk6TbiRY=; b=AkKGg0dDT5rqGpjoR87TdX2bqn
	IYOibCxa6EvPUBtdwKEX+NM1HhVuHe2h+WhHsjtWCTQVgquE8/KfqCXoqFi203OroUTi/M7Py7ILU
	XymVP8JsQmFOg8vOU4+yKbCE3zMhf+GeazxeOwXFl4vM/9zs0XLUvpZDJr0TkMPe7kEAJ19kBUXYP
	VKNPP5JjDQEZEu3V6FQW3xg3V7zGPzOAgV9f+6X/3LUmlsc6kRFiTn7L7TRCJXzeqQqLwz2cQGDMH
	n4LS42MmRV8YAY6SvulJ7JDjNFJyXFAgW9gZ9zAyxsk8MJLGj0RKGdomNlKzIvPZBVcU8ZbI1+Q7h
	sXYR/G7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4X-0000000AsMc-2jUN;
	Thu, 10 Apr 2025 14:40:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t2c-0000000As9t-32Jk;
	Thu, 10 Apr 2025 14:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744295884;
	bh=YIlYBspB5X+XSsa4+3taaxhNn00GpJC566S6ta2+o6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4nj2Sp8Tf9VIOV5k2nhD7NoAInQRKFJD+8YdNvg6jTh/3j8kLnWQU04ynl8hDRyr
	 gbTqLMoGfErFpSUnnVc6i7n1C3eQZn16X4OhICBZdT4Fj8VUQ2fbbtpry9Ou3gccyf
	 ao4qtKRRpgXp7ISs/+VkfudlB8pn4onEKm5OC8wAEXWxoelDzA+abhAX8uFdgRTpFb
	 CU+JNHU0SFW2K457DDauJENLNg/udLbLCAnRyG08pdLN99/pNbaw5mngPtdvX9w9Rs
	 FfY+70JYDEK72dlFbuUzFY9I7Tk6g+pPQpyIRbikveDOMZyTvcuh9Z3zqpEzyNiB7U
	 x95FUNMGqnlWA==
Received: from [192.168.33.15] (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6819517E078A;
	Thu, 10 Apr 2025 16:38:02 +0200 (CEST)
Message-ID: <d725bafb-8cd9-4f40-b708-2760776bda72@collabora.com>
Date: Thu, 10 Apr 2025 16:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: mtk-sd: Add condition to enable 'single' burst
 type
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.mao@mediatek.com,
 qingliang.li@mediatek.com, andy-ld.lu@mediatek.com,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250410075314.6439-1-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250410075314.6439-1-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073806_949219_5090BC62 
X-CRM114-Status: GOOD (  16.57  )
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

Il 10/04/25 09:52, Axe Yang ha scritto:
> This change add a condition for 'single' burst type selection.
> 
> Read AXI_LEN field from EMMC50_CFG2(AHB2AXI wrapper) register, if the
> value is not 0, it means the HWIP is using AXI as AMBA bus, which do
> not support 'single' burst type.
> 

You're missing a Suggested-by tag :-)

After adding it,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
> This change dependents on 'mmc: mtk-sd: Cleanups for register R/W':
> 
> https://patchwork.kernel.org/project/linux-mediatek/cover/20250325110701.52623-1-angelogioacchino.delregno@collabora.com/
> ---
>   drivers/mmc/host/mtk-sd.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ceeae1aeac94..2e4bd5166c17 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -84,6 +84,7 @@
>   #define EMMC51_CFG0	 0x204
>   #define EMMC50_CFG0      0x208
>   #define EMMC50_CFG1      0x20c
> +#define EMMC50_CFG2      0x21c
>   #define EMMC50_CFG3      0x220
>   #define SDC_FIFO_CFG     0x228
>   #define CQHCI_SETTING	 0x7fc
> @@ -306,7 +307,10 @@
>   /* EMMC50_CFG1 mask */
>   #define EMMC50_CFG1_DS_CFG        BIT(28)  /* RW */
>   
> -#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)  /* RW */
> +/* EMMC50_CFG2 mask */
> +#define EMMC50_CFG2_AXI_SET_LEN   GENMASK(27, 24) /* RW */
> +
> +#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)   /* RW */
>   
>   #define SDC_FIFO_CFG_WRVALIDSEL   BIT(24)  /* RW */
>   #define SDC_FIFO_CFG_RDVALIDSEL   BIT(25)  /* RW */
> @@ -1917,9 +1921,13 @@ static void msdc_init_hw(struct msdc_host *host)
>   	pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_CMDTA, 1);
>   	pb1_val |= MSDC_PB1_DDR_CMD_FIX_SEL;
>   
> -	/* Set single burst mode, auto sync state clear, block gap stop clk */
> -	pb1_val |= MSDC_PB1_SINGLE_BURST | MSDC_PB1_RSVD20 |
> -		   MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
> +	/* Support 'single' burst type only when AXI_LEN is 0 */
> +	sdr_get_field(host->base + EMMC50_CFG2, EMMC50_CFG2_AXI_SET_LEN, &val);
> +	if (!val)
> +		pb1_val |= MSDC_PB1_SINGLE_BURST;
> +
> +	/* Set auto sync state clear, block gap stop clk */
> +	pb1_val |= MSDC_PB1_RSVD20 | MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
>   
>   	/* Set low power DCM, use HCLK for GDMA, use MSDC CLK for everything else */
>   	pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |



