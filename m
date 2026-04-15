Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C9F41987
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EbgCdLHRY+jKfmk+Esh0hv8FKnFSyVXrH0IPR8PlGk=; b=vZ48LOOS++h0DVXyq8s1wylCAj
	e1NDFTBUMV5NAq89Kn2DnzA5yBvqFVFEkAcOXWU0tes7XorEomR5cfv48XE9CvV+irc4Nj8c7DbQW
	i5qZaa+ZGly0VR5rHq5EqBoopHUotA3NQSDb7TtV8j5XhXSbU8XxNPTQM+ILVjviVj55m7mWzyVA2
	kNouOQoG66fPHeF+x5tZIyBWwuwv6ChHyvx/jU5n+IyvnB/K4NANSqfJGOHqv2SZSqW4lu2h0Ljtb
	uwJ9HDBvReRDQF1tZONJqJK+6JHvJwByYujkm6MoMfPgHt+AU99eSeDfMTj+D/trjs3TTHpoeNSao
	GYjlKLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwzU-00000000wFK-2oEY;
	Wed, 15 Apr 2026 09:57:00 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwzR-00000000wEc-3dPp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 09:56:59 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-50d6b393d60so5049151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 02:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776247016; cv=none;
        d=google.com; s=arc-20240605;
        b=bVqdCkaQIWxJL3ZONULkAaIVsVPQjwR/szppUV0mYPfgNP0wicSAs8SURQe0+Le2oV
         dJKfzGw3P2WehyXrlxACrHs5Wb8I3Ku44+6vs1UjZ6ZQnGir+VnDNNf7zeb9zMsGu4eo
         G+VpK0U3gi22hIGilk8exsm66J8ZcfGRJHcEJWBMHsMUUoDm/zkIR4PQPlsJdhl1rIsH
         uSZCORiX783M3MJ+zIGbPKQpkTuAZgi83WYrcLN7REmncKb2L2PQwA3khfGcqtozHNt7
         UKMSw3JYV2Cqf/BkkYp5+4vqPnJi/FtBh8fLbwzVmxzDWzJIT9PuUqsIfcpMoNhw+Nzc
         3WGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/EbgCdLHRY+jKfmk+Esh0hv8FKnFSyVXrH0IPR8PlGk=;
        fh=btohB1zcBZJWiTq/tmFA84V9vTbvlu/duz2HYFA0m+s=;
        b=ivcM2K34UP4sxHqdf+naGWiAvrdXOj9s8MpwRdACB13v6FcS6suJfuCQffX/QjHjBj
         PomhcGrP3yLJFJxJkr2PLVCZpGdv1NLsmdLpLq+9zSLQcu+OsyeAEm9ej2BFuxwU7DOq
         PtAeFZakq+d7iQcfFTMXcSmv8jA2m3wXns+fYJQXfHPGuwxQXl0WHIy8p8VOGKDkhjcX
         hx4cJ/0imgONjDG+8zyblnZa9aD3xcYxpgoIaTiQMySeZbHZ6Id2U9b/lk1/id/l/NQc
         yDuOvDlO+9+CPRBIQklzhCqb+zHjH4ztiqRKZKvv+vaptV58at4przYMvjAYlK5Rgn7l
         mQxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776247016; x=1776851816; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EbgCdLHRY+jKfmk+Esh0hv8FKnFSyVXrH0IPR8PlGk=;
        b=Tjo0oojfEDzjcXcNf0T74d0lMonp07aBYjnMdfZJdvTlveUxybWWSMKvqtSQ34elPz
         dtsBRjRI3aetyB+zl8AWcrdoFmd65v8GQ8RRy+gqszM3Rcv9HHEgZfsSSWPRKo6UO5gJ
         tWjgR6G6j4wfv3SVGalN3wvB++5GBJSPVw5GnvlSLeTQtNrPQSthKpJHkmXFSq+MLhYe
         y7DJpA80ylOE7XAqaN5gE3ANxbgJ3wfLZiWABRA+g7PwhEDEc4mFgj4IQgaoL2HPkKbX
         1hskv4GBZADSDVHq88WI3NMi01WpvKGedfAXldGau/CKql/m4R/edKz2ZO53TNy3fbC5
         EOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247016; x=1776851816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EbgCdLHRY+jKfmk+Esh0hv8FKnFSyVXrH0IPR8PlGk=;
        b=g0csCiCrB12ngxr3X05FJ+ePhQiiBiWgejUtaOpTxzGRz666WiE8hLAu+V1frAyDbD
         HaEaNusnr61bkZ0oBryC4va28yQ6K1hMKOiY/duHk8WpUUDaOMCdorQCO0Zvo/RQ31lk
         k5RXBo4Y9vyA88KYTkcHzOQHX0a8gVO4tr+nXICzybFLxAFvI0nPEuwZwhZqjBMqCDdt
         vXAaTD1p0McUZ/0aeEZkm+RyI29UpXqJoVd3tKqQYBca3hL6tcOGYNBmVLmnPZ8vBD+4
         WSE7Gu5Ft22+nWf0MUocCmZqk7KOihxOIos+aYCyy12+TqEvld7ocCt/GbbuLZxyitnK
         d3Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8/ZpHe+ENagKPeuzw+GNjUduxReRkf5Qfa+lgOqkV9xQuUJqiUhkm0tNwBkMtWJJddN8x/IWp0IsBpXJkKlzCT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1icXiLx30yZgfnrSefN30AlN+ogu+xlMTMOANzwchre3XLg2Z
	Hbr+7tHGdYj+dMVXGdivu1jLiFqW99JiqPizWzYD8js7euwffIhk5xCY/tWhESVUbBjvqAJBQJz
	BmIKKcJQDFSvHzNnAbHIrpcm6RNV4+lrgPI2CqQP/pqiuz2X8sL8U0jzIJbw=
