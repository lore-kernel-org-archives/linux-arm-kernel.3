Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B28C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5cquuIZpHytMyZf4vzmIyMUUPn8YhG4lR+d2ACxt+Cc=; b=leBiG/ugEPKizc77m9J5W3pbvV
	wAkHFmKCbKTsiqeMSuPLJQBo+OEWEkAeXUvxQidtlY25OczdSNr2/Ng3hBUl4qxgLD8ApNxByK7TC
	S/QI8CJ1FywO/TfPRsj4Q2nV5HZC3omvey01C4mfNtUwqb/eYilDjy3DDKhgn5YnZyUnTzkQptEoD
	ZEma+/fUxbG/mKE861jHIZeTU3ZP3Axx7OR6NsG5HBC0uoKI0nUdXBHqSwFy7vx853tQFsNx3BDZF
	diOlndLQbkHuuZy7QI8fEtXDVJ7CCZdQtjtMsIkinRNI2xEaZJj834veRWWtYFTKcfyG+scfkreDE
	8T2uTlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsG6-000000037vX-0s87;
	Fri, 16 May 2025 10:25:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFsE5-000000037Sj-12nN;
	Fri, 16 May 2025 10:23:38 +0000
X-UUID: d1e9d060323f11f0bed96b30c12bc3d6-20250516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5cquuIZpHytMyZf4vzmIyMUUPn8YhG4lR+d2ACxt+Cc=;
	b=A4GHYsishyCXFURaxdQg4Fs7SKj5vbuB8Xazt8y/RIacgoLthR6Fjx5k6Aq5cH6GfgkmxFLjvvdjR1UlRflBxX1R0UoZWMQE5gBrP7xYg1pi38Dd0cqBsksIXtQXNEO8ND+Qwb5i2JrqOHLHEUD0p4hug2o7zW1VbcCiBavbrZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:74c1d4d6-c2b3-471d-99cd-6fd92761bec1,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:e3f3d673-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d1e9d060323f11f0bed96b30c12bc3d6-20250516
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 600468901; Fri, 16 May 2025 03:23:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 16 May 2025 18:23:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 16 May 2025 18:23:30 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v4 0/2] Add built-in 2.5G ethernet phy support on MT7988
Date: Fri, 16 May 2025 18:23:25 +0800
Message-ID: <20250516102327.2014531-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_032337_294866_7674DB43 
X-CRM114-Status: GOOD (  12.67  )
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

From: Sky Huang <skylake.huang@mediatek.com>

This patchset adds support for built-in 2.5Gphy on MT7988, sort file
and config sequence in related Kconfig and Makefile.

---
Change in v2:
- Add missing dt-bindings and dts node.
- Remove mtk_phy_leds_state_init() temporarily. I'm going to add LED support
later.
- Remove "Firmware loading/trigger ok" log.
- Add macro define for 0x800e & 0x800f

Change in v3:
1. Remove unnecessary headers and unnecessary print log.
2. ioremap IO space (MT7988_2P5GE_PMB_FW_BASE/MTK_2P5GPHY_MCU_CSR_BASE)
directly instead of of_iomap() compatible node (mediatek,2p5gphy-fw) from dtsi
3. Call mt798x_2p5ge_phy_load_fw() from .probe instead of .config_init. This is
tested ok with openWRT-24.10 and "mediatek/mt7988/i2p5ge-phy-pmb.bin" firmware
is embedded into kernel image instead of rootfs image.
4. Use request_firmware_direct instead of request_firmware. We don't want sysfs
fallback in this driver to avoid blocking.
5. Remove mtk_i2p5ge_phy_priv sturct since it's not used anymore.

Change in v4:
1. Sort file and config in alphabetical order.
2. Remove unncessary parens around macros.
3. Arrange vars in reversed Christmas tree.
4. Move LED settings and pinctrl request to .probe to avoid
managed-dev structure reallocation.
5. Replace "return __genphy_config_aneg(phydev, changed);" with
"return genphy_c45_check_and_restart_aneg(phydev, changed);" in
mt798x_2p5ge_phy_config_aneg()
---
Sky Huang (2):
  net: phy: mediatek: Sort config and file names in Kconfig and Makefile
  net: phy: mediatek: add driver for built-in 2.5G ethernet PHY on
    MT7988

 MAINTAINERS                          |   1 +
 drivers/net/phy/mediatek/Kconfig     |  15 +-
 drivers/net/phy/mediatek/Makefile    |   3 +-
 drivers/net/phy/mediatek/mtk-2p5ge.c | 321 +++++++++++++++++++++++++++
 4 files changed, 337 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c

-- 
2.45.2


