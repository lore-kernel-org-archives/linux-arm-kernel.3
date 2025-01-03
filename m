Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67057E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4idm+cfyn4XfuyNKu3rWDxtNAPG7GEtO7g+GVHM2dA=; b=xCoM/O4OonrAE0sr/RhF21DWi9
	1HVbR8lr9+tK+ws0hQWdZCk5DL5Yr8IfYe2vnCmuRmAflTbyaSOkuZd1qo6QZ+D2AdxnOkOWrN1SQ
	pco9Db7Ru99kSXVL90bCa8Uoz6FcQZA8q8j+ipZAONo64fp5m6J9KeNyM+MlSIZxCN1/LGos3Vzoc
	TCxeicqXXiQDMh9lVfqX16a3wKEBhqWcSDU6K9jiiEOmwKtRAJoAEoW7ajnzJHOeGn9jg0vBjXdZR
	2eZy4AwtYXLMLL4aQBM7cHEzPJO0Usne7WUKUQZtfjBn4ejjJwDdxeBtvk0aQ/+qJJYDMf2AKLo2p
	32hnk0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf63-0000000CkOD-2WO4;
	Fri, 03 Jan 2025 10:40:03 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf3g-0000000Ck3W-30lM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 10:37:38 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 731A15FC3D;
	Fri,  3 Jan 2025 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1735900651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z4idm+cfyn4XfuyNKu3rWDxtNAPG7GEtO7g+GVHM2dA=;
	b=kIhfbjzPN6xzaPFWJZwuwxbh0Vlzk72f1/Vjax9XTYpLy065IptH35c3KMEhra9ezp1duT
	kkHYT/gPnWJpvFZVUQaUFB8+DjjQjW9QMBV5BwJOlO4Tm2OJO8iYetOSmhbADFNjgZaxAS
	ZZT/HYKevK3myGsCsv8abop0Pxf8nMo=
Received: from frank-u24.. (fttx-pool-80.245.72.216.bambit.de [80.245.72.216])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 5385C8020A;
	Fri,  3 Jan 2025 10:37:30 +0000 (UTC)
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
Subject: [PATCH v2 0/2] fix some binding check errors for marvell
Date: Fri,  3 Jan 2025 11:37:20 +0100
Message-ID: <20250103103724.6223-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 729bca03-721c-4cdc-b611-1a6a3a5f3403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_023736_903653_F1523000 
X-CRM114-Status: GOOD (  10.68  )
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

I only try to fix the binding errors, i do not have any marvell board, so
cannot verify that my changes are correct. From my PoV peripheral
controllers should be disabled in the SoC DT and enabled in board DT.

Frank Wunderlich (2):
  arm64: dts: marvell: only enable complete sata nodes
  arm64: dts: marvell: drop additional phy-names for sata

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
 10 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.43.0


