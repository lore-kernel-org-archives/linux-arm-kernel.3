Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41721CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRNv2LUnqB0I2/Pwnw7AHbbTwUE/DoMeioJdNlkHPNo=; b=GS06Q8NAgxP5BQKk+Q/saXhiDu
	xCin/pz2Pwpa8DcNmWRiOIon3WO3hMcxRrb5MTDHxMFGeMyqRyLKxLjYiEV2GJK1xTdmjWKV8lm9D
	2R56sQcDLtAK7w7HuN3L/ZI0dK4LEszP4C8CtLOs0bRvoQJwN5shaSFVhV7qjCp6Pr+T8WGRiJ58v
	/rPq7Tb41EipLeFX1C4Ls+XJaeM7DNH2PsY9jxVkgbLJIAxNp1mG03Xf27WajNDd2XSxWFyYDGPaP
	XWVgUwCZ4Wpl0IE7MJQUe0s1rzbWcUugpKuklnG/jkuCnX4giKlUVJfD05Mi1KYfK/Hf7sj9IMdOt
	CezW43wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPH9S-000000010GD-3REN;
	Tue, 19 May 2026 09:54:14 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPH9Q-000000010FF-1NLg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:54:13 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50d6b393d60so5401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 02:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779184450; cv=none;
        d=google.com; s=arc-20240605;
        b=jWfUrZ4dJobiPJ5WCaiJIBEV8AJGBjG3IfSL5wLlrh+E60/MhPZTjhxnlXXFAWFTe8
         x8fH+Z41zIwIxp9zvIS0DpSZL6aK4Vd/P1/Nq/49nP5ey4pR33dI/dbkin72htJlPwqo
         UmrDWc/3EhxOPxjSVN1YsNoqMSWB1kVkmVAFPsveRzPjytFqPxuYvY1BCXHA1f4e2uK4
         qGC8Gat501UKQ4QxXSEJePKy+sW2ussNuCkF1kPWmV4ZuuaueDxRQ+SLQ7ZA4Lg9HJKO
         MGwSnehNmNk0b4zxZdMkLJocacDOIw5dtBpzSjeG9NfCE5GQcoIIJjEdlHS2iY8zXB2C
         DioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VRNv2LUnqB0I2/Pwnw7AHbbTwUE/DoMeioJdNlkHPNo=;
        fh=gyq2WRBo2UhvuCj9gYFDWuHZkRytuSF9hsrfAKMUHjw=;
        b=FZGQnTEES/9u+AYZJlSB7IE+icLJn0YiMwC8RjfGpspeF47VhshbK41oLd7ICh8LlS
         7M8wqUqmzGbT+djLtx+Svv26pOnSIOf9q6NpCyttWnObkSgF9xh5KOKLdRtF6Jo1xMbe
         F9j6Q+0gmdoQ+Jd2sGeDPDCqSkGWDV90DdFUNTVl0ygAoViH9SOfhoiu9yFC1fZhBpa6
         14ZUjbW1i2fjqDeTBmZYIEMVFk141vSKnEnGWoG3Aqqm18qnB+Zbpz1RG+0QkFCqLeMK
         pHSC25GYhP4rqAbgJXSP0wLyxkGZOK4fBi3AcUT66+3KwP5IsjQyR6r5v93+CW3eVoOm
         xpCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779184450; x=1779789250; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VRNv2LUnqB0I2/Pwnw7AHbbTwUE/DoMeioJdNlkHPNo=;
        b=ZR/NZ3nXX9ByvlseDZsfaIQrPLKV8T8lrt+uuwimY8nxyhqUBrfu0hvGZFLKjZVzYD
         6dQkXMq2rWuzYMobXNmFf3PoGUg8fvkwkFew/mNgkDVK6Q+Z8en33bWGpkIPqg2cWgjn
         b3nRln6CD3M69QBiFEsbCITu2sMBSnBpk7Sb33fVe+xh0N4+8qKDbpBXEN4j38JIyI2J
         45jkQed0VkCW8edmj2ei4Ld59oRaXoeWCY1Gx1L7rN39+N96SFJn2oTSky1eEYgjuvWC
         u2XzeQ5GBy+Th4lBs3Jo7vz/3E3KiNQuo0N6ljpNkCbdo0TOo7nLZ+250EeYN3Gk8kZD
         kMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184450; x=1779789250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRNv2LUnqB0I2/Pwnw7AHbbTwUE/DoMeioJdNlkHPNo=;
        b=cZmC7mimlCUOkdv9bYyc6Mk05wMovoYI4vZSDa7nJycAQbwrPuTJIelul1vjfHfrcU
         Jh+tyFVfnyfQoO5g1FYcYeFwaSt9SoWX3OAu61Nq1q16rgmKB4GpBZ2wkSfeIUtuBTsP
         vTOTAnywBOF7tIIz+inSDH6D3dDNY6xapS6f16w2wysNr7bCGckwXRtx1WGViO1o368m
         RmVhecBZGZev0T0ppn1QcaSYEDDXkDUiFkriIVTgmFmlpVVpDRHp8klcetrteAXu5kYW
         5wuWZJaN+VlJw8RlISCViogjVqWQhQCyG/d7tnVb7iA1AGcp57CCY4qfff5WZEUlfSHI
         jkyA==
