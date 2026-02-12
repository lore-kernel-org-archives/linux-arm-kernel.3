Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AE6EEA84A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxJxh9FSjNvMYBpkVXl2+9DScVhBboCfxSSFZplOIEM=; b=sUlIACbfBl9zpVRJyUsg7N+vfV
	pvkFHe/wjLTijxDb6FqK2fDAB4T2pOCmPWGUsMCEvIWrlYrBZmXglnYZiBsx3u35jEZrigHNuqXe5
	/gHtyh8zXdKzc20jN/Jlswhm5sqB0LA86zUQH2Qym0UXRL9m9NeJyfsleCbD6qjz2C2VlGiVUKfT2
	DmDx/qk/jPJcLOQh/iVoCq1KAp7BTvOvCHEgnedTYfgxGzQVCq1k8xiP+NVSFvyA0Yg3H0VGyolzv
	NIlsm0DmbYhIxWbN13PGMhdA+WJHI/eLN5K6/RgjUv/47wqPnuQe3sEEjympGo1xrEWr2SBSAC58/
	3GwnXlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqboy-00000002Y60-09i6;
	Thu, 12 Feb 2026 18:53:48 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbou-00000002Y5G-0N5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:53:46 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5069a785ed2so40021cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 10:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770922423; cv=none;
        d=google.com; s=arc-20240605;
        b=CFtRbGDoxU/JYCWeaA/gDKLfOkKfTEY2t9L686h/cHaH5IYcf9BHRTIWZTQoNkR0iH
         eY9IRZQ8AtFY2JurJ9GUe/kDXsO/CMOBHPXJ6iJouYd7Y6y9b2AmcujPHPm4Gy5U6j+H
         p7JCaXlhOTNjZEOsanvrFrVLezPrVaCYSOkG3Th4P7q6TBGbnhoNtqT1QESAb3eEkrNv
         OiPZrYRJBAeBeMVuuhb1km8BO5kS+cxTMH9pPwXMfXQJ1IVCEl2pEqY9zsTNI69NlOSd
         LMUGAZeQhu4SGoA596B3vDFIDV+S6U6puNbfsm134GS64PkaFZK3XyEcsl9AZv/gaKHw
         5AtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KxJxh9FSjNvMYBpkVXl2+9DScVhBboCfxSSFZplOIEM=;
        fh=z0ogAZ2STDRPQvCfiddFWZK0Esf/5YYjWbwL/GxcB3I=;
        b=WV7LXmzLc54QxQ7651yofaC6t4M0M0SB1Tt8LVzwrwDTfjOqKXOzpxFn5UMCsgYIFO
         4StoV7MStuNKAbG7v+wfHOVgXwBUQUB+gnnvJwykwOOc6XMXVrRNAB+6hWSFkHlUqC+7
         rY6okkSdzIStl4YCfynB3BnET7709m/UFMmyjQ/BHLU1T6+X7HruNPLV8MVjhc+QR7e6
         dgy/1GZcBjRyL5+l0dwz+CKRQAuzvQek7uWtbaHyjdNVQjLhdQzuoBw8vx2tYvs83tqe
         FeCpEFQX2HpjWkr+Dlsvy4BcW5m8b49ltTCkway4ta3izt7IIPqD8QRrPJn6CEHZrGQ/
         7htg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770922423; x=1771527223; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KxJxh9FSjNvMYBpkVXl2+9DScVhBboCfxSSFZplOIEM=;
        b=oekwOxn4PXSeFd9UpM3uvv16UgfmV5wjRahZCmBr2WjarIz+5A0XKMOy5B1rJJwGKu
         uvGB2yrGtrr5Wd+GShQTdIB5TEZNXWcjB9VmJUi0d7AVPFcuCr83I6WDwN+8hoN/OE2X
         hprkGU7+i9lQPSdPWr4IoA49YWBsEU4PNAetG5ffaUyAAdQR5hOLF3+gtz2mAvT1wMEj
         Geh5Zd17gbZdGUR9/AxCk33KGYisajM4ADjgJTxAjVsnsy1UdMzhcts93+bdkj4SGAqa
         9qYXcFNG1uDD2utiy8DsRGDjj2DECmWyxZ3o2XYZMFuCkURojzRe14KRjnxUACAesM1Z
         xfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770922423; x=1771527223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxJxh9FSjNvMYBpkVXl2+9DScVhBboCfxSSFZplOIEM=;
        b=OreB5w5SbO0MpTTPAY/85HHDCBo8QYzyjTIfcifGuajZxkZGp1SzQlrLCyVDd9WHhS
         pGmGIAc94WfraB4EPGkrdfz7PwbSeViU9+x8NVcKWFwPGoxDt/I7mZe1B9WXrkh7+kuA
         bJOmuixadEr488bv6iLRqgK3iLNht+e72Incu4tzOAYxQM060sp6TyviyJY1eIuhSbCN
         Lw2qPrCJ9fZmRFn14BnoKEy1WD8GWe+2wjur+U65/wdYAYlRFSy/Sun10aVWuAeeEQvP
         bwj6v9GhKh+BR4/D6BNP8n/ybRs2r2Ep5J1FQXDvBHMEgL/bPK8oq6Xs8MsSdPujrU8e
         uODQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKDlbCA1d9Nawsu5zfjkrVKuspQcyicTMoyJhG+6E4jL0X31cazkmveJbZOxlJPx9PAj3t7IRnoQ5W6BIlgHHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUt1y6bfa2mfwTyXr44XBqZ3qrkAGgTe/gnHYvn0SS6RNxhB2v
	opKruFX/Wsf+bHsbtkdVOCerfsW15gNsK08jbT/V1au4SLdvDxxBuo3QRwDgZ6kp/lxt7/8iB1c
	AmjTR6kiQgAX1Wg5N8zMIWmLssIpkg0wHDc+uIvwm
