Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C213AD73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9PI9Qi8HDlLbV57o548904J5pG00v1lKuCCnBvJ6co=; b=Cs40aWfkehY7VER7OwTRLpSQOG
	muWF3LH2Bce1cBARWY8gROBbOsPykO//Z+5x65vwi3UeWD0NXjypKocOIGvV2L1HTym33h/yOjqjq
	/aotKVHLEY0omvbRLyfwDodm6eutS9tSV0T0WQ1qoqwsxyp7ZPqP2gqMheqd6WTE0Gbjxk14rSlBg
	z9YKMGcTeStSzwmFJXboBKvj6hycp8EjTUBqG+EZuMpiSWO8qkbpq8WiW+aSr/6Cw923T0ycbVyrM
	AGd932ZCQC4OUHMBAIGSNTbRfzlrczEFF6uXT2MPN3iBz/T6x78WN1tkmHy2WZqgxIEiFfjYBjNv3
	tioOomJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0O-00000000SPn-15jz;
	Thu, 29 Jan 2026 17:40:32 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0L-00000000SOy-2LIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:40:30 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5033b64256dso4411cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 09:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769708423; cv=none;
        d=google.com; s=arc-20240605;
        b=RMxAZSkkGjmI3rMvEbenXJD7OLMEza7oYcHkSh/mqwsWiHNuUcqdPESsx8bVWaP/hp
         GDvUirzT9Om+voHIx5XMdqtGpqwl91N39lSZ0BREehF1u4Qrc2FRw67ZYZyewJXGahQ/
         TxnNOy6WW4BS2B5wAcT9ncJ8X96J34by/qVqvTGgq2mKI8Ns3NybGgtmlzUitVQ0SSXb
         ASPBVrQKreDPoBjiLE/vVIHW3+hSdjO1JkbCK6wTTxtb/V0nJ1KbPXNK8SNgCghN34FM
         W6YqL9dbBFYqPl8gVsCQbRksxpZ6CvzQ/z/AauJwQFH2gbMH9LtTlZy7KovUKr/yufoP
         3UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C9PI9Qi8HDlLbV57o548904J5pG00v1lKuCCnBvJ6co=;
        fh=sDnjyNhNpEvqSwNiF3jN1gb6YRJy+1ioMln/CU5yKAo=;
        b=JTNdu7l7mlBUs46YgUnbcrJfxVFloA2FKiOgRK2APhj4kld0EMKY3wYo7IE6aoIoyv
         pWt7O4sKIDMim0jxx1jVCpgPgu4DQ4r1QcC6RTU2hbkVR4uthgX48lNfvRRWVZevS5ZX
         FNZU2QtCHbECuvBoj6OdX0XjtqgOko7Xh0COxRpMzmXkYtaH4R67mlNOzuydNKnGQQT/
         sSXeNazOXTzTM3WRQsAFM2gBd9Rr+0V1RoO5vj5MNmMue9MtCdDvtNVeOQD7yU/R+FEg
         IB7jNZ6zdC7aXcSjzIeI9WCVZhUAXRAA5VAosirr9vfCPRLtgYlZIB3BwRv6dVTqFOw6
         Z/WQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769708423; x=1770313223; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C9PI9Qi8HDlLbV57o548904J5pG00v1lKuCCnBvJ6co=;
        b=FaOymd5xzdmvqo1wka/IpKLdd6t7/zn5xcnBrYvsSMRupiiEb7GBUcNXUBFsyuaK5j
         YLvpcJj5hOdRHxFgw/L+6AqolPRYUclTvKIuVEiLqbVuzeAVF5j/Ed1yGYSCgoGXJfpt
         RXm8TtCADnTBKDsyrCOQkbnK5cTVFw8cXHiZ/aUIKYT264cKlQXnuWQsNmbP7FjTynaP
         +r6ucBSAI2MeYy9K6qwkyYoY/lj1H08c92TmRGc97rVSPWHCFLOsxtKPTfcKr0HYtSYR
         9eUXjTn/tfGiVwUgZC++cDAiBkZsQ63N5GHbOjZxxJYfA+ZjZYYqCChqruo+C1EvNA+T
         eRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708423; x=1770313223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9PI9Qi8HDlLbV57o548904J5pG00v1lKuCCnBvJ6co=;
        b=fX4Hpy48E6GiyEedVOlXohRWGPVVn1KmnplvQj3gU1nrYR9GcZ/1VLv/Awv6IGhKI0
         FmfCCXdprQJdgLRCVO4CNUwjvUG2yJFB+10s6+Ql8o4fD2ZAhoByfsO2gwIp/gn9Q2d8
         4AxWG3hPdp2dmj6PwBtapagzFIVJgmx0Cx77cIMaT6nyTGGtG9CdWhmz1TTEcEc5VMjV
         UffXmlwIRjG/UPJT3s5QERYzfhoxpFDiukx0acTjaUud4vkGY33KtMqZwIIpN53lKKZr
         80ecRFKPKefip20vnr0dWzNFec192w/JDSnuWQ2zj51oDnog9UMO9Vlr5aTIMUIWHIJ0
         uL7A==
X-Forwarded-Encrypted: i=1; AJvYcCVl1cCHKTFBNapNgQ++fwSeGfbMHE7Loa5G6LvUCId5O0T+fAD1Y6c/uQvF0M4ive0xupHCyrbq1IU0i/NZtBcA@lists.infradead.org
X-Gm-Message-State: AOJu0YySduTtJ4SsV/2rjsZX3n7+mo257FVLhNgrCfrwlYWQd5kaMI1O
	hyOUMbVSqK28pJlFgCNvOjA+7zLX5nSpuWHUHDsfaTl17hUHb3nCoyJ3kRNl3GjJ+vbsEI4ZCV2
	JF+yq74ap4u0TgNwjXbBw3i7flzrZu6g6vz0WhjKF
