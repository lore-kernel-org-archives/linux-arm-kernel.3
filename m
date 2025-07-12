Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E9AC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQzMwgCfXpTyf1wtWNBrErz9vPRbDl5e57j3qLO1Pqs=; b=sxpec9asM99FllQVnAyrqhL5l+
	L+I1zd4QAgvN3IuV/sMr2kovHXQfV+0sPXN7Zqwo+b1ysLq9ckGSl8cxRyv6/fF/XJrZTj/YrFWby
	k1XQrZf8kuDMoNE7ueXoOpP89vD1SjdLYuTOrSoiPl6TW+YtYX4vpCqyHVbKUC+sjuVM4X073+HIJ
	LY2TfPQq43zh9Ys6MyocE6ilrUNZdP5tlWpR7EzzAjPg8Z362ZqG1RjP+8IXYalLkoow59QGyvLc5
	GDydPNkMnuy6UiBu7Z8Jcmm/uUIzsZXA8oOpSh95z4jFlQpDZUUryYpcHyBFP9KnDfosi0uqk/228
	hFKsbKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaX2f-0000000GVeC-0vIh;
	Sat, 12 Jul 2025 10:01:13 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaX0G-0000000GVPg-18ct
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 09:58:46 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id aX07uAwtYRF46aX07ugsjT; Sat, 12 Jul 2025 11:58:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1752314319;
	bh=xQzMwgCfXpTyf1wtWNBrErz9vPRbDl5e57j3qLO1Pqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VgJFNz+RGbZ2n1SBwCe5aTpcGhugr2JpkJksiZS3iEx6hGiJNMez1hSOEOnb174VY
	 DtRMg3T0ByHGJO0akeSx2NRjEgiyZxZfcXZb98whoVtvccQj2bC1hIpUZX6q27lp3x
	 ROgki1ZmcV48O/e+Awtd06N9K15Kmt2y2xrZ2UN1a7RvuE/W1QB+28rBaSq0dzN5gI
	 OLsfumb75D6kyx++NrB3QgIYBD5SRiji7Radb0TAOK+XJx/DhdAD4ERr1TC7jkOUaU
	 x90aqw+4Rcf+s9t5PrWWYO7Dh+4UdI22a02P3frf+KaFrc54RQhNxsDTJKQcOmsu/x
	 4T+GfdL0leIMg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 12 Jul 2025 11:58:39 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a0e9473f-81a4-4933-aa63-e66fbeaf0824@wanadoo.fr>
Date: Sat, 12 Jul 2025 11:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/imx-irqsteer: Fix irq handling if an error occurs
 in imx_irqsteer_irq_handler()
To: Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Marc Zyngier <maz@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <ad6514c771fef0ac2d1b3c050c6db5d5e0fd034d.1731842478.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ad6514c771fef0ac2d1b3c050c6db5d5e0fd034d.1731842478.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_025844_714818_9F356DD3 
X-CRM114-Status: GOOD (  17.06  )
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

Le 17/11/2024 à 12:21, Christophe JAILLET a écrit :
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
> 
> Here, if (hwirq < 0), a early return occurs and chained_irq_exit() is not
> called.

After several month without any feedback, this is a polite ping.
Is this patch correct?

CJ


> 
> Add a new label and a goto for fix it.
> 
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> Review with care, irq handling is sometimes tricky...
> ---
>   drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 75a0e980ff35..59abe5a8beb8 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -135,7 +135,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
>   	if (hwirq < 0) {
>   		pr_warn("%s: unable to get hwirq base for irq %d\n",
>   			__func__, irq);
> -		return;
> +		goto out;
>   	}
>   
>   	for (i = 0; i < 2; i++, hwirq += 32) {
> @@ -153,6 +153,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
>   			generic_handle_domain_irq(data->domain, pos + hwirq);
>   	}
>   
> +out:
>   	chained_irq_exit(irq_desc_get_chip(desc), desc);
>   }
>   


