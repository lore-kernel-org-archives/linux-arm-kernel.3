Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ydesar5FhHHx6/l8d459cx4/lILciil7MkfZ2W+d/r0=; b=wQKJUu2yOVvLmj
	SKU85e7O9fAqW6fYdrfC1n6asTHrOFKgemlg8QdfaLh9LCM0yrLOaNt5iw647iXb8v9jcvIDWuh6j
	/+8Ayd+voYLBp+tb4yuJc5JtRaF6Q3e9EcU3sYjaqZ8XsaegMryMSJngu4rhOMKleFvURmi+jLNTD
	/7gv4mcEjJclqWjZ4/eFsk3T0e84PrBI/8Dolr3Wj13mguEKbkMXE2SXrx7i2o2IlFab7IUmq1/x+
	C3TEx3ZGLgL1YrHidwGzUxKl5RSJT91SiziCGlhX3aHlV76gYEmfnZEU/jv94UXangyrGr9QjYe9c
	KnkWkx+oZ7EokFc+fFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNts-00000003GGo-1rK8;
	Mon, 27 Jul 2026 16:09:56 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNtp-00000003GF5-1cva
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:09:55 +0000
Received: by chaosmail.tech (Postfix) id D24AB1C9733;
	Mon, 27 Jul 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785168589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ydesar5FhHHx6/l8d459cx4/lILciil7MkfZ2W+d/r0=;
	b=AvYi4nsYdg+8rPMAeUTGdQ/hBEXZpP1/yd2VC+9PA2kBWv25YGJES4JLsedWf0Loma+ftg
	YExfdHoyxEeWQ4vc0BSLz8OT6CO/T6vP+duF5iH2PEnHOdTKxmZYmQLeVsWoezxtoBkbMe
	BNCQpyYHupLE24Bhk34KgjFA600OLyw=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Mon, 27 Jul 2026 18:09:27 +0200
Message-Id: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4Xs2Zr+BBBPvofhUMpW1iglbW00p
 O9uwavHyU7m2xUCesIA52oFj4kCubmAPFRgJj3fkNFYGCSXDW9lzSItI9MGFeMdH2zdcrR1B8V
 fPFp6761r/+PwGu5o4hbYjIlCdP6zjyWxef+6STDOWlUuo2qEOulL+cSFp6bHMaKZoM85fwH8R
 vaVuQAAAA==
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785168588; l=2034;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=fMLAl8TbIzZK9hVkjbVOO1TXX3kATog6ZvDnFGAi5HY=;
 b=Gcs82Q0qCWdzvny+1xz06Sqbmh4SciYkQsRSMzeZylcmns2VWf5jQjM0ILfBwELKtDwesAVZk
 2w96FSSuXCRCbClpBHYwED4Ay0OurB1jXNkTmmoHV6qGe3T1p8XpwcL
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_090953_925649_513FFA87 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 ++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/tipd/Kconfig                             |  20 ++++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 240 ++++++++++++++++++++++----------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 104 +++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 288 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 675 insertions(+), 194 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


