Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C8DD2FECE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXQLAHVKOq8T4zWobG4KuuypQi16GgCGUfWQ2Xeqgb4=; b=qt9Tfn2B89/viSdIjaX2EBIzT0
	sF3lC284bAP6OzuXv00huymIX73aBxPU/PvtbLzdpSbMtdPBdZ6qDUiBSl1ANpgpQ4CtSu1g9/dS2
	gKcD7BwmpJBpxOA4yLy3jKYC42KO+14WJbM4XFhMOr9liiapzGe/8/JZlXyTyVunUcB+0beWNwnt1
	SjEk6iE7WyauUBE/j/ErocSBFRbd5AtFY0Uu5zQ27ngyYFJDK+PtH78XAc0onYpwJuamcJdHH42Ew
	c8A9NBCZEhJOGPU3IKdDM/Z80OTef3bO5LRtjkA7QkSlg6/wNuWNiWtaY+f/kmtXJBSDQHYLxwaQL
	FZ5Tp5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLU-0000000ElSP-2Yhq;
	Tue, 27 Jan 2026 17:59:20 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknLS-0000000ElRB-09ET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:59:19 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5014b5d8551so17261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536756; cv=none;
        d=google.com; s=arc-20240605;
        b=ChKeDdK+mlWBK3XIhXKHDpR3sFRANdM8K2ZHWjoguHd2Mgt1Z4bAX2/WlVr2ULCsMu
         ItbeP0BVgiNIPyRATMeH1FAp///GX8bV8fxkfm10kPvNMjY7ZZ0LC+LNVV2TFQ/7r69t
         F8SWLel3KQpW2rmgo8fiuZm6AqsfRH8X0R4tVfd5zhy9KcoPQwKO7aLTvDYEo693cclM
         unP6ISe76UWJFyD3oz72Pveqc5bZBwPIengTV0Xxvl4urd/ALRn1+BOXhMzy1Kg93Uq+
         +jitiRHYC1BKDmsgQ+viUQ4RyG6PsJp5YxRabq6N4p3qNBQGthOA465YAFu3AbZMkIfE
         Xkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WXQLAHVKOq8T4zWobG4KuuypQi16GgCGUfWQ2Xeqgb4=;
        fh=CKLgEx5JdKrGxIoiJuVq9WDBUfTbkraxCvp66orwNOU=;
        b=latJwMRB02ryhHzRHVQCDnZ2F5ciGEDDgWiQ5Jjz7LNBDTZVoqfEs2Wi9tIFt3qkjz
         JOlnTBvt/nAwmWfO6Hy7wc0iBddEc+wmS8KwQaCjjZIjsakAFsOAD1bpM2b7SvQMfz3y
         39ooPCvETT1bhHePPc/6Wgs1o6h97Q9ESEenxYT+WAzBRLKyxcR6gYuII/fOypPmDf6b
         dK7t+vRYXiP/Uoz4VrPkqvVicoUPzqI2AZRmRA+59XYkkONZd6ybOvwFdwjjzs9kic+I
         ZYac+mg1sOfERkChwvC8JeU3B4pWa0Vw3f+UVWYlwJWaV+RcJ15tx1Lf5n2QmrkTEGCG
         GMcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769536756; x=1770141556; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXQLAHVKOq8T4zWobG4KuuypQi16GgCGUfWQ2Xeqgb4=;
        b=CVNyMyQ6CEmTUOfBsBe/vcy8cO4t6pNCNvGivlhATp41aMZm6ZNyyl3owuqG+qlDjX
         EGKOAOCPEL39j9Ah7hNFwVtZEcF77MQ0tuvaPo4vHmtmxsV61PhGfZSJ/uEwb5LSb/uo
         Ol3R5illzU82xOh3osWpCWJFs9zrlp0bXIPgCqwxU68Amk/Xue9CS8qAIpSo4H+oHuCc
         SN9Mcz2oV9+YuL3c5pmsu5JTpTufdu+1+5IHPSb1AQZbNPhCbHpyKUlnjl0XlHrM6Ms1
         traQxI4KT78SEJFRfIYGYI25teBuFgsmUzZi2XP/xT2xRYJEaooKrJq5dD0zRne22mzz
         4NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769536756; x=1770141556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXQLAHVKOq8T4zWobG4KuuypQi16GgCGUfWQ2Xeqgb4=;
        b=pUIYErv+ZmmHzKjXgJC+FphL6bySUUPUbvDrPTFv/aXJooJ01ipCW80rN9ar88cWnp
         pUPxZf5gGwwgsXb/AgXxikEHKDUC3ksGhf9D5SD59Mio3NAkWM9a3nojuqqwRzGhMbTk
         9+HBAFdOFvdDy4R2TdU1WJzfyVg+vSlpFyzUvknYIyKh2yIzMYiTQr2kDkxLb4hAQG8F
         uAnLHsDgEDEjRO9IGIejoc4wpGqcPpF14jipuakgLGX2EBHjFLPRVjoY3cSr0Kn6ahkX
         C9n78SldrKCHiKO6vHakXKFtbWdNMs9UclCbsArrwxI0bnJr4W3erjcYwrEC0GI4VKcs
         lsKA==
