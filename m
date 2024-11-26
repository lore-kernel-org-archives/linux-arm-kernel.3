Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1C3D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zR28T4HcO7uRDu1sJWB1JUuBH1e3vmJiErnnGI44bIU=; b=U4VbF7hETuHyoFBi3JPqqyoIXx
	dqng8H0M30GVqWprSrywgpnD5iSPbTaIQ9wXYKMtYUK060VM2ObftrJpHjY7eqAvMMDC3E6Tdnv2/
	ryJJ+HMAEgU4eWmma1WkF31qYCrrZJX1l/hnPgxwqeUYhhHOlVnBUqfPTZSR6b1NFjDNy2F+j0FCr
	AZ7fAfVwGfnTVa24mPcGOxvn6zqa7ADtfhNWL/6ZfxlSNdtoDDRFwvBwDzpfVlwASU+TfiIzaoVj6
	IZjTRh5QGF58lycRGyozrgp+XRy3EKLNHafHN3PL4gSdQ1pguyP1lblSMRIQZ1hlcfvfB9VGARh78
	xdHyyHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv2p-0000000AbeW-2sUE;
	Tue, 26 Nov 2024 12:51:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv1r-0000000AbSj-3d8A;
	Tue, 26 Nov 2024 12:50:57 +0000
X-UUID: 108fa87aabf511ef9048ed6ed365623b-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zR28T4HcO7uRDu1sJWB1JUuBH1e3vmJiErnnGI44bIU=;
	b=GAF+8W9C+XwHpXMEbeMigRrwTGRbIu6Fmwb8J+ygPpGbhznMfXre6+JrpcH3C62uAs7btuHsujXE9vvC4TD3gXA3h220B2DPi3svWsej9RvwVIl2FL/ixNMyXYVTjEcVJ3nlvBqR6gqmtBlOYFFmdobOusasEAta7auNId+VGn0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:772da9ab-fdc8-498e-b919-f20fb6470855,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:a9274ee0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 108fa87aabf511ef9048ed6ed365623b-20241126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1296758931; Tue, 26 Nov 2024 05:50:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 20:50:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 20:50:45 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <avri.altman@wdc.com>, <adrian.hunter@intel.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 0/2] Add mtk-sd support for ignoring cmd response CRC
Date: Tue, 26 Nov 2024 20:48:21 +0800
Message-ID: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.889200-8.000000
X-TMASE-MatchedRID: d+baqQ3qUqc9S3IiQd+eNbmR+C0l9vjVc3ewuwbSaG4Y0A95tjAn+9TT
	TFFPxHv+u2t1gv/FTZu+gPhGSQqXaXAvdl/gU+kWhK8o4aoss8pKPIx+MJF9o5soi2XrUn/J8m+
	hzBStansUGm4zriL0oQtuKBGekqUpnH7sbImOEBRDozr28CiiojKTexvwXZBrsmqd7uJXrWO/Ml
	oQ6zIAH/Cy9GvqHOwrPyjHI+FEw3HHHuNqhV1uRVgwOoJTNhLaqeqo7KB4WGHyNp7g4PXe0BXsx
	z6ujBxUq1f8XSkHBUmNJXmEMVvLtpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.889200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 31A115BA487A2D1BB3781A4ED6205A89D2BD525579309D2E70C160360EDFE3AB2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045055_910108_A23FB85D 
X-CRM114-Status: UNSURE (   9.86  )
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

Add the process flow in the host driver to handle the R1B cmd response
type with ignoring CRC, which comes from mmc_cqe_recovery() in the mmc
core. Additionally, the response type 'MMC_RSP_R1B_NO_CRC' is introduced
to simplify code.

---
Changes in v2:
- Change mmc_cqe_recovery() to use MMC_RSP_R1B_NO_CRC response type.
- Remove MMC_RSP_R1_NO_CRC in the host driver after it is dropped.

Link to v1:
https://patchwork.kernel.org/patch/13883787

---
Andy-ld Lu (2):
  mmc: core: Introduce the MMC_RSP_R1B_NO_CRC response
  mmc: mtk-sd: Add support for ignoring cmd response CRC

 drivers/mmc/core/core.c   | 6 ++----
 drivers/mmc/host/mtk-sd.c | 6 ++++--
 include/linux/mmc/core.h  | 2 ++
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.46.0


