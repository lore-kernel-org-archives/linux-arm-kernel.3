Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22381C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz8wDO6G42zyzoSIh4oFvEfrRH3jsy+FFoWBGJrFqu4=; b=prJ86elEmPzLFBoYhlTrzv1EVL
	72tJUrLhN5l8DlvikrYFWMhACgtnsi3Q6zagVpgbsiHS3lkNDRA2EffNGp53XXT8y0bsiSg186i8l
	JMHXo4XGSTYnEK7NUeEsJaZexajBmTOsffphLm7eYE0AZjtfSbeai3SRejge2o3egQCUrMFi5IrNC
	ZEILKwyO6065w4ebIxK7/6MuXxZg9QLaiUI2JHw8wJpz4jk45tsClb9vuBoVXs36w4bhh7kswkAwV
	AOBmHU8QW/zo50Ul2QKKm7b+3KM8aEOXefcteJdi+/9jYSa0H9jeHVx1r6RuxrSFMoFkjXNZKdwOy
	rOTjKTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSFr-0000000BEnr-3p3O;
	Wed, 22 Jul 2026 08:24:39 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSFC-0000000BEf9-3DQY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:24:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hz8wDO6G42zyzoSIh4oFvEfrRH3jsy+FFoWBGJrFqu4=;
	b=L+k0YS+MZKpydUtImzNl+CT4EPApWWw+q57w95icZH+9PZJ3zC/PRMbaaG0X8Yn7GUOh6no0O
	nrRzwbxUq+w+JkgWlOiDb4LmLqH4D2CeOjffPUR7paHmoPAXapQosED2emc1FZE7/PKU8IbwQpi
	2V45uXcvIwoXM2vahgW62es=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h4n8n5V2Lz12LGB;
	Wed, 22 Jul 2026 16:14:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E19140575;
	Wed, 22 Jul 2026 16:23:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:23:51 +0800
Message-ID: <e3b3afb5-55d6-4537-9a81-fcdaaeec70d7@huawei.com>
Date: Wed, 22 Jul 2026 16:23:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 20/36] arm64: irqflags: Switch to
 CONFIG_DEBUG_IRQFLAGS
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-21-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-21-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012359_081218_596FA644 
X-CRM114-Status: GOOD (  12.49  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> All exception state debug logic now lives under the generic
> CONFIG_DEBUG_IRQFLAGS. Move the two remaining cases from the dedicated
> config option to CONFIG_DEBUG_IRQFLAGS as well, keeping all related
> debug logic under a single configuration option.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index 62f047702493..585d3ce15d80 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -47,7 +47,7 @@ static __always_inline void __daif_local_irq_enable(void)
>  
>  static __always_inline void __pmr_local_irq_enable(void)
>  {
> -	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
>  		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>  		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
>  	}
> @@ -76,7 +76,7 @@ static __always_inline void __daif_local_irq_disable(void)
>  
>  static __always_inline void __pmr_local_irq_disable(void)
>  {
> -	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
> +	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>  		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
>  	}


