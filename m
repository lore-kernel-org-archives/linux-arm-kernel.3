Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48271CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVkGPwv3C6XlbO/gf5Nflh6DXGZXVeoBCqb2ZnxWmhE=; b=aZA6x3DkCRlei5aY8mlihOlOnW
	5kLE2QPijl2JchkYU/LZxbyzCwoC2T7pmaI5n8V9KMCat96oYJiiHtxx8+6H6tZ0cMD25C+pfiCca
	cEHGOq+VznWPOTmNnaPcNcVNrOPZLUevBwVALGAkb2cWjPKSV0T4FWi8NvjqJ0USj24EjveUHyNnW
	ZmKgc06a/LdfELF+hWLIDk2H4orAIKMnEw9T2zJCVxAt+OGMpSrO4T+Qx6Wy4j3ZyRhMIHZo2Yd7A
	pcxy8Eo09LTgLIl35L7laRt9iLy0k0NEcUbYDIs3e2p0+cV0xTFiRfNhxmFKOIK5GGl4ug0UX+qSX
	GwhKOmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESyV-00000004DgM-16Vs;
	Thu, 30 Oct 2025 13:45:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESyT-00000004Dfo-0a4E;
	Thu, 30 Oct 2025 13:45:58 +0000
X-UUID: bf234a12b59611f0a52f393f94899d25-20251030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rVkGPwv3C6XlbO/gf5Nflh6DXGZXVeoBCqb2ZnxWmhE=;
	b=Z1fdwUFIEI4qxPAPp5IRK5/roTAYaNuUlTWvH6P52CTSNKiZagTWKC5kgyOF2ibqjeb4ZdjuJwtGctf+X3pdU1ZF62mOc8fwJKvkIrbJ8pd/X5gMQRiQV6KPhKe1h10NW/nfG0S91t1ZlXClxJByFJr8u5lxRwSuTR/IV/r59Vs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8d041d93-75c0-4792-a77e-776f4802e8d0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:09c6db6a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf234a12b59611f0a52f393f94899d25-20251030
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1100399365; Thu, 30 Oct 2025 06:45:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 30 Oct 2025 21:45:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 30 Oct 2025 21:45:47 +0800
From: Jack Hsu <jh.hsu@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srini@kernel.org>,
	<ukleinek@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<chunfeng.yun@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<sean.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<andrew-ct.chen@mediatek.com>, <lala.lin@mediatek.com>,
	<jitao.shi@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jack Hsu
	<jh.hsu@mediatek.com>
Subject: [PATCH v6 00/11] Add mt8189 dts evaluation board and Makefile
Date: Thu, 30 Oct 2025 21:44:32 +0800
Message-ID: <20251030134541.784011-1-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_064557_218744_0E786A87 
X-CRM114-Status: GOOD (  12.58  )
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

In this patch series, 
we add Mediatek MT8189 evaluation board dts, dtsi and Makefile,
and also related dt-binding documents.

based on tag: next-20251029

Note:
This patch series depends on following dt-binding headers and yamls
1.dt-binding headers
  1. mt8189-pinfunc.h
       https://patchwork.kernel.org/project/linux-mediatek/patch/20250919020525.7904-1-ot_cathy.xu@mediatek.com/
  2. mt8189_gce.h 
       https://patchwork.kernel.org/project/linux-mediatek/patch/20250820093831.23437-3-xiandong.wang@mediatek.com/ 
  
