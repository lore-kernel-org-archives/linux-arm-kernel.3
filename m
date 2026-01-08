Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABDBCF6A81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=; b=Tqrj9SrG4juSGRgfKEALIz56FD
	ctEpiEAgphA0wsl/5AWLNqUSqLB8WUdp7ZkERhGpH3oWNBRjL9yHd74YB4H1Xq9+heIn4ntj5R6Ye
	DUIYElCk0VhQwHtY3OLGb73GZjp3q6UfIW4zDu9JNnqdftUiBVl7QoSozSVPzvg5hQOXxPdT5JInR
	f5Eimb6N4ykCpVZR+lHEgz0LJGVikOLHm5/Bmfm1TG8qRagLBjF/qFirAT1LbbKlSUf4o5mAGwZjP
	ELDBFt9Ish4pV9wAmDgyq68pymDNZA5X10mGS4qWMDeXKHrNcJ+Lui6L5iFDv1XMfFSNPXWDpa8zu
	M+S611Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqif-0000000HHKY-3Ixx;
	Thu, 08 Jan 2026 14:10:33 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqia-0000000HHHl-2R4C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:33 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4edb8d6e98aso1158371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881427; cv=none;
        d=google.com; s=arc-20240605;
        b=AbcrSNgihgwz+6vLMuaRWr+zzwur/lvpAazKtbCfi3vtrXnmUvNj+n227s8XDJMa/2
         ZTwFg3BOzKuiPt3xM9fq7Cfh4459J/3HIqRj/eTzE6j9T5b7k54qmsGCDhfq3RPHx0t2
         T0WQbnsyWRvdftnOiTlekG6RLDPrX7KonIysoknNfcgXQgAzD64ZR4IzQ2Hetnln4pBT
         t9nlDOaTe9VoKeCvgqtXF1iiQPZCi/88Ux7sJpW4+xfCxKvBj6U5QV9h5tBKHs526PRN
         8X6+TUzHqkjhsWEXz2naHkC1bxC7TfdTCBVxHka/pk+sZ6lBRhpawizRXC+cggbYoQ+f
         n+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        fh=cq7M0N1A2g2QrDg//8oMUORwulnG4vzwVfazwQF3lnc=;
        b=BP5kCv7UFRhn4ClU1l8CZD7Fk/CHkmqzCVE4fFLprcjUOiSeecuBFWFSfEC4i9hhVk
         mEo87HaRkvDb0plmTaKvtwF76ukMZO+4bSH2hXLvWRdnQNigGKU4Z3HRRSspMEw8OhT1
         T4AsQWqCDsXv9smJRQB2b5qGoNTuLI8ckigFfP6/z5EqPiWG2Wi0g2E2owYrnJGQ2toM
         TkwJMYFhjXIYSWcjvq8mLrlgBhvnEK317+TDl1cA4eheLVenOmTn240ujfqCQ/g08PeL
         D7f8rP56t5fMroYXngNBD4tyYD292lRDFRH66gOMW75CJrUbm4KzkH76i10/uDhbgNDa
         a7RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881427; x=1768486227; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        b=19hBGCs1Q941L9oy9PLSkXzvDYF6jmVoeJuJqzac5lEJuTmf2IqfNvBKXqdRKYeDGv
         1pJR9/gBlUOyW3zXb1yvUfn30B9FX44Qnu7VbccOw2qIdEm7Q8YH0TUux08mQgct9ZMk
         mci8G7Myh8C3qTBuOuvjpeDzlPizcXD+DBg0YKYQCbLEqxDh3DpkLd7uMmNHCspxdxX1
         puag5+F/8ddpEzVwQbbOgVUETOKbqjb8MvKsV1wgKv2fnJ36nzGm5tNk65/dYLu6NQSh
         Pof52gSNy7++D5PRZkmGXYaalLUf45n7MshUDo1FldVuyPs0IsxJd8qKXZClV3v3qKno
         h7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881427; x=1768486227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        b=jjCIAF6/ThCRoGCPhB61NloX5wbdHTlAvp6zrF2ZbbBiUeSgWtD/duMjM800lHOm66
         f9SadmwZOwk9df/SDLiFC9qziZA2XGWIf3U7Jk8bFG2uAIljqMHVMAzo95JbHJlpIdsb
         gutDkhlBu1i6mIZjLTsddK/5mWZKHXQzetE5Oy/OofK/Z6aURzU//vsWjuHpMmKK30Cl
         DMgQ+DMhhuHgXPXCLBIGHG9SYkJ0uLIbsn7Dxp/C+VGuJ8igfYHgPOvllFAaX88xuN/y
         GIJ7y6ovLl/FbpnCa8dWCgdCLMg2KvF4DrDQBxdMG1HMP6cIAqdMXvJY3Y47jsedTPxX
         w8pw==
