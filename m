Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DD7D3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGnprIM0uOwwzce7Mf6HJCnNaV9WLSnSkIbwPkk6n4U=; b=anWdAJYcN+k5Ifswk8Hn9btEaN
	1Q52ni/hkR+YDxtq115WJgVRsfdtYLe/i7zlz68RN/Ru2YG9mM3l1W63nc+ZFkgVqaal6sOtDIhzS
	tKE+i5dtmZqIMWzOtSF32RYl0MZWv8i/ywU5gHXRg+XPD2NHcm2edg6Zvk3/eUyzXJN7uAsqpBQz5
	OrKB64qWob/DqinkfSet+qmUZF/tb/4C3TGC/J0XjrygKrkeJ7anfyjv7KLk6tYZoim/A9toPKhMC
	fvpxSWunNQ1HH3zT2dc/VtCl5NF+/eni0HWHl8+G5W2QARoRy0/lrvymPJWXl3ez6FhS0nahm8MHN
	6MW+L8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVIK-00000000NPz-3AI7;
	Thu, 29 Jan 2026 16:55:00 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVIH-00000000NPK-44e8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:54:59 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5033b0b6eabso646511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769705697; cv=none;
        d=google.com; s=arc-20240605;
        b=hs4tKQolJxiuM/hlM5ac9xWsD+9ZgtsgfbwTgfxYNXrPdwvEAqfeh0iaRTvk84oUYi
         1n94Nz7CTVhuIWgmusxq3QZ4CUii6KZWNyC4ZqPbArfffOooMPBBBikQn+wA3buInuOY
         t4pI1eszHSYncyL6pAhkJ8L2ZAWLWcM+WaXehGIvRH+rtSaBhKVPf8USRJcQIR0EAOd7
         DgFNMek2wFo84P52/yo0atn9eniYMcXVDpB9xvf6V+8nd68BtHKgqffK+bOEvFhEJ+0U
         pWC+TzJOOCcsx6v/IODTLKt6sXdSUbmbslCI6unSpp5HnO5+Gmg7P6MmxIprO/SNPTPr
         SYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lGnprIM0uOwwzce7Mf6HJCnNaV9WLSnSkIbwPkk6n4U=;
        fh=erZVUh7STDW7xQ8NIfSz1NzlnIxqM6bVQny9VLdDgKY=;
        b=baFilgUzZ7BrVpZ+FtKbMPUnUV6QlqJsLjLuXcJYiXu2YHKDcSOx6cPFW6ipQv8jQ+
         iC7WQRH9leVqDTBvei8kUABZSd0P1buzHIPYHZZPtUzgL3cW/8g14gnr+W2KPlG56rjk
         gqa8hdrUmTYoLwArEx3LEZYK4mBqCSE0XtZhECmSneGaPIMahTkswL9ydDvFGtIS4DPU
         zHKeEdWrEOTMH184jjQ6Yoj4mGcs82YMMXJqKOiA/95ZmkhdpyT2lPaQsmVF5S5YbGRs
         9H0XEt6SZXNQKIwbGje2j0hdDY2pUY+UoB/cg8+8gKTEzW2AUu/Lw4LnboxXKZCe85PX
         g2tA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769705697; x=1770310497; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGnprIM0uOwwzce7Mf6HJCnNaV9WLSnSkIbwPkk6n4U=;
        b=vfGtGxlBuXAhQ0b8cPWCbt4Gq7nDUAoAJptCI7iTPy5882+5P4Q4Ju6RmM1vA836gD
         X4BRYA+PrMuq7ZO6e6AmW3Nro+E00XzqrVlpuQt565mP0nT2XEwwAfyXjvA1OShxOGZQ
         Rf2gB/QWXg27xevfnjnsnNVRciQ36ANAwdCl380boHM5oJO8jxtETB7S0EU1H4ZhKxlw
         +SQExYZj/qpI9kFegJNWM7hYQTE+T7sccmkDtErG+zpdKAksuzd+xuTBeIJU3/PErfbC
         n2nQX+c1ZIboeopy4JTdsYB6tOu1+rgd4pGc1/sELa+QW9Oq0V5+hyGK3tbS0LATdfc4
         49wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705697; x=1770310497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGnprIM0uOwwzce7Mf6HJCnNaV9WLSnSkIbwPkk6n4U=;
        b=Migs+wXOQxwtUhircr9mE6wsOe8r9EAPnA3H2Cfqj+VZuJQDRfu4qrMb99MlMgRnmp
         I8TO/ikC70tRa/Jq+VLjsYgKNqRZ1VMeqmMZ4YMBB7K8v4hzYuchbMwFQKFgYecSoEP7
         t4K9xDes096WeVNou4TdqfQlZWHKf8re+VGptzoGXR2MISnntwqk6+0PU+Grj+bYLit4
         Yx6qg9a8htYS68aOmgm3S+Rn1O8vGLPc50tw+CZ1wgNM9DG0jfrZlYsUe67HMa6qlVSx
         lqIjSQXebtfYwfDz2fS+7mexBiwPNFEnJ0bSrXFNWO0LTWu5cqyCYLudJxpBdxj2somT
         G92g==
X-Forwarded-Encrypted: i=1; AJvYcCXrSECS2qdfVMYxJA+mR5wehLmJw5WFRDPJfkYGODNmZvA7tEu2dOd1heWb1GZvRpd4pFDodFpMfQiMplnwIamt@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDHeAt67oQGdLy8TmuzZ+0XUpJwLYwkKwuZJ4nT6/Rfe9fcA4
	07xxhyk2jMOpo8dJlK7/ndnG5bgFAp9FDlGP1G+UJCIJxxkJwfl6uint59qnMqWDKV0mEJdfSN9
	JxzNGsFsG5ftx0aK4hcXNZaQnuflqjN9f/Uzgdfrveq/5e1PmVWCirCruXP4=
