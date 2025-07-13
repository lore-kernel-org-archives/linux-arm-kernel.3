Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837C1C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iox57DVjdaoaKfxo5AboCSCO4GMqqNFB8Dj9mmEAG9U=; b=omMY9Ij9nSu5T2
	c1PFxs0W+PAgDgBV+IuNsC+oAvlYIOojaakLARdjsU+gJsqN+kw32lj/1Khu33kwU6FFKzcLIumJd
	68jcIpR4hDl9BgharUtva0S7wT4yYzR1EIZAoNOHOMwOdulKp4zp2MivBcMQckt2+oQb1p7EaNxr2
	3XTQ6v8KMeTunkwNbCMl/OzFSeX1U+8B/ERGqvaWNs+Wl6F/ABk2nJDQSC0qoRcXUqk+5UZ+GAjbn
	eNIFmeFbokIOUcUNOhXE7iItyjDYx8ENuIchrvQ7QtP2VO9obX1Z/prglgDwud+j/T5bEnkSY69ki
	SpMsGCzv6vSoU6Ub2wDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasRi-0000000HYoa-1uYn;
	Sun, 13 Jul 2025 08:52:30 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasEe-0000000HX8k-3rXN;
	Sun, 13 Jul 2025 08:39:02 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae361e8ec32so625784766b.3;
        Sun, 13 Jul 2025 01:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395939; x=1753000739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iox57DVjdaoaKfxo5AboCSCO4GMqqNFB8Dj9mmEAG9U=;
        b=WjcGleMGzfO5oCa6W6VQqL2xFjdpKR5a3Pxl2VOOLPjavTvHnKbpL8f+N8wHEFNEUp
         H9Lo3ovtQYuI/X8xKkwIFtb52yqcFE5NDFwjCH9PufDLkr36VPLWx5OH5fAa+HqZAnfG
         d+F8o6+zoaXjVCbXJVqWCgPN58d5+cW2g/QokHN1UNec93u5Me+Ek29mWsPwHy9saz4C
         4w1+NNOdo62op/T44hFCm/Qr3NHB5JYC7TyjA/1YOxamcz98G4ZeBmi+4w7klTZMWeCB
         7d/nK1DEZSUozch/2xtDggLaotBVldNJu6b8yLJwfp28r75LNQg36r+azb3Av2rIal0z
         h7+g==
X-Forwarded-Encrypted: i=1; AJvYcCVYc3kUNaDArAE5VBwpPl6LABA9WkDVOrQuRIyZU/74gQCyLLgwM4hD3k/9gw/Dddd3c3h/3ZK533tHw1w9hpgT@lists.infradead.org, AJvYcCXCJLKQe3ebJ/LZzDizAubV5SzhVwQNlwPairRoTTgIz45Araogvr0uyOoAChhUfvU8joLyPCdAFbhRCKVMsR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEC3EVmPKW8Q+4yMjORiISRSDd0sE64Hh6Fa29a8hkbXVyvoYf
	hhffpwlC0XTo9t6i3aIB30IqeqrLvC3A3heQL9Swy/Bf9fJwXkl6o+TIKY102B8G
X-Gm-Gg: ASbGncvLji2cRUZTsyWsiEI+mGGZA3YAS+Z+KTHgARSYbGzpHtWg1R99VTYmFgRAQqH
	/e7HY8R3An5DsqMqadS5uQn2sGAdio1/adXhiL7uC2vaz8xjMPKycVzw1IqaY2H5M3qGfqnz44+
	jpeKa+XM69t5vDCIUac7HsDrUC2vhGEzskxr8VMq5yOAPI2x6t0JTr2r4CwIs800N3CajXJIStB
	DZ+Lq90xO3GnQtRtIJ9MQOiAwU/uIfCrYrROgLwvldq7aQzzVBM8g2JyeV6Wtzn1IXhzU6f/f8o
	B1AndLJFVr3pRCISSvN+3uwayEHV0kN/f56FgkEWCPu7x36fnIZZEGdsTvyYJwNQpmK7NUztZxh
	i4Kl0Xpx5q+GWla4NDRqxsFgPURkv91PJzDIb/kK6IPEYGuqj2I46IWXN
