Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DBC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 01:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTuuCpBbCKlfv4XuI4H/Clo2iT9msY0YoeaAABY+yvM=; b=gr/xIuPfY7Q5pJpsywj7M02dM0
	XmEyNI1cu0//328jT6BI7d3VzZmynbAYuVz+BqKrJgjsaULiHc9h2kb7GBwG3gEE0O/D1LC7bp9y9
	A+oC4xDYJvBzifwsRn65zxOhVVq0UgpsYK3PJl04fwdZjdgjzluP3yc0hyM5kDs7e8xbdldDHt7Zw
	T60Hexye6URqnGhOtfwqQ+Zht+Ze2dQTbAUZpOPZ9qOy2XwvMV+tVsh9uF04lFdf5UxtiPNtnUm6X
	7vpGgGTN7L/xLgc4GfbqO5huZ3Se8ScT0rJ++IhU7FtKvTHs0uBReBiN3Ak6HLJWmoqIoDObzzFfo
	ATf+en1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lXi-0000000CXpk-0MWM;
	Thu, 24 Apr 2025 01:38:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lVj-0000000CXgT-2cGM;
	Thu, 24 Apr 2025 01:36:20 +0000
X-UUID: 7fa5279a20ac11f0b1a74d0c5e11a509-20250423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jTuuCpBbCKlfv4XuI4H/Clo2iT9msY0YoeaAABY+yvM=;
	b=a4ikG8du3HfHEVSFPOHe24Ov8XR1wgDsXBNYOVJkHvkjgMCy6xMfhKcDehWg+F6wOj/CZgjif2kvC86zdBhOjvGykAGyEVOnt1yke/V3uEyJgkdRB0uFIC3URPisLb76cNsok5wzxG+DMZkg6r/gDEsuhaNJHAIKKu4nJc8gzjc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a3307fb9-edfa-45d0-8b0f-61398770b93c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:93ab796b-2b07-410f-9c30-89db65cbd451,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7fa5279a20ac11f0b1a74d0c5e11a509-20250423
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1448093004; Wed, 23 Apr 2025 18:36:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Apr 2025 09:36:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Apr 2025 09:36:06 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <yong.mao@mediatek.com>,
	<qingliang.li@mediatek.com>, <andy-ld.lu@mediatek.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>
Subject: [RESEND] arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
Date: Thu, 24 Apr 2025 09:34:35 +0800
Message-ID: <20250424013603.32351-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_183619_670586_685A1AEF 
X-CRM114-Status: UNSURE (   8.87  )
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

Under specific conditions, the SDIO function driver needs to
remove/add SDIO card to perform a reset. Remove the non-removable
property to support this scenario.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..fc78a79d96e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -518,7 +518,6 @@ &mmc1 {
 	cap-sdio-irq;
 	no-mmc;
 	no-sd;
-	non-removable;
 	vmmc-supply = <&pp3300_s3>;
 	vqmmc-supply = <&mt6366_vio18_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
-- 
2.46.0


