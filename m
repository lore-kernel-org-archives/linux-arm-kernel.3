Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B20BD358D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mie6pCcIIw47fH1gJHDTDQWilzzUt5ppA4ofEa1Bgr0=; b=YzAhOQbkxRW7YjiApLmGtvJCOF
	xspCCv+iQ2Yzg7SRRMwClsHp9es9D2WlGVehO1A8ZkPMs4cuKxg+qWw31Iv0ZQD8X+qZMuLmo179S
	nBFhp/ktT8Uzyb6fmEBVDsLQC8njik7cWiDHb04w9VQkD/dbqXJ3UjeA/h/7b6N2QUX6xhxrfehBf
	DLpJ763p4F/aqGOTwTINyY9NeM8aA1LEHVwCdYKtQLUe0DPpoB9sVBF0RNmbpN1DoAE8WExBLfiqW
	G6gILu8S5Oru9B5pYPoU4zN9jUUqnpLMOLelfhZOm3CafTj80m7s7NfQH3rI9S+ziqSiBpIDU5WoK
	vL6PqNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV6M-00000000MYf-0O5l;
	Thu, 29 Jan 2026 16:42:38 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV6J-00000000MXy-2nm5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:42:37 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5033b64256dso445601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769704954; cv=none;
        d=google.com; s=arc-20240605;
        b=TA9J7nK+HS0ySvkQLa7l310Kz6SbJjywRfroEwehDgV7+JWoLE8ym3lP1ZCOXPvsf+
         yFPJTaDc68vNrzkIJv/W24tJ+aGtLKXzq3QBxDJ/830anUVIPuXTPJkhF1l1oiVmfs0K
         /zcv1Eoz0LSZjLB4FGyKXiwYHi9WsfOwj8bF7kQUUg7ME1M+zm7S3ApXf6OtAQdQn2Cm
         kP6O/3TPOGiJvtTNvVmUrKBpWj5aM6FDue5YpOBYQsUTyyBJkKhi2JWooSVOyKikx9UC
         Cls1Qp7PNxFjpESBQI9Ab9D/SsHWp/zzPMmpEkAngmY7Bdg0kFuNTS4Z1qBNqBt/jedE
         Z4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mie6pCcIIw47fH1gJHDTDQWilzzUt5ppA4ofEa1Bgr0=;
        fh=3gtOqAn1OjqR/jFgWpEy4J0pCXuXqUGqdqTb21p9Ldg=;
        b=HmwkfBjyUQRyscP/+H4DGyKuEQORxH+e1whRjKpp+ZrcVlNaxtGcM8e5ccmkAsDotY
         qY0mbyC/aCz11UPLNz/ljnOwULO28QZQWUIJFpN6bVs+NRZq/99EBP++QFEMFt+3KAjR
         2VYckjcY9OrMmC6JyZR0lwxQsEs3jAWVsNH3A0JpkwtU2FuYOJS78eVjSegCZg88nDsE
         oqMbgV0wcZ94mLGHU90BLvWGL/HGFEIjmYuu+iote3l0tdeE5e7+ibGdKQ8VDcxR7Iew
         sUuvrvwTzYtBQuAJ9RnnOgjHOrF/PN6sCPsqg2kDNpfc+rq+EJ4WwcLVq4avFCvTlrbV
         Q9Gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769704954; x=1770309754; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mie6pCcIIw47fH1gJHDTDQWilzzUt5ppA4ofEa1Bgr0=;
        b=2/ZvTL1P4afvp7h/qHYZk0jGNtBm+IocZ8+kA5LxBfevw0kM3yppPYYM0XLaf/WPZD
         amGcl9dQuKxe1WV22BuVXijIm13Y6AnVSHDkiQE8IBNly7ua+DG1/o0oCWLlM/zjJxty
         m70EHiMvmYVlQ8fkUFvJQanGax80Bo0LAYJSCRFgmkUZSU/5pvD8Ymrv38D+00+Nqz2E
         YbvnQF+NuWJWgkroMC0SB9ty8eyd8qJAsDYhUaQ4HjFxQFkPDvEDU41bACuXNYDrq9NJ
         u26TeVghwqsxdkXgkZrVtoq6ICR/2MyiflkeX/gfMctgq9LGm8atgHtEicA63CU3Hcyt
         c2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704954; x=1770309754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mie6pCcIIw47fH1gJHDTDQWilzzUt5ppA4ofEa1Bgr0=;
        b=rfiTGulQhy4OjN4MvxwWGXhoYDOdPoXn58Y9uJYpxPHYHs9BRCpLNMF/hCMfsdVqT3
         oqkX5rk/1V0GY57ypL7rLDEzT3kgfH/PdljlWTegoEqlTXeAEyVvMBAlNJEy9S+Dnqyz
         +H9cPDWRY/rP7jOxTp/IMEq3oJ29z9bhmOju47V9ItU28AuXqVDk597ls/lGEQVJLPKC
         vNSIqEuPiKDFLUIHSfydv4LsBEQpIHR6jPU7Cv5Oqq5G56o9w4nsJvCYx5RBNjz5hfxm
         KtfkylCdCkCopuj5zfAo6DS/8HethKd5sfnHMqGEKsw5mp8+q5BM2Baj0+RS/qk8xXcm
         2WLw==
