Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CAE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wve9RHN53mbv/Ig7aL5/nHmcIDdhMP+Lu9Bk+brTc+E=; b=XVQ9JS8ZVH5WdvYG9f64zgP5m8
	VwiXBEgodQ24zXBX6Hca2RyUYeP34+HUtRQ2fkYQKW56pztUcQxblB6sX/J/ANd5/gSyyryRWTfHl
	qK0fP12G885EUXGpPIsDtgwU/XkslUB2D4AlbXJBwvEgUfcd4DlojbzQfxBQpkcEBuxXbbf7LzMI5
	QXNnEteitCjypwPUh5Ik0gl0HGjdS2isQGHhhKw6M6nixX6cdITtFdGTZ+ZFVnvJ9KoxhLGOgKgZg
	3Vln24xv0KgA8fndkRXKkbthehN+p/mjrFW7IeeQpLNNDQimL7gHN2aauHUpw4sbk1/g1MFBTSxOF
	prpomfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xNI-000000088XK-3cGf;
	Fri, 01 Nov 2024 19:32:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xIH-000000087H6-1a0b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B616A44C44;
	Fri,  1 Nov 2024 19:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3351EC4CED9;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489208;
	bh=bNz1oB7QECkZuE3P038Od4nszwKOfKz7QoIkKxCF1j0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EjWMp/O978Wxf8uoB/+4FFLHVIsS0Q2BkZ7oE4NNABpEEr1dX094GH6XixQ97TbJ7
	 ImczDXNBhJa6WXNQGu+PonBxvci8ov6YNQIr1bsZz8radQLypCwwazGr2g9gjJ7Gc+
	 mFJ5SXfTsg4HKTNJ/2yLvTD4LSdrQvXHCwUmatjn/HNPo728Rp8InDr59husPigVq+
	 hskxFSljgqxbcGv8iYAURCLPCd94qM4qghl7vwgqbtX2U2G1wuwb2afZb0QAnSGbgO
	 4NuEoyLN9UAJkg8CkLvrU/Esk4BXeuhAAlVyT0qNRg6pS/nEyjEBaXr82H7okGpr1K
	 G04itdfSJHFXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BE7E6F07F;
	Fri,  1 Nov 2024 19:26:48 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v3 0/3] Apple SPI controller driver
Date: Fri, 01 Nov 2024 20:26:11 +0100
Message-Id: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMrJWcC/03MSw7CIBSF4a00dyyGVwQddR+mg6tQuQ5oA5VoG
 vYuMnL4n5x8O2SfyGe4DDskXyjTEluowwD3gPHhGbnWILnU3ArBMGMglldiszWa39CcjTPQ/mv
 yM727dZ1aB8rbkj6dLvK3dkUI/q8UyTgzJ4UWrXZW6fGJMeLrGP0GU631CwOaUVajAAAA
X-Change-ID: 20240811-asahi-spi-f8740ba797d7
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3003; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=bNz1oB7QECkZuE3P038Od4nszwKOfKz7QoIkKxCF1j0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnRV7TK207MXz2E6r9ZtqfBvlmvcjEXOFb84t0Xrqa6ZW
 7LeNCyro5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwERCLzAynObT2NL/SyPOZkXS
 PUWrG+/bQ2cd+v9yToa21WPWFZ8Z8xj+Z8RWCZuG/uK8/1fJnWNiVca3Eyu5WwtLL5clLDq3QuE
 uDwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122649_585928_1B18C909 
X-CRM114-Status: GOOD (  14.59  )
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



