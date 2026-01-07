Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5585ED0D16C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=; b=PWQgPkg8L2f5m+hP2On9EBrbJZ
	eIHAseDDhbtlb2QsD4k3dCaxNILNR//EnGFv9LidUly8rLUd0XI04AAlX+0BM6Jr/dgYF+l1njlMH
	6kg4wUJWmljIbY8Vprmgks6I2JUEAD4xD5wTt5jJObP6feIg4JKVeoHJWw8GK0pk1x88JpZKUTmiE
	+q1jMTW/5G+QuFpkwqM5oQtpJR8Dgt6jbw/ERO7BOkdJyeSv8WVEc6YywbT8Y6G5sIjTEFzvXPW73
	j64VNbfEIA9uIU8hhRXUmvawjLT8470ySyA+rf3icQzZSVHtsMbnVtOUCvgRo5zlug5jm++gJ3upY
	SelIpqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAM-0000000FXQq-0Ym1;
	Wed, 07 Jan 2026 19:25:58 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZAI-0000000FXO1-1hnq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:25:55 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4edb8d6e98aso720171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813953; cv=none;
        d=google.com; s=arc-20240605;
        b=T1qhh6NMdxBOBvdmIM1ICOtLNSSkaa3LPQiqxQrZH8PADj4VEo0qHKaQi40CrddInv
         BgDBgVdXaFOiDwkfak9IfYkRbxb8bc5PboFa6mNyR6ngz1EdmEpCzcBd1EXWnd/+J5j1
         exE2BEuqigoRa0I/MfgZ6LkBKjH1+1CaafCCmp0oVY5+FFjN3jPuRe2ryCgE9uk4WMbh
         TQxlxUg+q9Cahot5NfxmUp0it66zVG4MDWSCdjJGqrtcx28uTIo0syY425Sc4eeZuDAS
         tzw7L5XnoSgn5ViZfecRYpG/SLQwhMuQmHoX0i31plfr15xgCahhzKG/JPUNeH4eOgdl
         bZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        fh=U90T7TgfaCg1HGGmcPsbNC/Zh/Kct1c1KDFOPGlZuKw=;
        b=M/CTosBy9lBDehsbnrGn2MlNMomK4JBZFgyFo9Hid6f/2YJV0jvHOihrwTd5XZBiBU
         TzGb/hLvN9VyHhTtVjhigbpyVzf3a1jMIBWtkpHT63JRPBXDJet+9b5k1NeiFVfR37R9
         +TxhBanKAgITEKaZpG3ZtE+RbG2uBwAySwCrTcYLVjpqLTza0f5GXvO7lndJkJOEu45g
         eWh4wyks85WQpH+wJD3fgz6XS9LTIcBIVo75/Aw3CZ6vDdZSdSm5I1quNC70TfjMb8N7
         w4ADPt/zSDhYNytvW7fRyfTVnHQzvpvlCuRQreryVqFJ0x3paFu2uah7ATOODE7ugbpG
         wmcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813953; x=1768418753; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        b=sus7Iw237Hgfr3+quWhIRepUkail6I72VT16iIGZ94+GJHyiwUZvzi671P0HNraFsa
         5T6fYpy6wVARPPXE8kqRIR9RCeGDshftEwnp2vIo9SwlzDqDk7Nr6bHbmtaVJlrsgctB
         +aBJZXfqLyO2EswZ/zgY39KiVxq+9tlaFEowOxqCEWPLYglroOKIW3b2tS1FNI9Dpt/L
         +jO7Ok0fUi0NCLHxjXfDEoX2Cnn4VrcJcAW/V7J4SFETpIAOs6G2FNJX9P61EhfCc7Gy
         tXAQVKJz3bUZ6XjXuu53Sr3IrWdsMyuEZsraUHw49m4ND0a+Aflve1/E3ljO2vQBU0Vo
         HpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813953; x=1768418753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        b=AWviyTRO3Znqk+Lc9PWkSBpBxJqgrI8eIhGKP6sOlrw8JqhcDaYn4aSoZHAmbcKwRi
         SX6+tWaj/3IQZdTCRZLVK6xvUEdncQGsUAxf16s5dULNNEbEPLo51HdUYO+HVP6FXqAS
         W0dSoa6QA8BFdr7kw194/naxCfYt8Q6La9GCtTIC56JD5imEXyw0VJbjKXK5OveooSZ6
         E80aMNt6qKxJsXZK8zZx6xfYYzKgHSRernO7GoohMbP3cNKpOcZrAVc/EnNli3BSVX5d
         yvbPDlMd+bKbpNilO2Q2eqHTVdRkrxpc6xq7E0d0wJ2wqhawBXyzOGIDs5Wd+cGSD/Qz
         fOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGk7aKTd29lwqoGWZFaTVNTq8CSoule51U/6YeJeyCVn4Ok10o6rM2YZ02JeIvvXvTe4pNyJbV2vu6aKqjqNQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YxkBVRdzDG8ffuIpdan0pVhv3oN3mIx+yRJ0ocJP8hUnFqcRXok
	5R6+zzU7AJD1s6Hc53yvXtY/ku1hGGbKbPYENop+cqngkSZsAVMtLA57V+mCC1m1oziYRTggrRX
	PN3HMzdPr5+p8hpfyx7J0mGA/1aE+EW0aoY03a+zp
