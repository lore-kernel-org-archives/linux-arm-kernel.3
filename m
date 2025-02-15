Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A25C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okAkfz3seOBQI9McoD6NBWS5lv1omzWEsYR9zMa/7M8=; b=44DRcwgdbTbRie
	Q3KnfqJx88RVLa11mGVX+CDRZhid4gXkdwyDZ2YlactpPUhiFUcfZMT6hHupVVZx6x9SLKL1t7iuI
	qsLFN4NRpN/BT+VRzZ8zFe3vMl1jgOAKJwvZ5VjemNZvSokygn+XJwguhzp5IpGGPXjzF+X7I+ayr
	N27/EPO3Q9Qy5DE6mQY+7gVp+TQ3aba8ent6KFAmyoqSosiaR+4ACbxLAbG8r69WgSFs0ikiVaKYV
	SL6tvxocUSqkRwvuZzU80Q85JwkCdOPFfmi0qmeDPIsgEODDPZf9evhO40Uz2xlR8JyZOh2dVJWMQ
	GfMDUlIbfcBOV3R8z1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKs9-00000000OEB-39pc;
	Sat, 15 Feb 2025 16:18:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKqg-00000000O4a-4Bg6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 16:17:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so447496666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739636217; x=1740241017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=okAkfz3seOBQI9McoD6NBWS5lv1omzWEsYR9zMa/7M8=;
        b=HdhWU6sc3NubCfHiGmA4nwdkc7Tcm8HNikX+BBI/lhZxB/xUNkV3/l9y+Wp0mea2Hq
         CF2/itmnAFKYv6AsafaIS4I/wLTmXkKTtgE/SQ6Oy3Gr/ePBQJr7buvkNeGXg3oUjl73
         ZtNCJJ012vTi2hJvwAkSlPMNWeK2gqcFbbhlzNF7npCyeQh2WXL4RAWILZ9Q8cKRFkvD
         JSEcAZWdiYf0AYWfPyxdzAUV1WeG0GcK+UgHMxYSnIFbaL5KiAjGDdIPq/qTbKdaEmRu
         LSzVQxj/o15bDVusP2wwrnYtU4kTYCu0lUXkP6WFb0xTaVSMaZSDDMJCvNs5flF/6i9r
         aHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739636217; x=1740241017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okAkfz3seOBQI9McoD6NBWS5lv1omzWEsYR9zMa/7M8=;
        b=ojLvZsxJ/XIOP/naae6HF9f+DInzaoZ8NXxk+BDrMBaHIia7knkhwfH81PIY60Ukhu
         Td7t8TkGUNG+hwgiyw3rN7+GXA1ZFR6I0LZhq6K64ujnZ/D3wdRu+vRQma2q6RGxvh7+
         SbpnCKhelESrCvNhkLQN4PXSsk7tfLMiH7PNt8nmZPcIYfXNFtWL8gk8TWtm/r8M6VOB
         vCRISVazL+HxMI+oV9PfLDfnbQspGsRuV7xBwUHuShwTyNdd7dDlGYZfi96LLJihtOl8
         egE4GqkQv80AK62tBBjfKQ+61XzXmMCxIznSaZR+FZRf8Evlf3EXwweFe6OwJImA7hfj
         GlTw==
X-Forwarded-Encrypted: i=1; AJvYcCXaAnBdUePbNENa+YMfhrXWle4K5eg/3rGK/PuFi7lHu7WS6KwIES8SmKQEG0AnvT+3VCpSIAKFK8Rev2FAD92x@lists.infradead.org
X-Gm-Message-State: AOJu0YwztkxpquhglMIAmtSjxioX18YmiBp76gCFTPqKsebm2J4sL7bW
	D3DI1RoSaogec2FmXcc1Q/StBkGmPdWt1WSqGxIsPotLzTVxVr4QhbtOlBh2vT3k3cWN3Ue83zu
	TrHat2V28F8f4ma0JuiOzQ93KqEs=
X-Gm-Gg: ASbGncuflAM5d5L8R4tASGUTnstWo+6qQnkNSColmuwuYqjHYXFZhTl8C3TXm8hQ2ER
	i375ETuRcR1MWNtWHcecPVsSqIIzILTlmGLS4DpuGyl4odxGvr5QYJIjpY2q4ZXpThAUjp8rW
