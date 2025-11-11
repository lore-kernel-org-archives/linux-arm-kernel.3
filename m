Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49B8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVvqmxw4oeR9ramVcYJAAvK0TIuwI3k4LpZawcl2Au4=; b=TPOT9rM000WNmVOi7HzrqZx2ur
	3MAlfzPjVjapoZG5uc/JM5fqXCSBm0P1lIYjH9UC80SL94PY0DS3Z8mbsGbSViYs5uIQ4a7E9VoxP
	7lRm+BNhHSiiSlvOPipQTr/a3mM3V9WuHhCZklWMBRe2W0Sc5dfhOo2z8m9854vCd80qKarqr5Yw9
	6t6L7cbHNb7WsgbMDviS6mbChVdgBq00J8cmPygouX1ea3tsCglxlGxJuJhMX/ffYQaLpt8eRwKJG
	O5AvPt8C+8ZgvPNxIi9uVMZwfF12J3B/ziYX3VMnqMQyYbWQe2caPZ03nMTNdYugdXKSt4zfIl+gP
	YvfQ26ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOh-00000006dSE-1ITW;
	Tue, 11 Nov 2025 07:02:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOc-00000006dRS-3DjC;
	Tue, 11 Nov 2025 07:02:33 +0000
X-UUID: 6117dca0becc11f09f706fa2197c6ceb-20251111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VVvqmxw4oeR9ramVcYJAAvK0TIuwI3k4LpZawcl2Au4=;
	b=dUUyDblYxSfvpiQ09vUoBj+tQotisU1m2tcq6ZVcpuV6HM2wl2BoXRfAC3akjyyHIpSIHndhZMHn5zyKIx9fER8Bks1S2YnVCoRO2xE31mfv7Sz0NeUs+cF/5pqi75ziDd3enM7nOBQLeLYVMqPXbpYoaxJQdOuIGshhwo6uLGI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a955f501-b964-4d49-b02a-05c62cd96b79,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:988ec357-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6117dca0becc11f09f706fa2197c6ceb-20251111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1588072249; Tue, 11 Nov 2025 00:02:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 11 Nov 2025 15:02:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 11 Nov 2025 15:02:22 +0800
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
Subject: [PATCH v7 0/9] Add mt8189 dts evaluation board and Makefile
Date: Tue, 11 Nov 2025 14:59:14 +0800
Message-ID: <20251111070031.305281-1-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_230230_814743_80185B2F 
X-CRM114-Status: GOOD (  12.43  )
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
add/update related PMIC MT6319/MT6359 dtsi, 
and also related dt-binding documents.

based on tag: next-20251111

Note:
This patch series depends on following dt-binding headers and yamls
1.dt-binding headers
  1. mt8189-pinfunc.h
       https://patchwork.kernel.org/project/linux-mediatek/patch/20250919020525.7904-1-ot_cathy.xu@mediatek.com/
  2. mt8189_gce.h 
       https://patchwork.kernel.org/project/linux-mediatek/patch/20250820093831.23437-3-xiandong.wang@mediatek.com/ 

---
Changs in v7:
 - update explanation in cover letter
 - remove Applied mediatek,mt2701-auxadc.yaml
   (refer to: https://lore.kernel.org/linux-mediatek/20251101162855.303b3e5e@jic23-huawei/)
 - remove Applied mediatek,efuse.yaml
   (refer to: https://lore.kernel.org/linux-mediatek/176236193629.37589.12615931533548308117.b4-ty@kernel.org/)
 - update dt-bindings commit msg
   (use "mt8189" instead of "mt8189 evb board")
 - update xhci.yaml
   (drop "reset-names" property)
 - update mt6319 dtsi
   (change pmic node name as pmic@ )
 - update mt6359 dtsi node
   (remove mt635x-auadc.h, remove fg nodes)
 - update mt8189 dtsi node
   - update mt8189 clk node
     (refer to: https://lore.kernel.org/linux-mediatek/20251106124330.1145600-1-irving-ch.lin@mediatek.com/)
   - xhci node drop "reset-names" property
   - update mt8189 thermal node
     (refer to: https://lore.kernel.org/linux-mediatek/20251110094113.3965182-1-hanchien.lin@mediatek.com/)

 - Link to v6: https://lore.kernel.org/linux-mediatek/20251030134541.784011-1-jh.hsu@mediatek.com/

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


Jack Hsu (9):
  dt-bindings: arm: Add compatible for MediaTek MT8189
  dt-bindings: pwm: Support MediaTek MT8189 disp-pwm
  dt-bindings: serial: Support MediaTek MT8189 uart
  dt-bindings: timer: Support MediaTek MT8189 timer
  dt-bindings: usb: Support MediaTek MT8189 xhci
  dt-bindings: watchdog: Support MediaTek MT8189 wdt
  arm64: dts: mediatek: Add MT6319 PMIC Support
  arm64: dts: mediatek: update rtc properties for MT6359
  arm64: dts: mediatek: Add mt8189 evaluation board dts

 .../devicetree/bindings/arm/mediatek.yaml     |    4 +
 .../bindings/pwm/mediatek,pwm-disp.yaml       |    1 +
 .../bindings/serial/mediatek,uart.yaml        |    1 +
 .../bindings/timer/mediatek,timer.yaml        |    1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |    4 +-
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt6319.dtsi      |   66 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |    3 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   | 1082 ++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 3310 +++++++++++++++++
 11 files changed, 4473 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6319.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi

-- 
2.45.2


