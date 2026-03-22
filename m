Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D22DFC72CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuR+54+tQE6XrGnnBxOq8qWtA7CinZ4OjktX2EB6ezY=; b=exToauen9si893+YWzgk5a6Gde
	v8vJw2UCqGN0u13JRdkbrGiL2T6dRXD0bHtkwOh8Jciq93yFtBSOWAccWuGvCP6zp7wA9Y4JwEl+S
	f/EYXlVDoldxvVA+FbMilewzz0jzj92ecbamE1cOrsEdRSj+A9XL4JXn2lbbzkq3GtZqflwNDSHn0
	PV3/fz2+022eWuXt6mcdWcC0Ma0zi55SdCexNgXKIo1T79Kt3lLAXyuDMvmyDTDRto2SQvK0byEqv
	4jjsYe1BDIviNBhhp9y1ju5rNQxzy9CAK/bgVAn7+b6drNZQRdljrcsCzFzffMcdqLHBtft3h3qFv
	8o2voCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KsF-0000000FSin-2BzV;
	Sun, 22 Mar 2026 15:37:55 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KsC-0000000FSiL-47ta
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:37:54 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509069a7a7fso796331cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774193871; cv=none;
        d=google.com; s=arc-20240605;
        b=TwfmQzBbNk0oxeeWi6jw0O09vAVTLQdtt8LZi+wPSeg9r+bCHN+NNVZlDvwU4cwflq
         EeuCUg++/d4JwioxA7RR6ABcmEvu9Wv1Pzc8pLYMiuVlqtuOgaUMLHa0u6RKlN7kEa7q
         xWcp7Xr+ebf/WvUampJSZBdTQ3ykPY9PgEywwIb6al7JIS1DMNxip96/xIXwUQzEBdCw
         lXt46DjCaxnHBdAXpg/OjmVSnEjwfh8isyPdgEkr1m9rLevGc+VoPNk3YLu3Hcyx4W7J
         OPd5iz8COBUJ98U3w1hFanOn7nJFrLH9dj+HudveaH5RtnFIGmo3DS4Bo//jnl87tTDz
         Qvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fuR+54+tQE6XrGnnBxOq8qWtA7CinZ4OjktX2EB6ezY=;
        fh=gTmFPTvPJt1vZXOErf7i4OG3StfZZVPpk+TckzRYIrg=;
        b=I9EeO9vqgP4kzmFPUjAsE1l8xWn7UcaMCAxh+09vsyFIAMOI7tfQ5+y0peMCRKCTZS
         PoDcsplB4pN9tAZZ9xHWiXmVWY4rXX4YPmwxceJNLzxKRZ3r+VFn6kFQAkxPu5LS2QM+
         uFRLSy61mRAVwV2mWvO1sGP9lK37QIYgEM7zjdgfJT/eeqEjR9977JgCMlWJqTtcreJM
         vcksnVJxzaTVjOgtufnJaWt54zOtYX9gfzzhfaagNZaiQTzgiNvgSvz0fXRFibK2LV96
         UiUwK0c9Y6q3FG5ZabUFtGgzdxjTLJVQ7DzHDinN0T+++ak3Gq6ArSUjaA46E9tSv2oA
         WPhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774193871; x=1774798671; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuR+54+tQE6XrGnnBxOq8qWtA7CinZ4OjktX2EB6ezY=;
        b=aKGAm762hGdrs9piS2ZlQ3gzur3HcZXs2iVszRuyjTj8pLmwsN8Uom27wA+RNru/5P
         gwAYL9dwyKD5hEVOoXC2ObSrTHdqzi1CeNYPNdn0Hi1p1E2Yj60ZFs2dvJvImPTX/+99
         FlAIIwMdmStBJgMoexa41Lt0kBvAfeMBwBv3at4TvDjCamuqMXXIIxFl8Oz9QXQN0Uor
         KoKTNEEpGiWAfcNJnBiJJXdPD5JPUohcA6w/KffyTEU99oKhZ/gjlyPzRDYy9g9m7E3r
         BiDpXuCWPGZbeWzUxCtzCORg11P5I5xwyHPGFIjFl7gVHZDC0OlFoT5t/Kxq/lU/dnA1
         0mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774193871; x=1774798671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuR+54+tQE6XrGnnBxOq8qWtA7CinZ4OjktX2EB6ezY=;
        b=cuyQp0Gtmak1ma4YTAs6YTi9SmcvV/VvsU4g5GCo9aJSpkCw++tplegvpmKeCH+V36
         YXWJZdzePVoKokJiUP7ZzbwaNyOxlFxCNVJ/CAYmWe1z3yhDdRovOm6riMy4+As5Kapt
         wJJ/vjz5Ks4UsHr6K74MDJe5+65u6BJVgy3KqwCJJbGjflu+qNlzrXLLr7jdGn+Ur+EK
         BYV0mIjsxSuafG3caWBTcqZsuyYEhz+pMPkQeqo84wEbT+J5kk8KAaR6SdkkPTvsOXPX
         QaD37upddcgw6yPZTZ4/wl06LB64sGD5mT/WzAdq2lpend9xZsQeVO+4V3pricmRLA8u
         1M0g==
