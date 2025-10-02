Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8448CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BlSY6+qrGUZ462JTxJxa19s7WGyY7mscy/vRmwnQl0g=; b=hRU1vvk3UEfWATARG5ik+ZW1u7
	1CeYkCL9d7PUCGX64xLpqfJwR4HuAm6fwuB6l5pR4l2epIdeEp/Als0Z0ol2BPOu1vN8sQ81GSjMz
	2yOEQif0K1E0ClZRzslBSDu76tBymXCfPDk9SDgQMm2QhdkrR/wGwWFoZj4M9DBmTXMb1nJOg8DHw
	cehyFXn6n1w4hTSGuaTPZngYyPTMSDrKSHvStsKAj7U1/qoi12Fg1QzzVzmmob1dzy1k8f3lc8bUZ
	iLmXYFincW1jkoD9L/ZQFLPEpJWZcvgW9PeGYUTOyvD4YLlXx2Tg56f3/j4CDzon7q36pqrwYj6xF
	LP3Y627w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EtE-0000000A1MW-14ZF;
	Thu, 02 Oct 2025 08:42:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EtA-0000000A1LZ-3n5R;
	Thu, 02 Oct 2025 08:42:15 +0000
X-UUID: aed090989f6b11f0a52f393f94899d25-20251002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BlSY6+qrGUZ462JTxJxa19s7WGyY7mscy/vRmwnQl0g=;
	b=KW/LJGTq7tQ02RW/UZiteDYVt8IhiTrbnMcaQGIwh/paF9pi5VHFPpibJINfGqi7bWgRXSjXkl+QCnxKJVEd9nc/ypEfRwcFPDrwwpjcsOHXm7yXD4G91ljKY7g9Vwx1mTvsqr5ilQ9eQq/07tglJKOlsWNhbdmrbZaWPS1TNtQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ee94a327-c86d-48ea-96d7-9fb6df2e98ae,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:a9d874c,CLOUDID:d6b42a6d-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:3|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aed090989f6b11f0a52f393f94899d25-20251002
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1286553512; Thu, 02 Oct 2025 01:42:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Oct 2025 16:42:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 2 Oct 2025 16:42:03 +0800
From: Jjian Zhou <jjian.zhou@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jjian Zhou
	<Jjian.Zhou@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jjian Zhou
	<jjian.zhou@mediatek.corp-partner.google.com>
Subject: [PATCH v7 0/2] add VCP mailbox driver
Date: Thu, 2 Oct 2025 16:41:53 +0800
Message-ID: <20251002084204.15898-1-jjian.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_014212_951286_ECAFCE3E 
X-CRM114-Status: GOOD (  14.70  )
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

From: Jjian Zhou <jjian.zhou@mediatek.corp-partner.google.com>

Hi everyone,

This is v7 of my VCP mailbox driver.

Changes since v7:
- mtk-vcp-mailbox.c:
  - Change type u32 to u16.
  - Change BIT(ipi_info->index) to if.
  - Put the platform_set_drvdata between "of_device_get_match_data"
    and "platform_get_irq".
- mtk-vcp-mailbox.h
  - Modify the definition to MTK_VCP_MBOX_SLOT_MAX_SIZE.

Changes since v6:
- mtk-vcp-mailbox.c:
  - Replace mtk_vcp_mbox_priv with mtk_vcp_mbox.
  - Move mbox_controller to the first member.
  - Define "struct mbox_chan chan"; Remove allocate one during the probe.
  - Remove API get_mtk_vcp_mbox_priv.
  - Pass the private data since there's only one mailbox.
  - Modify mtk_vcp_mbox_xlate "return &mbox->chans[0]".

Changes since v5:
- binding:
  - Patch 1 fix 'make dt_binding_check' errors.
  - Link to v5
    https://patchwork.kernel.org/project/linux-mediatek/patch/20250822021217.1598-2-jjian.zhou@mediatek.com/

Changes since v4:
- binding:
  - Match the binding file name and compatible.
- mtk-vcp-mailbox.c:
  - Drop 'dev_dbg(dev, "MTK VCP mailbox initialized\n")'.
- Since the reviewer hopes to combine the VCP IPC driver and
  the VCP driver for a unified review, the original three patches
  have been split into two parts: the VCP mailbox driver and
  the binding remain together, while the VCP IPC driver is merged
  with the VCP driver and submitted as one.
- Link to v4
  https://lore.kernel.org/all/20250820094545.23821-1-jjian.zhou@mediatek.com/

Changes since v3:
- binding:
  - Remove unused lable '|' and 'vcp_mailbox0'.
- Link to v3
  https://lore.kernel.org/all/20250317110331.2776-1-jjian.zhou@mediatek.com/

Changes since v1:
- Link to v1
  https://lore.kernel.org/all/20250305082047.15746-1-jjian.zhou@mediatek.com/

In the v2 version, there is ongoing discussion about whether the VCP's
IPC should use mailbox or rpmsg. To prevent the discussion records
from being lost, the previous discussion link is attached.
https://lore.kernel.org/all/CAGXv+5FXqZb_v2dQNgCKbFpJrLhbVk3f0sWrrMCVk3jaWwoBqA@mail.gmail.com/

Jjian Zhou (2):
  dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk vcp-mbox
    document
  mailbox: mediatek: Add mtk-vcp-mailbox driver

 .../mailbox/mediatek,mt8196-vcp-mbox.yaml     |  49 +++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-vcp-mailbox.c             | 170 ++++++++++++++++++
 include/linux/mailbox/mtk-vcp-mailbox.h       |  32 ++++
 5 files changed, 262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

--
2.45.2


