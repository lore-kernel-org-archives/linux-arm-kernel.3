Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF4DD0C5E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BT/Ng943C81aesy7n0Su3FETLClPbDgwCaBp/DvtzrA=; b=1EVMFgWjp+mQkW4lZtl4oFrcFg
	jQdLEhEIhST0TDsKBvrBkxWBIMlv+KkuMqJFlmMcQcquubnn5vOF4Tx7f7uk2OkC5Vj2o9Rux506K
	992LKaxZyWk082RkypJ3RCpITMWJ8fA1dHSkrf8Vng8DTONKcqhULMmxgvMfFhyitSZaM8MC4haea
	IXg2ZaxV3Knklp+NLQT74Lj7U3Aw6CNqV+7NskHPQnLg04ckZ+Kvdh5eLvjI4lB8417xOgyffgLxR
	rnWxaXMtvXuIio4FZCcf+OJOhd0EcTdBME/+HCdq3nSp1NON4W+tF1n6LVay5CwY+Yq5rLTuxD/Nf
	MTeA3IhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FpG-000000030Gq-1M54;
	Fri, 25 Oct 2024 08:37:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Fjd-00000002zEg-12bG;
	Fri, 25 Oct 2024 08:31:54 +0000
X-UUID: 9366e94292ab11ef9048ed6ed365623b-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BT/Ng943C81aesy7n0Su3FETLClPbDgwCaBp/DvtzrA=;
	b=d7+KrT+YQLkZHKtWDIIjKRc/Wl3dZ6/Q8HhhYnmaDvKuKuAoFvopb0i6UPLdjVJDIIcQ7cFXiCfoAJvqfh2Kk/E3eADWzCTS6FeZdRL3+cnVRLR0kN3EumINBstlFGXBvtEkHIOw/ASrvakkRpiTDzvaV3RRHMQZAgtiwYUKsHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f20ef7d4-3bbf-4f2a-87aa-4df81022319f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:5260dacc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9366e94292ab11ef9048ed6ed365623b-20241025
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1031934843; Fri, 25 Oct 2024 01:31:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 16:31:44 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 16:31:43 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
	<dmitry.osipenko@collabora.com>, <msp@baylibre.com>,
	<rex-bc.chen@mediatek.com>, <granquet@baylibre.com>, <peng.liu@mediatek.com>,
	<jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
	<liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] Adjust YCbCr422/bandwidth/training for DP
Date: Fri, 25 Oct 2024 16:28:26 +0800
Message-ID: <20241025083036.8829-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.394300-8.000000
X-TMASE-MatchedRID: gUuz9Ogq75WqO+wHLkIcO7E3FpMbg63SWDdWpJMntKiPaLJ/Ca3STzku
	TGiiLo1Yx91bb4/YjfE5bsAcOzEG6DK42JVSvu3ARAvohSJUpI++1Vx7rDn4r7v408/GP5HqqcN
	xd5hReGHi8zVgXoAltoAy6p60ZV62JW+71yEen6Zq8/xv2Um1avoLR4+zsDTtgUicvJ4MChkqZu
	nyleO9cPKITgppfSr0LQnK66f9ldiohItm7Yy7y/cqHKzCJIUv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.394300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F32734434536A121CD0B2F2009F6141F52AC7822B31BBEF4922DAF5077C969E42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_013153_325377_C56E764D 
X-CRM114-Status: UNSURE (   7.64  )
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

The change in mode filtering bandwidth calculation method must rely on
DP training at the beginning, and get the current train info to calculate
the bandwidth.

Color format support capability must also rely on DP training time to
get the most reliable link capability and choose which color format to use.

Fixed YCbCr422 problem and bandwidth calculation from color format are
both in the color format category, so they are bound.

In summary, YCbCr 422 and mode valid must rely on DP training timing,
so they are strongly bound.

Liankun Yang (3):
  drm/mediatek: Fix YCbCr422 color format issue for DP
  drm/mediatek: Fix mode valid issue for dp
  drm/mediatek: Adjust bandwidth limit for DP

 drivers/gpu/drm/mediatek/mtk_dp.c | 78 ++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 33 deletions(-)

-- 
2.45.2