X-Gm-Message-State: AOJu0YyzyVFdFTnb8K1PJEFd9il9AWVDtL0L6DPV27gB9OB3LYC2jyvO
	I1yWhP3DDK7Ut5JD923URIijqAoKU2lbHQBpXOnKCvp9WSWDJjobtPF+M/aAsfnK4d4thdeRyUv
	4Ktmcic+oCryxTNnWeDOt8AyQHYJsqrl9oLuGljZ+
X-Gm-Gg: Acq92OGHFuOukO2bYZUIm/Esip6cWjLEv3yCTdkcvuw6Eylk9PgFBIsUOWo5Jyzjz96
	gxCALGCXw5YOrzQWeTXezBCJIC7hwQFnZPGcVMy11fKYpQO/l+3tgTpEscFB5AzWX+4sU6A7fjK
	yxnKvYfyOzJk0LtVO7fPyCEOqzxpFsfwddedxY3kMBLg98+acvQYIr+E/Pd78xNWoAl32/iAAQh
	Qasq/x6nMZCRdfn0FcsCIXzRllM8l7RTmC9oWnC+w1p2ZFoylHaZz9Gv5UUrcovkmZNh2OW5j5e
	1wsskW+L+zLp8z3rodVXrskqXj5SeI7iJ7LMkI5AVHLdRd2t
X-Received: by 2002:a05:622a:5590:b0:516:4f62:85e9 with SMTP id
 d75a77b69052e-5167943e78amr18402511cf.20.1779184449660; Tue, 19 May 2026
 02:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260519092243.7278-1-will@kernel.org>
In-Reply-To: <20260519092243.7278-1-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 19 May 2026 10:53:32 +0100
X-Gm-Features: AVHnY4Lk3hWZ4v6bl-ajxMDKmFzz55aDWu-c56F4QHc5SYU1-46EuP5FIAfg2qA
Message-ID: <CA+EHjTy8r7Zw4fNXQsU68sUviH2BuSXEZKEP1hOotanYk3W2gQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: cpucaps: Keep entries sorted
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_025412_377979_1E31BC62 
X-CRM114-Status: GOOD (  21.93  )
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

Hi Will,

On Tue, 19 May 2026 at 10:23, Will Deacon <will@kernel.org> wrote:
>
> The cpucaps list is supposed to be sorted, even though the awk script
> which processes it doesn't really care. Since this isn't enforced or
> relied upon and because the alphabet is hard, the list has gradually
> developed an ordering of its own.
>
> Re-sort the file.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> Marc pointed out that HAS_BBML2_NOABORT was in the wrong place but, on
> closer inspection, there are a bunch of misplaced entries here. I
> honestly don't like the churn of re-sorting it, so an alternative is
> to live with it and remove the comment at the top asking people to keep
> it sorted it. Any preferences?

The resorting looks correct to me, but this is bound to drift unless
we enforce it. How about pairing it with enforcement, such as a `sort
-c` check in arch/arm64/tools/Makefile, or an awk rule in
gen-cpucaps.awk?

Otherwise, lgtm.

Reviewed-by: Fuad Tabba <tabba@google.com>

