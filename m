Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E220D0BB7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJpQaYRYOFoOBzvOr5AFD9WL6zha/mkCFXA5uGrTyhw=; b=Jpfp0UlAQo8TRkDpf1GhaQ+CQG
	Gd5JzYRqpr40DJMSl6UFoKMNEKoONvR5IgrZI7uOUX6R801h9tTHwZPwirmI14EVI9zjZxOz6QdIM
	q3zahyUPHUdtMW7fSIu1GVPSx0KfmN9i5i9I3zo5HZy/7I+4Pe2KeRpJLvFu4G9W/tLkVwt365jDq
	sj4EWh1DLWq9XHmlXWRt2opjS+j2tSQ77NcHECu9YTjM8G32wERiyeKyb8lqDuZR8Uzqdiseiffr6
	JiMK1Tl8Kk8sD3LsFEPmqAMRniXsiyqokxBY5EqlNXMeM1xHaKAmzf8f5QL+ejqWviwXh22yh2rU5
	gT0T+YrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u9D-0000000HSpR-32sq;
	Thu, 24 Oct 2024 09:28:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u7B-0000000HS4v-2mIN;
	Thu, 24 Oct 2024 09:26:47 +0000
X-UUID: 12abe10291ea11ef82ff63e91e7eb18c-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pJpQaYRYOFoOBzvOr5AFD9WL6zha/mkCFXA5uGrTyhw=;
	b=IVynVBW5NdsfSxn2yTMYtlzn0bADSgpKTrEv7zhKMq244qTYP7e2/aBQttBbyUkzHc6nF2mtp1rq2iRJ7Xl5+1IOpRL3fiSAz3Ve08vNJ/VzrJEmqGJanLOOYXlEuUeec/uROdfLedz/gVWe+pnzWYDzvk3Zu/9bGj577z8DAjw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5f451941-c5a5-47e5-81c6-85ba70a94355,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:b0fcdc3,CLOUDID:409fc441-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3|8,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 12abe10291ea11ef82ff63e91e7eb18c-20241024
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 551122401; Thu, 24 Oct 2024 02:26:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 17:26:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 17:26:36 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH 0/3] Add MediaTek APU Mailbox Support For MT8196
Date: Thu, 24 Oct 2024 17:25:42 +0800
Message-ID: <20241024092608.431581-1-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_022645_748612_9067385D 
X-CRM114-Status: GOOD (  13.98  )
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

Based on tag: next-20241021, linux-next/master

Hello,

This patch series introduces support for the MediaTek APU (AI Processing Unit) mailbox, a crucial component for facilitating communication between the APU and other system processors within MediaTek platforms. The APU subsystem relies on a message-passing mechanism built atop the mailbox infrastructure, necessitating enhancements to the existing mailbox framework to accommodate the APU's communication requirements.

The series begins by adding the necessary device tree bindings for the APU mailbox, followed by an enhancement to the mailbox framework allowing for bottom-half processing of received data. This is particularly important for the APU's operation, as it relies on a combination of mailbox messages and shared memory for data exchange. Finally, we introduce the MediaTek APU mailbox driver itself, which implements the communication protocol and exposes additional hardware features for broader system integration.

Patch Summary:
1. dt-bindings: mailbox: mediatek: Add apu-mailbox document
   - Introduces the device tree bindings necessary for describing the APU mailbox in device tree sources, enabling the kernel to correctly configure and utilize this component.

2. mailbox: add support for bottom half received data
   - Enhances the mailbox framework to support sleepable contexts in the processing of received messages. This is critical for APU communication, where message handling may require operations that cannot be performed in atomic contexts.

3. mailbox: mediatek: Add mtk-apu-mailbox driver
   - Adds the driver for the MediaTek APU mailbox, facilitating communication with the APU microprocessor and providing interfaces for other system components to interact with the APU through spare registers.

This work is a step towards fully integrating MediaTek's APU capabilities with the Linux kernel, enhancing support for AI features on MediaTek platforms.

Please review and provide feedback.

Best regards

Karl Li (3):
  dt-bindings: mailbox: mediatek: Add apu-mailbox document
  mailbox: add support for bottom half received data
  mailbox: mediatek: Add mtk-apu-mailbox driver

 .../mailbox/mediatek,apu-mailbox.yaml         |  55 +++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox.c                     |  16 ++
 drivers/mailbox/mtk-apu-mailbox.c             | 222 ++++++++++++++++++
 include/linux/mailbox/mtk-apu-mailbox.h       |  20 ++
 include/linux/mailbox_client.h                |   2 +
 include/linux/mailbox_controller.h            |   1 +
 8 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
 create mode 100644 drivers/mailbox/mtk-apu-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-apu-mailbox.h

-- 
2.18.0


