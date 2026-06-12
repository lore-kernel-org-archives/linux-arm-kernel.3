Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639FECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=; b=Ucrh1RwXioungjUkJtQUu9aJHK
	2vIRdvYKUBtZqE1NR9otGjQvgJzYRVyvGTeQrDRvc2+2nBZ/g3QIQBGljP01R+gf8g1Bjf6SQkKIr
	TnJRR0BCgOHnzjLQTk8aGSwSQsSkTiOinmffDEyuycXnXtLDW3uclCoL+0aZnELx7f51Dy6A+KKxl
	eazAzXJhvKY8WY40PWXdTORKdNA01NFBO5MBk4KFGwJzDEY/PNTv9wJurLinfPLJqI1Z8qfjYJAWV
	by37UZOeNypWDq3yj+NZ1cdJ+YyPyaI0thNmdpuBwWPLmnBqIitYAjAldasSSHqnAyd1xJsoSpPQn
	Hz1Me0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrli-0000000AIEu-23et;
	Fri, 12 Jun 2026 02:37:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrlf-0000000AIEB-230P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 02:37:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36b9033d230so325040a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 19:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781231830; cv=none;
        d=google.com; s=arc-20240605;
        b=LIvrAcHi7m465XhLcryJUiv/roHSfBcdRQvpcIC2S5qAi9lMmikFJZ49rPm2R670yw
         UNgzJBC05DckJnaSrB0lf2kijGP63JWkgXHJaAl5VwHbNwTFjHzPHjyIjE0raSHu1w9c
         MtL2Oi3A5TOgsAin31C+FBAxyxLvT0j8/syfs9hYCXhskXKoFUjZLaPYHAstvKTNiOk7
         f4I15gavUCWMeI+s+8/1R1nWNUSRjTofGd3IOd16vwnRhx9Qg9QSDKhcVvEUTS61um0C
         F0xMMIwF3vksMkI2vqnulBPV2h2BQv7/PiCht4HOw0NudHOSfpAda5ve9uUg30Rkti5R
         I6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        fh=iBMFK6t3fOkmzr5j5dUTal4b8/2GU29tLeYHfUPhTQA=;
        b=gdz8Q3Q2zyeGrfwEGpkrl/dg7AQx+YAHzkJXcr9qZT7LnmfnaLnSmLa/f9FXSueIFM
         i7uc50HsWTgiQb6Qoeak+gOO/Jue6/bDyJfXSccY8nEKSvCuOVjX1q6aYSzo3E0Lq/Sk
         WLixdBYuWVpvQ+JIm6S/3pqiQOnLOOdOZf7gxazQP46L3Joe/3/x6h6jaTPIS0pqOE2K
         00+k1sNT/VD8g0CST8IOws0NV5JRk3zMcsw1k0xIfBTtP53wunE4swylKypSEXq4TZq9
         UNS6T5Rfert+gqF1i1PpueDL8+czMfoShAASB6nNvSRXNZEe3YrzUim8ebFyPt1HJT/j
         GeXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781231830; x=1781836630; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=Df/Hswh+TXuLqrTyloYfEuQLGo+Mxkjn1KP9lXW7fdBMbgFuwPt6EdrI2bWyNLlQ1y
         6O55Py1WRVdiFlMHTAKSIem8y6YuwA9QXyBTtcko5d6xrTxlrHr/iAeDjKRvkrmBhbgl
         zaanfK+/hjuSUMgyI7KYT4juJx8nXA3ofiVHqmv1mkMPbpSZCtswbmXpgfXG40vt7R3z
         i5SAsGu0Xo7pjkLOylgAUscwXPyAcViA8FGAfhBFfeQsz8GctIXnd9a7nzGwYn8iTYXz
         dxlPWWCblx1kjjodzrKP+wZ1ntHP6NH8c5MiTaIVezq9/AuBVr64d1mRwbDq/eHVePc2
         ObTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781231830; x=1781836630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=IJHJQ29/W6t+WPRstW1cEy/IzSZiGxL6jJVBmoY9dWv7j7TJo/IcnTFxbWi95Pcqay
         9v9rNKYZG/lnqJlwNyWPfcCJwqAJ8jUZFw6viliFeituOfFAHaFOeY5HtOElOOUmvtKW
         emnVdlU0/9OdGgaNldZHhvuLCpUo+kQaE+lJj4qAX6XnaJZVM5iFnERtzerKIO5+3PuX
         7pW7JdmMsB0SGIw8W/b7mrgWFBOLysLfVw9Ma/iTD6Nlgqq9Ul41KRypevElRk0cnrRf
         KpZnRK/wt4m6qY3+79akPP2ODcrg19Y4pu5RyjmYoaXh8Yy9AuZEycgEtK5CcfAoGZdo
         Bufw==