X-Google-Smtp-Source: AGHT+IEwF6vLnEXWXotW293B/3xDlg0MfzJfP38jNk+QmBSe2iHne9w0GrH53Co4xrP5jB2HAYsv4KQ4ugP+Dsy31Qc=
X-Received: by 2002:a17:906:c399:b0:ab7:bcc0:9050 with SMTP id
 a640c23a62f3a-abb70b2f1a6mr268258766b.27.1739636216871; Sat, 15 Feb 2025
 08:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20250211143910.16775-1-sebott@redhat.com> <20250211143910.16775-2-sebott@redhat.com>
 <Z7BoydkyT_h0gwOV@linux.dev>
In-Reply-To: <Z7BoydkyT_h0gwOV@linux.dev>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 16 Feb 2025 00:16:44 +0800
X-Gm-Features: AWEUYZmnYv-KvGHpFE_jzJc8vV2oHyHLnjmQy49AKn3ynSRfnXjgHvmlK88ELt8
Message-ID: <CAE2XoE_8ihJZQF856w-_F+cgJW7fLWGz7M7Ztoxzw2vE51_m1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sebastian Ott <sebott@redhat.com>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Cornelia Huck <cohuck@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_081659_044717_3F0F133F 
X-CRM114-Status: GOOD (  33.68  )
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
Reply-To: luoyonggang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Feb 15, 2025 at 6:15=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Sebastian,
>
> On Tue, Feb 11, 2025 at 03:39:07PM +0100, Sebastian Ott wrote:
> > +static int set_id_reg_non_ftr(struct kvm_vcpu *vcpu, const struct sys_=
reg_desc *rd,
> > +                           u64 val)
> > +{
> > +     u32 id =3D reg_to_encoding(rd);
> > +     int ret;
> > +
> > +     mutex_lock(&vcpu->kvm->arch.config_lock);
>
> There's quite a few early outs, guard() might be a better fit than
> explicitly dropping the lock.
>
> > +     /*
> > +      * Since guest access to MIDR_EL1 is not trapped
> > +      * set up VPIDR_EL2 to hold the MIDR_EL1 value.
> > +      */
> > +     if (id =3D=3D SYS_MIDR_EL1)
> > +             write_sysreg(val, vpidr_el2);
>
> This is problematic for a couple reasons:
>
>  - If the kernel isn't running at EL2, VPIDR_EL2 is undefined
>
>  - VPIDR_EL2 needs to be handled as part of the vCPU context, not
>    written to without a running vCPU. What would happen if two vCPUs
>    have different MIDR values?
>
> Here's a new diff with some hacks thrown in to handle VPIDR_EL2
> correctly. Very lightly tested :)

Thans, I am also faced this issue, but other than this, I am also
facing a issue, after updating
MIDR_EL1, The CP15 register MIDR for aarch32 not updated.
The instruction is `MRC p15,0,<Rt>,c0,c0,0    ; Read CP15 Main ID Register`=
 from
https://developer.arm.com/documentation/ddi0406/b/System-Level-Architecture=
/Protected-Memory-System-Architecture--PMSA-/CP15-registers-for-a-PMSA-impl=
ementation/c0--Main-ID-Register--MIDR-

The value of this instruction is not updated



>
> Thanks,
> Oliver
> ---
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/k=
vm_host.h
> index 7cfa024de4e3..3db8c773339e 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -373,6 +373,7 @@ struct kvm_arch {
>  #define KVM_ARM_ID_REG_NUM     (IDREG_IDX(sys_reg(3, 0, 0, 7, 7)) + 1)
>         u64 id_regs[KVM_ARM_ID_REG_NUM];
>
> +       u64 midr_el1;
>         u64 ctr_el0;
>
>         /* Masks for VNCR-backed and general EL2 sysregs */
> @@ -1469,6 +1470,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka,=
 u32 reg)
