Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24370CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SE2EEGb0HouxauO/aNI7gyJ7SeBT6HKDFtX26SdNI+k=; b=zolLtOF/qw9poYtS/J5Lp3aLbH
	D9cCOVGd51PXGqaQg6EY8qpVRT3sAH5DSgP4DlLT/dUgkXYMq6tYPOLl/ituQssWBRcGgf4dNQuvx
	fD8/uJdfWFK8/foyAK+gCbO8xVD45S81lYw4Qpg2rXiuwmR2NhNYTQrsoZ+nZwfxM64lYdiO8eYX0
	BA3uMzXX89O6PB/WS0aI3WoRk+Y67XHGLQbED2E7wDbzqkJUe4/qX2zkFFwQAbuZoT6MqP7/wNACj
	9BKaO6fx5x3jvg4UXXJpIWJBLfeT2VYb+SzbHHE/SRF8u9vRHQxPjn7eicrcb1wQH+9IJy2terlz4
	hALi4zbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tyV-00000009Bw4-0lqd;
	Fri, 17 Oct 2025 23:35:07 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tyS-00000009Bvh-2bO8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:35:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-290bd7c835dso20775305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760744103; x=1761348903; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SE2EEGb0HouxauO/aNI7gyJ7SeBT6HKDFtX26SdNI+k=;
        b=x5PqtD0taDKH5hlY2D6ezdFRKnW8EagEDLrHQE8i9bgCV4VPuJf4L6Wzcl2wXQOYJ1
         AzUbtape1Hoo+NpYMc2KcEn5Yf9ZPjTm69aQKxTAYTXqFHijEgbHIMxNd/uCV0VB6w88
         8/3N0+9GhaPp3p8s1DSzd8KjCtyPcqq7NCOABZa4ECtkxR4ZLnAp0tY3e0Qr81VsCS2y
         rQCXyV5HciI9rnAR8NEw7zAlIAEpS4psIpZuu5yFu9reh9ICkFudYuOfSZJwKBCuRgaP
         9mVf8CypUI4e0BdPjss7JfPA1skoDQj5CENa3/ngywHcfeDNJXtQBDTM4dLMxICRaRwc
         P5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760744103; x=1761348903;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SE2EEGb0HouxauO/aNI7gyJ7SeBT6HKDFtX26SdNI+k=;
        b=jDdft+AVmy9FKdowV9mBarzCqond2WIlQrfeKdiwACe/plCOlvxiiEeGc2YK7xDTJt
         fXx4ePIBfTWSvfOujXERG3k+1S1CZlb2XcDHaLTTjdpUpms9qAp1dhfqSjF1Xl480vLZ
         moJdC8GmDnnxkHlCAJ11W5L0K2EtxkwKVTrIDhV4pO+DR4MCp5hr8fcok9QDj4qxCT5Y
         RNeiU25uMzGDHLIalIAdHBvb7ia+nI6fxzsuCFWLopnRq7kxWxZzHnseY8fSmPbis5FF
         o/ArpWspD4rOHw1ctgXCrkbe5CeLpHeEbOQ+F/Z0Y36xuURSFcO0ARYHSfjSCTVSWRfV
         WG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWthrs1Wcg/fPILPYL8Pck74doYXNRoKoh7mLyoZ9Yc64byNcO2IjBPLNM1PBJDY9MWJQQEmRUMBB2P1UCpecl/@lists.infradead.org
X-Gm-Message-State: AOJu0YybyVXQg0q3Kuql8Ms/ZXe+ltVcKCYsmQ+ijbSw4YjmPYLzOeLj
	6xPkpVVsLeM5b5zxzHX0e1Iz9O60S02RGysrnMQZ0evY4hh9xTnf6JDAhrkEcCe78RWalyMayCM
	cZiSR2Q==
X-Google-Smtp-Source: AGHT+IFz9LrlEbh/GEOZE08yXGgYI/4R0E7gunWHRVlyUcEr6QWUdol+r9ZsCt+kLhqmYgnF5LBEIR69e4Y=
X-Received: from pll21.prod.google.com ([2002:a17:902:c215:b0:290:cd84:e7c])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c1:b0:278:704:d6d0
 with SMTP id d9443c01a7336-290c9cb2666mr71637135ad.19.1760744103403; Fri, 17
 Oct 2025 16:35:03 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:34:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017233459.2409975-1-royluo@google.com>
Subject: [PATCH v4 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_163504_672981_D0B4BA4D 
X-CRM114-Status: GOOD (  14.59  )
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

This series introduces USB controller support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Rename dwc3 core interrupt as "core".
- Remove u2phy_apb clk/reset (moved to PHY)
- Configure usb2only mode when usb3 phy is not present.
- Adopt pm_ptr PM macros to fix build warnings.
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/
---
Roy Luo (2):
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver

 .../bindings/usb/google,gs5-dwc3.yaml         | 135 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 608 ++++++++++++++++++
 4 files changed, 754 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.858.gf9c4a03a3a-goog


