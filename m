Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC09CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q3QiE1tVQhgfjgih42D2xG7NK3u5XRzBnEUMr8TJAM=; b=IzNoS9BsDIBVZP60ffVr4dBUKL
	oe+tvMs3isqgw/vOTBOA6Cj3f/L8tut7CQSc2FsiK+9e2+MwW2pdSNek2MNOOf/7ptPgBxeMySGSx
	WXbfqaX0b8mtJaP0bPCW2IqWL6GM2kegalTx+9vv9XZ5kQVxIZNsNGDW+cghl8gQ6fjr5hT53qZyu
	g5ft/1kx/6+KcRaFnNyXDMhMCRI3agfMjDQrdvgrseKD9U1g2JsprVc3otJmu/eWUestxjUOSdofj
	Tef5lqlup00hgfghrJvnUOqxR4knDLwDr+vuui3f8TMGgLuErJZ4p0GZ4A4y7vzKls9ijL+hAhl65
	690Y7Oew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDY-00000002TbG-2mv6;
	Fri, 19 Jun 2026 13:25:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZDW-00000002TZY-1hxS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:25:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-46019edc13dso1191013f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781875504; x=1782480304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q3QiE1tVQhgfjgih42D2xG7NK3u5XRzBnEUMr8TJAM=;
        b=D2NNU4iLL0a1H2nhomaRssIQdFHzS11UkeEJIdAzboUXqxfhA+jpZdTN4ojXfFQK1f
         BP6MJgbmKGLe3inHra1zVkhM8x0X5Pr3dLWyJjhVHSz3VYE/Cg7srHPuYbcg4gUihJuk
         WdYW9b708NC1ESb1lh65Uowty6DOhpMBunecZDh39VepfRgcmNhbHmuj8cw9GtO7WSvv
         zK5gK4oI38XALLetxcRJ3CDo5+WNG+dRwnSrsojvzd1RdEHah9ccdBA1uQvS5gjpB90O
         kDr6H/vS2AXWBU1Orv6UCR3gukltWocggQHjz41oKoB8+PiHnoW0l/MFrXG+0+PjlvuW
         QSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875504; x=1782480304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q3QiE1tVQhgfjgih42D2xG7NK3u5XRzBnEUMr8TJAM=;
        b=HSGM3ZcCVdFjCws9mMCbZ6vFZWWbKfdnNcR3fkUeRoagmlDYzvVWjzwAgZG7akjsCz
         kHX8LSaM8z7mVKvbTx9CNeAyYJAyFCH9EUW/GaLmeShmvRN5CLoAo0yfnmLmHtCxa1ak
         pUIcCDW7GfnyMYS+NwWoIGXNgUL2vOEOppH9JvrKOHcJVoxj7ycqJVWzPLbG1cnXx5g5
         Rtd2/zUy9MleTE8+wEilh3uUC8CrnvnGzYJ+V6ESAyPLTqqNMI+Y8TdtqOt96zMF/hOP
         76IWRCu4YraJjikMAH7ai3Mkd35fQEUt9H1TXLci1a+A+EQwA3CH5VMVAKG+oxdE5J+P
         Rlhw==
X-Forwarded-Encrypted: i=1; AFNElJ+Wwl7K4ibEeJwEJB7kzcqiu9hCd1YC3O8zK1v21invHxmLEblnel+qrO3+BahX29GnNCkRNoBhJL0Ia/G8g/vc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpa7GzTv3RAtL6SDnbYwxOheRhfCJjSq45LmLxflq72pmkA8U/
	YMl2uJRWzMsk6QRiVaKAj2kSm3WlpU30laYrdJqml1eAg7lhNQTonBDKODTNpfDcRw==
X-Gm-Gg: AfdE7cmAPGwVfLSoVJ7MeKSxXPjMw6iZjWDLrf1LzjppMb6yCgDSucF4sGFWLgOQWA0
	bdJu/vNhQqe0UjGVjcRYz3B6CRblO8FhFdNOkAAROTpUmSNfUJSRluz0hZdCC/LkkJbDGeBPdka
	QUKsO6vAbfDWtfbFXxpagUTUhQ1TSl4n0DVek2Pt6G8zR/GVZcHIt4Aw7V8rgguuHkkdAsiWgVf
	b+cmL6pxapaI19vQ66tx2m9VEyKTYW2D+7BVCioWG3Sjm2592UyDOmkW9+kgJuBuTWXR01dNfbb
	QCxs75xqOr7RiZFTtZIk64cvr8fSWon8z6dS6HfE3lsprwuFajvpX9UjJQjq1fzQSfm2LuQIoTU
	si2AXh+uGLIHzyVBDZC6jqa55Wri6p5eMrJAV/9KaQywXtDjXSIZR1wJ7E6cZy2cT/mNr0tZM01
	jDQp+BSHPDz0RvEvRvHtH2c0sC9PGrmBmbtSsXmxM8rdrZOgAeurnK/fR7
