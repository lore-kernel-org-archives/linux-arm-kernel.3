Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lgcXJbkmWxfoIl/l3mnMaLF4tf0hEEYiEUFZoCsgGI=; b=a7xpOc+lDD9C9RuGtxLGp51Uj8
	RxAaPHycizsGfaocYwhr40xovH0FQoVY28fq+z6xFzoaC1Z3ynZeRJKLUCUwNbmZqrAwyLPkfrzW4
	RxDad8Qup4FROyaN5Ca+L6gVqwHSniZGPm0uqK8cVvp6K8eA6NKcjmWpx+qB13tSvFQ8n4GXgxbTN
	hJuNZBLPryaIT1oYJH79zki3B1JYUdd6Vfc9Y2OQ9+KO916jOjrxwQ4CafclDn+f9Eyawb7qdOynZ
	/q3Z5MpQvzzVbeA+4x0+LiBfEYoT+RBEho3QXrKLpQoMiH8I0MTepTaTFd6VIohBFKhZgijmahfj8
	4ANRcNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpJE-00000007yDx-02p7;
	Fri, 15 May 2026 09:58:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpJB-00000007yDB-1i30
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839097; x=1810375097;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oWtNtLFEzhEorQ0wHbh9xN1hmDt/Ws71h7zt9GVd3PI=;
  b=KyLf/4L67wWL6uxbZWeE1JNUlvpVLmQfWVXUG0ArkkL1JjOC2ZuVIC70
   kIWbKZNjM9/eBwckMod4B/PLRk5jZOqIBmIGlz5fPBSaLrlhOwoV/mmfc
   NL/v1jJtgdeJGhG5fQBmm+C6xdr7SyYyC7bhlAZenZleZpUaPTh3t9YZ6
   cEzTD7OUF/CrO+EXdMKS5/r5NipS6ES04dqsYCpdnd+QSv+DV7lN+QPUr
   bs/WPaf4efx6x28UiIiZKgQalHrbbZW1xatXz37wR2UIRvJG4XBIVSePZ
   cndf80NT4sT2sp5duImN7DqrJDt83k4vm4oeE2HWvr1TL1PoDxMplcRgZ
   Q==;
X-CSE-ConnectionGUID: tPpFVbmlQVyUrJeCq5qw1g==
X-CSE-MsgGUID: OQ64741MRoSIOz0zCJfh6Q==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="scan'208";a="288921340"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 02:58:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 02:58:15 -0700
Received: from [10.159.205.44] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 02:58:13 -0700
Message-ID: <067c55c0-d56c-496e-bf75-5c3491524256@microchip.com>
Date: Fri, 15 May 2026 11:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] irqchip/atmel-aic5: Free SMR cache on init failure
To: Yuho Choi <dbgh9129@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260513233139.659956-1-dbgh9129@gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260513233139.659956-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_025817_464850_5CCF1442 
X-CRM114-Status: GOOD (  18.15  )
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

On 14/05/2026 at 01:31, Yuho Choi wrote:
> sama5d2_aic5_of_init() allocates the SMR cache before calling
> aic5_of_init(). If that fails, the cache is left allocated even though
> no IRQ domain was installed and the cache will not be used.
> 
> Free the cache on the failure path and clear the global pointer.

No aic5 = no viable system to run on: I'm not sure it's worth 
considering the case.

> Fixes: a50ac562ef48 ("irqchip/atmel-aic5: Handle suspend to RAM")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>   drivers/irqchip/irq-atmel-aic5.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
> index 1f14b401f71d..58650eb16880 100644
> --- a/drivers/irqchip/irq-atmel-aic5.c
> +++ b/drivers/irqchip/irq-atmel-aic5.c
> @@ -358,13 +358,22 @@ static int __init sama5d2_aic5_of_init(struct device_node *node,
>                                         struct device_node *parent)
>   {
>   #ifdef CONFIG_PM
> +       int rc = 0;
>          smr_cache = kcalloc(DIV_ROUND_UP(NR_SAMA5D2_IRQS, 32) * 32,
>                              sizeof(*smr_cache), GFP_KERNEL);
>          if (!smr_cache)
>                  return -ENOMEM;
> -#endif
> 
> +       rc = aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
> +       if (rc) {
> +               kfree(smr_cache);
> +               smr_cache = NULL;
> +       }
> +
> +       return rc;
> +#else
>          return aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
> +#endif
>   }
>   IRQCHIP_DECLARE(sama5d2_aic5, "atmel,sama5d2-aic", sama5d2_aic5_of_init);
> 
> --
> 2.43.0
> 


