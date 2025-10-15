Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0ABCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vVRjLbY1fsySLIWzw79+FibkJDr8S8HKF2ntGJ+FpQ=; b=nmsCF45ycQ+WgF
	c+BSMwTWVN8OGgGVH/uJe7g+Ys65JDpmuckrEp6f86AgIuphMJYj+xfIuKyQoSwmXiQN64zugfkdK
	hrdBWJXHColBk2i7D3lkNkhYE9b1pB/Cole/QHeuj9yZGMhxEUz3quxyw3CddPwxXNOpkyPwhKWlS
	ulYt9OJMHk3upGQioGGfkFEGiSz0430ny4kJVviQf8jY3AVYAsdD+UKgIXnFPWVUmBZ95i+w547V5
	b2oBH7kCpDPFyZqbomnFR7hPmAz5yi/aoJCBkdPkRiHJ6M0XkzL9oF2JJcTUNccsQ7vcgXeznoyYv
	r87uQWmDJmzgWhUaD73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cp-00000002883-4622;
	Wed, 15 Oct 2025 15:41:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ck-0000000283h-0mNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:41:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9450A4555B;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65AABC4CEF8;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760542869;
	bh=jDD1jxLWDqxUDxesIU9RCN0rgJCoWLFeBdfc8PLouSE=;
	h=From:Subject:Date:To:Cc:From;
	b=a6vs4vGq03raDuXSgrQqg5hENlMl0xnf5Vu6aas3ObbKOIKH780VRpmv2+Y8Bbdfn
	 bNrvL6vf0CU1rqSE1Ve16c/N6kxxBUsfrAhNLMkJfy0wU+bI9s4EA+ARuiyF2Fk09V
	 KI6lYhh5w90WeblZDVIOHTI7LMo12jBWJr2yLnmyCItRdmTzhU6k14NzyLKIp94e1E
	 4M9ywcK/GmxPEb+WprYIujw5IEKl54RcXLirNtIlZiydxf8uIxG2L7MvOW/5YVsR0s
	 7Zev2ArYnDG1zp9ESpPS1axy/W0rUEsal8w3yYCITQjpTP3eHvlY2H1dg+1JR6NR9o
	 +5W1t4DSUqJJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596EBCCD199;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH usb-next v2 0/5] Apple Silicon USB3 support - dwc3
Date: Wed, 15 Oct 2025 15:40:40 +0000
Message-Id: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHjA72gC/3WNQQ6CMBBFr0Jm7ZiZUoO44h6GBZQpNJJCWkQM4
 e427F2+vPz3d4gSnER4ZDsEWV10k0+gLhmYofG9oOsSgyJ1Y+IcW43NPM6C3cfkqG1REpeFZlt
 C2sxBrNvO3hPesUUv2wJ1MoOLyxS+59HKp//TXBkJWTXFnYgMsa5eEryM1yn0UB/H8QMSfIMRt
 QAAAA==
X-Change-ID: 20251013-b4-aplpe-dwc3-4f79019741f9
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, stable@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=jDD1jxLWDqxUDxesIU9RCN0rgJCoWLFeBdfc8PLouSE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8b7A93N2e//l16/ae2y5/XqqMWmLmbfWU6WG6zirWaUS
 e8Pkn/TUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZiIzl6G/56xG6JyT7r+iFV+
 9Wvx5YgDi5+ntc2Y5ioaZ/TnaM/r6UsZGaY/errN7IaZ5rYq329vmDVmvvK5f2FC9dElvDN3GoY
 7tLIBAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084110_272932_6D1F9FC8 
X-CRM114-Status: GOOD (  11.23  )
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

Hi,

As discussed in v2 of the combined Apple Silicon USB3 support series
this one only contains the dwc3 changes without the DTS changes.

Changes since v1 of the dwc3-only series:
- Link to v1: https://lore.kernel.org/r/20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org
- Rebased on usb-testing
- Fixed a trivial merge conflict in glue.h regarding struct dwc3_properties
- Added DWC3_DEFAULT_PROPERTIES to dwc3-apple.c
- Added Thinh's Acks (thanks!)

Link to v2 of the combined series: https://lore.kernel.org/asahi/20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org/
Changes since v2 of that series:
- Documented all functions in glue.h
- Fixed a typo in the example for the dt-bindings
- Added detailed documentation about how the dwc3 hardware needs to be
  driven on this platform to the glue driver
- Renamed dwc3_apple.mode to state and folded in the probe check into
  the new DWC3_APPLE_PROBE_PENDING state
- Collected tags

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
---
Sven Peter (5):
      dt-bindings: usb: Add Apple dwc3
      usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when required
      usb: dwc3: glue: Add documentation
      usb: dwc3: glue: Allow more fine grained control over mode switches
      usb: dwc3: Add Apple Silicon DWC3 glue layer driver

 .../devicetree/bindings/usb/apple,dwc3.yaml        |  80 ++++
 MAINTAINERS                                        |   2 +
 drivers/usb/dwc3/Kconfig                           |  11 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  16 +-
 drivers/usb/dwc3/dwc3-apple.c                      | 489 +++++++++++++++++++++
 drivers/usb/dwc3/gadget.c                          |   2 +
 drivers/usb/dwc3/glue.h                            | 143 ++++++
 drivers/usb/dwc3/host.c                            |   7 +-
 9 files changed, 745 insertions(+), 6 deletions(-)
---
base-commit: 877c80dfbf788e57a3338627899033b7007037ee
change-id: 20251013-b4-aplpe-dwc3-4f79019741f9

Best regards,
-- 
Sven Peter <sven@kernel.org>



