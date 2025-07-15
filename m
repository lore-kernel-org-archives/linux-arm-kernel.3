Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF1C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdR+LRqRBkJBUvCkbRrJJULDxmBDkmzUM6UrN84Yku0=; b=KO+tVSB5nVJbQ5cnYprFtziJiS
	PwXLxyXOU9vhhtJ3LUkSkZNlAXCv/q8XZ04k6aSJJvsnq0JOBckGTrLucWE6S1Ghivqo0ZoMLPcdB
	J9lS/WeWwxiTSN4yFaPgRyx4Xn+q4MgLk7EuUsXt00+zFWTw0w6up5RMyrM2PrIqxHN38fn60vHcu
	s1tJ1LdjcB3sQkRVDJHz8aZ6W+2IdSMOGvm2+9gixE5bMa/lcYuC/Uq5YznO/3VVO5nj+c7eDb6n2
	tGTYOBv2sQtodnz8jN6Wzc0a6gjDSQiGSrFepLM9Z64T8SKUohO6motrQwMc8qWY3Q6reFXZRKyzJ
	67d7g7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6o-00000005xpb-2Ec1;
	Tue, 15 Jul 2025 19:14:34 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgLe-00000005Jp9-1trW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:09:35 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e8bbeee8450so206425276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752588573; x=1753193373; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rdR+LRqRBkJBUvCkbRrJJULDxmBDkmzUM6UrN84Yku0=;
        b=Yb/gME9ES+QGZ7DSuEMGzP4OD25r6j3oUtur6irFjhOwqTFhUwe9yhCsaPPQk3VAXf
         YBZW2t1MbstMFFYBQ7p75QFT43UWVdoqNTEeMWJQkWz/1I9gPdCg96xRkS3A7IOKbyh5
         7a7ZNwTxLoCmU5cQCdMoHETBmyMzauyikpJhx4WXP5orgp/pn45M/Xp8p3wL/dQ+5URc
         LsdLXk1BGZU2t485bGxxa/SaDr6ygrzBC8VdP/Z3jrrqTmPIiWQHPM60L4Mk6ljbyWTi
         NuymoEv35NXA2W6oVNpiC+TdoRfKRJtCw92LXBPgC1grq9iBQ3UAY+VktmrYAR+fwDox
         ojIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588573; x=1753193373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdR+LRqRBkJBUvCkbRrJJULDxmBDkmzUM6UrN84Yku0=;
        b=bChZgkhMtPlkjZ4VFnThYC+6G1Sh8jr3Zl/h6iMweVRt7LPcovP7ic2HnK+TD1OXF0
         o2IGSOuaO+yxLqwrcApx89RnbV6PXQvpnsc5QZFD/VO3eQ0bGC9pW+/nS1A4kj3ihhuD
         0UT7+TysKgwweIY9kXEsWZOGddVUpOfVCuS8Uzv6KJd73E9n/ALunR6HJG1bl9YcjRQV
         kL77hJ5bkLVKIEQg4yLgsUv5aNQ0NJeiVcXl1c+85Z0PiRnnXck4da4FUZAmlAiuSeft
         kTgO+I94t9+2BluEheqHo19YCKDQ5WWNqsm7sjvyWyn3DuOcyGDMCHFkhmSixbRsZbvX
         +Njw==
X-Forwarded-Encrypted: i=1; AJvYcCVkYvsdUdA66yjw2KTKzF5gP/cTFggAH/qdP6ZzRXorZmnB2sOI3Mf5nk3Q1m9lwQ2rbgQUZra53s4Fhp+ONJOs@lists.infradead.org
X-Gm-Message-State: AOJu0YwI3ZxeuWa5+I3c6zPxoU3YpWgyggFAS5BlO7Ikc7TcyqUynXxT
	ujfBMeQDya6C39YGOFYSgvsZ/nLaIdc8uAWpcaxdqP7Zi3ZaE9ICVKTIpqX3cvcENrVT3lJGwfl
	A4jWVK58Gb1n8RViHC72ykBrZWW7G/3pPagIA++TeUg==
X-Gm-Gg: ASbGncs9AK0pDL0lxWUIGeeRfWWSFHUcsU773bwVOnb6lHi83WOa6OLQRHLd9WieZ0D
	6/gz5BQrxebdzFqAeuf9RlG9P546L+yHPl+QUo0QoHYWaHv97ouiK5jgZAX3id8NR6Cp73xPNYk
	8EkkwiqdOdLD+Mg54wBJgBuANXVA+GPJg8sxctHf+u+Gq9xIKD5rHrRLq5vmzt0pmBYvI0Ftcra
	fEP+P2e
