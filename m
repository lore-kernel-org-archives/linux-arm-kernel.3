Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46AFC55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDlaVVbBLdDal3YcpgZLDSMExLMyfMpma/ezoyrjcJA=; b=pgOUaKsLU7AZ8j5tyFP99go6VD
	V3LD2YI1JvJyOND/ZpXa+1FL03emBR+ppL5m+ERvbMJCYu9AS8N0KAzg9KhR3svFC9SwPL7wRmolb
	wJqY0DgD1SSHXbCpzVUyJFJkGaXL9QBDInN4TLAg2JYM1wBi8U2dgzixW29B9f6+TqvPsl75WieZL
	YI+ftU0qdAEOPUvRg3KSB40bG/zMS69dacNl0fsoujOOpkY55I+DM4pVPO720Y1FzFiRsi3c5rWrE
	ngIAMzm0qybj6Bw2YHJAmCY0Zr2vwXp8uIdBJMChFiLoe/OToCw7nq4ceVeDnnBLGp2QlLFHFl6la
	/H9w+9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtM0D-0000000DQdA-34dv;
	Fri, 20 Feb 2026 08:36:45 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtM0B-0000000DQco-2UDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:36:44 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-505d3baf1a7so284901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 00:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771576601; cv=none;
        d=google.com; s=arc-20240605;
        b=j4IV6SAQIYsd+eRgYZyQZ2akWxcDtQjM2TK5TlZ4roAzZBZgi/864GNX2JTe3n/9w6
         zgsKbXoZmi92DeObZc2khmWVQxJRBRhh07yOOz1qItv35mCUkPp3qlYtfyTmfXRRTNNr
         uMruVFYi04b0xGwx83paR7LxVIsdcTlKGRV3/peaeyYWmQdnAfRt1BZpid+dlFgtmyPE
         ozKsUqS86PwZuD3YFnfSJDtgE+93c4RGDQdlwEI+dw1L8blvJmlXAURQAmBD2SPSah02
         lFFvE0BtKJDUdSvXZRnMc7j7ostjCf7LuBZ1wrGlxetZqKMADKcsHj98il2kkMzA8eD/
         tLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDlaVVbBLdDal3YcpgZLDSMExLMyfMpma/ezoyrjcJA=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=PfrUkEqD40azV14PxstI5aJf5aMwi3w/3i0yA/a2kaM58XoyULcD0nGlAV2ZDMe7Nc
         Arp4f0OEsJk0E7Cn6eX5PEPTGhYMvkZzqCnvz8M4xcJTZQTECtuwOY5t8A1AXyk6uKH4
         Wxik6xmj7Ul6VeUhe7sNEvqHNpN4afh+Ed+QiZO75t1o+Q42l1kwsRlp2BDADLN0dApn
         4bnUImHhde4FV30JWsmfBg3w8W6BFtCFepkbjue+eyCJ9f2FL+ijmNQowtRnCRbotRFU
         ov/YfSdDnWQlSycZejb5lKderWX7BZPOITU+iw3fdQ0C4xu9TXKKL9JWuyqyn7af74Iw
         jqOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771576601; x=1772181401; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDlaVVbBLdDal3YcpgZLDSMExLMyfMpma/ezoyrjcJA=;
        b=MGMvya2XLJOXy54rWEh/y0PuVr+5uimvPlGbePrkbGvOVdOvQ9ryUf3MstIZ3ombAm
         RSsI3s3fbEBBZ9KPwpuA+EUILOXDVf3FMpmB31CklHLVsufmUCVJVRXwDnyoM9+miMoH
         nNWDv8fCb2t32UwV6OKCuuIGe4sHTqfv/IJPIyKF3ULs/DHJ5cWUThKMBnSvh8csMUjS
         BfRL7qAYRiTAeIaKH7XCTeGhWqc3ZXNeNtnBxgW3hd9RMQVh0w70xxNbzOY+qNQGdGvO
         EtNrnIf1jo68Axu4Ynyh8rnnUNtTTanLOw5wZHa105NFIKd+LLV0g6fjAmUZl9CWloZa
         cS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576601; x=1772181401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDlaVVbBLdDal3YcpgZLDSMExLMyfMpma/ezoyrjcJA=;
        b=ngptJM1ooHnGwWLLYwbZDJc2rf8CSRhRHH3gfKCAh+rs02vm5uPWO5SzpryhbtAh+q
         fMvautSZ7KEblhiMXh1FvNCn6GNxjNhEw9A0Cb8vl6N0kxok+IGqK16trcJODx79iKZQ
         f5exG/bxgmof+SD9RjFDuNHmPNErtSwCHLep0ykHPLOTIG0Wq6OrIUJ5IADDkINZ6nwI
         LLIxOsIAUcg2bMzo43qq9RKJr3ZI+pYBS4a9vWbx2m8FJgUF2xsBo/eejs8iXcqtlwJR
         LFxOwnoZJQgG52rR/HXyGPNI7tWfVO+NScAMSxdlqQym0dUBvj3YxDZy4YTfW6Us91XR
         pnnQ==
X-Gm-Message-State: AOJu0Yyqn/g6syZwbIU6Ql2dtlyB6xGGCJ7r05BZZ6B/bBhhmVVc0qan
	J42sncaGvBfDUsKRsbysMBARKozzzHz/cmhElyGT7n35ZP8qoIQr2e4jGMyrXfLkliRN8+k1ouO
	WjfrdyeMIesRslAHomEbvWaMLtyLzcz1Kx+b45K3S
