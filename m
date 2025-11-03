Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A544CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RHKonKHpuu8h2tauK0dzekelgQBO2YV089GcLoFAdyw=; b=f+xPLuQOhDOfIuEw9A6reUjCRN
	eg4UO/Kn+et09vyCsj3KMO8DjoTvg6VXvsv/W7wnuo9LJdANMrb38j8bBD7kNTup5B0jgTNLyCsKs
	5sjz3cDDUjsccUg0tcAsyU71r5mFFeJDkCI5rBuUYaLuwZ6mmaIT5C/CqnNoEU4cN+QnvmW07REqS
	ilIrdO6zmEWJgsNooXmu+2qGJyH6Z0lyTKFcbImJ73TN1WQtP/NNfrCZs6iPDFq+8z+qc3N47WlYr
	AbepOdIySI0vTtG6dAT9jDt3o//OQIq+NO1l6EZxBz1TDPMIrU9tw9fJ40pWa2R8juKK6bax6iZoL
	5ji4B7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtCZ-00000009nKH-2AEZ;
	Mon, 03 Nov 2025 11:58:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtCW-00000009nJi-0SIO;
	Mon, 03 Nov 2025 11:58:21 +0000
X-UUID: 5fef663eb8ac11f0a52f393f94899d25-20251103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RHKonKHpuu8h2tauK0dzekelgQBO2YV089GcLoFAdyw=;
	b=EY6UN7uPF+IpU25XwBchGixP4+bKlnnbw3CuiPi6iIXX8FjovB0TOv0xNatm3AKr1F1eUXM5ia7k5cbgeqEW4a36SpNjbml/fy8gP+S8AtgiQU/1PUnr95KChjH3HvAta6JDU9kgW3H7SYOL1hETgSI9rKygRHjSZP/L90mQWyQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:06055afa-e246-4c23-8749-2790494be268,IP:0,UR
	L:25,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:b4c2fb6a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:1,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5fef663eb8ac11f0a52f393f94899d25-20251103
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 27042865; Mon, 03 Nov 2025 04:58:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 3 Nov 2025 19:58:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 3 Nov 2025 19:58:12 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
	<conor.dooley@microchip.com>, <chu.stanley@gmail.com>,
	<chun-hung.wu@mediatek.com>, <peter.wang@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v1] dt-bindings: phy: mediatek,ufs-phy: Update maintainer information in mediatek,ufs-phy.yaml
Date: Mon, 3 Nov 2025 19:57:36 +0800
Message-ID: <20251103115808.3771214-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035820_182858_26CAF15C 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Peter Wang <peter.wang@mediatek.com>

Replace Stanley Chu with me and Chaotian in the maintainers field,
since his email address is no longer active.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
index 3e62b5d4da61..6e2edd43fc2a 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
@@ -8,8 +8,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: MediaTek Universal Flash Storage (UFS) M-PHY
 
 maintainers:
-  - Stanley Chu <stanley.chu@mediatek.com>
   - Chunfeng Yun <chunfeng.yun@mediatek.com>
+  - Peter Wang <peter.wang@mediatek.com>
+  - Chaotian Jing <chaotian.jing@mediatek.com>
 
 description: |
   UFS M-PHY nodes are defined to describe on-chip UFS M-PHY hardware macro.
-- 
2.45.2


