Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8ECD26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=; b=AhLKGY161dtBDfk12OJ69PF1HF
	UK8Pu0p1oI5MaJ8cU8lpQAMwvJVdApgXUAvyQp24aWOrNqjvD/C77lesU/JCuB6/6cyRsCDNTrMDy
	SrrAS5usEL30NIGrrShHTLsZkR5SyiVyiohxW0/8LT5Pkoe3SrI0jYzr2dBPko8jC+piDqtWulGTs
	YobpKqo66M8Fnc68uUl7A0hMW4dSX4qFeTnRkADCdHnfrCYAt0R2LjqtBzsPjMFPbOoAIo+5LBIIz
	7MVfftJ1g/jkS3fTFo67rfyUYQzCUfa7ltgCUwwL5Jz0N739lFJhYeMfIYSKu+dxgMjL671ayRrnj
	E14Vj0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFnr-00000002fDu-1VAG;
	Fri, 09 Jan 2026 16:57:35 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFno-00000002fDL-46Lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:57:34 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ee147baf7bso486541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767977851; cv=none;
        d=google.com; s=arc-20240605;
        b=j42PZKP19gmeD+B0QfyeK9OiTUyJdtCc2ENnZRmULUznyuGLESkVGi6OxoJoaxm2CD
         ZLnh7v/VwurecRjRaZKqyoymD6sO4HZVyytnO4kFtVl809zj1Pohb1x9IDHyRvl2SweQ
         7E7iGewK7VOyvs7M1Q/CtDPLuEW7U8JqaYncBHcOC+mwwIVIMn4DiU7oNPXX23NW+Z3M
         5Ffmb2YcTZx6foz93Z1v1sNOhFUQ7DnXNCxB6GzvqPA9aW+3kzRkkAEtH3Hsw24yMLTZ
         HPKIWtHecQKeZRdu64sHcSBAuhNGgrFdxMYznlI3ttw431qVZPIMKabJy+X4RobuzXB+
         OeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        fh=F3NxZjKJEMXTuejoIUGjGQYIvskwyGftW7NKuk4tRJY=;
        b=Xnlhp/jF3rQYZ49mJS74Ywrk9Q8XbFfsWEsZT5jh472WklmuvBbNmqxlz7LweHLpyG
         uXKudSOWwb1mOAS6Nvt4gUe0H+9Ki75W83A/Bh1z+VMpntSECXnCZXrtlbuz63bia7e3
         PcBUQx/rj9v7Q+cYFOenLJ3dVL6CFwbmo6s3Hhg0f0UQF5CnAYDjGqegHGQnXSysp/8F
         e5iDHft/RGIo8HEds09XEe4D9qkHykiR6N/xvdcneZQqiOYdzGCTHeNH6wezAncbNrQ9
         dVDahK04+nkNWbEaM5j9bNu6ipkSk51XSTWa3QsKyPlqUlHVs9GTIpS8/raXkWaXHWdp
         L7GQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767977851; x=1768582651; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        b=r8rDngaEqEpEXz/spg3XW51TvwLtxMWz80h8VkQ3Jr5yr8oqofIDZflgN2bvZfqEBS
         bgbslkU6/8WCVUs2ysZM6spit4JhahLBBeND6/NGi/61YhziEznR/CahB9Npz1/VurSq
         9ml84rVd79L+7VK9baE0Xu+lLTfBuEXCRKHK51a8YxQxWYVMvL1Ey1v/wvQ5uPngGWsg
         XYhWpx16//K8qRPKxemoZn7mmO4DXwX2okhTe3XtVVFJ4QiNwhQVkjbHQOwchMLZ53SI
         CWe8nR0n4NS0cURdMii9LfuPGS/6ROvR+JFanEeCVRrRZ+ME+hTNpJqjv6L18ji6QRa5
         KLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977851; x=1768582651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        b=lP+MSgHY/YEK8SsTlC/60HKjh5PsNPQLUeTRg5qvq+Xl6laLZ4JceQB8gKol6KEgUl
         UAyC3AxLkeKbQnnsaOCeCyLU+n9PXwjLbXQih48yLumCkNqwWY4elUfE/G48YWci/hEL
         FNdBdgM4Or6MlsdIJ99L2YtILKddMt1FbLdpDQM0ivcQPj2tqasRZan1WKZJ+mol2Awz
         vAHpsEbThbOm2eli8eXuxdT9oC58jZ7ssTXesTfB/0id09tlN8AauZbRvmw0tl9iFmgX
         pTqX2voJ52nWZ++FNQD+hMr1XcjDUzVNj0qauSr6hZZwCZbTbFrs05jmUAKaWPQRO9k+
         j0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjUhF7E3yBNIdTIDoOmv1wMaCnWRiS/3XEYEF0AplfT407alCtR30UwEoR9lB4PS9h2lWykB7zWpJ2eefuIzgT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk5jvaoXkUAB2Yl1WdW2fJW4pIT+7uRvE/vJRRXhIBhYmrgUZZ
	rER8x5GKdyCdQkC5FCZ3IJFVNrJB/bEoYmR7Y16RYO5XWkkK5jzNq6mIoM8C+2pwcaYFZs70c5v
	1vv87s2i5qUv/gKUwQzmVmcXRQEq0TSGx7h+RtApO
