Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C42ED41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i666Zwd4elC4IZ8NbSZ0mun/x9mHfJ63jUqZOhfWrkA=; b=B2fPS/Etv17VM2bq953Vc/RRTS
	8YjuGBuTWQmfPAgeDInBIeLfgMogq9C74s07/CcQoGtdd5w4Cdf4kzj2CEnydO6IpT7NhBrhLidAR
	3/1TJBjNbH8bTJfHft7Q/JOm7yOmFjMFlEeyuS9Et62Wd+J4DRTs9ToDoJvSNosTNq41MpKqrFrK6
	UZhnq0n5UGyP4rmgdKPWF0K7eC9UYxk50FNXB7xrv019dgDk88hYq7ftSsD6IR87PwFUCwv6CNeDi
	ugqazs86CRNroCc2qTNkJ1JWozEY6OxiycRpVSVIQFNAVgAUKYHeF1JUV4zai7c5Oer7ZRFZcmeeH
	cTI+zE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgsT-0000000GerU-3y6w;
	Thu, 11 Dec 2025 13:38:41 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgsQ-0000000GeqC-45i3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:38:40 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4ee147baf7bso408581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765460318; cv=none;
        d=google.com; s=arc-20240605;
        b=F3YW7QEut3Llkw6DVPF/K6zs93RRevgOWkzeoAYZnNqTseG49Exn924DaAPT5POgJv
         lRyjkhIDW3lfVbnE0Cscq9nQt+NG/91m1fWedhgkqEH0F6Qfdy36x0GFaMIDLq54WvXq
         54zuVr73vF/iDMNfJU6uDWKoFD11N+OpABZ2OabVxxcYjoXsZHhAB9bwuf1K0le5pxvt
         xlaI/vw5tTYa88yviLv24FAcFBDpGb8stN35rAPfKH7y83q+4xVnisuqlXbasCLt9JK2
         dJuRJFm4JvIN+U7528uD4f/pAKBZafbvSDc4iy6SHwJXPohkpfHhvb3aCUciXnvxr6IP
         7K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i666Zwd4elC4IZ8NbSZ0mun/x9mHfJ63jUqZOhfWrkA=;
        fh=3n4zZ3DX5ga3H7SR2RfmfgJZ3ShOzF/DON6zJ1a8bOc=;
        b=aqWb3C2m9hq3aeVCs4K4gQWBI4GNGETuiqUFWQkm4kyN/+Rhlo9k+zF+tKCkyFl9/j
         4/bex7Ff2HCLbvLi0Mguy8vJWpQNjTkTLweTANE6a+tzRrWCM+jIy3FXAKdLbGIYm0ih
         lpSvUIFUCs/moxIAR5ZFHNvRXZz6lrH05o9pFucefaXN8S58mJgEBap+yZC6aUBBvx3Y
         J6qBXu6YQX8mTSvlkIJrJWFQw3Me033HKuCA075GLk7o9t0guVErujeok19zm62Ho7Uy
         VW6moWtrJOwYnsnQy0EbIMUUgvRQXoPxFXTbtsjPorfUc0/n+okKkbksBUw4+fLXfkKT
         eTwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765460318; x=1766065118; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i666Zwd4elC4IZ8NbSZ0mun/x9mHfJ63jUqZOhfWrkA=;
        b=o0UGaSKK/TSRhoSfnFujhKu9pssVFA3h2lUNHn9+at4vafwO4R5sdZuvgdLJgG7rNg
         xA4Q4sbilYRNV+4eM4ZMI/1IwTa/IaxTq5FDJilzCRc8zRtGgKofHu9MNWJyqBNq962j
         NFTTs6sYm81XVPxjw9sarkGyQc4csX5XsZ7yRZUeLRJkUhHCK6UcrPU9hT/TKVxxLRWr
         BCyqCrrm2HlVuBsATSDHEHubV9JHBqIt90y0+Gtiv/PpD74i9dq7boRkMWDlQV+Ez+ja
         20dSaQjP6/upVA4O5grVg+IrYQX7LROqSyIMcWwT4lAy5/qWRijg2xv9Dr+/kKEK1Vgk
         YTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460318; x=1766065118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i666Zwd4elC4IZ8NbSZ0mun/x9mHfJ63jUqZOhfWrkA=;
        b=qUVlXFMZ3+149F4YS+qiiUEGOeFl5N+pa18Redl58wRYNleQqwXqEax1xBUqGoripZ
         GnT0ZxDsmLXHHrvE+KA2XTGa4z0QgQgXqrN5fZQQkCE+9nvFoIe79HjX+sUMREj9KU1G
         VMYJm3xrzsxGbPAZU28h5VEFlDCJYCWH7xKsahkyq/fAgBoJSyvCY5j13lPhXG2jl8+w
         vqP3l9jxpfWLmPeaT+9SHWXi9iPOnweswMG0c+Hys4pDei86NCDmlIFaVWvthIEWTLvD
         j5wnIsrjmo7fQsncyTuNvzaZgbIR72YFjkwg666eqXcMZzC4b8PW88WXGFMQxpifZvYD
         3qAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI92AsFlFexPFJTfb0SfOiWFDcs5uVegNiVSBq1j+2Sfc/wIDc/V0QR9kfI0EYqCmIeZKFwuL7YfADCbx6uhQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIemsSlz55pp5LjEzsCmUwLo08epTM0srNcisdHrdm7CR9WX+0
	9xNFhGnygy2jtlUbpNgnwfVOKi9JOKTAdshEVHDMEQZbBaFzffhWbaNuBr1Fi9hf1nIJLaNj4wO
	RrG2FEO5dxXV9Jgx76QMRCa/ymVNVWZ8adfJ8rA2s
