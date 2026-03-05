Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB606EEF31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hatXOazS/PMgDqI8FQgcj0SgTxYF3DGwz2EXpKXIKtE=; b=xYssylTiC/cJjxLSAdX4xXNitK
	9+qUYOM2MdPvhA577m1zOnhoufsJ9pKaKYGiIgXuWWy0EheH8EwkJdH0g3tkPk7lOSv3zcaDO+3iB
	oZ8ahp+jSF8aAbYC1UUYrLRNy/r4EB6WY/N7ziSMXZVI0Zga42qscfYT4lkCTRCLI2r9O3MUxl0TY
	IvYxrWWXL13Do1Bk/dkNmf0uL8F3uHlcocNwPKyS+asXQk6Zy0ZmuAQ0sQuanYsAQXdoUZVRlfk+W
	MMZxZi4hVMTefRbNa7KgP4p9Lt0bI4zEJTGPTEoWVnCgDsTe13AXpJM3soM+is/BJK0rJuaUJpPcD
	MCn8nRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qr-00000001FCM-0zK0;
	Thu, 05 Mar 2026 08:51:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Qm-00000001F9P-2xp6;
	Thu, 05 Mar 2026 08:51:41 +0000
X-UUID: 62264bc6186e11f1ad39f32c34db0b1c-20260305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hatXOazS/PMgDqI8FQgcj0SgTxYF3DGwz2EXpKXIKtE=;
	b=QisUPOzV5pVZZT3QHIQpjmaxtm6b1b8cR90Qav9Atc7pwW43bjTFNx9THt3PUtY9qA1gzRUDwPMoZ0wjYTOqQ4c4bmvqwhGbmDh9sm8C2GsfEzGnmRUL3/jDebLw8266zHgtzGYWg+LK8FXn+HmqmjcOxhtIGiO0tvaNfvgnaeU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:0d9bd989-387b-45bb-88ab-26a0143269dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:72e18c7b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62264bc6186e11f1ad39f32c34db0b1c-20260305
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1960008648; Thu, 05 Mar 2026 01:36:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Mar 2026 16:36:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Mar 2026 16:36:17 +0800
From: <ed.tsai@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/2] ufs: add delay for VCC ramp-up stability 
Date: Thu, 5 Mar 2026 16:29:13 +0800
Message-ID: <20260305083610.2672344-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005140_745581_78FB27F3 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi,

This patch series resolves a link stability issue found on our certain
platforms where the VCC regulator has a slow ramp-up time.

To fix this, a delay is needed after VCC is turned on. The solution is
implemented in two parts:

1. Introduced the new host quriks, UFSHCD_QUIRK_VCC_ON_DELAY.
2. Applied in our new platform with UFS5 device to enusre the VCC is
   ready before we enable the clocks.


