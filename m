Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896EBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=; b=KOpEcDnAWM2iftLnbwMiPhlhHU
	2T0pO3P9/s9e0Uga8Mevg/NdXgA0cYwqgao/ZuVALaEld2/3J+hBm4nuJKnQzAWds11QmmDn1xine
	SJMWfFfW7e2FS/eW+pSaCDNND8odFyVj3EXGk2EgqdypWGiBYuKFA4CqdGloW8Ebi/0tRurZnj5sI
	sTyNKFsLP7Mzj7UfjvpvV2nUiBpFzKa6OPwoz1+gA1dDm2HXzx6A/Zr/y5Wk+y1OVEneMAbvepCou
	cDOomIklvgYrRblWT9kY2olML3FQgfc69Kz52yuYl6DL+Ts1QTtW6h3M0Rz9wKPCBobj7cCikXlKG
	++6awsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjgX-0000000GUBc-26a2;
	Thu, 29 May 2025 20:17:05 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjeN-0000000GTmB-397n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 20:14:52 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad89f9bb725so261804666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748549689; x=1749154489; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=KLXI5KNDVpVdaWJ+1MWCd1yH34gV9rdyVyz0l81LDHvGBTznz/ZG81ajC1xgHt+06J
         8eQlKJorylEHLubJitLb9GG9+mbvRreNoicQCtmI6M3Oi7QfLYOvtGyYDzosf2Trh6EO
         MXy5sMRTjrjB/BGTy4dUR/9myj/3WPRZL/wdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549689; x=1749154489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=GD0NT0eh4yZYxMnEn6OgidBvFl4lkekRwFn+pxAxOq3jCRPT4quDA5kvOMiFq92OIo
         /muGaPPl7D2c6WemAGwWRBIXMbCH7bvVxY1bqseo+NP9gXK9X9hjB5ZRKdjuSEDcKWke
         f9jBTuHY9XZc0JBKo7oGf2ryHgVLTlzpLOsBOw6LrLCVaeDZ0QFyRpj5g7VYJR+Xhpzp
         y9fP32kB0a7LVatCcVmggRGZgbvN0Bi+PZdSqb30wgHwHgSA8uiLpZi3yz2Jg5RMBxaN
         a6ws+YB5GUMQ5vgf32XgXTlmU5NbbXFvTex41hwiyUhFZRtor5HzqTMRl5UTTh4u+olv
         GjOw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ69ZjwWf7il75sQx4F28lmIkr678Pw3H+SzbSg2Zx0cpmc5freB95ppXTjW+R6n/iRXtiz9kpUupKo2qgIUBg@lists.infradead.org
X-Gm-Message-State: AOJu0YzpPVDRD0a7GO96RJaZ2O7uWzZNMy0U3ILeqp+Dl+j9+XYYqACk
	ktmgDIlTg//fjcA7gOXNxrFTXYaZV0U7kiQY7eeohcBBwXsAPRvBo3K2nK2+FoVCp/3pgdeXuOB
	39E2SzYg=
X-Gm-Gg: ASbGnctn3Ng7mJvM36zoCgr6hQCZkbep26Lz+kHA8DD0NO9VVlxARap88EEhcW6WQz3
	RSXkMOhPGV9DOOMC2jKrZ2QS1OYgKJTJ7373ngzbh3OJgfcI2OlzwUZFtkce+k7A2NZiXCYDeYe
	s9qO2GrkZPrDYylswezDf0+IvwxGPXV9h30H+m9CMXJmVUQ8bOIjcID7grPp8Jbe9I5+qY1EODs
	g1s09gBJrxVO51tWMYR3gjoGBNwDvk//KYUtpv39uF9In/YUz1I9bfsBmeImi46q+jTWM7DtwfX
	7I9NlL3dHtcugUUHY4HJLP63OS+qFTQavc5u5j1s2xsBo+fDi3Mr36i+M6W+iAcnvLXPde/pq3c
	x4W7uidwMi69RP5Yn4zYCfUr+6YtfXTeIacy7jICCj6vwMVw=
X-Google-Smtp-Source: AGHT+IFgUnJX9nPKDx4y3yH5Olg74wV4mF9IeY+uwThy61LufChoueEWrfxIf2QaByP3jFYJ0TDpRA==
X-Received: by 2002:a17:906:4794:b0:ad8:a684:a1f5 with SMTP id a640c23a62f3a-adb3230a79bmr67438166b.60.1748549689402;
        Thu, 29 May 2025 13:14:49 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84f389sm196232866b.82.2025.05.29.13.14.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so2389634a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 13:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6cnEqYY2Lu3Y3IWehQM6dueN3imOIdTsc4CB0K3N67JwF/y3cruogp/EUAHO46Gpm/IhV3h3Y4pTMkdkw6w4p@lists.infradead.org
X-Received: by 2002:a05:6402:2346:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6056db10b4emr581444a12.1.1748549687775; Thu, 29 May 2025
 13:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
In-Reply-To: <20250529173702.GA3840196@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 13:14:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-Gm-Features: AX0GCFuiJcryO_X7sE1ePk8yCEY5HNa9j_jPT14Gm93VGY22kOHLk2kIn44ZkWY
Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_131451_781620_6C5072E9 
X-CRM114-Status: GOOD (  19.44  )
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

On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.

No, while I think the current situation isn't great, I think the "make
it one single module" is even worse.

For most architectures - including s390 - you end up being in the
situation that these kinds of hw accelerated crypto things depend on
some CPU capability, and aren't necessarily statically always
available.

So these things end up having stupid extra overhead due to having some
conditional.

That extra overhead is then in turn minimized with tricks like static
branches, but that's all just just piling more ugly hacks on top
because it picked a bad choice to begin with.

So what's the *right* thing to do?

The right thing to do is to just link the right routine in the first
place, and *not* have static branch hackery at all. Because you didn't
need it.

And we already do runtime linking at module loading time. So if it's a
module, if the hardware acceleration doesn't exist, the module load
should just fail, and the loader should go on to load the next option.

Not any silly "one module to rule them all" hackery that only results
in worse code. Just a simple "if this module loads successfully,
you'll link the optimal hw acceleration".

Now, the problem with this all is the *non*modular case.

For modules, we already have the optimal solution in the form of
init-module error handling and runtime linking.

So I think the module case is "solved" (except the solution is not
what we actually do).

For the non-module case, the problem is that "I linked this
unconditionally, and now it turns out I run on hardware that doesn't
have the capability to run this".

And that's when you need to do things like static_call_update() to
basically do runtime re-linking of a static decision.

And currently we very much do this wrong. See how s390 and x86-64 (and
presumably others) basically have the *exact* same problems, but they
then mix static branches and static calls (in the case of x86-64) and
just have non-optimal code in general.

What I think the generic code should do (for the built-in case) is just have

        DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);

and do

        static_call(sha256_blocks_fn)(args..);

and then architecture code can do the static_call_update() to set
their optimal version.

And yeah, we'd presumably need multiple versions, since there's the
whole "is simd usable" thing. Although maybe that's going away?

                   Linus

