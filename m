Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6259DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysUdSa/C5jKZEQ7ZSsgdqgHiInBvjlhj+IVqf9OnWrc=; b=a10Gk3sGaBtiZmuYHsOugFHPqh
	HrTptDyjADQamvQHgNaU6DvDkbXKKEKHe4V1JP9FJYo8Da1Fub4TtZXMGYxA8getqDzMANyqzSjQu
	1uLau+OnAfyiJZjxJvoa29OtM1HBpmI20ZXqolZ9tt6Ez3qyFDT4zX/5rVRkLbR76yS4ylDbz2vc+
	06BO6dej2Xw5yjtCAU48wpeSxfq+5t6l6My8yzHrx3kHL46wT26SCOIXb/rCqfPYCwKahqbkhMMMy
	hJjAQcHkeP7aqUzYtbotNQ3TskOCd53BDuMMolTuohfjIfD4LSpLJg3y7+/Hs/LTaFIzFyTE7aiUh
	u58Au3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbTR-00000002EIy-2BoY;
	Fri, 06 Dec 2024 16:46:37 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbRJ-00000002Dl1-2ek6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:44:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e224bbaccso2619800e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733503463; x=1734108263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysUdSa/C5jKZEQ7ZSsgdqgHiInBvjlhj+IVqf9OnWrc=;
        b=ZaOduFM9K6wzNXiG32w/qlGTmtor8qGCYqDN2YcwzmMEBFZG9BeJk2k6rh80yENHVf
         Emp4f4Rhj8VJFkXZ0lReHBEBUwYafjfYEfDrDyLfFV/lrVAtRQi+ogybvpSwg3NsMZIS
         xTXiaK8oYzzpf08JgUaELyW5EIushUA6zIOWB8bHxw902i1PWL1WFtw3CMiUCt+7vs6f
         BQFvmKaJU/WIsCn+6/IQ5PMo0I5mAdrbWAGz6LIjB72ztq5NyUWLVshBxMS2WtSGW28O
         iVafgUvkzgXo4IWuKQsVMflKORkTE2WgsNJ9zK7YI19NE0dfEVzL6TAYKuKHIMEeB6Gg
         E0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733503463; x=1734108263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysUdSa/C5jKZEQ7ZSsgdqgHiInBvjlhj+IVqf9OnWrc=;
        b=v2xj34toeHokClG+SyreKEV9pmIJqa5cZHvhDG0HTB+e/h5oH4LdgBadgRbkIPRtwc
         IqOGbNre23DE8h3x01bmnNDQ4ie26d/EXBM12MSdWyBscREKMaJWWfw4a38Yu/cJR0It
         cOmbsPDv9pK4PqV3/M3hphh66YOYV6oTtGlugZa+k5drES/nBBBgvz+tXqqeWqbPKqea
         /Byc8btz+w5x6eNsc8KVwFFHwrx5qQQCClkwRGiyUm5hm4CWiJLXK3ZFOBiqMwdDwH62
         A3Rd0XWHIGrDj+46Nu9OUW77LaQU/KsjKPU0gljqM5uufRFQ3c06luBR+/7BET8WCUMa
         Ldqg==
X-Forwarded-Encrypted: i=1; AJvYcCWDhFQ8XwrzZ8p8KjO0ETu/G/1/BtIjfhOgLGX3kRujEHI7NDx2IRFH5kUsWqjQ8JvvN0fwATb0y5YZ0H2+fOOY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8wziuS5AVCq4cyhh5cMsvN9TRSQdi3z+sZh2kUmJjgW6VNeLB
	4pl1WnwO3i7C221e42moOVf7D+LLDk2ugxmYPwuhJTPRoWstxmNN5DdKe8NO1A==
X-Gm-Gg: ASbGncsxtmC7txUtJe6UnDtJooNm11J/l61kNrsH/YeOsiZfdO2+hzzJOpO4SHHT24k
	Wf6D+5+MNbEcKzmaPHqCZWemWu71/+aP1e/63u3exlKmMUR9U3qEHLJVKayhdEDlS18qiYsopS+
	IfgaD3YQ65bR77qvWVXx5Rsn0vdAwn+ACorrCRmomPoUXysO2hZREkd+l74Dz0LCHytzFVfvzP1
	jP0NypKJG7jBv+EQJpEXWSwNLOu6MVrZG4P5g//OR0PU4gnMgQfmg8AjA7b6A/ukiB7/c3XfGsO
	AXx/2SdI
