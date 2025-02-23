Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE077C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eXqHi+96U8DE66IBSv5ozW+UKbtywue+9B2TMWS46o8=; b=lbhyIxsm3iR6SthWq+CYHXkhKj
	JQtKT7NCVThgn/sm7z180UyZUQWbnZ/fe3T119DU7lz1nt1CN8iRv9W5CWIaJL1qX4Q/O62ZWyQzS
	8cbxr09fCnd8R1kEyPRiiHU8JcvgiLX7jYFbNEqIxFYEzXUwjo7S6mlv1PlgxYONagpxqnW5Ukj1L
	KwVp98sGBo1Bmkog/tYING7+08CVaN9OGPzR6uUge+/Iop3x4Nghz32fR8LlcZ7F5F293FcffdPUO
	yvVdIAit/vIsE50QdBMedndDd8IExRamR2DLOGGB1i/fZzo6j6hL1vq4Jgu9EW41LZLjrrhIeWg1V
	ubYOpdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBG8-0000000B7B2-3r7V;
	Sun, 23 Feb 2025 12:39:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB8C-0000000B68T-3I94
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:30:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so32813935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313847; x=1740918647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXqHi+96U8DE66IBSv5ozW+UKbtywue+9B2TMWS46o8=;
        b=mfyS3yvTzIX3jV2DzgNr+N5uSllC3DHB1xLe/c5ihtjICe2z/4cvIsyg+5E92s9AYW
         KCFMjNUZrLzQnui2N2C8aD+CVRWbFokpSUaunKE/qF0tGTr7uuaPEFv+vUT/1BMMEX/s
         E/3aUTcodNhfIzC+Qg2JgvaP/qCVJGjD0lbO+Cl8YvOq/PVRPs4AWK0k7DpoKDNqZqFN
         sRzNLXl7FiprBF0UkAZw3n+256zrtZk7jGsIPjmDGHZhrq8CAE/7+Z/F37Gm4+mMNZQi
         AntaEjgqBg9UoJjymDtKeEqe5TjvE5Qc5BRNuVoz5UArhBRxG9S7paQCUs3D8BURqKIe
         AikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313847; x=1740918647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXqHi+96U8DE66IBSv5ozW+UKbtywue+9B2TMWS46o8=;
        b=av8NuImFx4PIZfmB+LScd9/73rXXCmSi7EpkmRMrVKUlj6tjRWtxl1nhzzzZ9imKq8
         xqHd3d4TkUSHDiyEOXmySmNuLymdciTqn72Fsic3fgJFvHZS5rv+DJg08Jv+M7LlBWb7
         Tm8c50kTkK6YvHsPsx5VdqQzUXIyWWc2CaNKHmFt8EPnvI0z9w65Gqd4UgXsX1lq8Aoy
         GQFQDuqdJPk7SkPS8RY7AQkh85HsAe18JoKPcS4mT5R0NArnfvxYSLHXU6Y+NnmE4Wnv
         eUT40Sh65gBKTM/Bc2yKD7r76U+gHYfcbvoeMtN37L/jdEXf/gg7zugaRWkg0g9qItu3
         rccA==
X-Forwarded-Encrypted: i=1; AJvYcCVmLwlPPPBJu47XileZsgbSd9jSu//EOPYdqrwOJe+8KnbScmAIDODf+Q6TIojcpED2egYmv2HHTE3sNN+vbkV0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy474QrUvzy7rn4zpRLuMo3xlYC6+fp2/BGimHHRufAh8WN/Ri
	bAKGzSOTT+rMnd8Ti1WlT40vBXu81TRHpfFLts43fcvopxZ2+TDJ
X-Gm-Gg: ASbGncvM9fBIOPxBb2eOlgUx2nka68ppJC3h4Vkypybow8YwPYpceEE4z8Wi+yiDSp8
	28mPMRGE27h+YCQm0ddYnQSC9GUplWVG0YPGvHUjChxKOT94Tc1FoZ6x3VvTZJiaNJL9PdwkDhs
	Uwty8p7qg3r7LzjCk9fNTgcnjo1FH9VOOIC1uKSVbc/xdjZ0EGnX01rTsu8z95xDj/CDLwCmuV3
	miCj50q/Jscx+Zs+cte/W0RGuIBQSskcK+SpzDIIUtzhRXL8K+y23hcZUh/ARiG7mXp2eYyYleV
	36hJTAX7ipPaQLLCGfrRyfdcg2/uXdxNdDT5g5euQk9bplFKPxGn8W0QhE7tBwrGNBSOkH+JUtp
	99Q==
X-Google-Smtp-Source: AGHT+IHG4/4YB1K+lr5+3mLAj1UHPyPnxgbTM9pHrmIXg39uKwLK46eTLD1PeNVsgfYMaSy2k340EA==
X-Received: by 2002:a05:600c:4f88:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-439ae1e6a2fmr90254375e9.12.1740313846813;
        Sun, 23 Feb 2025 04:30:46 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:46 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun, 23 Feb 2025 14:30:40 +0200
Message-ID: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_043048_824270_EA71CCE0 
X-CRM114-Status: GOOD (  17.91  )
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

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

I expect [1], [2], [3], [4], [5], [6] to be merged before this patchset
because it relies on the aforementioned series for drivers and device
tree bindings.

[1] https://lore.kernel.org/all/20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com/
[4] https://lore.kernel.org/all/20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com/
[5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
[6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/

Best regards,
Ivaylo

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   12 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  175 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
 6 files changed, 2519 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0


