Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD68CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tnfcvaksRPKklhkGVZFWEH1eyMy2i0IOXmhjqtvAMyo=; b=RQ5su5PMfnFWMrNt0oyb6dtqbh
	vahEv1jKlrarzQrx9WH+ieQN7tmetvEqY4lWNXRJbt6DQQuo6Rebp8T43GIzD+ug6TUZXgjx1E+re
	07f0NPB50OHxMxs14MBIp141Bq962kvJpCi+q9SaFeVOpOBYD9nmK3wfnYmy1gwQm1ixmXVGAGXQF
	TKP0ezK05TLV1Quw+FiU/tasttdGQqCzMrkfu02wy0eOW6hPF8rRGYJw50RgcKArz1YkuQSS2DnLz
	/rF1Uy2fTy7C4edXRVWUyxWqOj/KCP2T7pzQ/pIooAIbyALNmmSw39OfEBI5xQll6TZD9Ck2GtNKw
	DjESiaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGULu-0000000CxPH-2vAY;
	Wed, 05 Nov 2025 03:38:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGULr-0000000CxO3-2GyB;
	Wed, 05 Nov 2025 03:38:28 +0000
X-UUID: e187d2bab9f811f0a52f393f94899d25-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tnfcvaksRPKklhkGVZFWEH1eyMy2i0IOXmhjqtvAMyo=;
	b=OVG9PyAOLiQi9F19TyjkOk+H+CTWe0cxl88RyEexot0Evf9ecwDJ2M7weAxz5znzPCZZvpUU4pJTOzpbLsjBaHxJfPGyh5e68dwUnLNuffBFYnF/CAYfbx/kW/5xWK62vTdEU23HDrsQV1NzYAkrupu+PB/nYxiJK/uhn02ULPw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0f25fddb-ae67-4301-b3ad-e21abe0729b8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f7e0eb7c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:-7|-6|
	0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e187d2bab9f811f0a52f393f94899d25-20251104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 325739178; Tue, 04 Nov 2025 20:38:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 5 Nov 2025 11:38:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 5 Nov 2025 11:38:20 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>,
	Niklaus Liu <niklaus.liu@mediatek.com>, niklaus.liu
	<Niklaus.Liu@mediatek.com>
Subject: 
Date: Wed, 5 Nov 2025 11:38:02 +0800
Message-ID: <20251105033817.20427-1-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_193827_593177_132E91FF 
X-CRM114-Status: GOOD (  14.77  )
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

Refer to the discussion in the link:
v3: https://patchwork.kernel.org/project/linux-mediatek/patch/20251104071252.12539-2-Niklaus.Liu@mediatek.com/

Subject: [PATCH v4 0/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189

changes in v4:
 - reply comment:
1. MTK hardware requires that vsram_gpu must be higher than vgpu; this rule must be satisfied.

2. When the GPU powers on, the mtcmos driver first calls regulator_enable to turn on vgpu, then calls regulator_enable to 
turn on vsram_gpu. When enabling vgpu, mediatek_regulator_balance_voltage sets the voltages for both vgpu and vsram_gpu. 
However, when enabling vsram_gpu, mediatek_regulator_balance_voltage is also executed, and at this time, the vsram_gpu voltage 
is set to the minimum voltage specified in the DTS, which does not comply with the requirement that vsram_gpu must be higher than vgpu.

3.During suspend, the voltages of vgpu and vsram_gpu should remain unchanged, and when resuming, vgpu and vsram_gpu should be 
restored to their previous voltages. When the vgpu voltage is adjusted, mediatek_regulator_balance_voltage already synchronizes the 
adjustment of vsram_gpu voltage. Therefore, adjusting the vsram_gpu voltage again in mediatek_regulator_balance_voltage is redundant. 


changes in v3:
 - modify for comment[add the new entry by alphabetical order]

changes in v2:
 - change title for patch
 - reply comment: This is a software regulator coupler mechanism, and the regulator-coupled-with
configuration has been added in the MT8189 device tree. This patchaddresses an issue reported by a
Chromebook customer. When the GPU regulator is turned on, mediatek_regulator_balance_voltage already
sets both the GPU and GPU_SRAM voltages at the same time, so there is no need to adjust the GPU_SRAM
voltage again in a second round. Therefore, a return is set for MT8189.
If the user calls mediatek_regulator_balance_voltage again for GPU_SRAM, it may cause abnormal behavior of GPU_SRAM.


changes in v1:
 - mediatek-regulator-coupler mechanism for platform MT8189

*** BLURB HERE ***

Niklaus Liu (1):
  soc: mediatek: mtk-regulator-coupler: Add support for MT8189

 drivers/soc/mediatek/mtk-regulator-coupler.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.46.0


