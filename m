Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9wYGF4pOutbHnRA9CKnGsvb7OecahxdqMP8ccX3iVQ=; b=VD9zru34rNylo4L9yycufFJFwv
	eodMvLjNx8sqImewoq1XMAkFaf0POyF3APS9rCFR+VMoOvJYkI8Y+X4/66QBDJ7wh0ucvqFQA0Q3Q
	a0jAaIF3Frb4019Wegz5vM0xVBC1W+9tqTgHTVoyh4g0md7eE0qEq52UK+u/41NcmcsHvy7axvvPw
	Va8ul+WWrssOK5c0jm4vRJ0y+q8z5+ogpUp73Bt+n3dlS+QkeeDg3PvvHJp2IvLheO4HZxOouPaRz
	8oDM+YM/vGQVNpmGaBHq4WjUHgxPIZXyl771hEEnCOf+NX87M7Pa3uyvkPEl90oAsOXwwvsXesZqP
	3u+56Umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTg0-0000000Bciz-3kxm;
	Tue, 19 Aug 2025 21:15:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNd2-0000000AnTm-0696
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:48:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c5smJ5Yn5z13NM7;
	Tue, 19 Aug 2025 22:44:16 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AC7F18007F;
	Tue, 19 Aug 2025 22:47:49 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 22:47:48 +0800
Subject: Re: [PATCH] ACPI: AGDI: Add interrupt signaling mode support
To: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250818065437.85905-1-fj1078ii@aa.jp.fujitsu.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <57c0e289-8d03-785b-15a7-18df3763be8a@huawei.com>
Date: Tue, 19 Aug 2025 22:47:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250818065437.85905-1-fj1078ii@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_074800_866304_63A0B94E 
X-CRM114-Status: GOOD (  36.35  )
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

Hi Kazuhiro,

On 2025/8/18 14:54, Kazuhiro Abe wrote:
> AGDI has two types of signaling modes: SDEI and interrupt.
> Currently, the AGDI driver only supports SDEI.
> Therefore, add support for interrupt singaling mode
> The interrupt vector is retrieved from the AGDI table, and call panic
> function when an interrupt occurs.


> SDEI & Interrupt mode is not supported.

I think this can be removed, it's not allowed naturely.

