Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B11C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 03:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5frJAB9y8a+BiVXJdjweEmbFcW3Z5pKKgyZuRvk20D0=; b=f4JvfjHvy6RzoucbMfiUxbvhu7
	VxRekHb+E7jkHmVQGfI6y+8CBhyPGUg4Wa/66paRQ5FiGKfnhf9CTj4bqXVFqEGVuRXIIslkn2X6b
	hr0OCXzWNMWfKeGU1DS8BRDhxe2De0FKl1aTmeB6udcwPrnwT6/oQ+sZzU8B3o/myTFQJcFERxiAs
	yC6QgSTHiE3YfI3vMadPLjGY6s+/XxVmszPCv/+D5JeX3bdugsF3A3MUI6ebqiH8dd5ZLpT88+IIn
	G7r171z8GJgNDNsvQ7LJpT7Z2f7HSc0lQ/Fsjj6jnr59nx7M+Kk0WF95esS5/sEp2YbwpKSoBXi0Z
	DViFokHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOTY-0000000CznW-0V9u;
	Fri, 07 Mar 2025 03:34:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqORu-0000000CzKx-3z7p;
	Fri, 07 Mar 2025 03:32:36 +0000
X-UUID: cb3685dcfb0411efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5frJAB9y8a+BiVXJdjweEmbFcW3Z5pKKgyZuRvk20D0=;
	b=fS9JxuYS0cWAjniF/aYx04gIMbRgUecBUrtMREHZ/ffQYNDxBcEf+XinHL9GzranUl5hBFOWSUXnVviVU4TVDP6PZtCqIIdSYVxvgFw+QM3J6UDHoXKZ6fEu4iv7ZIH7ImWfvCgNwjvv7tUaXuVq+T+YZl7dmxdAmmuGoOwd5Yw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a7bf2669-6f46-4c86-b2c3-ea1156611964,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:2c27cc49-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cb3685dcfb0411efa1e849db4cc18d44-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 150809494; Thu, 06 Mar 2025 20:32:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:32:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:32:24 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>, Guangjie Song
	<guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 00/26] clk: mediatek: Add MT8196 clock support
Date: Fri, 7 Mar 2025 11:26:56 +0800
Message-ID: <20250307032942.10447-1-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_193234_994556_8BD159D7 
X-CRM114-Status: GOOD (  10.30  )
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

This series is based on linux-next, tag: next-20250306.

Changes:
- Update clock driver for MT8196
- Add MT8196 clock support

Guangjie Song (26):
  clk: mediatek: Add defines for vote
  clk: mediatek: Support voting for pll
  clk: mediatek: Support voting for mux
  clk: mediatek: Support voting for gate
  clk: mediatek: Add gate ops without disable
  dt-bindings: clock: mediatek: Add new MT8196 clock
  clk: mediatek: Add MT8196 apmixedsys clock support
  clk: mediatek: Add MT8196 apmixedsys_gp2 clock support
  clk: mediatek: Add MT8196 topckgen clock support
  clk: mediatek: Add MT8196 topckgen2 clock support
  clk: mediatek: Add MT8196 vlpckgen clock support
  clk: mediatek: Add MT8196 peripheral clock support
  clk: mediatek: Add MT8196 adsp clock support
  clk: mediatek: Add MT8196 i2c clock support
  clk: mediatek: Add MT8196 mcu clock support
  clk: mediatek: Add MT8196 mdpsys clock support
  clk: mediatek: Add MT8196 mfg clock support
  clk: mediatek: Add MT8196 disp0 clock support
  clk: mediatek: Add MT8196 disp1 clock support
  clk: mediatek: Add MT8196 disp-ao clock support
  clk: mediatek: Add MT8196 ovl0 clock support
  clk: mediatek: Add MT8196 ovl1 clock support
  clk: mediatek: Add MT8196 pextpsys clock support
  clk: mediatek: Add MT8196 ufssys clock support
  clk: mediatek: Add MT8196 vdecsys clock support
  clk: mediatek: Add MT8196 vencsys clock support

 .../bindings/clock/mediatek,mt8196-clock.yaml |   66 +
 .../clock/mediatek,mt8196-sys-clock.yaml      |   63 +
 drivers/clk/mediatek/Kconfig                  |   78 +
 drivers/clk/mediatek/Makefile                 |   14 +
 drivers/clk/mediatek/clk-gate.c               |  236 ++-
 drivers/clk/mediatek/clk-gate.h               |    6 +
 drivers/clk/mediatek/clk-mt8196-adsp.c        |  291 ++++
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c  |  146 ++
 .../clk/mediatek/clk-mt8196-apmixedsys_gp2.c  |  154 ++
 drivers/clk/mediatek/clk-mt8196-disp0.c       |  247 +++
 drivers/clk/mediatek/clk-mt8196-disp1.c       |  260 +++
 .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    |  211 +++
 drivers/clk/mediatek/clk-mt8196-mcu.c         |  167 ++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c      |  357 ++++
 drivers/clk/mediatek/clk-mt8196-mfg.c         |  143 ++
 drivers/clk/mediatek/clk-mt8196-ovl0.c        |  256 +++
 drivers/clk/mediatek/clk-mt8196-ovl1.c        |  255 +++
 drivers/clk/mediatek/clk-mt8196-peri_ao.c     |  218 +++
 drivers/clk/mediatek/clk-mt8196-pextp.c       |  162 ++
 drivers/clk/mediatek/clk-mt8196-topckgen.c    | 1373 +++++++++++++++
 drivers/clk/mediatek/clk-mt8196-topckgen2.c   |  701 ++++++++
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c      |  107 ++
 drivers/clk/mediatek/clk-mt8196-vdec.c        |  449 +++++
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |  100 ++
 drivers/clk/mediatek/clk-mt8196-venc.c        |  413 +++++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c    |  777 +++++++++
 drivers/clk/mediatek/clk-mtk.h                |   10 +
 drivers/clk/mediatek/clk-mux.c                |  198 ++-
 drivers/clk/mediatek/clk-mux.h                |   79 +
 drivers/clk/mediatek/clk-pll.c                |   51 +-
 drivers/clk/mediatek/clk-pll.h                |    5 +
 include/dt-bindings/clock/mt8196-clk.h        | 1503 +++++++++++++++++
 32 files changed, 9086 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys_gp2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mcu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
 create mode 100644 include/dt-bindings/clock/mt8196-clk.h

-- 
2.45.2


