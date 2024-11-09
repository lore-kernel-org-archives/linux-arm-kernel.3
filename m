Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762B9D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsnVBnJzrSx3yR3uTwKq3fiPk27Oe3tF24NPbK3S3f0=; b=eBtcyGuDiqCdhM+TMj0PctprU0
	V/2Ur3+p7lxV0uN0zVtu9zaOPmbfXviTIXrINO4jD3ZDrUKnm9kBvW28rLIvrfRV/6RIg81ypdv7a
	NzXUkS8ukgbqJUjVB2y8UxcThm7UgLLjLTgjGgAGkbdytmQ8yRUXIvNQzw+KMEJc2BY4MgUDlEelb
	BN0afAVtFDailvS+FgLrT5BhJtoKUiX85+zlbKRwJIYfm/n6VKBi0cTYdLHdidkAQSRzf3ta/vFQL
	DV9SS2Yny3y3YmuKFE3uwdBicl5o/50a0CRrpW+RdWed0t5wgY02v0m9cdWYPEWm+PQh6qLAhzbmR
	Vxsal7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i6p-0000000D1GN-3WP6;
	Sat, 09 Nov 2024 09:50:23 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i3L-0000000D0qm-22RN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 09:46:49 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id CD35F5FBA0;
	Sat,  9 Nov 2024 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1731145600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dsnVBnJzrSx3yR3uTwKq3fiPk27Oe3tF24NPbK3S3f0=;
	b=AtfRjeoBXaxX0QVh6lNi7ebs5xVtIpkYALRoS7d9z2A4l0leJ+/RAQ5xT/2G5TjgtT9Var
	867U9y7JVUkUdm2TCe3S4PDV8IbbSqt/VgCg8QvpSyHgP3y8pBuZiz7NZVhlZXPjfjjXyX
	jm52nxek12xq5YkfaIVno+MkOVAWiYI=
Received: from frank-u24.. (fttx-pool-157.180.226.68.bambit.de [157.180.226.68])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id AE44840044;
	Sat,  9 Nov 2024 09:46:38 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] fix some binding check errors for marvell
Date: Sat,  9 Nov 2024 10:46:18 +0100
Message-ID: <20241109094623.37518-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 15871758-9287-4eb9-b486-392be61ec69a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_014647_716800_5CDFAE53 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Thies series fixes some Errors reported by dtbs_check. First part is taken
from my old series [1] where i converted sata-platform txt binding to yaml
because it wasn't picked up.

[1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-1-linux@fw-web.de/

Frank Wunderlich (3):
  arm64: dts: marvell: Fix anyOf conditional failed
  arm64: dts: marvell: drop additional phy-names for sata
  dt-bindings: ata: ahci-platform: add missing iommus property

 Documentation/devicetree/bindings/ata/ahci-platform.yaml   | 3 +++
 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 +
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 ++
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 5 +++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 3 +--
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 ++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi              | 2 ++
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts               | 1 +
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi                 | 1 +
 11 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


