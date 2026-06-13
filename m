Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA17CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=; b=5EzJJSsheG30fpfwK09nWrNMZq
	GfuuPbgOhFVCzUZdcG0TcZ9Z8I4ho41ypVlHa3VA7BhQER0IxgorjpPs3NyBd0X3CaJH2BwXXe6Nh
	jnRGzBtfG0ark/Np0+LBmINyOhM4fMSo7UfpyPJDWCphiwgIpsTZIE9eVRH+6NZbFVils5l1PMnI1
	K2s1RSlEvqM5LIztFnpnV6m8h2dIUpIXSVC0Mydbm9aair0fcjqHNi1lK0TpWqKmAKp/Sc6k5D+LR
	Vzfnhfx+ecmm9rxtPT41NAuUYSfy/37Mal3NqI7nT+gMbXnttRH7T3jFui/tWIx+v6+kwFUEF6zTK
	5s1Kn3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYI8S-0000000C0Jk-2bHx;
	Sat, 13 Jun 2026 06:46:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYI8N-0000000C0IL-41Pv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:46:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so2533395a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781333179; cv=none;
        d=google.com; s=arc-20240605;
        b=JdNcv7+kG9zg46OfMfSOHhV+0PyWAPpSRybsK+hDgZDxIyw7WkSNGCMr/kFdB51zdr
         5VVQPaISBexpayWlJfi7I8EBMFQLRhaht0FOL/ClJnmhnDc9sY8CM+nxUPHFvjS3a2Fh
         DJtP9vPHlb2XxcklCCVK36k+Q35UBrdQf61xVm8T8CuEEj72oLoX3ZA8VyM4IXIiBqBd
         gqy7qF7rvqFRhjg+eFO1w4IlTMBgHtyyeu7y8e18E1Lq0MFbP1AH/GpNagohvRjQOcI1
         f4z9CkQ8kJRxzgCEF+SbJUtd8We/7KBqw1JnViGK1j2fCGULrJG3HhBEnP95qGkVTYBR
         EjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        fh=qhbe65bfiCPsUZqocxdcDzks2dtw4I/EiSdeZ+E7OJ0=;
        b=BhRVJg209haQcqIlf7ElHH9yG1bT5DOtLquEbiIWgKCcQW/0RhlvpGPK227rURIR/g
         fhpacxxtAtdbql4WkqqqZScDkeVPqrl0k4hkCswpV/V+tHW0g5ZDlSFzJE3mSMq28WdA
         gDvAWHiOXRfHrE4R/Jg2KzqrIXQf3otMac7+DHrRqnh/XTgTuRBw7Mem8pK4FSsXllVM
         QuLXUYAXY/tiYpsRncZQZqR8O9lPXgmyovvd7pjbCPyvHz9EZ6Eq/HhJJQI54Olvj9Xt
         q5XCjL2pZFRRUSKLPrxJePJ/anoTCiGmBO4qbe92mtoW1oZAjTaR7prl9ZD2C53iAlZh
         /qFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333179; x=1781937979; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=YdrpfTnwN7GeI2ViUkIy2LccCzx7/lWKRfo3hIRsBpdLlaO9RBOKPXc2DIBzkYCiMO
         05h8PZ5HzGKc8x4O87OmipymBwaoG1+A+CkpQmoofiQJ0TU7pjmkyfS7BMLvis+BZ7cb
         IFNDpJAsNmtp5yzuOoAsq5pTD02Mc04T43B9VFM7s0mrJKW2Gunh2xcGPMx5x6+0I2N7
         DRzDiAhS6Q4kzcCD+s2S8nBwLyhZ94V9+mMnb4AYhDwhZkXW4RE5tPKiy+yRvsHlL60e
         0gG6nFqcbhh0wCOBKVOKcwOlUMIyqhdldmktgMlZ2GrDkJrw7shgkkICCzkOop5uhWAg
         vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333179; x=1781937979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=AdYM5e93MWI5yj3QnbcfiLIsz6pwJ+AbzIFN/HAHByat8kn+iBE3ZQiwPSfTc4WKZN
         dDZABqtXK3OPtuZXS4vWJ76nsiOBz2aJO5m07LLCXUG7KZS8SJMXuIHrVv+dpTEsPLNP
         o4gxyqpBLXFSVbfVHjuA824lx2gp579klUVTfhD8k3g9j9hqLD9q5aT7lAOmxhXNcCI2
         iBzT7Vb6R/xGQlX3ox1CVIaiL9uK9ZB0K4qzhFlVXi0Sp1Ay4BAshZJYrHZAPJD1vlO/
         6yN4iZCjS2I1rnPiVYZzurZ2vgF+2YmhgO/OKDrYWfz3XNtPhCByOc8fSOigo8eJ2QTY
         AmEg==
X-Forwarded-Encrypted: i=1; AFNElJ/k2DapTDFqEaNfeAi2rAxYuf07BTF9+FHHVSiFA5XoakMB/X3MyAuwaX+EbCwg9C5CtxeWVw4g8W8mjyhP2now@lists.infradead.org
X-Gm-Message-State: AOJu0YyKJkBk9eT8vJsDMY37GDE7YMEkFWNfIGfSM6ZcszAL6kClQbz6
	pGVLKoPsPrgyntCp5Ok5GvCdIr3pZYjM0c5FohriFluGj6qEG1eNza9Xm5+rtKObKWFNcq2MtMq
	j+4qoy+iJyPGfSAoTXbJFI8u5k4UNrM8=
