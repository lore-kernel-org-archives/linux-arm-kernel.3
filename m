Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqpj+uo11Rm1HYYL5ztqdJwKIU7oUJ9VEIdxvf4qDNI=; b=Q6ePOFEqc6y6khNwc+f0y3H2+E
	KrLfRs8a5kh49zJl6twNWg/3zYScAq5sjVwgHzfzHo2y/N/VWKGLKBlKwQpjsWNiUJbziJoYRksiL
	d2u/JjvHqROfh4qktr/hAHpd7jibQ3kLj1oqkbgzeM/BREsz4oR5mdqxrxr/0eFiWnS6URY8s7/tm
	3dcnzHvtuNP2eUuwCyzsyNdr2SSa2t6hnIN8XUoTH3cSZbNR0stAq6NW/1KDQm9dzAlL4eLV7i882
	kbGdodhkdHTk89qHi/8L8fN8kOiEZChm1oPdTA+mpNmt71nOCj5pWm7iRGYikBNUaZNwNVrYOhoai
	yj5xdY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOOw-000000056es-0ZVA;
	Mon, 10 Nov 2025 09:41:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOOu-000000056eS-0zGW;
	Mon, 10 Nov 2025 09:41:29 +0000
X-UUID: 6a62ee5cbe1911f09f706fa2197c6ceb-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nqpj+uo11Rm1HYYL5ztqdJwKIU7oUJ9VEIdxvf4qDNI=;
	b=Ixp4jR4RNq5pA7HmFF7vxpJKLklxTCCxFiY20e8pftp4fvvTIxysj1bL4QSvMm6HEnGf4TyHe8yTMlGpX3O9vd6eyzL/3qnfXY/kY1bGFLAMobOKv/9U2153Da1foemuytq4ZN68eKVC7ijoPK7S671Qem3EJUHys7bGxtYhVjA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a7732798-bbdf-4719-bd46-0b01148a06e5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3996ba57-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6a62ee5cbe1911f09f706fa2197c6ceb-20251110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <hanchien.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 620133461; Mon, 10 Nov 2025 02:41:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 17:41:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 17:41:18 +0800
From: Hanchien Lin <hanchien.lin@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Balsam
 CHIHI <bchihi@baylibre.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <hanchien.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<raymond.sun@mediatek.com>, <Irving-CH.lin@mediatek.com>
Subject: [PATCH 0/2] arm64: dts/thermal: Add MT8189 thermal controller and driver support
Date: Mon, 10 Nov 2025 17:40:37 +0800
Message-ID: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014128_296113_6A500083 
X-CRM114-Status: UNSURE (   9.75  )
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

This patch series adds support for the thermal controller on MediaTek MT8189 SoC.

Patch 1 adds the device tree node for the MT8189 thermal controller.
Patch 2 adds MT8189 support to the LVTS thermal driver.

Hanchien Lin (2):
  arm64: dts: mediatek: mt8189: Add thermal controller node
  thermal/drivers/mediatek/lvts_thermal: Add MT8189 support

 .../thermal/mediatek,lvts-thermal.yaml        |  27 ++-
 drivers/thermal/mediatek/lvts_thermal.c       | 155 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |  20 +++
 3 files changed, 189 insertions(+), 13 deletions(-)

-- 
2.45.2


