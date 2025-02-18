Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKLpxBKCBvfsCSLQzgV9GkKPk2DekUh6tb2OhIr92UU=; b=cYjgABT37gUpN9SILVXwgHdjyf
	BEf06QjUqPyXNcPQxi9Jkr5NT34HmqlokHBuo7mncWHKOvqsupizL0PJVYg08BKmo1ABXswSdD9fY
	Xtmntjk5Fc3cxdySF3+QFT3bnAgSx4KrOsLxZBqqnwIm66L4KdA1rgEcX19B3oz2p3+t/6tFb71JU
	TKfPnQuCa/jlKlQrllYkejCO8oqjE9c0TAHNXEHprgKAzsu8XOLi9ca2A46ooQDxu62lQzHoWghgP
	yHuHU49noN5GvhpKwgiv2rNlWruN0J9DW9r68XlVxWnpnU/iSqSrrIaIzDtRfj+UHcghIYaKEZQ8+
	Qm5Q0o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGRx-00000006tuT-290A;
	Tue, 18 Feb 2025 05:47:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGP2-00000006t1M-0ZbE;
	Tue, 18 Feb 2025 05:44:17 +0000
X-UUID: 5fb9793cedbb11efa1e849db4cc18d44-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wKLpxBKCBvfsCSLQzgV9GkKPk2DekUh6tb2OhIr92UU=;
	b=Tx+U7mGh/qJc6QcaG2K+CKMfDug7CnWBBQrz/Dc6OtcAUK+P5jOP+l50DKSLX4bYkjedb3r7fLxUJFYvEHocsj0Y/fJTjKMLoh94l2WjYwcGktgb56lrd4bgzGHjy7KJH9d8ZzKljX3T0+fouobinO5xUHNyPLGAf+Dv+q6ga5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:89b82bbc-59c2-48ef-be3e-b82c5c2702ed,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:9f82770b-46a1-4805-887b-d6afca075802,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5fb9793cedbb11efa1e849db4cc18d44-20250217
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1445971464; Mon, 17 Feb 2025 22:44:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 13:44:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 13:44:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 0/8] Add GCE support for MT8196
Date: Tue, 18 Feb 2025 13:41:45 +0800
Message-ID: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_214416_175847_64CCF415 
X-CRM114-Status: GOOD (  14.27  )
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

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and iommus property, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---
Change in v4:
1. Remove dt-binding header and add a gce header in dts folder.
2. Remove dot in sign-off name.
3. Change addr type from u32 to dma_addr_t for cmdq_reg_shift_addr() and
   cmdq_reg_revert_addr().

Change in v3:
1. Merge 2 dt-bindings pathes together and add more detail commit message.
2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
   cmdq_subsys_is_invalid().
5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
6. Rebase on the new MACRO in mtk-mdp3-comp.h.

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH Lin (8):
  dt-bindings: mailbox: mediatek: Add support for MT8196 GCE mailbox
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for unsupported subsys ID
    hardware
  soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
    address
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: mediatek: mdp3: Add programming flow for unsupported subsys ID
    hardware

 .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
 arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  33 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  90 ++-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  18 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  79 ++-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  53 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  14 +-
 drivers/soc/mediatek/mtk-mutex.c              |  11 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   2 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   3 +
 11 files changed, 876 insertions(+), 43 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0


