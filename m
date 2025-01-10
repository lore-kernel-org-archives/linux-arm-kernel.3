Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FEFE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 01:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAHO4w1hXNy3c35imVv0FqBXeCgA2twC673V0Mqfm+I=; b=O0d3ymZMnanHLmzPloxWCBDkL5
	xxExbUzPxCSFqs2elzYXhBgAaqkqbKThI0Y/0fTnKxRyLSVtBZzt/H1vjUO21CEkYic8QAie3DA1E
	+302bZB5FT2g0rcsgzTpC4H6zBYvIbeviIgw5U3X8qJLuXRl9vqhA0+v3mQnnfxQHKy10FKv1tb2y
	9nmliqgJ6ApcKaxyzNtgQMaaJFDji6RftHmO6bNpQiGP7DGGs6y0HXy7Sj+rkvmGZXPGzt0sUE65l
	pxJvhV8bnqdzUGsDvzo7eHTs4x2ZdLJ51MYd9r9uhaCySxnb945FSMwPezG7M5h/SnvOz7LITh7bA
	IfslgPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3pw-0000000Dkim-0dp0;
	Fri, 10 Jan 2025 01:29:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3oe-0000000DkHz-3AVe;
	Fri, 10 Jan 2025 01:28:02 +0000
X-UUID: 1dfe6904cef211ef82ff63e91e7eb18c-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gAHO4w1hXNy3c35imVv0FqBXeCgA2twC673V0Mqfm+I=;
	b=n/1+PvK+tPSu+oed5lOaTiIP2q7ykDEXH85+KnijEmp8cFLffIcIXwYFZ5xmiKYNZQdeDEJPVrv9m5d8UUeMJkZql40jCbvvzJwVS5qTYGaWvyx6SIzdSybtYkISjA2CcUxcCq6Q1bCOxEiLbQrAyIGhLUt7HsyHSCnG1J+pxWE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4617cbd7-16f0-41eb-8644-1ff11ca7cdda,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:7ccda637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1dfe6904cef211ef82ff63e91e7eb18c-20250109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1738935735; Thu, 09 Jan 2025 18:27:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:51 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Fri, 10 Jan 2025 09:27:37 +0800
Message-ID: <20250110012749.30072-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_172800_793719_442C5AB3 
X-CRM114-Status: UNSURE (   9.67  )
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

This series adds support for mt8196 multi-hardwares jpeg enc & dec,
by first adding mt8196 jpegdec and jpegenc compatible to install
kernel driver. Add smmu setting to support smmu and iommu at the
same time.
Secondly refactor buffer and clock setting to support multi-hw jpeg
working.
Lastly, fix some bugs, including resolution change handleing, stop
streaming sw flow and others.

This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1-3 Adds jpeg encoder and decoder compatible.
Patches 4 add jpeg smmu sid setting.
Patches 5 fix jpeg hw count setting to support different chips.
Patches 6 refactor jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 7 reconstruct jpeg dst buffer layout.
Patches 8 fix multi-core stop streaming flow
Patches 9 refactor multi-core clk suspend/resume setting
Patches 10 fix decoding buffer number setting timing issue
Patches 11 refactor decoding resolution change operation
Patches 12 fix remove buffer operation

---
This series patches dependent on:
[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20240808092555.12999-1-jianhua.lin@mediatek.com/

kyrie.wu (12):
  dt-bindings: mediatek: Add mediatek, mt8196-jpgdec compatible
  dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting
  media: mediatek: jpeg: fix jpeg hw count setting
  media: mediatek: jpeg: refactor jpeg buffer payload setting
  media: mediatek: jpeg: refactor jpeg dst buffer layout
  media: mediatek: jpeg: fix stop streaming flow for multi-core
  media: mediatek: jpeg: refactor multi-core clk suspend and resume
    setting
  media: mediatek: jpeg: fix decoding buffer number setting timing issue
  media: mediatek: jpeg: refactor decoding resolution change operation
  media: mediatek: jpeg: fix remove buffer operation for multi-core

 ....yaml => mediatek,multi-core-jpegdec.yaml} |  10 +-
 ....yaml => mediatek,multi-core-jpegenc.yaml} |  10 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 126 ++++++++++++------
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  17 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 115 +++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   4 +
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 112 +++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |   4 +
 8 files changed, 341 insertions(+), 57 deletions(-)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} (95%)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegenc.yaml => mediatek,multi-core-jpegenc.yaml} (94%)

-- 
2.46.0