X-Google-Smtp-Source: AGHT+IGQt4zhcJArH6o30HJl75IntEaAKyUOXg4i37WOL0jJEDPrPv4BbMBWt/Q2KxZH+6OQZBiXZg==
X-Received: by 2002:a17:907:3cc8:b0:ae6:f663:7232 with SMTP id a640c23a62f3a-ae701371015mr731574466b.61.1752395938613;
        Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:38:58 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v8 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Sun, 13 Jul 2025 10:38:50 +0200
Message-Id: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpwc2gC/3XQwUrEMBAG4FdZcjYySZNJ68n3EA/pZOIGsZG2F
 nXpu5suyLYSj//AfPwzFzHxmHgSD6eLGHlJU8pDCe3dSdDZDy8sUyhZaNAGUGmJUoEcM73yLLt
 GYeBIypATZeN95Jg+r9rTc8nnNM15/Lrii9qmdWdREiQgsGmZvbbwOOc3/ljSd57y/cCz2LRF/
 woWtLZHQRchmNBT9FsfVReam2AVHoWmCK6MPXVFD31dMHuhOwpm64AhRuwNgee6YHeChqNgi6B
 a6shDpL6huoA3AcEcBSyCbpwnZ0Po7T8d3F748we3XUEKKTJGNhVhXdcfpsU+mTgCAAA=
X-Change-ID: 20240612-6-10-rocket-9316defc14c7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Robert Foss <rfoss@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_013900_969959_3BD86C06 
X-CRM114-Status: GOOD (  16.31  )
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

This series adds a new driver for the NPU that Rockchip includes in its
newer SoCs, developed by them on the NVDLA base.

In its current form, it supports the specific NPU in the RK3588 SoC.

The userspace driver is part of Mesa and an initial draft can be found at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v8:
- Kconfig improvements
- Removed notion of top core, all cores are equivalent now
- Explicitly allocate DMA addresses
- Sync BOs always in both directions
- UAPI improvements
- Simplified job scheduling
- Misc. style improvements
- Link to v7: https://lore.kernel.org/r/20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net

Changes in v7:
- Actually enable process isolation by allocating its own IOMMU domain
  to each DRM client.
- Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net

Changes in v6:
- Make all cores depend on pclk and npu clocks
- Fix BO sync direction logic
- Misc. cleanups
- Link to v5: https://lore.kernel.org/r/20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net

Changes in v5:
- Use bulk clk API
- Rename bindings file
- Syntax improvement to bindings
- Link to v4: https://lore.kernel.org/r/20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net

Changes in v4:
- Several fixes to DT bindings.
- Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net

Changes in v3:
- Reference in the device tree only the register blocks that are
  actually used.
- Several style and robustness fixes suggested in the mailing list.
- Added patches from Nicolas Frattaroli that add support to the NPU for
  the Rock 5B board.
- Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net

Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Nicolas Frattaroli (2):
      arm64: dts: rockchip: add pd_npu label for RK3588 power domains
      arm64: dts: rockchip: enable NPU on ROCK 5B

Tomeu Vizoso (8):
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  112 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   93 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |   57 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   24 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  110 +
 drivers/accel/rocket/rocket_core.h                 |   64 +
 drivers/accel/rocket/rocket_device.c               |   60 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  290 ++
 drivers/accel/rocket/rocket_drv.h                  |   30 +
 drivers/accel/rocket/rocket_gem.c                  |  181 +
 drivers/accel/rocket/rocket_gem.h                  |   34 +
 drivers/accel/rocket/rocket_job.c                  |  636 +++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4404 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  142 +
 23 files changed, 6390 insertions(+), 1 deletion(-)
---
base-commit: 156faa3ffe21347203b35a3edb6d2bcb663f429b
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


