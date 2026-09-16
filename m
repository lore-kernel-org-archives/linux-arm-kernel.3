Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84048C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdGRqtcPUgvr9d7/8kROmhFaMo4CDuCszhCRyj6sFbw=; b=Sm245qt2l4HLF1NjZy85Vxjcw+
	GVruGHlFJJB6I1LcwT+YZHhtPdagAKu6ZJ5JADMFaZ6oAmauxK1GGGJvzlaeYf9PA1nQRQzrewVAN
	EXlTRjwmO2EfdVz7c38Vgm3w+0TiD0BX1uDGZHu+d94/9NpPbQL40oWRDl0dwJjvrKOX1gWJdKTRZ
	J1rXOJMqiTRhfEJGUtM+iKYBWvnYGg1X+bbwOAn4ePsn+gKMYPQjS0fIEzFaUOjmsejEGG45PGFTs
	d/eeUpswnLtZqpiELA5FVUgp9cEdvDB0HmVAFDHq36JoXSx8eYLSan9hjyGVvlhEtiM7ZZ0JpzIO5
	bJI0Z4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lPA-00000008mGo-1FxX;
	Wed, 16 Sep 2026 08:54:12 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lP7-00000008mGA-33DQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:54:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OdGRqtcPUgvr9d7/8kROmhFaMo4CDuCszhCRyj6sFbw=;
	b=0iUFIuSmMjsxIaFI1Rs/lIOIZnOASyq7DsisPSrd/gzc0/DXDnAExisvyFqIkMDdXg6nUeVTM
	JDCq3/bQoYgMYJly6bo7wmbZbpPq7LDRTlifJc8Ct+BRIzJ4sSY88QEd4Wh+bqO1VZrkGspU2+O
	hFeI36JXvYZNMcaA/fuYP70=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hlC881LkvzRhVN;
	Wed, 16 Sep 2026 16:43:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 666BB4058F;
	Wed, 16 Sep 2026 16:54:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 16:53:59 +0800
Message-ID: <f84359c7-34d6-4658-8378-db3da94c674d@huawei.com>
Date: Wed, 16 Sep 2026 16:53:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/38] arm64: probes: Reject stepping over ALLINT
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-21-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-21-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_015409_955994_76668720 
X-CRM114-Status: GOOD (  15.46  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
> ALLINT instructions are not safe for probing. Both the register and
> immediate forms of MSR for ALLINT are currently rejected because they
> match aarch64_insn_is_msr_{imm,reg}(). However, MRS instructions
> accessing ALLINT need to be rejected explicitly.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/insn.h          |  1 +
>  arch/arm64/kernel/probes/decode-insn.c | 11 +++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 1ce75a442638..0a81b5feb2ed 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -118,6 +118,7 @@ enum aarch64_insn_special_register {
>  	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
>  	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
>  	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
> +	AARCH64_INSN_SPCLREG_ALLINT	= 0xC218,
>  	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
>  	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
>  	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> index 4137cc5ef031..a98d9d30fb4a 100644
> --- a/arch/arm64/kernel/probes/decode-insn.c
> +++ b/arch/arm64/kernel/probes/decode-insn.c
> @@ -36,11 +36,14 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
>  		/*
>  		 * The MRS instruction may not return a correct value when
>  		 * executing in the single-stepping environment. We do make one
> -		 * exception, for reading the DAIF bits.
> +		 * exception, for reading the DAIF and ALLINT bits.
>  		 */
> -		if (aarch64_insn_is_mrs(insn))
> -			return aarch64_insn_extract_system_reg(insn)
> -			     != AARCH64_INSN_SPCLREG_DAIF;
> +		if (aarch64_insn_is_mrs(insn)) {
> +			u32 sysreg = aarch64_insn_extract_system_reg(insn);
> +
> +			return (sysreg != AARCH64_INSN_SPCLREG_DAIF) &&
> +			       (sysreg != AARCH64_INSN_SPCLREG_ALLINT);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +		}
>  
>  		/*
>  		 * The HINT instruction is steppable only if it is in whitelist


