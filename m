Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA83BD44143
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U8+dNznpFslZOt3jZDGf7JqED9dm8pLESuGBInwRgU=; b=tizm6Wm5TxWEJpfAOtzIOkjper
	Zc9dvXEd8gsrq5awdPRHpmYHtf7YKUjwHL5pWR61lVzBD0YSBeoVkyOP56K1OniBDheepdXoJFl7k
	hE1Fh4DCE2rQt2m5UQWm1alR8pVSw0icDC43S3uRTwD508sYPPUwpPry55nnPmOGLyhdKANtgtbGl
	e1hbL2XfVqWDURY58GObYHN3k2dwLv9qlfK7/CFCFbeCzGOTyJZ5nuor/WwkN42TqKdopBMPLFJYW
	9RpMdUo0vu/hM3H50s3l8/CsNvY4Slmw8m18GZFA8kE7ZKXfooz4D8EtK/HaYVVXE2QVpHbOfBmYD
	0T2eisGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTy8t-00000000FCh-27Hx;
	Fri, 12 Dec 2025 08:04:47 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTy8r-00000000FCC-2Op3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 08:04:46 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee243b98caso804241cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 00:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765526684; cv=none;
        d=google.com; s=arc-20240605;
        b=ig/TlKjxH3B20ORr60mrPg7OVuddoirwff2MRYGFJQKeGyJn7tIT41p5xVWj9xSFQr
         p9JNf1819ptqwbMBUfq6rUoyuOeDdRrF4r+W2tfRAGNPeT55ClrLO6i7SXf05MxGi8D0
         q9TJMh0unSMoDl8d50s9ENaajeLISemFpDZEBTThCkNXIMuXn3qUB/2xzQG3zpWGFEtP
         3lEwAHCLr4cxcf2+75QefAfy2bGmmN5vszhFjFen5zX8vL/jcZg7UZucElj6dJ1uEEdy
         n4ArhOFFSnBniNtb8bQmGnHNdXcxuUumQmXKvcF8rCtFBzr613qC6RlZtwHgACVE27Qy
         fSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+U8+dNznpFslZOt3jZDGf7JqED9dm8pLESuGBInwRgU=;
        fh=fu4lLjOusQUhUPuo0reijr1jAKDgUgWNw6tw8SH52kE=;
        b=DkTBYJly5wsQAC4ytzYv3d2wPS7mnLS6itszJ1CqyHsXwbSQMjrzCT/xfQELvnygA1
         OQek/g2D6q9nblwyhwxyUT5rGdYDQM/xi86y5I31XsOGwC0KRoVKxdkpufQQz1Jg2CQq
         YRgPyGjlt1oQJEwR6ILVhII0WbuNrAH6uH74ZJIZEL/V291/YIPmOub7vqKH6ia9MUwQ
         Z094tRa4rWnYpVaAoJZmRutMMHDzQ75bwHQIhEgsrT0hWJwMsruJ5oZN7MqIp1NPJRtd
         0vhb6oUvlzEOJ88uYBvcy7dYr5VJUyuGkhwUh4JA+c8WV9mMk8/4+/L9csix8DGJUqDx
         qSWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765526684; x=1766131484; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+U8+dNznpFslZOt3jZDGf7JqED9dm8pLESuGBInwRgU=;
        b=ZCRdmBlgZq1iTkU5Vw48Wwedq7yvoGES/6JzrQjyQcrGyVAyKEZJj/ptiAmCAyebx+
         chwdsVi9TW5dS0S7EuqcVEilVNVgPxOi9XgOSs0hHYQfXk1Q7Q5hkZXudPuFHunOphqo
         2Mu/m6FBZs75Sa4sP7ihDKUpSH4u1c0Uy3SY6XmpfiC3wxk6ehGnqsDR83tmTHOD2z4s
         6DOQO2cUWDYnjbADwELU+qr+gCApVGPibtMzkHsyj6JuTY2bk6FHG4UKk1Okqe5OajVA
         FOMU0bJtCLoo/AafvEx/WIM/5B2JRk9OfRpISAmjWdwUhwf9K1kTQqubfj8gafRlhDH4
         0P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526684; x=1766131484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U8+dNznpFslZOt3jZDGf7JqED9dm8pLESuGBInwRgU=;
        b=K5LitwtifMywX7sF5sOr1ZIqHj2gq9pthb04BJIWamGt+N2NUSH/6KJCTpWHq2iWBa
         KMt9vR3eXrGhfOiX0UsH4ctEDbwCQI/oErxsKZq5yJ8b9ZDhNfCS+vq54ZwPWgFaA6sz
         mMB0J6f2OyQKvVksKobcueAJN/fNTAMmCnc26eRncFcAC8xkuHAXL9chaGRWa/s8QXJA
         Cif4MCv9/02JuCtuXPh2xokM/8SMI99c19PAMouajRGqnFWd2l2yIrpSz7aiz52B00c4
         4gfN2BGqbVAKumo8xnERzmSYFTd0jY9fCA06XATrJKv0B0q+KvkPsXUpOjCS3yhLfuvX
         EqFg==
