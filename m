Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJmj5fQs6js8DPEkDWxWh0SpOhOreJFftTCYU+pcBQ8=; b=N2RjT8zLjzU53ZR5bm+ySYRNHR
	yJskjPgAMcLVeASbKDWIqfNc/cPSkmghXgPVIaAjHNR5NrSqhZ/bandz2EvOu9Yaza1NV7dIsWDzm
	yFEvOdg713TxdoqtBNmMXv3fncraXOSk9L52vulxL1t/KSz0+xJECOoqjHcg1i/zO7ZB4R64obi5h
	zUA3iOjHwUS+0Dmnbtuu9fzThnQou7P31tPtI/iHgd6WMQAmmQLoYiQ+4NlqSLLr4altGqKZxoyt1
	gulSjgGe6OlI7KZpSSTw+OmamZl1D3LDfUj2kDHLvSiUaEfiCT5YKHpyl6v/BzysUHOJfobGeSQ7S
	CnCTj2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAYk-00000008ohP-2PO4;
	Wed, 12 Nov 2025 13:06:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAYg-00000008ofv-2cGL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:06:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC20B1A1A2A;
	Wed, 12 Nov 2025 13:06:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA2F6070B;
	Wed, 12 Nov 2025 13:06:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD0FE102F16E2;
	Wed, 12 Nov 2025 14:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762952799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KJmj5fQs6js8DPEkDWxWh0SpOhOreJFftTCYU+pcBQ8=;
	b=NdqYIgXdiPgo1ApRvQNGKDs2APPqWG511zKG0iqoRl1PuluJCiEjN12pdh/SawE8qhiIjt
	YpYPEy6bGhuDeGiqOrbk4/RkY/XG7ZQzzRHK0MvRmdmCB/PCig3JXsfSOcAhbhU60ZjMPO
	2RrW4JzhhSyi7WQoFFSCldTcnhSYwiiG3LSTGSMsqr+KSfkVc4BP/i1yr9D3WgkfBQ/50u
	ZG9CV/QU6Ibp53/vJ8wai3bk8uFJU+WIolP3Yq1cF1TpNzZVGZDMb84yiPgBpy2n4oQj9J
	bIvTadDnU5ynVGLKoqxRI6zxGgpelxrxkw3f4dYrdFzXkMC9HRwKPuz7fQm1Sw==
Date: Wed, 12 Nov 2025 14:06:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 07/11] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
Message-ID: <202511121306329b57d6ee@mail.local>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-7-d46b72003fd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-7-d46b72003fd6@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_050646_795589_AD89A6AF 
X-CRM114-Status: GOOD (  17.98  )
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

On 12/11/2025 11:28:52+0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
> index 3cad30a40c19..e68853815c7a 100644
> --- a/drivers/irqchip/irq-atmel-aic-common.c
> +++ b/drivers/irqchip/irq-atmel-aic-common.c
> @@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
>  
>  static void __init aic_common_irq_fixup(const struct of_device_id *matches)
>  {
> -	struct device_node *root = of_find_node_by_path("/");
> -	const struct of_device_id *match;
> +	void (*fixup)(void);
>  
> -	if (!root)
> -		return;
> -
> -	match = of_match_node(matches, root);
> -
> -	if (match) {
> -		void (*fixup)(void) = match->data;
> +	fixup = of_machine_get_match_data(matches);
> +	if (fixup)
>  		fixup();
> -	}
> -
> -	of_node_put(root);
>  }
>  
>  struct irq_domain *__init aic_common_of_init(struct device_node *node,
> 
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