2.dt-binding yamls
  1. smi-common.yaml, smi-larb.yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20251027121443.16783-2-zhengnan.chen@mediatek.com/
  2. mediatek,gce-mailbox.yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250820093831.23437-2-xiandong.wang@mediatek.com/
  3. mediatek,ufs.yaml
        https://patchwork.kernel.org/project/linux-scsi/patch/20251016-mt8196-ufs-v2-1-c373834c4e7a@collabora.com/
  4. mediatek,iommu.yaml  
        https://lore.kernel.org/linux-mediatek/20251018132625.14428-2-zhengnan.chen@mediatek.com/
  5. gce-mailbox.yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250820093831.23437-2-xiandong.wang@mediatek.com/
  6. disp_isp yamls
        https://lore.kernel.org/linux-mediatek/20251020074211.8942-1-xiandong.wang@mediatek.com/
  7. jpeg yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250528095748.17485-2-jianhua.lin@mediatek.com/  
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250528095748.17485-3-jianhua.lin@mediatek.com/   
  8. vcodec yaml
        https://lore.kernel.org/linux-mediatek/20251016060747.20648-2-kyrie.wu@mediatek.com/      
        https://lore.kernel.org/linux-mediatek/20251016060747.20648-8-kyrie.wu@mediatek.com/ 
  9. mtk-sd.yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250818114855.8637-1-mengqi.zhang@mediatek.com/   
  10. mtk,scp.yaml
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250924084422.4604-2-huayu.zong@mediatek.com/
  11. pwrap/spmi yaml  
        https://patchwork.kernel.org/project/linux-mediatek/patch/20250801070913.3109-2-niklaus.liu@mediatek.com/
  12. mt8189-nau8825.yaml
        https://lore.kernel.org/linux-mediatek/20250905071659.25805-10-Cyril.Chao@mediatek.com/
  13. mt8189-afe-pcm.yaml           
        https://lore.kernel.org/linux-mediatek/20250905071659.25805-8-Cyril.Chao@mediatek.com/
  14. mediatek,ufs.yaml
        https://patchwork.kernel.org/project/linux-scsi/patch/20251016-mt8196-ufs-v2-1-c373834c4e7a@collabora.com/


---
Changs in v6:
 - add/fix dt-bindings for mt8189 dts node
 - add pmic mt63xx dtsi for mt8189 evb board
 - add complete device node of mt8189 evb board
 - Fix previous version review comments
 - Link to v5: https://patchwork.kernel.org/project/linux-mediatek/cover/20250718075630.644870-1-sirius.wang@mediatek.com/

Changs in v5:
 - remove unused cpu-dile-state definition.
 - change memory size in "reg" property which if filled in by bootloader.

Changs in v4:
 - Correct cpu-idle-states.
 - Change the "reg" property name of the "memory" node in the
   device tree source (DTS) to lowercase.

Changs in v3:
 - Move ulposc and ulposc3 before cpu nodes.
 - Refactor cpu-map to a single cluster0.
 - Change cpu nodes name from medium core to big core.
 - Move psci before timer nodes.

Changs in v2:
 - Fix warning issues for make CHECK_DTBS=y.
 - Add mediatek,uart.yaml document.

---

Jack Hsu (11):
  dt-bindings: arm: Add compatible for MediaTek MT8189
  dt-bindings: iio: adc: Support MediaTek MT8189 evb board auxadc
  dt-bindings: nvmem: Support MediaTek MT8189 evb board efuse
  dt-bindings: pwm: Support MediaTek MT8189 evb board disp-pwm
  dt-bindings: serial: Support MediaTek MT8189 evb board uart
  dt-bindings: timer: Support MediaTek MT8189 evb board timer
  dt-bindings: usb: Support MediaTek MT8189 evb board xhci
  dt-bindings: watchdog: Support MediaTek MT8189 evb board wdt
  arm64: dts: mediatek: Add MT6319 PMIC Support
  arm64: dts: mediatek: add properties for MT6359
  arm64: dts: mediatek: Add mt8189 evaluation board dts

 .../devicetree/bindings/arm/mediatek.yaml     |    4 +
 .../iio/adc/mediatek,mt2701-auxadc.yaml       |    1 +
 .../bindings/nvmem/mediatek,efuse.yaml        |    1 +
 .../bindings/pwm/mediatek,pwm-disp.yaml       |    1 +
 .../bindings/serial/mediatek,uart.yaml        |    1 +
 .../bindings/timer/mediatek,timer.yaml        |    1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |    7 +-
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt6319.dtsi      |   66 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |   20 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   | 1082 ++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 3014 +++++++++++++++++
 include/dt-bindings/iio/mt635x-auxadc.h       |   50 +
 14 files changed, 4249 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6319.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi
 create mode 100644 include/dt-bindings/iio/mt635x-auxadc.h

-- 
2.45.2


