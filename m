Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90217C79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nL4d6aFEfv8KmOGv5PZG8XQQu0qz+kYwSNFh+zYXjxk=; b=PT1sCEXfzxRj12
	wCYRCO9NPsmdgyrL3odytlYJ8j4xuEdLMomfrayjJgZy7BIxIoFDiMFgx96iRFK49BpNuKcZE+I2j
	DKveZWFiLINk/InXhRmImgMZ3MKd0O43V78d9r2uzeFuGFuyKEzfSIrUCMBS+u9wvJc7d6/7IyPH0
	DKSPSANGbPXh/jtRoyR1dNS9v9dxgLaOu7ZySRr7e+6hPqiMO6SjcYn60d+Mi7S5wFaPfFmxFFMnL
	zk6ryPEDDqrQZ1SQ/9fc2fN4TsOk8GugrJQWaSyw4KTK6tMENZNleP1HjhIMKcs5lemXWw94vXn99
	twl43b5lotNsrFCSIaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6o-0000000788Z-3rPR;
	Mon, 07 Sep 2026 15:18:10 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6j-00000007873-1WdL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:18:08 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso2940270eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794284; x=1789399084; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nL4d6aFEfv8KmOGv5PZG8XQQu0qz+kYwSNFh+zYXjxk=;
        b=zYNSPaXiL5DZ2n81Vem7pn2hjZUzDAo76DIPKoUztww4yNbmSkaqJi8npajrr1ZMQo
         38VD8B6hqlZMtUA0hcRDX+VRbLWQNJATgTE9GPQmVNNRSdl7KQp0G9qqpH4HjmHJSHpn
         PvvQaSrArSXQX7sWDRgSZ2hYw/uztsaU1jShrUS53OnzTZdYS2zZD3Xtp0kK3RYgDmDl
         pqgcyK6FYC992z4K6VN59x9hEKNeQcP4b8k5mSpqN0qHn/eHhFS6Vae+gBj1FGRLqGh4
         dik9HAwPDk9EZRJ2NynTmpH9thxFikUdkpac3QGbVOL0pvYn6N5w6mgQQAD6oqmo6aVO
         X7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794284; x=1789399084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nL4d6aFEfv8KmOGv5PZG8XQQu0qz+kYwSNFh+zYXjxk=;
        b=nXUYwdKXQtD292cDrDgx3KUsFqIw/c0CNiJ20kteWa1C0sFZKVVzsInmZycgyF13D7
         p2iGqN7Hi8JvvqVoUSCxj28BbcVRcf8QzPWtWQyI7jYD9xDnlGQjPtFOL3dK6ZWgmpiU
         1AATSxoAQO2NwVz9bCNS+90MyH1lzYgWx5TnQSiJPAAV20p3r37AfVPn7XT9ReYG/BJ6
         NvCjHiH+eKenptGHkzL/TXaZlnOG/MJIBKWYkwxatQpFjha0U7vzKI22jJb2JFzze4X4
         NqZRDdx9pCMqDjXRDLRSmvv9sJ46Ks+WpC9DFhz2EMw0sghNXFmFm2YppbyFsxP1zMoW
         Ls/w==
X-Forwarded-Encrypted: i=1; AKwUvBwH/dDwy2yTTFUtf0dpQmxEOxr0jHbTJOqacnMjg43cOKUtRXk+UQ62OIOMxNkzHWEo3yqosVwpE0/dWKe5rBYP@lists.infradead.org
X-Gm-Message-State: AFuF++mosc2JKm1BoweSktx/6zmiBGXiWKfv6TG9p56XekbNjYcoIbQ6
	iDisxGGS6x/osAzoDaUSF0Yg2RmVO32CgGVMwhEgx/sAjvs2BAALrxrlOBpfQmC2hhE=
X-Gm-Gg: AYBFou1k9T2T2QkwJ0OFrRA5HbJilhMxvcJYDVg96cVrGcMOVgEvY02O6EUHQxt27u/
	hGGq+L4ghkSJsiWv2Iu7ceQlGzBFhfOv4A839A5eVL4EBExrRFVVUt+Tw9XsfeEtkYm8gTga3xI
	i4mWgHpeEfdVDjR9oNhXMYbB98iHiFti54+LyNQJAnWTo5sUi+LlJsMi1THlYwueS/giUF8aSlX
	61RlQDTkOC/xmmIYegSdHKaOnxY947hFFZMVp0SpSUHGOcHHO+rKZoCrNSJpYHJnxXsOAjFo8tc
	2bUM4UUwr+6u3Io3cq84SWMnA+LorKK/4tHY2+YMVvm7I7SexWyTlPH1bMQxyfiQt0ZHOtXVFmP
	X3FY9NGhFFH+Z71Nx6Ja94QHba2GceoLBDUv/4W7xZ2l9T/ZU44l+hciKniRPQJvtYU1mS5/XVb
	Ym6K7WKw+4RYlFBCAcfRf/+oGNVTCKWpKRUBwPBPO9asJkBUmk9SX1eYCn4+PvUKT1WZ5XfyBHj
	xBIiw==
X-Received: by 2002:a05:6820:179b:b0:6b6:b5c8:7432 with SMTP id 006d021491bc7-6b6fd1cab2amr15396165eaf.33.1788794284261;
        Mon, 07 Sep 2026 08:18:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/4] dma: use designated initializers for acpi_device_id
Date: Mon, 07 Sep 2026 16:17:42 +0100
Message-Id: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbVnmoC/22NwQ6DIBAFf8XsuRiklKQ99T+MB4RVtk3BgJo2h
 n8v2muPk8ybt0HCSJjgVm0QcaVEwRcQpwqM035ERrYwCC4Uv3LJtJmI2ZdmiI22VvYaJULRp4g
 DvY9U2/04Lf0Dzbzvd8NRmkP8HF9rs3t/smvDOOODMeps1aX077PDMQQ7oR8X8rUJ9fKELuf8B
 SmmaE29AAAA
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=2877;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wi3N23N9BdZtUoN9NWpI/GnFso98egox1jks3c5pCJ8=;
 b=6u7XMl18GxIGtzGX7ctGJC+yePbveKR/UO9155kGs9pCUoaPrpf2OJhQbgWyAoctwtsI4F2Q1
 HYkg8tfJdgMCDT/zVVrInKU7RmRSO6B7uettbQQZNDQ8JNcHZ/4DyxX
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081805_658674_53F505AF 
X-CRM114-Status: GOOD (  14.70  )
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

Tested builds on x86-64 and a64 in Yocto using 7.3-rc2.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Changes in v2:
- Tidy up messages and wrapped at 75 chars; added Reviewed-bys from V1.
- Link to v1: https://patch.msgid.link/20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk

To: Viresh Kumar <vireshk@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
To: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org

---
Pawel Zalewski (4):
      dma: dw: use designated initializers for acpi_device_id
      dma: loongson:  use named initializers for acpi_device_id
      dma: qcom: use named initializers for acpi_device_id
      dma: xgene-dmac: use named initializers for acpi_device_id

 drivers/dma/dw/platform.c                    | 12 ++++++------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c |  4 ++--
 drivers/dma/qcom/hidma.c                     |  8 ++++----
 drivers/dma/xgene-dma.c                      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


