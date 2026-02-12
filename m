Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639A1EB48EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcH9GZLlhn0MK8AoO+gKd8YN91XeUHOY861U71nMAN8=; b=0vyezWehNywvsnk3xq6I9O6V9I
	/eml69xT3QsFmCDVVDXYx+wGjki9Z6+M+s64cvgBWxvCQ1J6Hkr2oC0Pr2yCs1DlwE27PL1b21gmV
	N9VQI8v0SMDXc8b5rgyi8YrVaJaghjJFS4uT1g4tn7G/Jv4G7ZKlf7bzisSRRk5hiY82OQOY+Wrq1
	lETFi/bjn/F4/ZF1U9D+eVg8ck8BVIT+CqGdHDz/++zGr15vJAhYqnAQfqTkNP1sYTL01IX3eC8wE
	WQQUsn9rfRXGzhExRb9MQO3roQDy9dQANMRpAaaYiB2PyImQUf7OeVgiwarw9us47Hq37132g6Rrq
	XkVAnvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTD1-00000001qjI-1qb7;
	Thu, 12 Feb 2026 09:42:03 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTCz-00000001qit-1H9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:42:02 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5033b64256dso326321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770889319; cv=none;
        d=google.com; s=arc-20240605;
        b=VjA+fF7Gz5yDO3ptJYajYb+gGMgbAvW4+ljYyjQzMgvg7L1DdFX2/zIix+gu1C0kiQ
         MsvllcP/T1SojO4/YRTPIbOEjbK2dvIHxK4Buwo6H37Q1srO/ifP9dKXjrfypxBK/gMH
         KpGf7xkqhPemH9o9+lKSl3TGFJgfbFBLW9mhEeOUJFOTiRAaiT2iSm/65KPkofcGRfVO
         e30M88L20XQRZ13kj2BL4DNxKHQLkM9zfCOqhyh1U5NGTJcrrfOtVc7t8HsiFrMOc/+8
         3ZjtguFmOQuJ0E2HzLIVvY7Sr1zgMLEDEeyDfRVKE3F/ua3GJMQB3F07EZYTTmpmnDWd
         sPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VcH9GZLlhn0MK8AoO+gKd8YN91XeUHOY861U71nMAN8=;
        fh=OQVrTm0go34wirexN94+QXVjF51eKw4BmCGHKWXCizk=;
        b=DF05jS/omDexz2SCJTB0MWDoBbbLnghnz8T1UC7CepvZsgzI1E/1XRHp7REsMV4gZg
         omDQhexH0IRA4ITmnzidenKmQSEf4/dNRGhV2UKyFI1JvtkTw9ciC5DutnDS1XASQnYc
         xhl0z1j4PmmIg3G7G+aMR8Y62NDGTArWU3XFHFMSWG6Dx1zJYcfNggC5vm31pDfnRFj7
         GNagU+k6ByWnRObl8SN4FZfJmVXW6Cjlk2ifzhru1tMT0n4bChMfPjih6qv3JfwftohJ
         ft9zo8O78KaUqhsuISNrw9PjkuI2VvISncx0vRatEtXCIJFPz9tXZPgL6k39cOJLjaOc
         TDVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770889319; x=1771494119; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcH9GZLlhn0MK8AoO+gKd8YN91XeUHOY861U71nMAN8=;
        b=aIJC0Yg7joEX+/vHhomf8iCA515Qf7QkHelj5I0DyLE9M/jZ7ICJGhumVbhnwWtcEl
         uUOVXW4+54DDhTDTCgdebuyM0WfrcuQ2MukEdRe5ROUR4P2fSCSXNpIxox8ln0t6Ns6W
         8OzitHY8EwyRulYV1zKZbMVztT2GvZioxD3N7L2eA2ArtzKaj9gMA6RfVbXcKd3Hd4GT
         9fKb1X4aERiJ1Vz5xdxToYV/4i6lGZsn/hZuLM3ThujLQFRYO/9KpJ6AE+yidZ71SZSk
         PjD6rQTmTZJGOaZPLVpAhS0XaXijF67wwkKAJFpo8Ji1K0LmmrJ5XcjorEgGmIhWrSEe
         y1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889319; x=1771494119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcH9GZLlhn0MK8AoO+gKd8YN91XeUHOY861U71nMAN8=;
        b=HTGSd+YvYwgsWCAdSHw/B8ucpgNfqYmmG44H5UdmYY4/ghR2SnOn41qLdbQwVn2sOZ
         Z0gtVn3pyFPmdy/IekgpVKG3Y+VZNURJ3eyfViV0x+Fdq0tMiI5t2pNslhcntP5o0462
         lNDIvPEtx0fr7BnX4QgYRAxD1h83dvbu9llRzg2yPEuXxdrrcyP42nr85fRWCA2C7lkM
         W7MYDqk9zgSNDtA8pcs/UkJ7q93oHp0dGuqxplss6Dtz+hjsjcmlC+pWPM9OsGHUatd0
         6K2akYcLjRPxFMbZkAgChG5mhJbJ++gJ7witA6yOH2dWVI5ghQiPsC3A3rTmk5JAsiwR
         X8pg==
