Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FACD26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Bbk0z+0VFz7pKqIE/AUfFuALuk0M59BhsEARCrLwFE=; b=nOSBZrJzUNK6dDmCPwr5ugN1Sq
	r1sxyFo+BPq3Fdk9BqgHCBrtu5hFPVkXNGdodCVsKvvMAnWW0XxpidEUSqFGLMDIx8mcUc3VJ0Qq+
	07QWANhCOupf4dKRKHjmfDXeIKw88C7IIfSyE2lcJzKn0/t+lzlOW32MoSlHk5iN2MDuMT8FQtvsG
	FXBD1SnrmARNh1c4zzs1tabdUDSIDq4F41Om6Y+DmogeDbuSmEMdKfshJXpCJ6QRJ3FT1i2ai6cCu
	AMzw1cxEZTpTqMuK/RkPg7BaBWciKRxSAkazX7UCpjQS329vb3DCVjm1/hBYUrOzBOaYIiIQbCj+A
	YvuSOIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGC6-00000002ngE-3SPc;
	Fri, 09 Jan 2026 17:22:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGC4-00000002nf1-1QEb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 230184401E;
	Fri,  9 Jan 2026 17:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013C9C4CEF1;
	Fri,  9 Jan 2026 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979355;
	bh=ANMtR/alobtcTc1B2UvZS7tSAS69B3p/g2Gc9BywPbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nz6KMZGOR0IWeqrcGkzHUWt15KFX1u57rcmSi142rXY6IhUKCMxco2rLIZciMuJnl
	 8C/7D0f76zWMgRMyECqecQl4ck15bMVM1MqXCsEZb1sxZJ6OIzyjehuEjlzJkpqTck
	 YiVe26cVIund+DnlSquBzSPDjh6jAN/rxXUUdiUy6ekbqqe8KgbmBs/tVJIe+Nt0me
	 qvflVUseSsHMdKcTfYR7LjeuoyiYfx5oIfzugwKuNs7aNAVRmOlYijDCMm44nuzmeH
	 DAlajjQtAGsjWT5V+opkAbTE4Og3VhHVlxqHfo9CzeLphrWbyGDlxk+ssLxsfX+sU7
	 7dn2GxNm+sSIA==
Message-ID: <a6b5cf84-454e-4a43-b52f-d607c648864e@kernel.org>
Date: Fri, 9 Jan 2026 18:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] powerpc/wii: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092236_410151_113638A0 
X-CRM114-Status: GOOD (  15.02  )
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



Le 09/01/2026 à 17:57, Krzysztof Kozlowski a écrit :
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> 
> Depends on the first patch.
> ---
>   arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> index b57e87b0b3ce..1522a8bece29 100644
> --- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> @@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
>   void __init hlwd_pic_probe(void)
>   {
>   	struct irq_domain *host;
> -	struct device_node *np;
>   	const u32 *interrupts;
>   	int cascade_virq;
>   
> -	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
> +	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
>   		interrupts = of_get_property(np, "interrupts", NULL);
>   		if (interrupts) {
>   			host = hlwd_pic_init(np);
> @@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
>   			irq_set_chained_handler(cascade_virq,
>   						hlwd_pic_irq_cascade);
>   			hlwd_irq_host = host;
> -			of_node_put(np);
>   			break;
>   		}
>   	}
> 


