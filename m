Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA3D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf3hSW2fHb+vZcqGeYrEECUOHTRoafS8R6kEtlKr8/I=; b=4XwswV5HWYtNX1N1tYW0+bp782
	9ysGYmDLubPHRoq7jMC/eimiFMf16aL9cOwq0RA/FYLyvNiXlVpv3R4dSfeoLaCpQntsDqi6jpmfU
	Cjf7UrvOJHp+pPUf2c+ocetJ0D4F+HaITGXcGs397FqKIxAR3QMoF8/6CVTKx8j893slhYMk22dSQ
	HS2aP5xERsCUfbc18oqTkcxcyj8Ft1OgLNqC5Gh9gamcbnZOHIX0NbE6+Jkpl/o4nmgVdYIVsvNkl
	dqvZeuB5RqR9uMqhIAj7ip0TOYKv9qCRz06lIUXqGEK+FKpm8+1hPqMlvG8zQgFFWfmw4vvwAvOCE
	jiH5cT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8rG-00000003hVW-35ws;
	Mon, 15 Dec 2025 13:43:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8rD-00000003hV5-41PL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:43:25 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4edb8d6e98aso2574711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 05:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765806202; cv=none;
        d=google.com; s=arc-20240605;
        b=dJyvQJmJWuv8XuN78QAHoSFp0iggqtCEN0xi0RX5VeO0WDP3uWh6aouDI3aBJ68E52
         oICSRManXqXulT2nHVst5OxnIMd1j0r3/O54p5UEuWhNNAxZE2NIn4yqUy9uVVUgsZvR
         Ti2Zj4O+8d+MKYABvKCHBD8V3MAr1w0g3B+hPptK2mtzCbLmC1iIvXF+bgZSt974XAEG
         Ve9EjxjYszgw8MUhEuvgSexKAvlqJCdHKFiGxYaTBbkbyeLH0RZrUHUKuvST5sNP/b4h
         XYiZ6qJ+jqmT7E30k515xfjmFZoXrQsIRCZndLR+T6WD22ewKHxG9KMkvS37392s8odV
         erHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zf3hSW2fHb+vZcqGeYrEECUOHTRoafS8R6kEtlKr8/I=;
        fh=7L/xEjX+bGuj2zB/+0V9oZAdQzHun4ZwrjroJjaNbiw=;
        b=lKKvOrIS6BkM5+tiFDhrtibukWjUaN1rIUKCy4V7451FyFYMKi9nBACYaKWcO3MiG3
         3e0SI2SsAAUgbgw9enF/D9ek37BDbEVx+1osTC1MI5Wi/4GsBDUygZJgFNMI9dlKTXob
         O278UhYrmljyCcc0g0lcLSvNLKt4o/xZ3gc7u9R/hwtOChfjV2vuILgT/w6SYxCP1cFV
         ROxEURA5e2EuwUnSTPfHdu5yw7GXXiUj80i+q80ftdJmph/fiWvRWOdRc4m9aWbbZv+R
         yPuGUfmLqR+7UWuldRI1MeUfiM0CYqgN3lRuF04IDPImTQFyyIQgdM6UNtdDQs9TCv+i
         D7EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765806202; x=1766411002; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zf3hSW2fHb+vZcqGeYrEECUOHTRoafS8R6kEtlKr8/I=;
        b=k3TOwcICxNuZ/xmJm/57L5Vg1rfiMdY6XtxCB1qaLpfDAVHOA7YCMxCGooMQPEr2aq
         5pqEVOdWhAKC20FDW1vwl2E07HlXVDcbFs+vclwjffgIQKOsF3bfcZDkkMclqI4390F1
         H9Df0KeSG2S8u6xJpexW0ItjrxqW0gUCcFRCUQHFWt8hIJuEtfDGxhl4CL1lWh1jUvnE
         C5QmaWk7GMrr05qgSoU34JNb2VGE7/v0zm9Z0oD8jzZJIZUGYM3QeDOQrDeZ47mYVB2e
         Ai+SZV1KYMI8AwEiC6MkRnObcYZ3ICZWflfAAWMEn7QHcNs0NghHsuv6hi9NBrc6H5sI
         8xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765806202; x=1766411002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf3hSW2fHb+vZcqGeYrEECUOHTRoafS8R6kEtlKr8/I=;
        b=Gz9D7Z16H14IxCpjI7Fce399iyGeghrzKXJSjIjXIzy0xm26wLrHrgGAuMsB+hIkss
         KNShcf/9EoM44uKIf+zejMGKFy5+8fFCaHLYF9LJVLZu/PCrCt/CRSQJOhvH09oVePLW
         8v6kCHeva63+e2xbHyPmNy+jRNxEjIupgZKpu97K2nW7pw124344lcAY1Z3CZDeh+t0E
         l+ugQTmF2aSPG9AzQDkSkn8WUHgBiVVB67CMe6YYbmesrj4ZvjvYowyUhGJJDsYKsTFo
         Adnd8f5lqZrP3zJ9KtURQrZjxB5GQdt8JAgwv75/8ASXp0jQzmRC1tV+jo/pzzqljNkq
         f9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXGW6MqLd9L0yuJvAnaJlrgst0nG0Luxt8R/SdFoFxYnC8Pv24fMbXIq53bvBZPSEmZ+m7+EsSRCS6gIvxcLGmf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ShcBKh7nu5LDzhN20IrRzWhiXyZojxOM9VsrDZUUlci2ZL6q
	kwtx+HGi/e6q7Mj1DwDlJfnqfH6qcDqODSDSMpewgiF4Xnr9oeftKefF3ZJ2HW7OrGyOxdwa833
	4VUCZ0fM0v8IqC+zj9/3ny6UJZu8ByhdPNzgJYpky
