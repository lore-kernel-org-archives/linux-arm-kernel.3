Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F9CFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86q4Zuo6aBd/L3i4NYi1P6U8VCnSNpXDSdHTFbafsWg=; b=3wW8OkvEhKHx9D4TutZxooUSoK
	l6Pus7BrRzqARA/QtcV0namdNw0bQXIxvvv31sAGk0WN+9/7ZghxPfrok1NEikGaKlN6gJoK/tqp3
	D4XWEHhXLwGGUNRQPo/fdVEzPKDmCsDiiJ9Hb8kW9dGUJ26jq91y+5wNv82SPRnsnYv1SvOiefS/N
	a33bJ23MTbNsf/N2CR8r6iIRdC1FWt7fjpfjcbYDWPWZfF7jCbM2TE4D7GJZFk1DAQhPft3x64CZg
	Fl0ylHOafPkBSaMt/0dCV3kZfNE2mhpkDExnAJ7uDfOLgfyRw6LaahV4EcPo5fe0hluZj93CURc8i
	rcwY5/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJw6-0000000GlPS-0MoA;
	Mon, 27 Apr 2026 11:15:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJvr-0000000GlCT-460T;
	Mon, 27 Apr 2026 11:15:21 +0000
X-UUID: 5ceb1f3e422a11f19e7563141e833ce8-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=86q4Zuo6aBd/L3i4NYi1P6U8VCnSNpXDSdHTFbafsWg=;
	b=OVQjYj+ZiDTkPz7CvtX5vf23V0npAozbQ0hR4J0zVbzWt0nZQKK4CH3nzAjyJ0daZBD8l5G/tByEmJsspmOEbkTKzlIG4VTVgQZugDg/uu8cb61DNuu0ri86W/Zzm9AbOv9ug4y8EPRP671g92/sSbXry5exTJNXficWbYhilMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:efa2ca92-1e4c-4318-81d5-fad02c382d34,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:607d82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ceb1f3e422a11f19e7563141e833ce8-20260427
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 976948990; Mon, 27 Apr 2026 04:15:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:10 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, Vince-WL
 Liu <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 7/7] MAINTAINERS: Add entry for MediaTek VCP remoteproc driver
Date: Mon, 27 Apr 2026 19:04:46 +0800
Message-ID: <20260427111446.22955-8-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_041520_117754_67002338 
X-CRM114-Status: UNSURE (   8.78  )
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

Add maintainer entry for the MediaTek Video Companion Processor
(VCP) remoteproc driver, including the device tree bindings,
firmware IPC interface, remoteproc driver, and public headers.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62b89d0013d2..4e27fcca28f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3065,6 +3065,20 @@ N:	mtk
 N:	mt[2678]
 K:	mediatek
 
+ARM/MEDIATEK VCP REMOTEPROC DRIVER
+M:	Xiangzhi Tang <xiangzhi.tang@mediatek.com>
+M:	Matthias Brugger <matthias.bgg@gmail.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-remoteproc@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
+F:	drivers/firmware/mtk-vcp-ipc.c
+F:	drivers/remoteproc/mtk_vcp*
+F:	include/linux/firmware/mediatek/mtk-vcp-ipc.h
+F:	include/linux/remoteproc/mtk_vcp_public.h
+
 ARM/Mediatek USB3 PHY DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.46.0


