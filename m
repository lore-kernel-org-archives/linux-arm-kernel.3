Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF715CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ww36d7lvRgL2utdgp0HYz+PlDtTfH54SleiAfqBREo=; b=Qwdt0FQzvLYFhE
	FOMHzvqprn86996SYjWfCS6Ck95WxYjoanOgOnCq/UOqTEEtJooO3lFgeqWSofakyAxiVy3YbkHtK
	WbrcGE+Oqh0nxaJIMLDdnA2/GJi5hk/yg3zrWVEPK/u0hP86bTghKI/JSkA8StW3qdzyZ7PZhhYAg
	etDmPGFq9OofWv+1dMbC7iSLMQPAqle4O9CegzxfXEPMZOV2Ll+/l1Ig+/X4daFgZX1537brq7Cgl
	PZeuaWe/1wdFJlRgLcdIvHNNsp+TxbFQFeWyI5kN6SUOaNQtq9uimrLtylqjAf7MqD9YPliNebAcf
	qZ9DI4LF5vMa66CGjwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiEB-00000003hgV-3XzF;
	Thu, 08 Oct 2026 07:07:43 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiE8-00000003hex-0KCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:07:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0ww36d7lvRgL2utdgp0HYz+PlDtTfH54SleiAfqBREo=;
	b=yIBsPu/xFBl0IFbXnRxjHpIDRhVx5Eujlk04HEvl6gc8FLhRkbMrUYP3XM71VGxdCn7Iufk+D
	jmUYjpNLHcc3Bi8yV7MncHhAnXQJPDOcpR9iHW/Ck6HevFTDLPh7vH6Q/wUh9fu8Lm0BFGxGrjP
	1FZVTG4cE8XZpL2hiP0+nq4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j0gjc686GzmV8f;
	Thu,  8 Oct 2026 14:55:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9746140572;
	Thu,  8 Oct 2026 15:07:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:07:29 +0800
Message-ID: <a3e6fd37-41be-4dfb-917d-c3e906bae56c@huawei.com>
Date: Thu, 8 Oct 2026 15:07:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of
 TPIDRRO_EL0
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-5-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-5-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_000740_540899_B33F9981 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> In preparation for storing 'current' in TPIDRRO_EL0, add support for the
> instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/insn.h | 1 +
>  arch/arm64/net/bpf_jit.h      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 1ce75a442638..0e739740513d 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -136,6 +136,7 @@ enum aarch64_insn_special_register {
>  };
>  
>  enum aarch64_insn_system_register {
> +	AARCH64_INSN_SYSREG_TPIDRRO_EL0	= 0x5e83,


Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
>  	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
>  	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
> diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
> index b2fe6e6dcf44..df469a005373 100644
> --- a/arch/arm64/net/bpf_jit.h
> +++ b/arch/arm64/net/bpf_jit.h
> @@ -331,6 +331,8 @@
>  	aarch64_insn_gen_adr(0, offset, Rd, AARCH64_INSN_ADR_TYPE_ADR)
>  
>  /* MRS */
> +#define A64_MRS_TPIDRRO_EL0(Rt) \
> +	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDRRO_EL0)
>  #define A64_MRS_TPIDR_EL1(Rt) \
>  	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDR_EL1)
>  #define A64_MRS_TPIDR_EL2(Rt) \

-- 
Best regards,
Jinjie


