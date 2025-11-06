Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A52CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlPuFboA0/+wijz7NoKxg+57Ei+sKSGPYT3mlub2Nzw=; b=05+PA2AomhGwp0PcaT4zofcn46
	+avYnd28yE6Szu/mjziQVBv5bcRObtyZrWrEXucXoNSlCdKiehIZid1CtXNwvp8yHduVFEn/Xldug
	p41nvPc+bjckRO0EPdRIQuDZArykeAaLAqdthj2gBNM7tzAT+zzque3IEhFb5zcplRLArmcjjRiup
	pSzIFeTzT8qWb96E8Vi0YPmlNniA2V7oUDauwmMbRy1K9Jm/zgMHb+yDAb9hT5kOFsTHthM05EqzF
	gZH3fWmYW9Alx+Y1aOlrFGv/nvTwz8TuLmyw0zon3YhzsDCkXZbZHjivnCF+b9aGCaSH3rQZCBcg0
	fgDE4FFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzLB-0000000FTUD-3w1N;
	Thu, 06 Nov 2025 12:43:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzL9-0000000FTQb-1hvj;
	Thu, 06 Nov 2025 12:43:48 +0000
X-UUID: 383a1daabb0e11f0a52f393f94899d25-20251106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TlPuFboA0/+wijz7NoKxg+57Ei+sKSGPYT3mlub2Nzw=;
	b=XecwvCtJYH3ogab3vB7Z0/76qXdS1Pgdj5Jtyz+1X8eZ0UfV2ZC+TlyeG9Mp5TvmcWEOQppcWUMnFwornIp6cJYtZGvVkqKNaq2mPZYasSjMyiL8QlV8Fwq53B9ynjLIqr60iMDomUPf8KddXA2Ctm0H0Yyy1sIxjhN7NwUhoHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:820e334e-952e-41ed-8435-440c9d6ba490,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:e113fc7c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 383a1daabb0e11f0a52f393f94899d25-20251106
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2092118852; Thu, 06 Nov 2025 05:43:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 20:43:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 20:43:36 +0800
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
Subject: [PATCH v3 00/21] Add support for MT8189 clock/power controller
Date: Thu, 6 Nov 2025 20:41:45 +0800
Message-ID: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_044347_462197_9BAB58AE 
X-CRM114-Status: GOOD (  13.91  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

changes since v3:
- Add power-controller dt-schema to mediatek,power-controller.yaml.
- Separates clock commit to small parts (by sub-system).
- Change to mtk-pm-domains for new MTK pm framework.

changes since v2:
- Fix dt-schema checking fails
- Merge dt-binding files and dt-schema files into one patch.
- Add vendor information to dt-binding file name.
- Remove NR define in dt-binding header.
- Add struct member description.

  This series add support for the clock and power controllers
of MediaTek's new SoC, MT8189. With these changes,
other modules can easily manage clock and power resources
using standard Linux APIs, such as the Common Clock Framework (CCF)
and pm_runtime on MT8189 platform.

Irving-CH Lin (21):
  dt-bindings: clock: mediatek: Add MT8189 clock definitions
  dt-bindings: power: mediatek: Add MT8189 power domain definitions
  clk: mediatek: fix mfg mux issue
  clk: mediatek: Add MT8189 apmixedsys clock support
  clk: mediatek: Add MT8189 topckgen clock support
  clk: mediatek: Add MT8189 vlpckgen clock support
  clk: mediatek: Add MT8189 vlpcfg clock support
  clk: mediatek: Add MT8189 bus clock support
  clk: mediatek: Add MT8189 cam clock support
  clk: mediatek: Add MT8189 dbgao clock support
  clk: mediatek: Add MT8189 dvfsrc clock support
  clk: mediatek: Add MT8189 i2c clock support
  clk: mediatek: Add MT8189 img clock support
  clk: mediatek: Add MT8189 mdp clock support
  clk: mediatek: Add MT8189 mfg clock support
  clk: mediatek: Add MT8189 mmsys clock support
  clk: mediatek: Add MT8189 scp clock support
  clk: mediatek: Add MT8189 ufs clock support
  clk: mediatek: Add MT8189 vcodec clock support
  pmdomain: mediatek: Add bus protect control flow for MT8189
  pmdomain: mediatek: Add power domain driver for MT8189 SoC

 .../bindings/clock/mediatek,mt8189-clock.yaml |   90 ++
 .../clock/mediatek,mt8189-sys-clock.yaml      |   58 +
 .../power/mediatek,power-controller.yaml      |    1 +
 drivers/clk/mediatek/Kconfig                  |  146 +++
 drivers/clk/mediatek/Makefile                 |   14 +
 drivers/clk/mediatek/clk-mt8189-apmixedsys.c  |  135 +++
 drivers/clk/mediatek/clk-mt8189-bus.c         |  238 ++++
 drivers/clk/mediatek/clk-mt8189-cam.c         |  123 ++
 drivers/clk/mediatek/clk-mt8189-dbgao.c       |  115 ++
 drivers/clk/mediatek/clk-mt8189-dispsys.c     |  211 ++++
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c      |   57 +
 drivers/clk/mediatek/clk-mt8189-iic.c         |  139 +++
 drivers/clk/mediatek/clk-mt8189-img.c         |  122 ++
 drivers/clk/mediatek/clk-mt8189-mdpsys.c      |  100 ++
 drivers/clk/mediatek/clk-mt8189-mfg.c         |   56 +
 drivers/clk/mediatek/clk-mt8189-scp.c         |   84 ++
 drivers/clk/mediatek/clk-mt8189-topckgen.c    | 1018 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8189-ufs.c         |  100 ++
 drivers/clk/mediatek/clk-mt8189-vcodec.c      |  108 ++
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c      |  121 ++
 drivers/clk/mediatek/clk-mt8189-vlpckgen.c    |  278 +++++
 drivers/clk/mediatek/clk-mux.c                |    4 +
 drivers/pmdomain/mediatek/mt8189-pm-domains.h |  485 ++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |   36 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |    5 +
 .../dt-bindings/clock/mediatek,mt8189-clk.h   |  580 ++++++++++
 .../dt-bindings/power/mediatek,mt8189-power.h |   38 +
 27 files changed, 4457 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8189-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dispsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-iic.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-scp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-ufs.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpckgen.c
 create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

-- 
2.45.2