X-Forwarded-Encrypted: i=1; AJvYcCW6zW2/zqRtp8qdLPitYnVCMpvrHbTyErLrdlk+rCn/vaCCaldlP/7i/V3PP7C1w9JF7f86UDhcX3Nb9pMIH33b@lists.infradead.org
X-Gm-Message-State: AOJu0YycvrvzNTuWTv/gnVO9APWgtc+bP1pjOlVebS2chZFw7Sf4g35E
	FzhMsUsnNVMSgfOcw5DeZlFm3cl0OQMOnsE8PwZITI2L7DvrimQ75m9Hf2BlHeDq+BVqK6wJQP9
	fWZ/ubLyJWqnWDEX7hENBPG444mvdPbpuht6KgoFM7KL/uPmuFA44j6v3F2I=
X-Gm-Gg: AZuq6aILfm7HezD05A61m3jAUYFKdOaavounAeMn1Vspij729YAz53mxbQHE+ep9FXV
	00g0xp4Qc5Znx7vd56Mf+ilpTuZ8a4okOcN+9rV/CtlQWCW+1jWHRVEiiD25hYN7aexxZccEzWu
	IFiCwADkTrALimfZGRplpao9S1MLn8fDHfO1zsxF5MywPdMoS+cjqaDD7bSTdDtfvDmf7gnGpDB
	y+icdJ31FQqipj5KFhTY1xv27SbBJqjT97uKzuzyP4GFASy1XS8w8LZHQPV5IIDctZ5fnNh
X-Received: by 2002:ac8:58c9:0:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-50428e79945mr12313541cf.3.1769704953904; Thu, 29 Jan 2026
 08:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-15-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-15-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 16:41:57 +0000
X-Gm-Features: AZwV_QgUsDZZ79om87g5fzEjBCiqAJNzGck6Go33ZwAHIlJhkXiSMYJ8ttr0Cec
Message-ID: <CA+EHjTzf4TLO+UOkbsqzEuzaaPQgHFjWLpRRrn0jZDndcSGMDA@mail.gmail.com>
Subject: Re: [PATCH 14/20] KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_084235_747721_2523AA16 
X-CRM114-Status: GOOD (  18.74  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Now that we can link the RESx behaviour with the value of HCR_EL2.E2H,
> we can trivially express the tautological constraint that makes E2H
> a reserved value at all times.
>
> Fun, isn't it?
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index d5871758f1fcc..187d047a9cf4a 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -394,16 +394,6 @@ static bool feat_vmid16(struct kvm *kvm)
>         return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
>  }
>
> -static bool compute_hcr_e2h(struct kvm *kvm, struct resx *bits)
> -{
> -       if (kvm_has_feat(kvm, FEAT_E2H0))
> -               bits->res0 |= HCR_EL2_E2H;
> -       else
> -               bits->res1 |= HCR_EL2_E2H;
> -
> -       return true;
> -}
> -
>  static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
>         NEEDS_FEAT(HFGRTR_EL2_nAMAIR2_EL1       |
>                    HFGRTR_EL2_nMAIR2_EL1,
> @@ -1023,7 +1013,8 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>         NEEDS_FEAT(HCR_EL2_TWEDEL       |
>                    HCR_EL2_TWEDEn,
>                    FEAT_TWED),
> -       NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
> +       NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES0_WHEN_E2H0 | RES1_WHEN_E2H1,
> +                       enforce_resx),

If you were to take my suggestion for the previous patch, I think that
you could express this as follows:

    FORCE_RESx | RES0_WHEN_E2H0 | RES1_WHEN_E2H1

Or if you use the modified patch 12:

    FORCE_RESx | RES1_WHEN_E2H1

Either way:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>         FORCE_RES0(HCR_EL2_RES0),
>         FORCE_RES1(HCR_EL2_RES1),
>  };


> --
> 2.47.3
>

