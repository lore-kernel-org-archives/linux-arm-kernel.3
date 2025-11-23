Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C51DCFD318
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9revTTPtP9KzSqa+QgE4sbj77S9tCSdz7h2tKAnYgjQ=; b=g1IYhT1JU8EyLn
	7m83d9P23cVELg8Nyocl8H2Sy2kY2PH4fBWpEhIXLkTv61xH3IBRoGS1+ZzNvKVjuVEFK7W0x5Xb0
	8PYIbnGaKknEcWrOx9FLWgRg1/+cEsBV6c6s9oSsDsZZ+fbqZ8yMOjBGjLXwc8amTSbkKgvmbqThU
	Tft0HzgMELKw3ciCCMqEIMesxAoPKr9WNyISGVOss0w0d7zKAaZqBXpJVmwtZgXqams/cTowtwy5u
	uXYpguTEDrqZxjIFuccvu1B6efzi/lk++gR2VmC9PXJDUlJf17aokyxvoaXT22Y6yEgJWeXZG0I5d
	f5/hybbkep1hKYvLfUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNHVQ-0000000AhzN-0RJm;
	Sun, 23 Nov 2025 21:20:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNHVK-0000000AhwL-0VD3;
	Sun, 23 Nov 2025 21:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF34D416FB;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7957C113D0;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763932814;
	bh=LoanKKAnkIpUTY1jemDQ8gy05dpp6akYvg2JStglEpU=;
	h=From:Subject:Date:To:Cc:From;
	b=iAG5nrN3R0G9TFdCi2zIXy4MxXsa6qHGTBLRG46b3BVmtcNvLbDCoBaXpPeGCVmM0
	 ebW0vHW6C6K0YsbHrAIL1TcqZgb1ae2hYdvpqsJg2lGlAa7Hz8w0YgZzvd0ZuqnCMe
	 m1k5xNZQCMtFeTw//RStRz/ZkqWOnVKHI9QM70aKR/FzIcusec+JPdcFKNXjKkSMP/
	 b+YybPfxqUsQBcTiEif6UfOI+6r+HB9FSwJvxe67JQX5rTaeINywkE725gedK745fz
	 yPB0V17VDSeonRVbWohSOWadRU0WXsa39jeWO+U1rgh91/JhHVXa1/jHm+82nfMjUb
	 xJzmeQgk6m6Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F582CFD317;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH v2 0/3] Apple Silicon Type-C PHY
Date: Sun, 23 Nov 2025 21:19:53 +0000
Message-Id: <20251123-b4-atcphy-v2-0-34cc7092b22a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHl6I2kC/03MSw6DIBSF4a2YOy6NF1/FUffROFC4CGkjBgypM
 ey91HTQ4X9y8h0QyFsK0BcHeIo2WLfk4JcCpBmXmZhVuYGXvMESKzbVbNzkanam2rGTohKqxg7
 yf/Wk7fu0HkNuY8Pm/H7SEb/rT+HtnxKRlUzfcELOGy1ke3+SX+h1dX6GIaX0AfPorb6jAAAA
X-Change-ID: 20251013-b4-atcphy-d6a7c939d417
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2840; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=LoanKKAnkIpUTY1jemDQ8gy05dpp6akYvg2JStglEpU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ6ZyVeu00EdbJs7uqfxeYbVpXWLD6msvOUpWRr3I4jHed
 2mei+z+jlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE1ggw/HeKk/1QVM1jzvpD
 5dz9qOo3V9YzBZmncNtHKDSZpc9XmcDwP9CXZf2GrIai3S/SKjc8+9vFeuyciXyX+CL26HdaZyW
 OMwIA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_132018_218088_D6E39C3F 
X-CRM114-Status: GOOD (  11.94  )
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

As requested in the previous version of the Apple Silicon USB3 support
series this one only contains the changes required for the Type-C PHY.

The generic tunable support inside driver/soc/apple will also be re-used
for Thunderbolt later but it's fine to take it through the PHY tree
since thunderbolt will depend on that anyway.

Changes in v2:
- Link to v1: https://patch.msgid.link/20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org
- Picked up tags from Rob and Janne, thanks!
- Added additional sanity checks for the tunables to guard against bugs
  in our bootloader (Janne)
- Used struct_size from overflow.h instead of open-coding it inside
  tunables.c (Janne)
- Fixed a bunch of typos in atc.c pointed out by Mark Kettenis via IRC

Changes since v2 of the combined series:
- Link to v2: https://lore.kernel.org/asahi/20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org/
- atc.c:
  - Removed a bunch of outdated safety checks from atc.c that were only
    required in a previous version that did not rely on the dwc3-glue
    driver
  - Addressed Philipp's review comments:
    - Added documentation for struct apple_atcphy (and a bunch of other
      things while I was at it)
    - Moved the mutex guard from atcphy_dpphy_configure to atcphy_dp_configure
      since the first one doesn't touch any shared structures or MMIO
- apple,atcphy.yaml:
  - Added a generic apple,tunable definition that uses uint32-matrix
    and refer to that one from the individual tunable properties
  - Adjust the tunable description to make it easier to understand
  - Limited all lines to 80 chars
  - Used > for longer descriptions
  - Fixed some typos
- Picked up r-b tags (thanks!)

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
---
Sven Peter (3):
      soc: apple: Add hardware tunable support
      dt-bindings: phy: Add Apple Type-C PHY
      phy: apple: Add Apple Type-C PHY

 .../devicetree/bindings/phy/apple,atcphy.yaml      |  222 ++
 MAINTAINERS                                        |    2 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/apple/Kconfig                          |   14 +
 drivers/phy/apple/Makefile                         |    4 +
 drivers/phy/apple/atc.c                            | 2294 ++++++++++++++++++++
 drivers/soc/apple/Kconfig                          |    4 +
 drivers/soc/apple/Makefile                         |    3 +
 drivers/soc/apple/tunable.c                        |   80 +
 include/linux/soc/apple/tunable.h                  |   62 +
 11 files changed, 2687 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-b4-atcphy-d6a7c939d417

Best regards,
-- 
Sven Peter <sven@kernel.org>



