Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C0C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZpwCqyal2yZ/D/V87pj7HXtLXlEnZX3Z27GM43nCTs=; b=5BxrlUpxQetBdG3f1gVQYP6LC5
	FhC/M9UPVQF6olEWV+hIWiAp+t82DHe1D/DSA1UMPrMRht/BB083l0Dgx7orzU9EoDjPks6toc1N2
	5zCmnyCEN74l6Urv3mqzML++gtzNKICEMjmU758I2BfuU+ADB3JGxmZW3sRWI7BA2lvHzjc9Ugwh9
	AGJa0aVkyVOleTfRhA0/6XSqdM30aFd8u5qL0wMpOvG29cx+N0bOR+Gjeu6GB6tWTtKocowEjUOze
	mvFQSMGWh/Z8irEGxfsPbGHTiEzZQyJDFqRgTEh4NsbwRhC+z5kJu31nDg43mMgqJ3JCe9GuEDPvM
	0PGLwE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu61F-00000001mJv-1wyw;
	Mon, 17 Mar 2025 08:40:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5zY-00000001ltx-16av;
	Mon, 17 Mar 2025 08:38:37 +0000
X-UUID: 33566200030b11f0a1e849db4cc18d44-20250317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vZpwCqyal2yZ/D/V87pj7HXtLXlEnZX3Z27GM43nCTs=;
	b=JG/M7x/wqa9JqK0MO7G1EOj9iBmPBhCWnrd2HN4x033E2lqzRf0ovGkp7HM5aZRGjQs/8VaI+QisG7aEu3QDariIumsPlIRv8IFriKSWFiSgIhXPmFPAM4RaAzNXUMwjDQQCECMGu8+9HSgVBnGI7VSpYXXgLRhtXWp50tNIoUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f5189685-1c92-4b07-85c8-dde573646841,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:600a788c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33566200030b11f0a1e849db4cc18d44-20250317
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086121830; Mon, 17 Mar 2025 01:38:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 17 Mar 2025 16:38:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 17 Mar 2025 16:38:25 +0800
From: Jjian Zhou <jjian.zhou@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Jjian Zhou <jjian.zhou@mediatek.com>
Subject: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
Date: Mon, 17 Mar 2025 16:38:06 +0800
Message-ID: <20250317083822.891-1-jjian.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_013836_306425_784A9C2B 
X-CRM114-Status: GOOD (  12.06  )
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

The VCP mailbox has 5 groups. Each group has corresponding interrupts,
registers, and 64 slots (each slot is 4 bytes). Since different features
share one of the mailbox groups, the VCP mailbox needs to establish a
send table and a receive table. The send table is used to record the
feature ID, mailbox ID, and the number of slots occupied. The receive table
is used to record the feature ID, mailbox ID, the number of slots occupied,
and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c calculates
the slot offset and pin index for each feature ID based on the mailbox ID and
slot number in the send and receive tables (several slots form a pin, and
each pin can trigger an interrupt). These descriptions are written in the
mtk-vcp-ipc.c file -- we call it the IPC layer.

We have two questions:
How should we describe the mailbox and IPI?
Can the intermediate IPC layer be rewritten as a virtual mailbox layer?

Example of send and recve table:
Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin_index |  notes
send          0          0       18          18           0          0
recv          0          1       18          18          18          9
send          1         15        8           8           0          0
send          1         16       18          18           8          4
send          1          9        2           2          26         13
recv          1         15        8           8          28         14       ack of send ipi_id=15
recv          1         17       18          18          36         18
recv          1         10        2           2          54         27       ack of send ipi_id=2
send          2         11       18          18           0          0
send          2          2        2           2          18          9
send          2          3        3           4          20         10
send          2         32        2           2          24         12
recv          2         12       18          18          26         13
recv          2          5        1           2          44         22
recv          2          2        1           2          46         23

Recv ipi_id=2 is the ack of send ipi_id=2(The ipi_id=15 is the same.)

Jjian Zhou (3):
  mailbox: mediatek: Add mtk-vcp-mailbox driver
  firmware: mediatek: Add vcp ipc protocol interface
  dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document

 .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++++++++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
 include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
 include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
 9 files changed, 915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
 create mode 100644 drivers/firmware/mtk-vcp-ipc.c
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

-- 
2.45.2


