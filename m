Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AAFC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+rs87giGtrtA7Nu//5GihDsoyXZxcEFLrmWczq7+IcM=; b=rjv63swDYgGyYZ
	TAwY0397mvIg3mtmi3xSwh6MdiASVqAmjLTQDuXsHk99byCI3l7TddDZSp5wZ7jqKMypO6P68i04x
	NdzIELO66Scc5RNRKXDrfJtwPdaZ16x7BfGGssarSfsYmhA4audcWNORIBo/N17T1r7aqSRqG7viV
	rQUn8x4h6RYmrSQ9WcHKiPhJTbJF4hcSq1L1R1r56sYzqCXMFR3vTsI7BJNEYBQ3aj0FR35czCwzt
	Qcr6BtUwijFMftlaBB/gbwJUYut7volCX7KyMInEYun83Pl469OWsWrLGAJ2PzMXBFMywqfLk4aYt
	413/6ed6rB5d1lzoErOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ud0-00000002L3X-45Iv;
	Fri, 04 Sep 2026 14:10:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ucx-00000002L1s-0eXn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:10:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b8687630fso9657995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531044; x=1789135844; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+rs87giGtrtA7Nu//5GihDsoyXZxcEFLrmWczq7+IcM=;
        b=fhjygv0bYpOtd8UptUhSZVo4WH/5ecSVFJ82Bj+BVf6Sjh6hjpRBDtCuT6YPWgsGQz
         zncsO3Nabgck6oSMCOFKTH6woOriZfJsjaVNgHctJ/r9KZpMlArQZ3wm/LTtNLJl6e21
         n4wsQitpRftBjYCCcis5jYoDoHUIgQkFeTy9FXdKyBl2QPRwhCYt5GSj8s0o1MYQt+WU
         wIPiWrt3Z2SdNaXUyQQSxF811voQpMwLHFHX3tTQR3BHO+lpqRgRe3XzWq8WDP/CM3z4
         /vOc3gWmDQC+ap3Vu3PhavTyhK5qMTu5VNWUB1B2YTGsFjOp6E7o+DLXtUM9RLTLBMSn
         JaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531044; x=1789135844;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rs87giGtrtA7Nu//5GihDsoyXZxcEFLrmWczq7+IcM=;
        b=KVCugM5s0vph+uTyDYH4vpF3aZhzaqxbOMrGCSzN7J42z3grmm6PWab5wKQVCUw8o2
         5Qhqc7WHpHUPLMc1aG2sX4pUKeljN+e4D4dHzuDrdY4mlLxi1KDdKv+HOssV5ZiABWJe
         qAqN+LqEFIdr7yIOWVFHBfnWjPgdPUZ0vLNbEW+JESDT1TB144LcvQ+/wWfrYNXFA2KQ
         lx1z9VvFbf+RyD1b+JYCSZMijyG8StE6tjZ9tSpgJP18gxBy/y8gzRn492QuXhLVoeBR
         tp1QoZyJjFIeGHOrn1O6BVE1+myI94ZQt1po2FcNHFQ6G911XBYOBlG3jNvmm8p8XdUP
         ySoA==
X-Forwarded-Encrypted: i=1; AKwUvBz7X3qQiOgNmSYDE0rJFhd+9YKaSC2mXj8lnzcW0bdvs+RPr4seD2pCEd/gyieXuiSmpkkn/IN0xGWY566gIPIE@lists.infradead.org
X-Gm-Message-State: AFuF++lizCx19fnhPyTsLIUsUKR4+95KQA8QZn2JGEn/aJ7hM4h8m5cD
	WeGneJ5mNwHLK/5FRQz7FYmYfwML9MEduF2Z1ImTDnxCccLrE9xx4JugDQuYOTQyveJu7vVSgWG
	uKkpJ
X-Gm-Gg: AYBFou2l5GysRGC416+c/qhQ1szT88YhoKPKkZQ0VDxebmVUHnKm33pKbG3+HzYEp5n
	m/OYXegVhRieDufzNgb5I+03wGp/d/YS0hI6IBTqlZn9XRwmahdJJ0PrWc5XjWOpS2/AEJjKFTx
	TceqXHc4gFiaJ52ATB0xiPlQa8eHyTHlfVF+bhbQf3DJAGzLP3oHiZ8vxd9SYK0M++sN+4STHgY
	wbOJtTXDbIvAYHCau4UdQ3yhZKdEGlHIeUUPnAHFM8zBUWutNWq9pqUj2a0EPuJtqCO/sg/Se+j
	8BzlMKwrgurBFlomNfO1R1lzOLKyGTyjxEc4WmsqJOfxMylpZP/r/Ol+803MTDkjfBbuStr1SVM
	U2iGudFmNV/8/vK731VZUqWRqcoDc7m6IWHnswRzjGwPFY3pS8JfjX951s95sWOMzSsyI7pKlqU
	oAfbhgFA95OmSHPJ5opBuv+BvtzLG7QSnzPf2lH7HydcJjQUX/hWFg8Ah2d/ehYpdo7g2CW+1W/
	b1ftLhy9DGL6fFgxw==
X-Received: by 2002:a05:600d:4444:20b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49cfa21e8c9mr34503535e9.32.1788531044605;
        Fri, 04 Sep 2026 07:10:44 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/4] dma: use designated initializers for acpi_device_id
Date: Fri, 04 Sep 2026 15:10:39 +0100
Message-Id: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/RmmoC/yXM2wpAQBSF4VfRvjY1NCleRS62mYWtHJpBSt7d4
 PKrf62LArwgUJVc5HFIkGWOyNKE7MBzDyUumnKdF7rURrFdRbmJFZCxc6ZlGFDMV49Ozu+qbn6
 HvR1ht3dP9/0AT8D1+2wAAAA=
X-Change-ID: 20260904-acpi-dma-ee1add4bae4e
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=2276;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=WoGxKQtaMdpz6ytvKsd+KXI4ZRtFdZIJSYBDoyqhR+M=;
 b=7A+R3AT74CdIvV1dVbqRguBpZmTmoVxmQ3VzvPDqtx7Rgu1sy2KY0B/p5GEqsanSBi/OemXWT
 gPNFVt+YWucCtkXDg3whdE9X+aqYResolXCQOxp3GmS3ZORWGf25gjd
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071047_675231_91E972C7 
X-CRM114-Status: GOOD (  13.18  )
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
to make use of named initializers (which they do not use currently).
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
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers (this series)
- actual implementations that make some of the modules use the new driver_data_ptr

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc1.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-acpi-dma-ee1add4bae4e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


