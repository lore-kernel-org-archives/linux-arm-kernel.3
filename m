Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF57CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fxO3SIwr8zcTEZ8tP4gC3esK2bDmRkRY2LStbTjG76k=; b=s7U2i5PH/LBaKv/NJQXU75G1OD
	BtYY1QhunAdSl481oyXQ4rROtoHbhCepOfrYU9uzFDSJcO7+Z47FYd71lgjT6rgGOHxyhKYMWAPhe
	gwO63yhRtftL6Ab9fe63ns1uC004Bdhhehh+JGxkO3DkQDRCI/G86hStehkgReuCIGSec+DYFdAmE
	HZpFypISb2x3wRqH/slK6HlMNy5+qX3X68Jj3bay/arEuRsL3kwedyr+8z4FnwUE9g8T0PWoj2MIG
	Z6hcvcMsL/A+yGhNnEw/7ovspfopufra0kvqd+12AuV1DpQ/cZ+wRVhghJYTp5C1P/bDmHor2bq0i
	2hbXqnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CJ-0000000DdyL-1Y2V;
	Mon, 15 Jun 2026 05:49:23 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CG-0000000Ddx8-0eTn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:49:21 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1363fe80fe8so4117517c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 22:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502559; x=1782107359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxO3SIwr8zcTEZ8tP4gC3esK2bDmRkRY2LStbTjG76k=;
        b=Udc/At7hfOaFGKyK2+xl9VIgqlNl6VPtn5KIr/KsVxPtS6nO6rmnnYnV/qWRnq2aRD
         OqNz+1xv36Sa5fSWsGcbziDBt/Vfqy9IDWcIE/MiHObJTGgPvqXeAcptvjFcWd6s9UZK
         SHXBjS/akMkZpZdfkB+uwsQp2G3gNO55OtBsejVodVl96YKh90hRnJGztXgPBmZvBgk0
         tsJZV370vaDoTu5FKXFC93GoEbggh5nNrvBIJuIRTWn3PxLv+1hXrh1RcowhKfekdQdp
         16s5LgcLVPi9Dvc/6GHZCFckCi1cV7u6NcF11VBodZFM4Zmoh9fyO6FMFuFZbkjoGfGW
         J9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502559; x=1782107359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxO3SIwr8zcTEZ8tP4gC3esK2bDmRkRY2LStbTjG76k=;
        b=V0XJ28iZ15cdKgmpBghyCnhWETkrzDnzmTP1XdC8sbZngyhH7oTO0/dLik4QmtXGFQ
         166rNFTeG98rxUgQ9GZcVtx5miAP7i5uCv1kLr/qt5fmMHDxLHuLBARXbHbywPmPF0N8
         SfJaPdtbJtUZa5NoUNVxsOD+1pxA9OwYWyJy/+QACftuNqAohDav3GUzPvG0mtkS+sIu
         DW7wRDcXoQ6YoZWCRd9Tgg256dFV5eOkrz+Gd58gnlMm7bTPRmaUH0VPeTtvSEuzTisR
         MSMtDr7fGqGQmSGWbvxVEOTb/rH/vjOyBfCZJ620pFWoXpVIcd5ZeALkE15ddY5tq41O
         ELeg==
X-Forwarded-Encrypted: i=1; AFNElJ84bKqrqwLCLKvDgtVcxUetR5PPNVigmFJA5wfAsxd458zyzEpak094njhOIfsYRRR+LDl6ZBWNK8ClhuEP7pGy@lists.infradead.org
X-Gm-Message-State: AOJu0YyvHjrhQv2y4vn8eZYrRks6e9n66+Y5GcVsUU17JIenKC9tWYG2
	506hXt80ngAIav1P+NNWlQH5rLYMKU4lq6XKgC8+GTOdbG0m4EQW0vBZ
X-Gm-Gg: Acq92OHy8BwHIcvY9DwM17ZECEyC9H4QMiG1Iq5LXVt9WiMOIueVzugRksLQOALLJDg
	qm7Nga6YkEmFYphCI/JAuRIlugiQ3MlCwQRairr15O3ZDWwToaA0Ks0+aZQgWQopP0PXBOZuETB
	kVpc8stG2zIpnaMc75fK+rfVgM5+wO6pEGnvB1el4UWCdOECmvd4vqk9NEX0CDdzV7Xvuxf1YuM
	p9PiezUa3LNcaEcRG9ATWl0ehBEzwwxKQtrX5BeoEKo3oGJOTwrpbyZUPH1XgOqptvzkaNnowYI
	vALDrSDFPS0mkR4j6K9F3csXMVJ3QwliF3ML5p7IF8ilAozJSPCVKTNu5h3RaW/hITBwpcFQP0/
	huxe41SzlkeOMpe8Iz4u/PXW7gQh8E405a8PrjOwltDeaCcKCKZrVHpUIGRZGbgaXjHIXFntYCQ
	n2vUWtlleQV5XvxpDR62KIZnv3Xe1yKQ2Ei8btb/LJnOVt52kD9i8KFR+ynwu5fLiV37CkrT+9K
	BwkL4K+zLhf
X-Received: by 2002:a05:7300:7496:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-308200c4e8emr6796107eec.32.1781502558263;
        Sun, 14 Jun 2026 22:49:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:17 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 15 Jun 2026 13:49:08 +0800
Message-ID: <20260615054911.48821-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_224920_212516_0DF90DEB 
X-CRM114-Status: GOOD (  11.72  )
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

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

A previous series [1] added a separate phy-ma35d1-otg.c driver for this.
Following reviewer suggestion to reuse the existing phy-ma35d1-usb2.c
driver rather than introduce a new one, that series has been dropped and
this series instead extends the existing driver.

Changes in this series:

  Patch 1 updates the nuvoton,ma35d1-usb2-phy binding: the PHY node
  becomes a child of the syscon node (reg = <0x60 0x14>), nuvoton,sys
  phandle and clocks are removed, and #phy-cells changes from 0 to 1
  for per-port selection.  Optional nuvoton,rcalcode and
  nuvoton,oc-active-high properties are added.

  Patch 2 updates the MA35D1 DTS: sys gains simple-mfd, usb-phy@60 is
  added as a syscon child, and DWC2/EHCI0/EHCI1/OHCI0/OHCI1 nodes are
  added.  Board files enable the nodes and add HSUSB pinctrl.

  Patch 3 extends phy-ma35d1-usb2.c: a loop creates two struct phy
  objects; a unified .init handles both ports with parametric register
  macros; clock management is removed (each controller gates its own
  clock); a read-only USB role switch is registered for PHY0 reporting
  the USB ID pin via PWRONOTP[16].

Link: [1] https://lore.kernel.org/linux-phy/20260604101220.1092822-1-a0987203069@gmail.com/T/#t

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG
    support
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  67 +++--
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  68 ++++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 263 +++++++++++++-----
 5 files changed, 378 insertions(+), 92 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.43.0


