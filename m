Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAA4CDE005
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jNZIPicjbhTWqiH8QggWQnz7Ntv8N8jFEbB8QeyQbLg=; b=42dl4tBWV1giXh7EotcfM/FBFR
	NradCfCiXibBwHEUXM8wfw+6YUp68YPF4l1X+ho3AZfMF5CPfZI2HuzRjj839VQjT9KAGpJFdguSK
	kCWfCGFd2zkxJQHjLNU0I3chNodtMg87/lwL4VBv5I5zGHsjpwKBBiLHmbNkmZ3wQvCsjZ5XNTns/
	GrcV8Oft5xuIjnpYMAW6d1gL/r8MweWYnTa7jJg4syOalqNZAiFRIgbb5Sb02r8xj9Jeim7Scblkg
	z4Fqq7bXmkNbbwtPyyrdFyFjxNHFwDIGCaxNFi0hNmPjQzkLFoVw+Us50WYaCQXNbdH+zfpHJxFxC
	1Gbuk6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0g-00000008ZlX-2EEd;
	Thu, 25 Jun 2026 02:40:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0d-00000008ZkE-1kPh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:40:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c88b7c92577so704902a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 19:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355205; x=1782960005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNZIPicjbhTWqiH8QggWQnz7Ntv8N8jFEbB8QeyQbLg=;
        b=obOcpKlClJGQj5PBGIO86wmq2D6qPaCaEWzVGEAivyEIETsFWoJ+aUpZrArpVo1yLc
         +hlf898Oaw+r443grXYMOX9CUQpvW84PnD7H251LBtyvzBP37BW9aVeO01UXpPlFMvf+
         ONGi96TifgMJ2qNiCKJh+qM5QYoKIxjOTV2dLolx+HFniarbzaQhdK8SMVItcWcv5CzW
         Blr1UTyfGFIGWJV0eRaP1oi97LvcPdA238FWkp81bXCIyL5fx8d2Q8rrHO8j3zKSRwBP
         qD/kbcLBmtJXIjf6RxYseUYzoy0glCU1z32aNRKOWTiH3qjG2+I+Hx9URMGRWBk68dOT
         s3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355205; x=1782960005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNZIPicjbhTWqiH8QggWQnz7Ntv8N8jFEbB8QeyQbLg=;
        b=MkX/ZFCfZqocJ/qXJH16bSUlE4TBGIce52ql74tYDdOYDX7Acx37/fR+35tiSw0lNh
         bmAYhrw+RZMm4Wc9uqAq6PiEdkJgaNUCtFUGehx8TQQIrKKSjW7NQWtun24bSkv2Qs/r
         E3jjOJQbMr67sy+vZYFSD0emylJ4/qfuhvSxIZ6pOHYq8JCbFa9kH68699fzll8kL/9A
         C4sBCjauV3OuMXbVdcyZboNLyXnQD3LZ8AAU1tsABiMoujE5MGQeiO/YsQ7sIXpTUS5H
         8aB9sfwM+T+LXTfNw1SrX6tWDLKY7tCrOAsuqSYJcyVXkF68Zp7eFt3O38PBN0y9kyHG
         VLiA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6KPwLLscMg5KolHGz5SnDODU4zzJFVtsJMstObQQE6YR6ebpD9XUVJD9FK3/GqdFctodiBVIARm2KELu5x4Ge@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4hCsegtVp6Bq22FIIsa7Kbmq1h+h1yxgq7itb13YQ78OfmfHe
	AZaZL9sSJBwbf0b5jmkbKmX7CpJZojW7lJpdLYxIxd+qrYnX69j8bxwGPYCK6A==
