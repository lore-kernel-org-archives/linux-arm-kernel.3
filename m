Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980BBC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbT7/cMJ6b0IwK66Kd6AS83TnC0ha8OJJhp7htsNqC4=; b=bdZTa0WZLv8/YVu4m/ea75E/3B
	P0y/8j5TcfTmqFS8lR4ikeBmZ87Fza4qrLxBF3i/W/nrsKyKzagT1gn/8OpfKBOCpuyH8subH+29t
	U6QK798MA/zLnMP7xRh7nBM9nkElXoZVFQO45UgBTQgLF7HYbknvhB4Qb8hZciTInTQoTH6JgB2Ca
	mfb+uVgV7WEQMSewpRp3Wf+Zw0ci/QQ1lGBPyuO+GCR7vOiuPcp60DMskk7webrwYhSxgGcfVqoIb
	H+wAyaJ0NYNYLvPAyVbnVJms9YI6Ks9PE5QygKmB6xv0c79tGBan1SxtddFzx+z2jbjUfWkaYyAi/
	FNy8WMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbWIS-0000000FvpR-4Brk;
	Sat, 25 Jan 2025 02:53:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbWH8-0000000Fvge-0XnX;
	Sat, 25 Jan 2025 02:51:59 +0000
X-UUID: 546cdbcadac711ef82ff63e91e7eb18c-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bbT7/cMJ6b0IwK66Kd6AS83TnC0ha8OJJhp7htsNqC4=;
	b=oEni+9xBi+xt0RmznEpKGz3mSIeh1IMCEfS2p7I60n1fN8Nt+NHIV4rRtCdVvCcKsocyTNTrGJjOz7F3ahIaxNh5YRbRMMCpOdQtFNL7DWSqQ1MWuDYP4Lzd6X1AOEQVCVLtxNMjbAFg+a5pFFBCO9Ewwk+L1oKhWWyt57L9J2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:49242dea-69dd-4523-9c19-c47240c8c026,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:601eaa3d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 546cdbcadac711ef82ff63e91e7eb18c-20250124
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1590534204; Fri, 24 Jan 2025 19:51:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 25 Jan 2025 10:51:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 25 Jan 2025 10:51:48 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <seann.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Hao
 Chang" <ot_chhao.chang@mediatek.com>
Subject: [RESEND v3 0/2]
Date: Sat, 25 Jan 2025 10:51:21 +0800
Message-ID: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_185158_182592_69ADFD3D 
X-CRM114-Status: UNSURE (   6.46  )
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

Change in v3:
1)Add error handling to prevent memory leaks 2)Move the eint pin assignment action to eint for processing
---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1] to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---

Hao Chang (2):
  pinctrl: mediatek: update EINT base retrieval method
  pinctrl: mediatek: adapt to multi-base design

 drivers/pinctrl/mediatek/mtk-eint.c           | 38 +++++++++-----
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 50 +++++++++++++------
 2 files changed, 60 insertions(+), 28 deletions(-)

-- 
2.46.0


