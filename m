Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00070C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DtRkP6CYCN2VX6LAP0NMel2JbBrN6HKmyX2jA5Yc7E=; b=TtisbY+nvuIk8V3X4ZUfPgP9BR
	6doSiMroszlK7KIAczI6kym11JBuNhhD+d0yGfYv6PdYRdGZbUZBovhD/WiQPzSJunQnQvFoazto/
	ExU0rndnn1J4NquhirxwnyKI+//unmlxAMe0TaqOQ6552wwMC9S6yEfFO6RQ5ToztxfNsAQlny0Ez
	wYeaFBEGzw9ylCO2B5A0Otz85XKUKnjJD0z9DX5SqHcZgQ+BsXUC0wYhmODgyD5ltAQ87om6KwFLc
	eTvzWD2byug3NuVEJEH+0xhF9hK6PQO7ZsIwZF/0W/2+gauzcKXb9a54TaM+kJjuJyMWBXNGkV2yd
	ZmDLqhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWma-00000005nQf-3UTk;
	Tue, 04 Mar 2025 18:14:20 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVZF-00000005W5G-0A1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:56:30 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4750a85a0ddso4901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741107388; x=1741712188; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9DtRkP6CYCN2VX6LAP0NMel2JbBrN6HKmyX2jA5Yc7E=;
        b=v/0X1Mx7zRFkw7ZWjqxKGt1MKxWcxhg1BLFqyAoeON4AwJetsskie0pV2IgK/RTeCb
         MwZFolznq0g6euoY/pdKc24CQST+OfFkoGgJD7l/WSeTtD1kL3Xwkt5R+YRYIMyWvv5s
         KLJjf7dz+t8RNoJvtGekbYeFqjftIYI1aRAX6Vwhs9UO8npJHsC+kkx2cc+I6azCyRpK
         t6u2bFpiglWWv108ip4dFXV5VieorR37ZjlPwNVy92IeKzn+h5Z8hmD09J3BWS9dBabW
         8ncAJeeoTdJZYJkfiiwj2jjGuBxThXuSZi1FRBNxhG6zcVH62+XyvkUl8iToaJwlzrDV
         o4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107388; x=1741712188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DtRkP6CYCN2VX6LAP0NMel2JbBrN6HKmyX2jA5Yc7E=;
        b=unQJNVU4jHSi4rgn4+aKpiP+WPO5quWux7eMIyzVzCis+mw96tEAkSfosFwZTf3w7I
         4o4YZojB1YtSX2x3JDF745XSCGZQrjfzamSOYzp2g14yj/rMFKLKGXluOdi5xQI2Vy7f
         6w5xQuUq8YaUloPelmkpD1FJUMxnA0b7iWk87yPInxVTeGAs3Ltx2nei493q1KDWYWHq
         fVHzGB//rYcm9dTfgV9NzkbpHKHVNY0gAUDYCom7D9wE7OJi0MhRwUsZ9eWl3OL2dnCe
         ZHnJqnqsRu8Irri4Ch7SDtwpCmd6Rhhaa3E7bqiHBl3s1nyYg6Hwvcs9y4fzV+Tcx32w
         bfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fmpQwwmIw7EEiaRWSnWdco9vg/8cXSuENVgskWmoC/V2kjwAYeozAWiWKbH6Cg5M1YPfHCG/pAfW+EdfSEkV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn2ec9FYMNiGeiU2DPt4TyqvrSXkegf2QfOG4S08E3VWjelnp7
	hc8nNWBdnOh/wEAsVBcI6hVIQfbntCYzcuvD9hepCX4A5QbNClawg9X4qH24HWfi4CkgYJxFHkZ
	g0GuAFlgqBzFBlc2ES8ubKv9VaGbOBzdULFMDs5qLPh6B2AYxJt3W
X-Gm-Gg: ASbGnctiYIRwD2D2+u+/KClONFLjgSupjwaKP5Z8u0hQa5Fzh0FpTjfWzicqwdJwfv0
	vTIs/cTsk+uktqu08uLMrYJpjK7CxQ6kNswIJ672xzMLLuN5JzJRNj52AOude3yusNSGYfGYK7L
	OtTn6/UrDy4a78ldo4ViabGzRRP2fAreLbxj4f2AC89Z9br1KvVeNOqQ==
