Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF391C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4BBaoZ4uoulOab2Cr6EQ3iDBn+vLxKq+FxX0x0G4yZE=; b=QirIgj3fYh7jwmRzG2XR30RnU3
	EHkFad7kmQ25gaLYIlM1Ve3IcGgjIc10Xl7pRTz04gtOu8vnIsUzBGfOty/ZOu8hHkAnapYzUpCt+
	1UgLxWDABz3qYtaLbhFrMSiubC0oTs9wWWzbYCuTsM5ogbz02AkmzcBhhVRs8z2B/UI24Nlx0TO/u
	ocJFrpXgdU8cGvqbhukubVLHCEicuCEI9q7pcKzxjn0YvAGGWIRe7pCfZyypPwUY6t/BnFCG3Ve0X
	7j37ruoB4ujo+WjCguoeb9IERvHhReIxV2cQ3uuCdFgo6o47rXOONJ5wxu5rMNg4HX0m0E9eap4jM
	aTLXNhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRHO-00000002RiV-0A73;
	Tue, 29 Sep 2026 06:25:30 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRHK-00000002RhO-2Rct;
	Tue, 29 Sep 2026 06:25:27 +0000
X-UUID: 8c37f1ccbbce11f1acbe4559397dec65-20260928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4BBaoZ4uoulOab2Cr6EQ3iDBn+vLxKq+FxX0x0G4yZE=;
	b=u+sDz2lItx93DHdhddJWmflhLVux1w7e0VWYl38mvTjrLTqlQWdiFFFkU9yI09EjIpPtAD1H+dGl12lyr4WxFoD5dsnla3E7uxBws8/do5eDjm7Q6BbYsD3mYmOWpkWGvj+8YroZD0rJWU83mfWOiLE+VRccqVaypUCxn6I3tuQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:75ed19c0-1ef5-4ec5-a0b7-156e36b18a4c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:f770a858-f207-4360-abb2-8a360f715574,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c37f1ccbbce11f1acbe4559397dec65-20260928
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 626298306; Mon, 28 Sep 2026 23:25:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 29 Sep 2026 14:25:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 29 Sep 2026 14:25:19 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>, Tim Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH v2 1/2] spi: dt-bindings: add SPI IPM v59 compatible for mt7987 and mt7989
Date: Tue, 29 Sep 2026 14:25:15 +0800
Message-ID: <20260929062516.416368-1-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_232526_634013_33C7D391 
X-CRM114-Status: GOOD (  10.20  )
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

MTK mt7987 and mt7989 SPI hardware has been updated to IPM v59 SPI IP and
it differs from earlier IPM designs, most visibly in the tick delay field
of SPI_CMD_REG, so it needs its own fallback compatible rather than reusing
"mediatek,spi-ipm".

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
v2: Add mt7987 and mt7989 real device compatible

 .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8728..d2c740572d85 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -39,6 +39,11 @@ properties:
               - mediatek,mt7988-spi-single
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
+      - items:
+          - enum:
+              - mediatek,mt7987-spi
+              - mediatek,mt7989-spi
+          - const: mediatek,spi-ipm-v59
       - items:
           - enum:
               - mediatek,mt8196-spi

base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
-- 
2.45.2


