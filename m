Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC9D2FED7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v38EWj5h/QCAdjN/pQcmdZuKsr9ZCCkUgpYACTXDljc=; b=ha0VUDP/5bznGjr4rQo04OcbQo
	2n3H9tNXdeMUU+WI8ZbTZmlfGqE5vlVxmI4GXgsALkYJ567NEo2gFBNBbq+qh7YOLMHVvzxcRmLMH
	Q0jmtzB01k3Jed/xiJvo6qmYXYDJwqBhAMjUH6M5GlbejXesUxbhIf3f6r3NCzBlQ+0euakvvoAvY
	Wtfddb6PStY49fqUDtwxTJKxRQ9ux8agTfxZpuUyS7FsPulpX/nh52IATFYki9MDb3WDVDjn7RHL9
	IZG79W784QsWqHjlSNl51Guj+723cv47My/DJ1n34XlDmd0ORZDXcZVJ6O2G5eXcCz4N1v9Le3cg6
	ExmAnKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknh5-0000000Env2-1PGM;
	Tue, 27 Jan 2026 18:21:39 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkngs-0000000Entu-0hii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:21:38 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-501511aa012so34401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769538085; cv=none;
        d=google.com; s=arc-20240605;
        b=HT3ZFUU6E01xeR+Ww3v6Rv/l9rUjbfNaYPWRmTny8SO5lKntbzQBS5xRmy43nj9uWU
         79ZDSpffdszkOYFxJ0CLBVilBFIqGnruaxBuC57jkZ6PNVRB7DGLdP2FrYCbRL6kpWig
         ljP6mDv5uiPXaMme1Pjx6/5K+BaYJmLblB8ZDhoyD1sI0Y30Uv4tTJyuvRqdjlUiH1aK
         j2pSNB9vojnz7r7HHOIk713oKTPdY20EpeXHDlWiwc0skdB32xFsIWOtDfbHY+vPp+Z7
         k2LL0WTLAqxEro9JKUFNTJupV2GSbazJRMMYcGoxn/cggd3flaLZaMXV99sIW0nl5rpe
         WESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v38EWj5h/QCAdjN/pQcmdZuKsr9ZCCkUgpYACTXDljc=;
        fh=9a3rPYh6kKcn3ToLKkC3FU7Y5VCizDgl2QGqgpa64jo=;
        b=RqSPVp09C9aO5hUS0Z0+qO9qbqbeDhdcN/6vwP+7LfvCpY2u5aWHEkgwQlX72Ev8Km
         LRw91IVOcPk1JhLs/1LXlZLoyW/9Z75yzM0MN0dZh/t2IVNITgAdcOBrJrpRaKsDVUaq
         yRNATLjLtWNxd95MZA4fILs46Sc/f+aNzujNAFmzlwbkcN8wDMl9Ud3rmL9ojGCPSJz7
         qMv0sNky8YsaqXlPp+lVsPFpohqB+f/6PKtxgbnDVb3YPPoA9E73WcD04KATLZR6UYlP
         7tzjGHjluxSHP9elAbLfFzowsJsXj0BJnp1BnOcGilVXLsV/ARFutThezxfbmgH0TExr
         +8Bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769538085; x=1770142885; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v38EWj5h/QCAdjN/pQcmdZuKsr9ZCCkUgpYACTXDljc=;
        b=F/STDo0/FhV6RUl2CCVm5MalGMZQdG8jRdZk5m0r/Qu1j+jceRxktGFUwxXV7fN1hl
         j3XXlKU011CgzB4zyJCY71rcg0IC0Rs7lGeH2uJxB+y8e+DmAisBC1ONnVTuuNVr3AX+
         YKjBM6R2BA6oemn/T6b6r+KwHzW3V5aEesvGUYhPw/XTBZvJSGUE/rE2mNPqygin/Bmb
         PncnlE9kzpI/k1KGuPRdjY39aG0uOqw4pa1eLGo0fX4E0ptPmLaCXUTKyG5UY8NDZOn9
         llOR0OXs02OaR/UbZcaO/Nn0oiL5UD7EnG/eVKUtcGZM56K1fE5zCnudiaYMpAwjFuQL
         3trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538085; x=1770142885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v38EWj5h/QCAdjN/pQcmdZuKsr9ZCCkUgpYACTXDljc=;
        b=w9qHVN+wcGkJA4s4V83uqhxtI9byhv3D8O7x8zoTnzFuFBu6rauUOrbkWXZTxBK/q1
         6OGLhow2rqm8nupx84PdxJnQ69PIIjj9hrLfKA2218+2C087jcfUQuiMwBgPGFZZTKI/
         m9d1f+xDGRaHQuNsNNkqk3OgWLot39CUORa8pnGlWOpluKkfZbf9Ws2C3hMjmx6kBeRP
         QQiLUiE/tyFgpkKJ+dZ9fx8DyZTckdBVDEUPW/wTe8ZkjwlBGV2Sixhx64hkB8xUsFuh
         DnEdsrvR8KsDFTmsywt18iFpGhx5dFMzzy78wpztLy+NImA+QkKiXSTvAjjufeb95B4s
         Ircw==
