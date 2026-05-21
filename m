Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C358CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18hrApFzZzgIN45e6vff/pwk8Jz+2gi48Q/A4BxGBa8=; b=KtOLjKmNGb/Wre1B9qTewpDAJW
	LYDi9+06t07fLkxUIkOncHJjYHXAkP7KJv0HwrI35OmHF9qU47CpumDmwt6p0SEUx5PCwSQ136L+o
	i1DlU3AcysgmFFpPrpWItEss3xXlT344OEF6Ih023UtU0mM+esh0yHrpnBqBtecTgOacdqJJBPhWe
	9ThZRdA6Qd1aau6NFCm9QRZSUQJ1UE6hvF64QdJgAjN0EPt1HLdAXKnTyDhabyPxeSrNahYRkbByW
	SG0x9YtoeQHzTrvhU5yB/FHPUs+1prIyUNKMu+ykhRw1fhUOM62ECT8qAcrjZFNIRK3Whee6SEUpK
	V166CEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38S-00000007oo0-10mf;
	Thu, 21 May 2026 13:08:24 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38P-00000007oma-2O8J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:08:22 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50d864c23bdso22071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368900; cv=none;
        d=google.com; s=arc-20240605;
        b=TR/h3K4hM2D3n0CUbW0ClNzFB1u1jw346JgX8uTOTPToAThzq/QvyUkHuIm7wZofiF
         mQfxG+2W889iUPFOiScn0RTcBOMShCGXj6zisxSpB1m2nUFEA1KzEYgpPJG/P1vpProL
         lKVb1uJoblrOlozQGk/jWl4R/bzNpgurK1wYSIrTco7qJl6t2noHpaFOPTyB6cRi5OFi
         0UXUXibnGOpj89t48WN+ce26WkSU2t98fUntNgYO4eDLyYEICYx2zF9hj97H1qrGS4TF
         q9VudzBSuotJjBIBFTtGrdq2DHRloELPTnJjh8/GdrgWVykVpitXf11Nnnp2URT+9atS
         0/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=18hrApFzZzgIN45e6vff/pwk8Jz+2gi48Q/A4BxGBa8=;
        fh=UiwTx3W6friBuXrly9S81xcyWuPj/BSRGlC5QJ9wBpU=;
        b=F1W7S4TEhsq630KAcEF8VCgi+hJIS1OodU9O9A1RWUk1t1gsAnFw28nJf5h97rEOLs
         mhFQkU4K8LgNhxaQxidf6G3pEi3MxTtbF1k7xfSOn3PzBbgdB7h55VIVnlM5avNY8z/R
         cn9abRxbGEcavi5M6aQyShEvoV001P0Jbs67G8R7MmkZn2ojuAWhjgMXkBclEqSdfm+a
         pgIbaFt5n0E7DHEyPofPsOpBhv2oVfisbq57jRSueIRp1yieUNfrNempE2RFfth60S66
         vPWpye0H69N5eeVXkMDAHsDDbCrJeEnpa33v1UhMUY6vg+aHbaTi7Vf6znzD+TUOyts+
         GfPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368900; x=1779973700; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=18hrApFzZzgIN45e6vff/pwk8Jz+2gi48Q/A4BxGBa8=;
        b=gpcdC0LbJoObS5279EgsLSR0zPt60VcK8W2fXkf5apwMZuU9flHGNBO92c9+48+Uou
         O18HStuq61jtggWeImQlmp64l0op1aPFokYNdeAum/Oko8CyxTsvUBgvG/dLIUuCoeq6
         37WmhyIxAN4LU59TN8599xrc33G72lXvLaSbFboZ1LTcRzHQ6nhGA0GPed4sm8n2GqUa
         9j6oqYa9BIueTJatS2kgMW53c3CC5IZ/63UjQWzIUNForRgnacixrd4aUy5BZuNlPDOY
         zJOEhgeDdXwY66D5ZYJNDmaMXb5nNRyGhVKblDd4E4Rcq11QIaNCyTu0rUNnh5UCuwct
         gkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368900; x=1779973700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18hrApFzZzgIN45e6vff/pwk8Jz+2gi48Q/A4BxGBa8=;
        b=Tu4GVpqegBbzQU0tw84ZKaVC3qF7CCfBl8iuo9/OGAitfPyBOWusuoR1NxZ5N1Xg/8
         4M9jYvaW+STpY85EZttq5+ASKpZohWxuGZv3LtO9/XByREZ33gd1iZCl6TR77uJB2CtE
         U9mpSg4NjrVETH8XBeAa2iIM+OI/gpuz5pKbg9u+VEjqYbjhd3gKaOR9JVvOH5HBqlnW
         Wot47sO4PTLY0M7WXEgzKpafNc15pekGjMgz8p5yZkPZUdWIqVftqJtHYWDCkWgWJ2LM
         GgXcZckoKV6hqQSzaC6LMcyJTqJpK2Lr0QmWOfjcHKy/GgJ8sRcq57unRY8uLrajfIYu
         HHPA==
