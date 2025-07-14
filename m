Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C203C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7mJcjUvSFYbGs2W28uhwfy8o8MgVOg2cTpg8MwDAIIY=; b=MS3AWtkebopx62cVCk2UQEKyC/
	FZeefej5Qa7PJJtCkXwFeG9VmimkQ6VaVA90EY6dAPN33pqTKIqJ8tvI8ObDk5ClMwzZ1kgHn3yEK
	obdyJAC8AYhvwjuKmNLNG2DSar2c4LxHwQ7xvbTaoIzp+yLeVPFHNEgwZtTy/mNziSZy4CpPQ2JPd
	U5zTMdD2zmKsR9mDNp3p08nbTLRabGn4WLLVMReDS1zTpq19vzmTqJXifyYQKd+pS9W5q1wvKZ9ru
	kbRQRg5Y/YYIEgamddfnxRQX6CNpVQjfa8w2nPJfjI9iUwps8zGLkg2y0JGhT9QgiuHgCzjICp2ov
	IxfbF52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK3i-00000002SZS-3xOz;
	Mon, 14 Jul 2025 14:21:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJox-00000002PvM-0J7S;
	Mon, 14 Jul 2025 14:06:20 +0000
X-UUID: b469aef260bb11f09f706fa2197c6ceb-20250714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7mJcjUvSFYbGs2W28uhwfy8o8MgVOg2cTpg8MwDAIIY=;
	b=NMI4dFbDMuGIoSAH+Vtf8BO/n5iIdGSMOANTQUk+5Xd7RoENje9s4jD6hWLGC5dHrvdo/wEB8wVnCZ7zagOOyRFT7/D7Uwm01cNXE4HRSuNtRhMPfpyOaiLhOt1SOMBVPqIyofCbmVDLNx2FjrdJqx1h/rVwYBbE/Zp6rVz9dz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:df18654f-f389-4b03-bdb0-b87276accc9c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:05c624df-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b469aef260bb11f09f706fa2197c6ceb-20250714
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 701064952; Mon, 14 Jul 2025 07:06:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 14 Jul 2025 22:06:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 14 Jul 2025 22:06:11 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wenst@chromium.org>,
	<xavier.chang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH v4 0/3] Add mt8189 dts evaluation board and Makefile
Date: Mon, 14 Jul 2025 22:06:02 +0800
Message-ID: <20250714140608.2065966-1-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_070619_121245_34E55D79 
X-CRM114-Status: GOOD (  11.47  )
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

We add basic chip support for Mediatek MT8189 on evaluation board.

In this series, we also add dt-bindings document definition for MT8189.

This series is based on tag: next-20250714

Changs in v4:
 - Correct cpu-idle-states
 - Change the "reg" property name of the "memory" node in the 
   device tree source (DTS) to lowercase.

Changs in v3:
 - Move ulposc and ulposc3 before cpu nodes.
 - Refactor cpu-map to a single cluster0.
 - Change cpu nodes name from medium core to big core.
 - Move psci before timer nodes.

Changs in v2:
 - Fix warning issues for make CHECK_DTBS=y
 - Add mediatek,uart.yaml document


Sirius Wang (3):
  dt-bindings: arm: Add compatible for MediaTek MT8189
  dt-bindings: serial: mediatek,uart: Add compatible for MT8189
  arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   |  20 +
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 419 ++++++++++++++++++
 5 files changed, 445 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi

-- 
2.45.2


