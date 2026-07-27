Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC3C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OICCS3yLJZnEdkP0xlPeHb8B7fyLwNgxSSOf4ztj6D8=; b=sL2LD8rLQ5H4qX
	+QC+d1uZN/Xeho7kx5Yhy8OYcS5p10mP7JHKn8kh/62irWypG/Jp2/4aefglXAYbwgpitNw25dD54
	Hx9qpywJpcavAO463LZ7KjS9UMRtIHevCzXj7eXLSWObB3J1PUH8b/KT5OmrbHpkyMsV3Gj9KNQBE
	G3WNvPch1p0COfFurd6mgTklxDzcHDaGkBZCJz4gaGhqaDLNUi7jdUcSv2Ti1mJs8ecQRt/zflPeZ
	FCgt+hZuzIj+UocVk7Heg5rLAaIe/76+KCTLfDXavDJbn4Mh7yq5JykGLfrGsDQsRCsEHXmm9uQEY
	1P0CKVncu7KHaVVktjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAe-00000002dNg-22Vc;
	Mon, 27 Jul 2026 12:11:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAb-00000002dMY-1QVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:10:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493f75f7172so22819495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154254; x=1785759054; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OICCS3yLJZnEdkP0xlPeHb8B7fyLwNgxSSOf4ztj6D8=;
        b=TuVDVaVpBMTCNmM0k8D4LHlgKhosYzF0JmIYL998Enbvt3HsVtvHLCrTL9EepXS1lE
         NxAdtZLlCMpYHcT9MlFackM2CajIg8F5fjGjUCfgbXGQ8ic++5b6qB1YFQWZY1M2jEK2
         LYkhSTNm1xR733Ac12sYxp3G9ptwb2qs7Z32QIhPVcdr0VS52zdr21vyUHvTHRVDyojE
         ZnbWvi55pqtJ5XPuOmQHHJMdRLQCV2mCta6ZkloaHrMHX4RqL6R+mtCsOfHyPZ27gn8o
         MaV4lXpps7KXzksN6SitAaAJo1FVCLixAWRwVjx9KSa232m10BkNpqbNn67AkQmt8HaR
         OdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154254; x=1785759054;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OICCS3yLJZnEdkP0xlPeHb8B7fyLwNgxSSOf4ztj6D8=;
        b=XOX1VMZogUeE6aRSF5k8OpdQh653MUMzOugkI/ZZh54Aymano4X4DzEVk67+Bafpqi
         r5BgOyapY/xDnHOm7slw4SFDxCAVQk4NLUE7BIe14s5d8l/zTGlMWUAVLQdjaEY0yupN
         4WWnA8Y3SC4FKGdodj/sofBoHUJp/wvkfEgxvkkIKIod52cvUGPgryfdae6SMB6CVyQO
         MPr7QTMOJJgv6P9959HniGk1xjlBjmMlf7mopxDwgdp3kC0Gm2lCw3SAyiqPEs6+rnEq
         0ATFUWmtXgpc83t8nX8SJetE8Evhk5e70ZySjkoztRRIkIar3HVWfSWNM59BVtlUHrd7
         3ZmA==
X-Forwarded-Encrypted: i=1; AHgh+Rprb+D4SKnENoZbMGZaCzKy2RsjEgq3axGWHUTfhBVy6NjjL0NNCjw8oVeJ9gTOAf6VRkPdWWiDbqJfBRLnydCq@lists.infradead.org
X-Gm-Message-State: AOJu0YwqDpdHZp29+NLvTME8iTOFLHNqb21spyYNrrCglYGkaYmnvzy0
	pbF4wg/p/xgGf6bGIcX3gE6IFUOzZj6JRoNS8Zlri85gR82M6wY1JIMSLU7sxFSH4L8=
X-Gm-Gg: AR+sD13iPnCaGM6dPxBiL1TIofo2/BDvADQbe9U+Nm35MekbC2HSQhgyoTYJuwcwOID
	K4hsZmjxRVq5bZQMVIE1R2LzG7ZvMpEJY7vuzWvX1J71x3ZPOclh2yA9XhZ5oeNPp5dt+qeSg/R
	ebQT7yYyeHMs+m1Kecf7OkoRmLdlFUI8ZuLj9Xq7PETz/ZBA16DiVE0iAwRDX6tEKrPNSua1hkc
	f1HH2PZinV3wQAZQBLKQ5GdblJxdpj0caR//U5HySA0ualdqy7p367HCjlIylkiVkwI1lEYJuju
	IlvgnQ5VxLq1bVcm3gIX7EcV6ErFOYM7b0dSjNQZI8WM8MCim0sylislFUtdjXmGSCuAT1E84tr
	l+uL2Kp73DVPXJ9bMyLBmPUckkX506pFNu6Qg0WVMGUSAGZfGRelZaRxhxJoWPhlWAZOueAVuZH
	H/yPTU5a0EW+XBADxkX8w=
