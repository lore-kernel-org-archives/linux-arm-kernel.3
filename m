Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE256D6B08A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQMIKkFFYhu4sIg3A2teqJk96QiqeuS9EHouVKYLx8Q=; b=bDDQO6EYqOZjUqSzvx4BK7iK9A
	WDrUiLwQhHfta0CI7TG9GlOfrc0iSchlH0eiNjDve0GLaCKZrMSZpOSVXM3dZkw/VtLjRFPk+5Cka
	ZOKXQlMrOblFMgx7yS6bDWC7vULjN2fy9uZiULWgiMWggpDIA6SzPwVkarjmOL8lnEw7yR8+GKKsc
	d76hiNk0MiblP33B5dupIcue7bYBOMqjv+vbBB7i/sTm0Ykxt4bsNN93fMXjv0HqWItyiY8zJH0s/
	15xTrE7n3AoIz/8JRDCYXRvMxJHLlouf+8wVOhgvxJ7mj8MZAxliPUTHYlY8BW7uJHcf7iuh1jnnm
	BuHsw4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUuS-00000000LnI-2wBX;
	Thu, 29 Jan 2026 16:30:20 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUuP-00000000Lmw-3YO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:30:19 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-50299648ae9so543491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769704216; cv=none;
        d=google.com; s=arc-20240605;
        b=dhIV0mj9fJbFa1sF9dneOG3hB29F/nRLfYboynTl3AkS2lCTP1vDBR6dP3/sY6W7Uf
         UwNLSqiji1ChSn0ozU5I3oTbZgiF/3Rm98ti8ompB08wSyVlY03LfYZOoJEW2syC/n+n
         R3nNn+cn01A0U2b7fV7ndgv2bHqybpSaQ+/nMwSZjUd4a2AY6lkF8tJR//GroN875BdI
         WXcDvK9VXHGz5z2jT/RLDHisPRsxvshsCunmA9wGnjGBgrdizgAGlX0djqYzJ6THN1kD
         e0NMOzf7PtuIBGtORqDZi9cjNmZs70j+WRtYoZM/JJRAoulP7K5zSoAQkVwO2n4STflB
         hz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vQMIKkFFYhu4sIg3A2teqJk96QiqeuS9EHouVKYLx8Q=;
        fh=vH3BVyFRAwJwj30qtN9V5M6TuynaIvgBwGgTBdVYSN0=;
        b=jMNUJjK1Zf0UpVS/XoK4Ue1JxhPYJaO4bhFz/YOEfh39j1J8MmTqPQB5WwtxQaaN1X
         G3aFaKnBB/OJjVozRYH+j2VgJchmsgJBWoI6AqFf6Q9tg/uExdmRWpoi27KXWBndwP+K
         Qu02I6LamGhNreZXWKVjgjk0S6pQW6Aq4D6o6AQWQ7pFttXpkNnDHSwb1WwlBVK8wBRb
         gsNkXSAvrSASVcwHgrZlDifiInTDbUjVGaZRlCatLRggaDa0LscCzTsepZYpeZX0SwMY
         4c9x9vSqFEabB2HN5sG9H7/MjeFeTjfUfon9xnI8dd9iBnmujoS7gP9iYBsVNMTzGdTf
         NsJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769704216; x=1770309016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQMIKkFFYhu4sIg3A2teqJk96QiqeuS9EHouVKYLx8Q=;
        b=zQ3KqtR+Q9NW4aRolUYWreiwHenZ+xocBOLq6prnIRj5ClJdz4guiGVuKH4xxMdOGa
         KbnTRygg3ZqZ/iJFNh9dp6/u2vHqBzu2iNp3pO0lrykY1lCu8T+xc9sELTLrRfgRH0II
         JDmlQf2nrHYngt4t3ivoMvYBa3jvWbfv9W+sg5ZU7YBIbg48hqqUYX2MOONWPMhie73T
         OOfiZyI3vf8nsr5DwCvr3k79yTD72kTqztFKHrk0tjlDYbsyI8YcSML4qloOWgSVkk8M
         XLOsv0UIUGQeicbeGcgE+6LiME0Na5agdiIeiPTpHsybe7MSTE+uO1QgxubBDb8O4S0N
         wCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704216; x=1770309016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQMIKkFFYhu4sIg3A2teqJk96QiqeuS9EHouVKYLx8Q=;
        b=l0kcd1UaYISdkBudTQM1PuMICtCwHUEjtydeXEOfFj6MHzaiewaN2WawM0QbDfvyy6
         nD1oKU8MbF10D7Ye31eL7sERmOqQDTW9t4H1Y5EyIOOwT5M1T1LofDO8hUnDAj2BPVgW
         NARMAunenUsGPk3hIA1T4dqMZdEdQs9QSD7DPbW8wWs5N8ZdKT/xv9E1EeUxOU702cUD
         yT3JOiuEfjxQZJkBzVgGk63JVgbnD7WOUurU9SRcFxOUR06gWyekpMUgmLYpP6raVXVM
         ZPPGrXsr81MVKH4/IQlDFP5Svhkcp4Z0zMtfOVjOvItMiR1MxUzE3H55zfEGCL+R0jiL
         Cufg==
