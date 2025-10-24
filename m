Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49992CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=; b=rYlQ7RgekKUsrOEyDQgOnPBc++
	1TiWTQTBytEhDCO1Orndm30t/htOuJ2EyW1UXFvWok2Y2i4X3Lh0Y/HYdT5j9WVWIjMmupkcZ8YN/
	W0W7FQeyhmmtM/MKeQZ12i9bvvCf09jLjLAA/iLvikcaWVb2MGN4htbk0rEfmpY0Oeq6smOssm7Xi
	yAV0qVhmTQLi0pwGiDKF3bcY9xFOWqhkm8humQ0UwmTC3ik/6w1FFBImAWVJlwuSkZjRGXVjVdQTn
	Ria2GrmQ4rTsvqgkXccGucDcxpQP5ualwRFTKUyZTHZe6QYxe0eESqTF5Za4uABiZyT0lfPhJ0XGV
	02Ny5s7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCICO-00000009afV-3Ysf;
	Fri, 24 Oct 2025 13:51:20 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCICM-00000009aeN-1S7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 13:51:19 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3701626c1d5so338427fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761313877; x=1761918677; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=;
        b=vzzcRqp3dlVyejp3uvw6KsF7pm3ZksgeF29vPaQZecWdrd+onqoTRM1oKSs3+GIfg4
         CwQGwQ5le58vIeoeHTglNa+WUHz/C3b2BoSifRWUr5Tm3nwdI+h+F1NyQMgBMfrWzwtn
         b/ET153KQ+c6gH83grqVOQaE6o6VclPWFKQI+/5QH7Pk8nmMrgjeb+Wmkjl8VNLP65b1
         VsMClRQBqDr2FiWwT9mFAYEj5Wg0l+C/EOkRAKxlO3bd3uW6qDBQQve3WTTXv9muMCq7
         jgY9z0LfuL5HsupV4zEWaz3KJM13oja86Z+0nW4PEr+JVhOqxDAUv5MqHPFjTwDX1VIW
         7QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761313877; x=1761918677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=;
        b=G4KAjyBFAcyWzVpdRQ5xX9Gvp64WvTLkhI0QoOFcZM0Vm9B6rbDmHeA11CEN0qu5Gz
         ajsPjlPcJWxwssmDS3N2Iyi9a6NUv2SqxsjZ/NlzHNgyAJ43o0CVxB5NHRxhpZgbvHp0
         tWQZD2bHqdWfM0JG0+gpR8plPSocXvgwBFqN/vW8I1GFaK2mNSTCR4aqe20eUO4cvL64
         5JMuGlxh4oIAsQq3myCti6iiGevzikvDlyDwfofaaKEGk1F+3jBPKptmIEEPFj8v1EsR
         m1n/2m45uVY4RQ7nWiH1HCun8Ta7lKWnLIXZMZCw/WjJZbo5xOfNyICvBHPm3TdlNiN4
         P1bg==
X-Forwarded-Encrypted: i=1; AJvYcCVk8hOx8JxNDGFm6B4CwGxBloWz2QrBIIq/GjI/w+gS5l0BNgJL68wTfHKPifDj1smtRl2O1TfrU5H6KrDNMNaL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxep8kRlKetGuxVRTIQVsvJpFNMdTN2PC5uRiFfK7/bx6K0yI28
	8sa9dpcLLAXz4TT1II4ANz6vTWxbQ9y/Gzla3j6IbjOe4Ps+/5BJP8Dp7Fao4Yxvor2oJh14Nyd
	r6lMMFTgFPVhcre+zzqjJnomM+dERReuTCD9q7RAAIg==
