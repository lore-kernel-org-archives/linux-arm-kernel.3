Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B290C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=; b=rK/mYmy5CCSAGyUtRnZQ32pFng
	7xzLLPYRoI3ujjzqEfitQc3CWGl0kh2A7Sj8Z12TA8iz7Ka3mbz5kzPWFccXvbv2NwsO3ZZ1XQJIQ
	n/pDeyQ5gMRy2zejFIgGD4HAcv9mqzxyjkykqLMKnV8eaMGli6t0/ZgcRxsviWGeG4dXcpsGMcp+A
	3XbGSpLpPxvjv1yPinFwMyD6nuzKfqCatl/UHY2dHIDodRwMKte+ai1EB5B5FE9wvUE7mzIb1Pi0S
	h4hPED8s9uy9iBFG/C5yfihIchXsctMMLCuXc0lrtv8t3hN2Cx0MjXMa+GbTzwf9hMIrp+gjsWmpu
	f6tF2q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepBK-00000006a5Y-0LuM;
	Thu, 24 Jul 2025 06:11:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uep1r-00000006ZbF-3nQc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:02:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso5869025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753336926; x=1753941726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=kCFsVfHBXYZ9ymj7eAlEn6Jkzi0z+luOMckQIpClvfrq8YRnHDejFm8cyEvKv/dyck
         WZCZCnhB6YhHoK8yx+ZjmeyYxFNO+8oo5RR17ZzB+xAMtqtEHknKYbtN5moaW6QEt+7X
         JTgcG78M9xmxyUkousMbCjl0smgg1InkVfcLGKJ/93QIdN6Zz3wB4HDfWuvf2fiH8mf3
         s0/Ni8SHuwUPSoTKpqZwtYmOPRYWJhnOeDPTYZTFn5ozjMKw8hU/3MNf+76g0w8iF80j
         vuRCQ5IX71gODFgsUxhY6k2OV3M4NlZ8SyK5n9Zr6XPGNyBzAWTmBM5S9YUK7cqE/AEI
         Komw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753336926; x=1753941726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=A2RVcLvGOCKZLnD2wLrgxBF1EGX0eXrVVqlLAD44POK2vu5QuSzd4Amc4X1QdAWTQT
         PlUfrpbuQg0Yqrg+xGXUqFRi3s/DJO/8kn2FCLgiNV9CYd6A3EX55V+IEGexV6EKXrH4
         Er0Ds9htu8gxl2RZSr8TX4aSmyTdszHd6PLVvLg2B8mDYDfdLUukIfHF6nXsmSVMK0FW
         dRtu7HFOZ/mWt7/k105nouZEX2onqTlML7ltBFb6uRfMk11nSp+VH5lA2sT01HSZhw1D
         q6MqlnsdPWnlHoAC206uAHamCRMk1m8rKYpjAQKxo7pdFIvVB5Dc6RKVQUFindvtdJs+
         Nc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7EgKwqTHaeC6RygEAzOfawNAg1ubh5XD8L+pBP9jc4tZ+KERFMOMllmw98i6thfeuYMfbkb5pGUFNLYM0Tf0P@lists.infradead.org
X-Gm-Message-State: AOJu0YywfrfoLVdbvO4mVTEbD2ODfTLBEAifOHG1y25nwSwLGfnfvXO0
	sFWnfGD6bKXmPGOnx3N2ghP7sV4CgvSx8KcIGxPuwDt1TocJVBE0g584
X-Gm-Gg: ASbGnctrFpDdav96OPAvlClHonXZyyyIu3ztLQTR0PWvQdul/T8sErYAJuMeVLduwbj
	U89uFDB1aOKH81bsrsTY0iuRU22oedpMsQwDJzbU1hmQcn3pdn30x00nqJb5pRmfNuRojo4MNLA
	5DjV1M+foKhXJFIC0L6eJ0KpWJOUo7Sa7g851MLlYuT4zLHZFQQeW/Srj/Pp5xw0u4Owsp7XvPW
	J/u7cQuBupEGB+DUmURkVyfGhsp6dZRZhlR+wk0qyTEh0nwIW4i6pvA7KzZh7KXuTmbKeZsLJ31
	0+scaRE19cBcJlDa2GhM5WRqsfsfjgBfmTFcqHp6N5VmDjaenKQZeV4mxTr4/9LNaBQfn9I2e6Y
	nh0GW7S8/dujjtM+sp4LCGXF4ikmuOAeXs6Y6L2OwrKHAfKm9jO3nYFipszdupL2bhiBQ4OJ5EH
	15MXy6kCa9Lom92Q==
X-Google-Smtp-Source: AGHT+IEk5vZ1UKWFwNAblqDfd6t+N0Mkjayt6bORHiyfg+et25uqHOWyD2FkHhqLkZP7Mco8q9JdgQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3b768f1e40cmr4157399f8f.36.1753336925465;
        Wed, 23 Jul 2025 23:02:05 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fcad0f1sm1046656f8f.41.2025.07.23.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 23:02:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Changes for v6.17-rc1
Date: Thu, 24 Jul 2025 08:02:02 +0200
Message-ID: <20250724060202.2942616-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>
References: <20250711220943.2389322-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_230207_947403_FF1F0314 
X-CRM114-Status: GOOD (  12.88  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v2

for you to fetch changes up to 5897c161dc59e8d5237917406ac4be2d88e942bf:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-24 07:53:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (13):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 ++++++++++++++++++
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 19 files changed, 1293 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

