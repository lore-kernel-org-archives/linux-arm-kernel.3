Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B8C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro2FUdr/GGsMtVLQ1gJr2gFyuoebw7lx1o+85O09864=; b=g0DFfe6fiTk5Vm4r1xhSOUoAh2
	MBxlbws/wdrxToB0JaQlkL5X5YYOtJosFn4NXb/vmmFrBFwiMQOGG0iCr+ldNIMHc1WX37Pxjl30A
	HSIjRnO4V3qsM9XxSAqHnQSib8tLdWcKSMadsQolznkZOCQyrbw5Ua6BsC0uoVfsO4qh3zowKn6cf
	fyIs5mipKBJUl4HPLOyG1qII4R7Ve+6a3fDDr0W6I4ZeeOLRdA7Uphw///0mvZbpNKoRlelgnB9Kb
	wrsUtWuY5tlPQndh/88WC1fNz8zaJraDJmuq+qEFtQIZ20/OIavPttrXtQoXsLHSJrJn42vfGvlJ8
	hP3qkHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tasq5-0000000C1Qu-1zV5;
	Thu, 23 Jan 2025 08:45:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tason-0000000C17p-0uQV;
	Thu, 23 Jan 2025 08:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737621843;
	bh=X9iLHrmUCfUP0u/hzoqlgA/TZSQZ4GDtUBrIT1ITcKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OsBivDlg4M689K5Q0VmrPmfJVoY/rfmQfg2wL4mEAgd6RmviekHIoXogFtwHI6A78
	 PY/yfJTIA6e3ORDGUjMDfVU1HSApMsWkj7ZHg3tFIQIEA00F1wIpK8mbegxhhuRJuC
	 TsMoKdU7nGx2YIk8NlDjPYQ7jwWh2mGbN/Ot8LBo6yZ7L+jKMBf9FF+04khsvl3VLO
	 VNf7Jhfie9+CIsopJn5IzHKqu76YjD98Od9p8wO39maD9MUUSEhqN7OitsOsujrzyg
	 kvcVF8ZYN+HM8SK5KkXOMkezHpg7AseTq0kPKmXbFr1bsGp5NPu3YUcE3+8g10rUIX
	 jMGDJq2PJbn/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFB4A17E0E48;
	Thu, 23 Jan 2025 09:44:02 +0100 (CET)
Message-ID: <f7f414fc-1794-4e73-9b63-68df933a3244@collabora.com>
Date: Thu, 23 Jan 2025 09:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mtk-sd: optimize register settings for hs400(es)
 mode
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250123074442.1617-1-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250123074442.1617-1-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_004405_434237_E0D5FAFF 
X-CRM114-Status: GOOD (  18.49  )
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

Il 23/01/25 08:44, Andy-ld Lu ha scritto:
> For hs400(es) mode, the 'hs400-ds-delay' is typically configured in the
> dts. However, some projects may only define 'mediatek,hs400-ds-dly3',
> which can lead to initialization failures in hs400es mode. CMD13 reported
> response crc error in the mmc_switch_status() just after switching to
> hs400es mode.
> 
> [    1.914038][   T82] mmc0: mmc_select_hs400es failed, error -84
> [    1.914954][   T82] mmc0: error -84 whilst initialising MMC card
> 
> Currently, the hs400_ds_dly3 value is set within the tuning function. This
> means that the PAD_DS_DLY3 field is not configured before tuning process,
> which is the reason for the above-mentioned CMD13 response crc error.
> 
> Move the PAD_DS_DLY3 field configuration into msdc_prepare_hs400_tuning(),
> and add a value check of hs400_ds_delay to prevent overwriting by zero when
> the 'hs400-ds-delay' is not set in the dts. In addition, since hs400(es)
> only tune the PAD_DS_DLY1, the PAD_DS_DLY2_SEL bit should be cleared to
> bypass it.

The commit title is a bit misleading: you're not "optimizing" the settings,
but actually "fixing" a bug here!

Please fix the commit title.

> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

This commit needs a Fixes tag, please add the relevant one and resend.


> ---
>   drivers/mmc/host/mtk-sd.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4b6e91372526..4e3e31ddf84b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -273,6 +273,7 @@
>   #define MSDC_PAD_TUNE_CMD2_SEL	  BIT(21)   /* RW */
>   
>   #define PAD_DS_TUNE_DLY_SEL       BIT(0)	  /* RW */
> +#define PAD_DS_TUNE_DLY2_SEL      BIT(1)	  /* RW */
>   #define PAD_DS_TUNE_DLY1	  GENMASK(6, 2)   /* RW */
>   #define PAD_DS_TUNE_DLY2	  GENMASK(11, 7)  /* RW */
>   #define PAD_DS_TUNE_DLY3	  GENMASK(16, 12) /* RW */
> @@ -317,9 +318,10 @@
>   #define PAD_CMD_TX_DLY          GENMASK(16, 12)	/* RW */
>   
>   /* EMMC50_PAD_DS_TUNE mask */
> -#define PAD_DS_DLY_SEL		BIT(16)	/* RW */
> -#define PAD_DS_DLY1		GENMASK(14, 10)	/* RW */
> -#define PAD_DS_DLY3		GENMASK(4, 0)	/* RW */
> +#define PAD_DS_DLY_SEL          BIT(16) /* RW */
> +#define PAD_DS_DLY2_SEL         BIT(15) /* RW */
> +#define PAD_DS_DLY1             GENMASK(14, 10) /* RW */
> +#define PAD_DS_DLY3             GENMASK(4, 0)   /* RW */

Why are you changing tabulations with spaces?
Please use tabs.

Cheers,
Angelo


