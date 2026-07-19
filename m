Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A25BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=; b=wqEXNFRgQFcslIVCq9rLoKbJl3
	Ypx2buP7weZoryNZ1EGIaSR3saNJka1Dg6rhVOEUSs+brB4xR2/PGjxg5of1rbe+gVD3GNwiWyaD4
	2STO7uSKL/le99Cn2yVHA406vc9r322peEGpenAUbW5DgQN9myxXaYCrAJIei5s0jn9tC6cJH5FPc
	0ZrtZ3r5qsNGBD4GPBcAuUwbA+XMta9kLFlIMSM7+drd53x5OX9wYmn1eF2edFVBdF4YWLsUOSzSd
	E1DwmIEWeJD5Eis3sE2/OZd9ftkNEVgibaN0JnlSzt8vUELPUa8FNDae4OPSpii65ub5bt6NoFzp0
	604FgqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYlM-00000005MWb-3jvX;
	Sun, 19 Jul 2026 21:09:28 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYlK-00000005MWG-1bML
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:09:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8143daf89c7so56193977b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784495365; cv=none;
        d=google.com; s=arc-20260327;
        b=gxzkKmszmQzOo4Y5WUmwZ2dI0ipsZy9ZKE0BsEYkaFtrIB48To/zdKuvZ53t+G7pJa
         LMYhkF2ID62tTQiraUirePpfEUhPSKTwBrZ8SilRmhMG4btioOQP0VIEukPNlV7yRWjf
         NxV2wX5blCFXykgDh1uklM07WhzujtJI5nTXqS67RlQtpk0LwucLwcJnrQjwGOdrWhRn
         k5pMeQY9ElgDso7dZE+Riat01LK+bGyJ3plFlcs7MokDPbOM8YoHpwUOAvrNk5OfWBmi
         ThoK1spOZ1kmrKOSoJJBdz7O/Sxy1A1HLu/qC2lMqsXjPsUClKqqvdTkFkiUfbOPTc8O
         lh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        fh=wEa3nIoA4h+bsMSucP1ESIKxicx7Spvtisc2TwLcREU=;
        b=Nn/lr1c34F37A6K6FGe1MJgODAHQ22Kfg8VYoXzTJq71pNP5e9rQNtYxQ3NiX1QHCy
         pUyuEQ4wM39P2L7SDuQael04GAI5AQOAMltWyGFeTqRNj6ROiN35hjjD23LmT314R/io
         NtamexY+AcO7d5B7IVXvp08EOp6SFrUuLwHZSKJXdqpoPUFciHxQd4+PLykJSVkTNQ2B
         VByCsRjtlBvB6/23my94jCS4T3aQe+jlGLQgkoG42IQMktyIy65VIPQvvO7ZWWC4aKXp
         m0HXaANF2r6mEAYVZA0p2484WDwityhFcQsOJL7FY+VdAFwYRByJqNbp/sccBLRyRvdL
         vBUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495365; x=1785100165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=oaw1SIOP5w4LiblHVGView+AP3t0VEu1qFhrqj+CNrYZ7kpyBMJ6jRUoa3zx1UTlhc
         0eGXHwEGPrwYH7+z4dijbpy/eE2zb0AFu0BIiYzD5C7Wzx54euNcT1iuWE/BdEhh0/uk
         hK6tkF7lGXtAPdAMyYQWxGxTwxOSRiZLAVnZTSXVMSllp3QoXT+q/1hJSDrfV2XZvDNP
         gBQyB7PpuCrU/l9oT40hPuDLJP6nP0GmXwogclfaDyvX9fZPfsmB79FF9VZvdsKZPnmm
         5njrMhOzy05uRaC4hijg59RfYQQYJPcsO9iy6T4vepvEVH2/NmfpUtGqhCRxzhFnNbF2
         u4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495365; x=1785100165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=XbzeOEgXSh5oYqySaTZtZcJPdEfIX1KZKwPBqCZeIwoKAEzUSnvttbTc9eC6kO4ddY
         GZJK/6YL/2UACvKL7IRMso0E2lcMHcmlFfRvNkwBkWG4QFXYPdUdfL8VyvhnZcXV9uMs
         oV/Jz7T7c8CwTaFjYMnN4D0mV0j7UhBs1IA/jDSHAtV+t6mY9qej2GhsEjMkKpdbaZeP
         qilSrLkz4rEGHUr6v/OtjaHI50A7f0IFFzyITpYrGdqs1g1RSJcJQHfGFNTWvJYzo8ci
         OqQcJMLl39BmiTZtLMa/n52pgOlxUNU0OuwPcP3ZN2tFs57BUVuj1qk8ZDDD5LavYwFL
         0mdg==
