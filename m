Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5545FCCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JruXHPh7YMkSWVzP3hFnXvBFWJm/Bm+uRWMQyfcvcVU=; b=Jgm4soc/47tlcYqy+CvgIWugLN
	r1d/utdqfTkCpn7re6NuhhyxQCznQu6YLvhOb2IlTCrm8C8uj6PwXg9UHl2KZGFc2tAOBWIaWpPUV
	v9MqdclGKP6l7siVIQr8WPcYMUojL+oxxVJ4QHpVgTC5pzh2bMEsqsDXj1JddIxMnZExChc0Zaabm
	M6U8OEm7gQOVNKZrnDAymJK1FurF/+95vRdlza7L5LM1p6mN48JeaVVBCEY/fPDBopMm0J1mHU/Yi
	sC047GfHzKxOTgK+9ttDaX19HVOq1JLBjr9qvMMzykLhFw/mh/OGzK9I8/hT+BQ03I4GRPXhHkOlo
	rDOQLRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho1q-00000001wqR-2n7O;
	Mon, 19 Jan 2026 12:06:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho1J-00000001wkL-3Y0r;
	Mon, 19 Jan 2026 12:06:16 +0000
X-UUID: 3711e6b4f52f11f0ad39f32c34db0b1c-20260119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JruXHPh7YMkSWVzP3hFnXvBFWJm/Bm+uRWMQyfcvcVU=;
	b=LHbA3wgh4g51G/5jTZyLourYBp0fo/+C+l9SwpMleb1nBBTI64bVZKGraoP6Tf2vVYR9J8mDdqX2RIUC+0QbhzBfsrHPF8S2Z5fOHiD7subT4nw5xNJCFfXR5WOlra9frrf8DC6t5VP/QuYZUzBpJj7uYTAM2gp+ACdhKjhRw7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:7d15678a-4abc-4761-b447-067dd4a374aa,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:014eaee8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3711e6b4f52f11f0ad39f32c34db0b1c-20260119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1520852899; Mon, 19 Jan 2026 05:05:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 19 Jan 2026 20:05:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 19 Jan 2026 20:05:55 +0800
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
Subject: [PATCH v12 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Date: Mon, 19 Jan 2026 20:05:23 +0800
Message-ID: <20260119120552.9325-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040610_051992_F3F02147 
X-CRM114-Status: GOOD (  18.80  )
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

Based on tag: next-20260116, linux-next/master

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
Changes in v12:
- We used to parse 'mediatek,smi' property in 'mtk_smi_larb_parse_syscon'
  to get smi sub common regmap. The property has already been parsed in
  'mtk_smi_device_link_common'. To remove redundant code, we remove
  'mtk_smi_larb_parse_syscon' function and get the smi sub common regmap
  in 'mtk_smi_device_link_common'.
- We need to get driver data in 'mtk_smi_device_link_common', so move
  'platform_set_drvdata' before 'mtk_smi_device_link_common' in
  'mtk_smi_larb_probe'.

Changes in v11:
- Add error checking in the 'mtk_smi_genpd_callback' function and use
  'switch-case' statement instead of 'if-else'.
- Use 'larb->larb_gen->clamp_port[larb->larbid]' to determine
  whether smi larb requires clamp and reset operations or not in
  'mtk_smi_larb_probe'. Remove the '_optional' suffix from the
  function name.
- Replace 'devm_reset_control_get_optional_exclusive' with
  'devm_reset_control_get_exclusive' in 'mtk_smi_larb_parse_reset',
  return the error code if it fails to get the reset controller.
- Remove genpd callback when smi larb probe fails.
- Link to v11:
  https://lore.kernel.org/lkml/20250917120724.8650-1-friday.yang@mediatek.com/

Changes in v10:
- Rename 'smi_comm_inport_id' to 'smi_comm_in_port_id'.
- Return 0 when it fails to get 'larb_id' in
  'mtk_smi_larb_parse_clamp_optional'.
- Link to v10:
  https://lore.kernel.org/lkml/20250806085946.11383-1-friday.yang@mediatek.com/

Changes in v9:
- Add 'dev_pm_genpd_remove_notifier' in 'mtk_smi_larb_remove'.
- Remove unused macros.
- Rename 'sub_comm_syscon' to 'smi_comm_syscon'.
- Rename 'sub_comm_inport_id' to 'smi_comm_inport_id'.
- Add more detailed descriptions in change log.
- Fix incorrect tags.
- Link to v9:
  https://lore.kernel.org/lkml/20250804125215.23076-1-friday.yang@mediatek.com/

Changes in v8:
- Fix incorrect tags.
- Link to v8:
  https://lore.kernel.org/lkml/20250521063347.31578-1-friday.yang@mediatek.com/

Changes in v7:
- We replaced 'pm_runtime_enable' with 'devm_pm_runtime_enable' in the
  v6 patch. This changed the order of cleanup, and reviewers expressed
  concerns that it could introduce unexpected issues. So v7 discard this
  change and continue using 'pm_runtime_enable'. We need to conduct
  further investigation to determine if there are any issues related
  to the cleanup order. This might be resolved in the future, but for
  now, we just maintain the current status.
- Link to v7:
  https://lore.kernel.org/lkml/20250430094545.23932-1-friday.yang@mediatek.com/

Changes in v6:
- Fix coding style.
- Add another patch to replace 'pm_runtime_enable' with
  'devm_pm_runtime_enable'.
- Link to v6:
  https://lore.kernel.org/lkml/20250408033206.12176-1-friday.yang@mediatek.com/

Changes in v5:
- Use 'devm_pm_runtime_enable' instead of 'pm_runtime_enable'.
- Remove 'pm_runtime_disable' in 'mtk_smi_common_remove' and
  'mtk_smi_larb_remove'.
- Link to v5:
  https://lore.kernel.org/lkml/20250311122327.20685-1-friday.yang@mediatek.com/

Changes in v4:
- Use 'devm_reset_control_get_optional_exclusive' instead of
  'devm_reset_control_get'.
- Link to v4:
  https://lore.kernel.org/lkml/20250221074846.14105-1-friday.yang@mediatek.com/

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
- Link to v3:
  https://lore.kernel.org/lkml/20250121064934.13482-1-friday.yang@mediatek.com/

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
- Link to v2:
  https://lore.kernel.org/lkml/20241120063701.8194-1-friday.yang@mediatek.com/

Friday Yang (2):
  dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
  memory: mtk-smi: mt8188: Add SMI reset and clamp

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  19 ++
 drivers/memory/mtk-smi.c                      | 177 +++++++++++++++++-
 3 files changed, 188 insertions(+), 10 deletions(-)

--
2.46.0