X-Gm-Gg: AZuq6aI/wi9FJeUg9fSUdT42yh/5yHYp79ZTmxGwWdhod/+xeV5X9fuy1U8YuP4gpom
	9PvFOFJGn7OAU4dk8sBIucKXR+7MyH3zmVRFiYYXRxgu+CitXMaCPDk3cvBZkfVfV2jrOe8NhKK
	RODHE+uqxMehVBouy3NUSNvhJF7FicWJ0T6quw0Aaxg4fBNPM4BiqpwfXUOSS3+2pPCT69PkX9u
	m+U3Q10pwbKZigYD/Wdcz60nTzS525FBy/h1kfpuxDX/rsoIwPdrGld5Tt06EuJuBDG3Avq
X-Received: by 2002:ac8:7c45:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-504310ac4a2mr11072831cf.15.1769705696188; Thu, 29 Jan 2026
 08:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-16-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-16-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 16:54:19 +0000
X-Gm-Features: AZwV_QieftfkWMiOf6SsY4TTgpSg92NfpZxoIL88Ar5MLjnc5YDmaX24FaMexnE
Message-ID: <CA+EHjTx7MzcU2pnbmFsbUsiy2b2HY=MRhZ_sG5YxYiTbz6VUNg@mail.gmail.com>
Subject: Re: [PATCH 15/20] KVM: arm64: Get rid of FIXED_VALUE altogether
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_085458_025978_352CCFC2 
X-CRM114-Status: GOOD (  17.64  )
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
> We have now killed every occurrences of FIXED_VALUE, and we can therefore
> drop the whole infrastructure. Good riddance.

Indeed.

> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/arm64/kvm/config.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 187d047a9cf4a..28e534f2850ea 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -22,7 +22,7 @@ struct reg_bits_to_feat_map {
>
>  #define        NEVER_FGU       BIT(0)  /* Can trap, but never UNDEF */
>  #define        CALL_FUNC       BIT(1)  /* Needs to evaluate tons of crap */
> -#define        FIXED_VALUE     BIT(2)  /* RAZ/WI or RAO/WI in KVM */
> +#define        FORCE_RESx      BIT(2)  /* Unconditional RESx */
>  #define        MASKS_POINTER   BIT(3)  /* Pointer to fgt_masks struct instead of bits */
>  #define        AS_RES1         BIT(4)  /* RES1 when not supported */
>  #define        REQUIRES_E2H1   BIT(5)  /* Add HCR_EL2.E2H RES1 as a pre-condition */
> @@ -30,7 +30,6 @@ struct reg_bits_to_feat_map {
>  #define        RES0_WHEN_E2H1  BIT(7)  /* RES0 when E2H=1 and not supported */
>  #define        RES1_WHEN_E2H0  BIT(8)  /* RES1 when E2H=0 and not supported */
>  #define        RES1_WHEN_E2H1  BIT(9)  /* RES1 when E2H=1 and not supported */
> -#define        FORCE_RESx      BIT(10) /* Unconditional RESx */
>
>         unsigned long   flags;
>
> @@ -43,7 +42,6 @@ struct reg_bits_to_feat_map {
>                         s8      lo_lim;
>                 };
>                 bool    (*match)(struct kvm *);
> -               bool    (*fval)(struct kvm *, struct resx *);
>         };
>  };
>
> @@ -76,13 +74,6 @@ struct reg_feat_map_desc {
>                 .lo_lim = id ##_## fld ##_## lim        \
>         }
>
> -#define __NEEDS_FEAT_2(m, f, w, fun, dummy)            \
> -       {                                               \
> -               .w      = (m),                          \
> -               .flags = (f) | CALL_FUNC,               \
> -               .fval = (fun),                          \
> -       }
> -
>  #define __NEEDS_FEAT_1(m, f, w, fun)                   \
>         {                                               \
>                 .w      = (m),                          \
> @@ -96,9 +87,6 @@ struct reg_feat_map_desc {
>  #define NEEDS_FEAT_FLAG(m, f, ...)                     \
>         __NEEDS_FEAT_FLAG(m, f, bits, __VA_ARGS__)
>
> -#define NEEDS_FEAT_FIXED(m, ...)                       \
> -       __NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
> -
>  #define NEEDS_FEAT_MASKS(p, ...)                               \
>         __NEEDS_FEAT_FLAG(p, MASKS_POINTER, masks, __VA_ARGS__)
>
> @@ -1306,16 +1294,10 @@ struct resx compute_resx_bits(struct kvm *kvm,
>                 if (map[i].flags & exclude)
>                         continue;
>
> -               switch (map[i].flags & (CALL_FUNC | FIXED_VALUE)) {
> -               case CALL_FUNC | FIXED_VALUE:
> -                       map[i].fval(kvm, &resx);
> -                       continue;
> -               case CALL_FUNC:
> +               if (map[i].flags & CALL_FUNC)
>                         match = map[i].match(kvm);
> -                       break;
> -               default:
> +               else
>                         match = idreg_feat_match(kvm, &map[i]);
> -               }
>
>                 if (map[i].flags & REQUIRES_E2H1)
>                         match &= !e2h0;
> --
> 2.47.3
>