X-Gm-Gg: AZuq6aL8j90VIPr1pU3OCqsBz30qWoHmL62IFDYZNM3D1oM/1eF7WrL+/FMX3gssVLi
	t395yA9CnbEgALKKD4lEns8TMD/L/8F8o6fF2JT0rwV789e94BrRTG/mjSw+nCvL6uAmXUnVj5H
	EgBzWhd/9yYgHS2qleDGTZeSNe1lQIY80j3YyfcjBQKlFbhvPFmO/egX2oXqMY/RZIYFxXAHPdv
	qtUl3aZXKiLfFa3IfBMVWiaUCJFuhRYUWwP0nnZxXbNMPQdTfblPc8aMSu3HKQVv2z4EtUSCTXG
	zfwPyCqblIKbq3lsLew=
X-Received: by 2002:ac8:5ace:0:b0:503:2e98:7842 with SMTP id
 d75a77b69052e-506a5089fd7mr798601cf.4.1770922422056; Thu, 12 Feb 2026
 10:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com> <20260212090252.158689-2-tabba@google.com>
 <86jywib98e.wl-maz@kernel.org> <CA+EHjTz-JU2gDfziCY2SguK9=6gGSCL5TN_U_C7FiZ5i0JTZqQ@mail.gmail.com>
 <86ikc2asa8.wl-maz@kernel.org>
In-Reply-To: <86ikc2asa8.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Feb 2026 18:53:05 +0000
X-Gm-Features: AZwV_QgjHAKlb2oJ6cTtVmiD8glUdVPUVPAc_uYr3UsDjUESaoBBPSZwwkWqYwc
Message-ID: <CA+EHjTwLcxB1e_FZsw_Semoj8tjMBUKZFM8+Vbo+64+=T4GN-Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Hide S1POE from guests when not
 supported by the host
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_105345_835985_4905986A 
X-CRM114-Status: GOOD (  38.44  )
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

/fuad