/fuad




>
>  arch/arm64/tools/cpucaps | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 811c2479e82d..0fc05b5026eb 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -5,6 +5,7 @@
>  ALWAYS_BOOT
>  ALWAYS_SYSTEM
>  BTI
> +HAFT
>  # Unreliable: use system_supports_32bit_el0() instead.
>  HAS_32BIT_EL0_DO_NOT_USE
>  HAS_32BIT_EL1
> @@ -14,6 +15,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
>  HAS_ADDRESS_AUTH_IMP_DEF
>  HAS_AMU_EXTN
>  HAS_ARMv8_4_TTL
> +HAS_BBML2_NOABORT
>  HAS_CACHE_DIC
>  HAS_CACHE_IDC
>  HAS_CNP
> @@ -26,41 +28,40 @@ HAS_ECV
>  HAS_ECV_CNTPOFF
>  HAS_EPAN
>  HAS_EVT
> -HAS_FPMR
>  HAS_FGT
>  HAS_FGT2
> +HAS_FPMR
>  HAS_FPSIMD
>  HAS_GCS
>  HAS_GENERIC_AUTH
>  HAS_GENERIC_AUTH_ARCH_QARMA3
>  HAS_GENERIC_AUTH_ARCH_QARMA5
>  HAS_GENERIC_AUTH_IMP_DEF
> +HAS_GIC_PRIO_MASKING
> +HAS_GIC_PRIO_RELAXED_SYNC
>  HAS_GICV3_CPUIF
>  HAS_GICV5_CPUIF
>  HAS_GICV5_LEGACY
> -HAS_GIC_PRIO_MASKING
> -HAS_GIC_PRIO_RELAXED_SYNC
> -HAS_ICH_HCR_EL2_TDIR
>  HAS_HCR_NV1
>  HAS_HCX
> +HAS_ICH_HCR_EL2_TDIR
>  HAS_LDAPR
>  HAS_LPA2
> -HAS_LSE_ATOMICS
>  HAS_LS64
>  HAS_LS64_V
> +HAS_LSE_ATOMICS
>  HAS_LSUI
>  HAS_MOPS
>  HAS_NESTED_VIRT
> -HAS_BBML2_NOABORT
>  HAS_PAN
>  HAS_PMUV3
> -HAS_S1PIE
> -HAS_S1POE
> -HAS_SCTLR2
>  HAS_RAS_EXTN
>  HAS_RASV1P1_EXTN
>  HAS_RNG
> +HAS_S1PIE
> +HAS_S1POE
>  HAS_SB
> +HAS_SCTLR2
>  HAS_STAGE2_FWB
>  HAS_TCR2
>  HAS_TIDCP1
> @@ -69,7 +70,6 @@ HAS_VA52
>  HAS_VIRT_HOST_EXTN
>  HAS_WFXT
>  HAS_XNX
> -HAFT
>  HW_DBM
>  KVM_HVHE
>  KVM_PROTECTED_MODE
> @@ -83,10 +83,10 @@ MTE_STORE_ONLY
>  SME
>  SME_FA64
>  SME2
> +SPECTRE_BHB
>  SPECTRE_V2
>  SPECTRE_V3A
>  SPECTRE_V4
> -SPECTRE_BHB
>  SSBS
>  SVE
>  UNMAP_KERNEL_AT_EL0
> @@ -110,9 +110,6 @@ WORKAROUND_4193714
>  WORKAROUND_4311569
>  WORKAROUND_AMPERE_AC03_CPU_38
>  WORKAROUND_AMPERE_AC04_CPU_23
> -WORKAROUND_TRBE_OVERWRITE_FILL_MODE
> -WORKAROUND_TSB_FLUSH_FAILURE
> -WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
>  WORKAROUND_CAVIUM_23154
>  WORKAROUND_CAVIUM_27456
>  WORKAROUND_CAVIUM_30115
> @@ -128,3 +125,6 @@ WORKAROUND_REPEAT_TLBI
>  WORKAROUND_SPECULATIVE_AT
>  WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> +WORKAROUND_TRBE_OVERWRITE_FILL_MODE
> +WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
> +WORKAROUND_TSB_FLUSH_FAILURE
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