>         switch (reg) {
>         case sys_reg(3, 0, 0, 1, 0) ... sys_reg(3, 0, 0, 7, 7):
>                 return &ka->id_regs[IDREG_IDX(reg)];
> +       case SYS_MIDR_EL1:
> +               return &ka->midr_el1;
>         case SYS_CTR_EL0:
>                 return &ka->ctr_el0;
>         default:
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/=
hyp/include/hyp/sysreg-sr.h
> index 76ff095c6b6e..866411621a39 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -168,9 +168,11 @@ static inline void __sysreg_restore_user_state(struc=
t kvm_cpu_context *ctxt)
>  }
>
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ct=
xt,
> -                                             u64 mpidr)
> +                                             u64 midr, u64 mpidr)
>  {
> -       write_sysreg(mpidr,                             vmpidr_el2);
> +       write_sysreg(midr, vpidr_el2);
> +       write_sysreg(mpidr, vmpidr_el2);
> +
>
>         if (has_vhe() ||
>             !cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {
> diff --git a/arch/arm64/kvm/hyp/nvhe/sysreg-sr.c b/arch/arm64/kvm/hyp/nvh=
e/sysreg-sr.c
> index dba101565de3..a01be1add5ad 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sysreg-sr.c
> @@ -28,7 +28,15 @@ void __sysreg_save_state_nvhe(struct kvm_cpu_context *=
ctxt)
>
>  void __sysreg_restore_state_nvhe(struct kvm_cpu_context *ctxt)
>  {
> -       __sysreg_restore_el1_state(ctxt, ctxt_sys_reg(ctxt, MPIDR_EL1));
> +       u64 midr;
> +
> +       if (ctxt_is_guest(ctxt))
> +               midr =3D kvm_read_vm_id_reg(kern_hyp_va(ctxt_to_vcpu(ctxt=
)->kvm),
> +                                         SYS_MIDR_EL1);
> +       else
> +               midr =3D read_cpuid_id();
> +
> +       __sysreg_restore_el1_state(ctxt, midr, ctxt_sys_reg(ctxt, MPIDR_E=
L1));
>         __sysreg_restore_common_state(ctxt);
>         __sysreg_restore_user_state(ctxt);
>         __sysreg_restore_el2_return_state(ctxt);
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/=
sysreg-sr.c
> index 90b018e06f2c..1d4b9597eb29 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -87,11 +87,12 @@ static void __sysreg_restore_vel2_state(struct kvm_vc=
pu *vcpu)
>         write_sysreg(__vcpu_sys_reg(vcpu, PAR_EL1),     par_el1);
>         write_sysreg(__vcpu_sys_reg(vcpu, TPIDR_EL1),   tpidr_el1);
>
> -       write_sysreg(__vcpu_sys_reg(vcpu, MPIDR_EL1),           vmpidr_el=
2);
> -       write_sysreg_el1(__vcpu_sys_reg(vcpu, MAIR_EL2),        SYS_MAIR)=
;
> -       write_sysreg_el1(__vcpu_sys_reg(vcpu, VBAR_EL2),        SYS_VBAR)=
;
> -       write_sysreg_el1(__vcpu_sys_reg(vcpu, CONTEXTIDR_EL2),  SYS_CONTE=
XTIDR);
> -       write_sysreg_el1(__vcpu_sys_reg(vcpu, AMAIR_EL2),       SYS_AMAIR=
);
> +       write_sysreg(kvm_read_vm_id_reg(vcpu->kvm, SYS_MIDR_EL1),       v=
pidr_el2);
> +       write_sysreg(__vcpu_sys_reg(vcpu, MPIDR_EL1),                   v=
mpidr_el2);
> +       write_sysreg_el1(__vcpu_sys_reg(vcpu, MAIR_EL2),                S=
YS_MAIR);
> +       write_sysreg_el1(__vcpu_sys_reg(vcpu, VBAR_EL2),                S=
YS_VBAR);
> +       write_sysreg_el1(__vcpu_sys_reg(vcpu, CONTEXTIDR_EL2),          S=
YS_CONTEXTIDR);
> +       write_sysreg_el1(__vcpu_sys_reg(vcpu, AMAIR_EL2),               S=
YS_AMAIR);
>
>         if (vcpu_el2_e2h_is_set(vcpu)) {
>                 /*
> @@ -191,7 +192,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu=
)
>  {
>         struct kvm_cpu_context *guest_ctxt =3D &vcpu->arch.ctxt;
>         struct kvm_cpu_context *host_ctxt;
> -       u64 mpidr;
> +       u64 midr, mpidr;
>
>         host_ctxt =3D host_data_ptr(host_ctxt);
>         __sysreg_save_user_state(host_ctxt);
> @@ -222,10 +223,9 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcp=
u)
>                 if (vcpu_has_nv(vcpu)) {
>                         /*
>                          * Use the guest hypervisor's VPIDR_EL2 when in a
> -                        * nested state. The hardware value of MIDR_EL1 g=
ets
> -                        * restored on put.
> +                        * nested state.
>                          */
> -                       write_sysreg(ctxt_sys_reg(guest_ctxt, VPIDR_EL2),=
 vpidr_el2);
> +                       midr =3D ctxt_sys_reg(guest_ctxt, VPIDR_EL2);
>
>                         /*
>                          * As we're restoring a nested guest, set the val=
ue
> @@ -233,10 +233,11 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vc=
pu)
>                          */
>                         mpidr =3D ctxt_sys_reg(guest_ctxt, VMPIDR_EL2);
>                 } else {
> +                       midr =3D kvm_read_vm_id_reg(vcpu->kvm, SYS_MIDR_E=
L1);
>                         mpidr =3D ctxt_sys_reg(guest_ctxt, MPIDR_EL1);
>                 }
>
> -               __sysreg_restore_el1_state(guest_ctxt, mpidr);
> +               __sysreg_restore_el1_state(guest_ctxt, midr, mpidr);
>         }
>
>         vcpu_set_flag(vcpu, SYSREGS_ON_CPU);
> @@ -271,9 +272,5 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
>         /* Restore host user state */
>         __sysreg_restore_user_state(host_ctxt);
>
> -       /* If leaving a nesting guest, restore MIDR_EL1 default view */
> -       if (vcpu_has_nv(vcpu))
> -               write_sysreg(read_cpuid_id(),   vpidr_el2);
> -
>         vcpu_clear_flag(vcpu, SYSREGS_ON_CPU);
>  }
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f6cd1ea7fb55..aa1a0443dc6a 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1656,7 +1656,7 @@ static bool is_feature_id_reg(u32 encoding)
>   */
>  static inline bool is_vm_ftr_id_reg(u32 id)
>  {
> -       if (id =3D=3D SYS_CTR_EL0)
> +       if (id =3D=3D SYS_CTR_EL0 || id =3D=3D SYS_MIDR_EL1)
>                 return true;
>
>         return (sys_reg_Op0(id) =3D=3D 3 && sys_reg_Op1(id) =3D=3D 0 &&
> @@ -1989,6 +1989,34 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const=
 struct sys_reg_desc *rd,
>         return 0;
>  }
>
> +static int set_id_reg_non_ftr(struct kvm_vcpu *vcpu, const struct sys_re=
g_desc *rd,
> +                             u64 val)
> +{
> +       u32 id =3D reg_to_encoding(rd);
> +
> +       guard(mutex)(&vcpu->kvm->arch.config_lock);
> +
> +       /*
> +        * Once the VM has started the ID registers are immutable. Reject=
 any
> +        * write that does not match the final register value.
> +        */
> +       if (kvm_vm_has_ran_once(vcpu->kvm)) {
> +               if (val !=3D read_id_reg(vcpu, rd))
> +                       return -EBUSY;
> +
> +               return 0;
> +       }
> +
> +       /*
> +        * For non ftr regs do a limited test against the writable mask o=
nly.
> +        */
> +       if ((rd->val & val) !=3D val)
> +               return -EINVAL;
> +
> +       kvm_set_vm_id_reg(vcpu->kvm, id, val);
> +       return 0;
> +}
> +
>  static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *=
rd,
>                       u64 val)
>  {
> @@ -2483,6 +2511,15 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>         return true;
>  }
>
> +#define FUNCTION_RESET(reg)                                            \
> +       static u64 reset_##reg(struct kvm_vcpu *v,                      \
> +                              const struct sys_reg_desc *r)            \
> +       {                                                               \
> +               return read_sysreg(reg);                                \
> +       }
> +
> +FUNCTION_RESET(midr_el1)
> +
>
>  /*
>   * Architected system registers.
> @@ -2532,6 +2569,8 @@ static const struct sys_reg_desc sys_reg_descs[] =
=3D {
>
>         { SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_E=
L2, 0 },
>
> +       { ID_DESC(MIDR_EL1), .set_user =3D set_id_reg_non_ftr, .visibilit=
y =3D id_visibility,
> +         .reset =3D reset_midr_el1, .val =3D GENMASK_ULL(31, 0) },
>         { SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
>
>         /*
> @@ -4584,13 +4623,11 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
>                 return ((struct sys_reg_desc *)r)->val;                 \
>         }
>
> -FUNCTION_INVARIANT(midr_el1)
>  FUNCTION_INVARIANT(revidr_el1)
>  FUNCTION_INVARIANT(aidr_el1)
>
>  /* ->val is filled in by kvm_sys_reg_table_init() */
>  static struct sys_reg_desc invariant_sys_regs[] __ro_after_init =3D {
> -       { SYS_DESC(SYS_MIDR_EL1), NULL, reset_midr_el1 },
>         { SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
>         { SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
>  };
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