X-Gm-Gg: Acq92OEJS/PnRiPNDbs8KRaJA7Fp0ITZJyThevz5l6Q9Lcjzg6SGXZ7UU5kT1JICwZx
	Db+q461X4LkwdoOjrLandmPFLsxR4zEPstx7yv7UwlvKenIOt/d9u+TxDISKofXyPI7Qd8la++W
	vv6SnVzKP466MtBEwNB7rTnr6ZPC7fLa6Wh+2nhXNqYM6Eec8q8nvDNS/ALvsXbWUh1IMr9b0+M
	VbL6LtzLyowBpi9UOGWouyxBtUuFz7vVTInpaXk9s4elPhDKnBnZs2t2tTVf6rz/vwatjEyDflC
	L0Yj5+H4GpcjQAwHge/O/nKk1TxQqrLEXXi3Qbw=
X-Received: by 2002:a05:6402:11d2:b0:691:956a:cf64 with SMTP id
 4fb4d7f45d1cf-693785f9535mr2788429a12.12.1781333178678; Fri, 12 Jun 2026
 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com>
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sat, 13 Jun 2026 08:46:07 +0200
X-Gm-Features: AVVi8CeFuX_UIHrrQxcpZMFblszx1DO_NPnUuKDdU-CWG2K7N00GECZfmMGjMUg
Message-ID: <CAORyz2Jv70NuKNJbaG6o9Evm+3LcCpq+6qmOp_3Q=vf2CFCQ8Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_234624_067579_0EFE5188 
X-CRM114-Status: GOOD (  36.71  )
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

Please ignore this patch set. As correctly described by sashiko-bot,
the binding with no regulator node would not be usable, even if it
passed dtbs_check. I need to complete work on that and then resubmit.
Sorry about the confusion.

Il giorno ven 12 giu 2026 alle ore 22:26 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
>
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
>
> These patches only enable three functions: keys, pinctrl and RTC.
> Regulators and speaker amp will follow later as I still need to further
> improve those two, but getting the main PMIC in will make the series
> easier to review.
>
> I added a handful of device tree improvements to fix some dtbs_check
> errors, added support for the pinctrl device and addressed the comments
> from last year's reviews.
>
> Please note that patch 0005 depends on patch 0004 as they both need the
> registers.h file, but they belong to different driver areas. I'm not sure
> if I'm supposed to squash them even if they belong to different driver
> areas of if it's fine like this. Any advice is welcome.
>
> The series has been tested on Xiaomi Mi Smart Clock X04G and on the
> Lenovo Smart Clock 2.
>
> Changes in v6:
> - Dropped the regulators driver for the moment
> - Explained the FCHR key name origin in the commit message
> - Introduced the MFD_CELL_* macro in the sub-devices definitions.
>   A separate, independent commit introduced MFD_CELL_* to all the
>   subdevices in the mt6397-core.c file for consistency
> - Replaced of_device_get_match_data with device_get_match_data
> - Removed the mfd_match_data enum in favor of the preexisting
>   chip_id enum
> - Adjusted the error message if the device is unsupported
>
> Changes in v5 [5]:
> - Double checked regulator driver with data sheet and Android sources.
>   The data sheet I have misses a lot of register descriptions, but
>   Android sources have been helpful to fill the gaps
> - Reintroduced the required attribute for the regulator compatible
>   in the bindings
> - Fixed the missing reference to the MT6392 schema
> - Fixed casts/unused vars reported by kernel test robot
> - Removed Reviewed-by tags from the regulator patches as they have been
>   modified in this version
>
> Changes in v4 [4]:
> - Dropped usage of the regulator compatible
> - Fixed commit messages text to properly reference the target subsystem
> - Added supply rails to the regulator
> - Reworked the regulator schema and PMIC dtsi. Now all supplies are
>   documented and the schema no longer includes voltage information
> - Removed redundant ldo- / buck- prefixes
> - Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
> - Modified the MFD driver to use a simple identifier in the of_match
>   data properties
>
> Changes in v3 [3]:
> - Added pinctrl device
> - Changed mt6397-rtc fallback to mt6323-rtc
> - Added schema for regulators
> - Fixed checkpatch issues
>
> Changes in v2 [2]:
> - Replaced explicit compatibles with fallbacks
>
> Initial version: [1]
>
> [1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
> [2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
> [3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
> [4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/
> [5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
>
> Fabien Parent (3):
>   dt-bindings: mfd: mt6397: Add MT6392 PMIC
>   dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
>   mfd: mt6397: Add support for MT6392 PMIC
>
> Luca Leonardo Scorcia (2):
>   mfd: mt6397: Use MFD_CELL_* to describe sub-devices
>   pinctrl: mediatek: mt6397: Add MediaTek MT6392
>
> Val Packett (2):
>   input: keyboard: mtk-pmic-keys: Add MT6392 support
>   arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
>
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6397.yaml         |   8 +
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  41 ++
>  drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
>  drivers/mfd/mt6397-core.c                     | 294 +++++------
>  drivers/mfd/mt6397-irq.c                      |   8 +
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
>  include/linux/mfd/mt6392/core.h               |  43 ++
>  include/linux/mfd/mt6392/registers.h          | 488 ++++++++++++++++++
>  include/linux/mfd/mt6397/core.h               |   1 +
>  11 files changed, 840 insertions(+), 162 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
>
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