X-Google-Smtp-Source: AGHT+IF23vzPgXJFq7laGxxdPorzVUnziNDjwTEtrDs+9M/YfHZweGHZAZN5eGiioteQmHR0kHXdQj+z0gs3Xcfs9rk=
X-Received: by 2002:a05:622a:48e:b0:474:cbac:a983 with SMTP id
 d75a77b69052e-4750a4d1015mr307611cf.6.1741107387427; Tue, 04 Mar 2025
 08:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20250210184150.2145093-1-maz@kernel.org> <20250210184150.2145093-8-maz@kernel.org>
In-Reply-To: <20250210184150.2145093-8-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Mar 2025 16:55:50 +0000
X-Gm-Features: AQ5f1JpeNlKdk-l5r71vf2tqDSYKeajf6KLHiNZ0LiUdyjmTYrSWEAH6GprWQ2A
Message-ID: <CA+EHjTwm4CosWDGcaH_tnLU7zMNCq8twDyEcKd7-V0Lu7b-LcA@mail.gmail.com>
Subject: Re: [PATCH 07/18] KVM: arm64: Compute FGT masks from KVM's own FGT tables
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_085629_079399_19E7A025 
X-CRM114-Status: GOOD (  28.69  )
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

On Mon, 10 Feb 2025 at 18:42, Marc Zyngier <maz@kernel.org> wrote:
>
> In the process of decoupling KVM's view of the FGT bits from the
> wider architectural state, use KVM's own FGT tables to build
> a synthitic view of what is actually known.

synthitic -> synthetic


> This allows for some checking along the way.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_arm.h  |   4 ++
>  arch/arm64/include/asm/kvm_host.h |  14 ++++
>  arch/arm64/kvm/emulate-nested.c   | 102 ++++++++++++++++++++++++++++++
>  3 files changed, 120 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 8d94a6c0ed5c4..e424085f2aaca 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -359,6 +359,10 @@
>  #define __HAFGRTR_EL2_MASK     (GENMASK(49, 17) | GENMASK(4, 0))
>  #define __HAFGRTR_EL2_nMASK    ~(__HAFGRTR_EL2_RES0 | __HAFGRTR_EL2_MASK)
>
> +/* Because the sysreg file mixes R and W... */
> +#define HFGRTR_EL2_RES0                HFGxTR_EL2_RES0 (0)
> +#define HFGWTR_EL2_RES0                (HFGRTR_EL2_RES0 | __HFGRTR_ONLY_MASK)

__HFGRTR_ONLY_MASK is a hand-crafted bitmask. The only bit remaining
in HFGxTR_EL2 that is RES0 is bit 51. If that were to be used as an
HFGRTR-only bit without __HFGRTR_ONLY_MASK getting updated, then
aggregate_fgt() below would set its bit in hfgwtr_masks. Could this be
a problem if this happens and the polarity of this bit ends up being
negative, thereby setting the corresponding nmask bit?

Cheers,
/fuad