X-Forwarded-Encrypted: i=1; AJvYcCUYfBzBRFsll44VVL3m/g9G+3ldLh6UA5Zs7ZEk1yCU1Cox7GXT+k8xIhOQpIElkH4/yKenHcF3JXXsIajmaktk@lists.infradead.org
X-Gm-Message-State: AOJu0YzLen9lcJXiicjNdXnj8R+Y2ycNT0RljK10IWpHja9Ya4enL04z
	opEdiXkYHehp4Nbyo9qEz64WQUke5nxPtKoJ4GLB8rff3Ef0UD0bwnjS1FCJFydzEZwQZTPvQrW
	aaDe4zeoE1NuV92Cj/Nm6/rFQkWPZ7p3XXIXpY9UF
X-Gm-Gg: AY/fxX7Stf1RH7CVmaUg1YoQakxkQ02ZfPISbOvbBD0paJinE/WpIJJLaHTwjDoJVVO
	SV0fhn1/lQVb4uA7RFj0yI71b4DmE0D5ba0b3Iu2MD83SAkul+WE3DUrAFzVhIj9lxmZL2lfgbA
	ueDIo5/9yLt+et+7RbYv1scm4q/iYcHQZit1MvLPOSHPQ/1dEfnij1jswi1xeaRHZxoqV0uk6pf
	JFqUQJynanALEtXSxnAZioQSB7eJJcyuDBIJt4FsS2TutJsaLCRsAYbDgmMA7+piyXk8lkd
X-Google-Smtp-Source: AGHT+IFVdi59OsP3fmwvGAVvHEYCwmSnxEeO5zTktWlzni97TuZa78q8LVRVlb3nurJBxIY+bjfeYS+tgZqGnE3/N9U=
X-Received: by 2002:a05:622a:4d1:b0:4ed:b665:3779 with SMTP id
 d75a77b69052e-4f1bd956c90mr10154741cf.16.1765526683971; Fri, 12 Dec 2025
 00:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20251210132102.137631-1-alexandru.elisei@arm.com> <20251210132102.137631-2-alexandru.elisei@arm.com>
In-Reply-To: <20251210132102.137631-2-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 12 Dec 2025 08:04:07 +0000
X-Gm-Features: AQt7F2qhTzwVzsydho6e40R4qIxakCmrjVFzoPGIgOsInIjz7_T83i-YOn6fwUU
Message-ID: <CA+EHjTxMmNrJT5-biZJDiTE4E5RaKpr+SGuj_jnpAfsbxzaR3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Copy FGT traps to unprotected pKVM VCPU
 on VCPU load
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_000445_649695_9FC08CBC 
X-CRM114-Status: GOOD (  22.73  )
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

Hi Alexandru,

On Wed, 10 Dec 2025 at 13:21, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> Commit fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
> introduced per-VCPU FGT traps. For an unprotected pKVM VCPU, the untrusted
> host FGT configuration is copied in pkvm_vcpu_init_traps(), which is called
> from __pkvm_init_vcpu(). __pkvm_init_vcpu() is called once per VCPU (when
> the VCPU is first run) which means that the uninitialized, zero, values for
> the FGT registers end up being used for the entire lifetime of the VCPU.
> This causes both unwanted traps (for the inverse polarity trap bits) and
> the guest being allowed to access registers it shouldn't.
>
> Fix it by copying the FGT traps for unprotected pKVM VCPUs when the
> untrusted host loads the VCPU.
>
> Fixes: fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 ++++++++++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  1 -
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 29430c031095..ee0f1343100c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -167,6 +167,7 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>         DECLARE_REG(unsigned int, vcpu_idx, host_ctxt, 2);
>         DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
>         struct pkvm_hyp_vcpu *hyp_vcpu;
> +       struct kvm_vcpu *hyp_kvm_vcpu;
>
>         if (!is_protected_kvm_enabled())
>                 return;
> @@ -175,10 +176,17 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>         if (!hyp_vcpu)
>                 return;
>
> +       hyp_kvm_vcpu = &hyp_vcpu->vcpu;
> +
>         if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>                 /* Propagate WFx trapping flags */
> -               hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
> -               hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> +               hyp_kvm_vcpu->arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
> +               hyp_kvm_vcpu->arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> +       } else {
> +               struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> +
> +               memcpy(&hyp_kvm_vcpu->arch.fgt, host_vcpu->arch.fgt,
> +                      sizeof(hyp_kvm_vcpu->arch.fgt));
>         }
>  }

With the fix Will mentioned (hyp-main.c never uses the variable name
hyp_kvm_vcpu, it's vcpu for the hyp, or host_vcpu for the host's).

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 43bde061b65d..05774aed09cb 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -172,7 +172,6 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
>
>                 /* Trust the host for non-protected vcpu features. */
>                 vcpu->arch.hcrx_el2 = host_vcpu->arch.hcrx_el2;
> -               memcpy(vcpu->arch.fgt, host_vcpu->arch.fgt, sizeof(vcpu->arch.fgt));
>                 return 0;
>         }
>
> --
> 2.52.0
>
>

