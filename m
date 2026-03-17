Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D793CFD8755
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwWNJTID6ZXpzh92DfTBNJePUIEHrZBNUiZwgIap8M4=; b=BgykJR1yWxAyuNkcErrhbCXzOo
	RPpHHsgz6swcwgQlsMM8NyhL0Ae2vUG77I8j9DQ1Fp5GHGHoyThACgBzbRhQ026ccTj00l6nOhVSK
	W6tHvnQPWtfevO527r+5BItbKCdbmyVP2oZNcljgb9fLLa7QKxh0seufpDu3hX1eYFvbutGsKolxS
	or04XaRR+h6JH2rsNfeWnvToEwB0vd3xsJcHOLOuH0IuA7mCziW483nNMiC6ro7FAQ/oyrCjcsRlW
	UulyS6MrWiH1mtfafctGM+v1/GZLt/6Ac4GpDYCOZlrYDbqhV/wt3vrTMmpRA2/gTLzkv8yhsI4Ga
	3l65e2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TIp-00000006GzR-1l75;
	Tue, 17 Mar 2026 12:13:39 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TIm-00000006Gyn-1x8r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:13:37 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50906a98ffeso585771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773749615; cv=none;
        d=google.com; s=arc-20240605;
        b=QV44O1Vo3o/x1zKxVWWUn5GTfvSkP2iR5BT/9f6r+IMgTN/gJNrXiljSGcSnFJcNBA
         adUctrPfJuVmIq+zIu+kMmgNyAX+NMmVcNk5mcHcnSvdvmKPz/Lw0PK65XMc8ClXEXZA
         jyMk166nia0DJmiIXO2xAMWO9JxDqDCk3Ki+BWlBntPPqFk4Adt/sAhHnVEDqT4X9V68
         UwDxzfAqnNxTI4ut6/50Nf4pPXQBCcUvExEuMcosn2wHtNczawXa6sGzYigPz63XEP3I
         XDKBHLLTKOYnIue2CZR0CPn0O8MlAQsW412oGPDNb/vJMdMPSwquVnsPqOvbcyibNXIW
         8FHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hwWNJTID6ZXpzh92DfTBNJePUIEHrZBNUiZwgIap8M4=;
        fh=G5+nXMsuixr3+ocrwPu85rbMZIuakWW54IsVS2JhG0A=;
        b=OzuCfhe8AeHOohxEPFcjJaWYA3OySJOaNTxPGomOwkYUFP701dqKnCUM/u9C4AJsdf
         H6OLyAs24MDoisOyhbm0c1Pdf5AL9t4wrUivfX95D8nLyDr/awlD1EvU4jo/vebm87YG
         m3eBpRpXF1EDC4SHff/2sgNWtk8ZiuleNc6U/HMwep/RmuOOVOjn5e7ASkfm55p7U1nR
         lz+Oynz/Jb3Wz0XI+VV8AXOJeoWSQ79WZvJfNXr1snlzY3PWn6JC4hLJhyIUSnjKVDYz
         Y9Fa4AbseQ2Dqt84Q5ZHe/Mo+wLQyAQFS3D1CmClCN4eEqWONwgY3Arr6XAy+gFImCae
         8CmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773749615; x=1774354415; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hwWNJTID6ZXpzh92DfTBNJePUIEHrZBNUiZwgIap8M4=;
        b=ksttR//qfXE4FgZbHkO+cl44bKd173Nvyyvxf+accjFq1rmF9lE9qiAGqBv3ymsod4
         6pNy5DEgnCqxlI7Bh7678UkycBZFx9zTZAS3QLQN19Q/d1OsJI4bZCwxkDTSz9U/Xuso
         tlRq7VqAlt4AIwU2udXQTI5YjIzP1aMAyRM2H37Kt9Vawm7HW7wx/s1rqiZOr0QKJfLp
         XAFZziteCZ5ONyq+bMl9pgpjH7IaUiQosfWMWHPKAVcZArhAZ54NW0XqBQYUlP4ldJ1Q
         0d9PeFmVVntNXbWS5/c72jacoIIwcGduTFzorL8GWEVUJgLWB+Bb9qiG3MuLH+Iacy2Z
         gmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749615; x=1774354415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwWNJTID6ZXpzh92DfTBNJePUIEHrZBNUiZwgIap8M4=;
        b=JyuVZgSBbXBXE0238wT9c2QTp8mRyNIEZDcc5ibamUKhxEeWeWWqnQBRaye7W2M7YE
         VfPISRGcKY20vq1CBa9o9eMT677YNkbmEC65OjPJppDreaMaFrwcdmVSj2Ba1uKeKvGA
         1sIfPGDXL1YOt+JlxpTFmWhan0a4Fn7NPfUnEUmsu/HG1VgswJqUYvWV3sM/PuSaQH48
         QEf7ip8kZ/c2EvnLY6zCyYrMpNvcl2+mGYCVVnoT9ArHf+y08/yaXhl2bYtdYXljW9mo
         2shKRmwJrL/U+L/RIWIWG5G8XLS7KjJqQ/vc1WYGzp8V/Dw1zAX+pO8UghCMW5Teyhe2
         I9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVJJ0JSomm9fPXiDujXMRNFLFna7n/zLqZWZQAhHOlYpXBG6SW4CYBcekswTUGGIOHwNETVYsyYRScipx29zSVT@lists.infradead.org
