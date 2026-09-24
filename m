Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879EBC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 05:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=; b=pci2UftfosFg+3b0Ya46NtHl2H
	tY88kuJ+cwDnQbmpZH8ZmJAzAWkg1mgKzGlibBB+Ji7+Ifzmee/JonGxO5AvC5yLgVnhOrceMajQC
	4Oo2Ffbw4VG4xvMAU9kBK81MOiaEK/e55ZVo504XA9AxsPpSwIe49cslpcGeX39dfFqAb2H728Nie
	G5k4sKK9uQpP3yLf6jqq0GvigunAuuJ+MHBoNE+mHFfOPEaemK+DmXVhcpi/H/61mruLwdNHYStKc
	Rsa9GzAWA9PPPT5hX/pIeep35FefAm1BaXsHs/3KxOO2QGhnxm3LSz5yNMUTREQPjRfKpx1URJkCT
	P33DvX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cQK-0000000A5uw-3Cxi;
	Thu, 24 Sep 2026 05:55:12 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cQI-0000000A5uL-17ax
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 05:55:11 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c293a9e09b9so80324766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 22:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790229308; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPMyJolhUnj7G/isB32/Pst86IHotI65QMw9dVoVYvNmk6Gwr0ARNZNIhc33eZ0kfo
         vGAhstqCZpTOQDLYK+52e2Dj6OfxhttKGCSm/rq9cpSpHp3fX7mUJeWagLsJTZJv+jKV
         q6EP5nEABuQw1ongh1VVxbdNMg+ZBKiMOTR3TGB4EhqJoISBGdCbY8m2hZS98bL87iYF
         OhCTLEaO1M6D6uS64i6fbUPsXV4gIjgtb5LRnivRvFR8UOW9m7JW8Qx7BY+SwHqjMvI8
         QpPcOA88q/xirwtbKyxj3sLvCNDprewRlWHz9lYCevAIR+QeRZ/17UxmpunmXOda8Jlc
         dB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        fh=IkiFyzlHiIiFKIQTGLSy7tfpzdcVwnujOj6AM3aXnAE=;
        b=lnGFEEF3rfsEjf+2fJlbUDSCT/DoPM1VWzQ4qs6zOn2rEaqemtJH87/IXRTkf8k1g9
         PGy/q7ziclKpa6jBtlwC16UcwlzK4iKjo6cnMZwmay0J/tUTRP7qqHhrc+rNtHQBnWuM
         786HkXs7vp0BmwQMxqMOz7bpY964FRe9d3aA7fBlZyHPi2fNdjAjMX3wZCFRqYT8U8GL
         rJx8dW7QsexX1Pa0OgBBudDXI9zfngfHgy/wBfG4lVHtO0W6eX54UNoiilAY89zl38RX
         mbBZKXKdKtBIYL6DIEgz0meqoMCibexFsK/IrRhOFK4qmIrf3ZFnvGdqWVffl+zwQRnd
         UnaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229308; x=1790834108; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        b=RpB4/0HJYFmoN/BxcRT+1Sz0v2GzasHkOVQhvz8CEsuBiSqYvl0Rh09VCNGXvF0nvR
         qyK2fgWJg+rvaBrnJHHRwfD2ESZXkFx0aVj0wtKHguTzESgoO4iZ4no58nRYC8lEnWwz
         8X7GNcCl1vGKHTlBfert1X8Z0mmTZCUMTZGJ8WBA04cBwAVVA4J24NEE5ZtZHkMteMWo
         3bwd30VAjD3hgTYdWiPZ7a8Y0cBxI0wEJkrUGipWDrMLld1Y0ZxjV9FawvtlQZHmDPlw
         VgbAQbtjBpJnUUPOZ1dPi8TrSjGZDPVLJ07k25Xeig1R84KPUtMIxFDqKJNS6fdVIcgV
         wdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229308; x=1790834108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7/suQeptALUdsHaayyxRg2Z7cAgGugdiTyYw6qUQKs=;
        b=o1UFHAVvoGr2dfEJILxZDUOxyzW0Ro+IHulwio/bPQsrYo/gBUMb/OgroOm/g+H8aZ
         JRos+HkwAhvu588LDZq0RPrF08HYqWZSkFdLgfKcF+wYIhX0/SgXcKrNHDYmf+YW5o72
         TDK3vZZm8HenTYn53EyodopjnP6hemXUC9QlQnmfrarM1jlYuNP8JJvk8j3pptfa9iIq
         8FpD4+j7L5vbdSyFqVLqiuhpHPoKzPqBWlXIGO0gxnSlVCJ8azo4rU4cuQhQmwRJCUIe
         +2cXl90zs+Lc0bHt9Y+Dj9vvk14JDxvIl42uu6cGIcuTcLjYdT5eXQjXfNq3co9W3IG2
         I09g==
