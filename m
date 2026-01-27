Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE506D2FED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/fdw3HSB7m2kNlxcxEsVX9/NQhTkjGaXcMCpnvtKt0=; b=J3pkhZJf3L+7B/x9rdzYE0QUQc
	b3U1DU74r2jS+fQdJMPeRAxRBIQjJDPJDxvHZQStmkMphrpXsaKb6KYqHPWLcU2qJs/9C1K7kOIjd
	PruFxA+1UHF2FI1xYPnNmc+Ntk+0EZyuPbTx1jqULd06BYkYY4yOESVFkfbGLLGN2IudQudM7LaXE
	DxauAC6gw+ZDE1Yx9h+v4Uk9/i4QwqvmL75NAwbij3ExVjCAb4lvWLvdtdQzbSeRU2iyOhjKjTTjj
	3tJQU0IPuYL0UOiEbCEIuXioZfJoPRP5+pOXYGQ0jVQqmsnW+cjes2Q0T3DyOIbUG4OczOhYpHnyb
	b8/Pi1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknVk-0000000Emvu-1xbL;
	Tue, 27 Jan 2026 18:09:58 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknVf-0000000EmuI-2oKs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:09:54 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5014acad6f2so17891cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537390; cv=none;
        d=google.com; s=arc-20240605;
        b=VrT4Gw8ESDdl8ZYKa3SxpwRrbDBSoWD7/Lj5fsMuO24i/wZ0Xh897URV58Cl1I01pH
         kgsXnGHbaOTr3QnKA2YqGfLvnr97sJlvfX4KwQUUpcVoBGvZgsopkk6sWqlG84TD3zqH
         px+9hoKjkalCPcCSKbEqvP2NuGjWs7iBC5qrLTIng3H/bRR3TbvnAaipFWiGa9oTuQm/
         Rm3+qyXY728DrOt0pKd8+nxZSuxh4cGZtZYROm6H8sy9dTertI+sfDRxIT7G7HQ4nTVv
         v5vKasoaMRpETX81B/s1sCkkisLsDvq7JUZWwFkXEhMs/5hfKnJzA509F2b2SWDENU5h
         pvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A/fdw3HSB7m2kNlxcxEsVX9/NQhTkjGaXcMCpnvtKt0=;
        fh=jG2yKzhIgEwLTC/5VcJ7Vvd7RzKCmv73Te/75ZX/Euc=;
        b=Lvdwe8agQc4gdoG9MSsBFRanp3FJ+1+u2SI3J5WqFX91Tilqc7/4Y6jGBtRODhHuIo
         hWqiFTLuFZ+LmhxZFZhZjShLEYkGn45IyFDb530L/jEvIYxvWvZZHNEZMmMddETxFg8o
         JmsLoqREkJEoTYTxbk4vY0g/LWOAZCLQvSx6bjZAV8mI0KPKWmnFa0zMI8Ej56v6c3+X
         /rgF6nvcN7oD2Bl4qLVmX8lJEfzoZ0rP8gjcYesJHOC2MDw9JC/Ak3pwMoOS9MCs+3IA
         gwUz+A8Ipjxllgedjk59e4+7O8eUFTl7JVadMoQPjQb+LrZEwnFo17xQkJaMnFHAk/k7
         O23Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769537390; x=1770142190; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/fdw3HSB7m2kNlxcxEsVX9/NQhTkjGaXcMCpnvtKt0=;
        b=RpGtKDhY6NUdp5VdnDVYW4uTChmVW4bs/BxvA6Dw1sM1yLnq8LP6pWjz+76bfVe+8Q
         5l/kUAoFUvez8SdfVlsZYBP2oP2nny8971gXrgo5WrSmSDHNSXjqBf1idW6ULiSkWrYt
         +ypQtcwB26LV7qR6C8OZwvyfWRZwFoW9UYRU3QZG5kZLj38b5HjD37aTsYdS3L8vb7IG
         EQHhYCGJrhJnOmWXX/PB2SZ5SHS1T0O+BShy/gp2YnKNKz3NCFNBRjWA/AUweUZgMBsH
         AWydF6btsFXIbjH/M4r1IQ2TdvXOUbbVlEA8eHl+vlgpXHpT1P+7P7fQX4Kk8VEDM4RY
         jkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537390; x=1770142190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/fdw3HSB7m2kNlxcxEsVX9/NQhTkjGaXcMCpnvtKt0=;
        b=Qz9mEn3/E5CmCG1SLOLtkQJ6uMOgbyHrvMV2HVGeaJHS5IcjHlra+38oJKlqAy3wfw
         O6sbNfnZIsjDcIySfhsrdXEpJfu02N3GC9CiXbrgARlkaf4Wst/eCavjDVwbkYOmI954
         P/TconRKWoFOyZUD+aFfaaP033ux1SxjaVpkABnxHRMprYH+i4fyP9yPSnsReum1fE9y
         yT9GfQdMUxvMg6rih2Kln3SgW9Jr1S9khLMcMJ6JJYxvf0l6UtDFo9whGDaZDXpx6htt
         B75slyY/kfKB2gVAsrgWJ3NlX2ZNJDrZVuyJt4pBZ8E4WjrSNRkCZ078bpH/whA89W2q
         2Wzg==
