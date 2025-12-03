Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C435D1268C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPYfASO2JEwDfZ2TFadZRQFA8PMGaUrnYLkRlqeqMwc=; b=w+e9l2fUyo3dPgWS+EvEwwZ75j
	VceFyx0EJSXZIcxWnaKxGclLROnkoQ3LdlP78djew6c83fewH+XvaKno4ksB+ZrR8kF+cusLJEj5q
	hyDpn/K32cFgGSv7Sc+T4/QBY6LgevuXLYQOpch9KrYbXHj2nYZ3jcaGeMdJBkgfZtVki/h/Q36B1
	vNcnukj6V/PsXejnw1ZmEKYRrmyerh1EdlwBUKKthy/BoSZpAS23qSfu+M6s94fevVh/fr08tI7wK
	HaZCc489wbm2c7njb16sZBwmysoQE680qC8N+0XA2q1v5ni62zJTYqZbHm3a4H4hMo+nWw9Ac+Fq6
	RrxNO1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbmP-000000060Ed-20sf;
	Wed, 03 Dec 2025 01:35:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbmM-000000060Dl-08uY;
	Wed, 03 Dec 2025 01:35:39 +0000
X-UUID: 5995ed1ecfe811f09f706fa2197c6ceb-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HPYfASO2JEwDfZ2TFadZRQFA8PMGaUrnYLkRlqeqMwc=;
	b=THhyfwgbvu5GyaRqJ9NlwLUwgr8u/j/Aets8s+3VnCa5cTKBRN2hrNPAwOH66L9biCvfgHHOPuEreYCtyqhkwo4YK5AH+GU4dQc8HlAo+39HYqF3Ov5IbNQynNLQSaTmvIqSCK7sQHHj4pVFGH/8lJMeDGpOkB79IBK+IjzhdRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:122df503-3768-44a4-aceb-9acf50f8323b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:acb05502-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102|817|836|888|898,TC:-5,Content
	:-10|-8|-5|14|50,EDM:-3,IP:nil,URL:0,File:130,RT:-1,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5995ed1ecfe811f09f706fa2197c6ceb-20251202
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mingjin.ge@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 309337502; Tue, 02 Dec 2025 18:35:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 3 Dec 2025 09:35:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 3 Dec 2025 09:35:25 +0800
From: Mingjin Ge <mingjin.ge@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Mingjin Ge <mingjin.ge@mediatek.com>
Subject: [PATCH 0/1] add support remote wakeup of mt8189
Date: Wed, 3 Dec 2025 09:34:49 +0800
Message-ID: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_173538_082319_74C3BE2C 
X-CRM114-Status: UNSURE (   9.20  )
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

> This series is based on linux-next, tag: next-20251201.
> 
> Changes in v1:
> There are five USB controllers on mt8189,
> each controller's wakeup control is the same.
> Add a new specific version for them.

Mingjin Ge (1):
  usb: mtk-xhci: add support remote wakeup of mt8189

 drivers/usb/host/xhci-mtk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.45.2


