Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB81E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=; b=gjyEdhtz4p8CyEXtVCnIKkxu8g
	m6AYL+o6o6+SPjjWMV7I4kWo7PpRlF87Ft2sSVUMVCiTEW20Q/jvmN46lmcNgK0OXoRprNnEiavAK
	4a3LIH0FNCigun7moDchnEUO253whssB1AZWMPy/U1dipDkFsG1vb+UCHh4IVJG5Ls8KNNeonCRe0
	W8zef8yI0aqt1bpFOFAjbx/tuL+xjJrAMzIyC2V1+ofY+nq2O8A4eeUaPF2pC4gnAcIMNwLxLr5z3
	MLPpQs7IHAJrImaGdRUDDZgyAlDGJTjiW8IrW0Vo8AdBd0DlmMh5ccGfVLjiMTd3RbFnfDzDEfhPD
	LAVNZuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt2Y-0000000BSWT-0TIB;
	Sat, 20 Dec 2025 09:14:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt2U-0000000BSW6-3V9H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:14:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so1809622a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766222053; x=1766826853; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=;
        b=MrbOl1WEzrTkTjMv50/qEOBF+M/HL5fsLD4cYdR0N5EngCbUbURWcQCl1NIdtaV6TK
         FKj03UgAlDI6oFtF/t7o05Z9zcD4ADBTC4cdgtN7nsBIYXLrLmxwLgmjqTDKHwVqaL1l
         oC9WGudreY5qJM2ZvglEjlVvfUGz3p9Lb9tv3fdYcOUYGzi8BryIJtrluKcyDIHCxexD
         gN0dMZeF2i7YzPXIhz83GXpLm3J8XedAZcRM8EUfpEs5vTAFKsNvk9cR0LaZW3icJl0R
         jEZetCGfnTLxh9pfzf/1gNLiPpwlaxojf2o0LyN8mbYatOVNIUMmThx4XC7HmNlxGL9m
         4mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766222053; x=1766826853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/inw8Dh0i7lSvgEv+rdg7GhciJ8+cE9trn51HAd7CVg=;
        b=UvoDhreP9yZQvU4EBw8Kd8SHvMnBEmYhJgI7K7hQt3iCv4B47f7GdB0FKDrDvbn38L
         5pOh+CIfDGEV0crqA7uvKLQPR1wJAlxVFXEEeiZ51E+R/DENwPsZYlGnZInohz+5fLp7
         1Bij/NOJvlGUweLI2QTqxtBmV/htlHzZqVClP/P2kVQBUCtdH1l37cyuESVydRG2kUkY
         /c1doJ5UOZQdJyM7cRZVHVi9Lff9FNBDj5Ixv/djapFCOn+DB+hiclEm7btwiB9Ex+ku
         1FBJ2CjMEABJGoR6tZTCgcyWwmSdJU83HdF+FG6mQMR6u2+wo3mA/eZtklS39Fb2dnMW
         qrbg==
X-Forwarded-Encrypted: i=1; AJvYcCU5I/SwjMwjND6rtrhGNBKvBWOpE8oEWFI8aHlzMRspWMRjGDulEVUSpw8vTQ6GUTpcmoCGBoeUKVfqKeYs3mZ3@lists.infradead.org
X-Gm-Message-State: AOJu0YzigmGpWTKI3gjMzsyFM7oCfiPcS2bZ1qvI2VCfOG5n/Zktv344
	36yHJKf3qWtJ9l9wd5CgNMASPeZWAwbGzCW1t/hQDUx1qorQmGN13+M9zbd3dGBN9ILPY53J3QL
	k9cB8f1uzpS1QUfxMuS0ni+Rp6MfQiNB1kn8HW0rhJw==
X-Gm-Gg: AY/fxX4o/xL+sDcxSgeCKNNq2+JQD88E52BbgVCv2ti7IFCBB1pcyjuGbYqYc9JOWgL
	Qox8kXW6av5Pw/W0/4jGemeUTNi7+KNDH+9Gch+qFEYAykpTUBNEvc7hJNPgcmCIcw7YxVSA+kQ
	gibCfrJqwKyg385STlsV3K2b+/pLidJZE9/uqFh4KcNN0qMIR0HHuIuVTsRmRXk2H8cVx1Nkz2n
	SkEYi0714gwSU1yuvak9JcjZq1uiyNA+477s4d05MuyLl0YfyuIFZSo6ReKq6+658kN3w==