> +
>  /* Similar definitions for HCRX_EL2 */
>  #define __HCRX_EL2_RES0         HCRX_EL2_RES0
>  #define __HCRX_EL2_MASK                (BIT(6))
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7cfa024de4e34..4e67d4064f409 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -569,6 +569,20 @@ struct kvm_sysreg_masks {
>         } mask[NR_SYS_REGS - __SANITISED_REG_START__];
>  };
>
> +struct fgt_masks {
> +       const char      *str;
> +       u64             mask;
> +       u64             nmask;
> +       u64             res0;
> +};
> +
> +extern struct fgt_masks hfgrtr_masks;
> +extern struct fgt_masks hfgwtr_masks;
> +extern struct fgt_masks hfgitr_masks;
> +extern struct fgt_masks hdfgrtr_masks;
> +extern struct fgt_masks hdfgwtr_masks;
> +extern struct fgt_masks hafgrtr_masks;
> +
>  struct kvm_cpu_context {
>         struct user_pt_regs regs;       /* sp = sp_el0 */
>
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 607d37bab70b4..bbfe89c37a86e 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2033,6 +2033,101 @@ static u32 encoding_next(u32 encoding)
>         return sys_reg(op0 + 1, 0, 0, 0, 0);
>  }
>
> +#define FGT_MASKS(__n, __m)                                            \
> +       struct fgt_masks __n = { .str = #__m, .res0 = __m, }
> +
> +FGT_MASKS(hfgrtr_masks, HFGRTR_EL2_RES0);
> +FGT_MASKS(hfgwtr_masks, HFGWTR_EL2_RES0);
> +FGT_MASKS(hfgitr_masks, HFGITR_EL2_RES0);
> +FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2_RES0);
> +FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2_RES0);
> +FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2_RES0);
> +
> +static __init bool aggregate_fgt(union trap_config tc)
> +{
> +       struct fgt_masks *rmasks, *wmasks;
> +
> +       switch (tc.fgt) {
> +       case HFGxTR_GROUP:
> +               rmasks = &hfgrtr_masks;
> +               wmasks = &hfgwtr_masks;
> +               break;
> +       case HDFGRTR_GROUP:
> +               rmasks = &hdfgrtr_masks;
> +               wmasks = &hdfgwtr_masks;
> +               break;
> +       case HAFGRTR_GROUP:
> +               rmasks = &hafgrtr_masks;
> +               wmasks = NULL;
> +               break;
> +       case HFGITR_GROUP:
> +               rmasks = &hfgitr_masks;
> +               wmasks = NULL;
> +               break;
> +       }
> +
> +       /*
> +        * A bit can be reserved in either the R or W register, but
> +        * not both.
> +        */
> +       if ((BIT(tc.bit) & rmasks->res0) &&
> +           (!wmasks || (BIT(tc.bit) & wmasks->res0)))
> +               return false;
> +
> +       if (tc.pol)
> +               rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
> +       else
> +               rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
> +
> +       if (wmasks) {
> +               if (tc.pol)
> +                       wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
> +               else
> +                       wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
> +       }
> +
> +       return true;
> +}
> +
> +static __init int check_fgt_masks(struct fgt_masks *masks)
> +{
> +       unsigned long duplicate = masks->mask & masks->nmask;
> +       u64 res0 = masks->res0;
> +       int ret = 0;
> +
> +       if (duplicate) {
> +               int i;
> +
> +               for_each_set_bit(i, &duplicate, 64) {
> +                       kvm_err("%s[%d] bit has both polarities\n",
> +                               masks->str, i);
> +               }
> +
> +               ret = -EINVAL;
> +       }
> +
> +       masks->res0 = ~(masks->mask | masks->nmask);
> +       if (masks->res0 != res0)
> +               kvm_info("Implicit %s = %016llx, expecting %016llx\n",
> +                        masks->str, masks->res0, res0);
> +
> +       return ret;
> +}
> +
> +static __init int check_all_fgt_masks(int ret)
> +{
> +       int err = 0;
> +
> +       err |= check_fgt_masks(&hfgrtr_masks);
> +       err |= check_fgt_masks(&hfgwtr_masks);
> +       err |= check_fgt_masks(&hfgitr_masks);
> +       err |= check_fgt_masks(&hdfgrtr_masks);
> +       err |= check_fgt_masks(&hdfgwtr_masks);
> +       err |= check_fgt_masks(&hafgrtr_masks);
> +
> +       return ret ?: err;
> +}
> +
>  int __init populate_nv_trap_config(void)
>  {
>         int ret = 0;
> @@ -2097,8 +2192,15 @@ int __init populate_nv_trap_config(void)
>                         ret = xa_err(prev);
>                         print_nv_trap_error(fgt, "Failed FGT insertion", ret);
>                 }
> +
> +               if (!aggregate_fgt(tc)) {
> +                       ret = -EINVAL;
> +                       print_nv_trap_error(fgt, "FGT bit is reserved", ret);
> +               }
>         }
>
> +       ret = check_all_fgt_masks(ret);
> +
>         kvm_info("nv: %ld fine grained trap handlers\n",
>                  ARRAY_SIZE(encoding_to_fgt));
>
> --
> 2.39.2
>

