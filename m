Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE2D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A20ynRevkaS25P7B8llafdHKibWpVBHY4kqra9wcNrY=; b=IQOkeJPnuvmOYVvqdqiFqNgPaY
	zr3iFWWqw7ulLt0OWLBZq7nl2C5XOEUzVyEduzRVhcMq1+PN3Km8TzKQl8rxhoUYQ3/wCvW82+GCG
	2YRwlUyJivHbbVMXBPDhvkF+uyVqFOzCpIHYZK1m+f3A3njA5SeM+zJq4LaB3L7AgKkZo2Sy3RrbZ
	MDQbJUyPYJpfCdW/rUjqA1pOU+DhGkggRUoZaI5jeMpIQPLVhmOCGUq5DMTvN/x9EVz6Ut+w86dEn
	Zwo/hS/vVGzmEbRcUOsw6iwgdaI32EHtsu4sEbcArRc3AXFoUzoOpIa4F7lSEAeQO3i6tTUA2E5BD
	jWK4uAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRjM-0000000D6gM-3KYx;
	Mon, 26 Jan 2026 18:54:32 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRjJ-0000000D6g2-38oi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:54:31 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5014acad6f2so36981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769453668; cv=none;
        d=google.com; s=arc-20240605;
        b=heQRf/Rh3Zc7Wzd8o8s3KtlMw1xUtPUL8wcupG1ScimxGRPoThOm1hOnh4DluHdil7
         3tk7+nZUROu5HAs9Ye0tk7u7A5UJkCIi2cZbbBWKRDC6OoaSGozZNVBvuv6bRVentIAA
         o4tMKbYvoM5IEtNFB+WKQQETUwkTJfotKIONvwdUT8uWkTVHNC+oMZSDz/lfoijAfzAw
         5pEKbekOz5YplpNTM64vhbB5FtfFXKL6AmG7lSJffpLaC+y9DJk6Ys/OvalagBgsjL21
         B19KIQrweqe6I9N4b06eZ4KJdVplzDxubI8PTMzbuVpOKZmUTFYUmeohQip4Tla5Z2gv
         E45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A20ynRevkaS25P7B8llafdHKibWpVBHY4kqra9wcNrY=;
        fh=DZcIMCAibxy0KggOe6/Yn6GB/eGauLrglfhldwBqMFg=;
        b=R9QRvZ1YBq5tgFmI9XeifKrP3DHkqCYiXb+cwenztkOpGAC8YrHVGStTMPJZjMP/qF
         9OE6BHsgOsNjfg67q3dQ8R8naAhvfpMxQ0zHLKwRFYDTC0yplHsCe7zJ/0qwF9hrWR4G
         P3XeUtchi69tx5mE0+lPw79XOPRtuszzFwcCtt1Lnke4DY17ebpPPAJEIp+HlFzRxCl4
         p3lIfShBFDNlW4Gak2q6aumzgZU1IW6NVbxhS7QKR/qSujRQ4RTsELzqwupDF2gMA+0p
         UySF3QayIEn6spgXJF0JzmEofE6Ojy6U17AQJ/LYtmNzjWVOtRnEUiW1Y5dXVQHbYHiI
         QKxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769453668; x=1770058468; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A20ynRevkaS25P7B8llafdHKibWpVBHY4kqra9wcNrY=;
        b=PMwcV39Xa/frM9gm6y2K/brVV4QC4CrMgc+5z4ja5/sdQeYBOUxhe/i6PEJNKkyhFZ
         g6linCUIpTtaIOwpX+TNiBYQ2CKVzi6ELtXkXv/J1ArwovgOKvd9xl7KPDTj5TS3gUV0
         C5qX4PYY/ajYgKF/h4V3rc5htmm1Uak7I4VlogExs6fqZ6cd8T6kjQ++oVUmKuatJnkV
         QOXeCXPagdl8sTBlHq1XWkr9v3jnLAQPOOMpQ2f0WvQDavnkVfnqGsOU/4i8LZfTPPy7
         9SSQEYx8WqMXfhmsv2X1o7xSxje6nSUhKOodsekWTIvBvqdJBTpfQT3XOYFNW0vFG8KL
         1j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769453668; x=1770058468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A20ynRevkaS25P7B8llafdHKibWpVBHY4kqra9wcNrY=;
        b=pxbCnzNzm0lKk+t1WKSn2njzU09yUwtMsQdBdYgxm6V7TfC7O8RSmvlSd9b3s85R4D
         JHJ7b0pPPcbL2o5jf2KI0684yMFkndfAsoj22gTjOF2TbwwDkllhCwn4W1cS1KRuls3y
         wsujHc3B/88RT0ky4L92pXbWH+vVqlmV8GPaMOLcKAU+jjtEAPLUDZHJbXCvgS0SMO6p
         NQmFBSkbDif39m5u6yaJnesNyHEwuXg4FHSY3um+XGde/Qk8jeFxLBwcPLOfDqAcbvlG
         bnnYuZxGoLh6Ah0m7Y5ne+NJ7P/7M29IZB9NLJJU4aKI9wAdysEXKYmY4PE9zbu/TlSN
         nTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5H7yfWlgNKk9pgULbdvc+qEXJtf8HYokfKLwcW5Xw3aoF+Pzk1VdKKjhviDMuzNU85lDhKtGY2S5UZIoB12K1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/wsMq5XVkgDjrfuXzvtrPnTFvZlp2BW1Ryqc0xgYtdpg3R4A7
	zGoNrjfx/rHVxkImC+jjS7aaBmBJpRzTXR0zm0hTxFQj6jWw5ojhg089b12sTIp519kIcExmUNH
	6T5+DlXobzZMWiIIOinaA9f4xREinY6+hodR0bi3P
