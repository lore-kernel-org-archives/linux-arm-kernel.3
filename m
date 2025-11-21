Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC99BCFA74F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhM9Fa/jP+KWb7vx3DxnfgNJ8bMuk70umuAM2oX5908=; b=NfBX84STwqmQBJNmpdKUZH9Tmz
	Bs1YYw8b+odTyP6WHNQROl36mj+PSS3PeeCoznpbTvsL3cmoFQ0+SiH1WhkkE1Aalo9kckcjqQ7qQ
	bo8+jxTjEFgjqJLMI8TUn4a3UFR6TCOVU3k6UdVb0qU6Lipdh34D9n9qBiKqagnnY+iT2hwjkbxdI
	XjsxCA7h1/GsXi9Y4N/H99naAopF9/sGtGYptG5zghG3dFTdTpm1DIzB0QDTvPC8gD3o1TEkht3TZ
	bQ2fYj+N+pZElzyl8GnRjr+pJz9TuRV0X24k6f11A8MJCq4cHetf7yXG8cAXrQf/tTS7zwAzr4SDg
	3ytfGQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMwb-000000086cg-0N7n;
	Fri, 21 Nov 2025 08:56:41 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMwY-000000086bU-3z9X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:56:40 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1782004a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763715397; x=1764320197; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DhM9Fa/jP+KWb7vx3DxnfgNJ8bMuk70umuAM2oX5908=;
        b=tm/o9rn3l+i+ogsHIcrbCmpYAFc7UQlSM5a+miYKOPWvApoZM9x/JjhNHvPM0ei9q4
         zPiCNbj69+0eJMS+YososDWJ5q25wPhxinL4BA0M9OAXpM6P5DJt78uRUaDj+kPWdRIY
         nnLkvFg+/VaA0TLWjeIZCGRxc6gMx09h1Rcg/Ou+n/9wwajjHdoTxbwo0mGXuIgB6M0S
         u9vH9wX+cUDwwQvSHXRYAezy0H46hEa3O2JCvfGtS2yjXQw+YirpisDrFvL0a4BfHxvK
         0my3H9m9qovIfdSig5TTVsuP6tFKNoYRvsiUbU6qQgcSabgMJVzAtnwVWhPyA21ti+sS
         9g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715397; x=1764320197;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DhM9Fa/jP+KWb7vx3DxnfgNJ8bMuk70umuAM2oX5908=;
        b=d9p3QvK5xzQilOnypHNm7gEryOIZbPzMym1uel1pIHg0hQ5ObM6nApxjd2sqmSoK3f
         p4Q1BgIN5T9HL8RkFIzydeWo+xx1BZWJuwpWiEVDYsngVpf8mN9niWo420FPlTrFZPri
         xDzV+C89oBed2pygoLKXgR1K/S7uOHALNwAdxS2LdUyEIQ+E7tAP34CYP+ID+W8pdZNE
         nS6icyCcy3MdtIIJgwhs5xD1F+EebCk1c4JqlftrMLa/Gh0Ufg+hQ7Y7a83rip/U0xWQ
         iCZWXvL8cXS4PsK8TehWgXMyluRPA9M7VlvJUpsZtQ8gtJf66NqGG5P1ItO2Bu7HT2jJ
         Fyjg==
X-Forwarded-Encrypted: i=1; AJvYcCV+zdRho7nHjMs2MjosyE17IA017v/fcHl369W3mOC3jNUEXmshsqeWgtlb7IlLbz9/eUlaQ/fxlSjP4R9g+jK+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ8yVzVlEkHthguTczwUnVNCeCX8XeAWWDjGdFt+zscc9w4QLt
	c1c9sszze+TfgSSoo+io6P7Cj6qJfnaZsOgNyPPlZpERX6ab2E4QhYB+gXsRAc1TmR5RsTx/1rw
	w10cR9g==
X-Google-Smtp-Source: AGHT+IHOt9VGLM5kE8fbmXammocOK9LHEy2oDCT5mMWFdkcdyy6xX1Z2HP5Qw8fBAZ2SiujmIs4ZXkkrgOM=
X-Received: from dlbqj20.prod.google.com ([2002:a05:7022:ec14:b0:11b:806e:9c8d])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3f89:b0:119:e56b:91f6
 with SMTP id a92af1059eb24-11c9d87076bmr424174c88.39.1763715397353; Fri, 21
 Nov 2025 00:56:37 -0800 (PST)
Date: Fri, 21 Nov 2025 08:56:19 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADMpIGkC/02OQQqDMBREryJZN5J8Y8Sueo/iIqY/JqBGEisV8
 e6NIrTLBzNvZiMRg8NI7tlGAi4uOj8mqG4Z0VaNHVL3SkyAQck5r+lk11ZQQFaoSgtRa0FSdgp
 o3Of0PJvEJviBzjag+rUZ1MAFKyAveFWC5JTT4Nf+7R+d912PufbDIbMuzj6s56dFHsprHtg1v 0jKaCtlLZAbppX5NzT7vn8BvOwlxdgAAAA=
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763715395; l=4451;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=Ar+FpJ9OcQupIafQmNevHRUQrYI7zdExOsWYoTxS3fQ=; b=SBxNkIDzrCsiCjNNLNfD4nwYdPjqjoFKrywstPwPtPtm9mW+EVfzp6ypYcS1gv6q6NhTIaxuU
 boJMTGOjnZ6CVULL34Yllotu9p0zwgKXaWjiMFHgrWaci1TWiDyKmwc
X-Mailer: b4 0.14.2
Message-ID: <20251121-phyb4-v7-0-df644fa62180@google.com>
Subject: [PATCH v7 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005638_986898_2BB42129 
X-CRM114-Status: GOOD (  16.72  )
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

 .../bindings/phy/google,lga-usb-phy.yaml           | 133 ++++++++++
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 292 +++++++++++++++++++++
 4 files changed, 439 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>


