Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E7DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuNnWs7NvVCyXYhfvN4md9ZQKcZAEL1oFKVT7WxKP/c=; b=RO0IxQZKZKjKXoSrqt4/EqV8QX
	c5tXCjjDT23gC0NOT09vEwQNPYh4enftds5qZK+Gs9Hd91W3R/1q80R4b/NRTBvjSp9Lhi55rseic
	oDuzRa4h/VEy22JA47BBfP9N2jlEVXt0JMc9N2JZ+axidb4lrKOzpZ+u93FzcRMMsZnMHK6TEXym2
	g4QZdW8O9XZQyyNO/lBzMQUcKmYE9/VAc90YnKPvZDmOgFSDyMGdps/DWdnPMEqOtAonfVjYQh8AB
	/ftVhbyJp91ELwu7c049DgfqObr8fbsTzsQ2DJLkXy3FasHTAVrbs2yJ32jQWuoPDoYxY6SPH6X/4
	O9HtiKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEKA-0000000FJcY-00hr;
	Fri, 10 Jan 2025 12:41:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEHv-0000000FImI-10Nf;
	Fri, 10 Jan 2025 12:38:56 +0000
X-UUID: d6cdeca4cf4f11ef9048ed6ed365623b-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GuNnWs7NvVCyXYhfvN4md9ZQKcZAEL1oFKVT7WxKP/c=;
	b=XqvKNipAEt/bVsYT5NR99dZrDHTs0Rr5mLX77D1vl1xO6aELiXpKFbJVmMKO2EnBO+15R7TNls57FxeXuqqea/pmpT4r6BuBcnLf97l42Lsrp5obSsscWv1s3QhGA+zYl6CJSGPyTS0k7dHz4g4jpQrCy81jGwMv9a6SPEYXLGg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ae8a2ede-0434-4b95-93b6-d66ef3526064,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:4633b037-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d6cdeca4cf4f11ef9048ed6ed365623b-20250110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 120874492; Fri, 10 Jan 2025 05:38:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:45 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 02/12] dt-bindings: soc: mediatek: add mutex yaml for MT8196
Date: Fri, 10 Jan 2025 20:33:57 +0800
Message-ID: <20250110123835.2719824-3-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043855_288785_B06C4AD7 
X-CRM114-Status: UNSURE (   8.41  )
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

From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>

Add compatible string to support mutex for MT8196.

Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index a10326a9683d..1be4e139a8b5 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -36,6 +36,7 @@ properties:
       - mediatek,mt8188-vpp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8196-disp-mutex
       - mediatek,mt8195-vpp-mutex
       - mediatek,mt8365-disp-mutex
 
@@ -87,6 +88,7 @@ allOf:
               - mediatek,mt8186-mdp3-mutex
               - mediatek,mt8192-disp-mutex
               - mediatek,mt8195-disp-mutex
+              - mediatek,mt8196-disp-mutex
     then:
       required:
         - clocks
-- 
2.34.1


