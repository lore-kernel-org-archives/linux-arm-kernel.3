Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B209C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEj0+zxkSnkv7FwS5UyzjVP6DzSeel5lFZG2ewe5Awk=; b=Kpj4YLEPyTDIR8FXPhXbYKPRR7
	i9XzNBEk2kdoLjnjIhRv6Qpqt3MK7ep5xeOuRPGus/K1sKTYshPycNVR7EDvyJMyjjgmnyf4CLw5l
	0EAH3Bg/oltd6PFOhKN+b9aI8qOm6LHWU06+hF7NBmsw7vESR1WnUZqJNcahigQ1VtxVOb4cN/OR0
	1jCiUYMcXLtyPhrkserDsp33lPoqvoAniURxzOLeuF+WiQ0+nMrH5HCesapwsfAdePnauLYN+GBw2
	yLV+yCfGQ++bBGnQHDQ/uP6+WbxopMdCKpy2q+3H8pFx3ig90G+S5lg6PeuhvYqy8wacvD13v5SSB
	Ll/fOJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBmy-00000008Y42-3rfr;
	Mon, 13 Jul 2026 08:13:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBmx-00000008Y3U-3S0y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 08:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uEj0+zxkSnkv7FwS5UyzjVP6DzSeel5lFZG2ewe5Awk=; b=fH+ot2jR6aLRxeQRGs8j4PvCB8
	uG1nOVXXE52/O/4VvXOqjc1Y7SFzpmf1rr9woP/55GNzQ6lVkfuJqy7KBk14XnutLFw5T7uz8RTVp
	TLilHuuRQGS0+BtHkXyLeM6qtxLyQnH0hWWubfEByA93Pg576NBXXOnrr/hfXbTPyV4M5sCOa6/sz
	Ml67o+wiOriU9RucewRmQ/nnzIczPL5YMKFC7fqTiY3sDha4mxBlBgNC7QIjsOJchVe8jx6umFVC7
	GlGu5eaOxPm2EIYSv6rieWwsQ7wgtF361Ffu5IR8KjEmzjn+Gf/SnTA9WIrFb87DBmVwLrC8YcQDO
	Asfw+X7g==;
Received: from [113.46.200.223] (helo=canpmsgout08.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjBmt-0000000BQYn-3xUC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:13:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uEj0+zxkSnkv7FwS5UyzjVP6DzSeel5lFZG2ewe5Awk=;
	b=cWSN1DRRobiqSJ6LD1n06uS5Y3kV72/yzEMxJNnvGJrr3G+nHramYdk88FtAT0LZxzmEa0Qn5
	jYy39V5yPsESU88zNuNAknctLy2+BwW6D+L5qQF15qPLUvLr0WJH5g12XuVE4qHh8JYZ7EOhHA8
	KTGGMstYyF+RjCeXRY0uczM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gzFLG39r9zmV6m;
	Mon, 13 Jul 2026 16:03:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B40CA402AB;
	Mon, 13 Jul 2026 16:12:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 16:12:35 +0800
Message-ID: <59213117-eff7-4472-ad1e-663b84c73a96@huawei.com>
Date: Mon, 13 Jul 2026 16:12:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 34/36] arm64: kprobes: Disable NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-35-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-35-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091316_837464_494D8149 
X-CRM114-Status: GOOD (  12.72  )
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
> Kprobes masks all DAIF exceptions to keep things simple and avoid
> nested exceptions. With FEAT_NMI, that is no longer enough. Mask
> ALLINT as well to ensure things stay simple.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index d9d25d184309..defbe6061546 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -193,17 +193,27 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
>   * the kprobe state is per-CPU and doesn't get migrated.
>   */
>  static void __kprobes kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,
> -						struct pt_regs *regs)
> +						 struct pt_regs *regs)
>  {
> -	kcb->saved_irqflag = regs->pstate & DAIF_MASK;
> -	regs->pstate |= DAIF_MASK;
> +	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
> +
> +	kcb->saved_irqflag = arm64_inherit_exc_hwstate(regs).flags;
> +
> +	regs->pstate &= ~(DAIF_MASK | PSR_ALLINT_BIT);
> +
> +	regs->pstate |= next.daif;
> +	regs->pstate |= next.allint;
>  }
>  
>  static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
> -						struct pt_regs *regs)
> +						    struct pt_regs *regs)
>  {
> -	regs->pstate &= ~DAIF_MASK;
> -	regs->pstate |= kcb->saved_irqflag;
> +	arm64_exc_hwstate_t prev = {.flags = kcb->saved_irqflag};
> +
> +	regs->pstate &= ~(DAIF_MASK | PSR_ALLINT_BIT);
> +
> +	regs->pstate |= prev.daif;
> +	regs->pstate |= prev.allint;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static void __kprobes setup_singlestep(struct kprobe *p,


