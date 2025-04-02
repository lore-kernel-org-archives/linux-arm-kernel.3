Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E6DC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZfylEnuuGaFHWJYkmAWFhZ3H3gqBPJ+dZpFKqdQdJYo=; b=287gbimtSivsylTk+JaD4rNbRk
	BrhkrC5o/YFQvAGiYYnjmpWo+hvlH4pW2qm/vo9nTyqgRFB7RWG3xBl9Dch7lebHhJ34+UaCGAHxZ
	00lnViNaVgaC+RHHY/IqM2UJjwggWPY/NmVDb0IO6pt8h9kgtoyN+B6JvKLFHp632UW7wiIzZJ+7I
	Yip8Pd+UqmYP3plkJvvIyA4ZaZBwfIqfkjIAY7adJv0/ED1ild/esJdSaiJKAFc8aseuliXcpIQKT
	T/falAVgFpppGhMCDu4xw6Udgs6wAJp9B2o9h5qGOM8xdsVEp+3Q3p6HPe77AvaWHH3+Q0rJ7EGxO
	GOkHqSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuKs-00000005gCj-1kvt;
	Wed, 02 Apr 2025 09:24:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuIQ-00000005fdc-35p1;
	Wed, 02 Apr 2025 09:22:07 +0000
X-UUID: efa6e0e80fa311f0a1e849db4cc18d44-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZfylEnuuGaFHWJYkmAWFhZ3H3gqBPJ+dZpFKqdQdJYo=;
	b=OJInvAc4AtVxo+eR6AvtrSSLnR2f5XtaDsoexbIre2rBW8+LDdb2OJcYQbq2bIB3GIxr6RKfMseEXZ7UgwtSCrPZePD1Nnya4/coYODTEHsOYLtQQjQ/YKMf+qN92EtwB7iibNZXxiEhZYBss/m77/IPzZ7UooZy+2ft6C1L+yg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a2081a2d-25f1-4820-94df-a8dda537b5e6,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:1e61e04a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: efa6e0e80fa311f0a1e849db4cc18d44-20250402
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 557256231; Wed, 02 Apr 2025 02:22:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Apr 2025 17:21:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Apr 2025 17:21:58 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jjian.zhou@mediatek.com>, <hailong.fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH 0/2] Add vcp driver
Date: Wed, 2 Apr 2025 17:19:23 +0800
Message-ID: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022206_780651_113D9AE9 
X-CRM114-Status: GOOD (  12.41  )
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

Add support MediaTek's Video Companion Processor(VCP) host driver to
control the MediaTek VCP Risc-V coprocessor.
The VCP host driver using rproc mechanism to load vcm firmware
from filesystem, and using SMC services to request ATF to setting
vcp boot sequence, and Host communicated with VCP FW depends on VCP
IPC interfaces

This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://patchwork.kernel.org/project/linux-mediatek/patch/20250317110331.2776-4-jjian.zhou@mediatek.com/

note: dependent on arm,smmu-v3 Mediatek patch, onwer https://patchwork.kernel.org/project/linux-mediatek/list/?submitter=216242 

Xiangzhi Tang (2):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoterpoc: mediatek: vcp: Add vcp remoteproc driver

 .../remoteproc/mediatek,mt8196-vcp.yaml       | 174 ++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   4 +
 drivers/remoteproc/mtk_vcp_common.c           | 982 ++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           | 251 +++++
 drivers/remoteproc/mtk_vcp_rproc.c            | 724 +++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            | 107 ++
 include/linux/remoteproc/mtk_vcp_public.h     | 138 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
 9 files changed, 2395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.45.2