X-Forwarded-Encrypted: i=1; AJvYcCWRpxUn5yfXYq2Qv/MmjwIxmrvWcexhUiSlhz7xmnhaq/PDFvrl2YwriGRvyONMUtortZYZ/cInnd3LPXGEXZLQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyHFnGxekjFbJfHU9DEaKXU6IRO8tB+A60EPZgJ+Dna7xwCqWvF
	3aymYZNkxQiRIfRP8aWMHe3kOeKgSejvXXBg4oBOrFf4UNDMlTxGEVTQzZzIoRcYjfAbxraJDYh
	QlI90NqReJUcJEgzJBcPJ++vYXLw7ecfUpatbkxvb
X-Gm-Gg: AY/fxX7sz8IOZbkyWtkC1R6NqG7iHTxdLLpw+d2UDYQgUy5smiQPttpCPggjDOPc7Mv
	7U0KuUsq1qb8cdAAgXxaj9nJDEUaacv4UxdfjY/WSOPKmJU1S+2EEGLnMtrfhGkwMKQAH4cZNQf
	qJ7s9B5YUlx+D8BljFej//VFs/JaSZRSXCj/R42v+ywtWZE7A3do2T+KYClxHEdW+4WZBupz5Ys
	AMzlVDRH+kB8D4g4ynMX/rZHaEsxfZE2sOQPksvNW7wnoq64BgmJ0t3HJEtHupZIKdw6a8fcuVn
	GVLiHfA=
X-Received: by 2002:a05:622a:54a:b0:4f4:bb86:504f with SMTP id
 d75a77b69052e-4ffc0a70687mr8479691cf.16.1767881426893; Thu, 08 Jan 2026
 06:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-8-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-8-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:50 +0000
X-Gm-Features: AQt7F2q2Xuj85YtjC8aNYrYefXO_WXhklsHw1E8DTYu1HFx1qzlPPDyk9yC5egA
Message-ID: <CA+EHjTx8hu=WEu54Bt82PtcsOdQHaVkw9ivQSSC9=SV7bf1Zvg@mail.gmail.com>
Subject: Re: [PATCH v9 08/30] KVM: arm64: Move SVE state access macros after
 feature test macros
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
X-CRM114-CacheID: sfid-20260108_061028_637529_D8788B03 
X-CRM114-Status: GOOD (  20.38  )
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
> In preparation for SME support move the macros used to access SVE state
> after the feature test macros, we will need to test for SME subfeatures to
> determine the size of the SME state.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/include/asm/kvm_host.h | 50 +++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ac7f970c7883..e6d25db10a6b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1048,31 +1048,6 @@ struct kvm_vcpu_arch {
>  #define NESTED_SERROR_PENDING  __vcpu_single_flag(sflags, BIT(8))
>
>
> -/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> -#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> -                            sve_ffr_offset((vcpu)->arch.sve_max_vl))
> -
> -#define vcpu_sve_max_vq(vcpu)  sve_vq_from_vl((vcpu)->arch.sve_max_vl)
> -
> -#define vcpu_sve_zcr_elx(vcpu)                                         \
> -       (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> -
> -#define sve_state_size_from_vl(sve_max_vl) ({                          \
> -       size_t __size_ret;                                              \
> -       unsigned int __vq;                                              \
> -                                                                       \
> -       if (WARN_ON(!sve_vl_valid(sve_max_vl))) {                       \
> -               __size_ret = 0;                                         \
> -       } else {                                                        \
> -               __vq = sve_vq_from_vl(sve_max_vl);                      \
> -               __size_ret = SVE_SIG_REGS_SIZE(__vq);                   \
> -       }                                                               \
> -                                                                       \
> -       __size_ret;                                                     \
> -})
> -
> -#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
> -
>  #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
>                                  KVM_GUESTDBG_USE_SW_BP | \
>                                  KVM_GUESTDBG_USE_HW | \
> @@ -1108,6 +1083,31 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_gp_regs(v)                (&(v)->arch.ctxt.regs)
>
> +/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> +#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> +                            sve_ffr_offset((vcpu)->arch.sve_max_vl))
> +
> +#define vcpu_sve_max_vq(vcpu)  sve_vq_from_vl((vcpu)->arch.sve_max_vl)
> +
> +#define vcpu_sve_zcr_elx(vcpu)                                         \
> +       (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> +
> +#define sve_state_size_from_vl(sve_max_vl) ({                          \
> +       size_t __size_ret;                                              \
> +       unsigned int __vq;                                              \
> +                                                                       \
> +       if (WARN_ON(!sve_vl_valid(sve_max_vl))) {                       \
> +               __size_ret = 0;                                         \
> +       } else {                                                        \
> +               __vq = sve_vq_from_vl(sve_max_vl);                      \
> +               __size_ret = SVE_SIG_REGS_SIZE(__vq);                   \
> +       }                                                               \
> +                                                                       \
> +       __size_ret;                                                     \
> +})
> +
> +#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
> +
>  /*
>   * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
>   * memory backed version of a register, and not the one most recently
>
> --
> 2.47.3
>

