Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1754FD1D47D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpRy5+SX093uEzmtYYDo1gr8MhnmO39GpTcpaJWYQcc=; b=GQVUxJXfmZyt1aEVELw04U6lBT
	/esNiYhQZzBzyhUrjjF80UbPkBYmjyFmFJ05gYQZBHtxsdLAzdcK43SjjeqWAMztJ859u/ajKhl0m
	YY5Rcy1QlkknebxiudPcMphgQz1bBLQKqY+sMGi7HigD619PlNREYV21ZfdbreD8HJR9joodNylI9
	b7ufKRKKbfbXgbCJO2k+tv08Jc4Rl6ocbCf5BfofkIYWBxonG75aUjvjvCuZyJ3XvMBPyAc7e/x46
	UAc9f9Wv4RovtdTQ+cf8LehuZgkQFgLkXa0JdNyvaLiFkK9CeD6xVmk+9lFa02F8JJqAtM3aAdfeP
	2mq76/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsEo-0000000HZlQ-0QW2;
	Thu, 08 Jan 2026 15:47:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsEl-0000000HZkU-2vcg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 160FA4357D;
	Thu,  8 Jan 2026 15:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6270FC116C6;
	Thu,  8 Jan 2026 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887267;
	bh=fr3E84aj7B+gE6veuJ80O6qST6dcQKX3lD+YFac8hH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9V4aTUJZbHWalr7acoj1bQHQOmRuXMNb6/ST+NbGW8D/Pt8CLXonuydQWaFiBPoc
	 q1NnBQNjoxs8JELfc9J/AXH427WBkyHAFEU9H/VHNkNPYEcGnn6VhocGJG0o9qVxhA
	 aFLvRri3YtD7A4jAV5oEi67MbwIJPk1tBvzGBk5umsK4KTZrTA97Az2CLacnHIzn9y
	 LjSN4d0h7MrirD00NPtm5ghaPbIVCxY5CF9IdJlI2lOmfgCZTnui7K5At3N9Iqwxib
	 cJQqoD5e38JER8xsdXA4B8pFm1GukMcBNC69fCvvM3J6YJTEj342Bo3pQuHw1H43+3
	 sHus0QqQAhU2A==
Date: Thu, 8 Jan 2026 15:47:41 +0000
From: Will Deacon <will@kernel.org>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bartlomiej Grzesik <bgrzesik@google.com>,
	Tomasz Nowicki <tnowicki@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
Message-ID: <aV_RnY1v2We1ajFM@willie-the-truck>
References: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_074747_759025_C3960F5D 
X-CRM114-Status: GOOD (  19.69  )
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

On Fri, Nov 14, 2025 at 11:11:53AM +0000, Kornel Dulęba wrote:
> According to section 13.2 of the DEN0077 FF-A specification, when
> firmware does not support the requested version, it should reply with
> FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the error
> code as int32.
> Currently, the error checking logic compares the unsigned long return
> value it got from the SMC layer, against a "-1" literal. This fails due
> to a type mismatch: the literal is extended to 64 bits, whereas the
> register contains only 32 bits of ones(0x00000000ffffffff).
> Consequently, hyp_ffa_init misinterprets the "-1" return value as an
> invalid FF-A version. This prevents pKVM initialization on devices where
> FF-A is not supported in firmware.
> Fix this by explicitly casting res.a0 to s32.
> 
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 58b7d0c477d7fce235fc70d089d175c7879861b5..ab1e53bd4ceeea431fc30a875482ed1523b01ab5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -792,7 +792,7 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
>  			.a0 = FFA_VERSION,
>  			.a1 = ffa_req_version,
>  		}, res);
> -		if (res->a0 == FFA_RET_NOT_SUPPORTED)
> +		if ((s32)res->a0 == FFA_RET_NOT_SUPPORTED)
>  			goto unlock;
>  
>  		hyp_ffa_version = ffa_req_version;
> @@ -943,7 +943,7 @@ int hyp_ffa_init(void *pages)
>  		.a0 = FFA_VERSION,
>  		.a1 = FFA_VERSION_1_2,
>  	}, &res);
> -	if (res.a0 == FFA_RET_NOT_SUPPORTED)
> +	if ((s32)res.a0 == FFA_RET_NOT_SUPPORTED)
>  		return 0;
>  
>  	/*

Acked-by: Will Deacon <will@kernel.org>

Will

