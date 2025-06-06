Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C600DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Azp50qUoKvhWib2z96ivM3bk0Xe8grvpHixajVtU5v4=; b=s0Q1BJnOB0iV7l
	5Hb+zhTPLrs8g4GXNVJW51faGUcBlWVuBeB7GWTED7l+xwBF3ZqqwqWF+65kiei3cVVY5gFY2XAEz
	6pwuzoXlxcce/M5IDqVRIdiFfZmbivRYUn/u84SX8Q7j57+t9YTkwscZQJkcZeH1mAitVXrz8EX6r
	EHOxe+3rQgU4H395pOZVYOP/rPjoes7x+g9UqPrTa/mpXoaKLqta8jR1bPt+vVL061F0l/Kg0sNQ3
	PeonYou0l7ighX9WgTunjGt17IUcGnpyAqeg9Qd4zgRUpZtr2gf+CLY8bJTm2XI0uzEixSZHTCrfP
	XwSH2DMmeN0p2ldiSBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQbp-0000000HCNK-2PDL;
	Fri, 06 Jun 2025 06:31:21 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQZW-0000000HBku-1Bp6;
	Fri, 06 Jun 2025 06:28:59 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb5ec407b1so308168066b.1;
        Thu, 05 Jun 2025 23:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191336; x=1749796136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Azp50qUoKvhWib2z96ivM3bk0Xe8grvpHixajVtU5v4=;
        b=stefRlXCbThQkDglYgsgdRB3NIw0OnqXk6ZjAPUFErSqJJxot9yeA9xMAKCHo+ShUe
         BNAfVDU8VpAT69cxxDMTa9MPjJqVuFky6ssY0ZXzQhl99KjF+gA1DKb5FoWWXAFULcvM
         COGcG3cA7G9jlNpTdt1KpCOR9Bkbfi1D/6YSUmwgqtfg+YoEX9jqfBDAAwJdooyBy4sx
         WpbfXDDY7o/gyFX+/4xUtvtKrVm7EPEbdEmt4sVQGidg+yweAar7mzz2CvX9j+YQb4IT
         fWqI/YSknLP+EbMwzORxZzDRFexFHxJFNifvcpB83F/56y+7daUbtgc/NoWcNCDDvsDb
         B+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIuggeDsI3TGxLXHDUOzBCgu8J2ZVyOlUMphBckbTEp0MpCVV0rRrLRAKPYpUh0uBTt+IJhw0j6h8jTMyUi70=@lists.infradead.org, AJvYcCWiuJgydYJf33fdLs6BCiwUIHu+9b/aS4mu8U986/kMDVxxxbVYxSwELiw/xKSNfQkIF4oEiIozGP8JMaeHD8Uh@lists.infradead.org
X-Gm-Message-State: AOJu0YzlmvSCaWgAqxOdgFV/uPGTJANHqvdgwAzhXOIkVefPAFpL7/M2
	XhPJBxJ3b02tpQvLqvX0MRVhSdvbEtcIjUToZYjJWNE49BrCBSzzHNt4
X-Gm-Gg: ASbGncuyZgn9t0/hTrTO5A06vztCa48STEh5bXqH0/JsEzfMj3FF8rKyaR26YlNkLUr
	tm2sJ7hP/6pjOoBt9A53ipEJZr7UxLHnW+zcbiDnXtWjtS+1c7Y9yVF7Dszp3lHlrtOYxQ3sySD
	vNPSIpAuJ2j1wNZi4572TFR7uTpPE5UA1ZJ1LnU7CE551fQHL0E2D+epQ47ClgCB4WTe76MHyGy
	dl/wYc9sDgxvlDcNzmgySFgGqdAb7R+iM9FOXU0QeJQcFyEYg6GHTidQUO1Ng/Yw0dhbU0oR2nA
	fy2k6SSLWKecUnZXlLBSRoqgVYq8lKuoLkqSPF22pwCicdB1tvAKOiD9BrMFaJ3MJisjN0dwSTm
	kSYKJ3FAUi8ShAbcvhwU5ctpYRyoHVXE=
X-Google-Smtp-Source: AGHT+IGXNQ/Kv/GAHaZTlEm0PZukBBO2kWUNKuvYaAwM9uxr8U9d/fuebZy2jBADIT8dDmhYUoCnRw==
X-Received: by 2002:a17:906:eecb:b0:ad8:8efe:31fe with SMTP id a640c23a62f3a-ade1ab876f7mr153758766b.43.1749191335712;
        Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:28:55 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 06 Jun 2025 08:28:20 +0200
Message-Id: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISKQmgC/23OzWrDMBAE4FcJOldl9R/31PcIPUirVSNKrWK7J
 m3wu1cOlESg4wzMx1zZTFOmmb0crmyiNc+5jDW4pwPDsx/fiedYM5MgNVghueUC+FTwgxY+KGE
 jJRQaHauLr4lSvty001vN5zwvZfq54avY276zCg4cLJA+Enlp4HUpn/S95t8yl+eRFrZrq/wXD
 EhpWkFWIeoYMPn9j+gL6i4YYVtBVcHV2uNQ9Rj6gn4UhlbQ+wcbU7JBI3jqC+ZBkNAKpgriiAN
 6SBgU9gV7FyzoVrBVkMp5dCbGYDoftm37AzYXVxT2AQAA
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_232858_341548_97A8D9AF 
X-CRM114-Status: GOOD (  16.02  )
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
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  118 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   89 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   31 +
 drivers/accel/rocket/rocket_device.h               |   30 +
 drivers/accel/rocket/rocket_drv.c                  |  301 ++
 drivers/accel/rocket/rocket_drv.h                  |   19 +
 drivers/accel/rocket/rocket_gem.c                  |  197 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  700 ++++
 drivers/accel/rocket/rocket_job.h                  |   52 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6430 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


