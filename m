Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l7mCsGPgokHXyP8uY+tRPYlUOzo/mMetz6YXudC9qco=; b=lH0lpq8FJWfLIJGDcI3aXbOsHM
	SrlOAQMbLGDIN+ZAlta+JTKg9aguIPUn1tPUCI3N8UrTG3nO3nbRoN9rJxy+hHkgxM1i7D3H2wBpp
	7fq8K/h2fr1FdOWNsJ2x+JqeMPqELV4E1n/bYIifpl68e9KrSjLGmo9ff4HMMguITI8WASu8OLQZk
	GB6WdhpAtxFqUOqYfKUACabuSptXRNy/ef1SPe4g2m0hBngCKwj8BcCDqzRtBDzhZ9AlmR6knhULv
	eY6LOxsd9v/pJFqg3gLneqsmZC+ACwsRUgWEMfB+AETVOiiEmXysI0zzu7Vm2lPwWMn9FlLIBwKW2
	e7PkMiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepeS-00000000wF1-2RVB;
	Wed, 01 Jul 2026 07:46:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepeP-00000000wDI-2GJy;
	Wed, 01 Jul 2026 07:46:30 +0000
X-UUID: f4393cb2752011f1afed4741b24580c9-20260701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l7mCsGPgokHXyP8uY+tRPYlUOzo/mMetz6YXudC9qco=;
	b=AePkhl2Dy1E77S4Ha6FRsCvC18z+9g7Tr88d0krmINAvE/4w3aWGxUO4HxeAhzQ7v/fFZ/1uWlLjSuF0cWxLxSusvD6RLbNtCa/aGh1XvduTs4m0Qd1XLsFJFH5zNWJ82Fs1CMuD2tIsxV/Qr4XHqC36KI/egLh9R+VGIHZheCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:dad55192-46a5-4dc1-9456-0a974533faa9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:ae672a04-3795-4a90-800e-68e9393a343e,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f4393cb2752011f1afed4741b24580c9-20260701
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <congcong.yao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1631106793; Wed, 01 Jul 2026 00:46:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 1 Jul 2026 15:46:19 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 1 Jul 2026 15:46:18 +0800
From: Congcong Yao <Congcong.Yao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jarried.lin@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<justin.yeh@mediatek.com>, Congcong Yao <Congcong.Yao@mediatek.com>
Subject: [PATCH v3 0/2] MT8189 SMI SUPPORT
Date: Wed, 1 Jul 2026 15:44:45 +0800
Message-ID: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004629_592331_39A8DD89 
X-CRM114-Status: UNSURE (   8.28  )
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

Based on tag: next-20260629, linux-next/master

This patchset add mt8189 smi support.

---
Changes in v3:
- Change the clock numbers of smi-sub-common to minium 3
- Link to v2:
  https://lore.kernel.org/linux-mediatek/20260427070444.20247-1-zhengnan.chen@mediatek.com/
---

Zhengnan Chen (2):
  dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
  memory: mtk-smi: Add mt8189 support

 .../mediatek,smi-common.yaml                  | 18 ++++++++
 .../memory-controllers/mediatek,smi-larb.yaml |  3 ++
 drivers/memory/mtk-smi.c                      | 44 +++++++++++++++++++
 3 files changed, 65 insertions(+)

-- 
2.43.0