X-Received: by 2002:a05:600c:1d0d:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-496b56bbc2fmr104042095e9.5.1785154253954;
        Mon, 27 Jul 2026 05:10:53 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:10:53 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/9] ACPI: use named initializers for acpi_device_id
Date: Mon, 27 Jul 2026 13:10:38 +0100
Message-Id: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL5KZ2oC/yXMQQ5AMBCF4avIrDWp0ZC4iljUmDIWSItIpHdXL
 L+8vP+GwF44QJPd4PmUIOuSUOQZ0GSXkZUMyYAaK12jUZY2UZ6dpX31yhl2hM4Y1CWkz5YWub5
 e2/0ORz8z7W8EYnwAYK3YLnEAAAA=
X-Change-ID: 20260724-acpi-refactor-f4efc2f44203
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nvdimm@lists.linux.dev, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=4122;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=hDpi+mS6ZesLKap0n94a9xm6h6ixQ5Klrug46U51A7M=;
 b=1200lUbaXeYWmclYJpq+b23CZR3Ejwn2Uth0/1cJecdaSViFrJz967y3swrowZIlhRNa0QRbk
 uGqRtfo1UCABz+VPUBqhAMuHJcnRcILUfp89Qu2pEPZ37OLyiygqmoj
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051057_657494_097B6BF5 
X-CRM114-Status: GOOD (  14.42  )
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

This series is converting lists that contain the acpi_device_id 
struct, which is defined in the include/linux/device-id/acpi.h 
to makes use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous 
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (as most of the existing casts are gone), 
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first. I already have patches that implement this and touching
a lot of kernel subsystmes that use the acpi_device_id struct and that list
keeps on growing. Therefore, I have decided to split the series per every
subsystem into:
- pre-clean-ups that convert the lists to use named initializers
- actual implementations that make some of the modules use the new driver_data_ptr

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on arm64 and x86-64 in Yocto on 7.2-rc5

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (The Capable Hub) (9):
      ACPI: use a named initializer for acpi_device_id
      ACPI: drop unused assignment of acpi_device_id::driver_data
      ACPI: pci: drop unused assignment of acpi_device_id::driver_data
      ACPI: ghes-nvidia: use a named initializer for acpi_device_id::id
      ACPI: amba: drop unused assignment of acpi_device_id::driver_data
      ACPI: dptf: drop unused assignment of acpi_device_id::driver_data
      ACPI: nfit: core: drop unused assignment of acpi_device_id::driver_data
      ACPI: x86: use a named initializer for acpi_device_id::id
      ACPI: use a named initializer for acpi_device_id::id

 drivers/acpi/ac.c                 |   4 +-
 drivers/acpi/acpi_apd.c           |  42 ++--
 drivers/acpi/acpi_memhotplug.c    |   4 +-
 drivers/acpi/acpi_pad.c           |   4 +-
 drivers/acpi/acpi_platform.c      |  13 +-
 drivers/acpi/acpi_pnp.c           | 514 +++++++++++++++++++-------------------
 drivers/acpi/acpi_processor.c     |   8 +-
 drivers/acpi/acpi_tad.c           |   4 +-
 drivers/acpi/acpi_video.c         |   2 +-
 drivers/acpi/apei/ghes-nvidia.c   |   2 +-
 drivers/acpi/arm64/amba.c         |   6 +-
 drivers/acpi/battery.c            |   8 +-
 drivers/acpi/button.c             |  12 +-
 drivers/acpi/container.c          |   8 +-
 drivers/acpi/dptf/dptf_pch_fivr.c |  14 +-
 drivers/acpi/dptf/dptf_power.c    |  38 +--
 drivers/acpi/ec.c                 |   6 +-
 drivers/acpi/evged.c              |   4 +-
 drivers/acpi/fan_core.c           |   2 +-
 drivers/acpi/hed.c                |   4 +-
 drivers/acpi/nfit/core.c          |   4 +-
 drivers/acpi/pci_link.c           |   4 +-
 drivers/acpi/pci_root.c           |   4 +-
 drivers/acpi/pfr_telemetry.c      |   4 +-
 drivers/acpi/pfr_update.c         |   4 +-
 drivers/acpi/processor_driver.c   |   6 +-
 drivers/acpi/sbs.c                |   4 +-
 drivers/acpi/sbshc.c              |   6 +-
 drivers/acpi/scan.c               |  46 ++--
 drivers/acpi/thermal.c            |   4 +-
 drivers/acpi/tiny-power-button.c  |   6 +-
 drivers/acpi/video_detect.c       |   4 +-
 drivers/acpi/x86/cmos_rtc.c       |   2 +-
 drivers/acpi/x86/lpss.c           |  54 ++--
 drivers/acpi/x86/s2idle.c         |  14 +-
 drivers/acpi/x86/utils.c          |  16 +-
 include/linux/acpi.h              |   8 +-
 37 files changed, 443 insertions(+), 446 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-acpi-refactor-f4efc2f44203

Best regards,
--  
Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>