X-Google-Smtp-Source: AGHT+IEvuVGdPXLw1St7F0IenI1aA5BaUiBY9n0je7W3zaUCWSMiyC/W3sPWwSnrsWo2qQDMpIPXqg==
X-Received: by 2002:a05:6512:104d:b0:539:f7ba:c982 with SMTP id 2adb3069b0e04-53e2c2c23bamr2147192e87.33.1733503462424;
        Fri, 06 Dec 2024 08:44:22 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260abcc5sm262404266b.168.2024.12.06.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:44:22 -0800 (PST)
Date: Fri, 6 Dec 2024 16:44:19 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 02/14] KVM: arm64: Group setting traps for protected
 VMs by control register
Message-ID: <Z1Mp4zmZRL_8QEmb@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_084425_669971_FE234D26 
X-CRM114-Status: GOOD (  14.48  )
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

On Monday 02 Dec 2024 at 15:47:29 (+0000), Fuad Tabba wrote:
> +static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
>  {
> -	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
> -	u64 mdcr_set = 0;
> -	u64 mdcr_clear = 0;
> -	u64 cptr_set = 0;
> +	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
> +	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
> +	const u64 id_aa64dfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64DFR0_EL1);
> +	u64 val = vcpu->arch.cptr_el2;
>  
> -	/* Trap/constrain PMU */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), feature_ids)) {
> -		mdcr_set |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> -		mdcr_clear |= MDCR_EL2_HPME | MDCR_EL2_MTPME |
> -			      MDCR_EL2_HPMN_MASK;
> +	if (!has_hvhe()) {
> +		val |= CPTR_NVHE_EL2_RES1;
> +		val &= ~(CPTR_NVHE_EL2_RES0);

It's a bit odd to do that at the beginning of the function no? Perhaps
do it last to be sure to overwrite all the changes below?

Also, not sure we need the RES1 part here, kvm_get_reset_cptr_el2()
should have set those for us.

>  	}
>  
> -	/* Trap Debug */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DebugVer), feature_ids))
> -		mdcr_set |= MDCR_EL2_TDRA | MDCR_EL2_TDA | MDCR_EL2_TDE;
> -
> -	/* Trap OS Double Lock */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_DoubleLock), feature_ids))
> -		mdcr_set |= MDCR_EL2_TDOSA;
> +	/* Trap AMU */
> +	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AMU), id_aa64pfr0))
> +		val |= CPTR_EL2_TAM;
>  
> -	/* Trap SPE */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), feature_ids)) {
> -		mdcr_set |= MDCR_EL2_TPMS;
> -		mdcr_clear |= MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT;
> +	/* Trap SVE */
> +	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), id_aa64pfr0)) {
> +		if (has_hvhe())
> +			val &= ~(CPACR_ELx_ZEN);
> +		else
> +			val |= CPTR_EL2_TZ;
>  	}
>  
> -	/* Trap Trace Filter */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceFilt), feature_ids))
> -		mdcr_set |= MDCR_EL2_TTRF;
> +	/* No SME support in KVM. */
> +	BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME), id_aa64pfr1));
> +	if (has_hvhe())
> +		val &= ~(CPACR_ELx_SMEN);
> +	else
> +		val |= CPTR_EL2_TSM;
>  
>  	/* Trap Trace */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), feature_ids)) {
> +	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_TraceVer), id_aa64dfr0)) {
>  		if (has_hvhe())
> -			cptr_set |= CPACR_EL1_TTA;
> +			val |= CPACR_EL1_TTA;
>  		else
> -			cptr_set |= CPTR_EL2_TTA;
> +			val |= CPTR_EL2_TTA;
>  	}
>  
> -	/* Trap External Trace */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), feature_ids))
> -		mdcr_clear |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
> -
> -	vcpu->arch.mdcr_el2 |= mdcr_set;
> -	vcpu->arch.mdcr_el2 &= ~mdcr_clear;
> -	vcpu->arch.cptr_el2 |= cptr_set;
> -}
> -
> -/*
> - * Set trap register values based on features in ID_AA64MMFR0.
> - */
> -static void pvm_init_traps_aa64mmfr0(struct kvm_vcpu *vcpu)
> -{
> -	const u64 feature_ids = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR0_EL1);
> -	u64 mdcr_set = 0;
> -
> -	/* Trap Debug Communications Channel registers */
> -	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_FGT), feature_ids))
> -		mdcr_set |= MDCR_EL2_TDCC;
> -
> -	vcpu->arch.mdcr_el2 |= mdcr_set;
> +	vcpu->arch.cptr_el2 = val;
>  }

