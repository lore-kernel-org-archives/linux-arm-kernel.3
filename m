Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A017D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=; b=YCs4ck3M5Fq4G0ywW4KRBrIC4D
	akohkKQWbcrpyaosYrW8vZGpkMNoyw1dDa7i7JyccO4Xwqn4wR635XgIGD6rkkt/PhCkTwil3hD5W
	7chXb0bYrnVkPGpAO2PvwoBf6tKGQngGEHGusGesbXKzqeMOFI/PsEA68cmlRLz1ivHYky9DZAyfp
	5FH394X5xGWZWQUgbeACjA/APFNOx3iGi1hSyUStRh1Pza/M5PtAPn3TLaIARoQuj26lyl3qaF96u
	LSfhIiTscxSG9zXmglYyUdwEW6bMbmELZuZQ5bh68xYuA2Nf0LKnVuAYLlZtDG8wrWIeSRIle/P33
	+3fOn8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkd-0000000H43c-0ejj;
	Sun, 18 Jan 2026 08:03:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNka-0000000H42J-1jXF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 08:03:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee974e230so27585065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723386; x=1769328186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=O+deWAp2Xo3TUiMrd1cy27gN72i/A+Z0ncIx/tGXEnAm6tQAnbCLYMoWy1XgZGD0eU
         iEsWYj2KUC3J1KxbE/3VzqJgfTQHzc6VlEoobN738EaJwrXeVjoo8Hkk7PbneHuXORVH
         SdP/sJBm0lk5PtMhZEnNud1EQvJbu6N1to/Evtots7bPRx44nxn08O/MjF1cdSGGwbi6
         eVHL+62HTyiMiVtcev7xoJJ+ZnoAv8EQ8WbxkGvdXiSaPerAPYzXziTZACORzvi1MEi+
         5ax3235U1rWMWDdUbDs3JhDTSNwQkUMKTDLOh4+a+4ZD/XFWwIHHCZpjjGYxKTBqIDA1
         4m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723386; x=1769328186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=N4MNsvE3MTgVGcPPxZqz5Znnpd2ZWIBs11PgwMBa++ZEK7syGAAF7YkImn9B2TLXW/
         oHPM/mWRDpD+g6aWOnCJ/U4RXvfRyuwEEDy7IEyvgpEKjFchBbIfFX/cJ252Um4S5ShO
         3EjFaH+Glq6UguEYNrAauR5yLIhljWqNQQboXI7s4YXwMMjADuv0MoMpEBvfCwzF8Adb
         CGLXz0HdFrHvuj1oQENGCgvo0RsEL7nnGO5WLTPvUQ09D00M68i/MwDqqMVuIMNgvrP7
         pK+AYrF4cxV58BRvwYsmbidVdry474S5cy7QD3hmWUEDOHTeNtTwON64X/QftA9B6Yzc
         Ctng==
X-Forwarded-Encrypted: i=1; AJvYcCXgWZLXTP0s9PDKCSq56nTFh2hdanUwNh9aj+kq1F+Mzu04kUOIW5ONzDNwtC4bir4Mn2uTBq1JDw01d8sBLvxn@lists.infradead.org
X-Gm-Message-State: AOJu0YzcRkadl62hwEGWJBLErHIrqGCgI9BQh5zbhXROR/MJnoD3GOrC
	kYp2Gr77CUhB1NUojtf7p/2gxJaLBFAJJsOjwFDFX2w1V7+SRs8oLOiu
X-Gm-Gg: AY/fxX63vjshr8FDy0eUjzRWW5wURYeZq6PBLUHoRz2LJkAEXgwApq9mN3xTVnZehUo
	bBuB9thksiqFYjZcO09MIyBlz90LUGXD39gO8anEHJnzBoczYFYxk/GklR3GnuSx5Ma8p/YRGxO
	CFkWspeqN7aihJR+RSgF32j22otxfO8TTWavdU6+L+f5dTYU574od0IkVvM5TybEEV73Fb+Rcil
	LamLY501Kt7qWgL5k/wgOWV4aOaCLxakGXHUr+H9M7j2dyQLqbMsUbmYuD3EvccWUlwg39F7CQx
	TkKnb2lXJF55OCMrAtrgyvvupM6S5fDJcsi3Zej5ZwmJ02mFv8HGO2rl/ZlgFxEgwNxoSPlF2fr
	2kkRuIMUvq7SYWs2N0qrHYqz+kkadF2bKDuB0cK4SGZ6ut3Au2fqQ9+Z2H1iaLgUTRBLgAspNaU
	oBHMeI020EG7LvhelbXMhoXB8fnm1PqQfZaHuVG3yZvbeSli+AsHIrtluBGpO42wRxHmdF11npM
	wP8ukM=
X-Received: by 2002:a05:600c:4e50:b0:47e:e946:3a59 with SMTP id 5b1f17b1804b1-4801e3503fbmr93270645e9.34.1768723386007;
        Sun, 18 Jan 2026 00:03:06 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm229099345e9.15.2026.01.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:00 +0100
Message-ID: <20260118080304.2646387-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_000308_510506_920C7B7C 
X-CRM114-Status: GOOD (  11.63  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings

for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:

  ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.20-rc1

This series updates various DT bindings for Tegra architecture,
primarily focusing on schema validation fixes and new feature
documentation for Tegra234 and Tegra264 SoCs. Key changes include
correcting realtek,rt5640 audio codec bindings (adding missing ports,
clocks, and jack-detect sources), converting Tegra20 NAND bindings to
YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
(introducing CMDQV and DBB clock support). Additionally, it resolves
legacy warnings for Tegra30/132 display and VI interfaces.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Add NVIDIA Tegra CMDQV support

Charan Pedumuru (1):
      dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

Jon Hunter (4):
      dt-bindings: tegra: pmc: Update aotag as an optional aperture
      ASoC: dt-bindings: realtek,rt5640: Document mclk
      ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      ASoC: dt-bindings: realtek,rt5640: Document port node

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document Tegra132 MIPI calibration device
      dt-bindings: display: tegra: document Tegra30 VI and VIP

Thierry Reding (1):
      dt-bindings: memory: tegra: Document DBB clock for Tegra264

sheetal (1):
      dt-bindings: dma: Update ADMA bindings for tegra264

 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |  11 ++-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |   1 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |  19 ++--
 .../bindings/display/tegra/nvidia,tegra20-vip.yaml |   9 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |  15 ++-
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  27 +++++-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |  42 +++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  13 +++
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 .../devicetree/bindings/sound/realtek,rt5640.yaml  |  13 +++
 MAINTAINERS                                        |   2 +-
 12 files changed, 238 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt

