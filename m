Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F57C9EC95
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=; b=ljGaz9+wnMlRnb02xDiR/cvj8s
	TD8cxCQmFez5idBeaDXpg+GkBXwtWRK8rajbMLfDQASVSQEj0uWm394jKYHleTVAUMptmanGx3IBd
	8M1cF0D0ZXiLSFsRT4QXFwGNqr/BRl4FHvm8YKjlIy51E/JzdjSstFEcBQmI95G1BkcuXN5PelOYE
	T01oMpTzCk4zSyO3OZrfFHisGlZ6XGkLFLZVGCxWj/UoVZNWhrEHFOZEEdeJqwTI8pOTB1ChyeZu4
	JSLiqpAl/EqPSiWFmsfnv4gApqSIy66+s6yyqhFV+uQbBUmiAG1Qbi8WbH4kX3pBACUd6hRg0ozar
	8lRaK8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIvu-00000005X0n-3MZA;
	Mon, 12 Jan 2026 14:30:14 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIvs-00000005X0H-1l9g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:30:13 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5eea9fbe4a4so1225038137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228211; x=1768833011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=mnz0a3XlvmeB60NCfA/80HnlbFTBecIe0WY6s1XU9JuurREG6w8qqzeR2GoGzE6Ldz
         xNOEuCiqMTicvLR1FvjFTRDhKHFlmU7GVUvUixZQW6ra/gAAtGZNQQAL+Zp1p5NXMiBO
         4ZkJOleTXqKZc2V98TLWDSPVWFeZmmQ7Xn1erToCCKSRFMuw9XoLeDumSlrqysPgsTtr
         dO9xUJFQU9NzzijYcQ5nm9hq1t2ybRVgrYyFY8/Ah6a7ugKs1Pha3pVtt6LU8yZUD0dL
         HBUTB/Bgn12tfQp+m2Rnm3T7rhpZnyIOFJA2hYj1MtJX0fJz/LgGhgvrZvfEQmY+m7xo
         rNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228211; x=1768833011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=w/F3obuhCicSQPMl5dy1VWB8rJr8jKn6237InQ6kjTYeJnqVHGJFZ4nioepW43dUsD
         iCs4rg8TjtmJ878GDzWKsibzGPKzC4IhRnuhHcDpsBQ1d1z4qSCnGQk4eCWaYB62B7ij
         l1SXa2/1qF2wOA3+cF/R0AmlPJfAfTFmzOnWk2i9bc4e7MqoHWI+hPilhWE9PbC4qLyr
         Bgsat/235wBylgFCymuY6NpslbpZwoQic/PW/GUR5dw77qD+Lso58Bbpu73rkuq3FFom
         gtMsMBwlU689I6wI5Ug/3vSggchTkAKWlZTFrwIBE5Rf6MNB+Jt5MVV0zzv37xOQJsca
         lf+w==
X-Forwarded-Encrypted: i=1; AJvYcCXGxLHP/qTn+ZCi6gH4RMyUANX8ncMoKJ27m3eLhJi6KQE9eStw2AQJpGG3c1VpWxo4u4bZyU7rpnOkYk/6VTcj@lists.infradead.org
X-Gm-Message-State: AOJu0YywFCay+LO7w1lrJ+nUDzA26ZX2gBbvRbIeggpKd1geYEQFWc+u
	ALA4GkfC+BsdRf+gnAthLdFIhpb5VaNd6CiJ7oM7xJ+saG5ijhg9Z1yFAgppWcjt4OU+zBCkpKa
	aK9GhwynufNAckNYAYsPsO4V/6bNoymrjggZqi0I9QzXf+sBcbIVJO0w=
X-Gm-Gg: AY/fxX7evydh5OK2Z5Be2KM7S/GquBW5hcVwe5N00MDYhTGKPcj+oI2QcjAA+ewePTs
	AcnttAUdEFLi9b+U02nPWBxGi6GdnpT8EeFrUIWSvkssgVPEnzfj4p5zfIY4cckhQxQ7HUgj/U5
	TshV8GwDgaVj+4gvBDhmOHVZrtAMyyQg9gDXUSUhDHEw5xdH+osWYPf6VrdYAQ5tKAE5zuq7UmV
	agLo2NhPwSY/6frimeRYg/1xHYdqChaqxbTYvKiw0G5DSnpD9pOT05Xt7RtkiMx49+CZBHbZJIa
	LWPMLu9TPTIZy+fsIkwPJln1YH+QeQ==
X-Google-Smtp-Source: AGHT+IH99W7nwLgEet5FdEP/u+i5jdZDgClsT+5CiMOQ1spY+a7QdU3aguNyWZv64H0AdvbI4admB5ccZbM6V9dJafg=
X-Received: by 2002:a05:6102:8088:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5ecb1e731d9mr6591509137.5.1768228209479; Mon, 12 Jan 2026
 06:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:29:56 +0000
X-Gm-Features: AZwV_QiWt47PILn4o1sT2KySNxv4rOargBnbBbiIyWb62OAi4o7lAfW6acLnscA
Message-ID: <CADrjBPpiMxNsHMnV8StHvU7waW3QE7jtAPK3Gyq-j0mVRQrgnw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: fix sysreg save/restore when PM is
 enabled for CMU
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063012_477831_F2011C45 
X-CRM114-Status: GOOD (  15.34  )
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

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Currently, sysreg registers of a CMU that has PM and automatic clock
> gating enabled are not saved / restored during runtime PM (RPM) or
> s2idle. During normal suspend, they are accessed too late, after the
> CMU (and potentially power domain) have been shut down, causing an
> SError.
>
> The reason is that these registers are registered to be saved/restored
> via a syscore suspend handler which doesn't run during RPM or s2idle.
> During normal suspend, this handler runs after the CMU has been shut
> down. This registration happens as part of
> samsung_clk_extended_sleep_init() via samsung_en_dyn_root_clk_gating().
>
> When PM is enabled for a CMU, registers must be saved/restored via
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() respectively
> instead. These use their own data structures and are unrelated to
> anything that samsung_clk_extended_sleep_init() does. Calling it
> unconditionally from samsung_en_dyn_root_clk_gating() therefore isn't
> useful.
>
> Update the code to prepare sysreg save / restore in a similar way to
> how it handles other clock registers in the PM case already.
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() already handle
> sysreg save/restore, just the setup was incorrect.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

