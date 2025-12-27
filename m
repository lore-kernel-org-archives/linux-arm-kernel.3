Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724F7E8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUOt++H6P9MIUtvbp5JfTBM5eugQW4O6i9bI/4lTIMM=; b=mJPNlCfF6VGCQkBz3e5eQck4Fn
	woyHsaj2+zv+K9tZ/GrorJxrljkYSPT1iz5asxZw0tPqzDfgUclCJG7wUiMKX53bnvWljAosyCzKD
	xWgh3p7JY2PB7gH7jPFQQbFoPOJHGsw1J9I9M51btTZGNhcghBpt6LscuzYjrgIlsh2sznEotTo3u
	dTEGws7NGw/WOgeYvuX8VPEQTgw4SG/LCgQI3AMkusMxge0C/fuS6z7eM7Ctzwe+6Gue1ywOnHGlm
	HMmpkc/geNX6qxcV2JZFHLIe4ApVAnGdpO+fn8sTTwaSeobsD2kOx/KJ0qbyHChHc/5iGH3DJvJ66
	z+cAaI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZ5-00000001bpH-3aei;
	Sat, 27 Dec 2025 00:53:51 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZIZ3-00000001boA-1PVW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:53:50 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-bce224720d8so14374303a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 16:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766796828; x=1767401628; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUOt++H6P9MIUtvbp5JfTBM5eugQW4O6i9bI/4lTIMM=;
        b=0WZ2T2K43z5gIuA72QbhLwFupcLQC2ZSMM4XZT9cnUj0fHym5xSYd62sxzpZeQXWkG
         p1Cvv4yzKeBMizyMPgzxz6dBQD+kMIjw1r94u8HPWVDn8gvFn8ed5Ksqjm7iUz1LQVjl
         EEaO1tn6eUYfIjoEP6cQE/ioXgPgwwnCvCxt1G1bjDz8NjRfO9FL0Ux4IwGjzHa2ubd/
         GYBepFpd+7yPeYSibCaUCY6gikdNXwz2Aw3T40m0zfdz6bwu7M7IBIF9ROckmfRXSptJ
         daueaHKdbwVg5TXu2UJ7mfMff8n8+Wr1OnWB1rk19gUkmhspqtnFgG1RivwvxA28OLWH
         7Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766796828; x=1767401628;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUOt++H6P9MIUtvbp5JfTBM5eugQW4O6i9bI/4lTIMM=;
        b=Sw+ZVgYsoHzx3ZnfOMOE3Z0II9GTcGijlY9Fx6KcZD+uwGWrK/opPChu0HRO3VErU7
         /jujWQjVu2CppNNEPNmIYnijx9oSXtY1VmxLsqMBQwttkI7ASW0y+vZMNeTdu7KqX/KG
         DwlqOebtmNC8rDmr7F3eiXfuLuoN+FMnCOKxNrQeKetx4xnQrokqk4z4a9R/6vwSOrZT
         9iavTgw6tagxFhKtR6UL+6wRAm4cU2q88Q2MQcrSb6JxpzTGhLGswXCWDWdJFuE9Zfnj
         yvMsn8hHUO7A33uWUfpe8XEo7dvO5HdxFoIaW27SfqIn4cUi/i2MugGxx0/I3E3u3uSh
         1rnw==
X-Forwarded-Encrypted: i=1; AJvYcCXr0cX5lLxNN0UGd3M6BaxNBhisGCe4jv+wvcO1ZnSIvBmy5SVYAAsmGskAwqhTr/H0DYGyjPLg6vl3FWc3robL@lists.infradead.org
X-Gm-Message-State: AOJu0YxkmM4yE1QMQd6dhVO+XGXtyRbKuclZniwFw83V3OPOq1C3TVKj
	BIrYgaqjeW4FMu+7mBzNtc05RaG4SQhjG7E2AIfe55slEOk/OXXxQ0NF7hM52AzWg2VmNUzurRL
	eTZgEXA==
X-Google-Smtp-Source: AGHT+IFLTAhGqVZKueCpJyr32s2DM68PHf3zDwsPgx+boj0LeUKxJ1eOCwg/nmWR0HMX+PLBF6xT7HM68oI=
X-Received: from dyblf34.prod.google.com ([2002:a05:7301:a22:b0:2a2:3f59:eef5])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:631c:b0:2ae:824e:31ba
 with SMTP id 5a478bee46e88-2b05ebd7483mr24294610eec.7.1766796828038; Fri, 26
 Dec 2025 16:53:48 -0800 (PST)
