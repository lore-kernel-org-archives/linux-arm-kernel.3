Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD2D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOqelCfA+niHr585Q7gjhs1CWJtFJzsgDt10/9RfHhM=; b=eTfKBdTTx6IBzFL/cl8oy8tggm
	f6oGW3UX5B9qWfOIiEJHg2kAlaidQ2USjTbU76ySMjiQ8DHdTot438iGnjg87qDhK9aABY5p6EcZ4
	Igw10CuRLkTHGKLZot138Z5AI8G3LK/X+pFegCkWbAG2gRF3kK7L7FKPrWecTTTvLPVhe8lW7op9a
	HBuEHRaL0kWce5HCdm9541jcqehoqe7oPMvF85kQlmF6SolFgaJ+vVuJPWxffHaJ4VDUM/vVksHoJ
	ZAvgtFWC2uRCtnJgrqeF6GrWdVu8jYLCEKyLBzY5spEVZeDf+iKZHthc+HrahC/imnWL6/D30NH8l
	EjXPT05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFOa-00000002d4d-0ATR;
	Fri, 09 Jan 2026 16:31:28 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFOX-00000002d42-0ndv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:31:26 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee243b98caso373971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767976284; cv=none;
        d=google.com; s=arc-20240605;
        b=L50tffm9WZXc0WjqyqU8K2WOHPInxQ1vTVE57Jd+J2GkWk+12qdMMPhAKKy0T/zCQh
         LkNKpjPBBDwo3OCjRP3lLgoRCupaxd4nfzlJjns0RsV9AMOuKBbWhd0BCVuf0KpKfM/P
         xm4EqMBSwL8mr4DyP0aMPtkF9SJ40TjHHlxnIIdLX7BZT13aLPFSbU4N+9nXhNImf98L
         oA0qCxekSWQi+5NwJqT3tHWfeOOidCvdu6bkGcBKXwKKexH8h3kFfCwMKNGyfYOBkmHt
         JKuTBInHTTCXOkWzZFri57whrKhf1Fa5bxwJ1N0f8xPmHNlsWxEDu0DQdQxj7lQ3RxgN
         ckLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bOqelCfA+niHr585Q7gjhs1CWJtFJzsgDt10/9RfHhM=;
        fh=257km415QhFmm+f4xq6jXAjwoWw+dURoOREHEb7Pq5I=;
        b=KVK6uBzKa1OSZIGUDDVBCPCbEwSDo+4c1KL9naJZrBAM7bgwhxkyLS8euKIpYqAm3e
         ie+LF7xyJLotFOVFHrpnqCABfSB8qbUvTepSGE5mqXXXsisCbhEg8LG131yiL1unq/OH
         iuJr1FZZ9MS1c8F/siGP8zCxBcHw0txWMV8prKQZn2rlVHgTb2Xm9mt/OlhNtL7pVEmM
         tgcJ/L9EzgotItjX/TzwIpbIDe8046SegsTg5vkHoR98bRW5qFcCuC1o0kh95TLbo3lK
         wHBMCoh7baEbYQuEIWCrY6fJfOqAxHZBF6RLb1He1UrkgkUATLnwEMf1YXZQkP0yxtUJ
         Ij+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767976284; x=1768581084; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bOqelCfA+niHr585Q7gjhs1CWJtFJzsgDt10/9RfHhM=;
        b=ztwnEpLNlZwNVqeJ66Sw2iW05h2v0YEgbLHTDbByoEumMLe3UPPhOC26s1UHlLT+95
         ffK5fXsSbz1vrk5yNbUgO7lT09GjDaPmFiohPx9Yb67M1tKy0A1z4bfMZbOOKMNDvt90
         4TsaIES+Lw9U7ugT4P2zkDXRAoiJqVR/FMQHKPhR5RBwjEPaznL0FdWkIk2UQw/lyeLq
         jYcRJ/UqEbHvdrtz6j0X3voNTa6VaKTnqj0T9oQP802h6aj8z4xtfNvG5VZ/U8fcKVLd
         5TCU2rwxujiqBJBtFyNDYOSFG0+NelYRtSSp/L3YN2ucemxPHeigZo9/G3Ta7v/Iej/e
         29Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976284; x=1768581084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOqelCfA+niHr585Q7gjhs1CWJtFJzsgDt10/9RfHhM=;
        b=uamoRJ9GAIwMdE8acQNzWhOIGVW8SCQe9zIHEKzEa6+RGe3HzInNXdgNZfdyCuQBJR
         Jo+no76aKmLqfABRVqHJxaeAF9pPST046kRoovksATRNyttK1RDmzNXXzp9IGSIIp7Ba
         B1QpBbWqAAt88/Jp+Dc5gJuts/Vip8rmDW+rjVahFcpSAkpMSc+2MaDMB1ZdU0MA6Upo
         +ayFrBhFmEAOVjWat1E+QM35E6XiXhcHir3MpCWPwqLzzX76okodVHr+bjFhBOFQQQCZ
         umcahUcVp6LpBrDJ6sMiXlgy02pKeJo5mjffWIxmcqmbdhC3XVuFpjZZKc56ysMpXZv8
         kfnw==
