Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F251DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0dKErEL1skRnp95LZxhIE6KOtuvu+ympj6r/1bWpSA=; b=akyynjBmJturfmJxOzGuf8H6Sm
	N3Ktk+2uy3cHVppJw62frZqyGopmZudZo+v8fTQSMhR1su4M9nNJn3PIeSVctSe2P2p9TY6AMFmLH
	syS+sr7Gy3R6A3Gl+AisuiCmEaYS+8mFkx3DLVHC8PqP8LsQIUyVLtWiVXSb6MW7G4RaSpFPnrzen
	d4jbnaqWsgmBNNw+9L6JzcvDwwer7zfLeNgHMM6W6UwZHcCjlwObUwYZIV3YNc1dWlSKf4uDam6Sk
	AoqRICAH/Mw6J3Q4DrEsUwrTuqJr+pOQVPdXLgriRnLiQN8tJXh/Iuja+74Epz6cT4xCpbSVNlpx1
	iLy1CchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8xU-00000001wdG-0B3B;
	Tue, 22 Jul 2025 09:06:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8om-00000001v5D-2opg;
	Tue, 22 Jul 2025 08:57:49 +0000
X-UUID: ebdfc1b866d911f09f706fa2197c6ceb-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=X0dKErEL1skRnp95LZxhIE6KOtuvu+ympj6r/1bWpSA=;
	b=qdupOaGFq4ZL4PTC3NskoEy6J7MtspTaCh88QJP1nUv9nj+gVFpm/fMNJgi2FeaBdhphjp+QZB18y+FzjMO3S5E5z+7EC3BMmP8NUVwurA0+7cYaZ3yJz3I6zNLjtB6ZvfXFVPYxXsB51BFGYoVR7ULkpTxfa3TKKGR6PvP98uc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b7753c2e-9c46-4685-aded-9ebeb239288b,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5428b584-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebdfc1b866d911f09f706fa2197c6ceb-20250722
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94229067; Tue, 22 Jul 2025 01:57:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:57:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:57:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Peter Wang
	<peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James E . J
 . Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: ufs: mediatek,ufs: add ufs-disable-mcq flag for UFS host
Date: Tue, 22 Jul 2025 16:57:18 +0800
Message-ID: <20250722085721.2062657-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_015748_711081_2486397C 
X-CRM114-Status: GOOD (  11.59  )
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

Add the 'mediatek,ufs-disable-mcq' property to the UFS device-tree
bindings. This flag corresponds to the UFS_MTK_CAP_DISABLE_MCQ host
capability recently introduced in the UFS host driver, allowing it
to disable the Multiple Circular Queue (MCQ) feature when present.
The binding schema has also been updated to resolve DTBS check errors.

Cc: stable@vger.kernel.org
Fixes: 46bd3e31d74b ("scsi: ufs: mediatek: Add UFS_MTK_CAP_DISABLE_MCQ")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 4 ++++
 1 file changed, 4 insertions(+)

Changes for v2:
 - Split new property from the origin patch.
 - Add dependency description. Since the code in ufs-mediatek.c
   has been backport to stable tree. The dt-bindings should be backport
   to the same stable tree as well.

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 32fd535a514a..20f341d25ebc 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -33,6 +33,10 @@ properties:
 
   vcc-supply: true
 
+  mediatek,ufs-disable-mcq:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: The mask to disable MCQ (Multi-Circular Queue) for UFS host.
+
 required:
   - compatible
   - clocks
-- 
2.45.2


