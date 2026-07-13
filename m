Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B57C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=; b=kc6c1GSjY4ZrAl
	MwJLXPIco0GnleTQhrT7LXa0HpfTh4+xBiFDxONbAyn9qWShtjPVPvHD6R1Q+6UIRv2o4pB5W9j1X
	IC0L/01LPNQZjeo4EwkX1ijJt9SOqgUA7RIcp4UwHnZP3RN6IsfBQ+iN/Wgh9i6qA1wqpKYm95skQ
	j96Ou9bmlIAAyzr9cZOVbnCFgmoufPpGS55pcBABel8EBz/W6Sv27L7sxslcIVcDAPUA++nNFnr1N
	MUc7037qM51fQOTxwdgDFAx9oVkfwMMdwKRheZeFqgjZRYElCQUlAz5LTwuFFBc+VPluABqUloIyk
	duihBAvL/g8l0TO5ifhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSv-000000097sc-18UP;
	Mon, 13 Jul 2026 12:08:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSt-000000097rF-0PKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:08:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cedda2ce6fso2942135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944530; x=1784549330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=FWLdRo5hsZyH0MKks5v3PrkGQUb+srCsrIOAC/6vfMjk4bXSmnYhi/PH/8zxBxPGMv
         lI9t/eov3Bg3XGovaPweRcVfIxZ0iSBALJujRyV42bOFF1l5n+6vZuu7+GA3rgRGr9mz
         vTIe/T94ZqHytofGLyfWJpn7m1aqbMK2ypGjUE7Dj7djHAfMrxhxgymaOhi/SsQYP8wV
         lyBOEk6dyUtk/P/OSbg5wc5jfh33ff5FA+GSRD/7sGbDjD7vr3mG11EOtzFd/8TtxSjc
         ZyemRB7BSxg6R1AJLbRirWjhZhiMoFn3NLlgcKKo6u94KGa77F12yRzA9tQGgh3FeUo9
         8zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944530; x=1784549330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=BSNOhGuriJKlxyNwaYgRQcL/TQP/nsYnKThbpM/g2Ov9M28g+Y4WWb+HOBwthUAUKN
         EwX6flbqofe7qReiNR1rZiFJ8cJ4WFOk2VItj+MBQhj/UzjkJizYXGvlrG7qMuiPl4Rx
         8lLbs97HKVJJXXFu6B/IDvfJyMHY0HpIwxoFfC+3YMQFroHCjj2QkCbwPwdnTU1ECRoB
         JA6Fqadet4s28kxMR3hQd0NDj2shUd9KaWRJSv3dKI5+1Ajc7Ryah/5AeT6OpjsJMg6h
         LKtFBzBA5FlkrBU93hvxA5F0xmI8yIozR1onTQqDUZjrFBLoO1u+EIpqmGAlc/JPV8tU
         uFcA==
X-Forwarded-Encrypted: i=1; AHgh+RpS2VqjfUf3ShrUjteY1dbMLFpD/5S7jKkaCvxUOd3UlRiBz7A9ez6fGgQSGj5v2VriYZ/SqiPU/nxqSkDVrRgb@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfA1AfKxkEVj1Oc/Zs0Jyv4ZqHOtdDs8pxilZYns1LLxLx+QE
	r9N9fmjEcO42kNDniz/FB5wMq0x+ZFEaeOMIAUhkt1i9D0W8ng/aDBI64kS36A==
X-Gm-Gg: AfdE7cmzR2w0N2u3VCNAxa3GBy09vsfbMjkxq+qbGUy4qiT/aPmEy2r6bOC9tPHJCqX
	twjLUyJX3f1inWITD+3ORQ2nm3dz+KxbNmsgRBiad9EIUvyoqctuDImO7HBz+7mAJ4q578NVoGJ
	35BOwptCTx3bBmmW6Wxbzah/j/DC7p5l8lTCFUoJnVkE5oKm5sf2AdRHqQw49Lz3Go5bBkBdvpg
	8n9PnEfKOIMyolMhznqaP/1G/x8xh+PS2I38p7oiIjgVvI17N+FDILdeMpGpVOmT+KpmC5XoqDX
	8UMb82qU9r3IGmF/qbDyd523EIxt2NcMiNKjg5KiAb97O0G0sjipe05w+hRp2X1m0GUI/guuvq1
	VxU0I7QFY5V+2O1hxXc3Y61Uc8inlnR+N0NhVQBt7w3VlQHo80va6t2g5XE6AmhEB0cAST9tG4h
	8HppIYV4m+LC7Y1FRq3gz2qd6WnyK7Fus=
