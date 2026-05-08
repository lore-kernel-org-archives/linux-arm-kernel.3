Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A0CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=; b=4D7Rzm7NxsJfrSjnx5kPy8i2Ut
	6/iV3AgrUG8kU171dApJMKQMea1IHxDVZryQ9LquRl72g5Zv3Wt2mQmMkOIwAYJfZHqB7lH9jakoV
	wYnOySfusEiDVRi0zCgmzeKo+XF747QR26C0VVrOr7NBEjUlVP5tP9BahV3AmPmulU3Fj+S6qIPqx
	vyH/Bhr08Ttn57QQELtx8QKGLMbKHwNHsyG67LQpbrbQJZRlNg1oNQw+vjWnq/qa/8vRHEnr9noGv
	qWr3Z18X2lb0NOv/GE5cZzjeP73LAFfSFW879/WjZcKZang7Slv8G8ZvC0w7LTotYAQ7Muti5aSNf
	wDVF/LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK7d-00000006RhQ-32Ra;
	Fri, 08 May 2026 12:16:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK7a-00000006Rgd-3V3w;
	Fri, 08 May 2026 12:16:00 +0000
X-UUID: a81249be4ad711f19f231fa534c5cac8-20260508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=;
	b=cqTLal99xo6QYt15dZSbVMy3wx16WuvVIpHZyLUaMMg9HY3N9GwnWLSk3USmz69ognnw2W+qmsKBP42WOR++kQIOfjA0hjJrsBf9cFtKJKZuDLNCATc3KEVwv0ZB6Hd2ggp02voIZd+aKK0pRaBgl/cEEerTj0/JnEjNsGMBs+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:43247f4f-6bac-47de-9847-a0741df10dcd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4ab84e45-8360-4d24-8500-9b9380fa4b0d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a81249be4ad711f19f231fa534c5cac8-20260508
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113933619; Fri, 08 May 2026 05:15:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 8 May 2026 20:15:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 8 May 2026 20:15:49 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v2 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Fri, 8 May 2026 20:15:46 +0800
Message-ID: <20260508121547.516634-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_051558_943163_DCB9EA95 
X-CRM114-Status: UNSURE (   7.97  )
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

This patch updates the MediaTek SCP device tree binding to support
multiple memory regions for MT8188 SoCs, addressing review feedback
from v1.

The MT8188 SCP requires two memory regions (SRAM + L1TCM) while other
MediaTek SoCs use only one. This patch follows the proper pattern of
using conditional schemas with explicit descriptions.

Changes in v2:
- Use conditional schema (if/then in allOf) to restrict multiple
  memory regions only to MT8188 variants, keeping maxItems: 1 as
  default for other SoCs (addresses Krzysztof's review)
- Add explicit item descriptions for each memory region (Main SRAM
  and optional L1TCM) instead of just setting minItems/maxItems
- Apply to both top-level and patternProperties

Based on linux-next, tag: next-20260505

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.45.2


