Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4334CD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9Kb3oOMS7dtZg79uYFU5rgqJ0l2yPeAHjyNaUZDKkY=; b=yzuZVQl7EWkiTJYf5Ds9h789te
	iHVWr3or6TejRvaOOIr0s4nP4gp2PHn1xhLEa0eI36anruwUTTrRrFqc6xS3GdGYd9OKrQPtMk27+
	k7ont59+XGBp8iod/VH0C4pU4PH1xL/oXuKy2RHxRZz7KGSirkIbTEcA8fR0W29B/SMtZjfFhUXpm
	WSQxYhC5AG1F1NhvlFYeFVGvYt1StSu0lXFr1Zo2kCl5jHYiP5War0pqzEI2JIAwuGPHfxGbWp35H
	ut9/tbB7L+orzYCLdqu+kYM6pI2N8Mnc5odXBEW99cD9A/w7fcs1RC58ANwatZG6ygB2XqbXGiS4b
	E8uYHzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR7C-0000000EkMu-0N6n;
	Wed, 07 Jan 2026 10:50:10 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR7A-0000000EkMQ-1mtr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:50:09 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ffbaaafac4so100401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 02:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767783007; cv=none;
        d=google.com; s=arc-20240605;
        b=G6TIEPrA/ypqtppWadyaXcMPYwDPS1Ss0qC8mirMh/XWrYDBVq1chskTKhJrm88vZ4
         6oaMp4hs8dbjiTtfdkeNAcQ8cc0ZJtUPIlrEd4Gg/gYnGTjSWOmx4LVysZSS57rCdR9r
         bNrILKRU0OYyM01kveNPCYoCenpLv6xuTufPRc4/1h33LpOde9EB9xRmFxGuPSJeD2YO
         esknHlugAMfZGpdDVHMbdd/R+QNCr2B3bZUe3FR3fU7A0+JbVsWT/HOtP6G9ieV7nAH/
         x2du9zzR1SfV256dqNVsvpJ6AnKQOmOtHp8hxVpw62MC3F5f1U5WivxzMs874qE3ujLz
         rwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J9Kb3oOMS7dtZg79uYFU5rgqJ0l2yPeAHjyNaUZDKkY=;
        fh=XJZxpkM38ITBrReLoyczsP4zkSBtHqoBEqpIKT7eg0I=;
        b=UAg9nm7iZdB0aXC73/XUB1IQWgPVhQhhalU8H2LUG/SPq562P6l06wq+pYQIUJ5ENM
         un9Kdguwwh9KlcPOWJjcxgBsdeS1IyVTJbOCnt/vs7kHEfh2ct54j0SXFOj/Qwl5Z5gH
         rXWpYxF9XbSDyxmCLdSwGeXnplxDPysAGbjrwbxT/YM+HAqHoN2UJ+MDUvnX1w5nxaBa
         UOGnNI6yQUf4SxbJzOQ1FTsXjEOhd+ErQnibLU9W5b3fhV+yQ0em8I29M7NF5PRn+twe
         AbNCmYHzAKe66mgfqDcMgU3AFKI0qJl45D2aexmnKYdu1epfs2GPxf8YWskvnhJOh5r2
         uVFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767783007; x=1768387807; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J9Kb3oOMS7dtZg79uYFU5rgqJ0l2yPeAHjyNaUZDKkY=;
        b=BHCzliwEtq3cJ285+vUdXgIGYY7MKEr+zWZnB0A4B7ZO1YmtPnxrnpWlFCaCAQQyds
         lw/nLo3BF+OXyAuKKZwfE26a4wxl/TIoPljskGnr/H+D/vHHMdPdN8WdGVNsLATvDjCx
         OUbFW7QG5LsrW6HFGQ7MlKp2P1+rgFFPRSzVobkfxfrQwdQUGSteDF7+E6MEvOV94wER
         iM0WV9tzM+pltc/iy2H2cwuHRwRdQwMdhgvwq1RWiCRmqHfqdPFQ66BbcE3zixt7n1Nd
         igXVJV1BY7U1BIQT2iWJ42ADxLgSagWWn6rR0MrVQ8i4Zxx3aTRBZvG72RWR07pOuzRN
         UllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767783007; x=1768387807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9Kb3oOMS7dtZg79uYFU5rgqJ0l2yPeAHjyNaUZDKkY=;
        b=RIcx8Y9v/Ys07QebG5mypXMQLgcA5FAy1zml1h3bkQQggByAUySG8sB9zx9zbfcLzg
         Fptc+qvjr/GKgJzockOkGRgr+w7Y5aphb9w/wJNIIYRtXZ6WLPopW89td+Ba5gzBXkPQ
         /oGG4Y2TKgSIgS6f2OEPYMP8zGOA3M/VHS0yerMNJnqmY7BUZdbWRsyBfy6QlsPum3N6
         xA7lAeLpf6dO9t/P3dIybfsXqqq+aWCRmzCQc9kVZEPJVWvqyxQLW1iUGo8oZUZuazRn
         fZ8ukAXjR8m9T0zooEQaKpkLnwEGzYAm3IVxznpBMrgcBky0aSUQlYckxzs4oMUPo5x5
         Bi9w==
