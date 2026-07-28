Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F207C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAFPdKF7awqisF2H3NWwPFuLQxRDWPQZnxcT7Rg1lG4=; b=Txetc3LJ7yRWugW4lw1/ASbnAv
	2wSdIhLdRMIT4ULwW+1BuynFZtOPebv6WWaUG8+EY+9VEcrM6NT62qwJjBXX/ovPt6B10BXBNGS7E
	TBSZ0E1POOtSOhfX8B/hu5HtVDu3mTMkthW1mKBDgf8uYFmtpRMevlkz5+/SJO/VXRzbp/zPMLSZL
	QBmPvuC2Dm9LWfDqBW+o8drw34j08kdLYA6S1ubfWdLI2Vrw1fDL7IPGbzUt7e88kBUwdDMY14zfD
	kLlNphHTUfIDm02JoWUO9f4WMAeMg58UK+UEjVypWpvBx2N25/1oeMf0geq3jhNhkdDj9W4f55rLV
	gXukcCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh0i-00000005Fqb-3Q87;
	Tue, 28 Jul 2026 12:34:16 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh0g-00000005Fq1-0HfK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:34:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vAFPdKF7awqisF2H3NWwPFuLQxRDWPQZnxcT7Rg1lG4=;
	b=X/aEwnN6q08CgCUyCqThv0GM0njjozv+C6Ib5kQPxbNXE6d6q9r2txzHYIWfHbeF6kpRmgEzj
	tZRmfAJGPP9MOvpdzHP/O5iHmNnaVNOsRAgFt0uVYtyhb/CgzVm66sW+hWKSRU8hNAXUQ6YMgYB
	kJAbn3obCQGv1Mox+rQiH/s=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h8ZQt73KSz1prKd;
	Tue, 28 Jul 2026 20:24:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C833202E6;
	Tue, 28 Jul 2026 20:34:07 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 20:34:06 +0800
Message-ID: <be90802b-a970-4f2b-84bd-ded8567573ac@huawei.com>
Date: Tue, 28 Jul 2026 20:34:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 43/45] arm64: smp: Add NMI support for LPI-backed
 IPIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-44-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-44-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053414_782344_7362656A 
X-CRM114-Status: GOOD (  17.80  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> LPI-backed IPIs are currently always requested and managed as regular
> IRQs. Allow IPIs selected by ipi_should_be_nmi() to be requested as
> NMIs, falling back to regular IRQs when the NMI request fails.
> 

It seems FEAT_NMI do not support LPI interrupt.

> Track which IPIs were successfully requested as NMIs so that the
> per-CPU enable and disable paths use the appropriate NMI helpers.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/smp.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 9bacdbb2aa44..012633ea8347 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1123,16 +1123,24 @@ static const struct ipi_irq_ops ipi_sgi_ops = {
>  
>  static void ipi_lpi_enable(int cpu, int ipi)
>  {
> -	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu)))
> +		enable_nmi(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +	else
> +		enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>  }
>  
>  static void ipi_lpi_disable(int cpu, int ipi)
>  {
> -	disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +	if (test_bit(ipi, get_ipi_nmi_bitmap(cpu)))
> +		disable_nmi_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> +	else
> +		disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>  }
>  
>  static void ipi_lpi_setup(int ipi, int ncpus)
>  {
> +	bool is_nmi = ipi_should_be_nmi(ipi);
> +
>  	for (int cpu = 0; cpu < ncpus; cpu++) {
>  		int err, irq;
>  
> @@ -1141,13 +1149,29 @@ static void ipi_lpi_setup(int ipi, int ncpus)
>  		err = irq_force_affinity(irq, cpumask_of(cpu));
>  		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
>  
> -		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> -				  NULL);
> -		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> +		/*
> +		 * Try to request NMI if it should be
> +		 */
> +		if (is_nmi && request_nmi(irq, ipi_handler, IRQF_PERCPU | IRQF_NO_AUTOEN, "IPI", NULL)) {
> +			/*
> +			 * Fallback to regular IRQ
> +			 */
> +			is_nmi = false;
> +		}
> +		/*
> +		 * Otherwise regular IRQ
> +		 */
> +		if (!is_nmi) {
> +			err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI", NULL);
> +			WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> +		}
>  
>  		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
>  
>  		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> +
> +		if (is_nmi)
> +			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
>  	}
>  }
>  


