Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4657D31A26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BM8f7jH0taMvYnkaVr76MNplqROK/eiMRxPqXZYuq2Y=; b=qA1S8TGYq3VG7m
	hqgmE2KGiLUqrtgIAfQcdGIecaTkRXRKiXgFeHcqhoTlmW12q9Ce1GT4DQ3oM7N6fZbBUekYISzDz
	oeKmdOLm4Gxx8QXZ11XbOPsGryeoLCZ0WPvEvP6IqDVvCmW1CnehpZlgOiTPoQvAQLBX7XKMfD2lM
	c7WHRiKLIKMkInTzW4T3jAeH/+zYz0xp2dehpCHxzbmN1SpWa0m7CoOXdYLV1Wa9k0MvAdD/hQSJA
	g78u42pLPdQ2vootLHEPYfz50ojjCrp21wPtrvK49x+z8osspNyxXD9TcBUxtyarg30jBZWIhbCv+
	XlLd2wyUw1oqz90+qu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwX8-00000008OfT-37sd;
	Wed, 14 Jan 2026 08:47:18 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwX5-00000008OeR-0upC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:47:17 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8765be29d6so51945666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380433; x=1768985233;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM8f7jH0taMvYnkaVr76MNplqROK/eiMRxPqXZYuq2Y=;
        b=DCWVoJf7L20XoK/dJ7oSvIaU6Vz2XIhL4MFEqZTimu1sLo4yU5+haL8Hg9GPRR23MM
         FBJYJN3egzGXq+ApYqcnG6mVjnI1TCC/w+UCsZ/t3L/CR9q7OX17fxiOV/uatjqO+CoX
         FSPBVtNXWmjaHSXd5N++5QTLC8jCrUl/sMVcPER1q+MH17odcN2uFIn1tjQpiv3Ro/Wq
         aJQ76bJZrtYvGydUL81f6RwJ+o8OIZogAsA8E27MzulGF+YiKGkFJ8lg3MkNh7R6xQxe
         //CFbmEknf9bav0byzG6tHvVfnSQBIDtLVrEIMHYqz4oQaoGGmNV342IBvW1Jy1tN4vU
         dh7w==
X-Gm-Message-State: AOJu0YyGAv911BFENnWbDbq7z+irndC9xdq1T4ao5fmFgZOTlZnBq+vj
	0ZhxrlO8dfQaYFcU6lC2wjlHfZhdvTwNIU3P9YzmypYniGXWuaxpVSZy
X-Gm-Gg: AY/fxX4DRBGXUEDpGbKV13qU5/Wo5vK/I7o+RnHDeRUY9YovZpsJGhwQJWwPPqH8he6
	FiTvVHNDaKFEZlOWcq+mCVOlONthOfwkCBylHBc9tdzubtmWGw3QmM+HRpCbu2wzuYpsFp2NA8b
	iEJ1wLZBmSBiNsKKxkdwDhzMF85bJvrSNowgnQvbLd6j1bhUeGcUHje4shU1nWsTJoGmBY/IyXZ
	WQr/P526pAdAzSGf/kdeZ+dzJTAgdkBBRzvNnF/HAmdsFb5P0YuggFQ4wtEKFfGM3mAAU8vpdPO
	KfvTOJFky/Qu/QuukZR+Y1ZJZdERjnlD4dbfu9agZie288yJJ7CvQv8m4JeQxgMk/n0A6yqooL5
	r4dF0uAXy/rVTj+FfEiTlzZ+h4RmqI6ejDLT5nboogDTvPz468VZjMWuYFRd7iYipcj6jQN5svn
	lC59/rY51U8t67CtMWdtIu3Jywc03GSLOZC6MUquOPI39Hkw==
X-Received: by 2002:a17:907:2da0:b0:b83:972c:77fe with SMTP id a640c23a62f3a-b876770a4famr96020166b.2.1768380432976;
        Wed, 14 Jan 2026 00:47:12 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:12 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/5] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Wed, 14 Jan 2026 09:46:47 +0100
Message-Id: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdXZ2kC/2WMQQ7CIBBFr9LMWgwDxgZX3sN0QcoosygYoERtu
 LvYrcv3/8vbIFNiynAZNkhUOXMMHdRhgNnb8CDBrjMoqc4SUYvi7UJZaH1CNVrlDDro8jPRnV9
 76DZ19pxLTO+9W/G3/iUqCimM0Ub2w+hxvpa40Fr5E3M8Biowtda+r3H/yaIAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_004715_299238_CEA1261A 
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
Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

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
 drivers/accel/thames/thames_gem.c                  | 405 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 include/uapi/drm/thames_accel.h                    | 189 +++++++++
 21 files changed, 2300 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