X-Forwarded-Encrypted: i=1; AKwUvBxyLncfMJlDE5tby1vfNez88ag2BMBa+uOnsWGwXj2GXk6m6jvNB0w/CtNJKakDKdn7mB5SC0PESLgcpP5tnzs/@lists.infradead.org
X-Gm-Message-State: AFuF++kUMp4MP7hjq3nYLFkn9qEctHIRuFIRdiySG5LS6iP1DYr0Shju
	BN/CAeOIanKRuHs4RnsGbtCE2ErIrAGcvlVrVHsF5V55DQtY5WA3IPlLJ0mvYeWQE9S25j10jL3
	tJbeD8qaFOT/kdQUYoz72/rbODyZC/Ns=
X-Gm-Gg: AYBFou3LPt2UytysoJMM5ng6aOY9gB9xKKT9lF21xebl70tUXoBodNzF18ohqZkxLNv
	lfcq6mlyQT1z+nRWWx8gxydM3vSXz/PfSe9i6VdGNJcUhnTgjlQyEbkB8c7EhkiCUFoIBi1qD5b
	TsPX+s3Rq2eerOk63kkLjfRAmx4ZAZdx/jqB5m7hILKMbusvxAMxXEGWrIHq9ABwXosh0BdXsyc
	DGfLSPlH7Di8hEGhK6dVmQkfDYCQ24+j1k5C/gDruO8F/va3pAADwZKBSXwZIyVc3jhodPsX+/z
	hw/JqLfDXIsQDff5OjhGK178F6VhvMpQlPYcntLumaS7tGCZL2yvaTG/jw==
X-Received: by 2002:a17:907:3e23:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c2ac23a5ff8mr94779466b.14.1790229308282; Wed, 23 Sep 2026
 22:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <arPcHSGFLrxXFEyC@oss.qualcomm.com>
In-Reply-To: <arPcHSGFLrxXFEyC@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:54:57 +0800
X-Gm-Features: AclHuK8aPw4t0qe9OTv6pasVNbTw4PRHtP09UUP7WaSlSf6YYjQMVV3B1tdNgXM
Message-ID: <CALj3r0hMLa96XtuPxjdJJnsn0hzEc23_kMUZ=GWmDAeP2AtFCg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, Alex Elder <elder@riscstar.com>, 
	Daniel Thompson <daniel@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_225510_356016_014035EF 
X-CRM114-Status: GOOD (  49.08  )
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

Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B49=E6=
=9C=8823=E6=97=A5=E5=91=A8=E4=B8=89 22:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 23, 2026 at 09:17:44PM +0800, Coia Prant wrote:
> > Hello,
> >
> > Thanks for the RFC. A few comments.
> >
> > XPCS_ID
> > -------
> > Is 0x00000030 documented for Qualcomm, or is it derived from
> > NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
> > I'd rather see it confirmed against the Qualcomm documentation or a
> > register dump from real hardware before it's used for platform
> > identification.
> >
>
> It's the latter (NXP XPCS ID + 0x10). The Qualcomm hardware returns the
> standard XPCS identifier (0x7996ced0) upon reading the 3.2, 3.3
> PCS_DEV_ID registers. I tried following a similar approach to the NXP
> DSA driver of reporting a synthetic value to bind to the Qualcomm part.
>
> All this was just to make it work with pcs-xpcs-plat without introducing
> a ton of code.

OK, so it's a deliberate workaround, not a hardware value. I see the
NXP precedent, but I'm not sure it's a good one to extend: the ID space
is global and finite, so a synthetic 0x30 could collide with a future
real part and bind the wrong glue. NXP at least needs its synthetic ID
to select a platform-specific PMA config; if the Qualcomm part is
otherwise standard XPCS, matching on a fabricated ID just to bind the
same generic code seems like the wrong place to solve the problem.

