Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D89ECCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=; b=ZxCgaxcBpS6zNYOP2pDrQie7eU
	JYzuMur7pcr4GjsTdVvL2S90lSLVSRluYM1HtBrPN2ScHe4ZlYuRd14vInL+zt8vkaILHlT+xYXh4
	4ypDtmGRF7RIW5UU7N0l5LEEUz2VIlKMptRgyqBz66ki2q+3uxbaUYKXdoic+uO2MMFfiYwrdSfux
	dWxpjMtQ5agzpMVfqeEUCkURItkmWEZRxFweLQJG/lOv5/DuSfFWrbR6RlbMrwJZb3IgmQC8a9NW9
	SlFEIn10K35kf70t1bJ65MkZT6gQRYLdTJzVXYdz1sXlX/6ywrnWe4aTUqoWX8QsyNEbBkczfuxbr
	TzLRlOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFuwi-00000009xPZ-0jeL;
	Mon, 03 Nov 2025 13:50:08 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFuwf-00000009xOp-2oqS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 13:50:06 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3d37c1fb05aso1768630fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762177804; x=1762782604; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=hXnH+8X1dheDvbpLdWfYz5PIf+M+OZTPBcDFSGZ6XWTchAEuDO+gbOTDeZuctanCW0
         hXYk4JRD6JoYhfr+fiE31K35ZmVIGyFxQukFQ0KOb7YQYt52kdmJu5pMIgYDFl5nMsrY
         IgashiBExBcl8aE64NRCYzIj49D6up/O67eyCV/s/Gdrh3P+d+XBChMzjYUJL2njrsyD
         Z1W4VFDZQa+5biAD4kXVgjDc1zbWWm5EjSazHprTFCLpk0B8+f8i1/z92TKfj+J0M96p
         aZZr8foMBF8o1AiVnTER7pTh5/2I7voJtONkTXPQhSYDAxhHCqM48sxUBCrxBPXCgW6r
         nvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762177804; x=1762782604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=n7taMQp4vWcQIjr3qQluMev3F7f+tvDaJP4zPm+DCFoC1XOXKzuojIwEszUaHyC6Np
         p5wLjANYrrI9nxzC57T8bshMrHCeuhvVUd3jBUwuHQnEU8Pu6bMDAKNSH2TZ3lzAxlfY
         gunPiejLrptEYNb1bJGM6RuGjagZLZrw/5SyBgoSeeKp7zKRVrwWcPE4SzvMlFLssHyc
         l3gLSHHhTK6M3BpJ/7+cm6rTnj6eHpdC7+lzvII5IPHtY2lVd4bIelBuL4Q6rdV78T9K
         PaiCu4xqYJjmXed0n4KAOMwWk3pq+9rPHFTgpTWsl3jCir8a6Af8MHTDY/vd4CpVqr05
         77Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUcW08lw1Qif6drEOVA8j9SmLYAq2NQVtpY7UIciZywbQ3jAOsIb1VR1++p5UKZrjFMJ9J7Ma/siwSq5nP2Adyo@lists.infradead.org
X-Gm-Message-State: AOJu0YwSmPXhOPGQ208v/O0tcR2+i1Ro6lIM5HUqWW70AtzOIhKHfL3z
	Fcu/0dmjHJztHNtz/n2BJDt5c6lbyvBlMRKZdqyeAAo3280uSss4ZhR9+c+vOoI6gD1G+kkm6t7
	V1Snum9zAb7sXgr9d7NUbCVBn6XrBTeKJpCHxWyH1Jw==
X-Gm-Gg: ASbGncuPra0kGbpeZ9CoMhsJJ67moRvM/MrL1tp/ZkF6Fmx4NzKgwbRO7H74EV0IoZl
	4rs66ng383AuR7ag/4St0mBnLGV5hAeZcH7XlWjzTSziuXG0oZE1j7GdkZ0nFQ91Ki9Oo7YLR4R
	iYnhusuKoI2vk9gPM7g25Df0GiwG1xJqaVJXiDrAkqu78qoIw6OJEpIYBT7m5NaFlmm3GNRzW8v
	3zNUpIMo55XCKt2n2hRpssIDbyANV+SSAZbO++c0OmTZ6egCqF3GtIOtPaXYwh+zCoSuOEh
X-Google-Smtp-Source: AGHT+IEvvbnuEgVymC79WaE8covKlgmCh0NOsdeyracVXZX/SVCozVOiOeq8HhVtYvKE2fZAbBNornSKI+Cu+lra0Ak=
X-Received: by 2002:a05:6870:8e07:b0:337:74c4:8f18 with SMTP id
 586e51a60fabf-3dacc5d1f80mr5149154fac.6.1762177804047; Mon, 03 Nov 2025
 05:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org> <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
In-Reply-To: <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 3 Nov 2025 13:49:53 +0000
X-Gm-Features: AWmQ_blfrAzZoKwokZQZXo0nzPx9hZ0JYCMuGx_l22LwSjR0d1KXfaSrBbDofEM
Message-ID: <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_055005_731232_2404215A 
X-CRM114-Status: GOOD (  22.21  )
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

Thanks for the review feedback!

On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> >
> > If present these registers need to be initialised
>
>
> ... for what exactly? What would happen if this was not initialized?

The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components. So it is related to the automatic clock gating feature
that is being enabled in this series. Things still work without
initializing this register, but the bus components won't be
automatically clock gated leading to increased dynamic power
consumption. Similarly the memclk register enables/disables sram clock
gate. Up until now we've not been initializing the registers as
everything from Linux PoV has been in manual clock gating mode and
until starting to implement this I wasn't aware there were some clock
related registers in the corresponding sysreg. Additionally with
Andre's work enabling power domains it has become clear we should be
saving/restoring these two sysreg clock registers when the power
domain is turned off and on.

> What is the exact justification for ABI break - wasn't this working
> before? Or new feature will not work (thus no ABI break allowed)?

No, automatic clocks and dynamic root clock gating were not working
prior to this series. Currently power domains and system wide
suspend/resume aren't enabled upstream either. As we work on enabling
these features we are finding some things that in an ideal world we
would have known about earlier. Unfortunately it's not so obvious just
from studying the downstream code either as they rely heavily on
CAL-IF layer that has peeks/pokes all over the memory map especially
for power/clock related functionality.

Whilst it is technically an ABI break, I've tried to implement it in a
backwards compatible way (i.e. an old DT without the samsung,sysreg
phandle specified) will just fallback to the current behavior of not
initializing these registers. Things will still work to the extent
they did prior to this series. With a new DT the registers will be
initialized, and dynamic power consumption will be better.

>
> You need to provide rationale and "driver needs to do something" is not
> enough, because everything could be justified that way.

Apologies for not being more verbose in the commit message on the
technical details, hopefully the above helps explain it better.

regards,

Peter