X-Gm-Gg: AfdE7cktda8bISrpAx8G5RSal9mb7YnFdqAufj69NlpiSF72AfMDWnRDmpwMHajq8bi
	HLtl1tq9bFrP4HnhMxb5N0oq5roobSd+kie/adXasryC3Qv0u6iDKo6VSis2S01GzfDbxwayYoT
	nyku/uKyAaIaVHdagKq8zmyZMQxcWnfpyh9z+GH50m1XV5KmTQtQ/lwoJ1a+R8+aX+MPyEjlEF1
	74h7tz6Bep6QRIa+KuIKP90Pro122o9vWXitxy5fIAGMwhTfXvcbb6WVkKJ+cy6+Py59PUn3PeW
	r5Allx594w3pG2HCcw8LBTB1+oeSOEUkG2axhPrUwklIHPtBoAsn9/rjlMtVxZjLQ0Ai19ucIex
	Co83o6pL/zxf3UeM0gADRg/fN7KZgHeV7VCohSaenk4P508v9MNVWP6nAtf82HG+k1NT0Q9xxkE
	OVEjyo6TId/BeFsAQPko+QynN7sy1ftV4WMKSvFgjQ69aaMyoYM6S1o9pVXEoFWpxlioLmPmMNE
	g==
X-Received: by 2002:a17:903:2c5:b0:2c7:c4b8:60c2 with SMTP id d9443c01a7336-2c7fc798ecamr7218765ad.11.1782355205260;
        Wed, 24 Jun 2026 19:40:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:04 -0700 (PDT)
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
Subject: [PATCH v2 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Thu, 25 Jun 2026 10:39:54 +0800
Message-ID: <20260625023958.569299-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_194007_466952_AAE5C0EC 
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

  Patch 1 (new) adds simple-mfd support to the nuvoton,ma35d1-reset
  syscon binding.  The sys node needs to act as an MFD parent so that
  usb-phy@60 can be its DT child.  This patch is a prerequisite for
  patch 2 and has no functional impact on existing users of the syscon.

  Patch 2 updates the nuvoton,ma35d1-usb2-phy binding: the PHY node
  becomes a child of the syscon node (reg = <0x60 0x14>), nuvoton,sys
  phandle and clocks are removed, and #phy-cells changes from 0 to 1
  for per-port selection.  Optional nuvoton,rcalcode and
  nuvoton,oc-active-high properties are added.

  Patch 3 updates the MA35D1 DTS: sys gains simple-mfd, usb-phy@60 is
  added as a syscon child, and DWC2/EHCI0/EHCI1/OHCI0/OHCI1 nodes are
  added.  Board files enable the nodes and add pinctrl for the HSUSB
  signals (VBUSVLD, PWREN, OVC).

  Patch 4 extends phy-ma35d1-usb2.c: a loop creates two struct phy
  objects; a unified .init handles both ports with parametric register
  macros; clock management is removed (each controller gates its own
  clock); a read-only USB role switch is registered for PHY0 reporting
  the USB ID pin via PWRONOTP[16].

Changes since v1:

  - New patch 1: nuvoton,ma35d1-reset binding extended for simple-mfd
    and child node support; required as a prerequisite for the PHY
    binding which places usb-phy@60 as a syscon child.

  - Patch 2 (was patch 1): nuvoton,rcalcode description updated to
    clarify that both PHY entries are individually optional; example
    reg corrected from 4-cell to 2-cell format.

  - Patch 3 (was patch 2): ehci1 node address corrected to lowercase
    (401c0000).

  - Patch 4 (was patch 3): register definition section header comments
    added; HOST_READY and DEV_READY macro comments made more
    descriptive; ma35_role_switch_exit() added to the PHY provider
    registration error path to prevent a role switch leak.

Link: [1] https://lore.kernel.org/linux-phy/20260604101220.1092822-1-a0987203069@gmail.com/T/#t

Joey Lu (4):
  dt-bindings: reset: nuvoton,ma35d1-reset: add simple-mfd and child
    node support
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG
    support
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  62 +++-
 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |  13 +-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  68 ++++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 267 +++++++++++++-----
 6 files changed, 391 insertions(+), 91 deletions(-)

-- 
2.43.0


