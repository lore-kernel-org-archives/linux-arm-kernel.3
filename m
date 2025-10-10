Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A24ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=estI8qEVcPVY31PTAjZ7lIjF6tdHShVWJ6+L1IGJmXg=; b=jZk93vGRJME0+sY+B8YPUjTSes
	Tg4GHfrfMiXnBu1YbX60TwbwGibqq3BcPOP8y541YHw5aAStEMynzaKLCyUEzQ8uNEu4VLYLtFtu7
	x67SdIBOHjAWJlKN3G0PD3jofHEkqey4YncMW6wA/9it7zQu/fcTrGtRR9cz7EIZYi0unZkiTJN6F
	6sqxKjmCxhzyDXsDE5nfrADOiqu1J+A9h8j8AOH+cQviGbaB94VFamxqMDlKAVEzHFf6VekucrWDY
	qBb1uP0SCBfDtXmlXg2oFrGp3IPlM3QQm4y5c9MoUD4IGCvWqE0I15m2Ci4nBIDCbCaGC8ma+O/NR
	wO4Cbzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXH-00000009IQJ-1C1o;
	Fri, 10 Oct 2025 20:16:19 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JXE-00000009IPc-0TK6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 20:16:17 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b630753cc38so7554521a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760127375; x=1760732175; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=estI8qEVcPVY31PTAjZ7lIjF6tdHShVWJ6+L1IGJmXg=;
        b=RNgpeAsmkdTABb6sjw1/AQwt17W8D5SVJceexxTszd05wPi/3Bj0VBgQQBRpxA+1yy
         OvKQfwrUPVjbSem+PWhR17bzq8Ez/GPMuom7GfI2mFNymQQTOSo0RIs8m3tnxo4fTKom
         Trv4f8lZGUEJyBz4MzNNHgQ+2al7wIwUXG29KAWXv8qy/+mXhKQc3sbBewaZ9lZxteDw
         4bok9BNlDpNMpb4ReLlQz3sPIa6IA47jHRyVKV794QN192XQ8nnAxGPJ/iLIWPoaGatr
         n+QyWgruVGEpSsANAIiGe275LkKBzWE9RMc93giRYRnP0efCP17T8aQc58YgsbzClqNT
         h8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760127375; x=1760732175;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=estI8qEVcPVY31PTAjZ7lIjF6tdHShVWJ6+L1IGJmXg=;
        b=L8Z/LNT6knplHazT3I162LIMU0gpgeLct9583c4Px6MnKCtur3cqwaP+gjc3xSwqll
         3tK2mWykiWocoqg0mKGXGbRQ+Q/yB3jwGJlYXHOenOE+K7OIJgZChdIJWd+iWuN6XdAX
         dxNZeZ3bdewmZDqdhmdepktmEBPdACd/Df7W4yMXd/hO4REUvkkE0Ls+lOm/Vw8CCVh3
         BbM+VhCiukmtT8K3AUUlaTjPpG94aa8bxo/hlJstQTTWdU/te7YIr9pNsmCE2bWCdonA
         9zclsGz8BRsioH+5C1jlrNd9XE2aPYk40qRZgTTsxlTBXcLShgg2dXq+IJWLMbuHnMr5
         wjKA==
X-Forwarded-Encrypted: i=1; AJvYcCUJk40ArFbyjmM4Q4LOjfDVK5kV1iSM6BV705HvzTSE33rVIxLxFEQ5I1k+yxKuWR4BKmXZVCZT/sHm28McXXsQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzOd0TWw2L82IftLtVAqyshowsrp4HDn51DgYA0ZxebnTJEql1K
	kQLVqC2NHyxCYnW/P1NfYWKtlhDk2m7rqjB+o/FzyOPE81PGC19Uvi9YTgIjKjEv8ciuofI4yks
	L2Wysvw==
X-Google-Smtp-Source: AGHT+IFJD5qJ8MoWXYq3MeKta2yygNl8qvdxme+xxEYvwMoAACneZQcghqeTL0yFWDPZvoSjrD0dclHeIIM=
X-Received: from pgjq5.prod.google.com ([2002:a63:e945:0:b0:b47:34d0:d386])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2595:b0:2fa:26fb:4a5c
 with SMTP id adf61e73a8af0-32da84edd1bmr17849128637.59.1760127374950; Fri, 10
 Oct 2025 13:16:14 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:16:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010201607.1190967-1-royluo@google.com>
Subject: [PATCH v3 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_131616_158632_B58127B5 
X-CRM114-Status: GOOD (  14.18  )
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

This series introduces USB controller and PHY support for the Google
Tensor G5 SoC (codename: Laguna), a new generation of Google silicon
first launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
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
Roy Luo (4):
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver
  dt-bindings: phy: google: Add Google Tensor G5 USB PHY
  phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,gs5-usb-phy.yaml      |  88 +++
 .../bindings/usb/google,gs5-dwc3.yaml         | 141 +++++
 drivers/phy/Kconfig                           |  15 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 8 files changed, 1139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
 create mode 100644 drivers/phy/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.740.g6adb054d12-goog


