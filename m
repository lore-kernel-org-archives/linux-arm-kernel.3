Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A1EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzC3BRogCFa6d++rf6QKoC3iEoj7rrXmy2jmqgWPJRo=; b=SOWP+Q//G+RZe4++hLI+GhoOAB
	TegDppIx7qWCjJyRHXw24A82UF79NFyoHDSRMlG25RWLNBcAyt+vPJvqTcwj3+ZsvKuWGSqF1wnkL
	lzYoGKULinEKaGTM7piwlOWTxo+LML9n7EOxSLd5NdZ4OPyhsmOz+RuFKqqA/JFc6AG03UkklEjQ4
	uJlW7U5hT0zAp+NvRYf0ZMc89E18i9GuzuwmP5QQXQqRHP9Lnz3/HED7Zb5UrU3tScxiG5R6WZcbA
	Cj1Dw29ge3jxiByVfDLjGm2tSbIlP9/YnSXcz+96qU2b3rk4URtyjE/HXQpYuff6bKBFWuuQp4jeg
	x9pBdtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6SK-0000000ETPu-3bOd;
	Fri, 14 Mar 2025 14:56:12 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Qd-0000000ET9i-2xRl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:54:29 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6feb229b716so21787017b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741964066; x=1742568866; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NzC3BRogCFa6d++rf6QKoC3iEoj7rrXmy2jmqgWPJRo=;
        b=aRLby0hYKidQtjNkv/eOEMv01k7MV8M+JZuSI6CKJ9C3UlcjALRMLXhV6QKa5ia7JB
         78yR57eDzWAX/h6jjot5R9rG/uIxKPCXjlLOqh+sngmJe2LItHR4h4tg2dHZVoXraMpy
         XuE0GExNUbIJ+oAPxyu9cI9i9ERTra/zLXCjbin6YUKjG8cP3ZRtvUmuY93FMJmNIRjB
         btUd+rRNTgV9c0UwKstc5ogCqveyY5kPU3bSpwDSsGxfYsCyZdrSb4xgPOWHeLj2To32
         1nIWSzLf3F/c/k1Vc7mhTrIeUjI0/Qxda5dDxGw4J1y5fgyJEi95DAo8wJXSYGN7VLQO
         AC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741964066; x=1742568866;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzC3BRogCFa6d++rf6QKoC3iEoj7rrXmy2jmqgWPJRo=;
        b=oLnZeyB7g9l+hEivQ18jRHl+lHnI82uX/v9OVodFKNicWeVVu0Fso7X79xucgJPQXN
         01XFn7dJ6BuM0fgdYKAD8+hBszG+uWoff0un6mo2e3G8kxLofvfzxLoiJXsUp7aNqC4k
         3dN920iJxLjiClcNLr1VPJesBL9/H4OyAazlIlfeN3rvoP47Mtnkyoc59Uq9PaCFZR50
         pXdYsv57CDaPSAOPLna7UoULfbsa0xPi5cFHPeQwgbEyb9wSF4xLuUZNiV0h8kaiUQSj
         KWcvlU/9SykiYCA1xIe1fMcQYnRzBTBFB/FLwoGRGBg2F9d/bpjNOQlRtcSoMyeywpT/
         DJ2A==
X-Gm-Message-State: AOJu0YwR9yBhPhXWQJQFUCtGh4qAjsgIyP4hlepzny//6rjgAD18+VfL
	QdqORrUAYambS/BIE+JuerFNqfiEz1Y2GDoop9peS/StsPpVH2cDtt7Dx7FJ1inqIJF0/vawbbc
	PJ4sO9zwL96YVO3wMc0j6FYvmwNnPg3jw1iCKLcYWYVu2EWHydXXz
X-Gm-Gg: ASbGnctmvgPHAXnsj+mcGxVYGSp6eEoIdSZPa83ryD/J9eUBnbcB5rW0aRT5SSvKj5U
	De3icr7nxcYsoT+5v6/Ebd85iz7w+qHahcjOEJ2tYzYGSJ8uOZJpfcyvLLJhbWicLhOeRMp+Ypa
	zbPbMd7wShlhs/aNBmF0cEGqsWXM1la/loqnBP8w==