X-Forwarded-Encrypted: i=1; AFNElJ8vTbOgEvXG9N+m8q5yhxz2nhBq8V8Fis5S/ZcKp26XX6iE1N6rCQMnJV/eiXa1/b17V70ipw0wXjAtSDvETzoF@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEgo/SeujSpV7Y937jSKcOHRg4JnqCDZutfeWrTu9gDGUfbC9
	qru1PkRUadnAVQSai80046DfU86/qfCAR+nVDihM6XFWSGG9YOrj2PGtU+ZUuTyUIjdxvA2tYpC
	5UrMiEHwDn5USRgCtVeg4bzzUhzx1+c+hHxRc0WVv
X-Gm-Gg: Acq92OE0vU4L8sU5CYMDZUDvuiwkCYlVPDEIl5s/xcpjxVZDs9ug4ldn+RHaUBQAYsg
	WsJk4uWLfSEeVASTH6DlqU8iHSbAiPK0m1tJwz1W/jE1DW5KJKE9b4+Wqiz6YvYqmiazhnrum/M
	+jU3Z22LOApESs19iKt+FuFWeY/IWuJS7kE7qzIdAJJ2r7qQCS+JyjQWlJmAn1zMsLRKzIHVyr7
	gLwSoxypaLjnizaDu0Or32E+cFdyY9G24/UrvpXdl3MXArvCTYnle3Wuah+yGFc+TVtbqgwgMr+
	k0FrFLxPJijQrjcITkY=
X-Received: by 2002:a05:622a:a94e:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-516c552fa38mr7271331cf.22.1779368899622; Thu, 21 May 2026
 06:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com> <20260521102149.804874-4-vdonnefort@google.com>
In-Reply-To: <20260521102149.804874-4-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:07:40 +0100
X-Gm-Features: AVHnY4JJsPwlriAMlvCiGKk44PSS2scCNoIlEjeGoEEyPmlqjyWtKmSwSdabchs
Message-ID: <CA+EHjTwVF8k3EhTCqQNU-zcK1+1ctLE-cEBHCWzgNtudW1o2kA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate_host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060821_615635_FE3022C1 
X-CRM114-Status: GOOD (  18.83  )
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

On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> A previous bug in __pkvm_init_vm error path showed that the hypervisor
> could leak refcounted pages, (i.e. losing access to a page while its
> refcount is still elevated). This poses a threat to the pKVM state
> machine.
>
> Address this by introducing a fail-safe in n __pkvm_hyp_donate_host.

Stray n.

> Transitions are not a hot path so added security is worth the extra
> check.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 42b0b648f32f..bb97d05b9b25 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -855,6 +855,16 @@ static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_pa
>         return 0;
>  }
>
> +static int __hyp_check_page_count_range(phys_addr_t phys, u64 size)
> +{
> +       for_each_hyp_page(page, phys, size) {
> +               if (page->refcount)
> +                       return -EBUSY;
> +       }
> +
> +       return 0;
> +}
> +
>  static bool guest_pte_is_poisoned(kvm_pte_t pte)
>  {
>         if (kvm_pte_valid(pte))
> @@ -1053,7 +1063,6 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
>  int __pkvm_host_unshare_hyp(u64 pfn)
>  {
>         u64 phys = hyp_pfn_to_phys(pfn);
> -       u64 virt = (u64)__hyp_va(phys);
>         u64 size = PAGE_SIZE;
>         int ret;
>
> @@ -1066,10 +1075,9 @@ int __pkvm_host_unshare_hyp(u64 pfn)
>         ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
>         if (ret)
>                 goto unlock;
> -       if (hyp_page_count((void *)virt)) {
> -               ret = -EBUSY;
> +       ret = __hyp_check_page_count_range(phys, size);
> +       if (ret)
>                 goto unlock;
> -       }
>
>         __hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
>         WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
> @@ -1132,6 +1140,10 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>         if (ret)
>                 goto unlock;
>
> +       ret = __hyp_check_page_count_range(phys, size);
> +       if (ret)
> +               goto unlock;
> +
>         __hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
>         WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
>         WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
> --
> 2.54.0.746.g67dd491aae-goog
>

