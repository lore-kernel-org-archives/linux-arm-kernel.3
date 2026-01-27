Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C594ED2FED7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmqFys/juW1EZAgdfKq6MTjLgOXwmpAGq13j/IO6Ug8=; b=N7NI41eTwXmPvdF/bcRrpTqkhp
	4Sy43s1cuUCPvInIRWiNe6ORATxMF7Qn7ypNa8gf6FbBUehgWkuy01LmvCnHuXUHqIPXlJ6xu7T7Z
	VI5tq1RvriU9q/Vh2Xn1l4A89lnLTECbm2D1TcwNjG1MwwKiF12U/R7umFARB3nKMEa3D61fVmZuK
	6tdnJ+nZVAVw/11XpRfRFXTCCXA9a438H7lvS/s4k/yaSLn+5XMSp43ZCP3yY0/fEq+1O30B9+sBB
	5YqOLtVIyzyPjO0p1WDA931GBkuxdSw3ViLcxVwjRuYirRC1mx3y/hMiOyg6DtYbW9r1tPRTl16y7
	1qwuSPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknoR-0000000Eoi4-2IWF;
	Tue, 27 Jan 2026 18:29:15 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknoN-0000000Eoh2-1ZTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:29:13 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5014acad6f2so29891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769538550; cv=none;
        d=google.com; s=arc-20240605;
        b=DMZz5Jr+oxissQ+pA5Rx7PAK01dnsWPtq6svR+1GNiQZ844mOt9lubdIj4P0UV1vk2
         TWgf/pRTyVznpL+JwLJm6TIKO2R8JF4x+dv+D8VA2IPejh5cZd4sPa1chBQgG0rYoR1g
         EME5IbRvu0CLZWyKvKvFM/E2ji7JIKJgMOxU5GydqkSWZ3HDVRpDGlmWViRXxj5bqdql
         9OMGOvC6nduNxtwqculzkejoQheRmR6nNn7NGFHoJtLXLrM1FFF/YLW/VheEF7c3PloB
         Srhvu0k8ikUEDV5HJJ5XYjHvqFhU1W1X6XtpVSeBs5ax8tg8EzOkfxLR4Rln9dxyEbhY
         yetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmqFys/juW1EZAgdfKq6MTjLgOXwmpAGq13j/IO6Ug8=;
        fh=R14Vk/z0oR8dIbihWvOe9OQpG5XU3rs4et/+46A8E9k=;
        b=F/ifPQKFfEM9IijupI7hi3lXaxmf0Nww4h8/ShRjwM+BjN3x3UVo0uTiLQsxn7ySC/
         PVToZbd66lb6zkokXp84SKhsrA1dDKF8fV/WsMCyFXadiQ92boV34WZhkx5z68v1k4Ac
         Oay3Wy9+e/mivEhRfVbo7GYYRQ7RS0OXeJaCY4SJBmeoKTYXomjnVNF/Ckl4yYnXt88T
         aFc3WxNSyMox6duKEdI7piDXXAcLFwY0611DVzsHnF8v5K0mm753PA7ityCHvHExbzC+
         6vhkCMKPcFD+fqaWGPic5OV3Fa00Xp6GzPms+vfaVhweO6W24swqD3GemACx8rGjyH2m
         ysDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769538550; x=1770143350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmqFys/juW1EZAgdfKq6MTjLgOXwmpAGq13j/IO6Ug8=;
        b=eP6leamPYf87XU54tY11l9aZuP/QqjO5l6AmjX2EhixI81xs3xji7/zcYmPFJ2IBNZ
         Dn9Ylm6z+mY2Dzcw7ZBWu70QmMr9WHjDE7C+8fB7lFpoRBJb62oY18AEyoVqGrFGz46+
         Un2atVyyFQD5R0gchOZLYjv66hhbkzeVG/KKjoF5LEWL4y/Ap6rjjCNNHvkB6XPjEhn0
         Tbo5Q5U1hDlrWpv7vvVq5SW3F/z/HJYAakSFmQ9wYzCDaeOuiKPHbuQue6vXb9ANZmIw
         2wr9yWTVMeUTUW1KpR/3kA0K+Jn0CTOhOz+d5bMSv/2QHJ6mmjzKq9Es0hKTTS4EZzuh
         NPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538550; x=1770143350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmqFys/juW1EZAgdfKq6MTjLgOXwmpAGq13j/IO6Ug8=;
        b=SedIm7U9rMTTqn6CJlurS0GDEQpbI+U6MN+b1FFvvCbf5gPlDsK5xV9R2++6Jnmki9
         nPcgweoRpZn7iFRbxs+tPo2J89VYrrHl8FIcs/BIMNbpHL6+ss566Js9dUlKSdEpNcRz
         rSN5UshGE0kdYe1ZPyUOT2CquWiR0ntTImSEGKQwXWouGKWV6Upap8MAwXVBT18266/l
         v2/CJNdax/gd8t9JyvgaW1lbmuyY/NQgrlNQYdMts2F303aYjvsDxQHD8dDg7Q13Kb1w
         jWwxyCNQXcQsfLNbVyD+4z+hy4LNCfew9NNy1HMsMIgPqOR4zb7aKEleOD9TafiUfu7z
         3Shw==
