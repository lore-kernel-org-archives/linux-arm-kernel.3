Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351DDCD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpNHefKtZBMcFXf5tGwuXkoAaa88dbJ1eJ42SBDaonY=; b=ldPlyr6tMA8Qr3mJkgeF8eYCqm
	cBkHXK3EGeAWoD1PMewdVm5DUQ4lQW1MBCB0Xj7x9WcdxLfwZmVaS2mM9F3DOQ2p2tYXjZx9XctlG
	qORVGsPhxK5OJZKdPbj2HVdqIIq4wx0jH4obDF30tFXdsUPk6zqL3wMyOkyqt77p4rIS5nXS9slek
	MgQexPvWOJoL/q7ZI5MjIJxxO9HxbaAyqnZlX7dUxfjTjznue5DLlfnLvBzDIYJnlQpiFvxkxcW8h
	MJGc+Cwhe9p2XFejln4ImhUSV2cCjIeLepO+s7puywW/KwJ/qTg2OI7Jxi3RR+2OgpcEItOhvQE+M
	Wh4eft1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VK-0000000Gpip-31VG;
	Thu, 04 Jun 2026 13:53:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VH-0000000Gpgy-4BhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490af320e2aso9195205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581177; x=1781185977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpNHefKtZBMcFXf5tGwuXkoAaa88dbJ1eJ42SBDaonY=;
        b=iX3OQj6RRqVjJZEdT7jZjDlTMQR8oBh9FhnxVFaBkNqTM/2aqpQwtrlMOgS0ii/VXb
         JuuNy4pVXEkLcOFnT5ZjJ1koSAh2FERkeaUpoM2wcVU/miIrzapZKNznToruTBQPs/yM
         b7DCi+Of1JLE81Y6Ec0lzoAVKUuNLEWx0JLmKaSzswbjAnYcRGMS++42+YcFSF2E/5w2
         deMHxcE9g2Er5zWVRHE/L6GNT7L1l/S5IT2zQNQcu5oUQctnWVat9Nf8XELejwcFh4fr
         OgU6w5iqhJC5oMdHs7vXvrP84Hw/qWmbPSK4w+NGelFM/rCcTnOyU15UUAMnnl493zoY
         YyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581177; x=1781185977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpNHefKtZBMcFXf5tGwuXkoAaa88dbJ1eJ42SBDaonY=;
        b=DcmVou/hrhsQlPZHv8/B4vMcHK2EJbDfGxTuDCjlDptfhSwPVy3HjJ1T+aUohYApeb
         D7KsQC54iBFqj9HhjRJXohu3lDlR0qwvOwkseG9xP2MaPB2cvI969GbwSOibIoXfrMNv
         qtfbF5cVTVNFMcMH0xlKrTjiBRj9K7pxJ+jgb7Cr8b3c5iViXFFawSTBhEXQN+Ze/Gqe
         ZBFTvblcnyN35CktYRIiJczfqT4KtiB93vT3Q0JZ39uZ5tBoofY7ismiXkSyFbF627Xc
         ntQkBlfUznG9nVrELOrH/ofTlyL0e3neVwx4McPzqEiyUliKYEqK6i3bd/b3jxV32l3d
         TqRg==
X-Forwarded-Encrypted: i=1; AFNElJ+SUq/Vf13OBhKV16giyZ2BTlbe6PUPrK5fFNSrsWpVAo2UVt20kgHMpfiKiDzg6z4I1dXYViKhTDIF9xCGhFml@lists.infradead.org
X-Gm-Message-State: AOJu0YzurENvUQdkKgIqLAdTCNHd9SWY4w8zZS1oOON79cGwuQE4XiXK
	BsbtKRwMoQj7m8y5jZrd0o1/yjQvBnL5XAoHoXRCZt8LKaVATDRGg9Jb
X-Gm-Gg: Acq92OH/tSqqCnuGdV/wcD2ACfQoZ6LC45yfzI7j9w4T/+ndYxWCRhYvyTS6l/JTsj0
	sT7Old30HbEUdNwCZff2THsChckXkDTHJ5B6exds0LE/15716zMAleEsAF76uhX1DgyxulXbsCl
	qY2Dv5T6+mDs5SgHKm2qRvtAyq7KJPt0iOlMZy/BiJhEgOCc7du3wD9RoqfXOKd8QRSA/YW5EPQ
	kEZJDLnA5SpxWFq4vlONbPoRqDlHpJDUzZKm/96kyKO8j4q44V4gan7B14hWWAbXw6yNk170mp1
	xHSHB4VYJ2srcqoZ6u4fOQa08qbGictPr42rOnLvADGg2swIwVGp/dmkovQQQ5X6VSkPnjoiflz
	U9IBqbAxOgG/ZdS1TxdWfbk6+81WMVb0bn87Mn2qTXhKJEvXlQzr4WH8fale4xd6QVbYODpxo8H
	2QIMfkZrUNYmE0iq21GReibc+yCc7SD8/pU8AcHAMcR+pa5bbHMTFrcto6vhLhdAjLWtXhbsW/t
	Q==
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b5ed43cbmr130379805e9.20.1780581177177;
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:52:56 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
Date: Thu,  4 Jun 2026 13:52:46 +0000
Message-Id: <20260604135255.62682-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_065300_071548_BA780DC2 
X-CRM114-Status: GOOD (  16.71  )
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