X-Google-Smtp-Source: AGHT+IFNMdPX2/JuPihrkOHkg6AZwt4eczqKvsFLvbiLk/cBs+yPz0peI9CqZy5qQMB+pmiHaSH/3ljKk7zMLLi7pf0=
X-Received: by 2002:a05:690c:4b04:b0:6f5:2793:2897 with SMTP id
 00721157ae682-6ff460cec41mr35571277b3.30.1741964066419; Fri, 14 Mar 2025
 07:54:26 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 15:54:16 +0100
X-Gm-Features: AQ5f1JqEpqzo5ehgw93FAfaSlHfkImMnJOCozT5iFOXGjzmpO2JpeBhsM498DmQ
Message-ID: <CAHTX3d+DZo3thrakBf=QCq91QFeChoizuhVa6oBBj9E+sdEXAQ@mail.gmail.com>
Subject: [GIT PULL] ARM: zynq: dts: changes for 6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_075427_745447_DFE15BAD 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Hi,

please pull these patches to your tree. The most of them are just
aligning current descriptions with DT schema while also adding some
description used in U-Boot which also went to DT schema (like u-boot
node and QSPIs).

Thanks,
Michal


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-6.15

for you to fetch changes up to 6fd90200aae269daa2f0e86be7bf50246837f9f4:

  ARM: zynq: Do not define address/size-cells for nand-controller
(2025-02-04 09:32:09 +0100)

----------------------------------------------------------------
arm64: Zynq DT changes for 6.15

- Align platforms with dt-schema
- Describe QSPI

----------------------------------------------------------------
Michal Simek (13):
      ARM: zynq: Remove deprecated device_type property
      ARM: zynq: DT: List OCM memory for all platforms
      ARM: zynq: Mark boot-phase-specific device nodes
      ARM: zynq: Wire smcc with nand/nor memories on zc770 platform
      ARM: zynq: Define u-boot bootscrip addr via DT
      ARM: zynq: Point via nvmem0 alias to eeprom on zc702/zc706
      ARM: zynq: Define rtc alias on zc702/zc706
      ARM: zynq: Rename i2c?-gpio to i2c?-gpio-grp
      ARM: zynq: Fix fpga region DT nodes name
      ARM: zynq: Enable QSPIs on platforms
      ARM: zynq: Add sdhci to alias node
      ARM: zynq: Remove ethernet0 alias from Microzed
      ARM: zynq: Do not define address/size-cells for nand-controller

Sai Krishna Potthuri (1):
      ARM: zynq: Replace 'io-standard' with 'power-source' property

 arch/arm/boot/dts/xilinx/zynq-7000.dtsi         | 33 +++++++-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts         | 41 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts      |  2 +
 arch/arm/boot/dts/xilinx/zynq-microzed.dts      | 10 ++-
 arch/arm/boot/dts/xilinx/zynq-parallella.dts    |  1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts         | 85 +++++++++++++-------
 arch/arm/boot/dts/xilinx/zynq-zc706.dts         | 67 ++++++++++++---
 arch/arm/boot/dts/xilinx/zynq-zc770-xm010.dts   | 39 ++++++++-
 arch/arm/boot/dts/xilinx/zynq-zc770-xm011.dts   | 31 +++++++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm012.dts   | 35 ++++++++
 arch/arm/boot/dts/xilinx/zynq-zc770-xm013.dts   | 41 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-zed.dts           | 43 +++++++++-
 arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi |  8 ++
 arch/arm/boot/dts/xilinx/zynq-zybo-z7.dts       | 10 ++-
 arch/arm/boot/dts/xilinx/zynq-zybo.dts          |  9 ++-
 15 files changed, 404 insertions(+), 51 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

