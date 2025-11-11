Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73519CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HLA1a9NwMSaye0i3Nk+UwWtVJYN2Zgn27uLzKW7b1TM=; b=j/eLcEmDzsZnUvs7vsZ0oIUrF9
	a2GC5tgl96SreGh1FaUEpKW0pVIj/FzFAW/hrxQo6GkDXLWF1VE1srZfkem+xZ73RBao8XOlBljwY
	HXm6yD244V9YtW3vaf6oUVm+pXxGbiKP7Q9D87tGyg8A5rV/AsSWfW2eWwlPUXfrN5daDSIqIugmg
	lVhu42zpoEOAQCQeoKLCTMeE2mLrCwQyMuwQZmQC/mBPrZUyJsFMD0IWRqEfN6OCp3zRVOIgsp9uX
	4DHprb7LLT2nFZph1KnUpGLb9VcrBL77i/aQUJkBQCMgTXHA7t0Xy8FQpKuLi28x+pZD0QeHHBinT
	Xdr4GpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIo50-00000007DpT-2rEx;
	Tue, 11 Nov 2025 13:06:38 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIo4y-00000007Dp9-3uNd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 13:06:38 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-297f587dc2eso37953475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 05:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762866396; x=1763471196; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HLA1a9NwMSaye0i3Nk+UwWtVJYN2Zgn27uLzKW7b1TM=;
        b=34jUV8XwvN520KewsLP/23eZYw/zk+O3gNrPUepwrtTHenNCCflP2g+txnMJtkVFTS
         uqgnLwM01/5o/AEDwIevsYbhgfXy+xeGcjRt+/G8m+4EgDQApJ2gaK1lm2QWt8KCpXkF
         itIAmLkKakj4IQTylAH9Oqek1e5K71vmbIILMVFsGN4lqSexJhsVM0HeqobYWSZnFzqn
         YTmniyfQIhFT8RaEOFp5LBssZHbIS/3mux8/BHBQ9fgLa/paPFfskYSiYY/YcIAbl/RA
         jzi3YFxF4tCunbyIns88cTYMKNorkAFVVWX4Z5zQMWsINW/prNnJbYWF03btnTFVHqs2
         6y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762866396; x=1763471196;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLA1a9NwMSaye0i3Nk+UwWtVJYN2Zgn27uLzKW7b1TM=;
        b=sRWCHK5tw1V0mM1VN0JmCj2KJWGK1m5Iis4ZKWQDdnlU6tMybvBgOvk79UXgps/pSP
         BvpzWvEzu2jAstOSWEb7uf/fnPUTED3GOoFTCxtLBBecF7k5FhiG/76tHlNOGYmlwcYl
         FzmjgLwQ+W5WLjbNN9fh7VkkMxUoeFgXVyOpaS9ojYtQ7LujdA6IY6a37hYEmc5CG6pf
         0OChMlmSsfAWduR13gDCSPwnR9X7Ys8Phh69/BSgIkuCeePZOCwc+sNgwhfLGcE1Ya1x
         ka3Puk1nAzLCUJScFvDjmRIKW7KgQf6xU0OwxIP1kGu4fmPHHmDqBVSGXlYj5Q5MSJrf
         iWAg==
X-Forwarded-Encrypted: i=1; AJvYcCXqguDXohTmy3pDRhiZLtTN17lPTSDoIQl4/waC5m56dUEFbsniVORv5rSVaWktpg7d/1HDQ6cVPbT8y3t3YUrm@lists.infradead.org
X-Gm-Message-State: AOJu0YyjwiIlPvSKo/cLcukAV+vgYwbEpudW5qYtrl5WjomyYyjXZ9Ks
	Zt54w35oqExHLaGOTrxBFeA8zr7ajVeH/iwiZy1r5cqPRzFKjSKdbRTA7ooX549UBkknu30PZRi
	SWoMoWA==
X-Google-Smtp-Source: AGHT+IElmoSTCWhrtDQMxFiiHT8qX+5BcFGeEfnNbpvXgiMm/IRBQUBpX9auVk9JMiKJ6y0sU7Gv4vGyA/A=
X-Received: from dlii28.prod.google.com ([2002:a05:7022:419c:b0:119:b185:ea6e])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:283:b0:295:32ea:4cf6
 with SMTP id d9443c01a7336-297e540709cmr156079625ad.5.1762866395690; Tue, 11
 Nov 2025 05:06:35 -0800 (PST)
Date: Tue, 11 Nov 2025 13:06:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251111130624.3069704-1-royluo@google.com>
Subject: [PATCH v5 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_050636_990679_623875BD 
X-CRM114-Status: GOOD (  15.56  )
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
Changes in v5:
- Use syscon to access host_cfg and usbint_cfg MMIO space per
  discussion in https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org
- Make warn logs in dwc3_google_resume_irq() dev_dbg.
Link to v4: https://lore.kernel.org/linux-usb/20251017233459.2409975-1-royluo@google.com

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

 .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 628 ++++++++++++++++++
 4 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.2.1041.gc1ab5b90ca-goog