X-Forwarded-Encrypted: i=1; AJvYcCWs7L2mA5o0cD8xfbCbfWX8EKsUcsUWdK8MPHoionFSL7CPg4zexYhEWpzAaaxvsBX23/BnZG8OiJFrUwJBjPrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCRcaly5ABhD9bc5qdvaKtPtZAty1fexmaOyEu4/9Ih0MJZAOJ
	bHEz0jZgE2EerO7terWb9pQU9nJwYDAQaDv1CpClKUKHVPPC3EzRbXT+RUGs7YCEO5dsiP2h201
	eZd+MIyllQ0I5RHMWNpD5gwAoEbglyFkYYNyXRkvo
X-Gm-Gg: AY/fxX7UFW8n7Noz0x26tJb9VbXjwv0UYBdNkRBYATU3ScW8kipB+0obwqVnpNovrNp
	bfe9OszwYmFkc6f/+VhyG3DfGJummk0UG1inWiEJ8C/nQrrDpC+oocg2tNT8ciCseLhvjsh6922
	EHX9NonkTej00b7CBMYfRSbnxOIC3msZw3tY4aJmf+GlLx0Iuw+dvONVX7SQqEXp1bmZSQUWoFP
	qcSXH2lBdLLFqN8REHjPMc71TKN8uxSRevA9PLmgOr5CEzSWiAjyB1B4AVDqowe4KAmt2pS
X-Received: by 2002:ac8:5d8d:0:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-4ffca3899e0mr12373901cf.10.1767976283510; Fri, 09 Jan 2026
 08:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-15-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-15-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 16:31:00 +0000
