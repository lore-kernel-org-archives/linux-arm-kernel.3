Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u96Mek6muR+FMOL8ghgPTboq8EkCtrWjhvHihSR4wYY=; b=lNoBxBr/ebj7fWnbHFKmKb9d2R
	1Y+ycLuaeNBv77l6YkCqU5wET7heFCw2zLlpfdk7CtZqWVubU4nCmGh9dk/hrOgTB/qflnmpdv8l8
	H+d3+7WB1DfphjNPcTjmclVPOWNVDcyklTj8oJt7D+lN4v5+CdIFyqvF5JyXsFgoiSMKcUBZNuCU+
	x2UgvqVYHFhafXQYZ0+Uk1AztwW8e7qZaBk07svIbcict4bBSqnFrxyDiSgewkyVAeZcRttp523pl
	zsnVK5ypYzugv/Qxcf5fu+IZoowVo/dFC7/Raau6knzuFr+jrhIxRKEc4alFcoVvVWifOUMcQidtP
	4lDqVK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Mg-00000003KWv-1wiK;
	Fri, 13 Dec 2024 09:53:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Jz-00000003Jvz-3XMW;
	Fri, 13 Dec 2024 09:50:57 +0000
X-UUID: bd084f36b93711ef9048ed6ed365623b-20241213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=u96Mek6muR+FMOL8ghgPTboq8EkCtrWjhvHihSR4wYY=;
	b=ZMbuDTuA9w7eNzmBLN8CJRDgIZIpaYXoGzY+iZDBKP/hez7C4CP387eCFZsHqMuKnqrmRDrX5/Jt3uha5f0TLumzhwUVcUu/SPvreSqOJyK+Cnc6p6KMvKROyZtWetkv20lNc0AQezpKBi+Co5f6TMjJcuBZmphgYD7fl2ViH1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1bbdcfb5-5baa-4984-a3a1-1a73fbe17d65,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:247a1513-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bd084f36b93711ef9048ed6ed365623b-20241213
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 817514753; Fri, 13 Dec 2024 02:50:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Dec 2024 17:50:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Dec 2024 17:50:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 0/3] Update MT8188 OVL compatible from MT8183 to MT8195
Date: Fri, 13 Dec 2024 17:50:41 +0800
Message-ID: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.276900-8.000000
X-TMASE-MatchedRID: M8Ani9L88+RuS4qoWRE6OhWCVBr+Ay98gdNXa4lpKNtw8MSVsP4X8s0z
	jHUi+uXRjwQarLbSitQRs1kezRVUMsLk3xw1Sf9eXP5rFAucBUFyETzgIO4sapI7pKjpAaDKwHb
	kJ3CI10bQkGj4hVOCcd52diAVzqN2zrfv4DmGmcWeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGc7OdGs895LlmarI0Rv6SjtqthQRKRKNU0eKDMJf9cV5pk3nTRYPeUGeymZ/d+Z3Ne84j
	zGCUoKRVHB2Mz7feH2a2La8y2eZTnmVKZusLp922v9OjYWA2uMMswg45VMfPadst5iAforfVlxr
	1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.276900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 56412E99850523C5DA6B3BCC1E5FD357930DC2222C597F04EC455D971BE8E4272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_015055_882503_92817813 
X-CRM114-Status: GOOD (  10.58  )
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

This patch series updates the compatible strings for the MediaTek OVL
in the MT8188 dts and the corresponding dt-binding.
The changes ensure that the MT8188 OVL device is correctly identified
and managed by the appropriate drivers.

The 1st patch is resending the reviewed and acked patch from:
- https://lore.kernel.org/all/5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com/
and rebase it to the latest linux-next-20241212.

The 2nd and the 3rd patches are updating the mt8188.dtsi and mt8195.dtsi
according to the 1st patch.

---

Change in v2:
1. Add missing mt8195 compatible in the beginning of compatible property.
2. Add fix patch to mt8195.

---

Hsiao Chien Sung (1):
  dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Jason-JH.Lin (2):
  dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to
    MT8195
  dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL

 .../bindings/display/mediatek/mediatek,ovl.yaml          | 9 ++++-----
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                 | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.43.0


