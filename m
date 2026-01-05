Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C45C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 02:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLcEgivO67/cJ6mzNXBkswo7rrMtv/QRBM7nPIN2wA4=; b=oMTiIgNa+Hq8rLonMRJgwi3sCv
	uYlfFn7c5cEm1w7ZSudopJFBBpQIB8KMOIla02JqVLYrq7SfS9sjmXp+QlaPIMo29Hh/D0fM57NUP
	a/AupNncclKFD9fJYy+Y0hYat4wJBdK7hnW0JexqcLnHRv1GITtniu5sZGasnDre/EkN5nz/otfj4
	fRTkDhToZMevPSEMnCvH/dT9yHBTLCdYzaZ4TiJgAALQd2TN3N9TR1NA8ak8j1eLfNnxuUt/OVSuy
	1Q04G4kaPu7afxLZHprI7IM8baEyMtDUXxsRV+iX5VO0JtDzHIYZE/QZUIQzWtb7D9OvshkUS6Yjo
	/EJd1Fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaX0-0000000Ae4H-1139;
	Mon, 05 Jan 2026 02:41:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaWw-0000000Ae3J-3QSa;
	Mon, 05 Jan 2026 02:41:15 +0000
X-UUID: fcb5592ee9df11f08b17dd397dc63300-20260104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iLcEgivO67/cJ6mzNXBkswo7rrMtv/QRBM7nPIN2wA4=;
	b=AQpmvQGzeI44nlr2k5HYjnbwxhKNG7Qh0DVKCLaDy4Y8760Oo2a2kAPb8KLrZ29X1ST97NPxRE0fmAQhM1Qw0Cj74n3P18cbJuddRwpBnkSpS88FcGRmj5lKhEC4AFsCijUmkKo/kE5bKc8HOMfoOBc8eA/dU+kONyEaHhYiNWk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:07dcf8ef-ad15-4385-8ad4-d77117958fd8,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5047765,CLOUDID:4e6f7803-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fcb5592ee9df11f08b17dd397dc63300-20260104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 864741002; Sun, 04 Jan 2026 19:41:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:41:05 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 5 Jan 2026 10:41:05 +0800
Received: by mediatek.com (Postfix, from userid 10007317)
	id 05CC1200CD; Mon,  5 Jan 2026 10:41:05 +0800 (CST)
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <jirislaby@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <zhiyong.tao@mediatek.com>,
	<fred2599@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Digits_Upstream_Group@mediatek.com>,
	<liguo.zhang@mediatek.com>, <Vasanth.Reddy@mediatek.com>
Subject: [PATCH 0/1] Mediatek uart patch 
Date: Mon, 5 Jan 2026 10:39:54 +0800
Message-ID: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_184114_916545_1D10FFB5 
X-CRM114-Status: UNSURE (   6.27  )
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

This series includes 1 patch:
Add ACPI support on 8250_mtk driver

Zhiyong.Tao (1):
  MEDIATEK: serial: 8250_mtk: Add ACPI support

 drivers/tty/serial/8250/8250_mtk.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

--
2.45.2


