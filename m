Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C76BD2D10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=; b=VjgOfsu1YV4cxLTImFO+IfKYny
	wNeKEnKby4UZ9mvJUn/K6c2C/wK2UX3sCniTkdX3Z558U0ScLQHW16CrLnlBPkQe3stsMJV4pi1H9
	HTXbaz70rCnQDCvxyMDjkhyja2yySMOeO8rg9Obh7B5C/Lz80WkWWWNbREyKjLLpOvMGFoQU5qxRO
	+mCncPIoHrFgLT6SXWIH3wUWioSW6C8OPL7KQiQJGFoPhSd27GO893nyZylo9/06eRnfh/SYw/NCn
	Ih7ok3FSKwfu1RnWUKTUzi9U+Qj2PDl2HGpj0ZIb+nFAq8ezCrqMUtDksq2AyYv4idYrTEU4QZj80
	Vi/xDS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffXc-00000007H14-02Js;
	Tue, 13 Jan 2026 14:38:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffXY-00000007H0W-40x4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:38:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee147baf7bso320871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768315116; cv=none;
        d=google.com; s=arc-20240605;
        b=drVT7muYDtgwIOHLXCJdlgFbbuPANzZfiPo3vp5rUKdKG1M+zCs056WO2o5DDK5u2F
         8KsWn40Ymjno2tlN6kJyIHS/IFO6w4paiNUieL4NkvdDRDa5M59OzRUsD48TOIc5j297
         aDQy/URUucmBgrTXSjdT3CF9uIWO4ouVbtKmT3yY60t//faftYUoe05/EOuLw27yMump
         w6Z9/QGebz8oMiktog4oUjz1HtqrkYMBUF1bAewsaxYYyHlqgKyTAo2TE6JimP7yuyrz
         foVRPX2QyOVs4AZnHiXw0OzSaOa6mzhaHVNtxfbnxvkDuGbS3mWg3oLBpiUxzi4x3cmP
         zKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        fh=Ny/D20tmkw08kr8uCpTzfcMb5U84Nhzei0vw9UouADo=;
        b=lCqGFK/kH3F8/0oP7Q0Oyz3oiAQ6v9THYSw7ysYpRPenQMw2bQoK56sx4L1oluUt5x
         wdCQqf5oIDxZdyrljH2BRKR+vAV6RcnTqvAIDgm/4bpveYAuafblvQgStnSszZEDo/M2
         L9myA23qBVP/RnzSJAyOhe8M+DpjM4DWmrSXyxO3+j+MVLRCZ/bChlGj8BPyRkBUlbz2
         7a9tZH6DjTwsgMd2zMfeMAJquTzXnqvceTY08pfKbSGmRCkEqCpjrCz/VYby3u2YO1wc
         /S35LpJytRNunfMVRDDCFUTo9dehTi06tJwehiiawYRSVzEurxxAGvjh1ITYmzJiU5pf
         IUeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768315116; x=1768919916; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        b=4Fol5/+xh51B7/ynj3mC139AejdvE25GiN4jKCOBox1i7t9pll4UXVJS0kJn9LkfiU
         DxEynxn5RVM9pvwfkTSCpBmj2efqxXf0gJN4b70RNVuiAtwRllXmVBdLLfFASFI0gOia
         eTy7IjyQsWYCVmxfisLS9vpaRT6oWNPPfuZH4cYHPqIAeeQCUt31DEMqEVOM8VxQY0QI
         1N2a5dhCrbWHCZOcMO8W0vDPZDOPrhLBm8tLRICW2R2h/t8TzWX3wSMiiilt7wXFi35y
         6p8t05OWhhb9me1ghog4D+Mx8jmBXQdVq5nXcTCSnS2OL/Rqje2DUda14P4isZcySwDf
         cd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315116; x=1768919916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        b=Zg4IMYGLRdnHuuUAadGfZkBdh5xYwn0JqVOnusio69cpj6YCRlRiMtkiciEUbELjCP
         qoUpNf+gbGIczozhPLYeZ3L2msV9Zsnr8Ep7DGx2OtElxuqt2nkPf8rQLhWCcLIWXPwt
         fwOEVcpAxXbGRUFFjX6OT+ws1EoFpd7SaojUbgNY5qBnwAU9S8PKnS2GLkr/5jfg+Uye
         VgHnvMN3r7QeGeJ7GVg3qA1uT3JM1frcIIE70uvCR5j68iVWDFMM8tU8V3xBOOakG2B3
         PENCk1x/hLmZTpYgPaZD+dg68dLlehC0FH/On9BVdWghl+JEXdm3wU7ZHSJFSslmTsF/
         kWtA==
