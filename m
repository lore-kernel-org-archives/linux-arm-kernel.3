Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGuymloIkb07DBUsJm0q376VtiZsOgNoZNsnmfiTCVw=; b=IVfe1BfqXx21EjTPIOeFO+On+X
	GjfP/ySoo7r9t3vj09vmdyzne9FEWYZSL4DiC2ft126fB5YYhhxiUvFIenDdVhAe5Dky3LtUS+rH/
	rwaQIEME5VX/rWgUV2/3uTzmMLW6j1Fne4gVJP07bcQbSZNt39I+JTcO8+mMSLN285a+ZIC/qkX/c
	Mgbh73jDe4o85ZaaN/Eri6tCtZY9eUsUbFuhgDytjGRGKGNjYzEJvDe5kKr1JD7/OXI4j7ywnlIMZ
	LBCf4ApsYrG6OPPcPpEsq0RfUdAIMaXhv8GDrMkJxvpwlM20wBsk2iwvle7S94oIE9XHSU1xji6bG
	E4nzsZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thu55-00000004gRG-2dZk;
	Tue, 11 Feb 2025 17:29:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3e-00000004ftp-01q7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso2178262f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294904; x=1739899704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGuymloIkb07DBUsJm0q376VtiZsOgNoZNsnmfiTCVw=;
        b=pm4yYlToZQgli5m4SFaBLLc/HV7ngheczuguguxxE0yNOdttXn3Nv2NJd3yGs/RcLo
         IcEDHRsE7Iju5Qy549T5RY27RA/gTNvX0kk37AW8lOXB9H/cJI0Emwjt0UZpNEjaZsxi
         9bZHH5IgULKeNd8at1snOCtPgVNW6paC3cH21TDmZnbDwTZYx6Y9nqoY4Jsm99MIPsgI
         Ygwprfnvm+L2Simj7WeBMBNLf+0A8D7M5opO/mHjFqwNNKMFKdvZvVSMbzyubdDUY5/U
         9mymf+R029GiO68kHtSxK0XVFGOmCTEHqXlsw3Pplpo7t/kaZl/Fp4yoYNlP8ZW/PatO
         d8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294904; x=1739899704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGuymloIkb07DBUsJm0q376VtiZsOgNoZNsnmfiTCVw=;
        b=B/qC9WiFWLiOf+bTvu7/6KM05yZFNCSRDWXMaZXI1s1lHWHeslWUat9UMgi9hLdunH
         0Mk+ypmUd17ji46tpOn/Xl1vfj57kMGLHlVAB0lDQBfa2e9NAIm2lhxhBgx60WarpwH6
         gicI4RKxYJBjrWRR/0a+5QCc3vgxhyxdqCLe5JCpxlg26XM+uH+Z2D8MfPGETLDwlhae
         +P7v734haSgatoAR9cFsQumG7llWwc65wXVAHZcdGRVkiX6IuurZfvLCBnvzR9l41kA3
         vytCXUM5FnbGaXU0J8gm+ouzs+oJAFDq9u3NqHseGGRmyGwOmpmOEzzXbM7RRlyaxFbC
         VXYg==
X-Forwarded-Encrypted: i=1; AJvYcCUoasgdI5RUCXwcsqpiLZKFKK+WVh6V2P3FdQ/fV76M63rYx4DY3VsIXVUd4HU5icj2r9sysMN3OXoJxYpkNbzC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3zp7/DQPQBwBsE0P46vu9l2PXtCI4mx/uVS7UtTUU+qUul18l
	NNW4kS1Nyd3sFDyJB0mtdloWxCv7PB98tiJ5O7oB2ipyRevRgzDOzZdssqvCxjM=
X-Gm-Gg: ASbGncvpPoSor2WlJQwh/M+z4wbB7diqoMXDSTZawFBpCtA6AbYW8vIFoUplI8BZ+xp
	Ah4aojvHejcRmlcd92sY6Z7EFQuwqfK9BI3nv1kTBnT57l3sKwYi93D4BaN3vvi8c0lLmKteBkH
	UnQs7jYFU0Em7aKCqZXghJC9hVKozZuR+OubbjRIeVtyiqPZeX4ITMKkDBv0RxsZ4vt+crSQkvG
	CsuGSF7iLQcX0GBgeEMFYjF5wwfa1d7ro+cH2cP5ZCHjeiRFolxJCPZcg1kEmghMPQ5glsy/gTf
	JkcMjGe58qrmIwa7pA==
