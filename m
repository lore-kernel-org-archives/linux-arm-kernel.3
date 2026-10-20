Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADF606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QArQK+uX;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XMt+71Wm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEhpgBC/mc4EH9bST9MKfSQhY0BtN9xgVwjRTcFlNOc=; b=QArQK+uXQMi/uuKTS2hyOOLoPg
	ERGo8FUrrbAMxkXBdTs2ldh2bfkE2KOrwr632E0rH/oHqMuFiqp8E2ePvEqW/28aAoCXru0Ai70p/
	CP3GVvki29pc6Vh/KsoXG90jBwXpUjTYu4Yr/P1x/sSnCTo5ONxCd1vfZeGz/X4xjNDAEx9kuOM/n
	0KaOB7hN0GPquPR6DLU9BY4PBdKDxStk/PAxyGiZXlaB8gEKKDtMzIHFa1pVw5u/YAbYf7eixMIEw
	egYMRUdzBoWnyBN2JAdc+z4diTWDb5KdBCz+Gfsbtc884J4HIr3mJ1cugN8hDFd6wTcj+CBDMOmmy
	TINWjBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6pd-00000009PDn-07mx;
	Tue, 20 Oct 2026 10:12:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6pZ-00000009PD0-2t1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:12:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03F361596;
	Tue, 20 Oct 2026 03:12:25 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786DA3F7D8;
	Tue, 20 Oct 2026 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792491148; bh=Qbjs5GWR6x+L57CZ3VNnBd+sZzSyPW/j83ilkazmaK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XMt+71WmRi6edvMNlMo1gefoO6uG0W/w1SDRxqMAl+je+JCYvGvov8E/1KCewUOgt
	 galIBIZVB4oN+DxYJNtkMdZj26WOxgrxQBFOIb9Td4qFDGSVHKtL1DIfd+Fxa6T60S
	 cx2EdEoak4+1GtE9jBl+KCWKv1Toc01eVtLbeeGE=
Message-ID: <680da94d-f179-4069-b793-c824548e61f4@arm.com>
Date: Tue, 20 Oct 2026 11:12:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: insn: operate on MSR/MRS sysreg field via
 defines
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Wei <lucaswei@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>,
 Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
 <20261016164648.251258-4-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016164648.251258-4-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_031229_819878_C1A43EEB 
X-CRM114-Status: GOOD (  17.87  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 17:46, Ada Couprie Diaz wrote:
> Replace the few instances of hard-coded system register offset and masks
> used to operate on MSR/MRS instructions with defines.
> This will allow re-use in future commits while making the connection
> between those values more explicit.
> 
> While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
> so it can be safe to use in alternative pacthing callbacks.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h | 3 +++
>  arch/arm64/lib/insn.c         | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 2e45f6e80d15f..e020f9d8b83c2 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -113,6 +113,9 @@ enum aarch64_insn_register {
>  	AARCH64_INSN_REG_SP = 31  /* Stack pointer: as load/store base reg */
>  };
>  
> +#define AARCH64_INSN_SYSREG_OFFSET	5
> +#define AARCH64_INSN_SYSREG_MASK	GENMASK(20, AARCH64_INSN_SYSREG_OFFSET)
> +
>  enum aarch64_insn_special_register {
>  	AARCH64_INSN_SPCLREG_SPSR_EL1	= 0xC200,
>  	AARCH64_INSN_SPCLREG_ELR_EL1	= 0xC201,
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index 94ee1aae2f5b7..2edc5a9c0a9c8 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -1362,9 +1362,9 @@ u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
>  /*
>   * Extract the Op/CR data from a msr/mrs instruction.
>   */
> -u32 aarch64_insn_extract_system_reg(u32 insn)
> +noinstr u32 aarch64_insn_extract_system_reg(u32 insn)
>  {
> -	return (insn & 0x1FFFE0) >> 5;
> +	return (insn & AARCH64_INSN_SYSREG_MASK) >> AARCH64_INSN_SYSREG_OFFSET;
>  }
>  
>  bool aarch32_insn_is_wide(u32 insn)
> @@ -1566,8 +1566,8 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
>  {
>  	u32 insn = aarch64_insn_get_mrs_value();
>  
> -	insn &= ~GENMASK(20, 5);
> -	insn |= sysreg << 5;
> +	insn &= ~AARCH64_INSN_SYSREG_MASK;
> +	insn |= sysreg << AARCH64_INSN_SYSREG_OFFSET;
>  	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
>  					    insn, result);
>  }
> -- 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


