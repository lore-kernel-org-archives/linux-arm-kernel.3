Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3FCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9aMZ6Yzq6+XChmlsszzm+10NDP2u7XtR0WlmCluUr9w=; b=OdUYynrewUnJPh
	Y+A9wvRkoO26JVilxgjOk1u3Au8cTW78vlqBulqGHoXkOlgeGTbrNz1lf2ELuSl9gNOpkgohBrjeR
	8uf0ax/OIVSqBYZqurNTa2WmdIaVmytbJYaA/K9Rnzk6p5OzxHD1l2VapH0hQWaFna9VexwwW1l+h
	cLyPvBjAA/iWIBGDAfaLS08g5/GVhUgJaGaEwAeGKqo8eQbyjScYUSA9Q5a8xJr5J+aCiZKhFwbU0
	BFKrRn3kE3n9jJBzwzQYYeXWe0Z+kbxfG8a6QhFGXY9WxgOz43O41D9iL1fm47efX0eQEpa7Iu8Mz
	BB+ua3d4D/jgaQF7P80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2D-0000000DnnR-3yIZ;
	Mon, 13 Oct 2025 16:04:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8L2C-0000000Dnmo-3u2a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5208062069;
	Mon, 13 Oct 2025 16:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E35F7C4CEFE;
	Mon, 13 Oct 2025 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371438;
	bh=rWotubb4CBnANwxKjnVhMxklcZzF6pHwe+WDhBKK4YI=;
	h=From:Subject:Date:To:Cc:From;
	b=INDtoDFE+pjOgH/g6E2xzS7J0AOM6w7kxweMsusiOCCdbdH7hEsB+UGFAiqAaQGZq
	 AuD9u4OIfNVSHF4CqqBqhXdf7ZXHZg4yjh6qLsdiMod7MK1QS37pmIYoSQMBrdqhXm
	 IhKos1I8nif5ocV64OGWVr4XS7GipKFbe2yLbd77ZL4C6RLWlyOM0LtH7te0gMH0fZ
	 FMpLPwsmPcp32rT6RfSKLtsUbdGKm+IGX6NIVNyr07REuuJl7nYHhehdUuX1+f5Cfd
	 nXXR8hzWOin2YkXeVbr5W5enfPZAuzJcfpIfivW03KvCtl6/HXdHrNz4JMDAjGLfMY
	 aRZhwqN3YtdiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF789CCD18D;
	Mon, 13 Oct 2025 16:03:57 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/5] Apple Silicon USB3 support - dwc3
Date: Mon, 13 Oct 2025 16:03:24 +0000
Message-Id: <20251013-b4-aplpe-dwc3-v1-0-12a78000c014@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMwi7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3SQT3cSCnIJU3ZTyZGNdkzRzSwNDS3MTwzRLJaCegqLUtMwKsHn
 RsbW1AN+dgqhfAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=rWotubb4CBnANwxKjnVhMxklcZzF6pHwe+WDhBKK4YI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ZbpYd7Mhtrgqq4uP7eSDjAe5Oh40mhc8r+3ScKNr/ep
 HnR08qwo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRnS2MDIuq1yQ2fuqavHjV
 5alW85k9jS1uHLeYZ/z2ykovNZujv4MYGSbO5L1yrmPb1RniF8WmJm/Yz3Rl364lh8+Xn28uZ4+
 TXsMCAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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
 drivers/usb/dwc3/dwc3-apple.c                      | 488 +++++++++++++++++++++
 drivers/usb/dwc3/gadget.c                          |   2 +
 drivers/usb/dwc3/glue.h                            | 143 ++++++
 drivers/usb/dwc3/host.c                            |   7 +-
 9 files changed, 744 insertions(+), 6 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-b4-aplpe-dwc3-4f79019741f9

Best regards,
-- 
Sven Peter <sven@kernel.org>