X-Forwarded-Encrypted: i=1; AHgh+Rqcal6+maHPcuDruOu2faw1WCc/Rt7FElqjoOJrQ41be87HAGO3OhXeHJHaBy9ibiJI3bq7+KwfRG/85pYwyH/E@lists.infradead.org
X-Gm-Message-State: AOJu0YzL33WXuZJfvxBw3POprl3KD55q2yix3Mpnk64xesg+rCA0MSxF
	2nLW/WQFXdvPoXcVHZtphhtaHEdpk8AP8TkuHZeMdeu23Pk9br9XP90rZBZVqI8Q2eTvd8PpMrE
	zaJ8PlP74n6w00c0SSLNz7F4djwPgpWs=
X-Gm-Gg: AfdE7ckuu7HxAog8XczVSoDolKJ0u6n2XOjY087/P68ysrYndGFwWKka+pm5b1nkmej
	6KVsiaUy8dol18PfOdMS41AZMedK6M4DMTfEEGA1mnBKmnacqkoxTlA4GRPk42uwWmtirvm0Yc6
	4yunsfetyBblPRFelXXEidYv0jJNhFdEfBaCePzSsZHfdCKD0kdPGKNpViJoBOKkMu0Ux1FUMxk
	V6BWONOOvgtMiojfalksPWNt6WBeY2Xt+FH+qcIcFfIY3MTJXvsA1ltHADjp2BuzapIWa+ijQ5b
	3x7DxPHj2qItgbrFy08=
X-Received: by 2002:a05:690c:4d83:b0:81d:d035:eb4b with SMTP id
 00721157ae682-81ef22f15ecmr41881237b3.19.1784495364767; Sun, 19 Jul 2026
 14:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
In-Reply-To: <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Sun, 19 Jul 2026 23:09:12 +0200
X-Gm-Features: AUfX_mzAKn4OrNAtXWomQRAbZerhdiZ5kkyJSxJPwI1hfOOK1mJBaeXrnWi0ctw
Message-ID: <CA+c=wxXJCB3Ms=eRy4Bs6fG_uA0owLYpmaXHmxP6woeP+icsWA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
To: wens@kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_140926_431726_AB597348 
X-CRM114-Status: GOOD (  17.67  )
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

> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks a lot for the quick review!

> So the patch itself is OK, but I think there is also something wrong
> with the GPU mod clock. The GPU clock is not a standard divider, but
> actually a fractional one. The formula for the output is
>
>     Clock Source * ((16-M)/16)
>
> with M being 0~15.

You were right, and it was worse than I expected.  I checked the T527
user manual (v0.92, section 2.7.6.58: "FACTOR_M: mask M cycles at 16
cycles") and then measured it on the Orange Pi 4A, forcing each OPP
and reading the real GPU frequency with the Mali cycle counter.  With
the current linear model:

  OPP request    programmed    measured
  150 MHz        600M, M=3D3     ~487 MHz
  200 MHz        800M, M=3D3      648 MHz
  300 MHz        600M, M=3D1      560 MHz
  400 MHz        800M, M=3D1      749 MHz
  600 MHz        600M, M=3D0      599 MHz

so every OPP below 600 MHz silently overclocks (thermal throttling to
"400 MHz" actually raises the clock to 750 MHz).  Interestingly the
vendor BSP models this register as a linear divider too, so the
vendor kernel has the same mislabelling; it also removed the 800M
parent from its parent list citing GPU job faults.

I have a fix working: a small ccu type implementing the cycle-masking
semantics, with the A523 GPU clock switched over to it, the 800M
parent dropped from the selectable parents, and the OPP table for the
Orange Pi 4A.  Re-measured with the same cycle-counter method the five
OPPs now come out at 149/199/300/399/597 MHz from the intended
parents.  I'll send it as a follow-up series referencing this thread.

> And we're also missing a notifier to switch the GPU clock away from
> the PLL while the PLL is being changed.

Agreed =E2=80=94 the series also registers the existing sunxi-ng mux notifi=
er
on pll-gpu (cpux precedent), parking the GPU on pll-periph0-600M
during PLL rate changes.  The manual states the mux switch is
glitch-free.  Nothing retunes pll-gpu at runtime yet with the standard
OPPs, but the higher speed-bin operating points (648-792 MHz) will
need it as a live parent.

> Do you plan on implementing GPU DVFS on mainline?

Yes =E2=80=94 see above; the series is on its way.  The speed-bin OPPs (SID
efuse gated) are left for a follow-up.  Happy to test any related
series on this board in the meantime.

Juan Manuel

