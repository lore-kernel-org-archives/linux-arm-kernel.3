Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7151C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8ULTO9RcU8KETwiMOBzfaheYWRJeLf8x+TFxOvGL1c=; b=sr9cOk9IPYfohveO7INNs2hlco
	e5wQImMUYKwgauJwEuAq4dVaxPRJV2keSps6w1SKUM9Lgp3D9MsRcOvRFEN+LuP4mcNVbvureamaE
	KUFkeQUeSG7CYwSB5RCRjmT/WpasLk3isM4mW91v09HCMlYZVlODzUDqE3IyoBVuc3bebDk5IbX6s
	HnRP2kf7YFE12nIk+qFadrcNERa6wIzyqXICsFAp0aOJGztQR8wIajGxKupfmms6m+lVe1OEwKrRY
	6qvXbv4mSWqL5EuaH5A8QCAPhV3I1ypRNoINOmwmoXpN7FIenuJBndWTwnhC48rLRyOAqd4vd9bqF
	9zr81DgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjw1-000000056lN-3Ec7;
	Fri, 01 Aug 2025 07:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjtP-000000056Fq-0mtt;
	Fri, 01 Aug 2025 07:09:28 +0000
X-UUID: 712ed3c66ea611f09eb0dd999d3936bf-20250801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=c8ULTO9RcU8KETwiMOBzfaheYWRJeLf8x+TFxOvGL1c=;
	b=XZD1SFxU9baAbs4qMapA0/0GhP8rDrS2YoTAdARN3IG4QmvnNSUfLRSduf7bXiQW3CUh5wTgprpM5AWnesjQj4dgVxHhIJkf5qiEv+8S7Q91kMVbrFNChdd1340MNFm2T/CtNyW8yhmqY7BSWOLvwpHHmH8IHoUFW6zBLfy9fCs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f7325955-bdb1-4d66-9e83-4dc9fe57fd05,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:14577f9a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:-7|-6|0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,USB|NGT
X-CID-BAS: 2,USB|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 712ed3c66ea611f09eb0dd999d3936bf-20250801
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711311162; Fri, 01 Aug 2025 00:09:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 1 Aug 2025 15:09:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 1 Aug 2025 15:09:14 +0800
From: niklaus.liu <niklaus.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, niklaus.liu
	<niklaus.liu@mediatek.com>
Subject: 
Date: Fri, 1 Aug 2025 14:39:34 +0800
Message-ID: <20250801070913.3109-1-niklaus.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_000927_226329_10035335 
X-CRM114-Status: UNSURE (   8.45  )
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

Subject: [MT8189] Pwrap/SPMI/regulator driver

Add support for MT8188 Pwrap,SPMI driver,add dt-bindings description related.
modify mt6315 regulator buck function.

niklaus.liu (3):
  dt-bindings: mediatek : add binding for pwrap,spmi
  soc:mediatek  mt8189: Porting driver for spmi/pwrap
  regulator: Modify mt6315 regulator mode mask

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  1 +
 drivers/regulator/mt6315-regulator.c          |  6 +++++
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 27 +++++++++++++++++++
 drivers/spmi/spmi-mtk-pmif.c                  |  3 +++
 5 files changed, 38 insertions(+)

-- 
2.46.0