X-Google-Smtp-Source: AGHT+IEi2oGHsGZXR7le6EPGgQR/lFz5KV5KMMycyOqdS3p5vqm96+TwVWyXCuuGX8CGH2LK41tImG4vOGHehFDZu9k=
X-Received: by 2002:a05:6402:2806:b0:649:9159:243d with SMTP id
 4fb4d7f45d1cf-64b8ec9cf53mr5203694a12.22.1766222052663; Sat, 20 Dec 2025
 01:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
 <20251114-automatic-clocks-v5-3-efb9202ffcd7@linaro.org> <e402ac33-c23a-46a1-b67e-097eb2ea7752@kernel.org>
In-Reply-To: <e402ac33-c23a-46a1-b67e-097eb2ea7752@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:14:01 +0000
X-Gm-Features: AQt7F2q9EnqLES2x3fb7MS0OWHPiCmq_EbCvY_7B7i_Ph5AvJoB7PQVDPtGa-S0
Message-ID: <CADrjBPq2oTz=PomQ08rWgYiQ40ResAUiKg4QVGoYCTYX20dKNA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
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
X-CRM114-CacheID: sfid-20251220_011414_910957_79FFD913 
X-CRM114-Status: GOOD (  24.26  )
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

On Thu, 18 Dec 2025 at 16:06, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 14/11/2025 15:16, Peter Griffin wrote:
> > Update exynos_arm64_init_clocks() so that it enables the automatic clock
> > mode bits in the CMU option register if the auto_clock_gate flag and
> > option_offset fields are set for the CMU. To ensure compatibility with
> > older DTs (that specified an incorrect CMU reg size), detect this and
> > fallback to manual clock gate mode as the auto clock mode feature depends
> > on registers in this area.
> >
> > The CMU option register bits are global and effect every clock component in
> > the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
> > bit on every gate register is only required if auto_clock_gate is false.
> >
> > Additionally if auto_clock_gate is enabled the dynamic root clock gating
> > and memclk registers will be configured in the corresponding CMUs sysreg
> > bank. These registers are exposed via syscon, so the register
> > samsung_clk_save/restore paths are updated to also take a regmap.
> >
> > As many gates for various Samsung SoCs are already exposed in the Samsung
> > clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
> > some CMU debug registers to report whether clocks are enabled or disabled
> > when operating in automatic mode. This allows
> > /sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
> > correctly report the status of each clock in the system.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v3:
> > - Add missing 'np' func param to kerneldoc in samsung_cmu_register_clocks
> > (0-DAY CI)
> >
> > Changes in v2:
> > - Fallback to manual clock gate mode for old DTs with incorrect CMU size
> > (added samsung_is_auto_capable()) (Krzysztof)
> > - Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
> > - Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Andre)
> > - Reverse Option bit definitions LSB -> MSB (Krzysztof)
> > - Update kerneldoc init_clk_regs comment (Andre)
> > - Fix space on various comments (Andre)
> > - Fix regmap typo on samsung_clk_save/restore calls (Andre)
> > - Include error code in pr_err message (Andre)
> > - Add macros for dcrg and memclk (Andre)
> > - Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
> > - Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg (Andre)
> > - Fix 0-DAY CI randconfig warning (0-DAY CI)
> > - Update clk-s5pv210 and clk-s3c64xx.c samsung_clk_sleep_init call sites (Peter)
> > ---
>
> This does not apply, please rebase entire set:

Sure thing, I just sent a v6 rebased onto next-20251219

Just a heads up I hit a regression in serial on linux-next that I bisected to
24ec03cc5512 ("serial: core: Restore sysfs fwnode information")

It is unrelated to this series, but I guess you may also see this in
your exynos board farm. Now I have identified the culprit commit I see
others are also hitting it as well
https://lore.kernel.org/linux-serial/713aa37f-161d-4f08-9417-d7d2abdcdfd9@sirena.org.uk/

Thanks,

Peter

