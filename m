Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727EA10ED678
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bY74UhjM4gzlwNhf6XzZKBW5M6iBaLhGIe7w2cyyBQ=; b=YHfIhGTkuPA+h2ljjA4kf5Ru00
	3C5RC0coacl67LUsRyo7dwdNIMxHNkaDTkf+91PfbUFtTDARTfZLoJkwNVgF5FYb0VVH9gF/5cddp
	nTKgwuC4xoH9kV/nWHsNmle39UNdYj3wQqhXGVDzCzZ9F7zlj+ptTQzB/ZXcqQp3r6Y0JhsPTGCfX
	ddyv0zx/UgAQ+7eBGftI7VkXTiZaiZGEhyTExAYGOvibDR6soQaiPuiIeEVVMItgzRkVwSK55/Lt+
	X7pImIsPTTmTA4qqj13Er4HQJIKxv/RlW5qPwPSfrxR+Moiab9jc0g8fZw/UgUJ2liwEhd+WFnOPl
	4Ye4MioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67Ac-00000007RGd-2ffe;
	Fri, 27 Mar 2026 13:24:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67AZ-00000007RGI-3Vtu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:24:12 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-509062d829dso476931cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617849; cv=none;
        d=google.com; s=arc-20240605;
        b=NrEKhwcuTjV6cBlopIY8pxD/UyjNY8Ox8ixYId+2clJcIT16FTzWOBuW2RcVyqMyLs
         Znm7J7bNijSCkeyat5iaOJgVwhzTy9oDpwiy+XkFHMSTcx0zTUwNAxs/gJ8wUXYvDSkS
         Xjsb3mG3WcvTrBM1Sab//7xPPeLhFEd48VNXSiIdx9fhs2HiMZwfKxWgLQJgbmF+N07m
         DNdy0xeZ3r2tu6GomOM+soAlKx65ZqG9rty1RKgYfJmHEON/upiiemdI07kGfHSxGbam
         w4NcpCDNtDukdVgSWhHRmUwZtckOtVYwd3Ggj3/D8RJV1yyRkYFJse7lc9EWTIGjvAjt
         McUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5bY74UhjM4gzlwNhf6XzZKBW5M6iBaLhGIe7w2cyyBQ=;
        fh=HlIVCWPS5kz9aP7i9p4mqmPdceFSeAP3wBzGlUWFhgA=;
        b=GKxS9qdAw9N44eHNw3n9xjemNKzF3+u9zYb7WIzLjJ+iyfvg8FOoF163pJ98oIL1ie
         A65LmiJ3C+PMDY1KIXTq4iBZpUVB16Po9ZKyazasY03gSSbtt80wWthZwkGhvSU+IzEL
         XiBGgNkhPrLyFsZ1HrALj7H7xNCjWTEv/WrjzHesbUf+sOBZ9jKYZUFQEtSl4pL/oJKt
         eim90zQfl2PdRqjoyGBuw7JUhMYYmAnyLgI5/w0ngKj0kQVFtuZ1SDWEPuVm8VGZpHd/
         zKSF6zD5mabaLwJYLF5gP9xMs70MzOCU8jvbLvpQr89qKCDELCZzdVsFyzbIxQGHGQrW
         b9Xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774617849; x=1775222649; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bY74UhjM4gzlwNhf6XzZKBW5M6iBaLhGIe7w2cyyBQ=;
        b=KtCzB8Vhno3ayRq0Q8sYDxNjrvkXJM2ZD4OxxQrxwWlhIYY1vonolxlRJ2M643QRDG
         IY46vFxpUiI03D/sGCO2Uqasv3Ka8fn3MlmXlmyMIv+k6jpdk+kG0hFcQiQsgka5/dvU
         on0WL2ijRauengP5Q+roS6+L9Dt8cS59bcsQ+BsJl3ujdQ76rAnM/LDeEbghUBzdh6bA
         2j37nlhfFEFASAg9aE/ltgQgcqg67NhJ8KcbHyVpWj47CFoYGS0V462UzplDE2m5PjIW
         nKWGFdmQFhADxRbdTWwzJxvwMpdyZvhTo3qVHhDSlZXLjPEhYQnswNwiLEBgWwrN53os
         wZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617849; x=1775222649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bY74UhjM4gzlwNhf6XzZKBW5M6iBaLhGIe7w2cyyBQ=;
        b=MLhGcJz3ZEB/sTgMCvcfybAvJc6aQ6HunOSHYfX+f5Dxp6MckNDY9dzEaPNKLx2u4Q
         9hEs0ni4nv5J+6nTh+vHDIjJ3pdpNgHB09Bau+L3oSFbNPgGrwvnYkn+VrlgjD2IOqli
         5g214+mpV0dmGm5yWJSWFcWlilHxEseB1DLHZdE640EwipSU3CZkFwcbr6TOs1V6St9U
         Qk8x7btgj1M5VNBCVgxCwstA6Zehn/oMHnpjUjNPRcFbjU3TTfr7S3DC/mQMPCYl++X0
         UnPZT1kwTn1zfuvmnSZv7lFKp2JODRHgCIHkgc1vcdWDiUdpcMon9vzgs0Pm2Xlm71Uq
         REeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/e53BFaYlvCOc35e/19x1qUf/q5/UUVtxUuFi2AYVf6/tgrwvfAiCzQIPyc5VIHybhxeF1vH8vRms4gx7wiVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCi6urZvaEqeGF3O/FfiOOVzIHyHxIEGBEUYjObo1PUao1DK/
	6e5ygl/wj5b4Cu3HUbeNyeigAqLAybQVMFirnEtzsJ7fBsfIZsQsNfgBR6rBdZhZBrfwC0o3Bo6
	duUm0WIAoNEeICBbCYJvYC4hU7trc+gaQl8rcQ8LN
