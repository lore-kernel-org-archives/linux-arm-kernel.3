Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814EAC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oTqGUV4ksLYBe+HeSSbW60q/1vjC74ZoYzWhywmrigI=; b=3yTV8hKQtcJOV8
	oYBq42ho6KHQu/ONYlH0xrmLQ8M1e6pU/L2kB3G7vXKRVDIwc67z5Cdym8bz88H4cz0VMdUfqW09p
	vOyJilwsOwJ0QRTKBbCPWkRgfB52ZFQF1Ct3fRG227yy9tl+A7FBEhsc7zf0HlxTgHZMUj3cv99RW
	jkIgFOUciud4gIcNjOCvwEIWpJIWTvqfw7cj6S2PSiyh9qby1jubUf2B0mOjHAjAAAqFrdvKD1NHG
	pkLTaxHM8luhUAqFwjQ3zf1zfZtq7nS/vYYTdoAu1DX6D5c+LR58Z6qJwhj5Bgjw0FSWXI8pyrG8J
	rHJqysn5TN9WmXucgOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKSh-0000000CQFO-037I;
	Tue, 20 May 2025 10:44:43 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKBz-0000000CLEl-1IwW;
	Tue, 20 May 2025 10:27:29 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso48161555e9.2;
        Tue, 20 May 2025 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736845; x=1748341645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTqGUV4ksLYBe+HeSSbW60q/1vjC74ZoYzWhywmrigI=;
        b=N50UwtttIJhhxPHF6WG/HkQjhdhtvlFgZLFuEPyZeHwbA5N44Sv0zhrOl1ulTVXgnA
         AlGt6fiKwWlAbDUSeaApf2woPgMKeuceiKY2iRR9TKZrmwoctHVWjUnFigiwosSlRkIx
         VuhcFyY5zlOE8ASpavQSIxLuuMZGoHhEWixjkPiASAh5cdvWdcw8XvSd6KSwcXDAGLW6
         J7OPc+V/nArm4Jre+bEiFT8qYEC+p/WgN9X7LphxCOj9FpE0ABpgVN5naVib85CMgd7J
         eg1/VYapTb1/aGQKYdp6rkR4Y9WX29UdAdfoInNYyyBt+otwVuIWUyyZoZUOo5mrmfVv
         TEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN9uHQjFFlnG70o7OMBlKzA8ttF3UoMW1o48l/TCopUZTK++mmoZObB0jluretWRA8bHx2g7nw2KVgcqO99MAJ@lists.infradead.org, AJvYcCVWdGNTGxTAxmuO1QG7+/t/GANXNPvC/0RdbknPwwOIQNBdpwct9IpdFHF4DYFVAOWP0PDJCNI6oW0Nb/OceBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzMySC/2H35dacoWkVv65xlC3fcacA6BYYW1OnyzxDjIULhRHT
	EYIJQ+RTTzXPQ0BFi4RRDdUDzNqPcjdhY9Ss2blWKNe91FOXpbXVD7sZ
X-Gm-Gg: ASbGnct8RkW+RZr1jSVk6FwE7Cd0ICGzd9dqv+ZrbpsIvmcBM82KEEuBrKhv/Pr1Wqb
	bFxPuVvhVdU5l4dYfOVgN8rFeM3NL6DiI5aKle/5ql/rAyEp4cBAdqeZb1OcO9XrO/Eh4BOoRjl
	jd3ToxFYhorR0PSiiLFjFn9CJRtrtKiHIIVJ1E4pVrQO6s64FkbkREC0Bm9+NcQGl0VyUyLk6rl
	BZNfrKpQd9YkaoarWzZ/vg4034aaPlgRIkzz5tQpEMCtpeGhbPdq3w/ObGysl/LUnF9ipw8tf9A
	ebMSOsTqBq6EiWLIxCMCuIQcI8wcX+FAn6Flxtuuuw0dR+dMlGier3KO8Yzayc7QAhJ/6ShnKP1
	ghpjUxrtEZQ==
X-Google-Smtp-Source: AGHT+IGQIlUJcRyY3tl7EezqGJ1tIgqTCFM3lHfZujGm8AzrqDj+5VJitvVUKwA4G018r4RFcqgl6Q==
X-Received: by 2002:a05:600c:6748:b0:442:e011:7eb with SMTP id 5b1f17b1804b1-442fd671befmr186270545e9.30.1747736845139;
        Tue, 20 May 2025 03:27:25 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v5 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 20 May 2025 12:26:53 +0200
Message-Id: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5YLGgC/23O0QrCIBgF4FcJrzN+nVrrqveILpz+lkQzdEk19
 u65IGq0y3PgfJyeJIweE9kuehIx++RDW4JcLog56faI1NuSCQcuQDFOFWVAYzBn7GhdMWXRGSb
 MmpTFNaLz97e2P5R88qkL8fHGMxvbeSczChQUoNggai5h14UL3rJ/hhRWLXZk1DL/CBI4l1OBF
 8EK2xinxz9sXqi+gmRqKlRFWJdam7rotpkXxK9QTwUxflDWOdUIAxr/hWEYXhZ3XKNyAQAA
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
X-CRM114-CacheID: sfid-20250520_032727_358928_381595FB 
X-CRM114-Status: GOOD (  16.14  )
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
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add registers header
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   25 +
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    |  147 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   87 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   56 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   80 +
 drivers/accel/rocket/rocket_core.h                 |   59 +
 drivers/accel/rocket/rocket_device.c               |   36 +
 drivers/accel/rocket/rocket_device.h               |   31 +
 drivers/accel/rocket/rocket_drv.c                  |  316 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  211 +
 drivers/accel/rocket/rocket_gem.h                  |   31 +
 drivers/accel/rocket/rocket_job.c                  |  723 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  145 +
 23 files changed, 6516 insertions(+), 1 deletion(-)
---
base-commit: a6d708809579ed3d902465785666085ff07a1d7c
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


