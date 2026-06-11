Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06600CD98D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ys3gYF5mHRxN2CV5YUunPdyVdta6y7NEk93XycjFXMo=; b=Q201v/hB9ZOIHDzFo6xWFuIeKG
	nfFi1zGTDsRkP19B0iSYWiyeicz+CLsxPRVvESjrzWWJwlbx+6BqA16/zQTXgofZu39U6OVmtRn3t
	gG7PzMlNjyXh/IMZs6G1NkT/K0slvl6S3oTh/+PQafvmNG4AGzuZfwSqOGbbVimq6+SKZshFU82wc
	Mq7Jm6NyowiBvFAM4H3875lIGz4pS+zBrbT7znhKg8zXX11liuXJsINYbuccaIizhoSZqJ0EJ0MOB
	IRW2KEFnYdybZKHmeAhE7EwqnFaaCZtE9n6d6J9ZcM6VDRzhaxQe+X+8yrH8grxAmsfCDje9ZtlfU
	oddR+lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcXa-00000009DJC-0Egs;
	Thu, 11 Jun 2026 10:21:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcXY-00000009DIK-3RZD;
	Thu, 11 Jun 2026 10:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5938B40A42;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DAD3C2BCB8;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781173296;
	bh=Tvmqx4pYtJuxtoQ3R62SMg0IdP8UogvEPTr0AvaCegU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=slKqyvkTYrfzKN5d/aJE5DFcGmfalGKJ3HBfJrB6YNvv4vLONkqy1mIB8AYz1t5Gf
	 mG5DfJW0HccIEmOi9JbRKg89sszrHi8MB9I13CGeHUDNsKYcqvDpX9ETqMO5kJNsv/
	 uy0rl2Wp1qeZG0m/WmTFWFW63wxr+KiYVN1WBqGEetf91Qex+RZgUpu7KzBFpdTVzK
	 KknCOx0+b4/FIF/AbhuNVtKqo9Wcl7KtVk5lrUOr26urp6saPfI+msJua9rD81gF4y
	 nLW5WailNMuNy7T6GEEVrJTZO2g7g23BabiOeKLIErSUR3v5IEfZDWITpaWzLjcp2o
	 jeA1xIrnSWX7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1390FCD98C7;
	Thu, 11 Jun 2026 10:21:36 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/4] nvmem: add support for the MediaTek mt6323 PMIC
Date: Thu, 11 Jun 2026 13:20:28 +0300
Message-Id: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBPUSqirRAuzsSbQQiuC6O5ZL
 d/i/wsiBsIITXZBwIMiLT5B5BmYSfsRGQ3JILlUXAnB3KYKWTB/OHSMm6rU3EqrawspWQNaOr9
 d2/2Oez+j2d4H3PcDKOQeZnAAAAA=
X-Change-ID: 20260611-mt6323-nvmem-0c54a0f2fa9f
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781173294; l=1828;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=Tvmqx4pYtJuxtoQ3R62SMg0IdP8UogvEPTr0AvaCegU=;
 b=r+iAeji7kO+0TGOzXiqhQcf+A5+3fkeYjjq9gerPbtOc6rQDDxklu44EumjyyX7+Qw++70LJk
 3kn+In2w6bUA0Kyok20FAN1TDGDf2JlVcLxmzPTL5uSJT28arb66KhH
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



