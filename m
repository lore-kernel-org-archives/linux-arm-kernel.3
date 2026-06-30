Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61104C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=; b=3wU6yNnRLViHEeM1fnUtmsWVat
	y2kpahanrTrG3zHB9tIPriTkUMVH0IsL5ssvqB7XHukeJk0VO4cb61EX7+m9GmN8QS4ojHEU25whD
	sYG4pr/Pfz3vtexulLmXWcDZFh93idAH2EyBu/jRx8BEy8H/ovvxtMN76xWX2zQsiXWv+riEMbQlt
	ScNdpvxGXUE5Ib4dLB+ErUxQbmoAmBouXR32d3LdASPP8f8LhoOalqBaFmLWdMgp7M1+AihsDcGAB
	WGEr5h86EFvRUKQTqHJw3J+WgH2eWhVb8FInyY6loB/BLgQ0YsUrvtSdy2bnYepjIIHc1gzjh1iqW
	jVDfiz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWhr-0000000GrEG-06yE;
	Tue, 30 Jun 2026 11:32:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWho-0000000GrDj-05FC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:32:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so6196979a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782819162; cv=none;
        d=google.com; s=arc-20260327;
        b=q3na5RSLFdC4Ppg3H4908f9rLWXbhy/G/YMtAPkf1VLlfDqvAreSSKICZNo5ykX7sZ
         V4pVXPaC7gFg6sGNHKelvjWwQYWnXtFaHfZcs2WlAysXSMDLSwKNsSizmECWVtobaHrL
         ga94aBM43QAk9EmyCmj8jeKV24Zo262cRpJFEuSzLnWIzFIpf+8s7hRouJilF1eLqUHt
         J4/AsbrbCOWfU6nIZwl0RMUws2hwqTPWrUlvy9BZSGXW9d0HxZzu098NMaqHEZPOwAZG
         a2WDWPP/smqPLECx8Gv1mDk4QinNa4WFVSdEXBbLFIRnShaHV3apg4hAJrSTUpWF+8Xc
         WhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        fh=i+ry4MUyhF3R2E86nnU1FyhLGCr/uQfg+9soaNjmlCo=;
        b=Be3LP8ULQimzhez43CJJHa9MDFH5zd6tpEYBVYPaJZskMqX8jznLaLHe9gLcJhyr5y
         liHzFZ2w25vdrkaJiksQS0dXSmzlwOt9vmK+G0Bc7MbUtsMC8V1pVcnDqr4Pwi9y9wEj
         PGdQG/2VjqEeetjPW2vilD/JEqAHwlqyHmzjd0KRD9uRC9NC4Y58R3elrOa1sRzs6fzb
         /Y4lNqnkcUY+EBSMmof5fi8uJU4pTjnCW+13NYu3WyIaTl0zpnKJqYbMe9idvJXdQvnV
         2xOX+0JvJ1x0sicD+13Fu1+I57zr/oBF8WHNPLDV7YK96uKZXNtV1YYgEJ4HN+0mtvK/
         co8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782819162; x=1783423962; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=U0O6Y6iXbmtptZFTWA//gEDFInS2n0eBHw3Lr3g8+7JjdK13agcuvd/e5K+SLiS8Xu
         /LMtEYmwbjKkyFj0uvRZ4enxRlxJw+WSLsAFKxCPd3av+skauadMlhLsXNf7Ob+7Bj/j
         x5KgmBdNnOLtpF9H9gXPWoZOdzC4V10/lbe9X+PndmBn8de74Z72RWwP2Jr60qw3hidd
         cdYlbEH75bJjkWsBSJP6JQFxwi0zkP/BljqUp+MZLDDJvIQd/Pht+e1qL3w3jSXgU8Gf
         CqZVxbPVMFsONRn5stETipKHHIgqW3p1LnCORsrk5TsJsFbWvf3hu06/WlglGA5Fj+H0
         qANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819162; x=1783423962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=oTQaYwDm9S0VVblJId8VwmNJLCBweAR1ubDVv4q17m5ahR1GgSPYXB5sVkNHu0WjPe
         Ph43vAxHvBDwTharcJCngFGbsSzVXTON426QyPxKmCfW9qlcMK7NzPnevDCULqHo77Jl
         rt5YwZT0BSJd3Sg6/uBbrli6SK6sjGTTZ/a9qpUFpmWkt9fJuSfSnhJ0jsfzVmqV6VMl
         mF/87ITFfuNblxgs0TR1gHp4H0codWkeG4Yy94uDmxs4UKX4j7j4e5LSOeereOc8TqGO
         Eqe8PnCTgd+XWaZUJqdKmiGd9hZ2oiA1lFuWic0EsNdR6c6pVInLj8RFaMgeTAsv5YKz
         5n+w==
