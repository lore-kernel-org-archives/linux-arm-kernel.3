Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F57CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTU6KsNp/+TiTs2Aeqfmf3gR4n/zV/REoxgn6Z0vMHQ=; b=tmUeYhEeLp2rrhcgL7Rjk1DlW3
	tEyWo6CbYRI4WcUDd/vDYRPtybe+JU7MbIQKUuCWhCJDhhZTyzf5hnIidVE0wFuad1k16CiiEPeRo
	GUNX2d4Z61hcbg3be1Po+1/nhOAWr38cztj1sJQAynGz7a1iNJHeUhcT4oJR3dYAw+6ByEqmEdhSx
	UjOSOaRfyfai+51E22sjLMb2DK2eaTSkZRUwZzzLXIiai6iXuHTf4hFvJbHoyEkiL2jHeDkOwVuG+
	f2Q+YUjfVXrdyYMnZXUE/5RoYE2SO0UAxycVC/n69QrWQ6WCL6En8oQYtfBmhuBumxXNwUFj9TmPn
	bG6W6Sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEo7C-000000064EE-2c1b;
	Fri, 31 Oct 2025 12:20:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEo79-000000064DU-1EYE;
	Fri, 31 Oct 2025 12:20:20 +0000
X-UUID: f36cc0ceb65311f0a52f393f94899d25-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gTU6KsNp/+TiTs2Aeqfmf3gR4n/zV/REoxgn6Z0vMHQ=;
	b=oDuaB826EyfzqnTwMZDMimyB0TJ7Fxf8dRoZiDJMKWqOwKMQkltpr/7iPPqINpfaUvMob/k69eH/1b+ypGzXnT1IW47glToQWELb+ltUzOAFdZi+Bk0JUXfOenw8MrAyeKy/d2UasIOEOyMFM1zc0UJc+KcgOs25WH9iwrOPjW0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3f4d47bd-0b45-470a-8b50-ec02f9e0f15c,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:45abfddf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f36cc0ceb65311f0a52f393f94899d25-20251031
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1864515970; Fri, 31 Oct 2025 05:20:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 20:20:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 20:20:09 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
	<michael@walle.cc>, <conor.dooley@microchip.com>, <chu.stanley@gmail.com>,
	<chun-hung.wu@mediatek.com>, <peter.wang@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1] dt-bindings: ufs: mediatek,ufs: Update maintainer information in mediatek,ufs.yaml
Date: Fri, 31 Oct 2025 20:19:12 +0800
Message-ID: <20251031122008.1517549-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_052019_342204_E0F9E7FD 
X-CRM114-Status: UNSURE (   8.82  )
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
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 1dec54fb00f3..15c347f5e660 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek Universal Flash Storage (UFS) Controller
 
 maintainers:
-  - Stanley Chu <stanley.chu@mediatek.com>
+  - Peter Wang <peter.wang@mediatek.com>
+  - Chaotian Jing <chaotian.jing@mediatek.com>
 
 properties:
   compatible:
-- 
2.45.2


