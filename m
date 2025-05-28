Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1291FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UIPzmvmserW3V83wIIJ6pIfzB+Tlkfw7bJvzEN1FiIM=; b=f4nMpIR+FrGjYJSEaHt2o0FnPV
	UBOud6RZZYZRlQ3rdP7ozJYCBEsqS/QZlC6JhUNrJVxh9ZexHcv42c6UHPiboh8yb4OkLpeRfcQR1
	y1U8D+bQEjjzaIP12anCXY5GOlhiam1phpaAodMnspnfRxSgY9rASvqTtfh9RDq4+j0o4GRsxq0i/
	quzVx3tJElW1PziqcssdGIyXnpC7FNmI6O4qwU6eZ2kricWlsruFg4T2+Zvv72Op6sfBMf3aHU/xX
	p/HMFWMuHLHtgs6/VprC7YsCo5Yvo198jfgjSxjTjrFLCmx3Sz1pG1jeHVn0lImgeB9q4MvJsOxXe
	DB0JtpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDpE-0000000Cp0T-08TA;
	Wed, 28 May 2025 10:15:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDYZ-0000000Cmdg-3Gfz;
	Wed, 28 May 2025 09:58:45 +0000
X-UUID: 53c44bb03baa11f08d385d50fb11b32d-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UIPzmvmserW3V83wIIJ6pIfzB+Tlkfw7bJvzEN1FiIM=;
	b=Bk3+5v7wLwVtuBV2aEcFIEkwHUEWfmWdHR5dOIpGmGwpMjyRAevgqwY+P2AOLqsewMbGW3iaAp/bF3++Dm46ap3W2IgquIzc9YePLZzLPNdfkCTtEJS2fJAqjvvSI2aTMB9BXXl8ORX0uSb1Kp8T3VaYqatnjHdDOHyd8aRBgVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f3ba60e0-c903-48b2-8261-3dedae6f5897,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:db8d1158-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 53c44bb03baa11f08d385d50fb11b32d-20250528
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1397772655; Wed, 28 May 2025 02:58:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 17:58:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 17:58:34 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 0/2] Add MT8189 jpeg encoder and decoder compatible
Date: Wed, 28 May 2025 17:57:46 +0800
Message-ID: <20250528095748.17485-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_025843_827645_A7FEA9EA 
X-CRM114-Status: UNSURE (   7.57  )
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

This series is based on tag: next-20250528, linux-next/master

jianhua.lin (2):
  dt-bindings: media: mediatek-jpeg-encoder: Add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-decoder: Add MT8189 compatible
    string

 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 2 files changed, 2 insertions(+)

-- 
2.46.0


