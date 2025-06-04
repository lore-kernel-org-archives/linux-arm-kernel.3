Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F214C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxxYGGPVhEVYQnWDmi0qjryVI8On5yy5JrIx7t0q32E=; b=l4WVjbvbi8rbyX
	zUtvCjOP7LeUrIFGU6gv0J8rtP7eghDjh+rF+q/WPCSRLTBt90mJGhj7cCU5+wND5Hr7ttEybS/fh
	x+YdcVPjc+/jvPlpMMS83FFXrfyT6bfBWwjg4kN6j6SKb8kBkNbuvo3xiBcoaodUDDyKqXxJQIZrT
	ri5VseMve2TimsQB83m0POxZSKHQUpS0bgnp50KgG7tInQ0Z0LEsiSm7gHOi9cIO+83htP4zgA7li
	r38+bbrNIt1iRV0ZIkYaBZLKypKO/IxlFSSkg0lF9gLboF6vdtJzI/9r20NCOmlWxl+SkmzSy3Hke
	4HleX0yRULM6frU0V63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj2A-0000000Cp5E-28rn;
	Wed, 04 Jun 2025 07:59:38 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj01-0000000CoS9-1Jdf;
	Wed, 04 Jun 2025 07:57:27 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so13088511a12.0;
        Wed, 04 Jun 2025 00:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023843; x=1749628643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxxYGGPVhEVYQnWDmi0qjryVI8On5yy5JrIx7t0q32E=;
        b=WkXhLJWzOrClUtYbHzIr/NdyZdN9TTjZVVjPN6cjhMtfbQYopqrqTWHQnAcRN0yKaw
         0WYfxjlmPKAmCMwaQsBlkSpttSwjYFEHBWvDnTbKIv+artGMg36qLAZy6lCcxi2a3CGi
         DYItaKFx/8TO6wbo+C75jD7aJtrD7/9iw5HtLpblJflEd+pqnbRmXldKKUbIy9S9k/zI
         TllFEj0zvct7DOCHAYn/vG6EJRC4LV5KV0rFc3tunJyA4CMubpJ6teqh90hYKBSEbIVF
         ggbpYrOUl0smOZVBQibvmb+jtL5m0AWvxHXigf1ZY6Zl+Ik4Rmq5cvGuP685g3zhUhuX
         Bopw==
X-Forwarded-Encrypted: i=1; AJvYcCUoD2XRqNt9tjD1EyCOmB/CGToV2k/h3W9O6oxYhR6/EVGrhjcUAi3fCy/GbWO6aYDP0cAXVjfRtiW7IuBfghk=@lists.infradead.org, AJvYcCW/uhjxxauQh7wzuVFGS9UHgR8itGv164UFiBvCCdySQbPpa5UFXu0W2bvpo6OWUDyBwpAdRJHxMzMsyCbkMpdk@lists.infradead.org
X-Gm-Message-State: AOJu0YyJR+IN1dK51j2v/4zunqMR3PbBA+0pJBlborYIdQCGXXwYkp8w
	ekc8O4+WU+fhY5Ff/KmsYlxVkcEr6O8W4CwlYpf5IAU1q/egNZT8DMPK69IEYCcb
X-Gm-Gg: ASbGncsULny0aGt6nXwjCkRFAARe/ZgTCuu6VDb+7IfwFDe2UWBurrLJuloH01hr5j6
	FONmG3Q9cF30cnU82Wz3YOU9ppS/QaDeZ+GdQnlf6SqWmDI1IYaLhGzI5bluiN07NEJ9H5j/T4I
	uK63cAAEZEOi7gFdlyLGmlvqMvQFtdSwk2eJKGtfPYtwNY9N0kpEX8Q4jrKOSMHSz9eqXbpd4Ec
	3KGL7UKYnseeK9pwdRrCGMmEHENtCwQ/Do0r/UR0niETtEc8IhITeNIkFVVDvcFs+2Odhe5Y+3F
	QNCdH5S8TUgcZaF6vec1XnpFKMDa+TaT6aN7lFmeCFO7TCXWu3FVJ+4HZYFD8F6AKO99nJ1MQQ3
	Gl8xLGsgdOQ==
X-Google-Smtp-Source: AGHT+IEZtmjhfMvdiTBqQ3KrjPtemiMa58uAXN8NL9Oz74jU+f3Xz3Mbx/uxfwFliJgWoAvBATYWXg==
X-Received: by 2002:a05:6402:40ca:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-606f0ed4379mr1469272a12.27.1749023843024;
        Wed, 04 Jun 2025 00:57:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v6 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Wed, 04 Jun 2025 09:57:13 +0200
Message-Id: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn8P2gC/23OwWrDMBAE0F8JOldltZaUuKf8R8lBXq0aUWoVy
 RFNg/+9cqA0pj7OwDzmJgrnyEW87G4ic40lprEF+7QTdHbjG8voWxYIqMEqlFYqkDnRO0+y75T
 1HEhp2ou2+Mwc4tddez21fI5lSvl6x6ta2m2nKgkSLLA+MDs0cJzSB19q/E4lPY88iUWr+CsYQ
 DRrAZvgtR8ouOWP2ha6P8Eouxa6Juxb7ahvuh+2Bf0o9GtBLx+sD8EOmsDxtmAeBIS1YJqgDtS
 Tg0BDR/+FeZ5/AKJhlVG0AQAA
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
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005725_359777_60890651 
X-CRM114-Status: GOOD (  16.63  )
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
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  144 +
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
 drivers/accel/rocket/rocket_drv.c                  |  300 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  208 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  694 +++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6455 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