X-Google-Smtp-Source: AGHT+IEnLhYUowYHE0yKYJiPhnWPf3ZeYK7gEVcdnt/kejC8y5qrfPO/D7z6hU8xWCz/RTS9lenTeg==
X-Received: by 2002:a5d:6d8d:0:b0:38d:dac3:482f with SMTP id ffacd0b85a97d-38ddac34a13mr9552027f8f.20.1739294904276;
        Tue, 11 Feb 2025 09:28:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/7] driver core: auxiliary bus: add device creation helper
Date: Tue, 11 Feb 2025 18:27:56 +0100
Message-ID: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241210-aux-device-create-helper-93141524e523
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2783; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=a5cIVDB/XqIyZLdjQfX2dKjmeJTuroJeXtpvtv2BIfo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g1Pe4IH0OZxqD2nUyrcAQNxBIXu0/k/eK1P
 eeZU0tDtUuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINQAKCRDm/A8cN/La
 hTwuEAC0yRgoF5+sh3729QlMMArb49bUXPCcRfPXuGX9LfhICUU4rDzmeyhZ73ixiud2HTj/cU+
 CD1JkxcQMgGt91XivcxSZaa/O8J0yiPY7XsyumB7lZztf3UOMsCyUYTcKtXq5nqIs4XCbEhpJBv
 wWROK3l7aHwYaq86foxHXPKLBnOdGvO9tG4Cd9dFUqvfkunsU8f1EiHoxbmp+8AixeZ8JpI2h4m
 RjfqKlyTgw1YwDSy8gvB5ZPIPfJVWyTKmC1Scwl9vPX/7HwArcDqpjHRlq9wCWsX1X+dYHwP114
 skbcxvzytfFkqEWc/m9N/YUNN2dmQQm9p2R1+J86uloEWI4o5KzhTYOpepjT2AkP1fIujSUKYHZ
 /rh/PrI+zpIhqvRdlvWTgCLIc/16EpKDNCBjZm6Uvr97KnbucwB0DCt3VCIVrzNe0IS/YeK6OhJ
 lildtlGnvUpl2dz96XT3fC5LwwQchqy+/WWifjqotaNI+P2EF+piohEbV+BE1YCqkl75qvhErq5
 jYQ83+S4Fv3kZTw+9RDwCRDGX4prBwuMRTKuurwvRjXy3rrJdHr0VSfiRqXP+ZsEqCTGpkiLz/9
 aR1gap1Zu3kcgRpqyt4RTF3xD8Ji6TpRGWpayTg2eFIl/D+xovgQKgGFBvkXIlBF5K3AjkP5YO/ 5n/HysQTp88OoaA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092826_240504_E9ABB797 
X-CRM114-Status: GOOD (  16.60  )
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

The suggestion for this change was initially discussed here: [1]

This patchset adds and use a helper to create a simple auxiliary device.
The goal is to remove boilerplate code that tends to get repeated for
simple cases.

Only the last change was tested on actual HW. The other usage of the helper
have only been compile tested with x64_64 allmodconfig. There are many other
simple cases of auxiliary device creation but those tend to use the
'container_of' trick to allocate the auxiliary device. It is possible to
convert these drivers to use the provided helper but the conversion is
slightly more complex.

[1]: https://lore.kernel.org/linux-clk/df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org

Changes in v3:
- Implement Ira's suggestion to use KBUILD_MODNAME by default, same as
  auxiliary_driver_register()
- Link to v2: https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com

Changes in v2:
- Add usage examples, as requested.
- Add 'id' as function parameter:  Adding the example usage showed that
  handling IDA allocation was not appropriate and making the usage more
  complex for simple use case.
- Also add 'modname' as parameter: Most driver have been using
  KBUILD_MODNAME and this actually rarely align with the driver name.
- Link to v1: https://lore.kernel.org/r/20241210-aux-device-create-helper-v1-1-5887f4d89308@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (7):
      driver core: auxiliary bus: add device creation helpers
      reset: mpfs: use the auxiliary device creation helper
      drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
      platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver - take 2

 drivers/base/auxiliary.c                  |  88 +++++++++++++++++++++++
 drivers/clk/clk-eyeq.c                    |  57 ++++-----------
 drivers/clk/imx/clk-imx8mp-audiomix.c     |  56 ++-------------
 drivers/clk/meson/Kconfig                 |   2 +-
 drivers/clk/meson/axg-audio.c             | 114 ++++--------------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  84 ++++++----------------
 drivers/platform/arm64/lenovo-yoga-c630.c |  42 ++---------
 drivers/reset/reset-mpfs.c                |  52 +-------------
 include/linux/auxiliary_bus.h             |  10 +++
 9 files changed, 157 insertions(+), 348 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241210-aux-device-create-helper-93141524e523

Best regards,
-- 
Jerome


