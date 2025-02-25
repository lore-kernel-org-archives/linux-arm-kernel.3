Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D8EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CKWfJnlIU/VwviwhZqgb3CnRb75dZOnMnqdVJJtv9ws=; b=bWASjZlC0kpk/9
	p656Qi7rFdoxWL6yAtRXzSrQyuEuERIoDl+MrVlxh+ZIRfAOfQq1qTkmUZxk1VIwJzraQfeYDBiPQ
	QKC1e0BzPoFkQhcztEh/ofPe8fnsItgPrrCPk3+YswKmWraPR+QQGPrideCQqkuTImfm4+DC+RsIA
	XBgy4VC3RZD+mcRTFJzkhHLj2mH+qHBz2vrM4Ha0zVj5MX8HuSsPcAYd8cb66OHFzUdKXAWfc9lk2
	5R4Hfh4nTjNaV8mlEAYS6N4L+4qCUEG8q2BUVpWblZBrPhVjtgKSgWb/hbEeTyRv8cNitdqbm6jrT
	x5rA5krcCrg6kfu+cvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpou-0000000GI9S-1jaW;
	Tue, 25 Feb 2025 07:57:36 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpnM-0000000GHbo-1HLa;
	Tue, 25 Feb 2025 07:56:01 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439a2780b44so32702435e9.1;
        Mon, 24 Feb 2025 23:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470158; x=1741074958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKWfJnlIU/VwviwhZqgb3CnRb75dZOnMnqdVJJtv9ws=;
        b=c+Hh4fR37+iuWMUoEryLw/oxdORGTlpjD1hyuul5TtKCE6fkfQ+htAWreWewVVI7XP
         ZRnt0qzwN7jm91pEHmXAhuuicgi7pyW+TeMnI+0KcnFJOgYM5lZ6/UAv8hSx/M7erDOH
         LGs8Ioa7SBD351kXkqtmk9rTDAeEMU0uAS1qQCQBzQ+0OIINjQaFogKRonLfveMGUfXp
         WkMyvTnL3ANvbnrhHgbc1DnfbhByqSB2MWhQZx5UisncSbyjUtBWd8nNXM84mvK96weP
         DZXx6nQ8bgmpJOchO6yac6YymGpqVhvHrHouWjb45ak8mAgLsvTRhcAhDz7Tvn8fQWw6
         D4sg==
X-Forwarded-Encrypted: i=1; AJvYcCVA8otVdICb081s7tFgmefvbepgwkVeYxM/abgFZEtIxQYSllCSBHLxMxIxgnAs0EW6IS4ApCPKjM5945QpMEaV@lists.infradead.org, AJvYcCVedVQsYbTmCHaB3Uh1Gw/h1hvAYyKby8Zih0xdD31BOYFzm1bOhR6AIMdKL+8751phwNUI2+Pr4A3qa86aEBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD74XEnNP3Dzh4psbUD+fTYZI+06cLijphG9CqX/urzphL6rdq
	WqsoBG8iFrhnsMSR1FWZLbt6bMyk2bMqQme8kjf7zZMVtiDIEQSf
X-Gm-Gg: ASbGncuHuQ379NJ7nnfl7V+BdIt7WlzhKLUy2xZmFbg3kaA27OcULtzi08II0c9OypI
	zE+NQ1482iGOzOcD/+lHkBhrRXAoHwRyF6O4DNDUgIvEKw9k87hp7SCL73AJkbls3u5SAAYxny2
	EZ1Gp++CwcV/ISfvt1NjL282KdikFZhEKfD3YW/nVqvvsmCPZMEB/ychSpuN4HZ4cJWPpiasjT9
	La7UMFtuLROhaNbUBT2Kpews7qvs8dbDyEyGbOwOf4PhxKkWZrBZ+N65qbW1rm8cKCYYg+XE6wi
	Fo+03mwjUUCk2OEYFueSc3XqYC8N4+p2YvZiofPGMR4D9sN/7jzM8fv9fQ==
X-Google-Smtp-Source: AGHT+IGyKE9ou1PLve6oe1JIwGuGEar++UthHGMcf8nHUEw8AgRnWz/gHdtZb9HVpd+SBEqA45A1bg==
X-Received: by 2002:a05:600c:5115:b0:439:7b5e:820a with SMTP id 5b1f17b1804b1-439ae1e670emr149646185e9.11.1740470158037;
        Mon, 24 Feb 2025 23:55:58 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:55:56 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/7] New DRM accel driver for Rockchip's RKNN NPU
Date: Tue, 25 Feb 2025 08:55:46 +0100
Message-Id: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ3vWcC/23Myw7CIBCF4VdpZu2YAREvK9/DdNHQqZ0YSwNI1
 IZ3F7t2+Z/kfAtEDsIRzs0CgbNE8VMNvWnAjd10Y5S+NmjShqzSaFERBu/unPC0U7bnwSnjDlA
 fc+BBXqt2bWuPEpMP7xXP6rf+d7JCQrLE5sjc6T1dkn/wM8vHR7+dOEFbSvkC3oBjFawAAAA=
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_235600_347292_D3D2D141 
X-CRM114-Status: GOOD (  12.61  )
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
Changes in v2:
- Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
- Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
- Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net

---
Tomeu Vizoso (7):
      dt-bindings: npu: rockchip,rknn: Add bindings
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
      arm64: dts: rockchip: Enable the NPU on quartzpro64
      accel/rocket: Add a new driver for Rockchip's NPU
      accel/rocket: Add IOCTL for BO creation
      accel/rocket: Add job submission IOCTL
      accel/rocket: Add IOCTLs for synchronizing memory accesses

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/rocket/index.rst               |   19 +
 .../bindings/npu/rockchip,rknn-core.yaml           |  152 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   76 +
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   30 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/rocket/Kconfig                       |   25 +
 drivers/accel/rocket/Makefile                      |   10 +
 drivers/accel/rocket/rocket_core.c                 |   77 +
 drivers/accel/rocket/rocket_core.h                 |   43 +
 drivers/accel/rocket/rocket_device.c               |   35 +
 drivers/accel/rocket/rocket_device.h               |   33 +
 drivers/accel/rocket/rocket_drv.c                  |  295 ++
 drivers/accel/rocket/rocket_drv.h                  |   17 +
 drivers/accel/rocket/rocket_gem.c                  |  216 +
 drivers/accel/rocket/rocket_gem.h                  |   32 +
 drivers/accel/rocket/rocket_job.c                  |  710 ++++
 drivers/accel/rocket/rocket_job.h                  |   50 +
 drivers/accel/rocket/rocket_registers.h            | 4425 ++++++++++++++++++++
 include/uapi/drm/rocket_accel.h                    |  116 +
 22 files changed, 6372 insertions(+)
---
base-commit: 585e191534efe95712df88a22eaa8d51228bcb43
change-id: 20240612-6-10-rocket-9316defc14c7

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