X-Gm-Message-State: AOJu0Yxdis1EFmApSsCfd1CUWCD72ldM02e38LNCgOnDx7GTZEF+WUbI
	3H+gtTcB+EGrG3GSuNMKz6EAD5JHBZntjNroNWE/UsV7UeQ89D6HqsEU63lKelhHMic9MHPzh4t
	6zIAD3F1MKGBnsTxzaOSuIFmeJgYimylRLISmY4yk
X-Gm-Gg: AY/fxX4MoSAXsx4ZwXypNjfDUcSz4mgQdr2Wg2rganJXaCyC4fq9FYx54ffP1ZFsA9r
	aZaBOpCrM4aT0zos07rlSrjyIgW98vBszSe7gm76rByL9kRlhP0xME2Ph+9fYTtrsnu6BmL5QbK
	f+J22dDUIz5edO0TJAssZTc/8PFiPvt0RhSnAKWfeY9J1ODuNXB76M26mOYUHFw2mSQeM9LZNSp
	ApCD0cscXHIGeGFZwyn6N5s7NILfsM9uPULDA7myk4jxm/bT8mAZhr279R8GEkMbfFXl9+WNwjZ
	lmpjWsS49u7Lp1S+8yrM/D7+
X-Google-Smtp-Source: AGHT+IE10rh+DN78N9YiMcwVYhJscwv8cpbNaNZBCYyl495p1sfIe8xo499YH5McJSOq9oBWKGVccLjtgAYQ8/EyETw=
X-Received: by 2002:ac8:740e:0:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-4ffb3ee7ca4mr7057461cf.1.1767783007011; Wed, 07 Jan 2026
 02:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20260106173707.3292074-1-mark.rutland@arm.com> <20260106173707.3292074-3-mark.rutland@arm.com>
In-Reply-To: <20260106173707.3292074-3-mark.rutland@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 10:49:30 +0000
X-Gm-Features: AQt7F2o3m38Z6d968yzTAfqCtkyv0VzU80IdiRiSLmqPB7tJYi9cn0hpoI97f68
Message-ID: <CA+EHjTyroHqMj5nHZvcwuqO64rQO1iMbSApW8mnNarHyR0zzzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Shuffle KVM_HOST_DATA_FLAG_* indices
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_025008_474439_720C79E5 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, 6 Jan 2026 at 17:37, Mark Rutland <mark.rutland@arm.com> wrote:
>
> There's a gap in the KVM_HOST_DATA_FLAG_* indices since the removal of
> KVM_HOST_DATA_FLAG_HOST_SVE_ENABLED and
> KVM_HOST_DATA_FLAG_HOST_SME_ENABLED in commits:
>
> * 459f059be702 ("KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN")
> * 407a99c4654e ("KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN")
>
> Shuffle the indices to remove the gap, as Oliver requested at the time of
> the removals:
>
>   https://lore.kernel.org/linux-arm-kernel/Z6qC4qn47ONfDCSH@linux.dev/
>
> There should be no functional change as a result of this patch.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ac7f970c78830..4c8b4274f669e 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -710,11 +710,11 @@ struct cpu_sve_state {
>  struct kvm_host_data {
>  #define KVM_HOST_DATA_FLAG_HAS_SPE                     0
>  #define KVM_HOST_DATA_FLAG_HAS_TRBE                    1
> -#define KVM_HOST_DATA_FLAG_TRBE_ENABLED                        4
> -#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED      5
> -#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT         6
> -#define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED              7
> -#define KVM_HOST_DATA_FLAG_HAS_BRBE                    8
> +#define KVM_HOST_DATA_FLAG_TRBE_ENABLED                        2
> +#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED      3
> +#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT         4
> +#define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED              5
> +#define KVM_HOST_DATA_FLAG_HAS_BRBE                    6
>         unsigned long flags;
>
>         struct kvm_cpu_context host_ctxt;
> --
> 2.30.2
>

