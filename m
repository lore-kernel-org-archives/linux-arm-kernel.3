Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A51C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgu8/qtKwrUevgUkDOpe6U4a4UoSX2UrXzvWZYVmHiw=; b=0YjB8kOcImfRJKVCDd5GybY9nf
	0T6O5ovujb6lVBpS24MKGu2NPwPy2qm1ghX1XOvM/AhNxSqkfpF+F2NcbQaNKZSY9/2r4XlwYbfwh
	gsylQa696sS1LGnVoM7+4NGjGk1vN6KZ/rS9FcLqTyKmV9O87JHPbtITQE/deurxyUpEbZCcnqJti
	FNRB7niGk/QVZiLAQiLocYyTQ2VituBSGWz96EjKjIvk+ELu5RFJFZHVMzA+ZzS9m/cAmAOVaAjYe
	M7z9OsmoQYoddHixnHkm19Ll2Yz7aLJKqQoDbPQ+rUYDIK5d+5Gch1neVKqrb+w57QCswUHfN2sua
	1t1v4siw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYFG-0000000EJDC-3qBi;
	Fri, 21 Mar 2025 09:00:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYDb-0000000EJ40-0e2r;
	Fri, 21 Mar 2025 08:59:08 +0000
X-UUID: baeeecbc063211f0a1e849db4cc18d44-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wgu8/qtKwrUevgUkDOpe6U4a4UoSX2UrXzvWZYVmHiw=;
	b=sX2HDHvtsC7SGyT2KLFnZ1q9NlQqyb0euZ3clRmZixl0qCuRGJYpSqy1Otts8+VQAyWfjDqGtURYhhZGmBXCl5Y5WR51hDeldMFq2F9VPnOSLwsDi6mBwmnsnY5hOISPr29DK3Ix7K2kh40T/Ve/qpia+krCBKkMEdgdzJm6VXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4fd4d7f4-f532-473f-a05a-87066eb32d2e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3d0aa1c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: baeeecbc063211f0a1e849db4cc18d44-20250321
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1594751132; Fri, 21 Mar 2025 01:59:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 16:58:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 16:58:56 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<yong.mao@mediatek.com>, <Axe.Yang@mediatek.com>, <Jimin.Wang@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v5 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Date: Fri, 21 Mar 2025 16:39:11 +0800
Message-ID: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_015907_196373_A74640AB 
X-CRM114-Status: GOOD (  10.42  )
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

Changes in v5:
- Remove header file to fix dt-binding check error.
- Add /* sentinel */ in pinctrl-mt8196.c.

Changes in v4:
- Add rsel-resistence-in-si-unit and remove RSEL macro magic
  number in mediatek,mt8196-pinctrl.yaml.
- Add values in SI units option to |struct mtk_pin_soc| in
  pinctrl-mt8196.c.
- Move pinmux macro header file to arch/arm64/boot/dts/mediatek.

Changes in v3:
- Remove drive-strength-microamp & rsel-resistence-in-si-unit
  related description in mediatek,mt8196-pinctrl.yaml.
- Use pm_sleep_ptr() in pinctrl-mt8196.c to fix build error.

Changes in v2:
- Fix driver file's coding style.
- Add pinctrl binding document.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8196
  arm64: dts: mediatek: mt8196: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8196

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  223 ++
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1859 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 6 files changed, 6458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

-- 
2.45.2


