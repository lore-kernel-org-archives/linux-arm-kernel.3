Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C9AC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0b1ZVK4FQBOKzIWDvZDBhV3e5RNA779GaFmuBBFBIPY=; b=EVtMZZBa/4fe2eviVkqV5FZHr/
	EHzYUJyBt+4GjiKpYNZN75m80IEKJqNTVaJatajt/I2I8za6b+E0YzOAJCemddQAdFQEYY4I+lnAs
	iN63a9ZHGAa7i7QkQc4pzA39jada9qMxC+RVc7/1s5IPw0c/w1xEcokPaXv9NEFMr93C/16lpNCPe
	GpzCCOmGn9M9eR1WY0w9h58aPSv9MsG0kvG6umyNRJhVQ6sAgkqgVwNbf0d/tlewjBF/dXKNPhIIT
	rsWrxWu+0cKPero+cGhQ/2kkjs06a2jnROcrD8lElsa06IV91FaCwRiXhcu3XEDLAiIU2NFm7pGVG
	GlbibZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdwd-0000000FFJY-2VIS;
	Fri, 21 Mar 2025 15:05:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdn2-0000000FDUZ-3420
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:56:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so20955795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568963; x=1743173763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0b1ZVK4FQBOKzIWDvZDBhV3e5RNA779GaFmuBBFBIPY=;
        b=JPP/fRj+XwxmL8QU/VnysqnhHivZRcR6bFaH7OyI9AO8+uI3BwKHm+VNyXTN7h/nox
         Z01ME4o3PuS09smmSJ1wpRJ1Jm81H0A/7Zk/Biy60wA/4oIWtcIykMF4MJ9vQojnGfi3
         RzZHZ1ngytgOHDzolaWnTbxdDVgQ5RhXQg2assbbRVA4ntCuaBy8Oydr0da/y9JhkOa5
         JFjbQLeFWPzIs8I7tJv7V6yv8kLqbZTrbeJRgUfpmKxtD0BJOWg/sTkg6oiJEvfOo+X2
         jZCb2v4PjhWFD3S3IAHRjhCYKqY5O5qSE5mKpWN3Zl+mkG2CvLKfFk0k9ebq5belmm3E
         MS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568963; x=1743173763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0b1ZVK4FQBOKzIWDvZDBhV3e5RNA779GaFmuBBFBIPY=;
        b=H5a+rcNvbUiHm7Vl6PB+XsFrZOnqZBTindKx5GMXPzig6z0JegBhA5CYYdGpYtkaGy
         vxyWDZkdC3//dCtej65v7+wRiMJBovQs6aL1e2zH3U5nboI5VWlxL4aaE2krgFQFhuzS
         LnFlh7+2jju7uEGrrUgAO/ccJUX30rf2AJJWHzj/w2JjLiTz03/ScXCtJIhaCWq0Ri+G
         dvyZGmSpUwAPvsQLmx/AOvgD1IvQhR25QizSBthK+3qd70+eOdLIRw++F8lSuvjk5gvj
         FzZRV+BIyX1NaFuqZFYiz+jXGkHKcAOo5jNtX+mU6jK5ZgsXd+yF3wIlvBNwjE29GnLa
         m2ew==
X-Forwarded-Encrypted: i=1; AJvYcCVhSnFHnJT/Q2kECJRVfH9+S1GfWjkBk05vPhZxXu6Ezb0xoi7ns4FsLABY+xWjGdOfRQuimmKlQsT3odI6vH5h@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2y36SxmxArGCeeKJZaNTCHzvbCNIZy0yS6dGB7vht+xxyyToE
	WuSLvxz5iUdEIEZ7XDWam4NOVcY/n6Z7TCCVX7snoeizolPbPUnYc25+xQ==
X-Gm-Gg: ASbGncseou3VUk6iinfFsOpC5oauOeMmbs9iuF3inZCEfklEyWcslhV8Ig/W3MzNdl9
	YI2TBSSijw/1ocDDfJAEoU0qHWAO7Q58BKvDnSgEkIpQHr/g2V01oCGgOFAkXcbs9nRO0i5485Q
	zlrFIQzMMRIy9NuwIO/OkDCFkSfMVM2Eoi/PEmto9N9Bj2MM3mabm5oL2cMFjzJAeG31Jh+usNf
	a38PyqLJX+X8i3gwc4F1QePTcE5R78HpE5N7gflwj7Ll2gijl3ZRu0YO8mpDsMsR8HzuWGlDzNL
	BUrHKOMl1RVA73JwVHzRuO6CPr7+pqT8McGnzZ5j4XmFQsYLC+R8zJfoVKLU14nrZ1pwODXKG7z
	roq+swyh6LIHRSp0g14IG
X-Google-Smtp-Source: AGHT+IGUoURGAWj8U3P960wJT/eiyLcta46A5WVi7nZH3W7YjqEoIAHw3UKw8FdD3W+LtY7DrmzUwA==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr68811475e9.3.1742568962858;
        Fri, 21 Mar 2025 07:56:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Fri, 21 Mar 2025 16:55:52 +0200
Message-ID: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_075604_764719_4D25E287 
X-CRM114-Status: GOOD (  19.38  )
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

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

I expect [1], [2] and [3] to be merged in next before this patchset
because it depends on the aforementioned series for drivers and device
tree bindings.

Best regards,
Ivaylo

Changes in v3:
- account for the usbdrd changes in the exynos2200 soc dtsi
- drop usbcon driver from the MAINTAINERS patch

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

[1] https://lore.kernel.org/all/20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  175 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
 6 files changed, 2518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0