RFC, not for merge. End-to-end inference does not produce correct output
yet (see Status), so per the v2 discussion this is a request for design
feedback. It now probes, attaches, and submits cleanly on a stock
v7.1-rc6 tree; what remains is one hardware-internal issue.

The RK3568 has a single NVDLA-derived NPU core, the same IP family as the
RK3588 NPU the driver already supports; the register layout matches. The
RK3568 differences are a 32-bit NPU AXI/IOMMU (vs 40-bit) and explicit
PVTPLL/PMU bring-up to power and de-idle the NPU before it is reachable.

Patches:
  1-2  rocket: per-SoC data struct, then derive DMA width and core count
       from match data (refactors, no functional change).
  3    rocket: RK3568 SoC data + PVTPLL/PMU/NOC bring-up.
  4    rocket: reset the NPU before detaching the IOMMU on a job timeout
       (the detach otherwise stalls a wedged AXI master and WARNs).
  5    rocket: keep the IOMMU domain attached across jobs instead of
       re-attaching per job (the per-job rk_iommu handshake on the idle
       NPU MMU is slow and noisy).
  6    iommu/rockchip: clear AUTO_GATING bit 1 on the RK356x v1 IOMMU so
       the page-walker keeps its clock (else a TLB-miss walk never
       completes).
  7    dt-bindings: add the RK3568 NPU compatible.
  8-9  arm64 dts: add the NPU and its IOMMU, and enable them on ROCK 3B.

Dependency. The NPU MMU is rockchip-iommu v1 (32-bit) while the rest of
the RK3568 uses v2 (40-bit). They cannot coexist until the driver carries
per-device ops; this series is developed on top of Simon Xue's
"iommu/rockchip: Drop global rk_ops in favor of per-device ops" [1].
Without it the NPU IOMMU fails to probe on a full RK3568 boot.

Power bring-up. The NPU is brought up through the power-domain layer (no
driver hack): the NPU power-domain keeps its clocks but drops the pm_qos
phandle (qos_npu sits behind the gated NPU NoC, so genpd's power-off QoS
save faults reading it), and vdd_npu is marked always-on so the rail is
up before genpd de-idles the NoC at power-on. The PMU de-idle then ACKs
without PVTPLL running; PVTPLL is only needed for compute.

Status. On v7.1-rc6 the driver probes, creates /dev/accel/accel0,
attaches an IOMMU domain, and submits jobs; the program controller
fetches and broadcasts the command list. Inference output is still wrong,
and the cause is split across three layers:
  - kernel (this series): the RK3568 differences appear handled;
  - mesa/Teflon userspace: still emits RK3588-tuned config, wrong for
    RK3568 (to be filed separately on mesa-dev);
  - hardware: with corrected config the NPU's DMA reads the full input
    and weight tensors (confirmed via its DMA bandwidth counters), but
    the MAC/output stage never completes, the job times out, and the
    output stays at the buffer's zero-point. I have not found the missing
    step; it is not in the command list (replaying the vendor's
    byte-exact command list behaves the same). Pointers welcome,
    especially from anyone with RK3568 NPU experience.

Known residual. On the first IOMMU attach the NPU MMU is idle with paging
already enabled; the rk_iommu stall/reset handshake does not complete in
that state and logs one burst of timeouts before the (kept) domain
settles. It is harmless here because the job times out regardless, but it
points at an idle-MMU reconfiguration corner the rk_iommu code does not
handle on this block.

[1] https://lore.kernel.org/linux-rockchip/20260310105303.128859-1-xxm@rock-chips.com/

Changes since v2:
  - Tagged RFC; now tested on a stock v7.1-rc6 tree.
  - Bring-up moved into the power-domain/DT layer (no initcall hack).
  - Added the IOMMU detach-on-timeout and attach-once driver fixes.
  - Split the driver patch (Heiko): soc_data / match-data / RK3568.
  - Derive DMA width and core count from match data; drop the DT rescans.
  - Binding describes the hardware; added the missing $ref on rockchip,pmu.
  - Disclosed the per-device-ops IOMMU dependency.

Midgy BALON (9):
  accel: rocket: Introduce per-SoC rocket_soc_data
  accel: rocket: Derive DMA width and core count from match data
  accel: rocket: Add RK3568 SoC support
  accel: rocket: Reset the NPU before detaching the IOMMU on timeout
  accel: rocket: Keep the IOMMU domain attached across jobs
  iommu/rockchip: Clear AUTO_GATING bit 1 on the RK356x v1 IOMMU
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
  arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU

 .../npu/rockchip,rk3588-rknn-core.yaml        | 18 ++++-
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 14 +++-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++
 drivers/accel/rocket/rocket_core.c            | 22 ++++++-
 drivers/accel/rocket/rocket_core.h            | 19 ++++++
 drivers/accel/rocket/rocket_device.c          | 15 ++---
 drivers/accel/rocket/rocket_device.h          |  3 +-
 drivers/accel/rocket/rocket_drv.c             | 66 ++++++++++++++++++-
 drivers/accel/rocket/rocket_job.c             | 35 ++++++++--
 drivers/iommu/rockchip-iommu.c                | 12 ++++
 10 files changed, 219 insertions(+), 23 deletions(-)


base-commit: 52c800fdcf11888ebeb50c3d707f782cc15b66eb
-- 
2.39.5


