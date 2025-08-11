Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F975CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P1bfhK0tMIfmTp+5QuGosThnSwzj5jHg/brpDeboWLI=; b=H8MCZhCpxik7dfkB5mhuSZF4z7
	kJjjjTeACasyXF9Q3p2aeKk3qfEs+cR6+/iR4oQjS6NbkxVYGPnidSvr4hQoiWMY/QditHQ2W7iPW
	A6gSW1WPnMz/+Ujz2yyQ8HqycVIQDi2AmUHumsNCAt2v+kMVEc/ywjXV5LVOM0alltpVX9dB7nyOk
	d74PQqvQWvtQnq2cF5cMRg+81JsoG75NHWlozTzELdWpJkxPzoaObJy0utw1/7gGPuV/QeqY5BJ2K
	MrQtclSvAqaGG7id3IHNVEW797wdfdDqUHTGwyXDMlhIe/wfB5B0u/1Zhx66pdccUuMjyPDL21odC
	lBqVRqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO9g-00000006tfd-2tEw;
	Mon, 11 Aug 2025 08:45:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNhD-00000006p54-436J;
	Mon, 11 Aug 2025 08:15:57 +0000
X-UUID: 648ca750768b11f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P1bfhK0tMIfmTp+5QuGosThnSwzj5jHg/brpDeboWLI=;
	b=YRZLRaVkQxRhMqvXhwmkrj9VbnezfBroWyWP2Lv4iIftzOTzCmGbUIQGDPFxpD/kD0fOxIVUdz0/PiUVUK8U4f3rMGOhhdjG8/awmdZ1pR3zrCFGc/m+2eDrUkpoJjECPmV0xDxJRwj4YVwEWWeG8KICUN3RWmAzRnZ5aF9QPHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:179b35dd-7704-4473-a8d8-085168a0fb04,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:c5134751-d89a-4c27-9e37-f7ccfcbebd5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 648ca750768b11f09f706fa2197c6ceb-20250811
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1921424097; Mon, 11 Aug 2025 01:15:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:15:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:41 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 0/2] rtc: Enhance RTC driver with BBPU bit definitions and shutdown handling
Date: Mon, 11 Aug 2025 16:15:32 +0800
Message-ID: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_011556_025366_6D452D2D 
X-CRM114-Status: UNSURE (   7.27  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

(1) Add new bits definitions for RTC_BBPU register, 
(2) Add new functions to reset the BBPU alarm status in mt6397 RTC driver
(3) Add mtk_rtc_shutdown function to handle RTC shutdown events.

Shunxi Zhang (2):
  mfd: mt6397: Add new bit definitions for RTC_BBPU register
  rtc: mt6397: Add BBPU alarm status reset and shutdown handling

 drivers/rtc/rtc-mt6397.c       | 37 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  3 +++
 2 files changed, 40 insertions(+)

-- 
2.45.2


