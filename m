Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678AC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uTvufXihPkQWxsCzNlViO5S18/a/xN0mVbfR50DxXrg=; b=b/piescmZGcE1ylRQtGX5x6eIf
	HEf6980w1Uv6Eor5DxvHC6XLexOhvdqdPMMkVHbWiL23S5gHko3fdKqjZHr851LmPa1xBCRgXf+Hw
	tb2xL7hx5oNOtgjfoGvYPe1SM9y7R3Yl+oqbvs8d57mWcZrBq3izNV1U9dv4BBur8hJKxmEQ9SOcp
	SmQXraPqUrSefxdJnN9awvhTvRMKjmek0d6dcgfw9+XKAdtn5zvu1FofXttYIHG1IVkvfgGwdHUx7
	sXl7kyq2i+DqN1KWK9PKpxALgCnXiPg7k6cYR0kSJUYT9Q5G39JkSmmwTtvMmLvYpzXXDrxtQyqpB
	R9VRavQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEHa-000000065hX-3301;
	Sun, 10 Aug 2025 22:12:50 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF0-000000065Vj-3I0v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:10:12 +0000
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-321a5d6d301so452241a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863810; x=1755468610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTvufXihPkQWxsCzNlViO5S18/a/xN0mVbfR50DxXrg=;
        b=snzm+zde1rVYM+qPCTj+U+XgVusMsn1kREypLzOipFkRGkNqE6EFVLcbdXc04FjWE+
         WqTbL7AUXdBGPBmwcqXgZvcKqTNQRXwQVRWHWrWG5+l2qPYHqH9MMaZ88cUb+QOV6hDD
         IdiqBKgDxfvsEdPE4JUO+THXP9eLkDxmDr9ur5/Ms3qooOlOVK5aIL4HUUYgaQgQmZwa
         3OQMlN9afkKf1bhItoVMFgk2F3xSUzJmOiQNn5SGJvG0zL/JcvxYbjfLCb5qMTdg1o6p
         ePWUMskqeC7vI9+bKDqbgbxCZDnZMenmizJOxqq/gWFtGbPODC953glKKkjNaLj3Pu9C
         Ajlg==
X-Forwarded-Encrypted: i=1; AJvYcCWRfbYbIJpLd1FkU5peU8GiZsED5SJ7BdE9WmhVlDD/4DGmK6Fdak+RBoJ5jTQ/b9k5GBQLWHcuT6YKy/hADfq3@lists.infradead.org
X-Gm-Message-State: AOJu0YzqtTLU6EMiBkxvcSRH63KTxZhQj8JHXGuOw8tvBb5FeylAUiYf
	EKBiRF998QRBR5sPiQY+Hoa18ROlB9Ey6V9Th0doW9pec+lYJCqGAHYV
X-Gm-Gg: ASbGnctf5LPoopBp8qTifzmhvtvDn8iFKomOrlL9Xae1P7HFvB2/lhHV2HwCADFHQ6U
	SwJ+NJ3urhyqxZaYYUxuef+LzZODLYVZOFNccq/QM9VjSaK1fxwBVNGvQ17YfWBVGJ11dblii7H
	WiBzPjxdMQYlwAHMsD7Jiqc3z8tgf7DvmbSNq+EJc2hPkVbpKeyHLHfT4S4jZu8l52fo1XRulbQ
	zvQ3BpbNL4jlRZpgvlU5woZkaMg1tyhuUetMqpcfsFOUIuVBQQZiJirL04fUii7b8nXXeFV8IY5
	bFu2oT3A0BUqmKx2P4+lDKB9b8R0LJD7j+jbXp9ySvlPYCYxJPkQHQSArqUpQ47rS4KJ1GADXv4
	5qyUns++cZizb5y/ASDhEZO1F94UGrfnPJ9fFo3m3uodM4NE5rOTP6u4zRO757HQ6w7Y=
X-Google-Smtp-Source: AGHT+IFazFKcYUWG6jSvxekQQq+aNyqACCfmdDeYCyWCL/tzLKLiOHWFEewxmiV48lSL8BmFoshC3Q==
X-Received: by 2002:a17:90b:4f47:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-321838a61fdmr17485662a91.0.1754863809549;
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:09 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] media: Add Sony IMX585 image sensor support
Date: Sun, 10 Aug 2025 23:09:17 +0100
Message-Id: <20250810220921.14307-1-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_151010_826175_ED20C47E 
X-CRM114-Status: GOOD (  14.06  )
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

Hi all,

This is v2 of the IMX585 series. It adds ClearHDR controls, fixes mono
format handling, and ensures HCG can’t be enabled while HDR is active.

Changes in v2:
  - Move to V4L2 active State API.
  - Shift the I2C registers read/write to v4l2-cci.
  - Remove IR Filter switch support.
  - Various log/trace noise trimmed or moved to debug print.
  - Lock/ignore HCG when HDR is enabled; mark control inactive.
  - Using compatible string for mono sensor.
  - dt-bindings: drop redundant maxItems/minItems/names,
    add "sony,imx585-mono", fix quoted string lint.

Features
==========
  * 4-lane or 2-lane MIPI-CSI-2 up to 2079 Mbps/lane
  * 4 K @ 60 fps 12-bit linear, 4 K @ 30 fps 16-bit Clear-HDR,
    4 K @ 30 fps 12-bit gradient compression Clear-HDR
    1080p binning mode, mono hardware variant, HCG support.
  * New Sensor Dependent V4L2 controls for
    HDR blending, grad-compression, HCG enable and Enable ClearHDR.
  * Blacklevel adjustments through V4L2_CID_BRIGHTNESS.
  * Multi Camera synchronization mode support.

Testing
==========
  - Platform: Raspberry Pi 5, 4 lanes
  - Formats: Y12/Y16 (mono), SRGGB12/SRGGB16 (color)
  - Verified HDR on/off toggling updates ranges (exposure/gain/HMAX/VMAX)
  - HCG is inactive and ignored when HDR=1; active in normal mode

Series layout
=============
  1. **dt-bindings: media: Add Sony IMX585 CMOS image sensor**
  2. **media: uapi: Add custom IMX585 control IDs**
  3. **media: i2c: imx585: Add Sony IMX585 image-sensor driver**
  4. **media: docs: Add userspace-API guide for the IMX585 driver**

Link to v1: https://lore.kernel.org/linux-media/20250702063836.3984-1-will@willwhang.com/

Thanks for reviewing!

Signed-off-by: Will Whang <will@willwhang.com>

Will Whang (4):
  dt-bindings: media: Add Sony IMX585 CMOS image sensor
  media: uapi: Add custom IMX585 control IDs
  media: i2c: imx585: Add Sony IMX585 image-sensor driver
  media: docs: Add userspace-API guide for the IMX585 driver

 .../bindings/media/i2c/sony,imx585.yaml       |  116 ++
 .../userspace-api/media/drivers/imx585.rst    |  122 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx585.c                    | 1768 +++++++++++++++++
 include/uapi/linux/imx585.h                   |   20 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2052 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
 create mode 100644 drivers/media/i2c/imx585.c
 create mode 100644 include/uapi/linux/imx585.h

-- 
2.39.5