X-Gm-Gg: AZuq6aI6QchrtmdVDd4dDTUBShe5KBvj/jI4LU3qpGtePv+CViuCnDutNlhhlwxhgnv
	C+F7uCICvXPk1DgZpBIh+NiX1uihc5gfzve2c7nz40cxn9m1GlQ1vAsI0bCKkgMxTILFImI1NBV
	ARUfOrQ5IfA2tdO7W4k9hHonL+3JmuQhbI342YtjpOgjXhwHcGEkW9SNWTH4pKvnU8dKQfT7/oO
	r6aUTzfM45GqsjLJakkW7mDPL3MfvSRyysBn500gNYmZMCqjbf81RXIv4kf4mqNtljEZ3SWAD5X
	yjPH1Sg=
X-Received: by 2002:a05:622a:107:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-5031418f5d0mr13951761cf.0.1769453667744; Mon, 26 Jan 2026
 10:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-5-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Jan 2026 18:54:00 +0000
X-Gm-Features: AZwV_QjKBi-w0NfZ79ozOKdoVZLPRhYxhGBL0j4hIUh_Ifbq0y3wSazQgK06B-4
Message-ID: <CA+EHjTwuX6y4BY2D3T=59SHX-83RiRCsF=HsqqRKH8K1yUGrmg@mail.gmail.com>
Subject: Re: [PATCH 04/20] KVM: arm64: Introduce data structure tracking both
 RES0 and RES1 bits
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_105429_875710_CC1E9029 
X-CRM114-Status: GOOD (  29.14  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> We have so far mostly tracked RES0 bits, but only made a few attempts
> at being just as strict for RES1 bits (probably because they are both
> rarer and harder to handle).
>
> Start scratching the surface by introducing a data structure tracking
> RES0 and RES1 bits at the same time.
>
> Note that contrary to the usual idiom, this structure is mostly passed
> around by value -- the ABI handles it nicely, and the resulting code is
> much nicer.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h |  17 ++--
>  arch/arm64/kvm/config.c           | 122 +++++++++++++++-------------
>  arch/arm64/kvm/nested.c           | 129 +++++++++++++++---------------
>  3 files changed, 144 insertions(+), 124 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b552a1e03848c..a7e4cd8ebf56f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -626,13 +626,20 @@ enum vcpu_sysreg {
>         NR_SYS_REGS     /* Nothing after this line! */
>  };
>
> +struct resx {
> +       u64     res0;
> +       u64     res1;
> +};
> +
>  struct kvm_sysreg_masks {
> -       struct {
> -               u64     res0;
> -               u64     res1;
> -       } mask[NR_SYS_REGS - __SANITISED_REG_START__];
> +       struct resx mask[NR_SYS_REGS - __SANITISED_REG_START__];
>  };
>
> +#define kvm_set_sysreg_resx(k, sr, resx)               \
> +       do {                                            \
> +               (k)->arch.sysreg_masks->mask[sr - __SANITISED_REG_START__] = resx; \

Is sr better between parentheses (sr)? (checkpatch, but I think it's valid)

> +       } while(0)

checkpatch nit: space after while

> +
>  struct fgt_masks {
>         const char      *str;
>         u64             mask;
> @@ -1607,7 +1614,7 @@ static inline bool kvm_arch_has_irq_bypass(void)
>  }
>
>  void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
> -void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1);
> +struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg);
>  void check_feature_map(void);
>  void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 2122599f7cbbd..a907195bd44b6 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1290,14 +1290,15 @@ static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map
>         }
>  }
>

