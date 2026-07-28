Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32CFC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1beK+cFwANFF7+QLDLiLnIs4tn13Ot6YgZ3DbzLzqw=; b=CjmQBtVv4gIJsS480XGvm+vwSn
	ckCX6uR4O1R35yx4W95KTFSTYZTKOQ4yfuJpgBwHUejwUkdbE5y93ZFZawTvAgkTj7zxgvLiJkhta
	k0J2sg0bE04cldrpxVGIKl4eVhf5WGTdm0kXoLWFJt8yS0JT5UfI1LcyNBetdUFPDMl3hcMNMov9O
	rtfKo2dbfAWpKwkDRjXoSlmjRJ6hF1pkBSF0XlSwuFxjCDNGoLIAv0RGyj9iDy/4bI9veA73QlOZS
	hM9TjnsezlOnMowJRL+20v8u6jCVGrTt92kZ2lQ32yaR6K+8zGajTNPuzsmzoNen+J9RMr0gGWV/H
	jJhWj9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYyN-00000004MOB-3gar;
	Tue, 28 Jul 2026 03:59:19 +0000
Received: from [113.46.200.218] (helo=canpmsgout03.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYyK-00000004MN2-2FOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:59:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g1beK+cFwANFF7+QLDLiLnIs4tn13Ot6YgZ3DbzLzqw=;
	b=GxlutKFRuM88/YgciUE7HB09cvbZi7sjFFbflMOh/8thGsr7D0MVKmYjHbvSnAxAKWgbU7Tg6
	d3eZK0qCNuNJElluJdy7y7XHdJmcZeX3HZd9gFBDq7oWM0WV0cWNB6gAEWzQrYgLFkhPLSf0q8I
	S7A0TtTznCYjIVsmHU7HQq0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h8M0h6l9hzpSwg;
	Tue, 28 Jul 2026 11:49:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E2C140579;
	Tue, 28 Jul 2026 11:58:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 11:58:55 +0800
Message-ID: <5dbe53d7-f242-4881-9123-6cde791fa67c@huawei.com>
Date: Tue, 28 Jul 2026 11:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 29/45] arm64: ptrace: Add PSR_ALLINT_BIT
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-30-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-30-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_205917_261563_BD97A7FE 
X-CRM114-Status: GOOD (  14.34  )
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
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> When FEAT_NMI is implemented, ALLINT is part of PSTATE and will be saved
> to SPSR on exception entry.
> As it can mask interrupts, depending on configuration, we will need to
> check its value in interruted tasks, so add the corresponding bit
> to ptrace.h.
> 
> Given its impact on interrupt and NMI masking, use it to update
> `print_pstate()` so that it displays ALLINT state.
> Display it after DAIF so that interrupt masking fields are together.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/uapi/asm/ptrace.h | 1 +
>  arch/arm64/kernel/process.c          | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
> index 6fed93fb2536..99352dd823cc 100644
> --- a/arch/arm64/include/uapi/asm/ptrace.h
> +++ b/arch/arm64/include/uapi/asm/ptrace.h
> @@ -48,6 +48,7 @@
>  #define PSR_D_BIT	0x00000200
>  #define PSR_BTYPE_MASK	0x00000c00
>  #define PSR_SSBS_BIT	0x00001000
> +#define PSR_ALLINT_BIT	0x00002000
>  #define PSR_PAN_BIT	0x00400000
>  #define PSR_UAO_BIT	0x00800000
>  #define PSR_DIT_BIT	0x01000000
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 0fd09136d398..c77d1e2b1b3a 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -183,7 +183,7 @@ static void print_pstate(struct pt_regs *regs)
>  		const char *btype_str = btypes[(pstate & PSR_BTYPE_MASK) >>
>  					       PSR_BTYPE_SHIFT];
>  
> -		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
> +		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cALLINT %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
>  			pstate,

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  			pstate & PSR_N_BIT ? 'N' : 'n',
>  			pstate & PSR_Z_BIT ? 'Z' : 'z',
> @@ -193,6 +193,7 @@ static void print_pstate(struct pt_regs *regs)
>  			pstate & PSR_A_BIT ? 'A' : 'a',
>  			pstate & PSR_I_BIT ? 'I' : 'i',
>  			pstate & PSR_F_BIT ? 'F' : 'f',
> +			pstate & PSR_ALLINT_BIT ? '+' : '-',
>  			pstate & PSR_PAN_BIT ? '+' : '-',
>  			pstate & PSR_UAO_BIT ? '+' : '-',
>  			pstate & PSR_TCO_BIT ? '+' : '-',


