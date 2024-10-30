Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3FED74955
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ayZ15KMuy8YT+MalqR6y/T6iKNCjhQrVgR1kRLPQd8c=; b=ER4bcKvvHcglAxnB5QIL10s+R6
	bcJ/Z2w8kj35O2RLhfX8BaQ5p3Ew8ubiGSZ5QNoBX1/HppxFZ16I71ucmxwSDmfXx1KwkpF47wdW0
	UJuZrKHZiRUXZ1dq+QeUosGxL8rM8W8xNUvhJ50+iwW+XdfZcSf1HAu0sUpAb8HUboFxDOMugIrKH
	6GZi0ORy9rfvUeDfHRiJ7NpPPkLrvJZRcYDyabQVH1EskVSwo3RmF1Rhh36VhB+y1CquEllCn95YB
	joGT3xlQCcGoQzG8iXATrm7epMCx/9yCJrSHGtZGK2FW2Pht5LO65nbcfZ+HZ0FBEWRgcU3NTyp3c
	QsKBYR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xfx-0000000GQxr-1Szs;
	Wed, 30 Oct 2024 01:39:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xeJ-0000000GQnl-30qW;
	Wed, 30 Oct 2024 01:37:28 +0000
X-UUID: 83027e6a965f11ef82ff63e91e7eb18c-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ayZ15KMuy8YT+MalqR6y/T6iKNCjhQrVgR1kRLPQd8c=;
	b=hu+QhaOMh3IrLFvqwZd/WEKxQXvaXr35Q6m6glSUKLb8MU7+YwppaOrtOtu4bu77qjYEXHKM35HhCjdgDq+mfplwXiJFN7OocYsuGrRT4moiMukxDMVblVD97LLqwYnz2SnfodyqcahZJn7KXaK1FwyHG1LUl8K0kpc5aDBLR28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:43822764-7bbe-461b-9c05-62db18d8433a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:d67642e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 83027e6a965f11ef82ff63e91e7eb18c-20241029
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1705292847; Tue, 29 Oct 2024 18:37:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 09:37:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 09:37:20 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Karl Li <Karl.Li@mediatek.com>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chien-chih.tseng@mediatek.com>, <andy.teng@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 0/1] Add MediaTek APU SMC call Definition
Date: Wed, 30 Oct 2024 09:35:27 +0800
Message-ID: <20241030013533.855696-1-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_183727_797098_42D98763 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Karl Li <karl.li@mediatek.com>

Based on tag: next-20241029, linux-next/master

Hello,

This patch introduces the SMC calls for MediaTek APU.

The start and stop sequences of the APU microprocessor are managed within the ARM Trusted Firmware (ATF), which requires a secure and reliable communication channel to issue commands from the non-secure world. This patch adds the necessary infrastructure to issue these SMC calls, ensuring that the APU can be securely managed by the system's software.

Please review and provide feedback.

Best regards

---

Changes in v2:

- Move header file to include/linux/firmware/mediatek/
- Rename header file name to mtk-apu.h
- Update define macro name to __MEDIATEK

Karl Li (1):
  soc: mediatek: Add command for APU SMC call

 include/linux/firmware/mediatek/mtk-apu.h | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/firmware/mediatek/mtk-apu.h

-- 
2.18.0


