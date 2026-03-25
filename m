Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5089B109C057
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/ZpfjFSEtOGSyy/5cgdUOaGwEfcRMUMn1EzqJ+4g4M=; b=XiObQt/491dDzNhbxspHiFGLB5
	qfmzrVPpoeKL4GPxjwa9AEYgLcxrWNUDY3MuZjQjiQTZUxlNOowCLh+VWGesPfhYZ+C22JpXrYD5B
	Sd2RAB4yrB6Q6fdd7Lmcaa4Q5CjeM3r8AzQsBzWKArMmYuRYrJrIsaxlmz+9qpMTZNLZRftkzY2/v
	zNdPK8l4C6sfRshepiG8zttEFrZVz49rrGSNyyIRychl8jE3REaVjF7jj8tT1/eNtx5SfHzkxtWZi
	QPWsnpgJDD4tjIeKWyTPi1NpfR/OCtZIlYdb/nuCljbkWRPN0FpKikDuIS41ScevBIemlJwwQr/Iz
	CSbocAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Tuc-000000049gq-0xan;
	Wed, 25 Mar 2026 19:29:06 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5TuV-000000049ff-3hfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 19:29:01 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-509062d829dso12601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 12:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774466938; cv=none;
        d=google.com; s=arc-20240605;
        b=N4Dctut6ZyFz5QAaWhKxs2+xmOPqC7EyK4Re0dsaQXvjzuSixl+TuW+VJyehc4quGA
         U1NrNXblzeg1Xq6bHED+fCJqXRSiwRnWD5GXnzyH8ctl/kvUgLEXGLaXnMuZ+z35F1e0
         ce20Vc6B9gZOherQpH/UpSNvHy+eYzheQsf6B13Bf4WnL5XXjnF3OnHRZETMhLa8MD4t
         2tHGZ9ZWfyzwnDMuHQMu8xdTvr0f2UhpP6We+u9h9rR1OMj0eNItrFypHm9HKdOQvq34
         fpvKs8eY1CrmPY/18kA/1rZO2ycGTfK83vl5FWPkQVjEDQiy5/HE6Av2uD5vIC1H2WP4
         NcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s/ZpfjFSEtOGSyy/5cgdUOaGwEfcRMUMn1EzqJ+4g4M=;
        fh=ugwUYhnYk0ujaybheXAgR2apVLaNp6gfbtnEizJw/DY=;
        b=fGsgB/SXwfT5IbyS7qKchbJFG6lDQiQtaYnC/7P1EjnbYn3PujqkPXMXkSAiobuCzr
         5q62gx9c/NwotVFmWARRk2dT3AhgVgrsx3bTUmB/ibk0wof89fHmGQHH6GRYivE5nTi2
         vH5Vl9M3T0+aVeX36+TyMIwLBs7+b1RcPey7mNmR+kwMlZ/YgHl/9FAhJeg9zwNGV59J
         L6ygShNkHBMmY9Ek3EXRSt+TMusc439g05Ps9hfI31KTOfUQuC7SN1jaVdaoG0ET7g2B
         ORI43ASNjiuNWwSG+bSP7Mke6dorW/nvf+s8u7f+wvnfJYbPTEqTvx0RppXdNmBf7LdM
         NuPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774466938; x=1775071738; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/ZpfjFSEtOGSyy/5cgdUOaGwEfcRMUMn1EzqJ+4g4M=;
        b=LlxqxtzNIFMVk84v5veEUDai50rPjMcVUyo1DoXvknCTMBOEboCjLAlGw86xjadckL
         99jBccPS2BKKgwLiSEwwa3K8CZHmOwWTwg04lvHq63EmHBCC3IoUACV4yXIrzqQ7BpGG
         rMeP/LcQ7jdXXX+WionbrZy1046HU4SNPDTKIqXw2rRb+pL/78WvX+6S1fpuKw/+PYab
         9aX7mgHMwp7rrKXnTpyqpuPtI9xFAIq6cvbaH4Bl6dQDCll6XaLqnncgHfCDQJo5BbbL
         Y4zXRlWiSDEbruUihv3UvQ1S5pql1LPV+eB3UvBh9Z5S9oC6Uw0j4FlkSce+xZfDX946
         Hwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466938; x=1775071738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/ZpfjFSEtOGSyy/5cgdUOaGwEfcRMUMn1EzqJ+4g4M=;
        b=QBKOFLSRs/Ui3Bmx4rUOwIFw2QhzX/3677nQbpc2ddRrmP6ydIhtN2jcIBjR2BfVhi
         N6ZuIdUyfB9gYsaOKwO/6ooE5tsThxz1NIMQgCRIjDwaj8WuZFtr1mzeCBzqeLEDnQ+J
         SnUHRr6tGAXUPIGtm/7qWXyNegeeuaapPtha4pa/TFZ9HOdScLX1p+fLvQoc5Ey2D2+9
         iqgMyuF4JJN/Q5z3lDt4iVt82QnIpA4Kw82zERjNPb0VKsxWdeSLwUNUlBD7crTcXIBb
         C3qDGfF99WYpe6uv1MJg9nqC6Gc8MBIcNnZltrQQnaai/SEweS2jr6+IqC9u45o8IrD2
         KR1w==
