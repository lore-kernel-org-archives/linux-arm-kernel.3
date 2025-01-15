Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069FBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RW+aY5XpsCKt8NyJHK435g5mg+Zd2fJskS2OpXAM0N0=; b=n0jkQMFafc6G+jEj7Q1BLeYdib
	15MWILJFAd9/6e4yl8F/9t83WWHJI1DhtZe5Ya+5dd5jRT8I09SxJs1YUy2dU8lhawF/pKkvarN/I
	FQA6kZsg2rGVbyFbGsqsT8GwuK79E0es/GxVcUkWHUYQzMVukLGFS1Tdn4kHcr1zEsxXK3eLemQIL
	wG+uNrGrGAbErb/+yDxC+PR1MWWuoXhuCyIho/3hVPr261NJXctI2nQM5g8rzTNiLou+UbmXzuMaY
	LAwlKW8awVpuQk+EsHPvbhEpJBis/m6Ia7K/Hgon1xr/csiU4Ooz8WZASl3CBN1ka8opI9YPdw+ZF
	E9+BxjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx21-0000000AotU-3kJO;
	Wed, 15 Jan 2025 06:37:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx0l-0000000AohP-1ogy;
	Wed, 15 Jan 2025 06:36:20 +0000
X-UUID: 054946fad30b11ef9048ed6ed365623b-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RW+aY5XpsCKt8NyJHK435g5mg+Zd2fJskS2OpXAM0N0=;
	b=seLoQJ070EuhZlGxCORFR9OHHmdaigXnmWFcbVy94N5IZIpKaBHlDWfZiAZyy15NeeUs+ViIRhK1Ul65B/f21acTkKuV1ZusZJ97NGwqKYSXn5uFF85wATZiR/ndZuXzzktoF0aJsyYDAFe7pHDxqMG9SSuL26J1bbY7+Z18E6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:459d9f44-f3fa-4bd9-99f2-0dfc9bce610d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:17b5e837-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 054946fad30b11ef9048ed6ed365623b-20250114
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1462400890; Tue, 14 Jan 2025 23:36:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 14:36:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 14:36:12 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>, <wenbin.mei@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v3 0/2] MediaTek pinctrl patch on mt8196
Date: Wed, 15 Jan 2025 14:35:37 +0800
Message-ID: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_223619_480397_03060680 
X-CRM114-Status: GOOD (  10.61  )
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

Changes in v3:
- remove drive-strength-microamp & rsel-resistence-in-si-unit
  related description in mediatek,mt8196-pinctrl.yaml.
- use pm_sleep_ptr() in pinctrl-mt8196.c to fix build error.

Changes in v2:
- fix driver file's coding style.
- add pinctrl binding document.

Changes in v1:
- add mt8196 pinctrl driver.
- add pinmux definition file.

Cathy Xu (2):
  dt-bindings: pinctrl: mediatek: add support for mt8196
  pinctrl: mediatek: add mt8196 driver

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  244 ++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1764 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 ++++++++++
 6 files changed, 6382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
 create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h

-- 
2.34.1


