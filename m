Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0911C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxrWuNl3SXSf9NO1Rq8Dre7tCGp8j1UIrqacitAYA3U=; b=j04LnbWpk/6Sjn
	OCwDnlxGNJlGs/ccqJlReBzqV0hbhnOH2kixee+4gRj/owEv8gLrtGssOI4HLovJZpUUYtrDqAs4J
	Iqg/j1T/nA/9JxMtRlMnBdL/REj10KMjOhrZWcTV9QDBrtQFsGO4GMnc4HCHQrlGNYr9eUM379I+J
	9FjuvW+yOYref6Gj6T67DB6B7DPmUFXFOYrQcbu6JRAiMG4/r4KmbKzSJDzYeX6pcgjz9WVKRxWc+
	5r2BEqeDpubC6H4zGt/UgN2TVMpX8FwkpHmRSkSaLLSqP8z6p8UfiPAcEAcrh2fZdG18vBsGOBa18
	3OXJ3qnqaORllGuPr7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0nb-00000003wvq-2yzM;
	Fri, 10 Jul 2026 02:17:07 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0nY-00000003wuT-1ix2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:17:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZxrWuNl3SXSf9NO1Rq8Dre7tCGp8j1UIrqacitAYA3U=;
	b=5zAsRFEko8vj+Y7bEs3RqkkJ7qlDmGxAKbkz7OwwBjPn6EG2fSEcLMk6ffJwIuKA4dVwXoJyv
	xrl/18FVxdpO29rCj7Gilz5YVHBIH7nSeJ79BuZHQzJOLoidRx9/F+c4rFIAtc5vnMulf0DZZUV
	0vBosLYonfGi2HD63Lyf0C4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gxFbV22k4z1T4HL;
	Fri, 10 Jul 2026 10:07:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 69E774056D;
	Fri, 10 Jul 2026 10:16:53 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Jul 2026 10:16:52 +0800
Message-ID: <ef1ad41b-a8c0-4d14-8187-cd58f8153db9@huawei.com>
Date: Fri, 10 Jul 2026 10:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 26/36] arm64: ptrace: Add PSR_ALLINT_BIT
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-27-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-27-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_191705_078546_C56C83E6 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
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
> index ddda8d7aee24..8d4ceef4f67f 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -183,7 +183,7 @@ static void print_pstate(struct pt_regs *regs)
>  		const char *btype_str = btypes[(pstate & PSR_BTYPE_MASK) >>
>  					       PSR_BTYPE_SHIFT];
>  
> -		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
> +		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cALLINT %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
>  			pstate,
>  			pstate & PSR_N_BIT ? 'N' : 'n',
>  			pstate & PSR_Z_BIT ? 'Z' : 'z',
> @@ -193,6 +193,7 @@ static void print_pstate(struct pt_regs *regs)
>  			pstate & PSR_A_BIT ? 'A' : 'a',
>  			pstate & PSR_I_BIT ? 'I' : 'i',
>  			pstate & PSR_F_BIT ? 'F' : 'f',
> +			pstate & PSR_ALLINT_BIT ? '+' : '-',

Hi Vladimir,

This seems to be correct, but the status of the ALLINT bit
should not be displayed if FEAT_NMI is not enabled (system_uses_nmi()).

According to the ARM64 ALLINT manual,

	"On a Warm reset, this field resets to an architecturally UNKNOWN value."

If the hardware supports FEAT_NMI but the config is not enabled, the
value of the ALLINT bit is a random value, which is very misleading to
show it.

Best regards,
Jinjie


>  			pstate & PSR_PAN_BIT ? '+' : '-',
>  			pstate & PSR_UAO_BIT ? '+' : '-',
>  			pstate & PSR_TCO_BIT ? '+' : '-',