X-Forwarded-Encrypted: i=1; AJvYcCULd7x970KxM0iz5yudwCMjVwUdMXEApdQbL48oryDDh/ZcpV+w5YNt3kQv52zigantIu5X2V2Ta+32ng/VTXMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyIcHDaawjXvOagYmY8JZyDNos6IQ9+W9C7HkQnDQQeup30ApRZ
	GHBaEnJNZ0bOFQ0OJn7fS7FGjmKck02udhBztCgUsdiDP0bStp/9YjBO9ScZvpk+KgSeB13tBjL
	O5mjgmzcjHUNCgHTw7Acxyo6XMNP7ks+SU2h6Q63t
X-Gm-Gg: AZuq6aKWAFPw5g+XVk2E8A/gvYc+p5zLpdQ7EbDGeVthRESiDKKJA8tkvghOox75nAB
	YXYKG9V829tyt1k8Xltdc2hcC3sk+enSHoNfUQapvbws3ZG5lDDaME0Kx05YHwULYYSyolW5yOB
	FqhKUYD4G1mdIO9SnAFhF2nc/LlSQQ/MJItfmiSRTufStr45RzFtj+n3n3jjku9V8UMTDd8nMva
	CTMMrBhwuVbAc/TaJfZxmKej/v3xpJ/rWrNRb7mMRzmWQ7MgIyfIADR4Tup0pefAnz2PMAd
X-Received: by 2002:ac8:5f11:0:b0:4ed:ff79:e678 with SMTP id
 d75a77b69052e-5032f52b23cmr10650801cf.18.1769538084451; Tue, 27 Jan 2026
 10:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-11-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-11-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 18:20:47 +0000
X-Gm-Features: AZwV_QgHSiyi6-Py8aoEMg3B72DbuTR2OJAKTX59HorEV0HuWAtLNErLntzE9YA
Message-ID: <CA+EHjTzjRHXJMDKc8GY=8aQ3KJeLYSQYMH_tA03XMav=0VQ7RQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] KVM: arm64: Simplify FIXED_VALUE handling
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102127_751090_DA9A6485 
X-CRM114-Status: GOOD (  25.49  )
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
> The FIXED_VALUE qualifier (mostly used for HCR_EL2) is pointlessly
> complicated, as it tries to piggy-back on the previous RES0 handling
> while being done in a different phase, on different data.
>
> Instead, make it an integral part of the RESx computation, and allow
> it to directly set RESx bits. This is much easier to understand.
>
> It also paves the way for some additional changes to that will allow
> the full removal of the FIXED_VALUE handling.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

