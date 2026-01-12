Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2845CF45BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=; b=KXBKxKl+xSz0lKSolZO8iy+qOS
	mj60ricuoAaAnHZPrCWvbnvj3/0IrFqe1//pgZT92A/lNN5SrLe7SNpp1P9ZfDVREyNslPuDXWTsq
	C7WNxwDdnBaCgxBOLAooGTbm839PKFgH/kc3YxoL/ya6T332C79r/Xr252gn1oy7GGKtA2BT1R88G
	3s7kkTLUQN0t7Gf7Rq3vH7P2olk2zNKrL+jlVHW/2h5YdalN+WZ+wn9wE+Es3mrJTLm0Hkf4rbJSo
	bYx2ZxV/wWRBG9dGloaBc6X4/07j8Vf9B+WQE1/Iz3WTQFyMvFVdFICpOmw0ZQzsoOV9REa/G6ADB
	+umubOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMCu-00000005ttl-0LeV;
	Mon, 12 Jan 2026 18:00:00 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMCr-00000005ttL-13WB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:59:58 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ffbaaafac4so8161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768240796; cv=none;
        d=google.com; s=arc-20240605;
        b=P4DnS8Yqp/jjHY159SBwkXVHftyzCF9XKS2W4r4avK5V6/tS6NSqfG57Y0y05iTwJ8
         GhJ9r1IXMMfL0B76xtDJAGloxnGvWpuNM3OUOtM/bK8rLzT/XIStvcczz+qQbJtFazMV
         4Ho5+rNV2AUySp5RCiZSN7ivPaD2bAhe13hu3KqIgGg28VLqIhlJyvw8LKTHKWIaJhjs
         FArgQg3EzaM2Co4KPvzjhpu2NTQe7VhRwxzgFc6WaUOSGD5m3kZSYgKLQibhV3pT5X68
         fspR5fUn+9q1asEGyrfIvfFcEUGj+RukA13PSghrg8X0isZQH+imME5v8mqiKH/SHuXa
         jeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        fh=Q18ZubhAom/xgcn1WVzWOSIDIwQD+vYH5ATQ+/35IhY=;
        b=OT0Dp0Vz+VF99rZ4q8C2QfLsL/l1BcUvXN1uGlxW3DBrTd3oOSAndDfKuPCP9Y20ZY
         XBJZg9MtynzolObDnXsLWQ91nRSyOeDPUJwkj+Z81GgFAI9J1wc2P6UU1eGAju6JfRF2
         JWNxGa6/tOi9N5xAkgvKU9dgjXBTKIs8Igon9Qw+S+ji8QJ2k+rKjRe7yogY594T0IZU
         lhdE+upCB1l4kC6jpvhGToNsjSwJZVlRpqJan4naYJdcyI8AMNTVdXEEOoW83SOAJ8nt
         aGAMylJOsWdKtCgqN+S0TSP4sOYSlceq3qbS0CwHNHaATohEdfkKmbzStPssMqK6H8Mt
         lrsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768240796; x=1768845596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        b=qk6O2nGL8c+HvNOvf04eK5K5AsdOKpikoZ6YwrTVX4cznnIIiMmGGov7aJ2xaFz5c0
         xo/YapBMy4S5VkXmvQO/bkos7/0HMWEp1Uw5PCnEb1XZAAvRv+vHdXxAvz7uS+o1f8dw
         9sx6H9OLcOrDeaTcua7Pvs8YjlUNxiUfR4zbJWThju5+7kkJQajxZ54yyeck9fOOq+RS
         3uVQdipgzgBkkT2GJPv9EeoSnGvry7XligelycCuNS9af/8ULsF01wwnJie63XNE2HxI
         d8Z6wcxo68i1sGaINehUyKeghtuVn7LID0lrdz5CrZFkHvOgQO3x9Pzam5AnQnHKO2JV
         m4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240796; x=1768845596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        b=Pg71UHyVm7Bvh4XvzzstNvR/tGwWq0kuXfzhxzS5aBpxtYh4V4LBUiXMHVo6U4rd4+
         srzNa7LzXigPJPBDgncBUqd3b8Cx4HimcQJW2aDVTfI37nMtgZR+fkstJPGPcPcK2SFT
         A1dwnJNGIG+ptxeYLk1Z8s1PU1G37kwdk3vxqGdGCHgkuUPSpLcshieBP6SE2hkNdOr7
         M27Z2zKAg+p0YfbbUFyTrCfufEn1wkXNniEsqgRSfnBlZiztH62rwwIHmkpscCYwhEn1
         kIb8u0qrRjs+BybIZ0DncO66rZKChxcf5VPljXTNs9IHhnQC5skA6MeS9MNaYpfPD/Ze
         YyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGtDeRQYlQVYt5el4cIWODeF6g9dAZAL7ZKR93W/B0DeqRzlZq6fKClYxXIY399JvM4Z1veR317VmjeOnVPUph@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6Z19Wl4NAPvO0Lv25Is5bHI6yJrF5wfbmWkPOnXmvaMX6FkB
	kmvulQP3P+5BhK/9FDmtZuRFK8ezbtS6iAF+S8kpF0amfxKv/Y2TRgw2TCvi3rrKC7t41uglq8y
	uYoxMNySkiPMecluCWpxBy2FucZ7XM88Y8lhxPGXL
