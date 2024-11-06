Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EF1D29FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mKTX2+Jii3Op1+z+x1gy8a6aipWcXXVR6ig9L16J1pU=; b=YDd1ITQbc/5Gr4QGHPqI0JetOb
	tT4aIOoGhX4ycvOy2LBXv08CDltfEWFIZdpAcEDOxIr4w2cwgVDIUM+8t+WfCxnuRUl1bNzZVk8G+
	EQgx3VvDNYPtapQJjJdXFiwwRzDSiWbEzANcmt6zdvCmzqnFkABVtZzNvSZIVxyS7DXNWLMzLkOOl
	y3/0O96GrGb+gDzyQKZlO84Hd/5KuUyql/0xo+urdZi/63umvF8F8/1gzAOUX2K6/G5CnUvwCWg2E
	ZCGIwYVbclnRXF+vRrmr8dmnV+AXq4BMiVrZh5WVDaLehcGsGVvo9IAeYPPHMRc6YYGwQvRRm7NW6
	bSxZe8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8axM-00000002CS2-2mT5;
	Wed, 06 Nov 2024 08:00:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ary-00000002BSH-0PcY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F967A4296B;
	Wed,  6 Nov 2024 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE4A9C4CECD;
	Wed,  6 Nov 2024 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730879664;
	bh=eMru1U320VfLOEr90ChBn78/932lYaJiS4lfyxZ+a6E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BNrOPW/L2fUtsOcrZkYwIgKaRivTA/DTqkC7Y6NIExV9fvgYj1C5WtUZsTnaOgG8y
	 5hL4FlseMM1lNATolCdE8fZC3zcw7upmdILR/7Mr+uQ1fCy3Kb5Ak8DQuc0StTb27V
	 TNvgRs32vAgrnhEjg4j0x2cpYyhD1f8ZIncF6uhKYHg+GDRk/sQdZ2ifmaME4WmqGQ
	 l1JSYY8XJ5e1I/Xj6gbOk2IA8BytxgkjTgh/jk7KVQiSto7htMA7+UZ+AUlMf/ZeIw
	 84OOjZpFQLcDv4yGpeTusTkg2c/FB/FFqPiC13koZH1dMicapg+cVPdpwq8z2Avxq5
	 Vr8vwRLuOSe5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1359D29FB6;
	Wed,  6 Nov 2024 07:54:24 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v5 0/3] Apple SPI controller driver
Date: Wed, 06 Nov 2024 08:53:59 +0100
Message-Id: <20241106-asahi-spi-v5-0-e81a4f3a8e19@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcgK2cC/3XMTQ7CIBCG4as0rMXwK+DKexgX0wIWF7SBSjRN7
 y7tqsa4/CbzvDPKLgWX0bmZUXIl5DDEOuShQV0P8e5wsHUjRpggmlIMGfqA8xiw10qQFpRRVqH
 6Pybnw2trXW919yFPQ3pv6cLW61ahlOwrhWGC1YmDBi2s5uLygBjheYxuQmum8L+UV8rbeu6kb
 7WTP1TsqdxTUak1igtPtPGd+aLLsnwAY7dM+hkBAAA=
X-Change-ID: 20240811-asahi-spi-f8740ba797d7
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 Nick Chan <towinchenmi@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3507; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=eMru1U320VfLOEr90ChBn78/932lYaJiS4lfyxZ+a6E=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnRthfVb+H/8fi5RsvCV/NTtJStm/uJeLea+SVGV/XrSt
 hsTzCfN6ChlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRe2EMv1l25t6db/GY/aOn
 gVm/QavywfUlex72HuddsULbsrWKM4fhr7Sz7YPsQ+s+bMhadjzsapdv1InuFaLGajy8hX1Mhht
 /8wEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_235426_466061_A9AE17EF 
X-CRM114-Status: GOOD (  16.42  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

This updated series address the review comments from the original
submission in 2021 [1]. It adds a new SPI controller driver for Apple
SoCs and is based on spi-sifive. It has been tested with the generic
jedec,spi-nor support and with a downstream driver for an Apple specific
HID over SPI transport.

As usual, I'm splitting off the MAINTAINERS and DT binding changes.
We would rather merge the MAINTAINERS change through the Asahi-SoC
tree to avoid merge conflicts as things trickle upstream, since
we have other submissions touching that section of the file.

The DT binding change can go via the SPI tree or via ours, but it's
easier if we merge it, as then we can make the DT changes to
instantiate it without worrying about DT validation failures depending
on merge order.

This is mostly Hector's work with a few minor changes to address review
comments from me.

[1] https://lore.kernel.org/linux-spi/20211212034726.26306-1-marcan@marcan.st/

v2:
- removed '#address-cells' and '#size-cells' from the bindings and added
  Rob's Rb:
- fixed (new) checkpatch warnings
- added t8112 (M2) SoC
- shorted long and complex source code lines
- switch to devm_clk_prepare_enable() and devm_pm_runtime_enable()
- switch to dev_err_probe() in probe function
- removed "pdev->dev.dma_mask = NULL;"
- got rid of apple_spi_remove()

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v5:
- use devm_spi_alloc_host()
- switch bindings commit msg prefix to "spi: dt-bindings:"
- Link to v4: https://lore.kernel.org/r/20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net

Changes in v4:
- removed the label from example in the bindings
- really added Rob's Rb: for the bindings added Reviewed/Acked-by: for v3
- alphabetically sorted #includes
- removed leftover platform_set_drvdata
- Link to v3: https://lore.kernel.org/r/20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net

Changes in v3:
- fixed bindings_check warning
- converted top file comment to C++ style comments
- dropped verbose dev_err_probe after failed devm_* function
- stopped setting field in zero initialized struct to 0
- added error handling for devm_pm_runtime_enable()
- Link to v2: https://lore.kernel.org/r/20241101-asahi-spi-v2-0-763a8a84d834@jannau.net

Changes in v2:
- removed '#address-cells' and '#size-cells' from the bindings and added
  Rob's Rb:
- fixed (new) checkpatch warnings
- added t8112 (M2) SoC
- shorted long and complex source code lines
- switch to devm_clk_prepare_enable() and devm_pm_runtime_enable()
- switch to dev_err_probe() in probe function
- removed "pdev->dev.dma_mask = NULL;"
- got rid of apple_spi_remove()
- Link to v1: https://lore.kernel.org/linux-spi/20211212034726.26306-1-marcan@marcan.st/

---
Hector Martin (3):
      spi: dt-bindings: apple,spi: Add binding for Apple SPI controllers
      spi: apple: Add driver for Apple SPI controller
      MAINTAINERS: Add apple-spi driver & binding files

 .../devicetree/bindings/spi/apple,spi.yaml         |  62 +++
 MAINTAINERS                                        |   2 +
 drivers/spi/Kconfig                                |  11 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-apple.c                            | 530 +++++++++++++++++++++
 5 files changed, 606 insertions(+)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240811-asahi-spi-f8740ba797d7

Best regards,
-- 
Janne Grunau <j@jannau.net>