X-Google-Smtp-Source: AGHT+IFr5aZe129SXty/aUauZ98iCrC5028PDfP3/dwd83DOGHiwFr2/EEOsdifr9IoyiESxKl68x3MmFGTyJODgVvM=
X-Received: by 2002:a05:690c:b82:b0:712:c295:d010 with SMTP id
 00721157ae682-717d5e2848bmr255785147b3.33.1752588573210; Tue, 15 Jul 2025
 07:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250712074021.805953-1-wens@kernel.org>
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 16:08:57 +0200
X-Gm-Features: Ac12FXzjyKVG9YpXDr4ujfp7DHXXwLEZE6WjntfBOMpvZOZeuC_qP0opUlbqcZM
Message-ID: <CAPDyKFoSe3sch1ooP7e-TOiB91y=_Q=-FaSooc2ROoMwfEsP+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] allwinner: a523: Add power controllers
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_070934_493661_E51E1022 
X-CRM114-Status: GOOD (  29.39  )
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

On Sat, 12 Jul 2025 at 09:40, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi folks,
>
> This is v3 of my A523 power controllers series.
>
> Changes since v2:
> - pck600 driver:
>   - Fixed whitespace issue
>   - Added explanation about possible PCK-600 lineage and document
>     references to driver
>   - Changed Kconfig option to tristate
>   - Rewrote Kconfig option help text to make it clear that the driver
>     is required for certain peripherals to work
>   - Made it depend on ARCH_SUNXI or COMPILE_TEST
>   - Made it enabled by default for ARCH_SUNXI
>   - Renamed PPU_PWSR_PWR_STATUS to PPU_PWR_STATUS, and added a comment
>     to note the macro is shared between two registers
> - New patch changing sun20i-ppu driver to tristate, and enable by
>   default for ARCH_SUNXI
> - Fixed pck-600 header path in dtsi file
> - Link to v2:
>   https://lore.kernel.org/all/20250709155343.3765227-1-wens@kernel.org/
>
> Changes since v1:
> - Re-order compatible string entries
> - Fix name of header file to match compatible string
> - Link to v1:
>   https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/
>
> This series adds the power controllers found in the Allwinner A523
> family of SoCs. There are two power controllers. One is the same type
> as those found in the D1 SoC, just with a different number of valid
> power domains. The second is (I assume) a unit based on ARM's PCK-600
> power controller. Some of the registers and values match up, but there
> are extra registers for delay controls in the PCK-600's reserved
> register range.
>
> Patch 1 adds new compatible string entries for both of these
> controllers.
>
> Patch 2 adds support for the A523 PPU to the existing D1 PPU driver.
>
> Patch 3 adds a new driver of the PCK-600 unit in the A523 SoC.
>
> Patch 4 aligns Kconfig dependencies and default for SUN20I_PPU with the
> new PCK-600 driver.
>
> Patch 5 adds device nodes for both of these controllers.
>
>
> Please have a look. The power controllers are critical for enabling more
> peripherals, such as display output, camera input, video codecs, the NPU,
> and a second DWMAC-compatible ethernet interface.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (5):
>   dt-bindings: power: Add A523 PPU and PCK600 power controllers
>   pmdomain: sunxi: sun20i-ppu: add A523 support
>   pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power
>     controller
>   pmdomain: sunxi: sun20i-ppu: change to tristate and enable for
>     ARCH_SUNXI
>   arm64: dts: allwinner: a523: Add power controller device nodes
>
>  .../power/allwinner,sun20i-d1-ppu.yaml        |   4 +-
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
>  drivers/pmdomain/sunxi/Kconfig                |  19 +-
>  drivers/pmdomain/sunxi/Makefile               |   1 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
>  drivers/pmdomain/sunxi/sun55i-pck600.c        | 234 ++++++++++++++++++
>  .../power/allwinner,sun55i-a523-pck-600.h     |  15 ++
>  .../power/allwinner,sun55i-a523-ppu.h         |  12 +
>  8 files changed, 316 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
>
> --
> 2.39.5
>

Patch 1->4 applied for next (the dt patch is also available on the
immutable dt branch), thanks!

Kind regards
Uffe