Date: Sat, 27 Dec 2025 00:53:27 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAcuT2kC/2XOTW7CMBAF4Ksgr2s0M/Evq96j6sIxdmIJMHJo1
 Ajl7nUQEalYzmi+9+bOhlBSGNhhd2cljGlI+VIHhI8d8727dIGnY10wApKIaPm1n1rBKUDjtBf
 CesHq7bWEmH4fQV/fdY4ln/mtL8G9NJAlFNDQvkEtSSFHXvJ0+smfXc7dKex9Pi9hfRpuuUyPp
 0a1RD7rCZ71o+LAW6WsCBjBu7hNWPpHvWW4Ml3ZMSoholOEBt6YeTECuTJTmZc2OANOCGnemN0 wopXZygx5aJXGFvT/tnme/wBfYbi7fgEAAA==
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766796826; l=6207;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=vtJDNjw6xu9gRDPmmwL2R3xcyFhtOL00Gncs744Jqr0=; b=UKvHfJa5yI/Gnzt1GGVtCZaD1u9uyKraTk1Zs5HFIRJteCkrfG9t8u1k1ZcaW4be0gyySQHP1
 EnDtYqpby5HBtJzorI6f3pfXWGK+0tZ0X5zxupybMQjKx1dQh614PnG
X-Mailer: b4 0.14.2
Message-ID: <20251227-phyb4-v10-0-e8caf6b93fe7@google.com>
Subject: [PATCH v10 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_165349_465670_6DE972A1 
X-CRM114-Status: GOOD (  21.09  )
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

This series introduces USB PHY support for the Google Tensor G5
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
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The controller
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v10:
- Alphabetically sort Kconfig and Makefile (some of the existing entries are
  out of order but they are not in the scope of this change).
- Updated index, num_clks, and num_rsts in struct google_usb_phy_instance to
  use unsigned int.
- Replaced the fixed-size array of PHY instances in struct google_usb_phy
  with a dynamically allocated pointer. Since container_of can no longer
  be used with the pointer, added a parent pointer to google_usb_phy_instance
  to reference the main google_usb_phy structure.
- Removed the superfluous init of ret in google_usb2_phy_init.
- Ensured google_usb2_phy_init explicitly returns 0 upon successful completion.
Link to v9: https://lore.kernel.org/r/20251222-phyb4-v9-0-82c0b671b070@google.com

Changes in v9:
- Per Greg's feedback, remove Kconfig dependency on ARCH_GOOGLE || COMPILE_TEST.
  Remove ARCH_GOOGLE as it's not yet in the kernel, and COMPILE_TEST is no longer needed without it.
Link to v8: https://lore.kernel.org/r/20251205-phyb4-v8-0-c59ea80a4458@google.com

Changes in v8:
- Update the Kconfig dependency to depends on ARCH_GOOGLE || COMPILE_TEST
  Note that ARCH_GOOGLE does not exist yet but will eventually
  be there when the following patch lands
  https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid/
- Mention SoC codename Laguna in Kconfig description.
- Sort the header alphabetically and sort the variables using the
  reverse christmas tree ordering.
- Add driver and binding files to the Tensor SoC MAINTAINER entry.
- Add detailed comment for phy_mutex
Link to v7: https://lore.kernel.org/r/20251121-phyb4-v7-0-df644fa62180@google.com

Changes in v7:
- Change the device tree binding example node name to usb-phy to follow
 the hyphen-separated naming convention and remove label.
Link to v6: https://lore.kernel.org/r/20251120-phyb4-v6-0-b6694e1f0caf@google.com

Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org 
- Add "usb2_core" to the reg property to define the MMIO space for
  the eUSB 2.0 PHY IP.
- Rename "usb3_top" reg as "usbdp_top" and update the description to
  reflect its nature as a top-level wrapper and align with internal
  documentation.
- Use syscon to access the "usb2_cfg" MMIO space.
- Remove minItems for clocks and resets, making all listed clocks and
  resets (including USB3) mandatory.
Link to v5: https://lore.kernel.org/linux-phy/20251029214032.3175261-1-royluo@google.com

Changes in v5:
- Add usb3 registers/clks/resets to binding as suggested by Krzysztof
  Kozlowski. This ensures completeness of the binding, though the
  driver has not yet ultilized the resources. The usb3 clks and resets
  are optional if usb2-only operation is desired, this is denoted by
  minItems and descriptions in the clocks and resets properties.
  Additionally, rename existing binding entries for consistency and to
  better differntiate between usb2 and usb3.
- Move the description of the phy select to phy-cells in binding as
  suggested by Krzysztof Kozlowski.
Link to v4: https://lore.kernel.org/linux-phy/20251017235159.2417576-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Remove usb2only mode configuration and the corresponding usb_top_cfg
  reg (moved to controller)
- Add more descriptions to dp_top reg to indicate it's not DP specific.
- Add u2phy_apb clk/reset
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
      dt-bindings: phy: google: Add Google Tensor G5 USB PHY
      phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,lga-usb-phy.yaml           | 133 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 296 +++++++++++++++++++++
 5 files changed, 442 insertions(+)
---
base-commit: 3f0e9c8cefa913dd9bd1d79b9a68896ea130f106
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>


