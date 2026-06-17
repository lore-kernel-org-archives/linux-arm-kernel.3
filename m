Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C5BCD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5S8c+9265Ras9zpAEPF+rOVhZtZVmdYshuAPmQtjco=; b=HXyqZOp17X7/UYJqzKlH6Zi7Yz
	nbZGdxIfr+s5hFM51TvFai80ts3zbfKt0ajA6IZPUhyGpIlqVIeDIPbw/F/wrlZ9iZp8nNdQwqIXb
	OO628DvyKoDaWH7NJfsaVSkJa3i+LVefmenn1lGIRKQDqv1lo1niklEJNGzXKgCgqj49zW+3rx3VY
	5tLGYPtEn4Tv7JCXZ2E62876uCen4psK/G41MDyShIsKR5LErmGDjJQjFEZs2kDuUPLUDpABsB08i
	cGI3IOfHWSM/hKaxq4f9qpzd8FZJkGCIsMN2ylEsUxEWZpBI1fem0xhqiDxhP7JNuOjLz84L2QO5j
	8sxObtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmt6-0000000GyAC-1VK5;
	Wed, 17 Jun 2026 09:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmt4-0000000Gy8t-43Vg;
	Wed, 17 Jun 2026 09:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5820640219;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C86DC2BCB0;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781689726;
	bh=91y/4NW3pjUnh65ElxLcQOaaQpGxFz1SMdgxGt9yKDU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uPYjGvca3FSZ/Zv8yRUB/I01FXlXSQaKdYprVHvoW+2oP8f4hcvO8N0Vj5PiRF5fA
	 IXNpWufxIXc5foRb+ESNEV84JZIYnYYaXiQSTaXjsLHzyxRQ3lW0+k2P9mkdtx9GFg
	 wyZKliQASG039LwNBBHBmsiev0pwYnl6ujz91TXn50f7Jglf0vRmHzYkZhlpMTkzTN
	 l4dPIcFm7tmO9S+Tsb3qHPdZaHr8ZdcAJ0ADo9aIdwAexynIteF7563NabFVFa53h5
	 lZbqRkJLmrEwFsQl/W151Bvy71AiyB2VYrjtPn9zojG7UWGdKh4ahF8fcqhVM+Cjd+
	 bbu9o78OyZaPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11304CD98F0;
	Wed, 17 Jun 2026 09:48:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 0/4] nvmem: add support for the MediaTek mt6323 PMIC
Date: Wed, 17 Jun 2026 12:48:43 +0300
Message-Id: <20260617-mt6323-nvmem-v2-0-4f30e36aa0f4@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ7CIBAFf6XZsxig0qSe/A/TA8XFrhFoAImm6
 b9L69njJPPmLZAwEiY4NwtELJQo+Ary0ICZtL8jo1tlkFx2vBOCudy1smW+OHSMG3XS3Eqrewt
 1Mke09N5z1+HH6TU+0OStsRkTpRziZ/8rYvP+pItgnI0KxdgbVMLKyxxDDt5peh5NcDCs6/oFG
 mxoQL8AAAA=
X-Change-ID: 20260611-mt6323-nvmem-0c54a0f2fa9f
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781689724; l=2005;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=91y/4NW3pjUnh65ElxLcQOaaQpGxFz1SMdgxGt9yKDU=;
 b=bRKJeEGUlopiiIajXXmD4ejEcqu+vA8YYV6VigV74sP/9hlGeO6cF0gdKfsZeq6KKWyyB6o6d
 VToFsl3t5RcA9XXXxintfKjYde55tjh/K6OAFyE4PY2kOt3kQJM7aRc
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for the EFUSE found on the MediaTek mt6323 PMIC.

The previous version of the series for all AUXADC, EFUSE and thermal
drivers was split after Krzysztof's comment [1].
    
Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
mt6323.

[1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>

---
Changes in v2:
- EFUSE driver: Sort variables in the mt6323_efuse_read (Andy)
- Link to v1: https://patch.msgid.link/20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com

Changes after split:
- EFUSE driver:
    - Remove 'linux/errno.h' header (Andy)
    - Remove explicit cast to u16 in the 'mt6323_efuse_read' (Andy)
    - Reword comment in the 'mt6323_efuse_read'
    - Capitalize MediaTek in the module description
- Link to a previous series: https://patch.msgid.link/20260512-mt6323-v2-0-3efcba579e88@protonmail.com

---
Roman Vivchar (4):
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      nvmem: add mt6323 PMIC EFUSE driver
      mfd: mt6397-core: add mt6323 EFUSE support
      ARM: dts: mediatek: mt6323: add EFUSE support

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   | 21 ++++++
 MAINTAINERS                                        |  5 ++
 arch/arm/boot/dts/mediatek/mt6323.dtsi             |  4 +
 drivers/mfd/mt6397-core.c                          |  3 +
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/mt6323-efuse.c                       | 85 ++++++++++++++++++++++
 7 files changed, 131 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260611-mt6323-nvmem-0c54a0f2fa9f

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



