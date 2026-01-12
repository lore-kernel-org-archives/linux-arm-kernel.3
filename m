Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503A9CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeVorztV8L2661ciMsTJRNHNSwWuFDTDQ9Xn6dJSHXo=; b=iRKDoJa5/L86GkWpcWoKp98Hag
	CNB0JxZqcWvh8fKSUz64bL/fKXmvCYp9Py73ZbZGqTfSTmaYcPI17amkx2Umed68LWCXGzlhP1z8W
	wHertBfH/M8RLx9fhlhKvNFuPKH6fM44wMB2dTBvlfy2rDmPchcEnLyVq7MYPaYaEGzkd4m4MHNvE
	rOaZSo5GowTQLoIKQy9qWcwAlpdyvpNldm74Y/LKLrcVrr8+Y0W4E1DpQ4B/FX3dyrqq1fRn69EoR
	+oOe7PDovkpUn79RZ+77qh4/Ckk+tNIAJpQDQby3dfpMx9S3YNpkFhqu9zk/RVDg9gy8H6cya4P4v
	T/SDr13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMmP-00000005wR1-0nLs;
	Mon, 12 Jan 2026 18:36:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMmM-00000005wQc-2q0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:36:39 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ee243b98caso29441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:36:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768242997; cv=none;
        d=google.com; s=arc-20240605;
        b=IQ8ls/Um9CqE2VDrsJq7l4hmyKwWYTpyMgnx35UTQVWBr66AvzUkEOezNYgK99cY+R
         NGV/E+ZJngPBRkVrk0hQGXXdZ8/9yb6KilD4i9CtnwYyDG5IEOsOz0Nnf91AgRzrTp/E
         BWewtxCevkRnPv2ie0FNkC581gK0HPyI9SWhfVO9vfhScj2uueLhm1Pj2P43gXSxa4Pm
         BlvNT8tdfXCBiPGBdUC7Z2ctm0L6wgLM5qBBeUsd6DPPQQDmH+2PkTX6jXhr6sIaqCLp
         A/+6FYAC8vfUBv3gbeFQSCbtGAvUOIxv/zyeQ3n+jVQ7gF9f5IA6XdtdStB/Gnnj05ri
         qJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YeVorztV8L2661ciMsTJRNHNSwWuFDTDQ9Xn6dJSHXo=;
        fh=Y/NTX6vtbXIy2b5J+mJrjaIMPRCBNPVTL9JLGgoD0n0=;
        b=WfpSyD3pz6C8vo85EP4nebFL27NGZAFmbx5iAt9jdXUSzNHC2ecYy+Xni9xuCHA62w
         Cllo3yXwGyB7Rwmx3Q7oCyVq6v5TPMs3+VWW6wye2K+h9kRY853/xfwUSs1XM2lfb084
         B3kofwLYGdH5NQSklsevnq5ZFVYwlb9hP1yUBHNreiSuQaDsZkcstK4KZ1+0PV4BjRBb
         OKwEngRTSVfG+PwRhP2QSE0VkrosgVNq2S2ihVjmLAUZpocecPcdCWzUABXO0d4nKdqs
         yupu9/RJAs2bReocA9xrEbmBcCII/k9hLFQKB7v+i6usCQbWiJQVUKyT3i3UzkeyB9oc
         bkpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768242997; x=1768847797; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YeVorztV8L2661ciMsTJRNHNSwWuFDTDQ9Xn6dJSHXo=;
        b=ATtFciQztOPKFtgvYDaTk29kI8mGGl8epCZIvPloFxY13bqvoKJST75zF11hFvLVrK
         wRjBlMmDVLnKO8sdQJCWnm5B9Htambju8b9p8WckUfRFM5MWKPuOOv3uJtSV6qr+T13Y
         INif0xZ3gk60u23ONsqSUVu/5beVlFpKZCMmDz2V/Ym8R2knVTrK/UhPnDEx3o1HNs+7
         M+oNRLiuYTng9IJObwsmMpMVMZ3CvojcWqePb0YPVeAgsbr72V94yIgGRXBF+KvoOdIB
         HTv3N4ZbVu88A6W45oH6aX+cHrK4jexM9x4TMKmKj7ZG3F8S7fKtuCSMNGhp1Lv2zVK8
         8dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242997; x=1768847797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeVorztV8L2661ciMsTJRNHNSwWuFDTDQ9Xn6dJSHXo=;
        b=IaJJ5hNXcOkiRHnsLIQBJtb1EUy1sjWuC0cQ9Y3te+c1DaXzXN3IZOJHj+o1WRDdCF
         mV/4w9gVEjJcRBEoUrwcMerajTzV/lRy8rllwkWEWOYe3hA3EXvvwBTXTSP4w14km6bL
         3MqHoefACn3Pu3V+5tAENN51OoF1C5VKChkCfILMiq2dw4MJXDYSlFfUo4qTxQNHOY6n
         1Kf1a1Do5bls0UU/S73QP9mmZQDjod8dqC7beYRfUAxjcLjqJi5b1TjwxKYQql6vpubg
         pvTWr1rm5l64qORMMQ2LXucQ97XFhysF3Gi7tNW+AeqPG2C5fEv7MyVBSkR7KlnF3RSp
         uwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqYC2AtNmSg/itpCViUr6cpQmsWFkjL0dsZcqeA7k+tFD1fh+vLGeFDhbS6Hdns2WasGYvjrxAICKwstsfqzOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc9qSt99rX76PVlsmlsgPaNWhOycPA4+S/5XBT1C/bv6CM5Ajp
	/hGNeE3+LrhmHFZcZc62qPUt87v7g+VhQHK8wRw+pitX0pOzfE7Z8iolQqT2glL5FQ91AackLCq
	wLl4UT6Mf8MlU2LM0WIk6tbLS655ULC69+JdUHWx7
