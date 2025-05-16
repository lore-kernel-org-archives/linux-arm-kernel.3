Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD8C54756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WjWgWtoIZo8y/TKpOs5rk2BDTL4bgGyGDJJ1PVIbYcw=; b=xj+3bJkE9+KwKT
	DozvPtuBEaKoaRDZQRWQu2EaYBLfNDMo1tW3dnZwEDYMf6UPN77ZYOJAM/5LL2gJuSPtLujnCAzYc
	oZOdzVrqKVrvBvXyK/Ir4Z7rTEsh5f14naqfRnhoebhAVi2TUsqGtHBsMVzjVzooCRRYL3oPdADQ2
	LRmEbzGwD8qK9C0KAz54TGMVmsu4p5oshHT9GoN++mJ99mVF9/3rl26QKTq34K0eNz+i9Dt1xTSIX
	FoHptRnv2B2m72JBfgTg+piVXt0UcHNGCa9+gvlkaVTCvRdxHYwJKYImEIt2qSqILaSPSLsBY8RBf
	aXAWuw2ldVosBHZFktyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyhr-000000049Ko-27WP;
	Fri, 16 May 2025 17:18:47 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyJN-000000044Tf-1obG;
	Fri, 16 May 2025 16:53:31 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so14928765e9.0;
        Fri, 16 May 2025 09:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414407; x=1748019207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjWgWtoIZo8y/TKpOs5rk2BDTL4bgGyGDJJ1PVIbYcw=;
        b=WE6qSjwYzDElpLMBwztyc5XnKDG/0UKo5NbwecagSj3E0J6W5M48FnA9+k7XMZulpx
         G6KUzdjOyNuSpV3PP9OSHZjajRbuuqC0kCnlSogpklVZLP0iO6Y7NvE/1Ek/dLbf5+/h
         UL2sEEAfINqf6V2Zp/hMGr4HSKq2SR+PbmLrNGShE5b6JBk5XixONgvPVq9/7sODRV0Z
         Wa9UuBmCEVO4nsM/vu0pRa3gM0ky2QutZBvbzjXDlVxcIj2RqIVrSKzQRUatoxhOJiTP
         YpW+Mfdb7PyxYfUHOc4gyq45v7zsxqNc+QGFiyR/XLsxfmILO96qP4pa/ord0sLFJ8Co
         mNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGrS2no4ZArD6fDMe/Um5gTn9sIut+JlRuKhuBUYSzxczEvrJ3At76K5I3bhLT++olY0JjhVsw/vmxPFwXaAU=@lists.infradead.org, AJvYcCUS7YIa157wWw6o+6xRnA9oYOACF4lYHEiM/NydZg2fNazN4GHBtVhy7ZZ7rqZsS0aXvqO0+FQL9MA7oqBX0gdX@lists.infradead.org
X-Gm-Message-State: AOJu0YwfszRiLY8uwmRypNOx41m4JLpTw9xHRjtEeqKpPASfFMaAH1lB
	/dG5BAViKlZ/haxh7OplMhla1Jmp3aXcNvubxuqj0LKkBVju7uTzl7rWnIVO3Q==
X-Gm-Gg: ASbGnctqdSGOJwgiE/7+CYEzk7NGU8Fg5YKVWg+faYgyFDSr9kPvgceGCOY5SAmH7vW
	plbq25dmfbrhOtMEgH+/9dRyyskonKaepMUo/YjcmEEsm+UitH6YKzQNGSutEMLJBdVljMlXl44
	kSNKYbo06KbhaEwa3L2GiVQaxVecvmwL4x69wa7TKRQx6YIHLaA7CGPOkeX9lGUHAhk2Sh40cXa
	4NqrLFGLBftXomlHRYqv+tYJoEg0nMYWegNa752taqN6GFRsjw+x3G465dSgMcJbUZ8AAAQrvmQ
	Xeb8MUrQKNvJLKER3yjtkib/McrVXy9Hfjfot49IwFSKSWIdnlq2zqSR2GSE0ukWHfzL4i4ef13
	7wpfMXFhiykJnETfaAsM1
X-Google-Smtp-Source: AGHT+IFKbF9gN1yX2abHe3gEHPJVfqjkBh9yk3mcerUyAXMO/v4S+hII+M7JTfdRqYHVCzhKlPw+sw==
X-Received: by 2002:a05:600c:870c:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-442fd268c7cmr48300955e9.4.1747414406901;
        Fri, 16 May 2025 09:53:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 16 May 2025 18:53:14 +0200
Message-Id: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHptJ2gC/23OTQrCMBCG4avIrI1Mpmn8WXkPcVGTqQ1iI0kMa
 undTQsuRJfvB/MwA0QOjiPsFgMEzi4635eolgswXdOfWThbGghJoZYktJAogjcXTmJbSW25NVK
 ZNZSLW+DWPWbtcCzduZh8eM54ltP638lSoECNrDbMDdW4T/7K9+xePvpVzwkmLdNHqJGo/haoC
 FbZk2mb6R/5K4zj+AY3RKj87gAAAA==
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
X-CRM114-CacheID: sfid-20250516_095329_505859_E85E16E2 
X-CRM114-Status: GOOD (  15.77  )
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
 .../bindings/npu/rockchip,rknn-core.yaml           |  162 +
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
 23 files changed, 6584 insertions(+), 1 deletion(-)
---
base-commit: 46bfbcd135a6df00c49cf043bf2c9c9387bc882d
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