X-Forwarded-Encrypted: i=1; AJvYcCX8J1Vx3nQtuPxcyumyGKs2M1ZY8mXJ1epiSng9HDa42T1Z4xqM6ItWiKS/IFaVHh71yTN+8hJCQU6cAb2XPAHj@lists.infradead.org
X-Gm-Message-State: AOJu0YyVxguV2CnJCN98EN62iZ+ViusaJsvgA16X//rvC2VJWJJ+lBH8
	BzPdYrQorozEBVwSlp/ps6XW1tecxjmk0D35yj6q3qv/uT627oiYTHZuPS18YIBXrQs0fQXN2gj
	GSmlKAuY+pIZ4phfmvKGEG99N8rr3cfs8GJ/7VKJ2
X-Gm-Gg: AZuq6aJTTx8GUPAqRTFUIDZzti7jyRRQNWvM5tV0sQXMyrIg+rhbvI2jHd+T6hWd86r
	ZnV/farY928bG6c/dkWkuXYiWKzQxpQ2bcPetL6+S2dJVFIlCcC+fpGqOsVWU+Kmf0hXWJ7EIEC
	Pc6BQHEo+wLEtJyH2819qfc08u7a32nrw3cJLz4k8qZGx4fNe8mueGtBnekzzQFFNag/Uz5ZYEW
	HDm/WSxFS3AaKYC5FD85xVI+pMA6IvNDEUlbmviVzDrDPMlc2nRSQJDEcfKVTDHxiX6goJtZ8Y6
	yAcNHveu
X-Received: by 2002:a05:622a:4f8e:b0:506:9852:75ec with SMTP id
 d75a77b69052e-506985282abmr2869311cf.9.1770889318777; Thu, 12 Feb 2026
 01:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com> <20260212090252.158689-2-tabba@google.com>
 <86jywib98e.wl-maz@kernel.org>
In-Reply-To: <86jywib98e.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Feb 2026 09:41:22 +0000
X-Gm-Features: AZwV_QiSeFqGPiRC70jpUcnw67INjoq4qSM1niKSMpmtbfB7i8EWB8CCB6Ry2n4
Message-ID: <CA+EHjTz-JU2gDfziCY2SguK9=6gGSCL5TN_U_C7FiZ5i0JTZqQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Hide S1POE from guests when not
 supported by the host
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_014201_419344_CB736FEF 
X-CRM114-Status: GOOD (  39.04  )
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

On Thu, 12 Feb 2026 at 09:29, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Thu, 12 Feb 2026 09:02:50 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > When CONFIG_ARM64_POE is disabled, KVM does not save/restore POR_EL1.
> > However, ID_AA64MMFR3_EL1 sanitisation currently exposes the feature to
> > guests whenever the hardware supports it, ignoring the host kernel
> > configuration.
>
> This is the umpteenth time we get caught by this. PAN was the latest
> instance until this one. Maybe an approach would be to have a default
> override when a config option is not enabled, so that KVM is
> consistent with the rest of the kernel?

I spoke to Will about this, and one thing he'll look into is whether
this value in `struct arm64_ftr_reg` can be made consistent with the
cpu configuration itself (in cpufeature.c itself) . This would avoid
the problem altogether if possible. The question is whether the kernel
needs to somehow know that a certain feature exists even if it's
disabled in the config...

If he thinks it's not doable at that level, I'll look into
alternatives to make it correct by construction.

> >
> > If a guest detects this feature and attempts to use it, the host will
> > fail to context-switch POR_EL1, potentially leading to state corruption.
> >
> > Fix this by masking ID_AA64MMFR3_EL1.S1POE and preventing KVM from
> > advertising the feature when the host does not support it, i.e.,
> > system_supports_poe() is false.
> >
> > Fixes: 70ed7238297f ("KVM: arm64: Sanitise ID_AA64MMFR3_EL1")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h | 3 ++-
> >  arch/arm64/kvm/sys_regs.c         | 3 +++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index ac7f970c7883..7af72ca749a6 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1592,7 +1592,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
> >       (kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
> >
> >  #define kvm_has_s1poe(k)                             \
> > -     (kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
> > +     (system_supports_poe() &&                       \
> > +      kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
>
> Why do we need to further key this on system_supports_poe()? I can see
> this is a potential optimisation, but I don't think this is part of
> the minimal fix.

I did this to be consistent with similar checks, e.g., kvm_has_fpmr().
I can remove it or put it in a separate patch, whichever you prefer.

>
> >
> >  #define kvm_has_ras(k)                                       \
> >       (kvm_has_feat((k), ID_AA64PFR0_EL1, RAS, IMP))
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 88a57ca36d96..237e8bd1cf29 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1816,6 +1816,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
> >                      ID_AA64MMFR3_EL1_SCTLRX |
> >                      ID_AA64MMFR3_EL1_S1POE |
> >                      ID_AA64MMFR3_EL1_S1PIE;
> > +
> > +             if (!system_supports_poe())
> > +                     val &= ~ID_AA64MMFR3_EL1_S1POE;
>
> How about S1PIE? It seems to have a similar problem, in the sense that
> it has extra state. But I guess because we don't put it behind a
> config option, we context-switch it anyway and all is good?

Like you said, S1PIE doesn't have a config option. I thought if I were
to add one to S1PIE, then why not add one to the other features that
don't have config options... It is conceivable that a config option
might be added in the future, but like you noted above, I think we
need a deeper fix that nips this problem in the bud.

Let's see if Will thinks that we can fix this at the `arm64`
cpufeature layer, rather than somewhere in KVM.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