X-Forwarded-Encrypted: i=1; AJvYcCXitfFACFJKPF4pkWplRy9YknwIaoQ4R2WR6P8CNgcphVs40MvwtrEjAiT3fOrI6Xot69CeveHb+PSPfiELuj8U@lists.infradead.org
X-Gm-Message-State: AOJu0YyXjVtX7Hu6FleZ8zWMKoTzIyg+eibe8zwvR4Vm4eybMu2WaBf5
	S1UZ29Y3BsywCASUapYSkyMZF20RWUk5VGpPS/ST1aeSwmzS4Sba6Xy7zfLs5RyvJ1J4WC51NCf
	bq5SfAMdDaqHlcrj5Eg8S9/eUB/BTOsisFb3UpT/0
X-Gm-Gg: ATEYQzxMwxuCpaNMeD1Vp5CpNX3HZNvTeJrCL19uBBxQPYJ/fp+vf91J+JbjJJ+xS+R
	z/BgeKltEeH4GK7ONxgsYG1xUyZgsr64QEsZWweNtuEX/523bEhehZK3A9MRnxsHF3fS1yr4MzM
	A8pViLGG4mWFg8AW5JBOpApDR/adjioqlySeA/SDG5PM36pAORE+k53KKnv70ACleH/n1ODvP9Z
	iboptUKROm6OMCrOT7vnpTy2gjfezYFRiiRSF8lbDGLvwNhDM39yQBeip9vl3TRSxylJHeYetQt
	cbpnD8VY
X-Received: by 2002:a05:622a:2d1:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-50b48062695mr17650241cf.3.1774193871175; Sun, 22 Mar 2026
 08:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <20260321212419.2803972-3-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:37:14 +0000
X-Gm-Features: AQROBzCYF63bg2F-Z9cPsy4KXnsrkxV-B-1xhNDq36LfpfgZNex4zdlpfFtoy30
Message-ID: <CA+EHjTwfVkT4B87jn1Jhko=kf2us-1S4kCzj+stEOAm6ugFeAw@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: arm64: pkvm: Simplify BTI handling on CPU boot
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_083753_053756_B8DD51FF 
X-CRM114-Status: GOOD (  20.76  )
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

On Sat, 21 Mar 2026 at 21:24, Marc Zyngier <maz@kernel.org> wrote:
>
> In order to perform an indirect branch to kvm_host_psci_cpu_entry()
> on a BTI-aware system, we first branch to a 'BTI j' landing pad,
> and from there branch again to the target.
>
> While this works, this is really not required:
>
> - BLR works with 'BTI c' and 'PACIASP' as the landing pad
>
> - Even if LR gets clobbered by BLR, we are going to restore the
>   host's registers, so it is pointless to try and avoid touching
>   LR
>
> Given the above, drop the veneer and directly call into C code.
> If we were to come back from it, we'd directly enter the error
> handler.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/host.S     | 10 ----------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S |  9 +++++----
>  2 files changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
> index eef15b374abb0..465f6f1dd6414 100644
> --- a/arch/arm64/kvm/hyp/nvhe/host.S
> +++ b/arch/arm64/kvm/hyp/nvhe/host.S
> @@ -291,13 +291,3 @@ SYM_CODE_START(__kvm_hyp_host_forward_smc)
>
>         ret
>  SYM_CODE_END(__kvm_hyp_host_forward_smc)
> -
> -/*
> - * kvm_host_psci_cpu_entry is called through br instruction, which requires
> - * bti j instruction as compilers (gcc and llvm) doesn't insert bti j for external
> - * functions, but bti c instead.
> - */
> -SYM_CODE_START(kvm_host_psci_cpu_entry)
> -       bti j
> -       b __kvm_host_psci_cpu_entry
> -SYM_CODE_END(kvm_host_psci_cpu_entry)
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 5d00bde092010..55e0dce65dc56 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -213,12 +213,13 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
>         mov     x0, x28
>         bl      ___kvm_hyp_init                 // Clobbers x0..x2
>
> -       /* Leave idmap. */
> +       /* Leave idmap -- using BLR is OK, LR is restored from host context */
>         mov     x0, x29
> -       ldr     x1, =kvm_host_psci_cpu_entry
> -       br      x1
> +       ldr     x1, =__kvm_host_psci_cpu_entry
> +       blr     x1
>
> -       // The core booted in EL1. KVM cannot be initialized on it.
> +       // The core booted in EL1, or the C code unexpectedly returned.
> +       // Either way, KVM cannot be initialized on it.
>  1:     wfe
>         wfi
>         b       1b
> --
> 2.47.3
>