X-Gm-Gg: ASbGncs/68zRzIn0DNT3vi2ttwLPUjA++OztI0ieDi8A9LKw0oN+6LJll4rKcKDxBJ6
	He89by0SKc8NRWvla3b4Hun80N4g/8XQprA/7WyNjbGMd+/RIJgxdFP2ljG0ec7lAkamrSUJqRc
	NDy/9AzyBjFniol3wh73DLQUmQzD9xUwG2hAuQaY3dfBCUa6k/UR1uRQcMhmtcGcp4/EfZWPtCK
	IRsldi8ZF/iv8i1o4goQ3FGlbSGgKDm4eMHSeJPKEoSX0hy2PP78qt9YNm3LA==
X-Google-Smtp-Source: AGHT+IHlphEUHdTlTQJtVbz4Rb5yJO5rZyVkkvYKLNT5GKPiTAAZeQLOg9k+GYR4etbv9qcFfzt4GYI8LyWVmzZyT20=
X-Received: by 2002:a05:6808:1907:b0:441:8f74:f44 with SMTP id
 5614622812f47-443a319d493mr11540703b6e.62.1761313876914; Fri, 24 Oct 2025
 06:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com> <20251022-savvy-sly-auk-a60073@kuoka>
 <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com> <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
In-Reply-To: <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Oct 2025 14:51:06 +0100
X-Gm-Features: AS18NWC4v_lHSaYSR7559EcFNWgZxeNNJqRfIGOSzsUX6VCSF3TlMbDJY2BWrMY
Message-ID: <CADrjBPpmUzu=g7RfJShC_2VNnvAt9Ur5NrGbyctssyMQ0nPkmg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_065118_407833_DC2BE999 
X-CRM114-Status: GOOD (  29.96  )
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

Hi Ivaylo,

On Fri, 24 Oct 2025 at 13:34, Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> On 10/24/25 15:07, Peter Griffin wrote:
> > Hi Ivaylo & Krzysztof,
> >
> > On Wed, 22 Oct 2025 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
> >>> Introduce a clocks management driver for exynos8890, providing clocks
> >>> for the peripherals of that SoC.
> >>>
> >>> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
> >>> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
> >>> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
> >>> bits in the same register that controls manual gating. Hence, don't use
> >>> the clk-exynos-arm64 helper, but implement logic that enforces manual
> >>> gating.
> > For sure it isn't the only upstream SoC with HWACG, gs101 and e850 and
> > probably lots of Exynos SoCs have it. Whether it is the "first" in
> > terms of release date of the SoC I don't know
>
> Huh? Samsung hasn't released a lot of exynos chips and you're free to check
> kernel sources if curious. Exynos 7420 didn't have HWACG, 8890 and 8895
> have it. Exynos 7870 (roughly same gen as 8890, but budget lineup) doesn't
> have it.

I'll take your word for it!
>
> > , unless there is some comment in
> > downstream code to that effect). Your CMU registers do look like a
> > different layout though.
>
> Exactly. First implementation/gen of HWACG == lots of room to improve.
> Which they did, and this is what I implied here. I can word it differently
> though, to be more clear.

Ok, that makes sense. If it can be slightly reworded to make that
clearer, as I found it slightly ambiguous on "first read".

>
> > Just fyi gs101 also has Q-Channel registers that contain HWACG Enable
> > bits. The reset state of all these bits on gs101 (both for QCH_CON_XXX
> > registers, QCH_EN bit and HWACG bit in CLK_CON_GAT_* regs is off). In
> > my case I suspect the bootloader doesn't initialize any of them
> > because of the CMUs "global enable override" bits in the CMU_OPTION
> > register (which is initialized by the bootloader).
>
> Well, to be fair, without any documentations or bootloader sources there's
> so much so I can do. The vendor kernel also force disables the qchannel
> registers, hence the assumption.

Sure, I appreciate having no specs and only downstream kernel sources
is tough going. I think it's great what you folks are doing under the
circumstances! I just wanted to point out that having some HWACG bits
in the QCH regs isn't unique to this SoC (although it would seem that
having to initialize all of the registers possibly is). Maybe the
HWACG "global override" bits is one of the things they added in future
revisions of HWACG.

regards,

Peter

