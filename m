Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADEBCCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1p1oeYfspOx7SSAvPlr7bGgu5n9Q/dCaxclZDr61jg=; b=SqgG54Ow03idpLU5RMXayD/9RM
	K3nD5NXuyU1topX38/Vyc4ntTITNk813CrByWMlvUBRrHsvpofoR0VzQ+3JT/VgKt0R/N9GNK9224
	B1Z/LKw948AXi9xSX3zVTbtQ+XyMYuk0zvkY9Z7WivKl6j97oxk7EEf77FPu1qYGNpwXQURMFe2xI
	lkq8QbX3kvVhCSndnH5jPNVG8sxnD98BC4P0xfEU+Sj7hbcCQo96HljoUmxoo6Bnvd0cRvYcXy0fC
	0bxdA9lrwsyyvpRBOz4ldIWtCDResblaJ8XiztUezP5lv8wvV9siLjKAjbw02FGnERUWXbbHLe33h
	GgWU168A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDue-0000000303f-48gG;
	Wed, 29 Oct 2025 21:41:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDuc-00000003026-07id
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:40:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-294880e7ca4so5638955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761774056; x=1762378856; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n1p1oeYfspOx7SSAvPlr7bGgu5n9Q/dCaxclZDr61jg=;
        b=mA4KCXLaXgnSfiB81tNDoy+LNwzlw+AGMB35CYC3YHvQZqwdAxA+DB++S790s6hCEH
         xTc1mHV3CAhDLUAtpwfuLFLzVL7vQhkyP7fzCu0SEjNKW8y9ILcaqwCw+XK28VssHdLV
         Io7/d3+SeOgo4FcpVuKOUYEvJhnW9RC8GflE6UH7zX2cAn0a82+20PJgb1UKrB/OWu1h
         omw0/AU+8W8+ZGjUwCmmiZqdJJduDfnpzRtcP8oe162LSDlUK9dzJ7fGwnIM4EtQ6z6m
         eGVBalZgCmVrEqnX+t3m689U24xwcAXN+t8w+rkA2Af5Lfj6k7Uc/05JUcgTAvun6Rik
         m7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761774056; x=1762378856;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1p1oeYfspOx7SSAvPlr7bGgu5n9Q/dCaxclZDr61jg=;
        b=JJ5wnl/5JBBGfZm+dl6W8JJb4ayqNE/5K0dwxk6tKhfd8q9C6uIxh7yqUEJAAPxbtM
         uvS4W/hhrTl3QZNdZdM714EJJTqpAx6D1EwbYpCOl2EutFApDol8M5jeSX5zogwFnMeH
         Kkc/ubCK0FcHKaBWfi4umJdcplmiEEbE/Tl45pCoENcrQTUODuXKDyEyTsezyd4SnzzA
         IrtoJR9yDQNQI/SOZbk21oC6JgYQlZt2GA8sTAPPg7Sw0VUrFNPDbEt8R4hGI1MKyDjD
         u6DEpD7jQdQXj9F2/66PMppjRvNh/2UicgXrFO9rCo7sEVfu6C7FPflP4o0Szclty7D6
         FoMA==
X-Forwarded-Encrypted: i=1; AJvYcCWJVqsegVouFpRmz3Uk3Iiycbe3vzI6sTvllgqSZnjvyY6FFozkxLw9dnLTZrPpjVAGXL/zimBIOyhGq0i/IDZL@lists.infradead.org
X-Gm-Message-State: AOJu0YyKktXv1wJKftI0leTfhp5avjG16WmfaWahfhHE1WuPDtu3dyWv
	dy62tfSSJgRqOBcm+OHCPc4XNjsTsl0k1lwUhT1stnj9z6ZKDd0P10ztp1Ja1pXcDPOgRraAKtx
	BcfPe7g==
X-Google-Smtp-Source: AGHT+IEVCwQK+uqTzDFeeOMYHV/ZNZOQw0zJsYdD8Ck4OGRaKkCeRa+O9z2vmnih+ac8NQhsb2enH3x6CnI=
X-Received: from plkn2.prod.google.com ([2002:a17:902:6a82:b0:292:4a9c:44cf])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3846:b0:267:9c2f:4655
 with SMTP id d9443c01a7336-294deeec254mr49534185ad.41.1761774056444; Wed, 29
 Oct 2025 14:40:56 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:40:30 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251029214032.3175261-1-royluo@google.com>
Subject: [PATCH v5 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_144058_064801_6B36736D 
X-CRM114-Status: GOOD (  17.07  )
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

 .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++
 drivers/phy/Kconfig                           |  13 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 271 ++++++++++++++++++
 4 files changed, 412 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
 create mode 100644 drivers/phy/phy-google-usb.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.1.851.g4ebd6896fd-goog