X-Forwarded-Encrypted: i=1; AFNElJ/NsuGL4sZ/Ha/PsbrXTtj8E7FodDIQtbD6QDJnuFd2VAsOX4T+gj/wzCfPEsjy50oqJlotS5Upb9myEftoWey/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXfZ0ES6WPYWc9XmLICN9fN8LgcbtkIWeZCeHQkK9fAFY1Y7KT
	j3KKuP/P73ROqDEocdwj1PcKleLtnmYF8CD6EByFgIgWdVlMknCYDKt4249po7sdyZTU27hZQfC
	h+d+dkVA1q9pOX/dQf0QsDmbifLUjx1U=
X-Gm-Gg: Acq92OFJjS/XePcLieikiMdSp5J1wwofVI3jtOQYxwHNcKb96kPOOGA80s2rLC6al1Y
	EgTC5Tf2lbXRPhkY23C6vTlNBbyUM0mHaxwi7Y9bO0Tu7uelH4vxkftm7Y288beLPxw4ROKbeIs
	vgAsY8w2SO7PnML080H4plwcDhFDiXVbsEpumYVhFd3772jCJRAPtmzNnq2EQKgIDG4/DRDSGXL
	z8cgXS8xztRZykfLnBljPKKYfr6LZaz6za7dFvH/GaAbLVbMCvuMb8YofjS7jlviiJFvXbH3uEl
	YiJkwnUXtwCVByZhZPixdHGzSofp2Md24HKVCQ==
X-Received: by 2002:a17:90b:1dce:b0:369:7491:7b24 with SMTP id
 98e67ed59e1d1-379ed8e27d2mr1063022a91.6.1781231830513; Thu, 11 Jun 2026
 19:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
 <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com> <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 09:36:58 +0700
X-Gm-Features: AVVi8CcLu5Ty5I6ab3mqIKLS740KgAX1K7YLQYr3jFBVdQ6AaZKqSuuk1kFJF9c
Message-ID: <CAABR9nGQt0zsH2McjOFO91tS-CHsudzioxCkPvbkgmTyfKVo=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_193711_556942_25C7E7E7 
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

Hi Jerome,

Thank you for the review and for the Reviewed-by tag.

>
> The code is not better or worse with the change but you went through the
> trouble of doing so, if Mark is fine with it, let's have it
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>

Regarding the point about whether the change makes the code better or worse,
I have sent an additional patch to address related cleanup in the same area:

https://lore.kernel.org/all/20260612020113.9557-1-phucduc.bui@gmail.com/

Would appreciate your review on that as well.

While looking into the Meson ASoC probe paths,
I noticed a few consistency issues that seem to appear across multiple drivers:

1. Mixed usage of dev_err_probe() and dev_err() in probe error paths.

2. Inconsistent error message formatting: some messages start with lowercase
   ("failed to init..."), while others start with uppercase ("Failed
to register...").

3. In aiu_probe(), error paths for IRQ retrieval do not provide
additional context,
    making it harder to identify which resource failed:

   aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
   if (aiu->i2s.irq < 0)
           return aiu->i2s.irq;

   aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
   if (aiu->spdif.irq < 0)
           return aiu->spdif.irq;

4 ......

Do you think addressing these issues would improve readability and
maintainability of the Meson codebase over time?
Or is it generally preferred to leave these kinds of consistency
improvements untouched unless a functional bug is being fixed?

Best regards,
Phuc

