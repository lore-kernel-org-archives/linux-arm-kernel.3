Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447BAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB1xz1m2v/suEMsr+ger8Wxns2d8VRveZipankd8Rvk=; b=BVI+aqihbT6ThtIUd/rgDCGxJT
	qQov6pOYhhzYVXHiyhK1emZKaUNrrCExwM0V/zkkql4rtPAMqSaOCakJ+tw82j2UNKkY61dGd7kN9
	JMcxvONQUrCtZNmCh4s34j+k4lXp5ZS7CaFU9bTQjBTQH7KF52W/MOiKOTjclGzfgUS/87tIyIOVe
	FSxcWoCttFGSJjl2H93EN4843xINP8MLpNkhUf5NwfBUKWHtN4eBuwIsLh+yGKB1Bq8qJP08nPQzx
	bsHhP+pVeFdkZI/wCKvKYYp7JlZeQmEBlBE0D7oMXBTNwBbHEFW6phNoZZiQupPhhQZA0JKodC6FZ
	aJ/IMGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rS1-00000004MoY-2ziF;
	Mon, 21 Apr 2025 13:44:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rMT-00000004M25-0Gzz;
	Mon, 21 Apr 2025 13:39:02 +0000
X-UUID: f89b7bde1eb511f0b1a74d0c5e11a509-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZB1xz1m2v/suEMsr+ger8Wxns2d8VRveZipankd8Rvk=;
	b=TCqa4VINnrULLmIoA+/mq+ewY/YlNQrJBBpndec9S8fPnrzXUv6gG2bH2pIOfUBIDoi0vmX6TNaznvuZetwopCmOL1U7UIMk7Fq8oN+JHkudnu9skjBa3XraNfn8JYVNGOoWW2d5BWkVfVr1NExLiKB+cpieW02Gh6IEVWG+5K4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c12dcd0c-d976-400f-88db-9bc1268b5c63,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a175d3c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f89b7bde1eb511f0b1a74d0c5e11a509-20250421
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 361435065; Mon, 21 Apr 2025 06:38:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 21:38:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 21:38:52 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Nancy Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	"Paul Chen --cc=devicetree @ vger . kernel . org"
	<paul-pl.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>
Subject: [PATCH v2 2/5] dt-bindings: display: mediatek: postmask: Add compatible string for MT8196
Date: Mon, 21 Apr 2025 21:38:29 +0800
Message-ID: <20250421133835.508863-3-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421133835.508863-1-sunny.shen@mediatek.com>
References: <20250421133835.508863-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_063901_101249_F717F5E1 
X-CRM114-Status: UNSURE (   8.36  )
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

Add a compatible string for MediaTek MT8196 SoC

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,postmask.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index fb6fe4742624..29624ac191e1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-postmask
               - mediatek,mt8188-disp-postmask
+              - mediatek,mt8196-disp-postmask
           - const: mediatek,mt8192-disp-postmask
 
   reg:
-- 
2.45.2


