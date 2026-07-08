Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54885C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EcTCzAOxZhd2+yZYHcQy1edub3AeT6RA/ghrUBqO+Sc=; b=Q3NqMm6q/Lkiarm504fntQBsC4
	54/cAZ+owAgPCmYdEgQdFEwRbQ2ObgNTAP9O0P0UF3JR1rWb1TojedbUwGX4aF3y1CaFaEXrfH6zz
	xpQ3pCzVxAfbIFmQrifj0FCjx3FzicZcnBPGwdWq03Qj/6ttkRTbPZGaAQSu5jc2aKuNHwa0doHVM
	dBRgTcc8vu3fHJtsMDMiEgEtS180F7FkxsMPyGMYVZk3BvIXHVzNh75gieec97ZBKg9J4fYefIvzk
	t8T60QxZUS4Ab6eabwqver6O/BYeEFjoptHrlPqB11B5Uqq2kD54UJ/UUJKgsrGMrhkKqhs7A+WCq
	eX3II6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdY-0000000Guql-2a3F;
	Wed, 08 Jul 2026 10:36:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPdW-0000000Gupa-25l0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:36:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c7cfa17fedso5825795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506973; x=1784111773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcTCzAOxZhd2+yZYHcQy1edub3AeT6RA/ghrUBqO+Sc=;
        b=Q4w2jvs+7IxwtC2Eui6hywOKeMIHtE/Q+h+Jw7gD4A9GOuCWFE5eruJkAJeJ1zDKrf
         xRNfSKeFFegxYucX3lwNieHDhmfvYHaxsVQWuiK4PW58taI9U7Tj2UPiOqZ/I/tPaGGu
         UC16UWQ/KJhrLNQ7/etixnXh4IjtHdZlMoGIM3Pr1kE6vGPg606Pszdxau4uclmPYb7Y
         jsq9I9yNDhbrsYcdnJ3GhkyB65X+jFwI5Ait0HsBt6sZEAvMNwQYI8oAQK8QL7ezrypM
         fZT95NqY2X5Nzcxrw2ADi1RxeBEnseaLHHepMtP0sw9otykrnQYYd0sYoZ8Mh2bDFduY
         AlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506973; x=1784111773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcTCzAOxZhd2+yZYHcQy1edub3AeT6RA/ghrUBqO+Sc=;
        b=N0I4xfeu0Nb06xDoXHfpA91sgwc742N+qFNDVwz37XtZUVmSTQSpOGeRUrvaZfDarB
         I5afrNe9mmh+f5IIG8VekXYYTLPU8YZZ0ma67BUIJjUKuu2bsLO1zsm7hfV/Ak7tpqPg
         OZZFScJMUgpggRBt7nupiFwFd2zqZUMHXgJnGjnovbCoE7l+yrcaRHjgR1MVRODsa+4t
         /uIFoQnSej2VhzF+9EXC45MIZ3b0CBBqjo8lM+MCyUgsF80gTI05E/EmjPLnfK8HyYiM
         JwX0/IB+SaP8YeSSDR0XPKUCLIw8G74A/732vTYtZLn5mDGbWCIiQcYqbOfsFRBtCVg6
         0DiA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/xhiIRe1nYixv1D7eNv6kzhqCqUwKYYP86G8GnxKx6IvJB+i7KscHap8oxxCV8PFi8B3dKC/SF/JdxMGYGLx+@lists.infradead.org
X-Gm-Message-State: AOJu0YwLT2WNOiZD1ezIXvETO2cR7xFPUgGTXugRw4JF52E5+fdzM0lA
	v8ekI9sMnwwVjN3KILDcVU2Yh9+ViEKtM/BKzgg5eauGV/ADktLOCcTc
X-Gm-Gg: AfdE7clIKfrvCJo6qyGY4IkLGxSJbWnybdalAgGtrUdvLQHucLH0BDju4cpATaJsilx
	wegB9nh8yuIDjoswI81NYZx3oSboatODcXOygiMz7y4ZlbotDQ9+jeeVrstblAJ/gcoYAjZmf+9
	XEoV75Sk77UWjMRXbt91QGgxsAK+ETlh8A5RON9qeS/O4+8W5dcvW0PDI2y+RR9453LT13bDjWR
	ig2zmHpNGlhRD5qyCOItqx4cwpInVybtkfT6osqwgKzCC+2e/rIiHYhP+xOGNdPpiLdYtHqdltM
	PPD4vj4YoI/q7uKb4ca8mB0A7qS4h9NQ+ixowbr1C8NnqQJOeYbrq2wn/0siHcs0RApOAqeZ7M3
	gbQHnkeq9W16Ts/DXK0In0DXzRNBmGI+HWzG8Xe2v0/8TOhMMzkw09wAqllb4WugzvmeGKaxMsl
	XpdJhwmXcI3nWti7y+6cPKRHvGgT8Mc/wA+gQg5mJvMHZuAA0wvmYzubWHfyQBc7/QzfTugOvsz
	Q==
X-Received: by 2002:a17:902:d487:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccea3e6988mr22070025ad.45.1783506973202;
        Wed, 08 Jul 2026 03:36:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:12 -0700 (PDT)
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
Subject: [PATCH v3 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Wed,  8 Jul 2026 18:36:03 +0800
Message-ID: <20260708103606.1462960-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_033614_534363_E4F93D62 
X-CRM114-Status: GOOD (  12.17  )
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
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v2:

  - Dropped patch 1 (nuvoton,ma35d1-reset: add simple-mfd and child node
    support) entirely.  That approach embedded usb-phy@60 as a child of the
    syscon node with a reg property, which broke the established ABI for
    out-of-tree MA35D1 board files.

  - The PHY remains a standalone top-level node as in the mainline binding.
    The existing required properties (clocks, nuvoton,sys, #phy-cells) are
    retained.  No reg property is added.

  - '#phy-cells' is now enum: [0, 1] instead of const: 1.  Boards using
    '#phy-cells = <0>' continue to validate and work unchanged.

  - The DTS usb_phy node is a sibling of sys (not its child), retaining
    clocks and nuvoton,sys, matching the original binding structure.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  45 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 279 +++++++++++++-----
 5 files changed, 384 insertions(+), 77 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


