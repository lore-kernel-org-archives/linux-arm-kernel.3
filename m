Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D6D2F34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nRDDaI8PSQ9i8fUQYmRubU2lZ9FKKoqL8+7T/Yos84E=; b=cXI9PH97/HYQXd
	KqgfpuFu2kbLh1cOviva63G6yztCHUVyibMFmyIJ1TsY+DAT7Lo+vygzNns4+oEEeEWl/3aXliEPS
	wdFM/gRtVKpF4fPanTCNPSykKO9TBr2ZLUHjbUlTpnKlWVJqGqLZCo3ViZmU2KbHSxB9wf3mA4ZdJ
	/S1o70PTMeIZsAkJlJnZEi17LusV+oqUj1bENRMsOlbt+lvBhxCXzwE5Wy0RXL7dG844CBcicl3NE
	s7ANDKbyytO9Mw7POw6hAytJflmXHCi346xRgduuoVznWf0XdWxnMmFUrmDkltDRXlMR4c+65gTRa
	TxH0LGT8XukMq6kmbBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRm-00000007Y7o-1OQp;
	Tue, 13 Jan 2026 17:44:50 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRk-00000007Y7R-0ZWZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:44:49 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b872b588774so302795266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326286; x=1768931086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRDDaI8PSQ9i8fUQYmRubU2lZ9FKKoqL8+7T/Yos84E=;
        b=anl0cMzIskVVWJ34Rsx1hS0jM+HoQW/qmksthHzMEdG1kaTzWXbYA4Q3Ex+eSxHBJ8
         lELgy5p/rzb6QH5p+/xtVkpaUkwvSaS+7ZQt3/ZTnJYCbZz8WmJBIMHXzlRJZoR/tO3I
         SbeTdsVWdhuj/5X9QjD38DqaiZk/+2lZabNvwSbeFyMpFgjIgKffh3bFOfvB1CRluouS
         q+aeHt7TZmEc9f+SZ/aNEmMXVOJPrzanjSQqBWkmTd/rHgaHYJglVk4a8rVY+NQHe/RS
         X8MFiyARdjCmqzfvD4njokjJNLSvsyYu04pHxifBAa+14B+DHOvmkjm5yyGwFLpRApfM
         ouuA==
X-Gm-Message-State: AOJu0YxfAPJO+2XuQOJQBuMkBVSKid4Dz80aMn0DkUx3LdwodWU1Mhe6
	6NOVUtnZfeA2Caz6tATGYsvtSuBnIKJ2xFPZUsp8memyxwPB1aNQPm8j
X-Gm-Gg: AY/fxX7Bi4JK6hR4H755lssvBoOTSdbwPfcP0YiotHRei+sCu7ShxuI2R6DClzKsoW3
	tvWqgyWVdwGExzYnGY/6v/JyFhE3IRy9F1aoT80fEsV1tZ0e1qMMxMIAw2YBAPCn/93we4bwxlF
	lv0Wc7nPzB9eOhRd1py0HEjusxjUOPsZW81csyLic3QrpKQ9efRgq3Rp4CiPav5vWWahQI7/l36
	CSseGQ5OqCit/ix3nfFCIZxISrKBmn/QwfpC4Jl6hfHc5SGpV+qTWZlyAPdCm3LSCZvpg0GWcqF
	fkl1o3G6xkzMb54iCJ16yBLLnZWVHbmUwIa22iB37eB0l1HzkzFmtnUTYS7W9CjnW2aplhTyUl3
	gd+KA3KeFE1/1wWD1GTnnxL4ERjaDKVWlSRdA4BZvuHL68y+UlQC9dMYIRcWfLF83YNTNA64o44
	06KOKwyQ6XzTYSLZthRiA3zlZ6bLJXEIFoQPQ2a1Ypmb5H8g==
X-Google-Smtp-Source: AGHT+IF2LxGsN/6Keoe3DyT2UHG1IbdrBpLZY09D3elBScNdSzuVpg3kGMzeCVp/wgijXP8twmjnjw==
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b872579ba1bmr579850766b.41.1768326285367;
        Tue, 13 Jan 2026 09:44:45 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:44 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH 0/5] New DRM accel driver for Texas Instruments' C7x DSPs
Date: Tue, 13 Jan 2026 18:44:34 +0100
Message-Id: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKEZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKMxNzUYl1jYxNDI/NEoxRLwxQloOKCotS0zAqwQdGxtbUAsQm
 1olgAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094448_195253_49FC0087 
X-CRM114-Status: GOOD (  15.97  )
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

This series adds a new DRM/Accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S. These can be used
as accelerators for various workloads, including machine learning
inference.

This driver controls the power state of the hardware via remoteproc and
communicates with the firmware running on the DSP via rpmsg_virtio.  The
kernel driver itself allocates buffers, manages contexts, and submits
jobs to the DSP firmware. Buffers are mapped by the DSP itself using its
MMU, providing memory isolation among different clients.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames_firmware/.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

If there is more than one core that advertises the same rpmsg_virtio
service name, the driver will load balance jobs between them with
drm-gpu-scheduler.

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Tomeu Vizoso (5):
      arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory pool for DSP i/o buffers
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add IOCTL for job submission
      accel/thames: Add IOCTL for memory synchronization

 Documentation/accel/thames/index.rst               |  28 ++
 MAINTAINERS                                        |   9 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  11 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/thames/Kconfig                       |  26 ++
 drivers/accel/thames/Makefile                      |  11 +
 drivers/accel/thames/thames_core.c                 | 161 +++++++
 drivers/accel/thames/thames_core.h                 |  53 +++
 drivers/accel/thames/thames_device.c               |  93 +++++
 drivers/accel/thames/thames_device.h               |  46 ++
 drivers/accel/thames/thames_drv.c                  | 180 ++++++++
 drivers/accel/thames/thames_drv.h                  |  21 +
 drivers/accel/thames/thames_gem.c                  | 407 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 20 files changed, 2113 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