X-Gm-Gg: AY/fxX7IufnWbt8530i4XL8pUipltS1kPmhUPQAtw8++0XJ2A3UkYhTBqfQ7PVhF+8h
	CX1l5lCJBAtTc6INqib8GY1xQo6VbjhbfQ8FGVtBL9xWU8f5mormyUcTqJng2M0HqQAgmjkg4AG
	6yDK6htMj1FWnA56c7ILzYKOOWU5eEWYdRi5Dx8Fdi6iyVKot00nFJUn84+d9V3AA9azjtQtgwA
	2hRNtOedmhl5Nn4u9poxI5fwqi3Hma/qI0hDqq0MAMWwrA4sqVBnyoYGcT5k0GJ2851OvX2
X-Received: by 2002:ac8:7dc5:0:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-50119766a66mr21632291cf.9.1768240795172; Mon, 12 Jan 2026
 09:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 17:59:17 +0000
X-Gm-Features: AZwV_QiQU0Otl0OZ50pDvqjq5GLQexN4JJXUaeH6JoNDjhaymp7I-l_cuFsktUI
Message-ID: <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register access
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
X-CRM114-CacheID: sfid-20260112_095957_328117_BFF3FD15 
X-CRM114-Status: GOOD (  23.45  )
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

Hi Mark,

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> Provide versions of the SME state save and restore functions for the
> hypervisor to allow it to restore ZA and ZT for guests.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_hyp.h |  3 +++
>  arch/arm64/kvm/hyp/fpsimd.S      | 26 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index 0317790dd3b7..1cef9991d238 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -116,6 +116,9 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
>  void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
>  void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
>  void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
> +int __sve_get_vl(void);
> +void __sme_save_state(void const *state, bool restore_zt);
> +void __sme_restore_state(void const *state, bool restore_zt);

Would it be a good idea to pass the VL to these functions. Currently,
they assume that the hardware's current VL matches the buffer's
intended layout. But if there is a mismatch between the guest's VL and
the current one, this could be difficult to debug. Passing the VL and
checking it against _sme_rdsvl would be an inexpensive way to avoid
these.

>
>  u64 __guest_enter(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index 6e16cbfc5df2..44a1b0a483da 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -29,3 +29,29 @@ SYM_FUNC_START(__sve_save_state)
>         sve_save 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_save_state)
> +
> +SYM_FUNC_START(__sve_get_vl)
> +       _sve_rdvl       0, 1
> +       ret
> +SYM_FUNC_END(__sve_get_vl)

Since this is just one instruction, would it be better to implement it
as an inline assembly in the header file rather than a full
SYM_FUNC_START, to reduce the overhead?

> +
> +SYM_FUNC_START(__sme_save_state)

I think that this needs an isb(). We need to ensure that SMCR updates
are visible here. Looking ahead to where you introduce
__hyp_sme_save_guest(), that doesn't have a barrier after updating
SMCR. The alternative is to call the barrier where it's needed, but
make sure that this is well documented.

> +       _sme_rdsvl      2, 1            // x2 = VL/8
> +       sme_save_za 0, x2, 12           // Leaves x0 pointing to the end of ZA
> +
> +       cbz     x1, 1f
> +       _str_zt 0
> +1:
> +       ret
> +SYM_FUNC_END(__sme_save_state)
> +
> +SYM_FUNC_START(__sme_restore_state)

Same as above.

Cheers,
/fuad







> +       _sme_rdsvl      2, 1            // x2 = VL/8
> +       sme_load_za     0, x2, 12       // Leaves x0 pointing to end of ZA
> +
> +       cbz     x1, 1f
> +       _ldr_zt 0
> +
> +1:
> +       ret
> +SYM_FUNC_END(__sme_restore_state)
>
> --
> 2.47.3
>

