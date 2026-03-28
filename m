Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3CD10F3DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95zaNxNWfOjjGIPROCR7R2FAN16Jvi3ZaPMI1gG1deM=; b=O5Liixiq74nfb210VJabiyqMl0
	49FFeZI/fLrOf6tLsEEEbIISbhC/0DKwmuQk5kOvKvOfWiLmjw7LoNv8+p2YNQEMPP+TqXIlaNbdk
	ynYfS0HlqVG0uVXx2tHm1oI5e9cHJuhoHWXd3vILs73w6+4AiR3ZDHRSyVu+0qq4tpEWyjfJSxdJD
	5r08YxvjKHL46+rhgm/zHbmCntepCqR9LkBGpWZafMiyKwGGyNtmqFg9QgVCfmPcRXukiW2L+DAK6
	Cwu1QAbtdgI9v7HCRbdu/hqSsiguibTMJNv/v98xqRqa0bLQjele6Pm/xvCzOojc3DXoTnv6aFCfu
	9iRgRgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6T1X-00000008whe-1Kgt;
	Sat, 28 Mar 2026 12:44:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6T1W-00000008whY-1e0r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59C2660008;
	Sat, 28 Mar 2026 12:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A71C4CEF7;
	Sat, 28 Mar 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774701857;
	bh=79/1UCAkXJ1fRlik+68IZw07RZgWagd69fiPAJ12N9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dl1uAITdiByJc+r1+hUxJVh+hRdNG4RTjBoSTWp3vx0qwAar2zle63hTvqjpqkqmq
	 TKmvid4fmzCREO4y2CJTWjoMX3tvvvK5pZ9eo6EFv/G2YwMn2cMTLoAm7Fy+MQt+lK
	 YZPGr/Hwx8dmpOLdpY/Nl/Dh07scwVTxWvOO0JNl8AUJ+PyK0/kdsco58BzXlmcUwt
	 mbIr/ejLI/yEIB4OL+bFwPLdI4PnA4KGKgiBTV7fIZgwAdcdY1xXRSzCCakoOB1wcK
	 +oICL10lWhXTNurMEa7YLuUTiR6U2c0Fe2vtSJRLgCM1yS5I12jkwYnL1NgfGbS55O
	 i1vuPREYTpj/Q==
Message-ID: <abe56c71-06f6-4686-b861-02090f89e39d@kernel.org>
Date: Sat, 28 Mar 2026 13:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe_ports_ic: Add missing cleanup on device
 removal
To: Felix Gu <ustc.gu@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260310-qe_ports_ic-v1-1-608293026561@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260310-qe_ports_ic-v1-1-608293026561@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 09/03/2026 à 17:25, Felix Gu a écrit :
> [Vous ne recevez pas souvent de courriers de ustc.gu@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Add a devm action handler to properly clean up the irq_domain and
> chained handler when the device is removed.
> 
> Fixes: f0bcd784e1b7 ("soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>   drivers/soc/fsl/qe/qe_ports_ic.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
> index 8e2107e2cde5..5e3fae19f314 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -17,6 +17,7 @@
>   struct qepic_data {
>          void __iomem *reg;
>          struct irq_domain *host;
> +       int irq;
>   };
> 
>   static void qepic_mask(struct irq_data *d)
> @@ -92,11 +93,18 @@ static const struct irq_domain_ops qepic_host_ops = {
>          .map = qepic_host_map,
>   };
> 
> +static void qepic_remove(void *res)
> +{
> +       struct qepic_data *data = res;
> +
> +       irq_set_chained_handler_and_data(data->irq, NULL, NULL);
> +       irq_domain_remove(data->host);
> +}
> +
>   static int qepic_probe(struct platform_device *pdev)
>   {
>          struct device *dev = &pdev->dev;
>          struct qepic_data *data;
> -       int irq;
> 
>          data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>          if (!data)
> @@ -106,17 +114,18 @@ static int qepic_probe(struct platform_device *pdev)
>          if (IS_ERR(data->reg))
>                  return PTR_ERR(data->reg);
> 
> -       irq = platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       data->irq = platform_get_irq(pdev, 0);
> +       if (data->irq < 0)
> +               return data->irq;
> 
>          data->host = irq_domain_add_linear(dev->of_node, 32, &qepic_host_ops, data);
>          if (!data->host)
>                  return -ENODEV;
> 
> -       irq_set_chained_handler_and_data(irq, qepic_cascade, data);
> +       irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
> +
> +       return devm_add_action_or_reset(dev, qepic_remove, data);
> 
> -       return 0;
>   }
> 
>   static const struct of_device_id qepic_match[] = {
> 
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260310-qe_ports_ic-ca4c98bd1c4f
> 
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
> 

Applied, thanks.

