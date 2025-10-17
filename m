Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A1DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=epoAusswG5dO23h2QFaAnAg30xN4jI6h3Smw2Tdo/d0=; b=FDXq5Un5EPiBkzB/D3RUSIY9Yw
	/6WOApYBMSKcE+yrkU/5o+2w7IEFkJqATItS5yueQkzwM8APRBaldnj0AK63f5dFFbQRBmNqNBtgq
	cdvQ+JEUpADEDvWXsWTLLz9E5Z5OeS7YllHNrAbcuvQwuCGgiprzRdDa3Sfly6KmgSdAgiI0h+NKN
	KZ5cYKswnwLQQzXQUyxuj13o4KmuRfkp5O1GmWa63E/PChfpLzgsot6BdDtF9vc0mWNl+OlBvW8RC
	5DKs42SC9jDapEW/e4YBqahvflpqUvh8HHw2vZPsfw8LgNyd6aHweKZjna05nbbd0w4yBHXuznWn2
	WkRRja5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uF5-00000009D9n-1unw;
	Fri, 17 Oct 2025 23:52:15 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uF2-00000009D8r-2jDj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:52:13 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6a2409137dso2065314a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745131; x=1761349931; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epoAusswG5dO23h2QFaAnAg30xN4jI6h3Smw2Tdo/d0=;
        b=WiOPrSGpT6Cuy85E177C/YxJ0HQnLl5p8vWa9HWGvrsEJQ0AjEi/aEh0ImA7sVYaLk
         kNsqQW+NyJrcpld2LRuqAV+24f+zMxLL45r/fN0gjPiOJHtXW7ZlLe/WSCtqPn0Pcqeq
         TNFBVfdJDkWZqVZI++7gTCyhmuCA4Vyvy8X8/2DVeD6FSEV6RgHv8wgXhZrF0wfLTBg+
         sPD9+WPdd+msdDdNt+V3hIL7TsuL4QtxoqgyQzgmTfMryZon37cr2rIltwCY0vMdizcL
         mWWFDguFeg/iGEoATXMbQJxEF2DdhyMOjnsqHbhzl9G3TcHKeDK4WA1eA4hxxX2g4LCK
         DcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745131; x=1761349931;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epoAusswG5dO23h2QFaAnAg30xN4jI6h3Smw2Tdo/d0=;
        b=i5INddR1OigyGSU47kAdQimpnovW4f+E+ZMnux8wJEdx87WeqdtdowFzWVwAV80a7j
         egNxiKUlnDhs9G3OOV9EQfn+TfwO9aZMJ6TBejRtcWCZDzVnmcM3RuNHgaDHmFo+vLKC
         Nhe3ri07EiOlWfjkkDMmmMHxttw36I4utGQzj/Lq8Dbt/K08Ps6Jhj74x+XcT3dX64YG
         wykAhCnkLK1KUk0cVBY0IbC6Btz+Cur3Vhte9Y5J48U8VZI331+SJVh67bw2pfXOafxw
         fxVqOKuAJrwXFivm1s36uqK4To7xiR3FN7+trHwwdeTPUXOx2IPAiYPcxkExoT+GX6/R
         Ed1w==
X-Forwarded-Encrypted: i=1; AJvYcCXpWDHQI7M9kGkkPfXAsTTcGRy7UKZ5fGCiGCMgrmYgwTdp+nKXayVR/U22MVNyZPbibi2xePCHIy2pNmHgUiL7@lists.infradead.org
X-Gm-Message-State: AOJu0YziAgcX2hN2Eb+aNI3J/yLzl+pEeUHzBhWJtC4pG9trNb6jJ1p7
	Z+VX/WKaX6xlyPu8FACt6RYihey+QiR+OI+JpA852iUo7yBSD3WRNmAQp0WUh3BVRNSWfJ8oUeH
	2vEAWdw==
X-Google-Smtp-Source: AGHT+IFpvneIuRadcbPDmZxphSwx/I7IpPbqWA7MW5ybUCSkZbjENPhFaSSItQAT3k9kMr4I9sKjw9HCWMA=
X-Received: from pjbds19.prod.google.com ([2002:a17:90b:8d3:b0:33b:51fe:1a84])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea03:b0:26c:3e5d:43b6
 with SMTP id d9443c01a7336-290ca217ac9mr72880525ad.32.1760745131078; Fri, 17
 Oct 2025 16:52:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:51:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017235159.2417576-1-royluo@google.com>
Subject: [PATCH v4 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165212_684783_EEE10988 
X-CRM114-Status: GOOD (  14.53  )
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

 .../bindings/phy/google,gs5-usb-phy.yaml      | 104 +++++++
 drivers/phy/Kconfig                           |  13 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 271 ++++++++++++++++++
 4 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
 create mode 100644 drivers/phy/phy-google-usb.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.858.gf9c4a03a3a-goog


