Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA16E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpgIVXJPCWJq+BvZ7U8OZJJ7fZhImEdZ13gLAjbI154=; b=dy08CLiidJAvy67rNyGQO64uH0
	fXJo8qLHjXPAD0w/OkfxMo8R8Jph/1cAzPxzWanTJGVI2V1wgBJ5H4JPPeb1hEm/N7JpCJNzf5csl
	XTtL1k+uUIXm2hOvkvXyVjO2w5C+yd8KdgPu2yc9doePVKr9r/uLGrYrIqHviG0UAgEjvZ6Bl+cRV
	dm8PFA2YU1rgvZZGcQdtdHkjJGh3F8oF1xLdxzHBLPyqii9rBV724SgC8cDbRTVZXa3qwiobiQzEL
	7yEdmbNFfRMusNDRtJScoK+TAYFShBSLbgzV6LMSirEGDIqbSQyc0GNks0h9isq3Qk9y78l695mxy
	z96jjS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMWq-0000000EwkS-3Bbk;
	Wed, 11 Dec 2024 13:13:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMVV-0000000EwXP-3TWh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:12:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso3105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733922719; x=1734527519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SpgIVXJPCWJq+BvZ7U8OZJJ7fZhImEdZ13gLAjbI154=;
        b=rpMHycllnWTOpV9L0dOAZU9z2ao6YfYXtzbao/0hLxJA8eaQnyeckiR+FRj25RmwyD
         iUxe3F7hypvDINxI8RdmNnOmcWYo9MxDglmfOJSO76FzgZ8V/gUV594ft4aqYj/AMbFh
         utKKwsoaq7bNtnVI/FD/R6rwJ6gUNoI4EtzWPjN//ucAogduA/YJ+dLOotvIULV+zZxL
         sZCb1+vm7txIrNxcywDbOERCwlipyJTUoB7jZmEzC62ELXyejp1TEUusHaq8rNvcdU4V
         O1yl7X77DGIH3pX0ug3mfjFngHRIXemMTA6ZYOV9VJpti4k6IE7hNlT8mfrEjU7DVonz
         l95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922719; x=1734527519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpgIVXJPCWJq+BvZ7U8OZJJ7fZhImEdZ13gLAjbI154=;
        b=LketS7cnxSHjIldKEVZcZ7J8HfELotDFV+FVZLxNc3Gmj/fWxiPYm7wVnliMheeh2H
         Q1qfT7NyMg9hriepwKZVWz5D/gYMxXtxziTz4BGS8OkQiOK/ngVxV6YfwbNyvu702F++
         oL7Y/5Yv6aR4374xpop67c4fjf62FzAUzMZ+qmYpdQjOJbDsmXz7DuxduYJlF7u2LcS3
         npgmWgDyYGgFprzP1TFuPbijmJt8V3RNDnE0UGKf2iq0z91wQn04y5bR6IGUNfQJh+M8
         EWY09ThtGtAakReVyoFVypb4HYbhH8+P3wUmqnAlK8dLUGMKhbYeF/MN0EGr6R8YOS7N
         TLng==
X-Forwarded-Encrypted: i=1; AJvYcCX1w49AGkAwJttejE194/J8HhhJuYjwLm0y39QAxc5YcsLuQj/yji2Jl7JXLYHAujhDaWRs1Gsa8/+DqyuaETjU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7WpqkkWeeBMTsiit7bFufWokdfCEBGxSRX+erG1pyO58BjJlI
	btUPkag/euEISQ8fxeP6BRvygzRc6WUInWr5KL/xQWJlZhkl6p3qcU0H45Pik6/E2PLRaXbwpao
	nbPD/u490YF19OZ3Sn41IvL4Cp2MzPSGE1Wkj
X-Gm-Gg: ASbGncuk/HF5vLfcQf2YIs6Y/yLf6ci6Cnb44U3x42gnt2nq21orVHPGTydc1xi1Sq7
	8EbXdCqOY31BDfShXQnFpdVL35/cNAz0/smtiJ3NTGx9YcKk4UnwUPFCLZolm1t4D
X-Google-Smtp-Source: AGHT+IEfuetELzIWhfEeFRhYatZdwR7CYhn8kG7Vcp2ICa4z5Mba1kHJ461NL/L61xviWIJRhaUMxTdQVlaJz2Q/5Lg=
X-Received: by 2002:a05:600c:6c8a:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-4361dc51b9bmr958645e9.5.1733922718921; Wed, 11 Dec 2024
 05:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-8-tabba@google.com>
 <Z1mGzwZqVQCWWSTX@google.com>
In-Reply-To: <Z1mGzwZqVQCWWSTX@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 13:11:22 +0000
Message-ID: <CA+EHjTzaVadZgO++bSYopQpy8DyfP1W8ytoOd6Q7yy+yEVqfeA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] KVM: arm64: Rework specifying restricted
 features for protected VMs
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_051201_863554_3087E07F 
X-CRM114-Status: GOOD (  15.13  )
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

On Wed, 11 Dec 2024 at 12:34, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:34 (+0000), Fuad Tabba wrote:
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index f333b189fb43..230b0638f0c2 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1422,6 +1422,7 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
> >       return test_bit(feature, ka->vcpu_features);
> >  }
> >
> > +#define kvm_vcpu_has_feature(k, f)   __vcpu_has_feature(&(k)->arch, (f))
> >  #define vcpu_has_feature(v, f)       __vcpu_has_feature(&(v)->kvm->arch, (f))
>
> Nit: I see nested uses the raw __vcpu_has_feature() helper, so I guess
> we should try and be consistent. Either way works, we can do the same
> thing in sys_regs.c, or convert nested.c to use kvm_vcpu_has_feature().

I'll add a patch on the respin to fix the nested callers. The lines
that call these macros/helpers are already quite long, and even though
it will add a bit of churn, imo the resulting code is more readable
with a kvm_vcpu_has_feature() helper.

Cheers,
/fuad

