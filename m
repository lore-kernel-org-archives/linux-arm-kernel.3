Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2574DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=; b=unFGws1V16ViYmpoDn/f1VNp7N
	blq+sM0I18y0Ora031DR5Un1E8SRVt1pV4XqPxOC4BcM51qKg6mrwUDGoyqkBUuUqKFZorRbKwqKp
	dbbalsBF1/Ib1Kg/NEvvRqSKwVRlIyZp4GQ/noVswf03J55eauOsVrL9cgdqiX6A38WZ7U0RGZt/C
	ysHnhCx2WBB1YpIcREcRdtzDLtfGFIRKfYXcfdK9TdaVa1YneDYPDRN6N30x2Wnye1EVdTAuw2s+a
	XFOD/AdMJ+cxFKFb7mVFkS4yStlBw+s07dD2wWQh6iMTso5Uo1erryGgzJ+FcStJ1NjtB2FP43kg1
	vuDWZX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhrC-00000003tMh-1si0;
	Wed, 05 Feb 2025 16:02:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhor-00000003soW-0gPa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=; b=cg4X2/L06yj0zBades0JqgDuCL
	Cw1bL0M8bDHH8hBTwCaOOFGZvBe8359fp0qH3rugcbR2NGIbPkE0xU1h22d5DV6XHxLO1nUnGbA37
	VOM1vvBANCpiKEhAA7zjDkyEYU3o63c8rGZma9eNAOy+P96dWaGkrLkn3Hv1t/0WAW51sEAVJKEOY
	V7j9A9R2cf/Os3EmEVcaOvWXHJ4uech+5RK7Hop65KQfBvIJNxEnZEj2aD9Ji9lTZq5wQVGVYHUYh
	U8ke4ancvhE65aIoHy6xM7pcnSIM9UvSEAt/7dpBP44RZrwloslIH4G5TBEWVg6lbQNEPISdjqYp2
	+LAwM+2Q==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhon-0000000GgJS-37ey
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21628b3fe7dso129623005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771199; x=1739375999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=WuZpBpwTEE+v0f1XcpXMnqtAlPjjryP6cjtZuO5L6YfUzBgOcBvDGGFyObxQjay4AZ
         tAdXAmoYIMfIBZbUal5rnJLhhQInwstpSHws3maw4nOi0pGJzlZNXWVkjsKNw2Uhj1N6
         gRLd1g1+NG/NGyu8EenA4/PQifNfL4jZQyIdOrkgLyxZaOvRTysJI16pgzsBqaDp/WKs
         SAzV7TuOxcl9NYMVdbO4IGmr3e3ZDRLoDDOi0w34lRsuAlL71dEDo+k3qd9NXE9TINIv
         mVj/7xeQx3IlF1VtesbBkTnQ7F7f5F83i0SDsk0xvZQpo1GXRFOlcrc7JP/AeGxo2rQ+
         nHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771199; x=1739375999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp+BM2YYmo27ZSOn3/PF/LUKik/iqtqeYKVoRcFyVog=;
        b=hhwBw1EPpfJgBYnJd8P2+jnMOaqkSamlVV6d8d/QRM7ebWw2K3t9Q4ANKp45WwS487
         BU+7DS7eJG0S2Gz9kehVRF7pVyAwg61eocuqoidl2VntuA1KdjYlLtMQcyHe3BQQLmz0
         iCNhPY46aSj2XN9uAyW4boxYN1m3fYqmchSrWJmytYIY1vOSivOpIXTCix+5XWVOx1D4
         +BoYTHILX5aLcF6HeucY88SVpTZvruIIJ/3Re/CJ3aiyhwkXo7UeBeyWOo2IVVV8gNRq
         YzKH0UJeWEFnddXY1NQ//vzJuaeSdCmiEV3ks4x0HWLVpouVCcKdYlj0mwKajNDnQw8G
         wqNg==
X-Forwarded-Encrypted: i=1; AJvYcCV5vAVWSLLBZGgxmQJOiY6++U+8scaiGBl0rF1aI+l3aUpaJDAaBYUXxZ08kg1RVZbvC6LUZUOO/SVHYQFJB2M0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8tppomrBCm7CwVWbr6ZcO3LSyinCPdKZn0IXKKildqRiK4Ep+
	XafY72h4j7mUbhlTZTTcKyEBlKpZhOJ326dEufzEVyoLvcp6Ou03ysIlk+GZ9aQ=
X-Gm-Gg: ASbGncsy+eNHZbo11K+U8rvSCG95q5xLJPrpl/d7/3ccuzjMKsnN7GhWruWkODvmkj1
	h73lRHsRPt9W7mOnZDXswX+zGXN93aa4ryF/f+U5N7JseUzxLhpgtH/epFrr2Q68Dqj3EtQs4fn
	0zHwZ94uHiZ9/Pe7GhUOjvwyrG7+ZDtpPuFyYWBgBQvziMtsVbF13VF6nCf16qDxjhZB8GMwRov
	pq7UAxnuE0GkYsB8Gm8ibBbU23R/FvZ5CUEbKzIkea5nhjWnRId3hfldbomzzTfvFoO/2IKsrW1
	DGN749Qv9reLmCvBmL1bw3GKJ0aW5xEHRkZjnxoWPwma9U3ZB3V5t2Q=
X-Google-Smtp-Source: AGHT+IG/1yS9kPdzHzlz6pxYz4TJGEpsfp15GF1V712EzlJPFVPcBMbHsLPYkxwfxuOCVyO08gz4DA==
X-Received: by 2002:a17:903:41cf:b0:21f:dd1:8355 with SMTP id d9443c01a7336-21f17e4cabfmr58273655ad.15.1738771198793;
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:59:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 00/11] RISC-V IMSIC driver improvements
Date: Wed,  5 Feb 2025 21:29:36 +0530
Message-ID: <20250205155948.81385-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160001_901605_2B83FFEE 
X-CRM114-Status: GOOD (  12.80  )
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

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Dropped PATCH1 of v3 series and updated last patch of this series
   to handle the intermediate state for non-atomic MSI update.
 - Added new PATCH6 in this series to remove stale kconfig option
   GENERIC_PENDING_IRQ_CHIPFLAGS.

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (8):
  genirq: Introduce common irq_force_complete_move() implementation
  genirq: Introduce irq_can_move_in_process_context()
  genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
  RISC-V: Select GENERIC_PENDING_IRQ
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Special handling for non-atomic device MSI update

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   1 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 197 ++++++++++-----------
 drivers/irqchip/irq-riscv-imsic-state.c    | 152 ++++++++++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   7 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/Kconfig                         |   4 -
 kernel/irq/migration.c                     |  20 +++
 16 files changed, 280 insertions(+), 162 deletions(-)

-- 
2.43.0