X-Gm-Gg: AY/fxX6u3G8zJXntVKz0LHgXUCCYeTKxP+fFhINh0zq5MGvnLpaL+ECPbys0mbEJHb3
	x+3U2F0LCcHaQpK0TCkoZNVJr5UGxSMLSAYQJ8RqnMEIuWwagAzXqY9YOflGTf9+1sU6/3FzEzJ
	C9Cwy2nMoIS0Uh5qjTKSOjRBZ39ElRGrDZvPefj4BV0k4jRjqa2x+naCA3ZpQn/wvDrii0xvK0q
	pw1WOQaZbdOkk+STY6ET6YVkpxXSa5+Ab1xOi8hvHYrnOKnDdRYQvJSmcbv+aOzhL7sHsIH
X-Google-Smtp-Source: AGHT+IHnlXgNY3uTjr2bG8YCH2KU2DqaaN3tTWcI65GXA9wGNxK0qa5+vVM2+v18wq1/nLG4NVQGVG9Az703nd7ZxLU=
X-Received: by 2002:a05:622a:1995:b0:4b2:ecb6:e6dd with SMTP id
 d75a77b69052e-4f1bed26845mr8937541cf.1.1765460317397; Thu, 11 Dec 2025
 05:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-3-maz@kernel.org>
In-Reply-To: <20251210173024.561160-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 13:38:00 +0000
X-Gm-Features: AQt7F2oGj2WRYea77WTrAg7wjaWZvfWC-2CRFkNaisf36pfzFJ-jdbVLpncMx2c
Message-ID: <CA+EHjTwNVxPz6rZ0d59_qz1Szpe6gRCyLa094Wi6sinbzAJ8iw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2
 to UnsignedEnum
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053839_020959_3BF63F29 
X-CRM114-Status: GOOD (  17.05  )
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

On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 are currently represented as unordered
> enumerations. However, the architecture treats them as Unsigned,
> as hinted to by the MRS data:
>
> (FEAT_S2TGran4K <=> (((UInt(ID_AA64MMFR0_EL1.TGran4_2) == 0) &&
>                        FEAT_TGran4K) ||
>                      (UInt(ID_AA64MMFR0_EL1.TGran4_2) >= 2))))
>
> and similar descriptions exist for 16 and 64k.
>
> This is also confirmed by D24.1.3.3 ("Alternative ID scheme used for
> ID_AA64MMFR0_EL1 stage 2 granule sizes") in the L.b revision of
> the ARM ARM.
>
> Turn these fields into UnsignedEnum so that we can use the above
> description more or less literally.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>  arch/arm64/tools/sysreg | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 1c6cdf9d54bba..9d388f87d9a13 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2098,18 +2098,18 @@ UnsignedEnum    47:44   EXS
>         0b0000  NI
>         0b0001  IMP
>  EndEnum
> -Enum   43:40   TGRAN4_2
> +UnsignedEnum   43:40   TGRAN4_2
>         0b0000  TGRAN4
>         0b0001  NI
>         0b0010  IMP
>         0b0011  52_BIT
>  EndEnum
> -Enum   39:36   TGRAN64_2
> +UnsignedEnum   39:36   TGRAN64_2
>         0b0000  TGRAN64
>         0b0001  NI
>         0b0010  IMP
>  EndEnum
> -Enum   35:32   TGRAN16_2
> +UnsignedEnum   35:32   TGRAN16_2
>         0b0000  TGRAN16
>         0b0001  NI
>         0b0010  IMP
> --
> 2.47.3
>