X-Forwarded-Encrypted: i=1; AJvYcCXozhRtDqFOOGHEI+2cyLna4bZ9eNootFZd4Wez55pLJ6mC8SocKSVEqaQqW01K3BVYyDjUYUtss6XEQjLQomWL@lists.infradead.org
X-Gm-Message-State: AOJu0YyKko0aUr0L9KdIGyTrQphwdcnEhf3U3HdPIk2PVbfWfdylJSkK
	qYU6swn/OFQZQrJpvMMx9mvbqukGxCqAC7VHRTcjvAUCQya+EOuFVFdBqxPa4cRzezSrfU65HQn
	YEmHiYDud7rR25YHrL32rFXopSNkabNmFgJ0oeTzP
X-Gm-Gg: AZuq6aJSEG2ptyfi3ooDf6tyzxYFSueTCRKcBP4opFtyIktJbuHX4E7kTStYh5xJMa0
	cIrdRuEwHJsKI/x8MWqrWXiTx8bFNIs/0UNuw+KChddMSOt/iQqrGKLbJE6YAlreVjLi3UR2qXe
	D02CbraFSB4nPD+TcK5tuW5iWYRwaOzpJ5cDnZdAyyG65KALRCwqREOXgGvQYcRvvSlIhnPEBkk
	rn4xvxSceRS79+C94iFvzZrJ1cGay38CQhCx8QUB9uwUOh0T/vKBGcMVSBfuVgZ/IKEZXLc
X-Received: by 2002:ac8:7c47:0:b0:503:2d8f:4cd9 with SMTP id
 d75a77b69052e-503b67573e4mr13934781cf.16.1769704215926; Thu, 29 Jan 2026
 08:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-14-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-14-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 16:29:39 +0000
X-Gm-Features: AZwV_Qg32GvW0ZtRM3k8KTI45TetsfMdg8KQdbLbqMmnl_DQjJAfz20-iM3f-6Q
Message-ID: <CA+EHjTw_4WJgiS7vTUprvJOjdNrnW=sjhazCkU9eQW8BUYuZZw@mail.gmail.com>
Subject: Re: [PATCH 13/20] KVM: arm64: Move RESx into individual register descriptors
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_083017_908119_0A2AFE4F 
X-CRM114-Status: GOOD (  28.19  )
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
> Instead of hacking the RES1 bits at runtime, move them into the
> register descriptors. This makes it significantly nicer.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 7063fffc22799..d5871758f1fcc 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -30,6 +30,7 @@ struct reg_bits_to_feat_map {
>  #define        RES0_WHEN_E2H1  BIT(7)  /* RES0 when E2H=1 and not supported */
>  #define        RES1_WHEN_E2H0  BIT(8)  /* RES1 when E2H=0 and not supported */
>  #define        RES1_WHEN_E2H1  BIT(9)  /* RES1 when E2H=1 and not supported */
> +#define        FORCE_RESx      BIT(10) /* Unconditional RESx */
>
>         unsigned long   flags;
>
> @@ -107,6 +108,11 @@ struct reg_feat_map_desc {
>   */
>  #define NEEDS_FEAT(m, ...)     NEEDS_FEAT_FLAG(m, 0, __VA_ARGS__)
>
> +/* Declare fixed RESx bits */
> +#define FORCE_RES0(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx, enforce_resx)
> +#define FORCE_RES1(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx | AS_RES1, \
> +                                               enforce_resx)
> +
>  /*
>   * Declare the dependency between a non-FGT register, a set of
>   * feature, and the set of individual bits it contains. This generates

nit: features

> @@ -230,6 +236,15 @@ struct reg_feat_map_desc {
>  #define FEAT_HCX               ID_AA64MMFR1_EL1, HCX, IMP
>  #define FEAT_S2PIE             ID_AA64MMFR3_EL1, S2PIE, IMP
>
> +static bool enforce_resx(struct kvm *kvm)
> +{
> +       /*
> +        * Returning false here means that the RESx bits will be always
> +        * addded to the fixed set bit. Yes, this is counter-intuitive.

nit: added

> +        */
> +       return false;
> +}

