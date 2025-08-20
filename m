Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1E0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5u4Vwb4xtJAYyfnNc08mhjzP1rRytSY2FLewgd5mi3s=; b=TsOIeZiHQw8F2U+htpMGmdWDQx
	gO4iNypLjfncPHQBTcVoUrS0D4Ie2pJQSXbpHu34t5A5TqgPmJMN+Qhaz1yJCufegd6swlKxHizYw
	OzWgzxyWA9JSfV5+Ys9fEeE0G8XjL5/GwGb83YXN4TX9Vz8AKrftv1QQiIm9YXWvxtG28hbd9Lput
	iYHHTX1wS6fdtb5nOrFBB8zzA9yZFOZTHiGeKrGBJ8m57xeKlYl5LILzypFwu8cesYP5K60EoXHpS
	49pjyIMnrkZ4rB5mfE8Wmlc311v4ZO/dN+Dde8Mp+ECZKVW4rgCKp6YQDHSmXNcGgvKqsq3UkjGTj
	CALR8pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogPO-0000000DFBU-3UBV;
	Wed, 20 Aug 2025 10:51:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofW3-0000000D2TB-2vuC;
	Wed, 20 Aug 2025 09:54:00 +0000
X-UUID: 73377c107da911f09eb0dd999d3936bf-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5u4Vwb4xtJAYyfnNc08mhjzP1rRytSY2FLewgd5mi3s=;
	b=kGodK6Kgwq/SJmpjTNJzYLNos+zPkNDXwm/eI2Po+Zjp4sQvWTaAOs6qI/JCV1Ud8LXoFE5Wx8Q+1h1ogD5qVtMq2o4ty81RtQF8QPJCu82TzkqyUhjmZpjYOAU4xo7fZvMjrylPzHFkekV3lAklVaoQgX1exn3UFqd1zYdsYTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:d97e4eae-4d69-4d07-ad7d-748341cfc63e,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:63a5547a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:-5,Content:3|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 73377c107da911f09eb0dd999d3936bf-20250820
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1752593688; Wed, 20 Aug 2025 02:38:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 17:38:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 17:38:33 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v4 1/4] dt-bindings: mailbox: add cmdq yaml for MT8189
Date: Wed, 20 Aug 2025 17:38:20 +0800
Message-ID: <20250820093831.23437-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250820093831.23437-1-xiandong.wang@mediatek.com>
References: <20250820093831.23437-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_025359_734621_1F0D6076 
X-CRM114-Status: GOOD (  10.14  )
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

Add compatible string to support cmdq for MT8189.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index 73d6db34d64a..f9718b90d36a 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -23,6 +23,7 @@ properties:
           - mediatek,mt8183-gce
           - mediatek,mt8186-gce
           - mediatek,mt8188-gce
+          - mediatek,mt8189-gce
           - mediatek,mt8192-gce
           - mediatek,mt8195-gce
           - mediatek,mt8196-gce
-- 
2.46.0


