Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E27F94CBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 03:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1K1FlPxerHkP3OtkAaVvdapzcdqZs+umHPjWMKa3OM=; b=pGORhlrWo1ntMe98cGiVKZFS+f
	g9zQvWwmxhA1CFlKDLUMumQE93fASe03lCkSqYtzyTYeLb3m3ZgiYs52w38Wdn2t3CDBeI8vSe5yd
	98JXD+S2SFlaY2uFezE+W6FP/rVHWE+509iu21CwqGDQyBxWB3ptZID0lmZOP35LtGYc6CFKPxl/7
	P0DMDoW029UyCZ1o8NzjIav0UQkJXZEFFE1/dIDpek1urEi59NYkTpRet4ycgUVXpJwi6OQE/K23g
	DwO1JBI9celqBAaOa5FsOEcTGI2sQYbLrWgj930+PPqLWgyYoewcnXZS5tL+Uu2IulFOJ2RGwXcUi
	OtZ6ZR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFNvL-00000009WzW-2kjF;
	Wed, 22 Apr 2026 03:06:47 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFNvI-00000009Wz5-2aTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 03:06:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=a1K1FlPxerHkP3OtkAaVvdapzcdqZs+umHPjWMKa3OM=;
	b=pW7G/dPxcTsFuEVM3uyarqrDXnKyps5rLrOKADI1Q7VoNCiMnQiunoJNWY67shG4vz6rSBb2u
	4nf/PTB3Ad59fahfG1fV0wmV8veEE7pL4yFdkMoA18EALbPOUelwQ7grv1LHj5KBIoagZGyjwG3
	804WW7mhG6/sCn1EHiqZn/g=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4g0kVP5P3dz1K99C;
	Wed, 22 Apr 2026 11:00:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0152C4056E;
	Wed, 22 Apr 2026 11:06:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 11:06:33 +0800
Message-ID: <dd2f076b-976c-480d-8414-e6685cad40dd@huawei.com>
Date: Wed, 22 Apr 2026 11:06:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: traps: Add a macro to simplify the condition codes
 check
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<kees@kernel.org>, <maz@kernel.org>, <ada.coupriediaz@arm.com>,
	<smostafa@google.com>, <leitao@debian.org>, <mrigendra.chaubey@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260320082846.1235016-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260320082846.1235016-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_200645_015248_C057AC40 
X-CRM114-Status: GOOD (  13.28  )
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



On 3/20/2026 4:28 PM, Jinjie Ruan wrote:
> Add DEFINE_COND_CHECK macro to define the simple __check_* functions
> to simplify the condition codes check.
> 
> No functional changes.

Gentle ping.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/traps.c | 59 ++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..6216fe9e8e42 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -49,45 +49,21 @@
>  #include <asm/system_misc.h>
>  #include <asm/sysreg.h>
>  
> -static bool __kprobes __check_eq(unsigned long pstate)
> -{
> -	return (pstate & PSR_Z_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_ne(unsigned long pstate)
> -{
> -	return (pstate & PSR_Z_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_cs(unsigned long pstate)
> -{
> -	return (pstate & PSR_C_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_cc(unsigned long pstate)
> -{
> -	return (pstate & PSR_C_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_mi(unsigned long pstate)
> -{
> -	return (pstate & PSR_N_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_pl(unsigned long pstate)
> -{
> -	return (pstate & PSR_N_BIT) == 0;
> -}
> -
> -static bool __kprobes __check_vs(unsigned long pstate)
> -{
> -	return (pstate & PSR_V_BIT) != 0;
> -}
> -
> -static bool __kprobes __check_vc(unsigned long pstate)
> -{
> -	return (pstate & PSR_V_BIT) == 0;
> -}
> +#define DEFINE_COND_CHECK(name, flag, expected)			\
> +static bool __kprobes __check_##name(unsigned long pstate)	\
> +{								\
> +	return ((pstate & (flag)) != 0) == (expected);		\
> +}
> +
> +DEFINE_COND_CHECK(eq, PSR_Z_BIT, true)
> +DEFINE_COND_CHECK(ne, PSR_Z_BIT, false)
> +DEFINE_COND_CHECK(cs, PSR_C_BIT, true)
> +DEFINE_COND_CHECK(cc, PSR_C_BIT, false)
> +DEFINE_COND_CHECK(mi, PSR_N_BIT, true)
> +DEFINE_COND_CHECK(pl, PSR_N_BIT, false)
> +DEFINE_COND_CHECK(vs, PSR_V_BIT, true)
> +DEFINE_COND_CHECK(vc, PSR_V_BIT, false)
> +DEFINE_COND_CHECK(al, 0, false)		/* Always true */
>  
>  static bool __kprobes __check_hi(unsigned long pstate)
>  {
> @@ -131,11 +107,6 @@ static bool __kprobes __check_le(unsigned long pstate)
>  	return (temp & PSR_N_BIT) != 0;
>  }
>  
> -static bool __kprobes __check_al(unsigned long pstate)
> -{
> -	return true;
> -}
> -
>  /*
>   * Note that the ARMv8 ARM calls condition code 0b1111 "nv", but states that
>   * it behaves identically to 0b1110 ("al").