X-Forwarded-Encrypted: i=1; AJvYcCXjg2qcFOmmvQoYptmGDJwnJvMDurv33WRpw/wWdt6LWImYCuemLNziOgKMKcOWTdjcBUTpuQw/h3niorG4l00C@lists.infradead.org
X-Gm-Message-State: AOJu0YzXS5Dp5vFytpeE6oBwReVSHk7ADYQ0rw/SHueV5aHNkfLvPtYw
	E4AetZNgDEfvaGaicojDusfIze3x+XOevTeieUPxddmwJTX2PKZtPFM3ngKMi7vs5RA/7gdEpQo
	kXqBpTZdABctEcN7ieLZ8cauLXOTpZhV6tnIyAk51
X-Gm-Gg: AZuq6aJOtHdTmIMIfczcsk5tf4I7hpTU7KOjSwi7TEXMMDxDKXslHeK/TW1LtW2Lu3y
	cBWmD9R7c76j46aVeiRzzlPrZksxPrGYG+iOYO1YEMeBYyJ6XdsnTgU3Qb6jyl/x5MUU6NTJ78e
	ndf9YvcaoJKzzVvrDgytVcWTTfxNeEwTd4yl76Oe8nn0wrrIGXSckr1i1Ii68c+Pdi6sXnPmLUb
	rm4IT4nhxhXt+4VNgsvGoweu9ffEni2lOWmtOoT2/j6VJvpk7m/ZwqN6GzvOxvkkyjrZiKl
X-Received: by 2002:ac8:7d55:0:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-5032f4c7f16mr11147521cf.12.1769537389984; Tue, 27 Jan 2026
 10:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-10-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-10-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 18:09:13 +0000
X-Gm-Features: AZwV_QheZWlu-Uzsp1OFbCkpBH6_EN7Esc-S0xm2N0aOTBYMl0RK4FXDHy6Zuj0
Message-ID: <CA+EHjTyQdLO3pk2yqDDptXemRSFJmt674P_H2-VtWC967o-c3g@mail.gmail.com>
Subject: Re: [PATCH 09/20] KVM: arm64: Convert HCR_EL2.RW to AS_RES1
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_100951_716225_AC6D2670 
X-CRM114-Status: GOOD (  17.52  )
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
> Now that we have the AS_RES1 constraint, it becomes trivial to express
> the HCR_EL2.RW behaviour.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/config.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 68ed5af2b4d53..39487182057a3 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -389,19 +389,6 @@ static bool feat_vmid16(struct kvm *kvm)
>         return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
>  }
>
> -static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
> -{
> -       /* This is purely academic: AArch32 and NV are mutually exclusive */
> -       if (bits) {
> -               if (kvm_has_feat(kvm, FEAT_AA32EL1))
> -                       *bits &= ~HCR_EL2_RW;
> -               else
> -                       *bits |= HCR_EL2_RW;
> -       }
> -
> -       return true;
> -}
> -
>  static bool compute_hcr_e2h(struct kvm *kvm, u64 *bits)
>  {
>         if (bits) {
> @@ -967,7 +954,7 @@ static const DECLARE_FEAT_MAP(hcrx_desc, __HCRX_EL2,
>
>  static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>         NEEDS_FEAT(HCR_EL2_TID0, FEAT_AA32EL0),
> -       NEEDS_FEAT_FIXED(HCR_EL2_RW, compute_hcr_rw),
> +       NEEDS_FEAT_FLAG(HCR_EL2_RW, AS_RES1, FEAT_AA32EL1),
>         NEEDS_FEAT(HCR_EL2_HCD, not_feat_aa64el3),
>         NEEDS_FEAT(HCR_EL2_AMO          |
>                    HCR_EL2_BSU          |
> --
> 2.47.3
>

