Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FFAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRJmo01lCGWBN4vk/8ge3MPSFtd3Uvt3DpqX+KRB26Q=; b=Rm9uk66L+sbd8x9Brgz49UTR84
	ndqPatqKlrAq4WoMDLtF7YtshBftDLdT350XWQxc89y1xQTGVqOQc/llAUKY8irK7j0bOBChjpmCI
	1LqxOMSmHTiXEA0+ZHRwkxhW5FD8nGMiooFUMQN63YnbX5w213B0+3Y+ChYrIZa+InPwc+abXqlNJ
	Lmxg9y/gDrpmTvPC24gjJ8MBe99WQ6lc0HAzi0FC2uj7K4eleKjiwnRs2gbA+eaYcwWH4qnVeZm3L
	6P4dSIIPCHhC3iKgAdwrDQJX35X6yeigMpZdRYmFfN3aA6UutQkahsyy5iIDlbQUPqPhkLiZLQA/T
	syauUAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTal8-0000000CAH2-0iIt;
	Fri, 03 Jan 2025 06:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaju-0000000CA0b-3jGU;
	Fri, 03 Jan 2025 06:00:56 +0000
X-UUID: 13821642c99811ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IRJmo01lCGWBN4vk/8ge3MPSFtd3Uvt3DpqX+KRB26Q=;
	b=D15wWqdAml3+TjDJ4wGFKQqnOnV2dii5mL321+wo5nZn+WRbmkeAo9bWWfe3xtNwpD892NQp/blcXmdPEUSSbQLAQjpPIDyhHOVEfiZ5rcOloEuNOqdf7hpWrpSIBADjNjHcAJni0jzop57PBCHJK1du6sCgOHujJh20PpBlwrs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2bbdd2ef-3307-4b8b-a541-20b6bdb899b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:683a9825-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 13821642c99811ef82ff63e91e7eb18c-20250102
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1540545072; Thu, 02 Jan 2025 23:00:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:43 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: [PATCH 0/5] PCI: mediatek-gen3: Add MT8196 support
Date: Fri, 3 Jan 2025 14:00:10 +0800
Message-ID: <20250103060035.30688-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220054_937216_9AACFDDD 
X-CRM114-Status: UNSURE (   7.05  )
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

The MT8196 is an ARM platform SoC that has the same PCIe IP as the MT8195.
It has 6 clocks like MT8195, but 2 of them are different, also it requires
additional settings in the pextpcfg registers, hence that introduce
pextpcfg in PCIe driver for these settings.

Jianjun Wang (5):
  dt-bindings: PCI: mediatek-gen3: Add MT8196 support
  PCI: mediatek-gen3: Add MT8196 support
  PCI: mediatek-gen3: Disable ASPM L0s
  PCI: mediatek-gen3: Don't reply AXI slave error
  PCI: mediatek-gen3: Keep PCIe power and clocks if suspend-to-idle

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  29 ++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 129 ++++++++++++++++++
 2 files changed, 158 insertions(+)

-- 
2.46.0