X-Gm-Gg: AY/fxX7kztrnRNqHjqKghGy35h7Woq44ksSM2/RrxZc6M53UCz8AT3r+R+IGn1YJA01
	8PSFEhoQWGdOowYaoQ/62XLJZ0BAhkK82+nN52lwSk1fp3WFHQpSqA6hAKM6C66Vq3WBqbcpREW
	CBdrxMtbiYy/N2e8kxsmY6YJboHSHEtah8C2nD1a6He1MRQJ92eSHDEetnsHSz/YhRZ6+qEhAi9
	3UuIcZg2rAa2KqdV35w3/NFgHtrbawBDQU8cG/TRuI1Bxu7BkH0xPE7waO4SZMzpBusdOuS
X-Google-Smtp-Source: AGHT+IFzDElWJwyr6+nuwAlH/P9H4uymOrx5buaTQt2l+b4Jh2LO43obqrs0YFrGsbjpoetfJAAeMF7Kmpc6x+crfXk=
X-Received: by 2002:a05:622a:1313:b0:4ed:b665:3779 with SMTP id
 d75a77b69052e-4f1dd58a1d2mr20890381cf.16.1765806201435; Mon, 15 Dec 2025
 05:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20251215114409.212512-1-alexandru.elisei@arm.com> <20251215114409.212512-5-alexandru.elisei@arm.com>
In-Reply-To: <20251215114409.212512-5-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Dec 2025 13:42:44 +0000
X-Gm-Features: AQt7F2q1x7ATNnNzIPh308Tfm8dpOMHBrZ2T4CqyYv5-2vMJtxpKgN6HpQ3ZEqw
Message-ID: <CA+EHjTyCTetJ+ieRNFG9QN6gQT_4b+G29i-w9AB745w4EtrwMA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_054324_038770_9D98A6CA 
X-CRM114-Status: GOOD (  17.37  )
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

On Mon, 15 Dec 2025 at 11:44, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> synchronize_vcpu_pstate() doesn't make use of the reference to exit_code,
> remove the parameter.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
>  arch/arm64/kvm/hyp/nvhe/switch.c        | 2 +-
>  arch/arm64/kvm/hyp/vhe/switch.c         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index c5d5e5b86eaf..afecbdd3c1e9 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -854,7 +854,7 @@ static inline bool kvm_hyp_handle_exit(struct kvm_vcpu *vcpu, u64 *exit_code,
>         return false;
>  }
>
> -static inline void synchronize_vcpu_pstate(struct kvm_vcpu *vcpu, u64 *exit_code)
> +static inline void synchronize_vcpu_pstate(struct kvm_vcpu *vcpu)
>  {
>         /*
>          * Check for the conditions of Cortex-A510's #2077057. When these occur
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index d3b9ec8a7c28..779089e42681 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -211,7 +211,7 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
>         const exit_handler_fn *handlers = kvm_get_exit_handler_array(vcpu);
>
> -       synchronize_vcpu_pstate(vcpu, exit_code);
> +       synchronize_vcpu_pstate(vcpu);
>
>         /*
>          * Some guests (e.g., protected VMs) are not be allowed to run in
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 9984c492305a..9db3f11a4754 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -536,7 +536,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>
>  static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
> -       synchronize_vcpu_pstate(vcpu, exit_code);
> +       synchronize_vcpu_pstate(vcpu);
>
>         /*
>          * If we were in HYP context on entry, adjust the PSTATE view
> --
> 2.52.0
>

