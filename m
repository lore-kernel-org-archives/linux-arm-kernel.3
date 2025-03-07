Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD4C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bubgnY0zrmF8D2EJUSPC+Gnryw9Y+zgy2Y+PYLhxYXg=; b=ns1jeThfCxorEgWEDBZuTgaZ5o
	Ufru8FkLn2NQJOuDPjbtXBYTZZvU9ZCsjnwny8fwNbYZolqybj96rV9Jm1gspqU1iTwN/vHILd5gG
	wkjfUlzvA8xw1aPZ9ZwpEkzGbcwL4UnW8TAKCEl8klLHP1Z4C9GmLhmXPyM+eErxAIgsTKxHA8+aA
	PJx4e5t2E1P6DpN/UJWrQil5vC4mLfiE2VFtz6sR8K8QbLtbGG/SHCc+dKIKkGyi/EfLzOlZO+M/h
	qkD7aq5jhBkYRaObb8o0P/UfALo0AR2R04lxO4SFHuQk8J8MGWKuxR4Oa++SgSe1qywf2C4dqBW8b
	pvCpvefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPCH-0000000D6cP-36Ik;
	Fri, 07 Mar 2025 04:20:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOdz-0000000D22t-1fsj;
	Fri, 07 Mar 2025 03:45:04 +0000
X-UUID: 8b5a6742fb0611efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bubgnY0zrmF8D2EJUSPC+Gnryw9Y+zgy2Y+PYLhxYXg=;
	b=s1YqEYFY2FOwhBBaVlqT8HtPvQSxHcAk0K+91TylI5O4+WStuAYnBRFc3ZJj2Ph5WYcQpDzU2H9RGXP6K4/NN3k5DwRsJxj+Px/Y/JwEWEZRtA1IkMXQ2hOjsKwuMUC6FJ5xC1YnTG/MBtc7oaG9qrB/GbeYw8IA9siZ6AXkdrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c3ee578f-e073-49d5-a45f-03559ec907a9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e40c08c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b5a6742fb0611efa1e849db4cc18d44-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1136243262; Thu, 06 Mar 2025 20:44:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:44:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:44:56 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 00/13] pmdomain: mediatek: Add MT8196 power domain
Date: Fri, 7 Mar 2025 11:44:24 +0800
Message-ID: <20250307034454.12243-1-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194503_449295_A265E6B9 
X-CRM114-Status: UNSURE (   9.63  )
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

This series is based on linux-next, tag: next-20250306.

Changes:
- Update mtk-scpsys driver for MT8196
- Add MT8196 power domain support

Guangjie Song (13):
  pmdomain: mediatek: Support sram isolation
  pmdomain: mediatek: Support sram low power
  pmdomain: mediatek: Support power on bypass
  pmdomain: mediatek: Support check power on/off ack
  pmdomain: mediatek: Support voting for power domain
  pmdomain: mediatek: Support trigger subsys save/restore regesters
  pmdomain: mediatek: Support power domain irq safe
  pmdomain: mediatek: Support power domain always on
  pmdomain: mediatek: Refactor parameters of init_scp
  pmdomain: mediatek: Support bus protect with table
  pmdomain: mediatek: Add post init callback
  dt-bindings: power: mediatek: Add new MT8196 power domain
  pmdomain: mediatek: Add MT8196 power domain support

 .../mediatek,mt8196-power-controller.yaml     |   74 +
 drivers/pmdomain/mediatek/mt8196-scpsys.h     |  114 ++
 drivers/pmdomain/mediatek/mtk-scpsys.c        | 1276 ++++++++++++++++-
 include/dt-bindings/power/mt8196-power.h      |   57 +
 4 files changed, 1483 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
 create mode 100644 drivers/pmdomain/mediatek/mt8196-scpsys.h
 create mode 100644 include/dt-bindings/power/mt8196-power.h

-- 
2.45.2


