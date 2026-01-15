Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE45CD41143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=; b=xFxiN9L84UNWT+sjJDX+Y0WufP
	hRzBIQWMWiCcxmvA0wAV9gWfPjLasGG/GG8afRVfAZO/UwjbshY0xy+BN5HfSs9YAW4fUm+KIbF1N
	nI1nhUYXW5gvSNSn1maWM9lgF4C2g+TBfebpSfvJt2rpWJl+S6rHHCRXdjWCtm5IKhQbY1Hs5L3ta
	SfUAYRXPhJXxWxJbFJGO3F8bqwooGr71yndQ0wnDeTTnxNef1QPjyYc63BhtssZK571Zw83ss+WX7
	G0zYknUl4VQtRFuvEbD1/UtiiS+eTFhCh6otZ7NCP3hsLC3zpG958t/PA1QSI5Oal8W9RyaA4ruJN
	moJ62hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJG5-0000000C2K6-1LIm;
	Thu, 15 Jan 2026 09:03:13 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJG2-0000000C2JX-3fF7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:03:12 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5014acad6f2so263201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 01:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768467788; cv=none;
        d=google.com; s=arc-20240605;
        b=SNXLZaHGnSWLKRse4HAs6pRqYQvRSiE6fVe09nt8eYgTfM9NZAfNSIXaeoo4js1Q4H
         ao+spGenoapSvr+Vv9gXQo2YTvvpNFPuoZ1JKOw+SKwysWEoHqAiw0d6v48i4OrbdK74
         Uf/s6GiP9+9pQ4ONa2ChVe5/PYAtOmor1R9dIlFpf04GjP51T6HrBkOPjNvmKmqoL9VB
         xFVbrvRHbreaXol9S3RQAZaH7ADhZAB1xANaCzRoQ0DRDFP1r2F6SVPju5BVLhwKj78K
         NoGmDVp9PDtup5rZPbNm3Vtx5qbn1ra8cLgOyOnIq8E71AFDyr7YmLadU/LvMSNhKUvO
         IHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        fh=QySfphsX/gInRB8ybDLetmkwCUEw77bfebQ9p5oS900=;
        b=lGdu40ILi6GoSRfFHo0q/1ycz71gBNm3r2+FYgwnf5VfsfN/y6UrRzROS01cXunqkK
         XWTiCmpI3wpbuCbxYHJsEJAxofNDO14kZC/TfWmXBV6WVbE1T6rOMWTKnAohgHRDsw0u
         Mx3pjH+ebTwS/rJUoAQi1RRj6+MeV6ZZaAVIbWCS8YAjbEwdoBR7gZd/n2C9B/xqwUMs
         sGUScfzZ9RmA10vAdKtFhruqfvuDMbnPA1cAlG1s6NlHLnuQtO61ico1CIMaQlfVi8Eh
         LmxrCMBcShCKbTZo5NQi2rAVyRwvEGleZBBsh3oh0UIYw5jWswAhLOxIus0sK8+uWp6c
         oHlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768467788; x=1769072588; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        b=AHd8ZsxBZbnQvlTB72oy+Cr0NT02PEffFNT5yMbnoUQ8RtKhndhyxBhyO78KiK9j4s
         x5z2oKwq4gvAKZ36cZBZHQ2Jljr34BxwSBd9UZCczeQXhgt7EXNX4wbq9Vq/Ak9d84AE
         V2QKg0LDRlhs/2qOrCA2YPemaZXamgnIPsNk2mUyFlp8AFPd+RUqSY56ItSVie8oMx76
         GyIHKx3lFoX+bhqIYzowA6ka9CRBMTfC7F7FtUYxKNIktwxVvyOeGF6vAfjV9ppyMLdP
         kFFecem4mZj1zNvJnKVDltwLom/OwauUafO+dkCvlM6TyCm1lucLT2A0t5+VSOewLrQc
         0dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768467788; x=1769072588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        b=O2Ka3ee9pDZK+ItJtiaFeHC/MQMt3VBbjVf8o6egKnvYGhxC64skL87QER9JciHPxY
         6sfZVqCcEtlBr+r0TrNl76CgRVrtF3DT49FxgMzig9N9SzJbSCX/FfCUecEaJv1IIWoE
         aGU3LI9UGW8PUk3rL2Q2VBOYK3+pkjoh23G58haUs8EXbK4q6ZvwekkfebYdmFbK68xc
         JoaR3YiITVabbdihw/mZwjGjUUx6D9C+b3BTRFzaCh/GLeMnX7CI/5H1oirKaITeAlGc
         imf58xqyceiMIezhpED7fNhCi3Vw1r1tS3TTBBLgRHjt3PDHW/5lNCMhP+1sspw9Z3aX
         A8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXUfrwcPuzhUDTQrJimJPMkpFQp/pRkXxwFPFebwnZu+juETaI5npxuQmv8MehnCoYreopCvs3HhrchZVmkMU+j@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtrt+9lIizlx4fmXRcVU/LrtE4KSrBwRLAarZ/YZcV6nAwlfh
	3SxmQJ6chsfQr1nsBtfkQXSXelxVldMsuH4hx+m/+7H8vZYDKPKHaPSYExEG3ZvqS0ktKUZ8xnF
	DBvZ9imrJYGjCSZivf/MQYjnqcnd/czQDGJ+ap4t/
