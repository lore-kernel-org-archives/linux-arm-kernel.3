Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A368E6B244
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HU401KItDdT/cw2a60PpMgYx8O0lKu7re6GHYWC/yFA=; b=21jg/Pa8dXbxjwVFQUJBqXhy4a
	1pahdv/ZjIgaFSfGWZNVqfyBNbQEcj5nX8eTCD0SREd3KUC8+jtqsy7jFeMJKOltQ2WcUYrdawaJO
	XixRj5Q+vjK27lmRqOgJB5tsqrzqzgoGUbFjTpM4lLkoYDnSs7Oki9mGA64drXZ3DpIOke3p4BWqQ
	QZNLFkfnLKXs3MJmuOXbhG0dbF0CiUc6wpSO5O4c8U5kuCuUoWg1C86c1HMkELJFamKUCNJl2PaeJ
	6C9SZXyIXFObgmz9YvN44ZlHMIXO5ZoZg1G1pJybVcdtq0wQAOfzfdN6WFnNoJw+EEeYlVKECnJoN
	YZf1cV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnVL-0000000EBcg-2Vnq;
	Mon, 22 Dec 2025 21:31:47 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnVH-0000000EBab-3vdd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 21:31:45 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so9944736a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 13:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766439102; x=1767043902; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HU401KItDdT/cw2a60PpMgYx8O0lKu7re6GHYWC/yFA=;
        b=icB2ijmOdlX3SVcQv/JugsNocOgeRmYVx+eT4LaRO0DOQiAeek0Cv9FTU5L9oQVwb3
         g1hCw1jeIA5PS8FNH0Pu0zte5nXXquTF9EkM/adQn0UatJRb+ykNHNO+2REn2WVy8jOZ
         5o4hRVceKz5FDRUq84qFyWJPCEwXf9Y9v3EsKwWhyMKxJ5ScNEWJ9bSzZbGZayqYP7sH
         /9rXfw/NCd/nFRlRNAw96KonKGKmjUL4jhdW3yCjqdTUo90KjDOZWQKr/Glj3WYInT38
         GFdPkykU456gzdXLhEyzLK71y0VbD/LfpV6aaPptfB3kJq4pKS4PaC+pMwyMDzo19eEy
         mZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766439102; x=1767043902;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HU401KItDdT/cw2a60PpMgYx8O0lKu7re6GHYWC/yFA=;
        b=aSXIHD7Ch5d3SMgMjxvp8RcSm0dwAruuVUxyJbf0x0YbwlBysmpoV3ABFwKIK9jDcT
         plm28ZXzfnnt3vqUEwXBIu5ds0p7fbyMOvc44bkpZLsdzPpJgf3nkGrXdewtTAB+o+hT
         OLUWIuSFyVmSab27qnREm1dGPmQ/mbiK0wVvNvjpsIlF6oHVzrh305RSaAWHvHz6Li/v
         h3CeiN71eeRDk/Lfa+9a8TdGbbf+cE3e9n32pQwcgmpmkS19LZEat3h+LBnH0pFo6zWn
         BnvaD7G+uSW5MdOVdDGAy8dlIRtxOswxe7XuVikcGq+q560tTpJ5yfMdvzm3DPa0F6Tm
         f+eA==
X-Forwarded-Encrypted: i=1; AJvYcCVhz3ymLFhMyNSgmofmOicNLMn40sWvYzIGqzqAzUlq9kJc8IhjQRqDNiZigIGutJwWWamKhftEmOYE1kwCGc7N@lists.infradead.org
X-Gm-Message-State: AOJu0YwR8g3hhT8ztg/kXckpA1XJP7xT2hA9aG02+ItnC4VFMz+LFRHW
	sVAcZ3f/GZ4Xe8sf5jt9wg1J9NMpEHlaUEvToDTvULYspEO2r+g1DYqloCMP56MXNdbrdFBwTRn
	NejqBQA==
X-Google-Smtp-Source: AGHT+IGLgMx8/9lh4/3RKudWfKdHcAxrgOSVcELrAv1teNjtA01GeB/gBYB47ZMjb9I6/D90qEYg2B0QupY=
X-Received: from dlai24.prod.google.com ([2002:a05:701b:2718:b0:11b:9bdf:e45c])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6709:b0:11a:29e5:12e5
 with SMTP id a92af1059eb24-121722ebc26mr14702784c88.30.1766439102487; Mon, 22
 Dec 2025 13:31:42 -0800 (PST)
Date: Mon, 22 Dec 2025 21:31:25 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK64SWkC/2XOQW7CMBAF0Ksgr2s0M5k4dle9R9WFMePEEmDk0
 KgRyt3rIBBUXX5p3v9zVaOUJKN631xVkSmNKZ9qcG8bFQZ/6kWnfc2KgFpEdPo8zDvWJND4LjC
 7wKrenovE9HPr+fyqOZZ81JehiH9qIEfI0NC2wa4lgxp1yfPhO3/0OfcH2YZ8XMuGNF5ymW8/T
 WatvM8T3Ocno0HvjHEsGCH4+Nqw7k/dK8MH6yrbR8McvSG08I/ZJyNoH8xWFlon3oJnbu0ftiz LL2FNd0VGAQAA
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766439100; l=5442;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=8GRHby7CsgIUuMvd/G3w3lvZBnsDPhPngnyEMQAQyNA=; b=OlbCSy62DL0WMqBZhy7cQn+WYiE1/az9EYugvDiloHKYmktgSFXT2UsCxs4UBYsxzGWdMMWG4
 E7V9svn6TXdDg0XogHakbyVOn19OIthHHWE5SH7UfkCd9bEzkutuqmS
X-Mailer: b4 0.14.2
Message-ID: <20251222-phyb4-v9-0-82c0b671b070@google.com>
Subject: [PATCH v9 0/2] Add Google Tensor SoC USB PHY support
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
X-CRM114-CacheID: sfid-20251222_133143_974043_13BB7129 
X-CRM114-Status: GOOD (  19.95  )
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

 .../bindings/phy/google,lga-usb-phy.yaml           | 133 ++++++++++
 MAINTAINERS                                        |   2 +
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 295 +++++++++++++++++++++
 5 files changed, 441 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>