X-Gm-Features: AZwV_Qg_Mx3Uve2Ajz9vtAn4ZY1Okl_E_qqP5nAl07n9Fwy2xIITsZXnkaSndwU
Message-ID: <CA+EHjTzP9roJNcHhVrcGm9RMAn0E+RGPkJ57w44OL4fy3EW-wA@mail.gmail.com>
Subject: Re: [PATCH v9 15/30] KVM: arm64: Support SME control registers
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_083125_245701_139CA4EC 
X-CRM114-Status: GOOD (  27.25  )
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
> definitions and userspace access for them.  These control the SME vector
> length in a manner similar to that for SVE and also have feature enable
> bits for SME2 and FA64.  A subsequent patch will add management of them
> for guests as part of the general floating point context switch, as is
> done for the equivalent SVE registers.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h     |  2 ++
>  arch/arm64/include/asm/vncr_mapping.h |  1 +
>  arch/arm64/kvm/sys_regs.c             | 36 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b41700df3ce9..f24441244a68 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -504,6 +504,7 @@ enum vcpu_sysreg {
>         CPTR_EL2,       /* Architectural Feature Trap Register (EL2) */
>         HACR_EL2,       /* Hypervisor Auxiliary Control Register */
>         ZCR_EL2,        /* SVE Control Register (EL2) */
> +       SMCR_EL2,       /* SME Control Register (EL2) */
>         TTBR0_EL2,      /* Translation Table Base Register 0 (EL2) */
>         TTBR1_EL2,      /* Translation Table Base Register 1 (EL2) */
>         TCR_EL2,        /* Translation Control Register (EL2) */
> @@ -542,6 +543,7 @@ enum vcpu_sysreg {
>         VNCR(ACTLR_EL1),/* Auxiliary Control Register */
>         VNCR(CPACR_EL1),/* Coprocessor Access Control */
>         VNCR(ZCR_EL1),  /* SVE Control */
> +       VNCR(SMCR_EL1), /* SME Control */
>         VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
>         VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
>         VNCR(TCR_EL1),  /* Translation Control Register */
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index c2485a862e69..44b12565321b 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -44,6 +44,7 @@
>  #define VNCR_HDFGWTR_EL2       0x1D8
>  #define VNCR_ZCR_EL1            0x1E0
>  #define VNCR_HAFGRTR_EL2       0x1E8
> +#define VNCR_SMCR_EL1          0x1F0
>  #define VNCR_TTBR0_EL1          0x200
>  #define VNCR_TTBR1_EL1          0x210
>  #define VNCR_FAR_EL1            0x220
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 3576e69468db..5c912139d264 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2827,6 +2827,37 @@ static bool access_gic_elrsr(struct kvm_vcpu *vcpu,
>         return true;
>  }
>
> +static unsigned int sme_el2_visibility(const struct kvm_vcpu *vcpu,
> +                                      const struct sys_reg_desc *rd)
> +{
> +       return __el2_visibility(vcpu, rd, sme_visibility);
> +}
> +
> +static bool access_smcr_el2(struct kvm_vcpu *vcpu,
> +                           struct sys_reg_params *p,
> +                           const struct sys_reg_desc *r)
> +{
> +       unsigned int vq;
> +       u64 smcr;
> +
> +       if (guest_hyp_sve_traps_enabled(vcpu)) {

Should this be guest_hyp_sme_traps_enabled() ?

> +               kvm_inject_nested_sve_trap(vcpu);

And by the same token, should this be kvm_inject_nested_sme_trap()?
That function doesn't exist, but would inject ESR_ELx_EC_SME instead
of ESR_ELx_EC_SVE.

> +               return false;
> +       }
> +
> +       if (!p->is_write) {
> +               p->regval = __vcpu_sys_reg(vcpu, SMCR_EL2);
> +               return true;
> +       }
> +
> +       smcr = p->regval;
> +       vq = SYS_FIELD_GET(SMCR_ELx, LEN, smcr) + 1;
> +       vq = min(vq, vcpu_sme_max_vq(vcpu));
> +       __vcpu_assign_sys_reg(vcpu, SMCR_EL2, SYS_FIELD_PREP(SMCR_ELx, LEN,
> +                                                            vq - 1));

I think this might be wrong. This code only writes the LEN, discarding
other fields in SMCR_EL2. The analogous SVE code in access_zcr_el2()
is only concerned with the length, and doesn't need to worry about
other bits to preserve.

Should this be something along the lines of the below instead?

+       smcr = p->regval;
+       vq = SYS_FIELD_GET(SMCR_ELx, LEN, smcr) + 1;
+       vq = min(vq, vcpu_sme_max_vq(vcpu));
+       smcr &= ~SMCR_ELx_LEN_MASK;
+       smcr |= SYS_FIELD_PREP(SMCR_ELx, LEN, vq - 1);
+       __vcpu_assign_sys_reg(vcpu, SMCR_EL2, smcr);

Cheers,
/fuad




> +       return true;
> +}
> +
>  static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
>                                      const struct sys_reg_desc *rd)
>  {
> @@ -3291,7 +3322,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>         { SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
>         { SYS_DESC(SYS_TRFCR_EL1), undef_access },
>         { SYS_DESC(SYS_SMPRI_EL1), undef_access },
> -       { SYS_DESC(SYS_SMCR_EL1), undef_access },
> +       { SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
>         { SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
>         { SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
>         { SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
> @@ -3655,6 +3686,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>
>         EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
>
> +       EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
> +                        sme_el2_visibility),
> +
>         EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
>         EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
>         EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
>
> --
> 2.47.3
>