The new code preserves the logic, and is easier to understand.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/config.c | 67 ++++++++++++++---------------------------
>  1 file changed, 22 insertions(+), 45 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 39487182057a3..4fac04d3132c0 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -37,7 +37,7 @@ struct reg_bits_to_feat_map {
>                         s8      lo_lim;
>                 };
>                 bool    (*match)(struct kvm *);
> -               bool    (*fval)(struct kvm *, u64 *);
> +               bool    (*fval)(struct kvm *, struct resx *);
>         };
>  };
>
> @@ -389,14 +389,12 @@ static bool feat_vmid16(struct kvm *kvm)
>         return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
>  }
>
> -static bool compute_hcr_e2h(struct kvm *kvm, u64 *bits)
> +static bool compute_hcr_e2h(struct kvm *kvm, struct resx *bits)
>  {
> -       if (bits) {
> -               if (kvm_has_feat(kvm, FEAT_E2H0))
> -                       *bits &= ~HCR_EL2_E2H;
> -               else
> -                       *bits |= HCR_EL2_E2H;
> -       }
> +       if (kvm_has_feat(kvm, FEAT_E2H0))
> +               bits->res0 |= HCR_EL2_E2H;
> +       else
> +               bits->res1 |= HCR_EL2_E2H;
>
>         return true;
>  }
> @@ -1281,12 +1279,11 @@ static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map
>  }
>
>  static
> -struct resx __compute_fixed_bits(struct kvm *kvm,
> -                               const struct reg_bits_to_feat_map *map,
> -                               int map_size,
> -                               u64 *fixed_bits,
> -                               unsigned long require,
> -                               unsigned long exclude)
> +struct resx compute_resx_bits(struct kvm *kvm,
> +                             const struct reg_bits_to_feat_map *map,
> +                             int map_size,
> +                             unsigned long require,
> +                             unsigned long exclude)
>  {
>         struct resx resx = {};
>
> @@ -1299,14 +1296,18 @@ struct resx __compute_fixed_bits(struct kvm *kvm,
>                 if (map[i].flags & exclude)
>                         continue;
>
> -               if (map[i].flags & CALL_FUNC)
> -                       match = (map[i].flags & FIXED_VALUE) ?
> -                               map[i].fval(kvm, fixed_bits) :
> -                               map[i].match(kvm);
> -               else
> +               switch (map[i].flags & (CALL_FUNC | FIXED_VALUE)) {
> +               case CALL_FUNC | FIXED_VALUE:
> +                       map[i].fval(kvm, &resx);
> +                       continue;
> +               case CALL_FUNC:
> +                       match = map[i].match(kvm);
> +                       break;
> +               default:
>                         match = idreg_feat_match(kvm, &map[i]);
> +               }
>
> -               if (!match || (map[i].flags & FIXED_VALUE)) {
> +               if (!match) {
>                         if (map[i].flags & AS_RES1)
>                                 resx.res1 |= reg_feat_map_bits(&map[i]);
>                         else
> @@ -1317,17 +1318,6 @@ struct resx __compute_fixed_bits(struct kvm *kvm,
>         return resx;
>  }
>
> -static
> -struct resx compute_resx_bits(struct kvm *kvm,
> -                            const struct reg_bits_to_feat_map *map,
> -                            int map_size,
> -                            unsigned long require,
> -                            unsigned long exclude)
> -{
> -       return __compute_fixed_bits(kvm, map, map_size, NULL,
> -                                   require, exclude | FIXED_VALUE);
> -}
> -
>  static
>  struct resx compute_reg_resx_bits(struct kvm *kvm,
>                                  const struct reg_feat_map_desc *r,
> @@ -1368,16 +1358,6 @@ static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
>         return resx.res0 | resx.res1;
>  }
>
> -static
> -struct resx compute_reg_fixed_bits(struct kvm *kvm,
> -                                 const struct reg_feat_map_desc *r,
> -                                 u64 *fixed_bits, unsigned long require,
> -                                 unsigned long exclude)
> -{
> -       return __compute_fixed_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
> -                                   fixed_bits, require | FIXED_VALUE, exclude);
> -}
> -
>  void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
>  {
>         u64 val = 0;
> @@ -1417,7 +1397,6 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
>
>  struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>  {
> -       u64 fixed = 0, mask;
>         struct resx resx;
>
>         switch (reg) {
> @@ -1459,10 +1438,8 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>                 resx.res1 |= __HCRX_EL2_RES1;
>                 break;
>         case HCR_EL2:
> -               mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0).res0;
>                 resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
> -               resx.res0 |= (mask & ~fixed);
> -               resx.res1 |= HCR_EL2_RES1 | (mask & fixed);
> +               resx.res1 |= HCR_EL2_RES1;
>                 break;
>         case SCTLR2_EL1:
>         case SCTLR2_EL2:
> --
> 2.47.3
>