X-Received: by 2002:a05:6000:1447:b0:45e:ec18:f20a with SMTP id ffacd0b85a97d-4656e5c4b14mr3772654f8f.32.1781875503600;
        Fri, 19 Jun 2026 06:25:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c114e22sm7285121f8f.34.2026.06.19.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:25:03 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:24:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2 1/8] KVM: arm64: Extract MPIDR computation into a
 shared header
Message-ID: <ajVDK06_gDKYBro6@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_062506_460862_2C2208FC 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, Jun 19, 2026 at 08:07:12AM +0100, Fuad Tabba wrote:
> Extract the vCPU MPIDR computation embedded in reset_mpidr() into a
> kvm_calculate_mpidr() inline in sys_regs.h, so it can be computed
> without duplicating the logic. A follow-up series reuses it to reset
> protected vCPUs at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 14 +-------------
>  arch/arm64/kvm/sys_regs.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 33c921df19b5..674fabe1d40d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -976,21 +976,9 @@ static u64 reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  
>  static u64 reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  {
> -	u64 mpidr;
> +	u64 mpidr = kvm_calculate_mpidr(vcpu);
>  
> -	/*
> -	 * Map the vcpu_id into the first three affinity level fields of
> -	 * the MPIDR. We limit the number of VCPUs in level 0 due to a
> -	 * limitation to 16 CPUs in that level in the ICC_SGIxR registers
> -	 * of the GICv3 to be able to address each CPU directly when
> -	 * sending IPIs.
> -	 */
> -	mpidr = (vcpu->vcpu_id & 0x0f) << MPIDR_LEVEL_SHIFT(0);
> -	mpidr |= ((vcpu->vcpu_id >> 4) & 0xff) << MPIDR_LEVEL_SHIFT(1);
> -	mpidr |= ((vcpu->vcpu_id >> 12) & 0xff) << MPIDR_LEVEL_SHIFT(2);
> -	mpidr |= (1ULL << 31);
>  	vcpu_write_sys_reg(vcpu, mpidr, MPIDR_EL1);
> -
>  	return mpidr;
>  }
>  
> diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
> index 2a983664220c..bd56a45abbf9 100644
> --- a/arch/arm64/kvm/sys_regs.h
> +++ b/arch/arm64/kvm/sys_regs.h
> @@ -222,6 +222,25 @@ find_reg(const struct sys_reg_params *params, const struct sys_reg_desc table[],
>  	return __inline_bsearch((void *)pval, table, num, sizeof(table[0]), match_sys_reg);
>  }
>  
> +static inline u64 kvm_calculate_mpidr(const struct kvm_vcpu *vcpu)
> +{
> +	u64 mpidr;
> +
> +	/*
> +	 * Map the vcpu_id into the first three affinity level fields of
> +	 * the MPIDR. We limit the number of VCPUs in level 0 due to a
> +	 * limitation to 16 CPUs in that level in the ICC_SGIxR registers
> +	 * of the GICv3 to be able to address each CPU directly when
> +	 * sending IPIs.
> +	 */
> +	mpidr = (vcpu->vcpu_id & 0x0f) << MPIDR_LEVEL_SHIFT(0);
> +	mpidr |= ((vcpu->vcpu_id >> 4) & 0xff) << MPIDR_LEVEL_SHIFT(1);
> +	mpidr |= ((vcpu->vcpu_id >> 12) & 0xff) << MPIDR_LEVEL_SHIFT(2);
> +	mpidr |= (1ULL << 31);
> +
> +	return mpidr;
> +}
> +
>  const struct sys_reg_desc *get_reg_by_id(u64 id,
>  					 const struct sys_reg_desc table[],
>  					 unsigned int num);
> -- 
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