X-Gm-Gg: AeBDievCiG4x77601FoVEvvAUKLjgxMPQ5MOcBrYIV/LIMeKp4NXZjbHwA/ZMbWno8B
	/BHD64bB4eSlbuhpmcYPbxNALJio399WU+ogxV2BHYBmzQz6wPhThX1/1HciZLMvsTLCIQTRfJY
	0gGBTwVq00g+6Ew+pw3ZbHs9WyuxHTWdZBj85nSHTTDXSzyjlCotTdAn65KUBqKMEaCtafCNBQ2
	oMRnOEXHuBQ4z53PZ0V1C/2aUOrUZTwEsdXfxwPUveV3kH/NTkkHdMIz26alE83z0JehNcc7Jqt
	HsXflW9NVtfDUgSyagxX4TNNUsn+GBpE947TBqEQhoTiinyHTVB12umBnww=
X-Received: by 2002:a05:622a:47:b0:50d:edb1:6bd1 with SMTP id
 d75a77b69052e-50e19087b29mr8513401cf.13.1776247014409; Wed, 15 Apr 2026
 02:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260414160528.2218858-1-maz@kernel.org>
In-Reply-To: <20260414160528.2218858-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 15 Apr 2026 10:56:17 +0100
X-Gm-Features: AQROBzAI0VOPROkQCqyX7Dt9X2lg7F9YAmrA11FS7_WWuEvNdak5O-heggH5cq0
Message-ID: <CA+EHjTxWAFKHqBUOCVkkqtzTKrMSU8HQDwoLMqD2HQPga7y_-w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_025657_932816_6FAC2119 
X-CRM114-Status: GOOD (  31.56  )
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

On Tue, 14 Apr 2026 at 17:05, Marc Zyngier <maz@kernel.org> wrote:
>
> The EL2 code defines ranges of host hypercalls that are either
> enabled at boot-time only, used by [nh]VHE KVM, or reserved to pKVM.
>
> The way these ranges are delineated is error prone, as the enum symbols
> defining the limits are expressed in terms of actual function symbols.
> This means that should a new function be added, special care must be
> taken to also update the limit symbol.
>
> Improve this by reusing the mechanism introduced for the vcpu_sysreg
> enum, which uses a MARKER() macro and some extra trickery to make
> the limit symbol standalone. Crucially, the limit symbol has the
> same value as the *following* symbol.
>
> The handle_host_hcall() function is then updated to make use of
> the new limit definitions and get rid of the brittle default
> upper limit. This allows for some more strict checks at build
> time, and the removal of an comparison at run time.