X-Gm-Gg: AY/fxX5Hi8CFS/kX6oeOY3n0Ofld5djCxPNZexp7y14DjErCVl6AufBWoC8TdgIVdTT
	w5rNqMpjCcISYBx0b5MtwLKrZ9H7wCvCFhk+pDGrKxDu84KIEK7QkLS+yjNI/O7UfC8VRNwVJOt
	KtvJ3prY23mw6xikvkrjl91FoRWJfXLuIPI+r485h7dP9TB0z5roJBnLlMuhaQakOpF5mAIStfd
	Tkdv4C/4onJ7IHkGtSCZvFZs6txH2XXRcGJhEy/D+RNcSOS2bdHjhjnMDwTm9nPMMAsnWJS7sUn
	koOFojs=
X-Received: by 2002:ac8:5e06:0:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4ffb3e48178mr14762551cf.14.1767813952742; Wed, 07 Jan 2026
 11:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:15 +0000
X-Gm-Features: AQt7F2r6YVCRnMI_bYmOfq7HyyiGhMeA9fZkYBf6xbcFUjdNaJYVtQzKKg3T4fA
Message-ID: <CA+EHjTzDxJsLi315RF43g14psdv44YOuxk6dP6SLgFz4WaY4Hw@mail.gmail.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_112554_450897_7F9372F1 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> Currently when deciding if we need to save FFR when in streaming mode prior
> to EFI calls we check if FA64 is supported by the system. Since KVM guest
> support will mean that FA64 might be enabled and disabled at runtime switch
> to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kernel/fpsimd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 887fce177c92..f4e8cee00198 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1948,6 +1948,11 @@ static bool efi_sm_state;
>   * either doing something wrong or you need to propose some refactoring.
>   */
>
> +static bool fa64_enabled(void)
> +{
> +       return read_sysreg_s(SYS_SMCR_EL1) & SMCR_ELx_FA64;
> +}
> +
>  /*
>   * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime services call
>   */
> @@ -1980,7 +1985,7 @@ void __efi_fpsimd_begin(void)
>                                  * Unless we have FA64 FFR does not
>                                  * exist in streaming mode.
>                                  */
> -                               if (!system_supports_fa64())
> +                               if (!fa64_enabled())
>                                         ffr = !(svcr & SVCR_SM_MASK);
>                         }
>
> @@ -2028,7 +2033,7 @@ void __efi_fpsimd_end(void)
>                                          * Unless we have FA64 FFR does not
>                                          * exist in streaming mode.
>                                          */
> -                                       if (!system_supports_fa64())
> +                                       if (!fa64_enabled())
>                                                 ffr = false;
>                                 }
>                         }
>
> --
> 2.47.3
>

