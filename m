Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7174CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=; b=vNI9hjU9Q+O5pOzZqwW/72R/dN
	2ZPYtd1Ynn1xTFnJ91wkAtFHFKStVMxwlaPs2ApNVOGrcIAF8mm2bss+nk41DgRyJx1GLpUnMjkWL
	N5oGwfmaDllUWsKRr0fKc9s5X5i4dxVVOuRRHNOiuUqn3L715s9wdQZv95JHNMEisDCtgNNwHuVD8
	4As5tBqxsdNCeW+W++CZWo3uN4S62nM7b0xtNaL6vH0qYPkP2gLTxx/uDe8f0O/BvIPj6m2IdyEtX
	Pv0DnYZj5XrEX2tkmDsF1MFpVgDKNCM1VqIcwQuH85pstKQTyqSxGS6sVxazEG7I/OAPCja+itjCr
	Ft6T67lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OZ-0000000GQDw-2X9k;
	Mon, 17 Nov 2025 16:48:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OX-0000000GQD2-08Lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:48:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-298039e00c2so57746045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763398080; x=1764002880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=;
        b=NSyeivclh/xyt7grG3M5ADWlnNbEsV+1RmSvrM4TMfAfw+PHYYg7ZFelLY0VQDNqt2
         qVGKEApRkYJHLpJxrmeQcpCcE1dfBXLweoSBOr4lwgPDvE8+su2zfAHf69RVcbZNLtER
         1681xMJvXyJ0S1LwA04vndgBpZQWkMOHcDkEnHaQdWJQTkjJLgP3PjCKAlbx0/5Avh2Z
         Tzf5jRyBVUZbKUX97NHLXh++L5Mr50josiYL/yxiE1jUs7Te4Z5fxM2MjBfqoWjO8wYA
         iPNksDi38kRgiL9UIBSJrPxlkqw5ohzdeUq2Ks2iJxIr6/Bc/GkDXdRz///wtkb0linM
         4/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763398080; x=1764002880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx5pCt6UywoMhHGKyGxCGcYK9d/RLDNyjfLAZJe7BNY=;
        b=VURXvwKpzheOubMmLXr/evi+VBOwKyBTbOj7t+rckFmhmmwD/t8p9lyo0XqtbVQfTM
         xDD/9pwT8N7zzuHK319K3lG/eQdHuDU3hCx6YMp7uA7LNNFHiF5hV1aNjcl78fON6m7f
         65rkJg707qlamzSP5qbKO5DNgi/yz4zhFoD8ocNT1Q04hCdnWuwgdEcqYXkoSZBonqWY
         AR74R0F9eWze00ervchqJj/52f7KkO0ZYqkRG2ynHbkSp2+AFvZKOuw4U3VvF8qEnaOj
         ik0QDwaPMw7vURNFSSltBixcEudjBnim93sAggLv8TGCSa0iuM9crv4oIse/g0i5BG9s
         497w==
X-Forwarded-Encrypted: i=1; AJvYcCWyUujpeIspMZ+a0b/nyeEoxuyR4RoqsaFpw9JN8OJo57eMiZ9NDUOR/p+n6BfwwxulvN/5aD//lYME+s52B+R8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz89r05yavM63zw4n1bkjCc9BCYGlDc7TsvDfB5GVK32RrSJwPP
	HNcXVWlKkuZZFE2PWVfUm8gmQrDPKqs+EKc2khNPOqeRJRAemNPh8KwHytEGFejuOlY=