> 
> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> ---
>   drivers/acpi/arm64/agdi.c | 114 +++++++++++++++++++++++++++++++++++---
>   include/acpi/actbl2.h     |   4 +-
>   2 files changed, 110 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
> index e0df3daa4abf0..c514bb874c5d3 100644
> --- a/drivers/acpi/arm64/agdi.c
> +++ b/drivers/acpi/arm64/agdi.c
> @@ -16,7 +16,11 @@
>   #include "init.h"
>   
>   struct agdi_data {
> +	unsigned char flags;
>   	int sdei_event;
> +	unsigned int gsiv;
> +	bool use_nmi;

will we use normal interrupt as the signaling?

In the spec, it says:

Some use-cases, such as system management, require the ability to
generate a non-maskable event to the OS to request the OS kernel to
perform a diagnostic dump and reset the system.

Seems only non-maskable event is allowed, Sudeep, any idea about this?

> +	int irq;
>   };
>   
>   static int agdi_sdei_handler(u32 sdei_event, struct pt_regs *regs, void *arg)
> @@ -48,6 +52,55 @@ static int agdi_sdei_probe(struct platform_device *pdev,
>   	return 0;
>   }
>   
> +static irqreturn_t agdi_interrupt_handler_nmi(int irq, void *dev_id)
> +{
> +	nmi_panic(NULL, "Arm Generic Diagnostic Dump and Reset NMI Interrupt event issued\n");
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t agdi_interrupt_handler_irq(int irq, void *dev_id)
> +{
> +	panic("Arm Generic Diagnostic Dump and Reset Interrupt event issued\n");
> +	return IRQ_HANDLED;
> +}
> +
> +static int agdi_interrupt_probe(struct platform_device *pdev,
> +				struct agdi_data *adata)
> +{
> +	unsigned long irq_flags;
> +	int ret;
> +	int irq;
> +
> +	irq = acpi_register_gsi(NULL, adata->gsiv, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_HIGH);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "cannot register GSI#%d (%d)\n", adata->gsiv, irq);
> +		return irq;
> +	}
> +
> +	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
> +		    IRQF_NO_THREAD;
> +	/* try NMI first */
> +	ret = request_nmi(irq, &agdi_interrupt_handler_nmi, irq_flags,
> +			  "agdi_interrupt_nmi", NULL);
> +	if (ret) {
> +		ret = request_irq(irq, &agdi_interrupt_handler_irq,
> +				  irq_flags, "agdi_interrupt_irq", NULL);
> +		if (ret) {
> +			dev_err(&pdev->dev, "cannot register IRQ %d\n", ret);
> +			acpi_unregister_gsi(adata->gsiv);
> +			return ret;
> +		}
> +		enable_irq(irq);
> +		adata->irq = irq;
> +	} else {
> +		enable_nmi(irq);
> +		adata->irq = irq;
> +		adata->use_nmi = true;
> +	}
> +
> +	return 0;
> +}
> +
>   static int agdi_probe(struct platform_device *pdev)
>   {
>   	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
> @@ -55,12 +108,20 @@ static int agdi_probe(struct platform_device *pdev)
>   	if (!adata)
>   		return -EINVAL;
>   
> -	return agdi_sdei_probe(pdev, adata);
> +	switch (adata->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
> +	case ACPI_AGDI_SIGNALING_MODE_SDEI:
> +		return agdi_sdei_probe(pdev, adata);
> +
> +	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
> +		return agdi_interrupt_probe(pdev, adata);
> +	}
> +
> +	return 0;
>   }
>   
> -static void agdi_remove(struct platform_device *pdev)
> +static void agdi_sdei_remove(struct platform_device *pdev,
> +			     struct agdi_data *adata)
>   {
> -	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
>   	int err, i;
>   
>   	err = sdei_event_disable(adata->sdei_event);
> @@ -83,6 +144,34 @@ static void agdi_remove(struct platform_device *pdev)
>   			adata->sdei_event, ERR_PTR(err));
>   }
>   
> +static void agdi_interrupt_remove(struct platform_device *pdev,
> +				  struct agdi_data *adata)
> +{
> +	if (adata->irq != -1) {
> +		if (adata->use_nmi)
> +			free_nmi(adata->irq, NULL);
> +		else
> +			free_irq(adata->irq, NULL);
> +
> +		acpi_unregister_gsi(adata->gsiv);
> +	}
> +}
> +
> +static void agdi_remove(struct platform_device *pdev)
> +{
> +	struct agdi_data *adata = dev_get_platdata(&pdev->dev);
> +
> +	switch (adata->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
> +	case ACPI_AGDI_SIGNALING_MODE_SDEI:
> +		agdi_sdei_remove(pdev, adata);
> +		break;
> +
> +	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
> +		agdi_interrupt_remove(pdev, adata);
> +		break;
> +	}
> +}
> +
>   static struct platform_driver agdi_driver = {
>   	.driver = {
>   		.name = "agdi",
> @@ -94,7 +183,7 @@ static struct platform_driver agdi_driver = {
>   void __init acpi_agdi_init(void)
>   {
>   	struct acpi_table_agdi *agdi_table;
> -	struct agdi_data pdata;
> +	struct agdi_data pdata = {0};
>   	struct platform_device *pdev;
>   	acpi_status status;
>   
> @@ -103,12 +192,23 @@ void __init acpi_agdi_init(void)
>   	if (ACPI_FAILURE(status))
>   		return;
>   
> -	if (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE) {
> -		pr_warn("Interrupt signaling is not supported");
> +	switch (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE_MASK) {
> +	case ACPI_AGDI_SIGNALING_MODE_SDEI:
> +		pdata.sdei_event = agdi_table->sdei_event;
> +		break;
> +
> +	case ACPI_AGDI_SIGNALING_MODE_INTERRUPT:
> +		pdata.gsiv = agdi_table->gsiv;
> +		break;
> +
> +	default:
> +		pr_warn("Signaling mode(%d) is not supported",
> +			agdi_table->flags & ACPI_AGDI_SIGNALING_MODE_MASK);
>   		goto err_put_table;
>   	}
>   
> -	pdata.sdei_event = agdi_table->sdei_event;
> +	pdata.irq = -1;
> +	pdata.flags = agdi_table->flags;

My major concern is about the normal interrrupt as the event, not sure
if it is ok, let's figure it out first.

>   
>   	pdev = platform_device_register_data(NULL, "agdi", 0, &pdata, sizeof(pdata));
>   	if (IS_ERR(pdev))
> diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> index 048f5f47f8b88..9ddbdd772f139 100644
> --- a/include/acpi/actbl2.h
> +++ b/include/acpi/actbl2.h
> @@ -339,7 +339,9 @@ struct acpi_table_agdi {
>   
>   /* Mask for Flags field above */
>   
> -#define ACPI_AGDI_SIGNALING_MODE (1)
> +#define ACPI_AGDI_SIGNALING_MODE_MASK (3)
> +#define ACPI_AGDI_SIGNALING_MODE_SDEI (0)
> +#define ACPI_AGDI_SIGNALING_MODE_INTERRUPT (1)

You need to send a patch to ACPICA first to add interrupt support,
this file belongs acpica.

Thanks
Hanjun

