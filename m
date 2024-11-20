Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B766D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XJ/IRWNQ6dXRG9QeIWYl13jSAxsiZs7JN33ZiHyh8g=; b=yUHH9YjWJdKt1nUvS0/VLqNm2P
	o1EQ8a4K1IRGmh1QJ8DNDvkSXbm9j+YpIEJg0m9uXRkpNA/XvuKvtpewTE94EwbbJ+zn1ls+tzSLX
	lDuQc8u+Qp+sLfCuGDaS51Imjxzsk3eTxjQPiRCvJTgzejpcXNx/sViWBOk03fWpwv9Asw8qXrrNq
	En3ehpbvWoXO+OKqMdCOVmLcIEzCFz+WA65rkc5IJ6boRvu0HwDhwd9sWehFvY2bIZ+KO5dbZTjhE
	cRjUG2avIE2oU+cKolQX2Kx2fIquRZ9SexPFn5cOWtAd8PJ7RuwV60rt0BDqZCJUThEI/IXflqrVS
	DA0kwq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeI3-0000000EVKG-1WOh;
	Wed, 20 Nov 2024 06:34:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeH5-0000000EV9X-4Bxr;
	Wed, 20 Nov 2024 06:33:17 +0000
X-UUID: 4ea3f1f2a70911ef9048ed6ed365623b-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7XJ/IRWNQ6dXRG9QeIWYl13jSAxsiZs7JN33ZiHyh8g=;
	b=iJBIHWZhG8vbYmmMXebEsmnQaWaw/z8L8Mgsuxq2t0Yz2hdI5XArt+RqD/0Y0rsw9UE2wNWcI7+NyjBXf+bGpvpXCg7KeqkE2Q+aTZ58HgXX+iVu4w3JMkbkk0iaUDnvOUPCCoDlvUdCgWNLTkmeChBPteM2pFRJxIVoEw4YTfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:3961cbf1-5b6f-4269-bb67-edf72bd3fa38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:89e947ce-1d09-4671-8b9c-efcc0e30e122,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4ea3f1f2a70911ef9048ed6ed365623b-20241119
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 182672109; Tue, 19 Nov 2024 23:33:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:33:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:33:05 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Friday Yang
	<friday.yang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/2] Add MediaTek SMI reset controller driver
Date: Wed, 20 Nov 2024 14:32:54 +0800
Message-ID: <20241120063305.8135-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_223316_043715_2959AF0F 
X-CRM114-Status: GOOD (  15.56  )
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

Based on tag: next-20241119, linux-next/master

Refer to the discussion in the following link:
https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com/
https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fasm2rFg@mail.gmail.com/
SMI clamp and reset operations should be implemented in SMI driver
instead of PM driver.

When we enable/disable power domain, the SMI LARBs linked to this power
domain could be affected by the bus glitch. To avoid this issue, SMI
need to apply clamp and reset opereations.

This patch mainly add these functions:
1) Add SMI reset controller driver to implement SMI LARBs reset opereations.
2) Add bindings for describing the reset controller.

Changes v2:
- According to previous discussions in v1, divided these four
  patches into two topic separately
- Change from 'mediatek,larb-rst-syscon' to 'mediatek,larb-rst'
- Modify the description for 'mediatek,larb-rst'
- Modify the description for '#reset-cells'
- Change compatible to 'mediatek,mt8188-smi-reset'
- Add COMPILE_TEST for RESET_MTK_SMI in Kconfig
- Drop label in binding's example
- Use MMIO instead of regmap in reset controller driver

v1:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240821082845.11792-2-friday.yang@mediatek.com/
https://patchwork.kernel.org/project/linux-mediatek/patch/20240821082845.11792-5-friday.yang@mediatek.com/

friday.yang (2):
  dt-bindings: reset: mediatek: Add mt8188 SMI reset control binding
  reset: mediatek: Add reset control driver for SMI

 .../bindings/reset/mediatek,smi-reset.yaml    |  53 ++++++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-mediatek-smi.c            | 156 ++++++++++++++++++
 include/dt-bindings/reset/mt8188-resets.h     |  11 ++
 5 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
 create mode 100644 drivers/reset/reset-mediatek-smi.c

--
2.46.0


