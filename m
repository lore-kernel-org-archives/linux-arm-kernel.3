Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB067E6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8N9mO700aesdOr2MufRM3aoRWUCGpTCARZQcRP1KgoI=; b=dZbiX8dFtL4NUCFW6+e7uH1upO
	uoqLTkUuw5cr/4iVImOoUp0UP6ezWYDv0ejYZhxYBRZEIeKpn+7PJnzcaJ6qttHVwBlUfmclCHvo+
	M5ei/f3RFDWIhOvmH7dqIKdBhqctUJXIz1yhYFXob3999Y2GvodOkB9fdzCKu8lhYrTN2itPf3IM1
	5hY4CVeupGDr+KL3Yp4Ddh79jzXSX05vsAaJhLztfcsD4UpPx85eenY6aAaXYkWL0E2TyIX9CK+g9
	60xCN9StF5sT2LDl5aJOj+lA6GvyCIznkY999lcV5M2vkditCXhSgVRjeEGHlcv3zvQ1Lw8Kc+1Gr
	5Q5C+ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6siP-00000007M7Y-0rk6;
	Fri, 01 Nov 2024 14:33:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6saV-00000007KPl-3F8d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEB5D5C106F;
	Fri,  1 Nov 2024 14:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61BC2C4CECD;
	Fri,  1 Nov 2024 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471118;
	bh=G0qwyxNvo32PglzTqhei8HtXuP6KaKJ/ZPAyTNEr4ow=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=epfmS1nfY7m4X21UkU8Yhve0XFPrQq/PTKISo4zjRSojhjHMmw+dcvjN+o41fxJYO
	 gOfgx+9Rp7kHFA/axgcrhqhGAsS2QfeQWmCvIGDn5L5hg7OMoqTnwOuTiWHnt491Kp
	 CgCkwOiSfXA+DRPY1ro/zhMBLTk7XNm87nx4/HDmC3Kot6GscvRHjUB3cRJdpo+XZx
	 u6udxCJuceQYC7uavzZwgkkqTZLU+v1IK+BN8k93L8KPlcNF1kpq+oJ6DFcZN5uNl4
	 bFeHCx4ICRxuTlDznX+mzYZlwaBlXrbtM2TiZuGlG3THHWeME8eTYKEXCXtTzRzsFA
	 hXcqRe59P2rYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9B4E6F064;
	Fri,  1 Nov 2024 14:25:18 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v2 0/3] Apple SPI controller driver
Date: Fri, 01 Nov 2024 15:25:02 +0100
Message-Id: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7kJGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDC0ND3cTixIxM3eKCTN00C3MTg6REc0vzFHMloPqCotS0zAqwWdGxtbU
 A+JADClsAAAA=
X-Change-ID: 20240811-asahi-spi-f8740ba797d7
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=G0qwyxNvo32PglzTqhei8HtXuP6KaKJ/ZPAyTNEr4ow=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnSVJ2eUV0+uaQqSM1ZfYn3i6Wpx430vJhQ6CJ6Ib3M8r
 tycUizTUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCIzVjEybP/stWZzsvCBxuBI
 600bTrw5Hrz7gNT0oJbvy4Icn2zXnMDIcMSaed6iqutK05cW+BQ8UeFVP6jSErb22QtXm5y/hn8
 msQMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_072519_955179_51ED7227 
X-CRM114-Status: GOOD (  13.77  )
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
Hector Martin (3):
      dt-bindings: spi: apple,spi: Add binding for Apple SPI controllers
      spi: apple: Add driver for Apple SPI controller
      MAINTAINERS: Add apple-spi driver & binding files

 .../devicetree/bindings/spi/apple,spi.yaml         |  62 +++
 MAINTAINERS                                        |   2 +
 drivers/spi/Kconfig                                |  11 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-apple.c                            | 531 +++++++++++++++++++++
 5 files changed, 607 insertions(+)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240811-asahi-spi-f8740ba797d7

Best regards,
-- 
Janne Grunau <j@jannau.net>