X-Gm-Gg: ATEYQzysDrSWAu+qfwU6/2Eih3ifMJe7ll1LqFCPLbjNM5hWM9PcPTodZeoT6ArxzYO
	kUEif4V4l0Z5BlvoC8/JfpdrS5/tXzK9O7aA/wGrfflVzyF18+k5msttZhZdqQFsL4lGW855aI3
	L9dKxqLIZdAA2+pqzZ13xRyLeO6/MiBu00shJQyu5Zfs1lDWkoVqg5+dleBmdKBGa/xFE5WwuVu
	n7BcdcCcwdrv/LnfuejYXvXftJlT5P78NWn9AbgiDPB2L0pe88OM9Xcm2Ye9yk19MZ+sHGIZG2T
	TNeKhbgG
X-Received: by 2002:a05:622a:d1b:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-50ba318eb6fmr13176191cf.3.1774617848903; Fri, 27 Mar 2026
 06:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260327130047.21065-1-will@kernel.org> <20260327130047.21065-4-will@kernel.org>
In-Reply-To: <20260327130047.21065-4-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 27 Mar 2026 13:23:31 +0000
X-Gm-Features: AQROBzCC10PnLcTP381DSEChdZl5cJJMbR_OpsHzbEE59JG3IBeGP0k-sEwEXIY
Message-ID: <CA+EHjTxNTiMpM7c-YwvZpW-n+2s0sNrFa7qMCeepf6v1LJBeFg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Don't pass host_debug_state to BRBE
 world-switch routines
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_062411_887678_1AD24398 
X-CRM114-Status: GOOD (  19.52  )
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

On Fri, 27 Mar 2026 at 13:01, Will Deacon <will@kernel.org> wrote:
>
> Now that the SPE and BRBE nVHE world-switch routines operate on the
> host_debug_state directly, tweak the BRBE code to do the same for
> consistency.
>
> This is purely cosmetic.

It is indeed... until sashiko proves me wrong again :)

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 84bc80f4e36b..f8904391c125 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -156,8 +156,10 @@ static void __trace_switch_to_host(void)
>                           *host_data_ptr(host_debug_state.trfcr_el1));
>  }
>
> -static void __debug_save_brbe(u64 *brbcr_el1)
> +static void __debug_save_brbe(void)
>  {
> +       u64 *brbcr_el1 = host_data_ptr(host_debug_state.brbcr_el1);
> +
>         *brbcr_el1 = 0;
>
>         /* Check if the BRBE is enabled */
> @@ -173,8 +175,10 @@ static void __debug_save_brbe(u64 *brbcr_el1)
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
> @@ -190,7 +194,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>
>         /* Disable BRBE branch records */
>         if (host_data_test_flag(HAS_BRBE))
> -               __debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
> +               __debug_save_brbe();
>
>         if (__trace_needs_switch())
>                 __trace_switch_to_guest();
> @@ -206,7 +210,7 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>         if (host_data_test_flag(HAS_SPE))
>                 __debug_restore_spe();
>         if (host_data_test_flag(HAS_BRBE))
> -               __debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
> +               __debug_restore_brbe();
>         if (__trace_needs_switch())
>                 __trace_switch_to_host();
>  }
> --
> 2.53.0.1018.g2bb0e51243-goog
>

