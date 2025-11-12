Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3lvK+uc33/YSncyDEJOxI3GlGodXaiJ9TvJi/yjxYBw=; b=MwuetXgQF54FY0mh1J31JdCRMm
	B6kUJfRl6YUvT2A7ZsuKEiuvsUTNrzcbtSPvwblk8uaMQQU4miOc5LTuH+HXq+DlMuUj9vcdbTO97
	Jzyjwr+ucqIb6UqHnFAyNsVF7ADX7s3+H6JOYIlZa+q0PMHLj1SxH53+ovwbG4rH4f0jqJMUOAvuX
	fVvhPvRcdsY1/i/PpylwNK/H2OCsuqFEAZsXexanDDVTGHtyMvnwCLKwQrxC2OJpL3a63oCJZWhmA
	9It1RMCqGV/1AnLghO/7FdCaOC5hbgpeZW82PhrlpPOkEUejbkoCJXesrqHzB0eDn5oMVQnHQkPXy
	KcxKcDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA2c-00000008mCs-2cua;
	Wed, 12 Nov 2025 12:33:38 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA2a-00000008mCP-1uBb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:33:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2956a694b47so10381945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762950815; x=1763555615; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lvK+uc33/YSncyDEJOxI3GlGodXaiJ9TvJi/yjxYBw=;
        b=TmG10J5moDXiChqHRQ4pWvdi2DG7izUKMXZEi2H9Wo8WNoE2NZlg18CMJyyoYF71ny
         rWySgWNGakdTpolhnVUbKxSFIPlp/x9y/P6UHsBNeEQFIhCzbyibew7FRbDa40jucdEv
         QMDHVpq8OwORMhVzf/a0+zMy0CPpvpZRZMG76R5DjO5++m3UxHgv6AxuHidHEYESH/ux
         UnKLYgRN7rk8qv16QfnDF9F8fSn9WTJGH9dC6cq2fdP3QJkr6txVHKJwhv3yayB9ejGb
         m2a7VaA3V+n2zYPyRNhTGUMG+vekG7PR34aXJwon6Ftd6gEG3ihWpKcWMcjPKnv7SNjD
         SqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950815; x=1763555615;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lvK+uc33/YSncyDEJOxI3GlGodXaiJ9TvJi/yjxYBw=;
        b=dKgJekmtMUenIwxiao8w51d0sL3os4DQocH5zaUWN88RmmG02XGUq2qsFhbLNFlUFT
         T9E8z7t/CUyoTVdgbEuBlVQ6q1Mz2QYjeUQd8+1nO1+avuOpdub73JwHOuKyXbgPu60k
         FxuXX5Z4zWNODI28659kfkuq73Lt0PWap2/W5pZx3fo+wInqyRWzbwgtRrPLeDD1TInK
         KC77ZvbF76rN6u5qUAq0iv6eoL6il9bSSmFG3LmKI1SgKpOhfpTjh6NCMwn6Dx40+ufj
         vb5YvlVKs35dpgrbmBdMwHa/tzKDLAHk+T9U5h8oIjjE8NGaTlom8vUG29QsuJd55Wzr
         kMKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDcST4UmCMJzXNjiFnr1jnMBbyIWQmQNfGu4i9kMnW8+i0G65C8Cyw2jphxesSPTEJIK9tjKR3DOovSBvWuS8s@lists.infradead.org
X-Gm-Message-State: AOJu0YyvXItrq6B2kKci4VxomoIihcvkZc1hLx124F2AyuhTGX6mB0L+
	Mjb3cszaxvU1/n/3AKC+14NWErLt8g/Krr8uNzHfHC90FwSlutWVX7bwunwZ687/8Y5w+JmkYPr
	tyFgJ4g==
X-Google-Smtp-Source: AGHT+IFLqNhYrJ49MxXnkbzra9diXQg1Vv0DtfGNDDqWdo1vsY+CTaFtQqSWQk1ZZK+fvX+HgOTe5Uof+d0=
X-Received: from dlbur6-n2.prod.google.com ([2002:a05:7022:ea46:20b0:119:78ff:fe15])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:286:b0:295:5972:4363
 with SMTP id d9443c01a7336-2984ec8f54emr35613555ad.0.1762950815330; Wed, 12
 Nov 2025 04:33:35 -0800 (PST)
Date: Wed, 12 Nov 2025 12:32:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112123257.3755489-1-royluo@google.com>
Subject: [PATCH v6 0/2] Add Google Tensor SoC USB controller support
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
X-CRM114-CacheID: sfid-20251112_043336_497480_85B90261 
X-CRM114-Status: GOOD (  16.02  )
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
Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org
Link to v5: https://lore.kernel.org/linux-usb/20251111130624.3069704-1-royluo@google.com

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

 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 628 ++++++++++++++++++
 4 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.51.2.1041.gc1ab5b90ca-goog


