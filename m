Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E89C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=; b=vALXpeaNaVqH52
	IPuhtdN4bYfOEuCSPzXvTxUL9mFONgrDOHdmav5pubYwQ5xjSvCSF1NN6iz+70rJLfsM5tEXRf9zI
	+vZ7x1OAUQf5HfviIqLP3BxjcUkzZdSW9aUlExBkFT/OBjrYwxs2FGFBTBmlYM8OKX/h6cp5Kvl9t
	MftkvrCrLD/6bkNywPjMuQ01gHfA4nUxl1lw6AZd35b1Z2zBltzdXgwBhMFB+8wd3rOXWl2CXAuN5
	Z6Vrs2FNoCWTL8p/xSDt/ca9re+ZNxyXFfG5P/7F8FJi9JgkIoA88XCRYVbFlTpifX9Ibi4blQul0
	hsZu3LyTr9gls2mJ8naw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YE8-0000000EQuf-433L;
	Fri, 18 Sep 2026 13:02:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YE6-0000000EQtY-1jh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:02:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so4449325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736518; x=1790341318; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=vlof4TFC7bgQ6SYPth7OZqzd44PhVUOOs2PSSGWaBSQY3OyuIrpz1lhQnP4M2BfUno
         i6eXX9aKdx1SCoKrcUzESWNfwwKMKOG2YbCw35DyrTSo1Q2GR5n/mf51tTk/Y2WA7DcN
         IZhwboqcTUFqBkMEPQphhfGSMTHPsreDcur7IITuP/RKm0wlEHLOs9fgsxDBJIr+pXa/
         YU+f9nXABtBXEEmq5/LPAauJAGAOyHLTzEV5ysd/Ifyb5Sd2wwL4BsrMns1hyMSOje96
         LkgWdp5UVadL2meC6MqEiCkZakkrNdWisg7Bf+5Bafl6xcFjyLii430I7XS68UFtiDZg
         kMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736518; x=1790341318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=deGuOo1bXJUAt99aWK3ag5Gepficqg2JnLFB3AchM8bkXHfEONuqs/Gbe7MbsNeVLf
         4HBOwewvsExC+rCjwFVrM/JWKApvHDp4sXc+D289ZVcvAwtnT+QvnOMcV4A73dVal28i
         fcZC4FGaMRHKAVSXi88NwBsAIdwB4PATB4LYXiIZO3JuLYjyzFbj2f6S8v3gHNfjwkxu
         bbi9K6f67T8F+p5D++s/5t6+utYeNuQjzQdPp9/LbyS6DEREcRPgIecKMvpOxE963ia2
         bsUtoCEV+QmDU5dsyMyzCdKD2lzvUhP4wG5BXWGyGxiwxpmAhLZEJwczmSZ9aydmsipT
         hNVw==
X-Forwarded-Encrypted: i=1; AKwUvBwCWiGAShLmbnVb13SxFfEBjwxmOwUKOx2zsbMdF5q98drkuD0Oa1lXq5pR/o4jxw+unYKFamNW9FQLPb7J/6f5@lists.infradead.org
X-Gm-Message-State: AFuF++n79FztTIjfMorc0e/9AsXEASgDW7ucdT5NTtZacBRk3MPIsnsg
	T5pD2bjX0QOCOe1BRwiX/+Qwz++7pD1+qDDUsDu/PEF+VVN2jzTy1yswWtOGMQtNB6g=
X-Gm-Gg: AYBFou3Kx2L/6ZnqXgK4QjzNq8Fp5TxWPRaUZLq+Q1uvE26PyQJUF0sOuGzCfuOFYxV
	ZERvUEE37qcn/YlB5j7e6fvfP/ntJUjY3oOuneUpBm7r6jdctW0ko2L/b0On2dq+hCnluMhxtUw
	ebqyUbtzgVjfnkxWDzwvGQLvI6B/N0fc98897YeHQUyYcxKQ4rskhAPEisHfIdVdNSMEuXUzo1N
	wB68Sd1PXcpu/3bzc8VgsvWMUMTU8DN5aO537DE/zkjGZda5WC2EMJJi5HlSPrK+l4GlHpp7sLn
	j14YUleLsrddMYS7eMXkJSayPjN7Ji49h6AQDSvnVy2ELrx3NIsJGDqZtlBxLxlbEi3mwqoaWGP
	zasDyuoy4Inu3DOOV3b+J4lgaGedzB9U6hk7EFSF4+uHHZMEUoKojlI+n/eB+6Ahu1z7dJUyYKz
	4E7DjjcCcg8pzU6Z7AHRNTTJVOpnyDzuRag4HPxUByNyWlBpVhsxErw9iR6GrQQnIAhdmiwoYTe
	WvO+BkTd5TuO6d3vm91+osj5A==
X-Received: by 2002:a05:600c:8b21:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fc574f001mr30144785e9.18.1789736518421;
        Fri, 18 Sep 2026 06:01:58 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:57 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/2] i2c: use designated initializers for acpi_device_id
Date: Fri, 18 Sep 2026 14:01:49 +0100
Message-Id: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD02rWoC/yXMQQ5AMBCF4avIrDVpSxRXEYsaU8YCaRGJuLti+
 SX/excE8kwB6uQCTwcHXuYIlSaAo50HEtxHg5a6kJUywuLKgjWKXFUlllnvjCGI+erJ8fldNe3
 vsHcT4fbu4b4fJiVLhWwAAAA=
X-Change-ID: 20260917-acpi-i2c-4198c83df77e
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=3020;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=JzY7qCjsMGCCDrnykYP+j+8saSrI+L+fwV77wWEiOrQ=;
 b=IDSzYBmue84R08QroUyy3NH/AxpYxihKb9K2xhN1QPp93+Ogye+hBhK4mHIOdf1zDUyhK9Zvj
 Ey74QzEBKIGB05J6xZ7TUIbv5ZKaL/sgYUsp72oIXBPUQ/meroTQnXV
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_060202_831404_77B8A6F4 
X-CRM114-Status: GOOD (  14.05  )
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

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc3.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (2):
      i2c: i2c-core-acpi: use named initializers for acpi_device_id
      i2c: busses: use named initializers for acpi_device_id

 drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------
 drivers/i2c/busses/i2c-gpio.c               |  2 +-
 drivers/i2c/busses/i2c-hisi.c               |  2 +-
 drivers/i2c/busses/i2c-imx.c                |  2 +-
 drivers/i2c/busses/i2c-ls2x.c               |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c              |  8 +++---
 drivers/i2c/busses/i2c-qcom-geni.c          |  4 +--
 drivers/i2c/busses/i2c-qup.c                |  2 +-
 drivers/i2c/busses/i2c-scmi.c               |  8 +++---
 drivers/i2c/busses/i2c-synquacer.c          |  4 +--
 drivers/i2c/busses/i2c-tegra.c              |  8 +++---
 drivers/i2c/busses/i2c-usbio.c              | 12 ++++-----
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c     |  2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c      |  6 ++---
 drivers/i2c/busses/i2c-xlp9xx.c             |  6 ++---
 drivers/i2c/i2c-core-acpi.c                 | 14 +++++-----
 19 files changed, 65 insertions(+), 65 deletions(-)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260917-acpi-i2c-4198c83df77e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


