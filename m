Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF43FD4694F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=; b=EnjMLQqEyoHtz+kyQgpWJTRUxe
	7/mhY/sR05iT3GC9ko6VrR94AD7xSu2PrYYlq07O+AWEl4v+XBwOzu4u/KdTUauVSp+SGhnHgIAVb
	ajkl/paaNCj3td4EdIzXfwY1zgucfdXfFdwh7KW5kWydhd9QUa2L+2sX9ALyVvPW2h4J9/3bVwL3s
	AdxY8XBPQxITOi7biHJ3UrM4GkuTht54+pe8mVp7lIJ9cQr5I7tNCtNiaRVqs1KQJqwHjdzKKjwlp
	D1BIc4pg9SQb0BELiGm51thjc+hVoebdtkNbfdRmihmMq26gYychjbiQq1rR9NQ8yfxPLJVzmUKm2
	kBdSoMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viatF-00000005mJT-4Avc;
	Wed, 21 Jan 2026 16:17:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viat9-00000005mIa-1OmA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:17:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4327555464cso3691354f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769012217; x=1769617017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
        b=gHEbnsQ02ErGFVQRCdTgttLks7s229z0D1VXYYMWSdUm2RsyBzQwjcxstb2K98FQ2Y
         bPq0HLxB8Rvj1e0RlFmzf4fk8AhcxU41PzM2F/jynt43wXzA42tnl0JoP13vj2EBUFfJ
         QbT8+WJKOCKyeRUCaL850Dq0LywTRIPln8I80hy1f+MWOC8MDZ3mxydQhDg8DhF1s4m+
         dtdFsNgnalzfjAx+gUEu/A3ilX8fECHGnyHlRJT+mU+OWs0iPzmTSaR3MIRwuxcNY+EV
         n6kNmg2/aBxQhywGCnpUd9GQOz0W4BsIq11cZcjbGZl2vDMp7KPeMSvvsv+K8cy3FZDs
         NJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012217; x=1769617017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
        b=DV/NFqBZcXkhXWC8A1qqbPFNmx0+3cr3j4qwz7Q54ff8n0sImhrLYct8nabSaxqeJO
         PUaMeq/4frkmb4LJIVkStOL52IAqYXVzWpLjLbNHaWEky3OSBSBmu/DNCrUVNbm32Y6J
         L4aSu08atlS0NDxSEftMX+TX1SeUFBijRr7QNwESfHt4VFVLjn0iaHtnYPe9Tpm11P3k
         webFKO7ghPlr3wFsQf5Z6/O+bZCun9TaRn+ZbEbHi481hbETjm7Q0ZZFrjnjtdWwuvaD
         i5KokiIcgJ8rr5gWwu8+yhkpMGMzntDBRf6hP0xTlS828Y76HvQpi3A2ZhH83n8XnU8G
         2aSg==
X-Forwarded-Encrypted: i=1; AJvYcCVhQYd7s/HZVuytqI27jw9kDQ3+9VkBaUjWqtTPVN8oIBSfbjmda+PIvCwPkzRwqOsaUaoiP/RMPOtQ5Su5w5R4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4qSQnSE6OZShBfoVwfD60Uhlgt+Zjcay3WExEC4VKwyuNYFdt
	RZiPsDD0y5V5bdBjV3/zrOCJbTK/HJyGLbjQ4+0ujvkCl7UsF1Z/2zPLTUSOJ5qPqJ4=
X-Gm-Gg: AZuq6aIFbzXM2NcdYq7Ljn012EtnFO30XVXkSocX9zpL28Ytjki4gJJWQ9xi4o6ShZu
	tqLAXNXR0HwcPxBybV5VX23GFteih2KYlX8ZDoZbzkmAav8A0Pn4U6B0l8BI87N/QTEITuypLVV
	fTm0O2n142Esmvh4roQSpDVgmYTaxQrcewrNtyUNSaMtbsEB6znH/dRGi/ThL5SFIO+4iTF4uec
	lOhTVEDs6An55aE72YOi8oj/g3hSIO2ZeqEwtUXeNUv9gcw3ML2pTGO4sp2sIcH6Y9jvfKxNntS
	JmmvLbz+OhlY3f+QXV7NXgvZhV9FgqV5QJUS88TwJYafMMFVyCz1sHsQ0BcwO0K3ZHBpNE/mMaq
	XajAFstmonSBS+ISE2JQU5e2v25vFoFj1dnMj0ImqrIVIZVGddAqD0Kjf6Fpx7zeSkMRCG/IzNr
	/Z3MHTzWTQif0LwZWjJZyAvgHU8xtd4evpJJ+Yj7g8GI9SudZAiM9WtQ8k5oRNi9+T
X-Received: by 2002:a05:6000:220e:b0:435:9770:9eb8 with SMTP id ffacd0b85a97d-4359770a243mr7280369f8f.25.1769012216858;
        Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358e24cef3sm12633429f8f.0.2026.01.21.08.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Message-ID: <1e2d0c75-35d1-4096-a96f-c3fc6f7ce52a@suse.com>
Date: Wed, 21 Jan 2026 17:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] stmmac: s32: enable support for Multi-IRQ mode
To: jan.petrous@oss.nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org
References: <20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com>
 <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_081659_444890_DECDD036 
X-CRM114-Status: GOOD (  23.50  )
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



On 21/01/2026 15:23, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> To get enabled Multi-IRQ mode, the driver checks:
> 
>    1) property of 'snps,mtl-xx-config' subnode
>       defines 'snps,xx-queues-to-use' bigger then one, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           snps,mtl-rx-config = <&mtl_rx_setup>;
>           ...
> 
>           mtl_rx_setup: rx-queues-config {
>               snps,rx-queues-to-use = <2>;
>           };
> 
>    2) queue based IRQs are set, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 0: tx, rx */
>                        <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 1: tx, rx */
>                        <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>           interrupt-names = "macirq",
>                             "tx-queue-0", "rx-queue-0",
>                             "tx-queue-1", "rx-queue-1";
> 
> If those prerequisites are met, the driver switch to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQ) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>   30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>   31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>   32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>   33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>   34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>   35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>   36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>   37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>   38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>   39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4
> 
> Otherwise, if one of the prerequisite don't met, the driver
> continue with MAC IRQ mode:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected
> 
> And only MAC IRQ will be attached:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
> 
> What represents the original MAC IRQ mode and is fully backward
> compatible.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..823700219534 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -2,7 +2,7 @@
>   /*
>    * NXP S32G/R GMAC glue layer
>    *
> - * Copyright 2019-2024 NXP
> + * Copyright 2019-2026 NXP
>    *
>    */
>   
> @@ -149,6 +149,17 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>   	plat->core_type = DWMAC_CORE_GMAC4;
>   	plat->pmt = 1;
>   	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQ) selected\n");
> +	} else {
> +		dev_info(dev, "MAC IRQ mode selected\n");
> +	}
> +
> +	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
>   	plat->rx_fifo_size = 20480;
>   	plat->tx_fifo_size = 20480;
>   
> 