On Thu, 12 Feb 2026 at 15:35, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 12 Feb 2026 09:41:22 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Thu, 12 Feb 2026 at 09:29, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > Hi Fuad,
> > >
> > > On Thu, 12 Feb 2026 09:02:50 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > When CONFIG_ARM64_POE is disabled, KVM does not save/restore POR_EL1.
> > > > However, ID_AA64MMFR3_EL1 sanitisation currently exposes the feature to
> > > > guests whenever the hardware supports it, ignoring the host kernel
> > > > configuration.
> > >
> > > This is the umpteenth time we get caught by this. PAN was the latest
> > > instance until this one. Maybe an approach would be to have a default
> > > override when a config option is not enabled, so that KVM is
> > > consistent with the rest of the kernel?
> >
> > I spoke to Will about this, and one thing he'll look into is whether
> > this value in `struct arm64_ftr_reg` can be made consistent with the
> > cpu configuration itself (in cpufeature.c itself) . This would avoid
> > the problem altogether if possible. The question is whether the kernel
> > needs to somehow know that a certain feature exists even if it's
> > disabled in the config...
> >
> > If he thinks it's not doable at that level, I'll look into
> > alternatives to make it correct by construction.
>
> What I currently have for that is rather ugly:
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 72f39cecce93a..3bde0ad5ea972 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -971,6 +971,7 @@ struct arm64_ftr_reg *get_arm64_ftr_reg(u32 sys_id);
>  extern struct arm64_ftr_override id_aa64mmfr0_override;
>  extern struct arm64_ftr_override id_aa64mmfr1_override;
>  extern struct arm64_ftr_override id_aa64mmfr2_override;
> +extern struct arm64_ftr_override id_aa64mmfr3_override;
>  extern struct arm64_ftr_override id_aa64pfr0_override;
>  extern struct arm64_ftr_override id_aa64pfr1_override;
>  extern struct arm64_ftr_override id_aa64zfr0_override;
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 1a7eec542675b..32069da9651bf 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -778,6 +778,7 @@ static const struct arm64_ftr_bits ftr_raz[] = {
>  struct arm64_ftr_override __read_mostly id_aa64mmfr0_override;
>  struct arm64_ftr_override __read_mostly id_aa64mmfr1_override;
>  struct arm64_ftr_override __read_mostly id_aa64mmfr2_override;
> +struct arm64_ftr_override __read_mostly id_aa64mmfr3_override;
>  struct arm64_ftr_override __read_mostly id_aa64pfr0_override;
>  struct arm64_ftr_override __read_mostly id_aa64pfr1_override;
>  struct arm64_ftr_override __read_mostly id_aa64zfr0_override;
> @@ -850,7 +851,8 @@ static const struct __ftr_reg_entry {
>                                &id_aa64mmfr1_override),
>         ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2,
>                                &id_aa64mmfr2_override),
> -       ARM64_FTR_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3),
> +       ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3,
> +                              &id_aa64mmfr3_override),
>         ARM64_FTR_REG(SYS_ID_AA64MMFR4_EL1, ftr_id_aa64mmfr4),
>
>         /* Op1 = 0, CRn = 10, CRm = 4 */
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 85bc629270bd9..202e165a4680c 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -51,6 +51,7 @@ PI_EXPORT_SYM(id_aa64isar2_override);
>  PI_EXPORT_SYM(id_aa64mmfr0_override);
>  PI_EXPORT_SYM(id_aa64mmfr1_override);
>  PI_EXPORT_SYM(id_aa64mmfr2_override);
> +PI_EXPORT_SYM(id_aa64mmfr3_override);
>  PI_EXPORT_SYM(id_aa64pfr0_override);
>  PI_EXPORT_SYM(id_aa64pfr1_override);
>  PI_EXPORT_SYM(id_aa64smfr0_override);
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index e5ea280452c3b..b8dbe02e53171 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -24,10 +24,12 @@
>  static u64 __boot_status __initdata;
>
>  typedef bool filter_t(u64 val);
> +typedef void cfg_override_t(struct arm64_ftr_override *);
>
>  struct ftr_set_desc {
>         char                            name[FTR_DESC_NAME_LEN];
>         PREL64(struct arm64_ftr_override, override);
> +       PREL64(cfg_override_t,          cfg_override);
>         struct {
>                 char                    name[FTR_DESC_FIELD_LEN];
>                 u8                      shift;
> @@ -106,6 +108,22 @@ static const struct ftr_set_desc mmfr2 __prel64_initconst = {
>         },
>  };
>
> +static void __init cfg_mmfr3_override(struct arm64_ftr_override *override)
> +{
> +#ifndef CONFIG_ARM64_POE
> +       override->mask |= ID_AA64MMFR3_EL1_S1POE_MASK;
> +#endif
> +}
> +
> +static const struct ftr_set_desc mmfr3 __prel64_initconst = {
> +       .name           = "id_aa64mmfr3",
> +       .override       = &id_aa64mmfr3_override,
> +       .cfg_override   = cfg_mmfr3_override,
> +       .fields         = {
> +               {}
> +       },
> +};
> +
>  static bool __init pfr0_sve_filter(u64 val)
>  {
>         /*
> @@ -221,6 +239,7 @@ PREL64(const struct ftr_set_desc, reg) regs[] __prel64_initconst = {
>         { &mmfr0        },
>         { &mmfr1        },
>         { &mmfr2        },
> +       { &mmfr3        },
>         { &pfr0         },
>         { &pfr1         },
>         { &isar1        },
> @@ -398,14 +417,19 @@ void __init init_feature_override(u64 boot_status, const void *fdt,
>  {
>         struct arm64_ftr_override *override;
>         const struct ftr_set_desc *reg;
> +       cfg_override_t *cfg_override;
>         int i;
>
>         for (i = 0; i < ARRAY_SIZE(regs); i++) {
>                 reg = prel64_pointer(regs[i].reg);
>                 override = prel64_pointer(reg->override);
> +               cfg_override = prel64_pointer(reg->cfg_override);
>
>                 override->val  = 0;
>                 override->mask = 0;
> +
> +               if (cfg_override)
> +                       cfg_override(override);
>         }
>
>         __boot_status = boot_status;
>
>
> which works, but is not super friendly.

Ouch! Yeah, no easy solutions here. For now, as a fix to be able to
backport, would you like me to respin this without the change to
kvm_has_s1poe(), or with that change as a separate patch?

Cheers,
/fuad
> Looking at the arm64_ftr_reg structure, this could work if
> FTR_VISIBLE_IF_IS_ENABLED() didn't simply put "HIDDEN" when the
> feature is not present, but forced things to be disabled
> altogether. The problem is that "HIDDEN" means not shown to userspace,
> and that we have plenty of HIDDEN features that must make it into KVM.
>
> I'll have a think.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

