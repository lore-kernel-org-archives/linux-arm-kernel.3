Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73BDD185FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=; b=TgKF7LcydKM/HADKEZm5WRefVW
	F2VD8p7LIfBIBQnMBCl7V9khJ/gKq6sgIwSFyNONY8j4gsYpAGGdIiktHdyho6wq4ueOc4b7LkiN6
	0NXODFq8gSneinev2HgK9Wh/XBQx5uIxC8/fdwMkr/jXIXVsrMHM4SXPjlbNpLl7t7X8K+tCG0Sj0
	w98P42trz/OcIBMRxwXuIab0ZCdv/K5KOKx5SKuXJE2ke6uxVz9r2wKcv1RgAtoGIMstSNjxZMtaH
	gTm6jHLw5x2H3VRAIHU6LXCSweR3XuFnPRqlRQhnF4NVzJjY7iaWsGAPs4R5gDTGkIoHO6cy/CQ5N
	2V2jBdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiN-0000000HHD5-1cjW;
	Thu, 08 Jan 2026 14:10:15 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqiK-0000000HHCP-3k1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:10:14 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4edb8d6e98aso1158121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881411; cv=none;
        d=google.com; s=arc-20240605;
        b=VP0+Icx0i5xsII/RY/ShfxZMJAe4gvMJIUVr+hGavfdbPFnb7MP249/+6BIeOJB1kI
         TgCadM8CNqaeHzy/Ehk/E3X/5fWPO8WO3lcNgssPoDEo4RrjxYE7NmqntK8QgjsI2zlQ
         p89mgUqLfRalVYmhEBkVreiz3bxE/BdfWkuM6KtymjsvuJaY9p1SHVzzSUSLXVh8v54z
         Y7l1vNuUJJBdrehO2eEbQF+epR384W+o/sb9zRSd5zfaQwOP5Cg+iIgm7d3wU5pzl/pq
         vsL/4lr0BWo94NPHfCKfdKvldigu60/tjMCBjb42Ps9oMMJDd+D5pixCb/Ss831gnvgT
         dogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        fh=pGfM6CTtGgapQIiQwq2NV21PDKPS/F69NK35z5LPieQ=;
        b=jQaBHAEqpOPNYBlGozO9MjiYV9CtQbm1sWLaksBE/hHUXM6nx9g4VuL/Pgf1bTCT8D
         yw4OMJT9o6+/pZM6cCSXGnUfqjxWWHG10ItnCejM2krmU2KxCwuJCGn0tVBDyFq2zK/P
         Tg2HIkqCpR3vJMy15Nd2nafbGLgInQbBRC/UpUqN0G+z5uW70kZSItSxFY+tZcoZxhUZ
         bmWIXhh+M/eyvveg95LgdalNXCBfkGj0dIDY8iBnjqyF6oAQNoMrlAH9ICLlX+xqChB9
         bfQhZH1iMJq35ycWzqy2o6g1jl2CyIRRBPcIL3I43/1Wh9WA5osQEDrUSTyRsoXeeeL0
         u+Og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881411; x=1768486211; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        b=Y/+60+JaV+tNzEWWXl7hQ3WqwXUreFwbpIfd7AMk8ncpU3q2pDMMpZTSMPcuAvWxYW
         Et8f9Je69Xg1xiadkjw0uFpn3F97PrEYEsMos7+mrRPN63ZSPJIPte8j2s7/PbdoWsWJ
         VdANTngO2rg2NK7C7eksFrlhSIsbRpcmH3TlYnQ/fv1UUQjCwpIkS4bdo+BtFSPQEMx4
         rhL9rGahrhzQTZwkBwsqxT4tSuViZM0uuWsp+BpjJdW7Pr93L8QfWMrbRjWmMlg52Ulc
         UG3SQQpz3bBY/GHELw0UWFWfduNzmw7VwQYH0xJbw0h0TnB58L9dtuxyxcPqs4XM6WIQ
         +5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881411; x=1768486211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGOhyPqsKhZPttb5gff3fg7ZFzXcVrSNwuwgJbbCpXM=;
        b=FdrTQpZiCAbebdxilUkyVcohWeQ2cR9FFDNaJ5Fmy0CwVqB7L6BZqzfO9Y+F+CLZvn
         8+umIdWMf3ZZmrmN9eJxT4oDslrHx3fsKwXTRw2C8ZX7ZPE13tyvvZBOQCJM3M1qcLGC
         4rh+5kp1i3Tw0Tv64W+O5SEbc0wtUp0tHxRT+XxyzApy3MpYBlQpiOPBUJ9AWR2+GsMq
         IAkVca4m/r/mbjldYKvNp50oMcSYiS3dFpERNVDhsZRvkLDZ7MX5uX5r0oVXtWHH8Y36
         EF0MZDZubci6Pr4ZFnFGYlNHq8cecMo15Ezapgj8GONTKCifOypP3SQnhB2EVHqgUD62
         8Ytw==