X-Gm-Gg: AY/fxX4mNc4ryEBiW7bAESiuq8HaSNXIGQpc+3AyFpcHtcJS/DJOdI3k5b97I1bfVyV
	Zcq/cO/EU+83781XPjc+dgtezGKgvVtJb8PBjmhkrqVhURg4CxiwKZour+eqYrf75as//iQvuz6
	dH8m1AGWHe90QfTiailPx/mpXvuPifHr93tlYDiHZ/Ok4jZnjiZH0txUCsz7tRSn6YeUGfoe07q
	GHs3JacOIfuJORn0UYiFYlG3nM51P/puwA/xNJV4C9QujaY/edrOrY9l2V7XHznFQCNhM0f
X-Received: by 2002:ac8:505a:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5013a3c78b1mr163381cf.1.1768242996667; Mon, 12 Jan 2026
 10:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-20-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-20-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 18:35:00 +0000
X-Gm-Features: AZwV_Qio1zjivzMeQYMIWVOvizuY7XatkfCAEo9m4hnoTRYK322NCwDdKHaZ9i8
Message-ID: <CA+EHjTyovGEkb6svw-=wR=DF52j-wWTawJ5a19EuvSt4i9Re2Q@mail.gmail.com>
Subject: Re: [PATCH v9 20/30] KVM: arm64: Support userspace access to
 streaming mode Z and P registers
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
X-CRM114-CacheID: sfid-20260112_103638_740376_024DBFD8 
X-CRM114-Status: GOOD (  32.37  )
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> SME introduces a mode called streaming mode where the Z, P and optionally
> FFR registers can be accessed using the SVE instructions but with the SME
> vector length. Reflect this in the ABI for accessing the guest registers by
> making the vector length for the vcpu reflect the vector length that would
> be seen by the guest were it running, using the SME vector length when the
> guest is configured for streaming mode.
>
> Since SME may be present without SVE we also update the existing checks for
> access to the Z, P and V registers to check for either SVE or streaming
> mode. When not in streaming mode the guest floating point state may be
> accessed via the V registers.
>
> Any VMM that supports SME must be aware of the need to configure streaming
> mode prior to writing the floating point registers that this creates.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/guest.c | 38 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 2a1fdcb0ec49..90dcacb35f01 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -73,6 +73,11 @@ static u64 core_reg_offset_from_id(u64 id)
>         return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
>  }
>
> +static bool vcpu_has_sve_regs(const struct kvm_vcpu *vcpu)
> +{
> +       return vcpu_has_sve(vcpu) || vcpu_in_streaming_mode(vcpu);
> +}
> +
>  static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>  {
>         int size;
> @@ -110,9 +115,10 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>         /*
>          * The KVM_REG_ARM64_SVE regs must be used instead of
>          * KVM_REG_ARM_CORE for accessing the FPSIMD V-registers on
> -        * SVE-enabled vcpus:
> +        * SVE-enabled vcpus or when a SME enabled vcpu is in
> +        * streaming mode:
>          */
> -       if (vcpu_has_sve(vcpu) && core_reg_offset_is_vreg(off))
> +       if (vcpu_has_sve_regs(vcpu) && core_reg_offset_is_vreg(off))
>                 return -EINVAL;
>
>         return size;
> @@ -426,6 +432,24 @@ struct vec_state_reg_region {
>         unsigned int upad;      /* extra trailing padding in user memory */
>  };
>
> +/*
> + * We represent the Z and P registers to userspace using either the
> + * SVE or SME vector length, depending on which features the guest has
> + * and if the guest is in streaming mode.
> + */
> +static unsigned int vcpu_sve_cur_vq(struct kvm_vcpu *vcpu)
> +{
> +       unsigned int vq = 0;
> +
> +       if (vcpu_has_sve(vcpu))
> +               vq = vcpu_sve_max_vq(vcpu);
> +
> +       if (vcpu_in_streaming_mode(vcpu))
> +               vq = vcpu_sme_max_vq(vcpu);
> +
> +       return vq;
> +}
> +
>  /*
>   * Validate SVE register ID and get sanitised bounds for user/kernel SVE
>   * register copy
> @@ -466,7 +490,7 @@ static int sve_reg_to_region(struct vec_state_reg_region *region,
>                 if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)

Should this be vcpu_has_sve_regs()? (zreg range)

>                         return -ENOENT;
>
> -               vq = vcpu_sve_max_vq(vcpu);
> +               vq = vcpu_sve_cur_vq(vcpu);
>
>                 reqoffset = SVE_SIG_ZREG_OFFSET(vq, reg_num) -
>                                 SVE_SIG_REGS_OFFSET;
> @@ -476,7 +500,7 @@ static int sve_reg_to_region(struct vec_state_reg_region *region,
>                 if (!vcpu_has_sve(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)

And should this also be vcpu_has_sve_regs()? (preg range)

Should you also handle FFR here, considering that in streaming mode
it's optional?

Cheers,
/fuad



>                         return -ENOENT;
>
> -               vq = vcpu_sve_max_vq(vcpu);
> +               vq = vcpu_sve_cur_vq(vcpu);
>
>                 reqoffset = SVE_SIG_PREG_OFFSET(vq, reg_num) -
>                                 SVE_SIG_REGS_OFFSET;
> @@ -515,6 +539,9 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (!kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM;
>
> +       if (!vcpu_has_sve_regs(vcpu))
> +               return -EBUSY;
> +
>         if (copy_to_user(uptr, vcpu->arch.sve_state + region.koffset,
>                          region.klen) ||
>             clear_user(uptr + region.klen, region.upad))
> @@ -541,6 +568,9 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         if (!kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM;
>
> +       if (!vcpu_has_sve_regs(vcpu))
> +               return -EBUSY;
> +
>         if (copy_from_user(vcpu->arch.sve_state + region.koffset, uptr,
>                            region.klen))
>                 return -EFAULT;
>
> --
> 2.47.3
>