X-Forwarded-Encrypted: i=1; AJvYcCVSwt5UCyKapscYLX0nq03TNwrXyoqieAuRWbHFjOVlHM42D7QOCKDYF8lkfI99UXVthmIUYIRGnQ3/IAY/lhOA@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoGbXAvO6mNEVegnaPkS72N7lb/RJVyQyWT49/QLGCW0S4AXT
	Wo6BAj36iWulYTo9yp3hRJIo+MjUXuvB0VGQAaZHvnWdQ+Hqq7jnq1DHc8zvjk42WSWskV5Rs+c
	gWM+RQ8aaORUi9ASXGMTTpe4MpYfwDAO2yNF2h9Oq
X-Gm-Gg: ATEYQzxW+3RYqRHWfMefb2zMhP48LjoTO4PMcCgP0IWFHgTPTI8quGi9GZTbtqKRi6c
	Mg4knkVOZZa6tOeP67Hzwgg0//NOJ1yrEyRQnYOlvL6cQmr0NpQrY3MNJN6DiBoNuRiv+eSfG4y
	fehQz0t/dUCOs37L43+XKEsEHjFk7QhsACja3T3y2ZMlT6FICIKtJJy6kfAYnqyn4RQf/SGtoVE
	y7PP/Bnx8flwQSjVz33lVHvazrJaSaHA2cZ22gN+kyvsfo48HjLotYtzVKh3m1K+5ggdupRL06V
	vIevzhcX
X-Received: by 2002:a05:622a:55:b0:509:1c2c:866 with SMTP id
 d75a77b69052e-50b93c22503mr1073641cf.11.1774466938020; Wed, 25 Mar 2026
 12:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260227212136.7660-1-will@kernel.org> <20260227212136.7660-4-will@kernel.org>
In-Reply-To: <20260227212136.7660-4-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Mar 2026 19:28:21 +0000
X-Gm-Features: AQROBzAoYjX8VM9IBDnHSEJaOijoJGyXHH9NyF0-ya0xncOBIQZ1Q9YEpttcKXU
Message-ID: <CA+EHjTyYJVqoa332LbzZ49i-C4-DhiSziqd_gqY22qnDmkyV0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't pass host_debug_state to BRBE
 world-switch routines
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_122859_956677_906474C9 
X-CRM114-Status: GOOD (  20.32  )
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

On Fri, 27 Feb 2026 at 21:22, Will Deacon <will@kernel.org> wrote:
>
> Now that the SPE and BRBE nVHE world-switch routines operate on the
> host_debug_state directly, tweak the BRBE code to do the same for
> consistency.
>
> This is purely cosmetic.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 75158a9cd06a..06ae122a7761 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -158,9 +158,9 @@ static void __trace_switch_to_host(void)
>                           *host_data_ptr(host_debug_state.trfcr_el1));
>  }
>
> -static void __debug_save_brbe(u64 *brbcr_el1)
> +static void __debug_save_brbe(void)
>  {
> -       *brbcr_el1 = 0;
> +       u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);
>
>         /* Check if the BRBE is enabled */
>         if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
> @@ -175,8 +175,10 @@ static void __debug_save_brbe(u64 *brbcr_el1)
>         write_sysreg_el1(0, SYS_BRBCR);
>  }
>
> -static void __debug_restore_brbe(u64 brbcr_el1)
> +static void __debug_restore_brbe(void)
>  {
> +       u64 brbcr_el1 = *host_data_ptr(host_debug_state.brbcr_el1);
> +
>         if (!brbcr_el1)
>                 return;
>
> @@ -192,7 +194,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>
>         /* Disable BRBE branch records */
>         if (host_data_test_flag(HAS_BRBE))
> -               __debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
> +               __debug_save_brbe();
>
>         if (__trace_needs_switch())
>                 __trace_switch_to_guest();
> @@ -208,7 +210,7 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>         if (host_data_test_flag(HAS_SPE))
>                 __debug_restore_spe();
>         if (host_data_test_flag(HAS_BRBE))
> -               __debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
> +               __debug_restore_brbe();
>         if (__trace_needs_switch())
>                 __trace_switch_to_host();
>  }
> --
> 2.53.0.473.g4a7958ca14-goog
>

