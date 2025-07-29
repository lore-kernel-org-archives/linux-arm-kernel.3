Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ED2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41rw4LISPl+iO7NfLc3Ar1MC/dnrRsPRo+py+vvxe0E=; b=Z4tcqORANufE01hmrOlkxoEyCm
	NMv6jM9xk1HvRRwMd2IaZTVp5rP8Lj2yT5bPunYvsEng0OURlxMJle5qcbJETylnlKvzOOKlUH2Tb
	2Wx+tN1viaO5qVqFwDuoQj6mlvErvlUp7OeXc8+poknrLVsio+q2fvipbk+bMkgxZchiW8ssHAmNA
	G8RH8spECG0+XZquWcW4Vv741QjmL8LgT8p/CAiQ5Pj3kQvcpvy26hqt8Pkr++SDDlrm/QsUhX0xD
	Kglu4A4QQ0FhNtmTgKWhzzvatylXptQoDZL2Wa8+27QbPUqIiNBEGno4e54AfPW2c1zjQjNPzqg67
	c/oufuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaAP-0000000Fm05-45rb;
	Tue, 29 Jul 2025 02:34:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uga7w-0000000Flii-168s;
	Tue, 29 Jul 2025 02:31:41 +0000
X-UUID: 242c8f026c2411f09eb0dd999d3936bf-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=41rw4LISPl+iO7NfLc3Ar1MC/dnrRsPRo+py+vvxe0E=;
	b=LD/lu15gcYba++9X9lodLeKiqr1jW3FCU+NThFwCj3IqedqH48AQbiuTRbDwfD5l1y2H6h8RIbu1CojLOaAaCRl9J9ppNVAWpwWJ5Uzg8dauYQI7fl7hbd/JHTrS3RF3vSuB1JxYnNDh//9n2gIGJdyMJrc7AJgKEx300tXGMj0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:cfb7a39c-efc0-450c-92b6-b1ce59ada530,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b4ba450f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 242c8f026c2411f09eb0dd999d3936bf-20250728
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 183473938; Mon, 28 Jul 2025 19:31:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:29 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 0/3] Add support for MT8189 SCP and device tree bindings
Date: Tue, 29 Jul 2025 10:31:10 +0800
Message-ID: <20250729023125.9036-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_193140_307370_BEF05215 
X-CRM114-Status: UNSURE (   9.57  )
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

  This patch series adds support for the System Companion
Processor (SCP) on MediaTek MT8189, including device tree
bindings, dts node, and driver support.

---
This series patches dependent on:
[1]
https://patchwork.kernel.org/project/linux-mediatek/cover/20250718075630.644870-1-sirius.wang@mediatek.com/

Huayu Zong (3):
  dt-bindings: remoteproc: mediatek: Add binding for mt8189 scp
  arm64: dts: mt8189: Add scp node
  remoteproc: mediatek: Support MT8189 SCP

 .../bindings/remoteproc/mtk,scp.yaml          |  2 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   | 17 +++++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 11 ++++++
 drivers/remoteproc/mtk_common.h               | 11 ++++++
 drivers/remoteproc/mtk_scp.c                  | 37 +++++++++++++++++--
 5 files changed, 75 insertions(+), 3 deletions(-)

-- 
2.45.2


