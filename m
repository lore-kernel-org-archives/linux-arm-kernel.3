Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rYMR5chlPy2tpwvio9NlfPgzh2Cb5gxMxxA1dz+0yWU=; b=Y61MQR45dOaSTtyZsKtnN4qgRE
	IA+swRw7BvDp8t1ecRS2tzfhZxjBYVaoUYCZR2uGU1gMkOVidt3We5WKP8l29SSzsdXULvALny3aR
	sKh5PEU5hdUh+dU0Yu3milwjqj899uVE3OiYIKYrtE0h7Z3jjLslLvWs1KGw4xFO/0Wrx6JfxPXj+
	mkCCdoPC9uFdxYy7gRptR5Nz5pQruILVi5xRNLcr05c0CupVMX9BmqzuD7N01hPxZJijGvj+NHxSi
	ppz2n+SWxFPMMB7atJWWaumXrIQjHNZt0lrmFrKx6rz+Pdv3NM+4IpKuy1V3kUUmL7MGIqLT9m/+G
	DMWEyBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuzB-0000000AVHV-0ipO;
	Mon, 04 Aug 2025 13:12:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiufw-0000000ARHA-1Zul;
	Mon, 04 Aug 2025 12:52:25 +0000
X-UUID: dc375034713111f09f706fa2197c6ceb-20250804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rYMR5chlPy2tpwvio9NlfPgzh2Cb5gxMxxA1dz+0yWU=;
	b=FVaDJIztjGKJW2kFpvPS3+qHIGjM7headQVPnJv9nBA7m9vRW80rL2Ilb+PedtQlma9UOTh39h3qmkSKxwNp/Vm0swuqi4vehSNlSwouavRcSqEsx4rD0q6W5xYUhLSpGsplanttEYPC2vVJpfX36Rxi5PakNEf2RASvZo3fLbI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:750d9b25-95a1-48f8-9861-9c3b30735f70,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:46029150-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dc375034713111f09f706fa2197c6ceb-20250804
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1377308192; Mon, 04 Aug 2025 05:52:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 4 Aug 2025 20:52:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 4 Aug 2025 20:52:16 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Date: Mon, 4 Aug 2025 20:51:52 +0800
Message-ID: <20250804125215.23076-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_055224_419134_C084C24F 
X-CRM114-Status: GOOD (  16.02  )
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

Based on tag: next-20250804, linux-next/master

On the MediaTek MT8188 SoC platform, we encountered power-off failures
and SMI bus hang issues during camera stress tests. The issue arises
because bus glitches are sometimes produced when MTCMOS powers on or
off. While this is fairly normal, the software must handle these
glitches to avoid mistaking them for transaction signals. What's
more, this issue emerged only after the initial upstreaming of SMI
driver.

The software solutions can be summarized as follows:

1. Use CLAMP to disable the SMI sub-common port after turning off the
   LARB CG and before turning off the LARB MTCMOS.
2. Use CLAMP to disable/enable the SMI sub-common port.
3. Implement an AXI reset for SMI LARBs.

---
Changes in v9:
- Add 'dev_pm_genpd_remove_notifier' in 'mtk_smi_larb_remove'.
- Remove unused macros.
- Rename 'sub_comm_syscon' to 'smi_comm_syscon'.
- Rename 'sub_comm_inport_id' to 'smi_comm_inport_id'.
- Add more detailed descriptions in change log.
- Fix incorrect tags.

Changes in v8:
- Fix incorrect tags.

Changes in v7:
- We replaced 'pm_runtime_enable' with 'devm_pm_runtime_enable' in the
  v6 patch. This changed the order of cleanup, and reviewers expressed
  concerns that it could introduce unexpected issues. So v7 discard this
  change and continue using 'pm_runtime_enable'. We need to conduct
  further investigation to determine if there are any issues related
  to the cleanup order. This might be resolved in the future, but for
  now, we just maintain the current status.

Changes in v6:
- Fix coding style.
- Add another patch to replace 'pm_runtime_enable' with
  'devm_pm_runtime_enable'.

Changes in v5:
- Use 'devm_pm_runtime_enable' instead of 'pm_runtime_enable'.
- Remove 'pm_runtime_disable' in 'mtk_smi_common_remove' and
  'mtk_smi_larb_remove'.

Changes in v4:
- Use 'devm_reset_control_get_optional_exclusive' instead of
  'devm_reset_control_get'.

Changes in v3:
- Remove redundant descriptions for 'resets' and 'reset-names'.
- Modify the requirements for 'resets' and 'reset-names'.
- Rename 'mtk_smi_larb_parse_clamp' to 'mtk_smi_larb_parse_clamp_optional'.
- Rename 'mtk_smi_larb_parse_reset' to 'mtk_smi_larb_parse_reset_optional'.
- Merge 'mtk_smi_larb_clamp_protect_enable' and
  'mtk_smi_larb_clamp_protect_disble' into one function.
- Modify the definition for mtk_smi_larb_clamp_port_mt8188,
  use 'larbid' as the index of the array.
- Use 'syscon_regmap_lookup_by_phandle' instead of 'device_node_to_regmap'.
- Do Not parse 'resets', just check the return value of
  'devm_reset_control_get'.
- Add 'has_gals' flag for 'mtk_smi_sub_common_mt8188'.

Changes in v2:
- According to previous discussions in v1, divided these four
  patches into two topic separately.
- Modify the description for 'resets' in binding.
- Add const value 'larb' for 'reset-names' in binding.
- Modify requirement for 'resets' and 'reset-names' in binding.
- Delete 'mediatek,smi-sub-comm' in binding.
- Delete 'mediatek,smi-sub-comm-in-portid' in binding.
- Modify the example in binding.
- Add 'mtk_smi_larb_clamp_port_mt8188' definition in SMI driver.
- Change the way to parse the 'resets' in driver.
- Change label from 'err_pm_disable' to 'err_link_remove'.

---
Friday Yang (2):
  dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
  memory: mtk-smi: mt8188: Add SMI reset and clamp for MT8188

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  19 +++
 drivers/memory/mtk-smi.c                      | 131 ++++++++++++++++++
 3 files changed, 152 insertions(+)

--
2.46.0