X-Forwarded-Encrypted: i=1; AJvYcCUvOIOYljmXreqTOTsJSqU3BeinfcPoPZQzv09kwYWSOc7eS7Fe5AUtPTRYrz9X4TeY6xsQfJwJfXKnnNwvGz2z@lists.infradead.org
X-Gm-Message-State: AOJu0Yylp3ux+4ru6ZA8Lhhuorm54q5c11/gADQMkjPfvU2cGYyAE8YK
	/mR3zvJ46jcTM0+KvEb3SWsKLKccfW4eLDq8qraNtsmPeQ5uerbLn06cuJIAujlm2mKM+DI9lSi
	h1MlLCVze2GrTCQ+srcI0mv7E9EKZb0AwtbJ+jF90
X-Gm-Gg: AZuq6aLOcA4DNxIvfK+lUFK0KU0rCxCuJ3znv/Ro9f4vgBL9l6j7uI5LNNIVFdN8msu
	UJuay5VBb49hjzPmzo+/Rq1fBcmjBNjU1vWSi0HQWpfSWRx+An+3E/a9TN+oUjfyZ4828AwhyiH
	k/jJhexyoUFUktJ8SISpjL5f6Zgezwd0V3kbV7UaYAUpgSnU4Rw85IWFpILx5gbXsaTxz9VVP9f
	594hr6svlQebS3I3/1Thzcpl34Klnh1MeZ5Ln/NX2s2vUFlecKGTJ6E2m3iivfY4KmFNMyCfACL
	4CHBifQ=
X-Received: by 2002:a05:622a:34e:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-5032f4e0be6mr10385161cf.15.1769538549723; Tue, 27 Jan 2026
 10:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-12-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-12-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 18:28:33 +0000