Leaving the final call to the maintainers, I just wanted to make sure
we weren't matching on something made up.

> > Structure
> > ---------
> > pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
> > need any platform-specific handling. Adding another abstraction layer
> > on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
> > and Rockchip differ in power management, address window size (2M vs 8M,
> > ...) and MMD redirection, so they don't share a probe path.
> >
> > Pushing that into pcs-xpcs-plat would also drag every existing user of
> > the generic glue along: they would suddenly depend on GENERIC_PHY,
> > PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
> > would have to carry per-platform branches in a driver that is supposed
> > to be platform-agnostic. A per-SoC-family glue driver, the same way
> > dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
> > separate, keeps each integration self-contained and leaves the generic
> > glue alone.
> >
> > Would it make sense to take that route here? My pcs-xpcs-rk does the
> > MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> > reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> > help with the generic parts if that's useful.
> >
>
> I agree with your concerns regarding the glue on glue architecture. I
> also don't know if each platform glue should define a custom MDIO bus
> with similar logic. Maybe we can have a generic abstraction for it?
>
> I know that Alex had a patch introducing pcs-xpcs-regmap.c [1]. My
> original code for this platform actually built on top of it before I
> moved to the current implementation.
>
> At least I now know that multiple vendors have an MMIO based XPCS,
> albeit with differing MMD redirection mechanisms.

I looked at both pcs-xpcs-regmap and pcs-xpcs-plat. Neither fits.

The regmap helper targets a window that doesn't align to a page
boundary, but still assumes a single contiguous region. pcs-xpcs-plat's
indirect mode uses only 8 lower address bits for the register and a
viewport CSR for the upper bits. Your own patch describes the Nord
layout as "separate direct-MMIO windows" with MMD 3 at 0x0000, MMD 1 at
0x3000, MMD 31 at 0x4000 and so on. That is not a contiguous Clause 45
space, and it is not the indirect paged layout either.

Mapping the Nord registers onto pcs-xpcs-plat's indirect mode would
mean claiming the memory is something it isn't: the hardware exposes
direct windows, but the driver would have to lie about the access
model. It also doesn't match the DT binding, which describes a single
reg-names =3D "indirect" region. A platform with separate direct windows
should describe those windows, not pretend they are paged.

The Rockchip glue differs from pcs-xpcs-plat in more than just address
translation:

- it marks PD_PIPE as part of the wakeup path so genpd keeps the
  power domain on during system suspend, which is required for MAC WoL
- it keeps PD_PIPE on at runtime via dev_pm_genpd_rpm_always_on()
- it adds a separate "eee" clock on top of the csr/core/pad clocks that
  the generic driver knows about, and derives the
  DW_VR_MII_EEE_MULT_FACT_100NS value from the EEE clock rate at runtime
- the read and write remapping paths differ

None of that is address translation. Folding it into a generic glue
means either per-platform conditionals or an ops layer where each
platform stubs half the callbacks. I'd rather keep them separate, the
same way dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate.

If the common parts can be factored out cleanly later, I'm happy to
rebase onto that. But the platform glue is where the platform
differences live, and right now those differences are substantial.

> I am going through the pcs-xpcs-rk patch and the eee_clk already stood
> out to me. On my board, the PCS link does not come up if the EEE clock
> is stopped. Going through the databook, I did find a barebones
> explanation of why that might be happening for USXGMII, but I need to
> dig more into it.

Same on RK3568. Without clk_xpcs_eee the SGMII link is unstable, which
is how the Rockchip glue ended up enabling it unconditionally in
xpcs_rk_init_clk(). Downstream carried a fix for the same problem:

  https://github.com/immortalwrt/immortalwrt/commit/2ff0f9435f688b1d9ae2757=
10e13ecd0c54e9724

The databook calls it clk_xpcs_eee, but the generic XPCS driver only
knows about the core/pad clocks, so the Rockchip glue adds a separate
"eee" clock for it.

Looking forward to seeing where the Qualcomm glue lands.

Best regards,
Coia

