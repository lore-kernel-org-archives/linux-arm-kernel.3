Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15915D0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qzmpXSP96VCl55BYbAELjaoJE0JaKXnVW27Q0eZgiiU=; b=b3Bf9rl4uoHi+mHD/beOq/wk8R
	9QAujbZ3YxSxXNza5DJqz/m5Pe8unyc5h7zaSawkoUfjMImHwpYyhOhxgKBMjUBxMd58bLmbSw7lq
	x3NGD0VUpgIIxZ6kF+tHtDSe6FF3Xge7VGW3M+q/VAYRO8w5bsEXMirzSGDflYQx5AhNFPY51V2zy
	VEpOIHo71if1R5duZVDPEcdq0ZkQ+MBEHXemGEhOvlwoeXdLLvfK229Hh+uHcufNcyz7KLnY9YKb5
	Lkuwh8/3OPtOTXCVWnYPEP3iBz3/Mhl2C7PXmv+ZF/LUCuYqcmZxY+0vnbF2s61vGRH1zcaKoOVx+
	/w0OfsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uEh-0000000HUBb-0Vs5;
	Thu, 24 Oct 2024 09:34:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u7r-0000000HSMs-3Arx;
	Thu, 24 Oct 2024 09:27:29 +0000
X-UUID: 2bea316e91ea11ef9048ed6ed365623b-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qzmpXSP96VCl55BYbAELjaoJE0JaKXnVW27Q0eZgiiU=;
	b=tI/h7ACdBzMK0HJJpK/FvzGuob1AkmAQRTFtjBQb9KYFn4SlEEAFAe04ZGTTsd0zlRWxe6qlKqLFNNZJEzh3Wd4djvaKyY3p9hsDhIqEgoZnUxzwMgJ8GXMGSqsbceMHhLzWI+1af7MwolGLmJbva+Ix5kZ/L39yQCo8iLb0ffE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:d9713d9a-a719-4318-9845-4aa18416346e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:886d0b2e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2bea316e91ea11ef9048ed6ed365623b-20241024
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 858575642; Thu, 24 Oct 2024 02:27:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 17:27:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 17:27:19 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Karl Li <Karl.Li@mediatek.com>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH 0/1] Add MediaTek APU SMC call Definition
Date: Thu, 24 Oct 2024 17:27:04 +0800
Message-ID: <20241024092712.431605-1-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_022727_841644_11A22A55 
X-CRM114-Status: UNSURE (   8.08  )
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

Based on tag: next-20241021, linux-next/master

Hello,

This patch introduces the SMC calls for MediaTek APU.

The start and stop sequences of the APU microprocessor are managed within the ARM Trusted Firmware (ATF), which requires a secure and reliable communication channel to issue commands from the non-secure world. This patch adds the necessary infrastructure to issue these SMC calls, ensuring that the APU can be securely managed by the system's software.

Please review and provide feedback.

Best regards

Karl Li (1):
  soc: mediatek: Add command for APU SMC call

 include/linux/soc/mediatek/mtk_apu_secure.h | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_apu_secure.h

-- 
2.18.0


