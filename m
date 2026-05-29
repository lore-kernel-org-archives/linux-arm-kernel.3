Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE0CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxNKVfOIP5QBmB5Hp5S5jqq/Wjfw2+y9WckaJ2xilqE=; b=sq1odwHQnP4DA9Zh6YYl+gYgQM
	m3f1YuRMFvgv9IgTE29flYYUS7HECDzKita5aazsTluqKwJFjzqMymy5HPg2/KsoBXXTnArU8jbw2
	aJlD8xlZOYkEcKVEDdZSJo8W5J5POV+NGDhck+lme+jDsM2b8Wsw2ZewIOkdcI3ntGJN83hdkQbk3
	c2hfVdHfsufuFx2TZ7zLINSG2BWnnvQpAXP8+2f9x2pzb2w+rhU0+CWD8qYpOTsB1M0dy2DyJe9QC
	Nc/Mdd94RHXc2Le4nrF/1rGCvhgwhogLbLub1mRDw2fv+MYKDEMeumEcx0sxATiSkt8RoUhJ2X5xX
	7PnSMacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4P-000000078BX-32b6;
	Fri, 29 May 2026 10:04:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4N-000000078At-1kgX;
	Fri, 29 May 2026 10:04:00 +0000
X-UUID: b2bbc89e5b4511f1acbe4559397dec65-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jxNKVfOIP5QBmB5Hp5S5jqq/Wjfw2+y9WckaJ2xilqE=;
	b=A+2GhhGlG4Ue+HM1hex/gu1ro+ywT11mQscu/JNxDqVY5rfe3lLqrKufpUJNhwN3BHj3iTalRMctcjhXWzZE9APEAcF+BKASgh2Sjd8ilvLFQv1mcVvIOQoFnGMhd8VUUfXHnctrXohJdmficrfO3C6AXFGAaK+9fEOKh9alZJw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:84a92f22-8689-44e2-af7e-93df48fa5fcb,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:1291d0f6-ddd5-40e6-821c-e08002aeddf5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2bbc89e5b4511f1acbe4559397dec65-20260529
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 463871396; Fri, 29 May 2026 03:03:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:03:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:03:49 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Enable MT8189 as loadable module
Date: Fri, 29 May 2026 18:02:40 +0800
Message-ID: <20260529100308.51271-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030359_462924_B9561001 
X-CRM114-Status: GOOD (  10.15  )
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

This series enables PINCTRL_MT8189 to be built as a loadable kernel
module, which is required for GKI (Generic Kernel Image) + vendor_dlkm
deployments where vendor-specific drivers must be kept separate from
the GKI vmlinux.

Patch 1 restores the tristate option that was recently changed to bool,
preventing module builds. Patch 2 adds the missing MODULE_LICENSE macro
that's required when building as a module.

Together these changes allow MT8189 pinctrl to be properly packaged as
a vendor kernel module while maintaining the existing built-in option.

Justin Yeh (2):
  pinctrl: mediatek: Restore PINCTRL_MT8189 to tristate
  pinctrl: mediatek: mt8189: Add MODULE_LICENSE declaration

 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.45.2