X-Gm-Gg: AZuq6aJqYs/n3EyAOQjc98LjsoHLx5OzymnXVYKZT+wbM0PgEjnj3JJQuzxtkW0G/jT
	RgxeLi5E1J1G7qurbyyDgPFiObdisxL3kJT/1ozztwrgCIDJjDXt7l+KRpH/6G+cbQ2PtaOPyQv
	cL/8UNZqRIYfWmsXgvTX1xzpiI/Zbbrb6eYvXuMGOM0W72lM6KRUlXArclwghqwITX+7LgPFilZ
	juZF+IYfLnYxwu8oWjauj4/mWG6GL1S7wsqSqnkFdbXedJ7bqLMNVx3BsYbB64ca4aPxX4Fjd4p
	qGDWeLkibmGFTcnCmeE=
X-Received: by 2002:a05:622a:14e:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-506fb4615e4mr8894251cf.8.1771576600947; Fri, 20 Feb 2026
 00:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20260219195533.2455736-1-maz@kernel.org> <20260219195533.2455736-2-maz@kernel.org>
In-Reply-To: <20260219195533.2455736-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 20 Feb 2026 08:36:04 +0000
X-Gm-Features: AaiRm52jbJ9IZ7bNbbd9RDlERU8GTrUEk3PolIVa0wSoSiHCgwMBCb3XXwqiTBk
Message-ID: <CA+EHjTzVRq3r-7UR-MJYvv-Aw4kHQDHEmwtqY9is-fRDm-J06A@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: Add logic to fully remove features from
 sanitised id registers
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_003643_653052_93ECCBBF 
X-CRM114-Status: GOOD (  31.04  )
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

Hi Marc,

On Thu, 19 Feb 2026 at 19:55, Marc Zyngier <maz@kernel.org> wrote:
>
> We currently make support for some features such as Pointer Auth,
> SVE or S1POE a compile time decision.
>
> However, while we hide that feature from userspace when such support
> is disabled, we still leave the value provided by the HW visible to
> the rest of the kernel, including KVM.
>
> This has the potential to result in ugly state leakage, as half of
> the kernel knows about the feature, and the other doesn't.
>
> Short of completely banning such compilation options and restore
> universal knowledge, introduce the possibility to fully remove such
> knowledge from the sanitised id registers.
>
> This has more or less the same effect as the idreg override that
> a user can pass on the command-line, only defined at build-time.
>
> For that purpose, we provide a new macro (FTR_CONFIG()) that defines
> the behaviour of a feature, both when enabled and disabled.
>
> At this stage, nothing is making use of this anti-feature.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/cpufeature.h | 15 ++++++++++-----
>  arch/arm64/kernel/cpufeature.c      | 21 ++++++++++++++++-----
>  2 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4de51f8d92cba..2731ea13c2c86 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -53,15 +53,20 @@ enum ftr_type {
>  #define FTR_SIGNED     true    /* Value should be treated as signed */
>  #define FTR_UNSIGNED   false   /* Value should be treated as unsigned */
>
> -#define FTR_VISIBLE    true    /* Feature visible to the user space */
> -#define FTR_HIDDEN     false   /* Feature is hidden from the user */
> +enum ftr_visibility {
> +       FTR_HIDDEN,             /* Feature hidden from the user */
> +       FTR_ALL_HIDDEN,         /* Feature hidden from kernel, user and KVM */
> +       FTR_VISIBLE,            /* Feature visible to all observers */
> +};
> +
> +#define FTR_CONFIG(c, e, d)                            \
> +       (IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
>
> -#define FTR_VISIBLE_IF_IS_ENABLED(config)              \
> -       (IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
> +#define FTR_VISIBLE_IF_IS_ENABLED(c)   FTR_CONFIG(c, VISIBLE, HIDDEN)
>
>  struct arm64_ftr_bits {
>         bool            sign;   /* Value is signed ? */
> -       bool            visible;
> +       enum ftr_visibility visibility;
>         bool            strict; /* CPU Sanity check: strict matching required ? */
>         enum ftr_type   type;
>         u8              shift;

This introduces bloat. Should you group the bools together and the
enums together?

> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c840a93b9ef95..b34a39967d111 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -192,7 +192,7 @@ void dump_cpu_features(void)
>  #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>         {                                               \
>                 .sign = SIGNED,                         \
> -               .visible = VISIBLE,                     \
> +               .visibility = VISIBLE,                  \
>                 .strict = STRICT,                       \
>                 .type = TYPE,                           \
>                 .shift = SHIFT,                         \
> @@ -1057,17 +1057,28 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>                                 ftrp->shift);
>                 }
>
> -               val = arm64_ftr_set_value(ftrp, val, ftr_new);
> -
>                 valid_mask |= ftr_mask;
>                 if (!ftrp->strict)

Should FTR_ALL_HIDDEN also be removed from strict_mask? i.e.

-                 if (!ftrp->strict)
+                 if (!ftrp->strict || || ftrp->visibility == FTR_ALL_HIDDEN)

(or under the ALL_HIDDEN case below).


>                         strict_mask &= ~ftr_mask;
> -               if (ftrp->visible)
> +
> +               switch (ftrp->visibility) {
> +               case FTR_VISIBLE:
> +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
>                         user_mask |= ftr_mask;
> -               else
> +                       break;
> +               case FTR_ALL_HIDDEN:
> +                       val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
> +                       reg->user_val = arm64_ftr_set_value(ftrp,
> +                                                           reg->user_val,
> +                                                           ftrp->safe_val);

Should we also take the safe value in update_cpu_ftr_reg() for FTR_ALL_HIDDEN?

Cheers,
/fuad

> +                       break;
> +               case FTR_HIDDEN:
> +                       val = arm64_ftr_set_value(ftrp, val, ftr_new);
>                         reg->user_val = arm64_ftr_set_value(ftrp,
>                                                             reg->user_val,
>                                                             ftrp->safe_val);
> +                       break;
> +               }
>         }
>
>         val &= valid_mask;
> --
> 2.47.3
>

