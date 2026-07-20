Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52190C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K66VbKKgTaDr52VYrIDy5bpnubc/RNE2MTPjW18K5c=; b=X36VK4pfmkL9fhj1IyTVdaAGF6
	QF0KxiIS2Gtt1sx+SxYSas1+nCxiaG8kmPCsMjGnvDfndZO7xZpM/A79tpmQxm+1BwTESYGkybTPH
	C+yDI+b9RUHUgJtXP2eTtT65dTW5bZAQ/PrelaC8HEbcFD1nIWa/lXOx2qBnQPMA7Q3inQKyRoYqg
	oMZrhW4SG/e4zPg39OV0qPpvGlqQl+FBbeXWM2CB87xm+yOIQk2cx+WeBeOwdT3FTn7evhTkgPDUl
	PAEaQ7vhLmVIZAd/OlB6x48jdr/KiS86owM/CyaqfgicRl2AvJfk2oJkNIWzlz9K3e/IxRXwqcAq6
	WfWZ/IQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQO-00000006jXI-0x3Q;
	Mon, 20 Jul 2026 12:48:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQF-00000006jQ7-2URE;
	Mon, 20 Jul 2026 12:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784551717;
	bh=8al6kGjAgR8cWgWi9vo/v9SR3d7TNJ3OU/K1vjqdz8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+n4GOtYOKrCxhVCLmYXs7z6+9VGvsj7+ZRaecz5ZTAGQoHK5HoWrBp0yo038yQwf
	 mrgnTqRqBMO1rLacXFNZAPxRkenW2HDA1qdda4lYC0oFZLDIxFM4HtOCuslAtMlGj/
	 S7muLxa+SUxsLYzR2/jhCpV0RFyOlwO8FzyartADHgcJmI0y8DzupVmM3YLCKPt1nn
	 en9A/hcjvlThUpgLKZ4lIqV/thdQoBeVdkgpFEVpZxkpcwP70pNlQsl2wJpMgq5Ko8
	 s0/hWSPX/KbUg2sTethEuFzvLiyrPJjlUnoOPjCcNOKkJjCLbwOP79uv/0hP8iA1OZ
	 G+QstnTAb91qg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B0C317E0CF1;
	Mon, 20 Jul 2026 14:48:36 +0200 (CEST)
Message-ID: <c2b85740-4372-4609-a9fa-930010f5296a@collabora.com>
Date: Mon, 20 Jul 2026 14:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-2-9c13be99d077@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-nvmem-v1-2-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_054839_790426_B1F01B2C 
X-CRM114-Status: GOOD (  26.46  )
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

On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Some MediaTek SoCs, such as mt6572, don't support 8-bit reads, leading
> to zeroes or garbage data. 32-bit aligned reads must be used instead.
> 
> Introduce an 'needs_aligned_read' field to the platform data to enforce
> 32-bit aligned register access. All reads will be performed by reading
> 4-byte words and masking them.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

You're effectively overriding the entire mtk_reg_read function when
needs_aligned_read==true... so.... (check below)

> ---
>   drivers/nvmem/mtk-efuse.c | 31 ++++++++++++++++++++++++++++---
>   1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index af953e1d9230..1462f2760818 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -4,6 +4,7 @@
>    * Author: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>    */
>   
> +#include <linux/align.h>
>   #include <linux/device.h>
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
> @@ -14,10 +15,12 @@
>   
>   struct mtk_efuse_pdata {
>   	bool uses_post_processing;
> +	bool needs_aligned_read;
>   };
>   
>   struct mtk_efuse_priv {
>   	void __iomem *base;
> +	const struct mtk_efuse_pdata *data;

...instead of adding pdata here...

>   };
>   
>   static int mtk_reg_read(void *context,
> @@ -28,6 +31,26 @@ static int mtk_reg_read(void *context,
>   	u8 *val = _val;
>   	int i;
>   
> +	if (priv->data->needs_aligned_read) {
> +		u32 pos, shift, val32;
> +
> +		for (i = 0; i < bytes; i++, val++) {
> +			pos = reg + i;
> +
> +			/*
> +			 * Read on 32-bit word boundary or if it's the first
> +			 * iteration
> +			 */
> +			if (i == 0 || IS_ALIGNED(pos, 4))
> +				val32 = readl(priv->base + (pos & ~3));
> +
> +			shift = (pos & 3) * 8;
> +			*val = (val32 >> shift) & 0xff;
> +		}
> +
> +		return 0;
> +	}
> +
>   	for (i = 0; i < bytes; i++, val++)
>   		*val = readb(addr + i);
>   
> @@ -67,7 +90,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	struct nvmem_device *nvmem;
>   	struct nvmem_config econfig = {};
>   	struct mtk_efuse_priv *priv;
> -	const struct mtk_efuse_pdata *pdata;
>   	struct platform_device *socinfo;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -78,7 +100,8 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->base))
>   		return PTR_ERR(priv->base);
>   
> -	pdata = device_get_match_data(dev);
> +	priv->data = device_get_match_data(dev);
> +

...and instead of changing a bunch of lines here...

>   	econfig.add_legacy_fixed_of_cells = true;
>   	econfig.stride = 1;
>   	econfig.word_size = 1;

it's easier at this point if you simply do

	if (pdata->needs_aligned_read) {
		econfig.stride = 4;
		econfig.reg_read = mtk_reg_read_aligned;
	} else {
		econfig.stride = 1;
		econfig.reg_read = mtk_reg_read;
	}

and you avoid touching mtk_reg_read entirely.

Though it's not going to be used in any performance path, that's also faster as
there's one less branch per execution.

Cheers,
Angelo


