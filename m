Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4734D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+5NKA5OeLwYp2s18/2yRobCN4T2C7yfGfCP/KatkZRY=; b=G3ea+JSo+PNaBSQ33MoR6DVtwj
	qUECuKY3rDuI1ar9jjjjhq0rRxgRnhoCRz9siIHFX7ZeJPyELsycOb5e5s1x+OU/a/vxQc029DiTB
	jFkyOVEQp6ZChGqIotUlMj9bf2z/O7UEN+cDS8BTLAv5fpv6jIVA+Rb40snEXdm/OCdIzHS8eMacO
	LOm1tEZHV6vyGByGhZIQB5f7GuAjgRFqB9etUtRFg7DLLU9w8n+06/MEw2YVq0R7sOzOCfNeXGIGb
	VDJm/zvANBuru0cYr6pkbOvhnVk6D4VjegHD0kIb7x2vlpRSn5PtG7Fnr52gspFIqI/ypmWkrruyh
	OO8CxVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8F2o-0000000GM6i-2uKr;
	Tue, 05 Nov 2024 08:36:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EcI-0000000GHZK-00kp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E63C85C5516;
	Tue,  5 Nov 2024 08:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5994FC4CED3;
	Tue,  5 Nov 2024 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730794124;
	bh=dVybQkWmSxoyj1MofMAfodogbPNIcs6eTPaaE0ShWnY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GeR9jp0DvXAik3U57DiJEkoWf6UurPcas8la40H39wzxvMSwrstClx0I4YIO7Aew2
	 nx8ZYnWInFFnHhQELxRB8vQ4SqM2NBJ8RGocQEhrqVJDlVF1yqSJm/BCDB8fQb5YHk
	 /A3Om1fQLCM08HTh3jMH9F36tA87+S/H4zfQKLmVJQ5TLZiKHKYxAxThf1CmHClu4M
	 HSsYmABU4w7rCPtSrcEfj/UgJwAuoQYqjVJ9R1G8c8dJURr9cflHNV+Lp2aMv8QcR+
	 8fyt7i3UYYm3JBaJnxAPArkaUf+OkO/oWOxRfxs3n6VN4K4loVVzX4w7eePQqO1LtC
	 rdgwjH0UrtuRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA9D12664;
	Tue,  5 Nov 2024 08:08:44 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v4 0/3] Apple SPI controller driver
Date: Tue, 05 Nov 2024 09:08:28 +0100
Message-Id: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzSKWcC/3WMOw7CMBAFrxJtjZF/wYaKeyCKTbIhS2EiO1igK
 HfHSQUF5Ty9mRkSRaYEp2qGSJkTP0IBu6ugHTDcSHBXGLTUVnqlBCYcWKSRRe+dlQ26o+sclP8
 YqefX1rpcCw+cpkd8b+ms13WrKCW/K1kLKdzBoEdvO2/s+Y4h4HMfaII1k81f1RTVNGVu677xV
 P+oy7J8AP4MY8XeAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=dVybQkWmSxoyj1MofMAfodogbPNIcs6eTPaaE0ShWnY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnTNS10XevU7NxYuDXF4oD1r3aXWQzJfnvfrV3A4PHJg+
 Wt5kmNHRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIm838nIsGpS31nzvbOvrSxo
 z+2fcMReKujW881Py+wbF82XuvBP4THDH56D2bWr5joo7ps+8dDuBI7i7wxO8y0Xnnqz9Kjbbga
 fLE4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_000846_172740_F0152678 
X-CRM114-Status: GOOD (  16.07  )
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
      dt-bindings: spi: apple,spi: Add binding for Apple SPI controllers
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