X-Forwarded-Encrypted: i=1; AHgh+RqX5QOiub3rxvORvmvFJWcEKVLJaydRdN/1QByUbhZp9VdZ2rb57W7KXAM1CDwvniB4LCZOvc/QGDIrQLV5XXSy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxt4loQByoh4m8wAFQxY9WYWJcPhSsiuczS1Oza+AIQVq+wSg8
	Z8zZTPe52kDoXf22hlMmjXFE397Q/iv2Zza+ylC5YmYdfp7oPvAqkk1V3U7WOzmMMuHqeJRa/dW
	JfdC9p5zAbof+N4l1XRtwLJQ/6DgciXPdCnd2Pb8Fdw==
X-Gm-Gg: AfdE7cnILJRwFL+BsfzY5zXXPQ0RPNCjroaYY/5B87UT9DwdyVNrVao8m+Xmeop+s2z
	oqTHkSAKTcodPcLhdk3yA2iiQLPimbyj4SWliUEGOsjklixaAIENA11xsOYhd/ktr/WIkxWErBs
	w5XoSIEFb2x0+74gh7Dycz8KN4GY48l2T7U3urUu3NzhguAm4/d6PH85aR+ITuoCPAYdCkdZrag
	6D5sooglJJdH75gSFRjumnmlCEnBuYxKidmdjtFbPDCrfjZ3wT8v//m1unwgRoZA/4NrAxVYKL/
	/E0cSn5yGWvsfDEp0Yg4Gfy6K3b33w==
X-Received: by 2002:a05:6402:51c8:b0:698:3b7c:7e36 with SMTP id
 4fb4d7f45d1cf-698878ad389mr184057a12.32.1782819162077; Tue, 30 Jun 2026
 04:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
 <0f1e01dd0844$01190c40$034b24c0$@samsung.com> <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
 <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
In-Reply-To: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:32:30 +0100
X-Gm-Features: AVVi8CcNxlc8aBvVUsFvxwtw-6b-XjIoK93AeruSemmptuSvFy4q0u1JGeOhNoM
Message-ID: <CADrjBPrG7bo1i6YcxuwNKnYmKF=d-MXXMWSNdu+KfF7hhqQMXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Denzeel Oliva <wachiturroxd150@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_043244_093438_529F8A81 
X-CRM114-Status: GOOD (  29.85  )
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

Hi Krzysztof,

On Tue, 30 Jun 2026 at 12:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/06/2026 13:02, Peter Griffin wrote:
> > Hi Alim,
> >
> > On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Griffin <peter.griffin@linaro.org>
> >>> Sent: Monday, June 29, 2026 6:02 PM
> >>> To: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> >>> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> >>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> >>> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> >>> Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> >>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> >>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >>> Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> >>> parents
> >>>
> >>> Hi Krysztof & Denzeel,
> >>>
> >>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> wrote:
> >>>>
> >>>> Correct eight PERIS gate clock parents to match the hardware clock
> >>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> >>>> default source.
> >>>>
> >>>> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >>>
> >>> @Krysztof: I was thinking, maybe we should establish a new rule/best
> >>> practice for Samsung clock upstream submissions whereby patch
> >>> contributors should link to the downstream cal-if code for the SoC after the --
> >>> - line. That would make reviewing the patches' correctness a bit easier, as the
> >>> downstream cal-if code would be readily available to the reviewer.
> >>>
> >> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.
> >
> > Generally I would like to, but I also don't have time to hunt around
> > the internet for a downstream kernel tree. My rationale was that the
> > submitter is most likely to know where the downstream code is, and is
> > likely using it for the upstream clock implementation. So, linking to
> > it as part of the submission should hopefully be fairly easy.
> >
> > If it is a Samsung SoC for which no public code is available that's
> > fine. I didn't intend this to be a hard requirement: "you can't
> > upstream x,y,z unless you link to the cal-if code". I meant it more as
> > "best practice/guidance"; if the cal-if code is publicly available,
> > linking to it would be a useful reference for reviewers.
>
> cal-if as vendor tree? Some contributors just base their work on
> downstream GPL-compliance dumps from opensource.samsung.com, so not sure
> how that link would work.

Urgh, I see. My suggestion kind of assumed the downstream vendor tree
had been pushed to a public Git repository, similar to how Google used
to push their gs101 sources, for example:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/

A link to a tarball for sure isn't as easy to just click through and
take a look which is what I was hoping to achieve. Thanks for the link
though, maybe that will come in useful at some point.

Peter