I see what you're doing here, but it took me a while to get it and
convince myself that there aren't any bugs (my self couldn't find any
bugs, but I wouldn't trust him that much). You already introduce a new
flag, FORCE_RESx. Why not just check that directly in the
compute_resx_bits() loop, before the check for CALL_FUNC?

+ if (map[i].flags & FORCE_RESx)
+     match = false;
+ else if (map[i].flags & CALL_FUNC)
...

The way it is now, to understand FORCE_RES0, you must trace a flag, a
macro expansion, and a function pointer, just to set a boolean to
false.

Cheers,
/fuad


> +
>  static bool not_feat_aa64el3(struct kvm *kvm)
>  {
>         return !kvm_has_feat(kvm, FEAT_AA64EL3);
> @@ -1009,6 +1024,8 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>                    HCR_EL2_TWEDEn,
>                    FEAT_TWED),
>         NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
> +       FORCE_RES0(HCR_EL2_RES0),
> +       FORCE_RES1(HCR_EL2_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
> @@ -1029,6 +1046,8 @@ static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
>                    SCTLR2_EL1_CPTM      |
>                    SCTLR2_EL1_CPTM0,
>                    FEAT_CPA2),
> +       FORCE_RES0(SCTLR2_EL1_RES0),
> +       FORCE_RES1(SCTLR2_EL1_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(sctlr2_desc, SCTLR2_EL1,
> @@ -1054,6 +1073,8 @@ static const struct reg_bits_to_feat_map tcr2_el2_feat_map[] = {
>                    TCR2_EL2_E0POE,
>                    FEAT_S1POE),
>         NEEDS_FEAT(TCR2_EL2_PIE, FEAT_S1PIE),
> +       FORCE_RES0(TCR2_EL2_RES0),
> +       FORCE_RES1(TCR2_EL2_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
> @@ -1131,6 +1152,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
>                    SCTLR_EL1_A          |
>                    SCTLR_EL1_M,
>                    FEAT_AA64EL1),
> +       FORCE_RES0(SCTLR_EL1_RES0),
> +       FORCE_RES1(SCTLR_EL1_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
> @@ -1165,6 +1188,8 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
>                    MDCR_EL2_TDE         |
>                    MDCR_EL2_TDRA,
>                    FEAT_AA64EL1),
> +       FORCE_RES0(MDCR_EL2_RES0),
> +       FORCE_RES1(MDCR_EL2_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
> @@ -1203,6 +1228,8 @@ static const struct reg_bits_to_feat_map vtcr_el2_feat_map[] = {
>                    VTCR_EL2_SL0         |
>                    VTCR_EL2_T0SZ,
>                    FEAT_AA64EL1),
> +       FORCE_RES0(VTCR_EL2_RES0),
> +       FORCE_RES1(VTCR_EL2_RES1),
>  };
>
>  static const DECLARE_FEAT_MAP(vtcr_el2_desc, VTCR_EL2,
> @@ -1214,7 +1241,8 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
>         u64 mask = 0;
>
>         for (int i = 0; i < map_size; i++)
> -               mask |= map[i].bits;
> +               if (!(map[i].flags & FORCE_RESx))
> +                       mask |= map[i].bits;
>
>         if (mask != ~resx)
>                 kvm_err("Undefined %s behaviour, bits %016llx\n",
> @@ -1447,28 +1475,22 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>                 break;
>         case HCR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
> -               resx.res1 |= HCR_EL2_RES1;
>                 break;
>         case SCTLR2_EL1:
>         case SCTLR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
> -               resx.res1 |= SCTLR2_EL1_RES1;
>                 break;
>         case TCR2_EL2:
>                 resx = compute_reg_resx_bits(kvm, &tcr2_el2_desc, 0, 0);
> -               resx.res1 |= TCR2_EL2_RES1;
>                 break;
>         case SCTLR_EL1:
>                 resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
> -               resx.res1 |= SCTLR_EL1_RES1;
>                 break;
>         case MDCR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
> -               resx.res1 |= MDCR_EL2_RES1;
>                 break;
>         case VTCR_EL2:
>                 resx = compute_reg_resx_bits(kvm, &vtcr_el2_desc, 0, 0);
> -               resx.res1 |= VTCR_EL2_RES1;
>                 break;
>         default:
>                 WARN_ON_ONCE(1);
> --
> 2.47.3
>

