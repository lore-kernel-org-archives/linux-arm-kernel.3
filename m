Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gnyni3j/2zlxfKswDNVSdULzZ8nrI/K6H0ZWv8Sd6w=; b=rTKY5nCgxAwStNAyE8InLq5xPh
	0uZk2aEcCUO4PYtQI8UjX9a0EQLsTerR2jtpa4oh01dxpl67J9joQJ/ofrq6uV0nca0oL10PsBJqN
	tmzl7WYm1iLaQxn4KZXdiEzScjhWnbuza8YWztkmY+RcImEIvFlQyPfgx3J/svENx07bZTCQ9hAYE
	X+JKyE4d13Oqg4JhSeYw3Ar7WA0mMw3leK45tylBTZUOcS2jE6F3FEBoBSstW46UD0ujRY60S748O
	9u3KzWJGxbQD96/i9oxNa8P0Xor7t1vvXtLi0L8z+6WmYDgQAXNBfyhQmg1u8cXCrS0FZLET9XTKT
	yQvGRcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdtu-0000000EGVP-17f4;
	Wed, 03 Jun 2026 05:12:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdtq-0000000EGTL-3qTa;
	Wed, 03 Jun 2026 05:12:20 +0000
X-UUID: c554c0145f0a11f1acbe4559397dec65-20260602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4gnyni3j/2zlxfKswDNVSdULzZ8nrI/K6H0ZWv8Sd6w=;
	b=FFvAZLx4KLSDHFNz97bytnVbI+pLsxM75yPr9fb8iQWd/X2pPYWc+rjAKXL5t9mFu9UkzZ640uaf+YUtYvmrL92NGCaj2yrRxPOj7EYm6a5oIY8gep5DSlrPMjmaVsSGzR3mga4JwAk/PQa6aGwYVsrEFNg0HqktBSO0VPm3mhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8a4e0ea8-8edd-4065-a971-b102a2f07aad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:20f57312-8806-49f4-b569-cc4d16bd954b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|136|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c554c0145f0a11f1acbe4559397dec65-20260602
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2138250194; Tue, 02 Jun 2026 22:12:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 13:12:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 13:12:06 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 0/2] pmdomain: mediatek: Enable module support for mtk-scpsys
Date: Wed, 3 Jun 2026 13:11:49 +0800
Message-ID: <20260603051200.1163226-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_221218_954087_DCACB024 
X-CRM114-Status: GOOD (  12.47  )
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

This series enables the MTK_SCPSYS driver to be built as a loadable
module for GKI (Generic Kernel Image) compliance.

This series depends on the following patches currently under review:
  - soc: mediatek: Allow MTK_INFRACFG to be built as module
  - soc: mediatek: mtk-infracfg: Export symbols for DDK modules

The MTK_SCPSYS driver depends on MTK_INFRACFG being available as a
module, which is enabled by these prerequisite patches.

Patch 1 converts the Kconfig option from bool to tristate, allowing
the driver to be built as either built-in or as a module.

Patch 2 adds MODULE_DESCRIPTION() and converts to module_platform_driver()
to complete the modularization and silence modpost warnings.

Together these changes allow the MediaTek SCPSYS power domain driver
to support modern Android GKI/vendor_dlkm module loading requirements
while maintaining backward compatibility with the traditional built-in
configuration.

Justin Yeh (2):
  pmdomain: mediatek: Convert MTK_SCPSYS to tristate
  pmdomain: mediatek: Add MODULE_DESCRIPTION to mtk-scpsys

 drivers/pmdomain/mediatek/Kconfig      | 2 +-
 drivers/pmdomain/mediatek/mtk-scpsys.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2