X-Gm-Gg: ASbGncsmQVEdobvva9yfOiN7WKYiXQH5FPidN3UpfoS6usZLir20UBRYeuOFQ+SKNL3
	HUqywCQmCtfDa80Bry8V9OmDSCqz6unLVev68dzKW9m3c3xwROL5t+jEqrjEKDtYH57qCP+xX3g
	uE8eXotO7hHndAO2jSLVbUr7QE/Ze/StBb+2AG5w5Ihdh5XVKQK7QqziX+/SnrcwztPA/YAQM4K
	eQWaRYUrfYzOiZ+yLWDH8YoRYdVd7k1lXJch5xA/K8KCdHkl7WSev2Pun78Or8t7+soJUpDz3Oe
	fzMegVE97CrYSoQZ1iiOwZ5xKb/LD9SsO8rZWffqQOZBOoMnzf54jkUGEpOY/XFxdt+6L2kVX80
	6wQZhYsIdHWC4skWUr2n9uGKxr30a0u2lKFGl5K+3g+4JRqoLuIEVZ1cZbmFbNGLUs90DuMIgGg
	U521sQXxFHuMKptQ==
X-Google-Smtp-Source: AGHT+IFOJfgBMktrjQ4WzqODR90mVSuboNdF+0l09QpBE2YhVUppij7GQo1/v8CGTNYHNVGS0fdYMw==
X-Received: by 2002:a17:903:24f:b0:290:9332:eebd with SMTP id d9443c01a7336-2986a6bc404mr159661345ad.10.1763398079908;
        Mon, 17 Nov 2025 08:47:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:df44:9b1b:6b35:3fb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed16sm144069755ad.86.2025.11.17.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:47:59 -0800 (PST)
Date: Mon, 17 Nov 2025 09:47:56 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] remoteproc: mediatek: Support platform reg
 offsets in mtk_scp_of_data
Message-ID: <aRtRvBZ1zaxW0N20@p14s>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
 <20251110101342.24261-2-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101342.24261-2-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_084801_087154_977794CA 
X-CRM114-Status: GOOD (  24.48  )
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

Good day,

On Mon, Nov 10, 2025 at 06:13:29PM +0800, Huayu Zong wrote:
> Some platforms only differ in HW register offsets, but can share
> the same API. Refine struct mtk_scp_of_data to allow setting HW
> register offsets via platform data, enabling better code reuse
> and easier support for new platforms.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  5 +++++
>  drivers/remoteproc/mtk_scp.c    | 18 ++++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index fd5c539ab2ac..d45480ad332e 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -112,6 +112,11 @@ struct mtk_scp_of_data {
>  
>  	u32 host_to_scp_reg;
>  	u32 host_to_scp_int_bit;
> +	u32 scp_to_host_ipc_clr_reg;
> +	u32 scp_to_spm_ipc_clr_reg;
> +
> +	u32 scp_secure_domain_reg;
> +	u32 scp_domain_value;
>  
>  	size_t ipi_buf_offset;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..c3c37cae933a 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -236,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  		 * MT8192_SCP2APMCU_IPC.
>  		 */
>  		writel(MT8192_SCP_IPC_INT_BIT,
> -		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
>  	} else {
>  		scp_wdt_handler(scp, scp_to_host);
>  		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
> @@ -561,7 +561,7 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
>  static int mt8192_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> -	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
> +	writel(0xff, scp->cluster->reg_base + scp->data->scp_to_spm_ipc_clr_reg);
>  
>  	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
>  
> @@ -575,6 +575,18 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
>  	/* enable MPU for all memory regions */
>  	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
>  
> +	/* Set the domain of master in SCP.
> +	 *
> +	 * In the SCP, cores, DMA, and SPI are masters. When these masters
> +	 * access memory or devices, they need to carry a domain ID. This
> +	 * domain ID is used to determine whether they have permission to
> +	 * access the target device or memory.
> +	 */
> +
> +	if (scp->data->scp_secure_domain_reg)
> +		writel(scp->data->scp_domain_value,
> +		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
> +

This change is not related to the description in the changelog, nor the other
changes in this patch.  Please do another patch.

>  	return 0;
>  }
>  
> @@ -1527,6 +1539,8 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_da_to_va = mt8192_scp_da_to_va,
>  	.host_to_scp_reg = MT8192_GIPC_IN_SET,
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
> +	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
>  	.scp_sizes = &default_scp_sizes,
>  };
>  
> -- 
> 2.45.2
> 