X-Gm-Gg: AY/fxX4eXDQjMONcsxO2cDPv5gHkUWCDGUa4jjdRKFlaI5Mr1QzmRYQmH2PD3YUCNoK
	GoFbVv5lv5HSVsj1YmHhJF+kmAn7WCB/Y/uHaQH8zwhwl/MjsPe20wHdc5Vdg+DY2xXVgx6Q20O
	z0g0IOJjSJvKqS7WyLOl0x2Jw1SiyToDik+yi5S9K4DZwRRVzylpIYoXg1w8u8c18WEFSY96aYt
	sJrI7OJpgIlvIkuv+nBM5NTl+UW9yD3sLJbN+/LUcBYNJMVN08XZNNaFd46yGFjaCA16c1t
X-Received: by 2002:a05:622a:198e:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-4ffca38a667mr12955411cf.14.1767977851098; Fri, 09 Jan 2026
 08:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-16-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-16-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 16:57:00 +0000
X-Gm-Features: AZwV_QiwST85CNc25KZYMBDJwxaQzBlftzyvIde5n_9dAYz2SEbvmx43n1faTzI
Message-ID: <CA+EHjTwTmjNEV+4w8w=LXfR0g_v7yHk1pQD+Oos8V3vFfEVdMw@mail.gmail.com>
Subject: Re: [PATCH v9 16/30] KVM: arm64: Support TPIDR2_EL0
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
X-CRM114-CacheID: sfid-20260109_085733_071124_027D4FE9 
X-CRM114-Status: GOOD (  24.53  )
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
> SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
> for delayed saving of the ZA state but in terms of the architecture is
> not really connected to SME other than being part of FEAT_SME. It has an
> independent fine grained trap and the runtime connection with the rest
> of SME is purely software defined.
>
> Expose the register as a system register if the guest supports SME,
> context switching it along with the other EL0 TPIDRs.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_host.h          |  1 +
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
>  arch/arm64/kvm/sys_regs.c                  |  3 ++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index f24441244a68..825b74f752d6 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -448,6 +448,7 @@ enum vcpu_sysreg {
>         CSSELR_EL1,     /* Cache Size Selection Register */
>         TPIDR_EL0,      /* Thread ID, User R/W */
>         TPIDRRO_EL0,    /* Thread ID, User R/O */
> +       TPIDR2_EL0,     /* Thread ID, Register 2 */
>         TPIDR_EL1,      /* Thread ID, Privileged */
>         CNTKCTL_EL1,    /* Timer Control Register (EL1) */
>         PAR_EL1,        /* Physical Address Register */
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index 5624fd705ae3..8c3b3d6df99f 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -88,6 +88,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>         return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>
> +static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm_vcpu *vcpu;
> +
> +       if (!system_supports_sme())
> +               return false;
> +
> +       vcpu = ctxt_to_vcpu(ctxt);
> +       return kvm_has_sme(kern_hyp_va(vcpu->kvm));
> +}
> +
>  static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
>  {
>         return host_data_ptr(host_ctxt) != ctxt;
> @@ -127,6 +138,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>         ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
>         ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> +       if (ctxt_has_sme(ctxt))
> +               ctxt_sys_reg(ctxt, TPIDR2_EL0)  = read_sysreg_s(SYS_TPIDR2_EL0);
>  }
>
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
> @@ -204,6 +217,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>         write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),     tpidr_el0);
>         write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),   tpidrro_el0);
> +       if (ctxt_has_sme(ctxt))
> +               write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
>  }
>
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5c912139d264..7e550f045f4d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3504,7 +3504,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>           .visibility = s1poe_visibility },
>         { SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
>         { SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
> -       { SYS_DESC(SYS_TPIDR2_EL0), undef_access },
> +       { SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
> +         .visibility = sme_visibility},
>
>         { SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
>
>
> --
> 2.47.3
>

