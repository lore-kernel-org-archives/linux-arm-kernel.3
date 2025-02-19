Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E55C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrnqLVDBWW+mF9ezkN3CjkgFYa7vo/xRQjq0L2epDyA=; b=dW2nnZJLPgqmgjiPKFrvknXROO
	FTjoETzIfKXssaju5fqVTaluiD1/2Lx6fXc1JJlg+W7Dhwz61MvacWOTXWkC7oApI3wbxOJ46SmaC
	TK25eSjZWyl9TvZyREWXWR2hFEXJs+CaKdnN2DOiExGnL4np9gDvXLtIsGhXPD/vNjBIFapAvMRDf
	SHk8GT3SUNj9n4c/RGjiDlk+hJvGw7QIviRbnPWtL+SmJcse1ERUMDXM4L00asIR8Gpcok1CQZeDl
	EoNzFyQBNTKXAN02jL7XDdcG3XQi1IWDAdrXexapAVKU2JFa0uQ6+SYYgMgLYIajdpeg/07YjexVt
	QGEkgIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklxK-0000000DXGG-3oWp;
	Wed, 19 Feb 2025 15:25:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklvq-0000000DWrc-05xj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:24:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so71452911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 07:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739978652; x=1740583452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrnqLVDBWW+mF9ezkN3CjkgFYa7vo/xRQjq0L2epDyA=;
        b=ieiWN5zcG3+w7frgw2xq36CQvjGe3vVw8EYGm9kxtw8ovDUYrv7FMDOBsUCJk50Cdj
         TbZr67EjEEhVHWlvwrdxEXfqklHl2k8/lwmpThJysFo8Q7N9PXEWZU6zVNSwpa7E8xcZ
         UM+RTNR9z56TEYWjvpWmwm1fAwzwpkgDNlWp6FmExxBd/kvzLcJ5vp9HmvOF6kKv2oHL
         Ldc3uTP6XwioRTOZlHSMYUX9HEvtWvsK+aY+M7rtO0Graq2ewNFoQhsWg2YAdDlsY6yY
         yBYNtvYylcCNLqDY97JbKR5Zi7oDlGtCu1R6ISJ25Yvzu1EVNecZ/qcmEKdwdND8S+Z6
         Xhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978652; x=1740583452;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrnqLVDBWW+mF9ezkN3CjkgFYa7vo/xRQjq0L2epDyA=;
        b=jqmR/LC8/uGXx5Zu+cDzOK7pOu/Q1bHqt6NaVqtsgRwaZ6M56dMW64drHW/MmfLs5F
         a7xw8/RUlI5qZ4/B7fsORFNYewr0s8lX3UXjS4A5ed4UWRoEoWSFZIIaKzICrYyT3PzM
         Rm9xtOOT7MHiMYYXNeR3z4/uq79E/bAPRYPLwYNfSTW1UF/VNYMZlS7mPpJ/SD+zZSc9
         DFQL1row0irQsA9kDUP8W3FUEprOtCvlzz/Yoy3Vuu1NCna00G5C/tLBCM5onG0erTlO
         kO5cpu1oUBey0+VGbGDW8p41L/v839voxeNk4vrF2riZ5F6DrMr1hLXmX2wSYrp2cvOs
         6agQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIJncFc0SRpMIOkWmplHZWWHFWSiXlzGaePl99vnPc1af5ttJ8E3HmkIttPUxPHiY9aI9SHPKZFhMj4STQ8mPE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Xtfofbuw4Ipuh5+8bL8rEe8jK0wy+fkFO1H4FboUXTx3Akn7
	yXSQAB63j+78lDD24/zzhGUJr5XKUKDaHd0RhnkxVLZ9X6FvM7u4
X-Gm-Gg: ASbGncu3c73KtRFGCExm6xGrQ+mDEaju+otRPa8aNPrh9U2F60T3NMzXJAqPcw5/hvQ
	K95I1BYsmUrZd7eQJ5A/fXpmLRpMZnaGLNZoLq7kEADe84YM18MW5OngrvvOLhicY+RKYz7LLmI
	6HlIQF38NAHYMY8iJ9VAM4xSkpCzloRgJELWgrG3A6zz1+CtkONAwUaoKDwt2LiuVrhvmCxX/Dn
	cKQkSHcf77r5G/rU+TVUvsjTdwnsP7LffHB/RfOZt7WqzUCgkU4k49jZvRC8zQVejXufq8iVyi3
	xamJ0ESt5bUTn7KzWpEnnllP1+oXjCQ7jKLTsQqoFfN4x6FKG37RkQHFy5PXUVNAlWtFMctsiCI
	iyb3A+npjVIFlQhOVOy1NvuMEbR2rLDpvMJV4