This is pretty neat. There is still the issue of a hole, i.e., adding
an enum in the middle but forgetting to add a function, but that is
caught in handle_host_hcall(). I can't think of an easy way to catch
that though (xarray that initializes both?)
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_asm.h   | 12 ++++++++++--
>  arch/arm64/include/asm/kvm_host.h  |  3 ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 10 +++++-----
>  3 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 37414440cee7f..fa033be6141ad 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -50,6 +50,9 @@
>
>  #include <linux/mm.h>
>
> +#define MARKER(m)                              \
> +       m, __after_##m = m - 1
> +
>  enum __kvm_host_smccc_func {
>         /* Hypercalls that are unavailable once pKVM has finalised. */
>         /* __KVM_HOST_SMCCC_FUNC___kvm_hyp_init */
> @@ -59,8 +62,10 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
> +
> +       MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
> +
>         __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
> -       __KVM_HOST_SMCCC_FUNC_MIN_PKVM = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize,
>
>         /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
> @@ -76,7 +81,8 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> -       __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM = __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> +
> +       MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
>
>         /* Hypercalls that are available only when pKVM has finalised. */
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> @@ -108,6 +114,8 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___tracing_reset,
>         __KVM_HOST_SMCCC_FUNC___tracing_enable_event,
>         __KVM_HOST_SMCCC_FUNC___tracing_write_event,
> +
> +       MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
>  };
>
>  #define DECLARE_KVM_VHE_SYM(sym)       extern char sym[]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 851f6171751c0..44211e86f5ebd 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -450,9 +450,6 @@ struct kvm_vcpu_fault_info {
>         r = __VNCR_START__ + ((VNCR_ ## r) / 8),        \
>         __after_##r = __MAX__(__before_##r - 1, r)
>
> -#define MARKER(m)                              \
> -       m, __after_##m = m - 1
> -
>  enum vcpu_sysreg {
>         __INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
>         MPIDR_EL1,      /* MultiProcessor Affinity Register */
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 73f2e0221e703..9e44c05cf780e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -748,9 +748,11 @@ static const hcall_t host_hcall[] = {
>  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(unsigned long, id, host_ctxt, 0);
> -       unsigned long hcall_min = 0, hcall_max = -1;
> +       unsigned long hcall_min = 0, hcall_max = __KVM_HOST_SMCCC_FUNC_MAX;
>         hcall_t hfn;
>
> +       BUILD_BUG_ON(ARRAY_SIZE(host_hcall) != __KVM_HOST_SMCCC_FUNC_MAX);
> +
>         /*
>          * If pKVM has been initialised then reject any calls to the
>          * early "privileged" hypercalls. Note that we cannot reject
> @@ -763,16 +765,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>         if (static_branch_unlikely(&kvm_protected_mode_initialized)) {
>                 hcall_min = __KVM_HOST_SMCCC_FUNC_MIN_PKVM;
>         } else {
> -               hcall_max = __KVM_HOST_SMCCC_FUNC_MAX_NO_PKVM;
> +               hcall_max = __KVM_HOST_SMCCC_FUNC_PKVM_ONLY;
>         }
>
>         id &= ~ARM_SMCCC_CALL_HINTS;
>         id -= KVM_HOST_SMCCC_ID(0);
>
> -       if (unlikely(id < hcall_min || id > hcall_max ||
> -                    id >= ARRAY_SIZE(host_hcall))) {
> +       if (unlikely(id < hcall_min || id >= hcall_max))
>                 goto inval;
> -       }
>
>         hfn = host_hcall[id];
>         if (unlikely(!hfn))
> --
> 2.47.3
>