X-Gm-Message-State: AOJu0YxMdF2+unDxnwN3vGOr0ySG1gm8jUIdDvNSDCEkqVtbLZyuxUM0
	P9Sn4SgKazSlzr+WzYCj3Qgyiim4OhDpcYmwzudAZ1xx7MruAg5LEMUfjZf9R4BrQn02Os2m7/0
	9jzY/CvwMZrY/khANGJb7yl5Sfev8YhtjyPLzw8c7
X-Gm-Gg: ATEYQzwaYnTpOPGMdHwtZ9mYswRaXOQnD5pygjEUIyCQVPfeBC42l1X0EC6RLsU9nXG
	sh1cpfmLhL4Zfc4eEObUrH8stlpRVupN7Y5JpwZfd3f5DIMXgSznFxOMCqcKVSZTxACfVTQTBOV
	UhveIpguiFGqn6ve+eWc+4uF8DsusQkqWFlHKBMiaoZb+5egWyCmmv753l6KKqs6c46q5yETKpN
	Kn28iHlWYw5zQ0WJM1kbWEHgVEigNSFaYv2Yqx82Z85BGA1Euyr2fPVoTm53HGLNr49iwBgXQXw
	2c50obKX5qJUUr0w9gjiZVfjmG3112+wvCS9
X-Received: by 2002:ac8:598c:0:b0:509:25c5:42b4 with SMTP id
 d75a77b69052e-5099ae752a3mr11728141cf.13.1773749614349; Tue, 17 Mar 2026
 05:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-9-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-9-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 12:12:57 +0000
X-Gm-Features: AaiRm52d-_Ix5WYeihZWEM26ba847CqKWtem_pAtFTeh0W9v9Uwl5qcj1eW1Z_k
Message-ID: <CA+EHjTwHGkTjB1vgY3UdC2OpbAS3i5yCH=cbLNu38uBSmOxarQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] KVM: arm64: Kill topup_memcache from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_051336_514152_79AE8A9C 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> The topup_memcache field can be easily replaced by the equivalent
> conditions, and the resulting code is not much worse.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 11820e39ad8e1..abe239752c696 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1712,7 +1712,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>
>  struct kvm_s2_fault {
>         bool writable;
> -       bool topup_memcache;
>         bool mte_allowed;
>         bool is_vma_cacheable;
>         bool s2_force_noncacheable;
> @@ -1983,7 +1982,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> -               .topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
>         };
>         void *memcache;
>         int ret;
> @@ -1994,9 +1992,11 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * only exception to this is when dirty logging is enabled at runtime
>          * and a write fault needs to collapse a block entry into a table.
>          */
> -       ret = prepare_mmu_memcache(s2fd->vcpu, fault.topup_memcache, &memcache);
> -       if (ret)
> -               return ret;
> +       if (!perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu))) {
> +               ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
> +               if (ret)
> +                       return ret;
> +       }

Further up in user_mem_abort(), when memcache is declared it should be
initialized to NULL, since prepare_mmu_memcache() isn't called if this
evaluates to false.

With that fixed:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
>         /*
>          * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
> --
> 2.47.3
>