nit: all the functions below with multiline parameters are misaligned
wrt the parenthesis (checkpatch, but also visible in editor).

> -static u64 __compute_fixed_bits(struct kvm *kvm,
> +static

nit: why the newline? (and same for the remaining ones below)

Nits aside, this preserves the logic and the resulting code is already
easier to read and understand.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> +struct resx __compute_fixed_bits(struct kvm *kvm,
>                                 const struct reg_bits_to_feat_map *map,
>                                 int map_size,
>                                 u64 *fixed_bits,
>                                 unsigned long require,
>                                 unsigned long exclude)
>  {
> -       u64 val = 0;
> +       struct resx resx = {};
>
>         for (int i = 0; i < map_size; i++) {
>                 bool match;
> @@ -1316,13 +1317,14 @@ static u64 __compute_fixed_bits(struct kvm *kvm,
>                         match = idreg_feat_match(kvm, &map[i]);
>
>                 if (!match || (map[i].flags & FIXED_VALUE))
> -                       val |= reg_feat_map_bits(&map[i]);
> +                       resx.res0 |= reg_feat_map_bits(&map[i]);
>         }
>
> -       return val;
> +       return resx;
>  }
>
> -static u64 compute_res0_bits(struct kvm *kvm,
> +static
> +struct resx compute_resx_bits(struct kvm *kvm,
>                              const struct reg_bits_to_feat_map *map,
>                              int map_size,
>                              unsigned long require,
> @@ -1332,34 +1334,43 @@ static u64 compute_res0_bits(struct kvm *kvm,
>                                     require, exclude | FIXED_VALUE);
>  }
>
> -static u64 compute_reg_res0_bits(struct kvm *kvm,
> +static
> +struct resx compute_reg_resx_bits(struct kvm *kvm,
>                                  const struct reg_feat_map_desc *r,
>                                  unsigned long require, unsigned long exclude)
>  {
> -       u64 res0;
> +       struct resx resx, tmp;
>
> -       res0 = compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
> +       resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>                                  require, exclude);
>
> -       res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
> -       res0 |= ~reg_feat_map_bits(&r->feat_map);
> +       tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
> +
> +       resx.res0 |= tmp.res0;
> +       resx.res0 |= ~reg_feat_map_bits(&r->feat_map);
> +       resx.res1 |= tmp.res1;
>
> -       return res0;
> +       return resx;
>  }
>
>  static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
>  {
> +       struct resx resx;
> +
>         /*
>          * If computing FGUs, we collect the unsupported feature bits as
> -        * RES0 bits, but don't take the actual RES0 bits or register
> +        * RESx bits, but don't take the actual RESx bits or register
>          * existence into account -- we're not computing bits for the
>          * register itself.
>          */
> -       return compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
> +       resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>                                  0, NEVER_FGU);
> +
> +       return resx.res0 | resx.res1;
>  }
>
> -static u64 compute_reg_fixed_bits(struct kvm *kvm,
> +static
> +struct resx compute_reg_fixed_bits(struct kvm *kvm,
>                                   const struct reg_feat_map_desc *r,
>                                   u64 *fixed_bits, unsigned long require,
>                                   unsigned long exclude)
> @@ -1405,91 +1416,94 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
>         kvm->arch.fgu[fgt] = val;
>  }
>
> -void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1)
> +struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>  {
>         u64 fixed = 0, mask;
> +       struct resx resx;
>
>         switch (reg) {
>         case HFGRTR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgrtr_desc, 0, 0);
> -               *res1 = HFGRTR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
> +               resx.res1 |= HFGRTR_EL2_RES1;
>                 break;
>         case HFGWTR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgwtr_desc, 0, 0);
> -               *res1 = HFGWTR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
> +               resx.res1 |= HFGWTR_EL2_RES1;
>                 break;
>         case HFGITR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgitr_desc, 0, 0);
> -               *res1 = HFGITR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
> +               resx.res1 |= HFGITR_EL2_RES1;
>                 break;
>         case HDFGRTR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hdfgrtr_desc, 0, 0);
> -               *res1 = HDFGRTR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
> +               resx.res1 |= HDFGRTR_EL2_RES1;
>                 break;
>         case HDFGWTR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hdfgwtr_desc, 0, 0);
> -               *res1 = HDFGWTR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
> +               resx.res1 |= HDFGWTR_EL2_RES1;
>                 break;
>         case HAFGRTR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hafgrtr_desc, 0, 0);
> -               *res1 = HAFGRTR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
> +               resx.res1 |= HAFGRTR_EL2_RES1;
>                 break;
>         case HFGRTR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgrtr2_desc, 0, 0);
> -               *res1 = HFGRTR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
> +               resx.res1 |= HFGRTR2_EL2_RES1;
>                 break;
>         case HFGWTR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgwtr2_desc, 0, 0);
> -               *res1 = HFGWTR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
> +               resx.res1 |= HFGWTR2_EL2_RES1;
>                 break;
>         case HFGITR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hfgitr2_desc, 0, 0);
> -               *res1 = HFGITR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
> +               resx.res1 |= HFGITR2_EL2_RES1;
>                 break;
>         case HDFGRTR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hdfgrtr2_desc, 0, 0);
> -               *res1 = HDFGRTR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
> +               resx.res1 |= HDFGRTR2_EL2_RES1;
>                 break;
>         case HDFGWTR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hdfgwtr2_desc, 0, 0);
> -               *res1 = HDFGWTR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
> +               resx.res1 |= HDFGWTR2_EL2_RES1;
>                 break;
>         case HCRX_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &hcrx_desc, 0, 0);
> -               *res1 = __HCRX_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
> +               resx.res1 |= __HCRX_EL2_RES1;
>                 break;
>         case HCR_EL2:
> -               mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0);
> -               *res0 = compute_reg_res0_bits(kvm, &hcr_desc, 0, 0);
> -               *res0 |= (mask & ~fixed);
> -               *res1 = HCR_EL2_RES1 | (mask & fixed);
> +               mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0).res0;
> +               resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
> +               resx.res0 |= (mask & ~fixed);
> +               resx.res1 |= HCR_EL2_RES1 | (mask & fixed);
>                 break;
>         case SCTLR2_EL1:
>         case SCTLR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &sctlr2_desc, 0, 0);
> -               *res1 = SCTLR2_EL1_RES1;
> +               resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
> +               resx.res1 |= SCTLR2_EL1_RES1;
>                 break;
>         case TCR2_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &tcr2_el2_desc, 0, 0);
> -               *res1 = TCR2_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &tcr2_el2_desc, 0, 0);
> +               resx.res1 |= TCR2_EL2_RES1;
>                 break;
>         case SCTLR_EL1:
> -               *res0 = compute_reg_res0_bits(kvm, &sctlr_el1_desc, 0, 0);
> -               *res1 = SCTLR_EL1_RES1;
> +               resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
> +               resx.res1 |= SCTLR_EL1_RES1;
>                 break;
>         case MDCR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &mdcr_el2_desc, 0, 0);
> -               *res1 = MDCR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
> +               resx.res1 |= MDCR_EL2_RES1;
>                 break;
>         case VTCR_EL2:
> -               *res0 = compute_reg_res0_bits(kvm, &vtcr_el2_desc, 0, 0);
> -               *res1 = VTCR_EL2_RES1;
> +               resx = compute_reg_resx_bits(kvm, &vtcr_el2_desc, 0, 0);
> +               resx.res1 |= VTCR_EL2_RES1;
>                 break;
>         default:
>                 WARN_ON_ONCE(1);
> -               *res0 = *res1 = 0;
> +               resx = (typeof(resx)){};
>                 break;
>         }
> +
> +       return resx;
>  }
>
>  static __always_inline struct fgt_masks *__fgt_reg_to_masks(enum vcpu_sysreg reg)
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 486eba72bb027..c5a45bc62153e 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1683,22 +1683,19 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
>         return v;
>  }
>
> -static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
> +static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, struct resx resx)
>  {
> -       int i = sr - __SANITISED_REG_START__;
> -
>         BUILD_BUG_ON(!__builtin_constant_p(sr));
>         BUILD_BUG_ON(sr < __SANITISED_REG_START__);
>         BUILD_BUG_ON(sr >= NR_SYS_REGS);
>
> -       kvm->arch.sysreg_masks->mask[i].res0 = res0;
> -       kvm->arch.sysreg_masks->mask[i].res1 = res1;
> +       kvm_set_sysreg_resx(kvm, sr, resx);
>  }
>
>  int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>  {
>         struct kvm *kvm = vcpu->kvm;
> -       u64 res0, res1;
> +       struct resx resx;
>
>         lockdep_assert_held(&kvm->arch.config_lock);
>
> @@ -1711,110 +1708,112 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>                 return -ENOMEM;
>
>         /* VTTBR_EL2 */
> -       res0 = res1 = 0;
> +       resx = (typeof(resx)){};
>         if (!kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16))
> -               res0 |= GENMASK(63, 56);
> +               resx.res0 |= GENMASK(63, 56);
>         if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, CnP, IMP))
> -               res0 |= VTTBR_CNP_BIT;
> -       set_sysreg_masks(kvm, VTTBR_EL2, res0, res1);
> +               resx.res0 |= VTTBR_CNP_BIT;
> +       set_sysreg_masks(kvm, VTTBR_EL2, resx);
>
>         /* VTCR_EL2 */
> -       get_reg_fixed_bits(kvm, VTCR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, VTCR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, VTCR_EL2);
> +       set_sysreg_masks(kvm, VTCR_EL2, resx);
>
>         /* VMPIDR_EL2 */
> -       res0 = GENMASK(63, 40) | GENMASK(30, 24);
> -       res1 = BIT(31);
> -       set_sysreg_masks(kvm, VMPIDR_EL2, res0, res1);
> +       resx.res0 = GENMASK(63, 40) | GENMASK(30, 24);
> +       resx.res1 = BIT(31);
> +       set_sysreg_masks(kvm, VMPIDR_EL2, resx);
>
>         /* HCR_EL2 */
> -       get_reg_fixed_bits(kvm, HCR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HCR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HCR_EL2);
> +       set_sysreg_masks(kvm, HCR_EL2, resx);
>
>         /* HCRX_EL2 */
> -       get_reg_fixed_bits(kvm, HCRX_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HCRX_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HCRX_EL2);
> +       set_sysreg_masks(kvm, HCRX_EL2, resx);
>
>         /* HFG[RW]TR_EL2 */
> -       get_reg_fixed_bits(kvm, HFGRTR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGRTR_EL2, res0, res1);
> -       get_reg_fixed_bits(kvm, HFGWTR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGWTR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HFGRTR_EL2);
> +       set_sysreg_masks(kvm, HFGRTR_EL2, resx);
> +       resx = get_reg_fixed_bits(kvm, HFGWTR_EL2);
> +       set_sysreg_masks(kvm, HFGWTR_EL2, resx);
>
>         /* HDFG[RW]TR_EL2 */
> -       get_reg_fixed_bits(kvm, HDFGRTR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HDFGRTR_EL2, res0, res1);
> -       get_reg_fixed_bits(kvm, HDFGWTR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HDFGWTR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HDFGRTR_EL2);
> +       set_sysreg_masks(kvm, HDFGRTR_EL2, resx);
> +       resx = get_reg_fixed_bits(kvm, HDFGWTR_EL2);
> +       set_sysreg_masks(kvm, HDFGWTR_EL2, resx);
>
>         /* HFGITR_EL2 */
> -       get_reg_fixed_bits(kvm, HFGITR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGITR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HFGITR_EL2);
> +       set_sysreg_masks(kvm, HFGITR_EL2, resx);
>
>         /* HAFGRTR_EL2 - not a lot to see here */
> -       get_reg_fixed_bits(kvm, HAFGRTR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HAFGRTR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HAFGRTR_EL2);
> +       set_sysreg_masks(kvm, HAFGRTR_EL2, resx);
>
>         /* HFG[RW]TR2_EL2 */
> -       get_reg_fixed_bits(kvm, HFGRTR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGRTR2_EL2, res0, res1);
> -       get_reg_fixed_bits(kvm, HFGWTR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGWTR2_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HFGRTR2_EL2);
> +       set_sysreg_masks(kvm, HFGRTR2_EL2, resx);
> +       resx = get_reg_fixed_bits(kvm, HFGWTR2_EL2);
> +       set_sysreg_masks(kvm, HFGWTR2_EL2, resx);
>
>         /* HDFG[RW]TR2_EL2 */
> -       get_reg_fixed_bits(kvm, HDFGRTR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HDFGRTR2_EL2, res0, res1);
> -       get_reg_fixed_bits(kvm, HDFGWTR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HDFGWTR2_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HDFGRTR2_EL2);
> +       set_sysreg_masks(kvm, HDFGRTR2_EL2, resx);
> +       resx = get_reg_fixed_bits(kvm, HDFGWTR2_EL2);
> +       set_sysreg_masks(kvm, HDFGWTR2_EL2, resx);
>
>         /* HFGITR2_EL2 */
> -       get_reg_fixed_bits(kvm, HFGITR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, HFGITR2_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, HFGITR2_EL2);
> +       set_sysreg_masks(kvm, HFGITR2_EL2, resx);
>
>         /* TCR2_EL2 */
> -       get_reg_fixed_bits(kvm, TCR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, TCR2_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, TCR2_EL2);
> +       set_sysreg_masks(kvm, TCR2_EL2, resx);
>
>         /* SCTLR_EL1 */
> -       get_reg_fixed_bits(kvm, SCTLR_EL1, &res0, &res1);
> -       set_sysreg_masks(kvm, SCTLR_EL1, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, SCTLR_EL1);
> +       set_sysreg_masks(kvm, SCTLR_EL1, resx);
>
>         /* SCTLR2_ELx */
> -       get_reg_fixed_bits(kvm, SCTLR2_EL1, &res0, &res1);
> -       set_sysreg_masks(kvm, SCTLR2_EL1, res0, res1);
> -       get_reg_fixed_bits(kvm, SCTLR2_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, SCTLR2_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, SCTLR2_EL1);
> +       set_sysreg_masks(kvm, SCTLR2_EL1, resx);
> +       resx = get_reg_fixed_bits(kvm, SCTLR2_EL2);
> +       set_sysreg_masks(kvm, SCTLR2_EL2, resx);
>
>         /* MDCR_EL2 */
> -       get_reg_fixed_bits(kvm, MDCR_EL2, &res0, &res1);
> -       set_sysreg_masks(kvm, MDCR_EL2, res0, res1);
> +       resx = get_reg_fixed_bits(kvm, MDCR_EL2);
> +       set_sysreg_masks(kvm, MDCR_EL2, resx);
>
>         /* CNTHCTL_EL2 */
> -       res0 = GENMASK(63, 20);
> -       res1 = 0;
> +       resx.res0 = GENMASK(63, 20);
> +       resx.res1 = 0;
>         if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RME, IMP))
> -               res0 |= CNTHCTL_CNTPMASK | CNTHCTL_CNTVMASK;
> +               resx.res0 |= CNTHCTL_CNTPMASK | CNTHCTL_CNTVMASK;
>         if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, CNTPOFF)) {
> -               res0 |= CNTHCTL_ECV;
> +               resx.res0 |= CNTHCTL_ECV;
>                 if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, IMP))
> -                       res0 |= (CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT |
> -                                CNTHCTL_EL1NVPCT | CNTHCTL_EL1NVVCT);
> +                       resx.res0 |= (CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT |
> +                                     CNTHCTL_EL1NVPCT | CNTHCTL_EL1NVVCT);
>         }
>         if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
> -               res0 |= GENMASK(11, 8);
> -       set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
> +               resx.res0 |= GENMASK(11, 8);
> +       set_sysreg_masks(kvm, CNTHCTL_EL2, resx);
>
>         /* ICH_HCR_EL2 */
> -       res0 = ICH_HCR_EL2_RES0;
> -       res1 = ICH_HCR_EL2_RES1;
> +       resx.res0 = ICH_HCR_EL2_RES0;
> +       resx.res1 = ICH_HCR_EL2_RES1;
>         if (!(kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_TDS))
> -               res0 |= ICH_HCR_EL2_TDIR;
> +               resx.res0 |= ICH_HCR_EL2_TDIR;
>         /* No GICv4 is presented to the guest */
> -       res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
> -       set_sysreg_masks(kvm, ICH_HCR_EL2, res0, res1);
> +       resx.res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
> +       set_sysreg_masks(kvm, ICH_HCR_EL2, resx);
>
>         /* VNCR_EL2 */
> -       set_sysreg_masks(kvm, VNCR_EL2, VNCR_EL2_RES0, VNCR_EL2_RES1);
> +       resx.res0 = VNCR_EL2_RES0;
> +       resx.res1 = VNCR_EL2_RES1;
> +       set_sysreg_masks(kvm, VNCR_EL2, resx);
>
>  out:
>         for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
> --
> 2.47.3
>

