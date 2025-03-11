Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787FCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KK+/RmR1fDa/48B6jmY4n1J//yOw/sjpmxW9roLWxqI=; b=HS43kUDvxFSAFr9nXhV8aV2+IC
	D5gWP2gbfVsfEivxn/OvkllMySdqZ2D5kQdCBrC6XsVPNdS/AYuG7cQ9iYeteK+T2KAHPgC0ywolI
	tlfd5Lp7pjL7V9JPHo/qjw8TOlU67XDAN5ToSgI60Vbkc1CBD4Sqxitelz3ZD1AbO+AjJi9+wh5P1
	V4Xl5ho3PK4pTj96n+aF35ybwRZGcmPT1KBp+H7YPnK9DGbIxpQE34S3lJWGB0WjLFf0qxQqZ4WR+
	qes5K3sysX5Mu7/kKZGHI9kecp4jj54Z9F7TYX3+DUxL/KD+ZvvaTelbXWkedu8teRffwYrdfx4Ai
	5tazMvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trysE-00000005g8p-0a7U;
	Tue, 11 Mar 2025 12:38:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trye1-00000005ccS-2ar2;
	Tue, 11 Mar 2025 12:23:38 +0000
X-UUID: a509c244fe7311ef83f2a1c9db70dae0-20250311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KK+/RmR1fDa/48B6jmY4n1J//yOw/sjpmxW9roLWxqI=;
	b=c/KoERW244gwPXkPELVTdOrKW92IIrut58Yxv7soknudOx8Cn4y4zrjPkVTBvKdnqiZ9Mzd2OoxqylRdKoAAv14OMni92DC1FcooMUrju966l5RdQyeY+CDHXbx6IkAgtqbaij5EIPiCVvvMuXHm+3CHTYne/zJ4T3HO5BFS2Xo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4864b544-ccac-4afb-8506-0a10cd5c8097,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a6024dce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a509c244fe7311ef83f2a1c9db70dae0-20250311
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618321730; Tue, 11 Mar 2025 05:23:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Mar 2025 20:23:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Mar 2025 20:23:27 +0800
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
Subject: [PATCH v5 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Date: Tue, 11 Mar 2025 20:23:20 +0800
Message-ID: <20250311122327.20685-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_052337_660745_85738F1A 
X-CRM114-Status: UNSURE (   9.02  )
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

Based on tag: next-20250307, linux-next/master

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

Changes v5:
- Use 'devm_pm_runtime_enable' instead of 'pm_runtime_enable'.
- Remove 'pm_runtime_disable' in 'mtk_smi_common_remove' and
  'mtk_smi_larb_remove'.

v4:
https://lore.kernel.org/lkml/20250221074846.14105-2-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20250221074846.14105-3-friday.yang@mediatek.com/

friday.yang (2):
  dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
  memory: mtk-smi: mt8188: Add SMI reset and clamp for MT8188

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  19 +++
 drivers/memory/mtk-smi.c                      | 150 +++++++++++++++++-
 3 files changed, 164 insertions(+), 7 deletions(-)

--
2.46.0