X-Google-Smtp-Source: AGHT+IH58UK3s7ffFDj3Gx60vr62hzm6v5h4jV30DbH78mNEHe20BtyvIiamX1TulZDRBvnCevPTXg==
X-Received: by 2002:a2e:b6c7:0:b0:308:e9ae:b5b3 with SMTP id 38308e7fff4ca-30a44dac868mr11254411fa.1.1739978651498;
        Wed, 19 Feb 2025 07:24:11 -0800 (PST)
Received: from ?IPV6:2001:999:400:2a04:e774:ddfe:347f:bb68? (n4bkk9yqra8wbkrzgx4-1.v6.elisa-mobile.fi. [2001:999:400:2a04:e774:ddfe:347f:bb68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3092fb236cbsm15172441fa.69.2025.02.19.07.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 07:24:10 -0800 (PST)
Message-ID: <bab71a0a-bc4c-4ec1-9db8-0d9153da505c@gmail.com>
Date: Wed, 19 Feb 2025 17:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Enable second resource range for
 BCDMA and PKTDMA
To: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com
References: <20250205121805.316792-1-s-vadapalli@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20250205121805.316792-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_072414_060467_72B0DF31 
X-CRM114-Status: GOOD (  17.84  )
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



On 05/02/2025 14:18, Siddharth Vadapalli wrote:
> The SoC DMA resources for UDMA, BCDMA and PKTDMA can be described via a
> combination of up to two resource ranges. The first resource range handles
> the default partitioning wherein all resources belonging to that range are
> allocated to a single entity and form a continuous range. For use-cases
> where the resources are shared across multiple entities and require to be
> described via discontinuous ranges, a second resource range is required.
> 
> Currently, udma_setup_resources() supports handling resources that belong
> to the second range. Extend bcdma_setup_resources() and
> pktdma_setup_resources() to support the same.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/dma/ti/k3-udma.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 7ed1956b4642..b223a7aacb0c 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -4886,6 +4886,12 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  				irq_res.desc[i].start = rm_res->desc[i].start +
>  							oes->bcdma_bchan_ring;
>  				irq_res.desc[i].num = rm_res->desc[i].num;
> +
> +				if (rm_res->desc[i].num_sec) {
> +					irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
> +									oes->bcdma_bchan_ring;
> +					irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
> +				}
>  			}
>  		}
>  	} else {
> @@ -4909,6 +4915,15 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  				irq_res.desc[i + 1].start = rm_res->desc[j].start +
>  							oes->bcdma_tchan_ring;
>  				irq_res.desc[i + 1].num = rm_res->desc[j].num;
> +
> +				if (rm_res->desc[j].num_sec) {
> +					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +									oes->bcdma_tchan_data;
> +					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> +					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
> +									oes->bcdma_tchan_ring;
> +					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
> +				}
>  			}
>  		}
>  	}
> @@ -4929,6 +4944,15 @@ static int bcdma_setup_resources(struct udma_dev *ud)
>  				irq_res.desc[i + 1].start = rm_res->desc[j].start +
>  							oes->bcdma_rchan_ring;
>  				irq_res.desc[i + 1].num = rm_res->desc[j].num;
> +
> +				if (rm_res->desc[j].num_sec) {
> +					irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +									oes->bcdma_rchan_data;
> +					irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> +					irq_res.desc[i + 1].start_sec = rm_res->desc[j].start_sec +
> +									oes->bcdma_rchan_ring;
> +					irq_res.desc[i + 1].num_sec = rm_res->desc[j].num_sec;
> +				}
>  			}
>  		}
>  	}
> @@ -5063,6 +5087,12 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  			irq_res.desc[i].start = rm_res->desc[i].start +
>  						oes->pktdma_tchan_flow;
>  			irq_res.desc[i].num = rm_res->desc[i].num;
> +
> +			if (rm_res->desc[i].num_sec) {
> +				irq_res.desc[i].start_sec = rm_res->desc[i].start_sec +
> +								oes->pktdma_tchan_flow;
> +				irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
> +			}
>  		}
>  	}
>  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RFLOW];
> @@ -5074,6 +5104,12 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  			irq_res.desc[i].start = rm_res->desc[j].start +
>  						oes->pktdma_rchan_flow;
>  			irq_res.desc[i].num = rm_res->desc[j].num;
> +
> +			if (rm_res->desc[j].num_sec) {
> +				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
> +								oes->pktdma_rchan_flow;
> +				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
> +			}
>  		}
>  	}
>  	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);

-- 
Péter


