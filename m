Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A216CCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zguUP/rKI41td6Qd1x37NGTIr2eKo9bTe8UKCbXqKyg=; b=jA8erX/4DQjNi+2K429R3Cn9Tc
	SV1V2zYPO9KS4PX664ZFNDyixdeFr2miC12PQBuzGHsXVUNIYWip8WnuF4IGh2M0an3zCAsF8bBVe
	lkoTVwEHZoMBGxXvKDjAmXtbu2CtXHPIDRoU9ymPwfPmVuw621uwJgtC05P6+U1NVqyq0uo1flCoO
	IgDkwWzttsLt2UT7fFzQpd0wbCLAo9BaJa9okvyhA2aTHoXXmmKD1Ij0VnrYBnvI/oc+RoZJ1p+Fc
	2gmLWMJsP/muu/CikHj5J3YZ9juX0VRRP56dkyn/xbObKSJZ5dKdaCly1xpWr5kgMVn/fegEUTSVB
	QrWSPzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Wn-0000000957l-2euD;
	Fri, 12 Sep 2025 12:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Wl-00000009569-2Hu7;
	Fri, 12 Sep 2025 12:05:20 +0000
X-UUID: bec127068fd011f09eb0dd999d3936bf-20250912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zguUP/rKI41td6Qd1x37NGTIr2eKo9bTe8UKCbXqKyg=;
	b=cnJoxNkso4sJcnDHy7hcZraIxd8IQJa0aJruIqq2aYMm2D48aZAzFN52D9ab3wbToTFM3GOuQF6iKKqzky+e/2WngK0K5Ma3XljX5UQCSVIDL/nFYeOC3oieLA4O5tEFmholJE6ThsQTKRwNwaGAZvr2dVi7p30x/eUQFV7auso=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:59a19298-ac44-4c92-8f9c-59da95d2e1c7,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:b9c9b884-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bec127068fd011f09eb0dd999d3936bf-20250912
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 161699277; Fri, 12 Sep 2025 05:05:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 12 Sep 2025 20:05:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 12 Sep 2025 20:05:13 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Richard Cochran <richardcochran@gmail.com>
CC: Qiqi Wang <qiqi.wang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <irving-ch.lin@mediatek.com>
Subject: [PATCH v2 0/4] Add support for MT8189 clock/power controller
Date: Fri, 12 Sep 2025 20:04:49 +0800
Message-ID: <20250912120508.3180067-1-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050519_596543_EDD2CBDF 
X-CRM114-Status: GOOD (  12.69  )
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

These patches add support for the clock and power controllers
of MediaTek's new SoC, MT8189. With these changes,
other modules can easily manage clock and power resources
using standard Linux APIs, such as the Common Clock Framework (CCF)
and pm_runtime on MT8189 platform.

Irving-ch Lin (4):
  dt-bindings: clock: mediatek: Add MT8189 clock definitions
  dt-bindings: power: mediatek: Add MT8189 power domain definitions
  clk: mediatek: Add clock drivers for MT8189 SoC
  pmdomain: mediatek: Add power domain driver for MT8189 SoC

 .../bindings/clock/mediatek,mt8189-clock.yaml |   89 ++
 .../clock/mediatek,mt8189-sys-clock.yaml      |   58 +
 .../mediatek,mt8189-power-controller.yaml     |   88 ++
 drivers/clk/mediatek/Kconfig                  |  146 +++
 drivers/clk/mediatek/Makefile                 |   14 +
 drivers/clk/mediatek/clk-mt8189-apmixedsys.c  |  135 +++
 drivers/clk/mediatek/clk-mt8189-bus.c         |  289 +++++
 drivers/clk/mediatek/clk-mt8189-cam.c         |  131 ++
 drivers/clk/mediatek/clk-mt8189-dbgao.c       |  115 ++
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c      |   61 +
 drivers/clk/mediatek/clk-mt8189-iic.c         |  149 +++
 drivers/clk/mediatek/clk-mt8189-img.c         |  122 ++
 drivers/clk/mediatek/clk-mt8189-mdpsys.c      |  100 ++
 drivers/clk/mediatek/clk-mt8189-mfg.c         |   56 +
 drivers/clk/mediatek/clk-mt8189-mmsys.c       |  233 ++++
 drivers/clk/mediatek/clk-mt8189-scp.c         |   92 ++
 drivers/clk/mediatek/clk-mt8189-topckgen.c    | 1057 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8189-ufs.c         |  106 ++
 drivers/clk/mediatek/clk-mt8189-vcodec.c      |  119 ++
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c      |  145 +++
 drivers/clk/mediatek/clk-mt8189-vlpckgen.c    |  280 +++++
 drivers/clk/mediatek/clk-mux.c                |    4 +
 drivers/pmdomain/mediatek/mt8189-scpsys.h     |   75 ++
 drivers/pmdomain/mediatek/mtk-scpsys.c        |  967 ++++++++++++++-
 .../dt-bindings/clock/mediatek,mt8189-clk.h   |  580 +++++++++
 .../dt-bindings/power/mediatek,mt8189-power.h |   38 +
 26 files changed, 5206 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8189-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-iic.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mmsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-scp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-ufs.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpckgen.c
 create mode 100644 drivers/pmdomain/mediatek/mt8189-scpsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

-- 
2.45.2