X-Gm-Gg: AY/fxX5Xh8/GW1ts1SUtKg72TV3hbAb/BLytyhMeaPLDRBP01eeza1CbXUKnxqABO+d
	YOrkM1Nm0hZ20fK+pTw208pkMH/5sIGAR9rpzw/eT07hfySHNqQMrxmQPjfyD03jV5Q08lIUM7j
	ymaelOXWhWiXUQY5//IqrpOyHk8KcwfYc9Nf2hSiNnyxu20lzBxVZ6HH1kZC9TmZOCUJYoes/Bn
	RuwK5INi0yGoU5LO7DZme98eBqRdXvOOBMCrFOI6IucOi4G3dreaakjYZElpglGCNFabu00
X-Received: by 2002:ac8:5dd3:0:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-5026ed4f925mr5343061cf.11.1768467788106; Thu, 15 Jan 2026
 01:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-23-8be3867cb883@kernel.org> <CA+EHjTyYcrWwBR0AwwdWFfOSwbmTMOhSee7y_-vrMfOxphrvqw@mail.gmail.com>
 <5a053bb6-5052-4664-b0cb-f05d56d4679d@sirena.org.uk>
In-Reply-To: <5a053bb6-5052-4664-b0cb-f05d56d4679d@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Jan 2026 09:02:31 +0000
X-Gm-Features: AZwV_Qg4xCZRn6ebTpsQyf1oiKPYkQGhv7VLsovgzCpdoBOU9QpCHpXoiLQKrWU
Message-ID: <CA+EHjTwMs6BzZwtcNjyZnxLb9Gs01B1RcDvo1RB-f2w98eMzFQ@mail.gmail.com>
Subject: Re: [PATCH v9 23/30] KVM: arm64: Context switch SME state for guests
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
X-CRM114-CacheID: sfid-20260115_010310_955756_0075E8BE 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, 14 Jan 2026 at 17:28, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 13, 2026 at 02:24:56PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> > > +#define sme_cond_update_smcr_vq(val, reg)                      \
> > > +       do {                                                    \
> > > +               u64 __smcr = read_sysreg_s((reg));              \
> > > +               u64 __new = __smcr & ~SMCR_ELx_LEN_MASK;        \
> > > +               __new |= (val) & SMCR_ELx_LEN_MASK;             \
>
> > Similar to what I pointed out in patch 15 [1], I think you need to
> > preserve the other bits, since SMCR isn't just about the length.
>
> This does preserve the existing bits?  It reads SMCR, masks out and then
> replaces the length.

You're right. Sorry for the noise.

Cheers,
/fuad

