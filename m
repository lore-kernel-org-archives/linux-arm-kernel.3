Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACB6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2iDm7AFMMtjAMcYjTVMDQj0KlbNPAJT0z73iR1jFKk=; b=yvfBAaiTYLTnlP
	rvSn+5HBbG+kAIWhjB8w6i836fwZElOhy7vFP1Q6qg/7Tu5Ilf4KxHVq3ivv7xgbH6WDCiuOYlmJF
	YxNmVnIOtPItQ4XbvN3f9C21apQc0Ak5dQN3VBaia6ranJjWdvThrTyQiuk5TwFuwfX41PS6EMbuK
	0y8d4KpdUYz96HNvDjX2/kI/JI6fBboNrnLJWJ5F+EBjmiQRlG6rK3lYx90D7b1sLIWGf40gpdYP9
	2GjZboblL3e+/8INFeEeSTzVqVGiRiCN5L2f5gXUkH4lwSxrX09mzgEN26GarRv+W8MoNgoRR+8zM
	VcjwqFh4iJnLUHNPcsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0oe-00000009KER-15O1;
	Mon, 19 May 2025 13:46:04 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0mZ-00000009Jf9-1I81;
	Mon, 19 May 2025 13:43:56 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so48231455e9.3;
        Mon, 19 May 2025 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662233; x=1748267033;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2iDm7AFMMtjAMcYjTVMDQj0KlbNPAJT0z73iR1jFKk=;
        b=g4Xq6zwVdC9J6YNuk1uhclH25sblbfaN5WE009YUhAyu65qqIlsviHc2WkPq7e0pHN
         9siZeiYMGxDyXRvDoWh8OgwRN0zbg81PVSWkZBEyoggGR8Q4BGq+zTkPzW2K0pExA10i
         eZlaDY4osLIdeJKF9DjxoiixaeLeDi8x72bC4BrXqzFDsIQeLhOQb9atirsu2jCCkyto
         Qjmn05ZUSwEZsueAZbJTKFZB+Fj8Psf4zbvX3UuBF44nvKxZ3+f0SjJ8rhFJo5gue/LG
         zo11Xnq8UPOnLzXLqbATLEA1ln9xsoWf0HPhIYXTrIVo/0qKbkZzo7fuTw4M8ZapSlSr
         8jgg==
X-Forwarded-Encrypted: i=1; AJvYcCVL++svIiST1fAa8v/irIP96udFX3sB/gyZT0T6vwCblT7AC3944QP8O/XfdpJS4SUiE/p8pBSqsYL7QsWGYTY=@lists.infradead.org, AJvYcCVM6B/2FGTWiMdeiCDkKak0DZiYNZhhJT0oZpiCJU+OtxNyqYZ9E/0ez6Y6MiSZHntgj1f8Ir7PGFFLKmhKNpEl@lists.infradead.org
X-Gm-Message-State: AOJu0YzA30F0tVUA45mcTVvfYbrXN4yLsc5pRidGXP5JUJ7ml84aH3ri
	CJAUT5fogD7rsAsAEjPVxnE8vj2uTjuFLsAxeRaqoRtNIxVhI63h6aSN
X-Gm-Gg: ASbGncs0qrQd/wzofPKerffcr58NZWDtJUuMZluiZNFRUu7gFr7xYoqLEBVeQyR0HlG
	24yQtDDYx4oD+2D/2hSMOpkkBu6ltCPFuFY1aZszy7W/cX/XbOHtxOs/9JSd0xRUoaaDrCMzneD
	/9hmbSU9ILRIxhRMc2S/nqYBSc5yGLc8tamRGKHu0UhRIWkzCuPwDqZbS9dJE2g0z4v+VhdIbOp
	j1P3xxkGWT20DvBt++SoHrvbXT/0Jcjy5zQ5E2dWJUH/4ccLmtuuyVyKylTyHf57fbqkTUscqa4
	sVgJAh/xTvzRL8f1Nd0zba0SvrJT+arnoJmqDnLbV8qSqYBnpNUv1Gp9Zc9A4kduKqWyncwP9zx
	egQb668xHlw==
X-Google-Smtp-Source: AGHT+IGz9sr1GGSvtPUN+7MYE3oLrizZuU8xFUXM1pTYI0T7p9vNGQVR6GSJnDp0kkH0OTjmfvI/5g==
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a3655ed55cmr5479104f8f.47.1747662232893;
        Mon, 19 May 2025 06:43:52 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:43:52 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 19 May 2025 15:43:32 +0200
Message-Id: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ1K2gC/23O0QrCIBTG8VcZXmfombrqqveILjY9axLNUJNq7
 N1zg4jRLv8fnB9nIAG9xUAOxUA8Jhus63OITUF0V/cXpNbkJsBAMMWBKsoZ9U5fMdJ9yZXBVnO
 hK5Iv7h5b+5y10zl3Z0N0/jXjiU/rupM4ZZQphmKHWINkx+hu+Ej27YLb9hjJpCX4CpIByKUAW
 TDCNLqtp3/4ulD+BMnVUiizUOW51vusm+ZfGMfxAx/82SowAQAA
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_064355_351479_5B46BC3B 
X-CRM114-Status: GOOD (  15.95  )
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
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   25 +
 .../bindings/npu/rockchip,rknn-core.yaml           |  149 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |  103 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   45 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  337 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6571 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


