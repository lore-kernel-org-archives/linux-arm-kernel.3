Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA3D74965
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s0wq56S49D0XiqE0opAn2H72dXHptd985ZPMxAa7P8A=; b=wfbrBUXZjVIflFsajaD4AUFH3c
	b37QqWaJ9nqM9H9+PVDUuTPBHPe4z09EZUFvMZ8zBFygA/fqCA/6zybc0TmKuH2AFNhiuUuzVpjoj
	LxXIuTgB8kGzezFUdyYXXtjC5J0ZmsaxBQyz4cvfhbLE0sMDHNRCNS/JI5RUWotqZoZ+m0t8h3iht
	EJtKFPMXM1mTsPooO3DQ3ltC0gzAHuMT7QRQVmUObW2nSULg2KmzJkxsZm6q1qmvLvszYlzIQNqMC
	pv/zPQDz/zamOI8ot3oU6meVngFp+9Z8P/uYjY2HgvRRfeo4tdCby8DgoqRbsUck78oajYdHPIZWp
	Wu3IAoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbO-00000009v68-34vS;
	Fri, 19 Dec 2025 09:16:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbL-00000009v51-0fIj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:16:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0bb2f093aso15971435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766135802; x=1766740602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0wq56S49D0XiqE0opAn2H72dXHptd985ZPMxAa7P8A=;
        b=eS0aBLyEBlpmNZ+elBli9Heue/72w+hr7k2kF7Xs/kK+trQWWf4LHsbpuaJFC/yCwB
         x1peJ3yCS0w2BVFvWcrINjAvdl1blklcl9A2l0rLAztCEebaimgcOS6QD/bbiLwfvSFW
         hi9mAHgTnfaCW/cWH1POVIhOSA7ruPMjaM1yj3QO/tT3nNM7IZs0Az45dXukDhEBSqdo
         T2gqC8QE7FF3DHMIGpBN+lypBvx4GGMPZI5iZgzJ4bUVWhX4II8C6htFngKu64x65VIc
         r+5X+l5ShhuVy5G+UNj74df5HU7HJKTUDaDgOQao3hnChbf2bRTEM3/vnBz5m8ayFKqG
         PzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135802; x=1766740602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0wq56S49D0XiqE0opAn2H72dXHptd985ZPMxAa7P8A=;
        b=gNyb+JZtnU/EZKJzelnK0hPtHiM1E1CBSl3SA3hzHh4RrdYx51ZthA8HKLVDm2yqLR
         ZgzNnxzBLRF/KT1FFJX5Si4dxg8ZGb9RnDS9hrEjy2e0EZDaqvwrzdannfqSQSQOwoBb
         ueMnadc5GLt1peHcLqkX9SwSG7mpk5vumissCMj43wG37PfwE2ho1Htn+sxC0ydsybeN
         f25Yn41E4r99+NmmCkEcEmFk/q5SIXWpBInE/yZVIuYIc9Zq8g586hIcAuSEzzZRxclM
         xDZ0HM/Z2kHDhrz+F2RGUqGJg0pCsZ4aRwql5oLY0OXM/Rq0sR4yPiL2UjlAdA1bna74
         iDSg==
X-Forwarded-Encrypted: i=1; AJvYcCUf62zmRzg7LcqfYOXa8wGbAE/EnJNFxpWYJ7UdX/SeCyBzE8Belp5Oc67RbMIjPbyvWR5nj3Dd7Ns01NCADnNW@lists.infradead.org
X-Gm-Message-State: AOJu0YxqaRMtApGwpBsM/B7ktEbjAn7X40ii3p2UxV+4n86AvYQIRvky
	82CocVDT7RFAiFG/EYHVSfCaOYgMNQrH7ZiJfWOmT3J/RLE5bTPoz1pg
X-Gm-Gg: AY/fxX4SKkMobdGrfnZm1UiJr3KSbJJbBfG0udbyX1+pV/QGuIsuSH5gDMXz4+XAN22
	uurVFolpW6CYie0aFx9ThC946tnx56QczJ+gCi3oO1yfqKl9Xd0HbiP7C1WZx2ySMU0iGJ1CsFb
	IRvTlnOW6dM/sLrZYpCkqxa7yR2t+hbZkBdgXMcHPOZ/duUZB1s+PirlQD8p+OIjVvl9Hlm4NNj
	a/lW+kvL+TzznL+djxa4IaGrcT886/Ef3hNdeQnPllcqSoS59pRwfPKbgaOuumBieUveLf1p/GM
	hlr3fOJB0VNHzKISPmay/sBpByXGFrgBZaSQVZBqzumhrrEgfZeqjs482/ZXOPFsTb1tLWWEk00
	JugrjGezJe5L1ummsfGjtHiADNnYHBWuYM8E5brHY1gmyye8h5YGpUvOoCZ9xsp4wOSGqBVGlPF
	Z8qg==
X-Google-Smtp-Source: AGHT+IExGez/SwIBFURSmY3cs4pQ+FOVzxgn0uQq48pg35PAUqNFrGyru+1LszkjcLfX0eBztZo4og==
X-Received: by 2002:a17:903:4b30:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a2f28375dfmr22211505ad.40.1766135801575;
        Fri, 19 Dec 2025 01:16:41 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm16831515ad.59.2025.12.19.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:16:40 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com,
	colin.huang2@amd.com,
	Peter Shen <sjg168@gmail.com>
Subject: [PATCH v9 0/2] ARM: dts: aspeed: Add Facebook Anacapa platform
Date: Fri, 19 Dec 2025 17:16:30 +0800
Message-Id: <20251219091632.1598603-1-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_011643_198113_87C75BF3 
X-CRM114-Status: GOOD (  10.30  )
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

The Meta Anacapa BMC is the DC-SCM (Data Center Secure Control
Module) controller for the Meta OCP Open Rack Wide (ORW) compute tray.
This platform is a key component of the AMD Helios AI rack reference
design system, designed for next-generation AI workloads.

The BMC utilizes the Aspeed AST2600 SoC to manage the compute tray, which
contains up to 4 AMD Instinct MI450 Series GPUs (connected via a Broadcom
OCP NIC) and host CPUs. Its primary role is to provide essential system
control, power sequencing, and telemetry reporting for the compute complex
via the OpenBMC software stack.

For more detail on the AMD Helios reference design:
https://www.amd.com/en/blogs/2025/amd-helios-ai-rack-built-on-metas-2025-ocp-design.html

Changes in v9:
  - Describe platform and hardware architecture (Andrew Jeffery).
  - Remove "Device Tree" from patch subjects (Andrew Jeffery).
  - Reconfigured aliases to be sequential (Andrew Jeffery).
  - Alphabetized all DTS label references (Andrew Jeffery).

Changes in v8:
  - Dropped unused 'pcc_memory' reserved memory (Andrew Jeffery).
  - Grouped 'spi-gpio' properties together (Andrew Jeffery).
  - Moved 'pinctrl_ncsi3_default' to aspeed-g6.dtsi (Andrew Jeffery).
  - Revised 'gpio-line-names' to match schematics (Andrew Jeffery).
  - Improved 'sgpio-line-names' formatting.
  - Removed unused 'led-2' definition.
  - Added ADC128D818 sensor support.

Peter Shen (2):
  dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
  ARM: dts: aspeed: Add Facebook Anacapa platform

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-anacapa.dts    | 1045 +++++++++++++++++
 3 files changed, 1047 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts

-- 
2.34.1