X-Forwarded-Encrypted: i=1; AJvYcCXIU3JFt6q6dyreoRP4baf6FBHbcUJN9oT0d0bpuuvyMB8zHsUlevhSMH3iUEPxuz+NGqq+EeQlfXU4fs1N8D7c@lists.infradead.org
X-Gm-Message-State: AOJu0YyzSDIUNz5Dwqcwh0730Z65QRf48zny+NcPDdXKPz0yx/MpTEDM
	wDTTh5jmGUuA0JgsDa9nIXExnex9FCOWqYgifxwEcZJ8QexIWuYZirg+rIzD8xSvo27zUKKmI54
	Wn4Ku8pXyu/T0PHvlwx4kbm3+TxMYXauuIZANPKvO
X-Gm-Gg: AZuq6aK1xye0nFFgdbm21rzNbIAsYyNa748nXO2aKkhjZ8i8DqNq2cPQQH0z79rxQ19
	EYYdMTloarf92eSxNn9NEqN+/A9ENwWyD7hfBcOJWcHW6Q0fPMFSLKCAth4Jl1kt1kFvuh15WQN
	Ch99i6eo1AMtm0HpI2T0KPP+MSs2R1TTRIx5I8bVtD85OEI9IodeHbZz65En7F4KoN1w2qKGh2D
	4pqI+vnUvzkrWuxUSDKcbrnc36NKO4w+UK3Z1S4syugp0xGHBKZsb5zw554NUoHFRLHPl4m
X-Received: by 2002:ac8:7d89:0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-5032f479773mr10069921cf.8.1769536755734; Tue, 27 Jan 2026
 09:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-7-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-7-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 17:58:38 +0000
X-Gm-Features: AZwV_QhS3T7BGI_KLXpUw2zt_uf_weVG0r6EiuX_Phs-QUEKVVf5BCeOHp72BZA
Message-ID: <CA+EHjTzU=rNQd7YU9O+ombTsZgTHgFThe6BGP20ii2xC2V473Q@mail.gmail.com>
Subject: Re: [PATCH 06/20] KVM: arm64: Inherit RESx bits from FGT register descriptors
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_095918_086735_C33E16FD 
X-CRM114-Status: GOOD (  17.15  )
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
> The FGT registers have their computed RESx bits stashed in specific
> descriptors, which we can easily use when computing the masks used
> for the guest.
>
> This removes a bit of boilerplate code.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/config.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index a907195bd44b6..8d152605999ba 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1344,6 +1344,11 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
>         resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>                                  require, exclude);
>
> +       if (r->feat_map.flags & MASKS_POINTER) {
> +               resx.res0 |= r->feat_map.masks->res0;
> +               resx.res1 |= r->feat_map.masks->res1;
> +       }
> +
>         tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
>
>         resx.res0 |= tmp.res0;
> @@ -1424,47 +1429,36 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>         switch (reg) {
>         case HFGRTR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
> -               resx.res1 |= HFGRTR_EL2_RES1;
>                 break;
>         case HFGWTR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
> -               resx.res1 |= HFGWTR_EL2_RES1;
>                 break;
>         case HFGITR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
> -               resx.res1 |= HFGITR_EL2_RES1;
>                 break;
>         case HDFGRTR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
> -               resx.res1 |= HDFGRTR_EL2_RES1;
>                 break;
>         case HDFGWTR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
> -               resx.res1 |= HDFGWTR_EL2_RES1;
>                 break;
>         case HAFGRTR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
> -               resx.res1 |= HAFGRTR_EL2_RES1;
>                 break;
>         case HFGRTR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
> -               resx.res1 |= HFGRTR2_EL2_RES1;
>                 break;
>         case HFGWTR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
> -               resx.res1 |= HFGWTR2_EL2_RES1;
>                 break;
>         case HFGITR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
> -               resx.res1 |= HFGITR2_EL2_RES1;
>                 break;
>         case HDFGRTR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
> -               resx.res1 |= HDFGRTR2_EL2_RES1;
>                 break;
>         case HDFGWTR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
> -               resx.res1 |= HDFGWTR2_EL2_RES1;
>                 break;
>         case HCRX_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
> --
> 2.47.3
>