X-Gm-Gg: AZuq6aI29aWTx/t3cy81kGOUGcLdRqgtHQioJsG0HSon/SV1ow1GOUZtcVFvGxqLV+G
	+XSmAP7Unm4VcZ+VHgMmblz6fVh+iwWDSvagkJd5JnAow3TVouD6BQCKD5VZbnM8sCnfJ+lxH/7
	SQwSDQeRif9Rrk4TT3FtxSP4F85cThlzhtwY4djZQuGS3RUIjG2hKJMyYbtB5VGRlzKIpEPWcpI
	803gwI105hX9y2ZhmlUTqOBoiBBo0WK7+q1bhYEl4m41x8QaTH1aL47YLHq2yZAoxdjgkKT
X-Received: by 2002:ac8:5a43:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-504310b4cecmr11694721cf.17.1769708422703; Thu, 29 Jan 2026
 09:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-14-maz@kernel.org>
 <CA+EHjTw_4WJgiS7vTUprvJOjdNrnW=sjhazCkU9eQW8BUYuZZw@mail.gmail.com> <86a4xwbakk.wl-maz@kernel.org>
In-Reply-To: <86a4xwbakk.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 17:39:45 +0000
X-Gm-Features: AZwV_QgS_ySXSV2SHoit8uIkCqZLoVSe3rfHiqo21RvB3vOxbqAI8dmocE5xOnU
Message-ID: <CA+EHjTyf5Zhb2JFbg6jv1opCX=GV9_PMNiMo=0fCc9cYxzEAiw@mail.gmail.com>
Subject: Re: [PATCH 13/20] KVM: arm64: Move RESx into individual register descriptors
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_094029_704769_9FF9D891 
X-CRM114-Status: GOOD (  27.61  )
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

...
> > I see what you're doing here, but it took me a while to get it and
> > convince myself that there aren't any bugs (my self couldn't find any
> > bugs, but I wouldn't trust him that much). You already introduce a new
> > flag, FORCE_RESx. Why not just check that directly in the
> > compute_resx_bits() loop, before the check for CALL_FUNC?
> >
> > + if (map[i].flags & FORCE_RESx)
> > +     match = false;
> > + else if (map[i].flags & CALL_FUNC)
> > ...
> >
> > The way it is now, to understand FORCE_RES0, you must trace a flag, a
> > macro expansion, and a function pointer, just to set a boolean to
> > false.
>
> With that scheme, you'd write something like:
>
> +#define FORCE_RES0(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx)
>
> This construct would need a new __NEEDS_FEAT_0() macro that doesn't
> take any argument other than flags. Something like below (untested).
>
>         M.

LGTM. Not tested either. I plan to test the series once I'm done reviewing it.

Thanks,
/fuad

>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 9485e1f2dc0b7..364bdd1e5be51 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -79,6 +79,12 @@ struct reg_feat_map_desc {
>                 .match = (fun),                         \
>         }
>
> +#define __NEEDS_FEAT_0(m, f, w, ...)                   \
> +       {                                               \
> +               .w      = (m),                          \
> +               .flags = (f),                           \
> +       }
> +
>  #define __NEEDS_FEAT_FLAG(m, f, w, ...)                        \
>         CONCATENATE(__NEEDS_FEAT_, COUNT_ARGS(__VA_ARGS__))(m, f, w, __VA_ARGS__)
>
> @@ -95,9 +101,8 @@ struct reg_feat_map_desc {
>  #define NEEDS_FEAT(m, ...)     NEEDS_FEAT_FLAG(m, 0, __VA_ARGS__)
>
>  /* Declare fixed RESx bits */
> -#define FORCE_RES0(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx, enforce_resx)
> -#define FORCE_RES1(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx | AS_RES1, \
> -                                               enforce_resx)
> +#define FORCE_RES0(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx)
> +#define FORCE_RES1(m)          NEEDS_FEAT_FLAG(m, FORCE_RESx | AS_RES1)
>
>  /*
>   * Declare the dependency between a non-FGT register, a set of
> @@ -221,15 +226,6 @@ struct reg_feat_map_desc {
>  #define FEAT_HCX               ID_AA64MMFR1_EL1, HCX, IMP
>  #define FEAT_S2PIE             ID_AA64MMFR3_EL1, S2PIE, IMP
>
> -static bool enforce_resx(struct kvm *kvm)
> -{
> -       /*
> -        * Returning false here means that the RESx bits will be always
> -        * addded to the fixed set bit. Yes, this is counter-intuitive.
> -        */
> -       return false;
> -}
> -
>  static bool not_feat_aa64el3(struct kvm *kvm)
>  {
>         return !kvm_has_feat(kvm, FEAT_AA64EL3);
> @@ -996,7 +992,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>         NEEDS_FEAT(HCR_EL2_TWEDEL       |
>                    HCR_EL2_TWEDEn,
>                    FEAT_TWED),
> -       NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES1_WHEN_E2H1, enforce_resx),
> +       NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES1_WHEN_E2H1 | FORCE_RESx),
>         FORCE_RES0(HCR_EL2_RES0),
>         FORCE_RES1(HCR_EL2_RES1),
>  };
> @@ -1362,7 +1358,9 @@ struct resx compute_resx_bits(struct kvm *kvm,
>                 if (map[i].flags & exclude)
>                         continue;
>
> -               if (map[i].flags & CALL_FUNC)
> +               if (map[i].flags & FORCE_RESx)
> +                       match = false;
> +               else if (map[i].flags & CALL_FUNC)
>                         match = map[i].match(kvm);
>                 else
>                         match = idreg_feat_match(kvm, &map[i]);
>
> --
> Without deviation from the norm, progress is not possible.