X-Forwarded-Encrypted: i=1; AJvYcCUUQ20V/H1VgUV+6kR3C5B+qlexrOzY+9Sh4sevaxqWlfsMPY59HQ1v+w9K4U2dRQABnsbV8Lb0dLWiDrVCN2uU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4GgxKjX2k03GgANaPuDP1Co4CZHdcixp5biGp3vpm6UwyM2wz
	iGwk68+rRgYZd9WdKj2NAaY/ViYjAhuQCByxaJOX/V6mjnSYwIqUwizZSX/50aRfrSz3q8VaCD9
	dArsbbUrg82vPrKXw88WRduUnStLzAZbgBuzX8gCQ
X-Gm-Gg: AY/fxX4QSnwl3otn1JWqOb3crzusk4LtWKwl/hFHrCvUr+6qapJEAWy4HMjjwjum5s/
	01fI3QXwValXN9Y7clU8o1YhJ4QEznYLslFTtCNtmA7I9iMl173vcJOWp9+ws6sgqeMs1uHZKc2
	yKrOEGyBE0cmBDKozXblOF+Jga6GFDCm7b0HtSmPOO3TBuLeNvJDJMjvtKcRLoBq4iBUmDyQ5b5
	mtjzAHk5xOj5cUfZ38gxNzDQ8EzCuHEQKY8nIgF8h9nlKFUjU3NHnk8W+BrjAKWGPk0teFopgSK
	lY7oWYiwUdHjLeSUsUGOkSBlxA==
X-Received: by 2002:a05:622a:90:b0:501:19ce:5bdd with SMTP id
 d75a77b69052e-5013a21b63dmr4606041cf.6.1768315114958; Tue, 13 Jan 2026
 06:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:37:57 +0000
X-Gm-Features: AZwV_Qi2DCwvCxhy1IBJRUhKVRAZLawBqR0npBrkyjREHFYNX_l_ocigtzC7uIo
Message-ID: <CA+EHjTwZCcMFT6gAM2oaQz5V_vqEBmVuggFBbABbXPvC+U919Q@mail.gmail.com>
Subject: Re: [PATCH v9 25/30] KVM: arm64: Expose SME to nested guests
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
X-CRM114-CacheID: sfid-20260113_063837_025145_430EE561 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> With support for context switching SME state in place allow access to SME
> in nested guests.
>
> The SME floating point state is handled along with all the other floating
> point state, SME specific floating point exceptions are directed into the
> same handlers as other floating point exceptions with NV specific handling
> for the vector lengths already in place.
>
> TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
> main guest register context switch.
>
> SME priority support is currently masked from all guests including nested
> ones.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index cdeeb8f09e72..a0967ca8c61e 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1534,14 +1534,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>                 break;
>
>         case SYS_ID_AA64PFR1_EL1:
> -               /* Only support BTI, SSBS, CSV2_frac */
> +               /* Only support BTI, SME, SSBS, CSV2_frac */
>                 val &= ~(ID_AA64PFR1_EL1_PFAR           |
>                          ID_AA64PFR1_EL1_MTEX           |
>                          ID_AA64PFR1_EL1_THE            |
>                          ID_AA64PFR1_EL1_GCS            |
>                          ID_AA64PFR1_EL1_MTE_frac       |
>                          ID_AA64PFR1_EL1_NMI            |
> -                        ID_AA64PFR1_EL1_SME            |

Should we also limit this to SME2, i.e.

+ val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64PFR1_EL1, SME, SME2);

That said, we don't do anything similar to SVE, but it might also be
worth doing that there.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>                          ID_AA64PFR1_EL1_RES0           |
>                          ID_AA64PFR1_EL1_MPAM_frac      |
>                          ID_AA64PFR1_EL1_MTE);
>
> --
> 2.47.3
>