X-Received: by 2002:a17:90a:d64c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38dc7296c33mr7622430a91.0.1783944529816;
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race conditions, and stability bugs
Date: Mon, 13 Jul 2026 17:36:55 +0530
Message-ID: <20260713120840.17427-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050851_133877_CC3091C6 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series addresses a collection of critical race conditions,
memory leaks, use-after-free bugs, and resource management issues
within the Amlogic Meson video decoder (meson-vdec) driver and
associated components.

The primary focus is tightening session lifecycles, safely synchronising
the V4L2 m2m framework callbacks, hardening work queue operations
(esparser_queue_work), and correcting buffer validations to prevent
stability issues like KASAN out-of-bounds errors or stream-on timeouts.

Summary of Changes:
* Race Conditions & Synchronisation: Fixes multi-threading and
  execution races across stream-on, stream-off, job abort, and
  teardown pathways.
* Memory Lifecycle: Eliminates memory leaks and use-after-free
  vulnerabilities by safely pinning, canceling, and sequencing
  device removals.
* VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
  parser, properly tracks ongoing buffers via atomic counters, and
  prevents invalid memory writes.
* Platform/DMA Adjustments: Adjusts DMA segment configurations,
  canvas handling, and buffer sizes to match modern hardware demands.

Note on an outstanding issue:
An execution deadlock occurs in the driver workqueue path during high
stress or long playback sessions. This stall is triggered when the
Amlogic hardware internal video FIFO buffer becomes completely full.
When esparser_queue_all_src runs, the capacity validation check is
tripped due to a design limitation in how buffer exhaustion is handled.
This blocks progress and leaves the workqueue worker waiting indefinitely
on a core mutex lock.

The resulting hung task call trace shows the worker thread blocking
on the internal lock:

Workqueue: events esparser_queue_all_src [meson_vdec]
...
__mutex_lock
mutex_lock_nested
esparser_queue_all_src

I have tried to address this issue, but the underlying deadlock persists
under extreme conditions.

Any feedback on this new appock is welcome.

Testing was done using v4l2-compliance and active decoding pipelines
on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.

The v4l2-compliance tests passed successfully via:
$ v4l2-compliance -s -v -d /dev/video0

Pipelines were validated using the following GStreamer script.

[1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5

Previous changes:
v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/

Thanks
-Annad

Anand Moon (19):
  media: meson: vdec: Fix m2m device lifetime and cleanup path
  media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and
    session teardown
  media: meson: vdec: Fix lifecycle leaks and race conditions in
    recycle_thread
  media: meson: vdec: Fix use-after-free race between teardown and ISR
    routines
  media: meson: vdec: Fix race condition and synchronize esparser IRQ
  media: meson: vdec: Fix race condition by canceling work sync
  media: meson: vdec: Refactor esparser work queue and fix teardown race
  media: meson: vdec: Fix concurrent execution races and unsafe teardown
  media: meson: vdec: Fix vp9 header update failure on invalid payloads
  media: meson: vdec: Fix race conditions and leaks in esparser pipeline
  media: meson: vdec: Update core m2m stream state during transitions
  media: meson: vdec: Coordinate m2m task execution inside async loop
  media: meson: vdec: Fix race conditions in job abort sequence
  media: meson: vdec: Correct atomic counter placement in dst_buf_done
  media: meson: vdec: Fix concurrent firmware loading race and hardware
    timeout
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: canvas: Fix Use-After-Free by linking canvas provider
    device
  media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
  gpu: drm: meson: Fix DMA segment size limits and maximize allocation
    boundaries

 drivers/gpu/drm/meson/meson_drv.c             |   6 +
 drivers/soc/amlogic/meson-canvas.c            |  14 +-
 drivers/staging/media/meson/vdec/esparser.c   | 127 +++++--
 drivers/staging/media/meson/vdec/vdec.c       | 320 ++++++++++++++----
 drivers/staging/media/meson/vdec/vdec.h       |   8 +-
 drivers/staging/media/meson/vdec/vdec_1.c     |  16 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   3 +
 7 files changed, 388 insertions(+), 106 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.50.1