X-Forwarded-Encrypted: i=1; AJvYcCVcUedzV8ceYeQfGTnuvZ8VpaGJWPK65WNd5EEU0ZOngjjpb3p7TQT2gRpzMhqC1m51OkP/xGeFkyaaTmJDCotL@lists.infradead.org
X-Gm-Message-State: AOJu0YxjBYBTY82VYO9cdh7V9L9AH1QEnfaZUSotqGvWmmHVG15Kv1Pl
	DhF836NqtH3lsfiwMVvcWWus/5PvmKzNakxiep6JByPGRgzvtjsyf3QM3OE9oXm2g3MGBqzGzqv
	FVYIYDlKSE1ZfbPBk0M4M/vne0kZJ/sSxqDv70XoL
X-Gm-Gg: AY/fxX7nQ1SAcuL1RfBiyWld4cNo8mKSjZNTYPYrvv+4f1NafeMxuJzLABzkjTsi1cl
	jpmDdwyJiai2xdy2d21qqOGDegb3ZUnwZhPumfrh+h4uFpWkSKFcllNLptF1D4gO3xWUYisVFNi
	KfzWV57lZrqt6vZowtzNMrtY5If9qdL3Z9T7Nu5QTUKMzm0LV+CwEweWyhAPzTzp8g2dyNHgzFv
	iioKnwooTDlS/jCVd4xA3aVsTmTjGq5vGsQjcI2f8eO3G7pKoVg7fRPdJq6IXaocpORhYKP
X-Received: by 2002:ac8:7d45:0:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-4ffc0a80347mr7952831cf.18.1767881411175; Thu, 08 Jan 2026
 06:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org> <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
In-Reply-To: <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:34 +0000
X-Gm-Features: AQt7F2rujxIGY5_NcyYbFMLNUJyJwV68zqszeu4LHx3dTWaBmmJ-A6j-sa3_670
Message-ID: <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
Subject: Re: [PATCH v9 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
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
X-CRM114-CacheID: sfid-20260108_061012_944757_99C53E83 
X-CRM114-Status: GOOD (  24.69  )
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

On Thu, 8 Jan 2026 at 11:54, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> > > +#define sme_cond_update_smcr(vl, fa64, zt0, reg)               \
> > > +       do {                                                    \
> > > +               u64 __old = read_sysreg_s((reg));               \
> > > +               u64 __new = vl;                                 \
> > > +               if (fa64)                       \
> > > +                       __new |= SMCR_ELx_FA64;                 \
> > > +               if (zt0)                                        \
> > > +                       __new |= SMCR_ELx_EZT0;                 \
> > > +               if (__old != __new)                             \
> > > +                       write_sysreg_s(__new, (reg));           \
> > > +       } while (0)
> > > +
>
> > Should we cap the VL based on SMCR_ELx_LEN_MASK (as we do in
> > sve_cond_update_zcr_vq())?
>
> Yes, although I fear if we've got to the point where we've ever got a
> bigger value going in we're going to have bigger problems.

Yeah, but I think that we should be consistent with the SVE case, at
the very least, not to confuse the next person (e.g., future me) who
might look at the two and wonder why they are different.

> > Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> > copy over the bits that aren't
> > SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> > but that could change.
>
> My thinking here is that any new bits are almost certainly going to need
> explicit support (like with the addition of ZT0) and that copying them
> forward without understanding is more likely to lead to a bug like
> exposing state we didn't mean to than clearing them will.

I understand the 'secure by default' intent for enable bits, but I'm
concerned that this implementation changes the current behavior of the
host kernel, which isn't mentioned in the commit message. Previously,
both the feature enablement code (cpu_enable_fa64) and the vector
length setting code (sme_set_vq/write_vl) performed a RMW, preserving
existing bits in SMCR_EL1. This new macro zeroes out any bits not
explicitly tracked here.

In terms of copying them over, if they were set from the beginning,
doesn't that mean that that explicit support was already added?

Cheers,
/fuad

