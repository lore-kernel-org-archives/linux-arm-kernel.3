Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F785E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsNIN8cQf/8LrBXZhXmWKQYMiuKK9ftCpSHglr/VApQ=; b=JcivNZRbFfF4lNO2f/Qt8MkwYC
	wN2L3dNgsAa2of5RJos3ulZZEKl1CkSY7RxAShDXRbFEl/PXiBN35iRAhFK4r3Y/NSCRqI7BmPfEd
	eTKj9cV8qKH/vpwAPNiRAK55Mod2wiBvsEv5YBouDf90rISYZjhEvj/qTfbOD12OmnzatJKN1Jy7p
	MpeRFp42o4uD9rS9dkoGFc42BV0CjcNDJLVKLbtF8/tkM2FW+glTBI4k9QgmvEnneonClHIIU5jq1
	H44pDlQRDtvKDVl3jZB94ddlhRxtBNLCqvSdZu0ca4w2FMm6DL15qP9yNP5O8Jy18pNloqJEQBR/Z
	SkFbdedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6kt-00000004Si9-0vNE;
	Mon, 30 Dec 2024 03:47:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6jj-00000004ST2-3nk4;
	Mon, 30 Dec 2024 03:46:36 +0000
X-UUID: a7704df0c66011ef9048ed6ed365623b-20241229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qsNIN8cQf/8LrBXZhXmWKQYMiuKK9ftCpSHglr/VApQ=;
	b=s/9mem8us8DYNxC6tIle+W0hzqYLMNMf/fLwEDlq1Wvcj3iJRRdkLuHOy+zapK/cz7feXdt0OJRK4+e9nLbzsvxnmjjOKqsHYu8A9J3bwg6PrTGGfJYOrF9/rjML+BIG46mQkZ/7x/6/j3uLdPmTvptbgu9ftPGy+eJNvrVU70s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4ef283e3-b3e1-4032-98d6-bf829f51378f,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:60aa074,CLOUDID:4b7a0e19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|801,TC:nil,Content:3|50,EDM:-3,I
	P:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a7704df0c66011ef9048ed6ed365623b-20241229
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 116435952; Sun, 29 Dec 2024 20:46:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 11:46:26 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 11:46:26 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng
	<Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, Chen-Yu
 Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 0/3] Add MediaTek APU Mailbox Support For MT8196
Date: Mon, 30 Dec 2024 11:43:34 +0800
Message-ID: <20241230034446.1195728-1-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_194635_954442_C4A1BE82 
X-CRM114-Status: GOOD (  18.58  )
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

Based on tag: next-20241220, linux-next/master

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

---

Changes in v2
- [1/3]
	- Add APU description in commit message and dt-bindings description.
	- Remove mt8188 in dt-bindings to make this patch focus on mt8196.
	- Drop "apu_mailbox" label since no one reference to it.
	- Modify the rule of compatible property.
	- Add cells number to resolve dt_binding_check error.
- [2/3]
	- Add more description in commit message to describe why we need sleepable callback function.
- [3/3]
	- Use regmap provide spare register operation.
	- Remove global variable `g_mbox`.
	- Add `MTK_APU_MBOX` prefix for each macro define.
	- Only keep mt8196 compatible to make this patch focus on mt8196.
	- Rename mbox_controller to `mbox`.
	- Use mtk_apu_mbox_msg to define msgs in mtk_apu_mailbox.
	- Rename top-half and bottom-half function.
	- Change to pass mbox.chans to isr.
	- Move platform_get_irq before register controller.
	- Remove `remove` callback function.
	- Rename send_cnt to data_cnt, and using u8 instead of int.
	- Use platform data to support the available slots for different platforms.
	- Use memory copy to sync mailbox data.
	- Use outbox irq bits to indicate the received slots number.

---

Karl Li (3):
  dt-bindings: mailbox: mediatek: Add apu-mailbox dt-bindings
  mailbox: add support for bottom half received data
  mailbox: mediatek: Add mtk-apu-mailbox driver

 .../mailbox/mediatek,apu-mailbox.yaml         |  60 ++++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox.c                     |  16 ++
 drivers/mailbox/mtk-apu-mailbox.c             | 202 ++++++++++++++++++
 include/linux/mailbox/mtk-apu-mailbox.h       |  15 ++
 include/linux/mailbox_client.h                |   2 +
 include/linux/mailbox_controller.h            |   1 +
 8 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
 create mode 100644 drivers/mailbox/mtk-apu-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-apu-mailbox.h

-- 
2.18.0