X-Gm-Features: AZwV_QgXZBRUac8lgCEGhS0B6XOh32RhatNEEL4-duPDQxvYx3j74fO0pxo2Iak
Message-ID: <CA+EHjTyWmb9dEaHqi0Uef3y6vvpGSE0r64AENX98HdkpsSL7Rw@mail.gmail.com>
Subject: Re: [PATCH 11/20] KVM: arm64: Add REQUIRES_E2H1 constraint as
 configuration flags
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102912_831419_9A1AE573 
X-CRM114-Status: GOOD (  23.02  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> A bunch of EL2 configuration are very similar to their EL1 counterpart,
> with the added constraint that HCR_EL2.E2H being 1.
>
> For us, this means HCR_EL2.E2H being RES1, which is something we can
> statically evaluate.
>
> Add a REQUIRES_E2H1 constraint, which allows us to express conditions
> in a much simpler way (without extra code). Existing occurrences are
> converted, before we add a lot more.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 38 ++++++++++++++------------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 4fac04d3132c0..1990cebc77c66 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -25,6 +25,7 @@ struct reg_bits_to_feat_map {
>  #define        FIXED_VALUE     BIT(2)  /* RAZ/WI or RAO/WI in KVM */
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
> +#define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
>
>         unsigned long   flags;
>
> @@ -311,21 +312,6 @@ static bool feat_trbe_mpam(struct kvm *kvm)
>                 (read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_MPAM));
>  }
>
> -static bool feat_asid2_e2h1(struct kvm *kvm)
> -{
> -       return kvm_has_feat(kvm, FEAT_ASID2) && !kvm_has_feat(kvm, FEAT_E2H0);
> -}
> -
> -static bool feat_d128_e2h1(struct kvm *kvm)
> -{
> -       return kvm_has_feat(kvm, FEAT_D128) && !kvm_has_feat(kvm, FEAT_E2H0);
> -}
> -
> -static bool feat_mec_e2h1(struct kvm *kvm)
> -{
> -       return kvm_has_feat(kvm, FEAT_MEC) && !kvm_has_feat(kvm, FEAT_E2H0);
> -}
> -
>  static bool feat_ebep_pmuv3_ss(struct kvm *kvm)
>  {
>         return kvm_has_feat(kvm, FEAT_EBEP) || kvm_has_feat(kvm, FEAT_PMUv3_SS);
> @@ -1045,15 +1031,15 @@ static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
>                               sctlr2_feat_map, FEAT_SCTLR2);
>
>  static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
> -       NEEDS_FEAT(TCR2_EL2_FNG1        |
> -                  TCR2_EL2_FNG0        |
> -                  TCR2_EL2_A2,
> -                  feat_asid2_e2h1),
> -       NEEDS_FEAT(TCR2_EL2_DisCH1      |
> -                  TCR2_EL2_DisCH0      |
> -                  TCR2_EL2_D128,
> -                  feat_d128_e2h1),
> -       NEEDS_FEAT(TCR2_EL2_AMEC1, feat_mec_e2h1),
> +       NEEDS_FEAT_FLAG(TCR2_EL2_FNG1   |
> +                       TCR2_EL2_FNG0   |
> +                       TCR2_EL2_A2,
> +                       REQUIRES_E2H1, FEAT_ASID2),
> +       NEEDS_FEAT_FLAG(TCR2_EL2_DisCH1 |
> +                       TCR2_EL2_DisCH0 |
> +                       TCR2_EL2_D128,
> +                       REQUIRES_E2H1, FEAT_D128),
> +       NEEDS_FEAT_FLAG(TCR2_EL2_AMEC1, REQUIRES_E2H1, FEAT_MEC),
>         NEEDS_FEAT(TCR2_EL2_AMEC0, FEAT_MEC),
>         NEEDS_FEAT(TCR2_EL2_HAFT, FEAT_HAFT),
>         NEEDS_FEAT(TCR2_EL2_PTTWI       |
> @@ -1285,6 +1271,7 @@ struct resx compute_resx_bits(struct kvm *kvm,
>                               unsigned long require,
>                               unsigned long exclude)
>  {
> +       bool e2h0 = kvm_has_feat(kvm, FEAT_E2H0);
>         struct resx resx = {};
>
>         for (int i = 0; i < map_size; i++) {
> @@ -1307,6 +1294,9 @@ struct resx compute_resx_bits(struct kvm *kvm,
>                         match = idreg_feat_match(kvm, &map[i]);
>                 }
>
> +               if (map[i].flags & REQUIRES_E2H1)
> +                       match &= !e2h0;
> +

nit: white space in the newline

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




>                 if (!match) {
>                         if (map[i].flags & AS_RES1)
>                                 resx.res1 |= reg_feat_map_bits(&map[i]);
> --
> 2.47.3
>

