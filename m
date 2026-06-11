Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9EDCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lu0ccYQsRw99cS5wqcElRVz4QHqtm7tew269NO2xzmI=; b=Q/bNA6bikyRGNCOncuZ+jlG180
	hacSkVYOyRTMk/vXWCTX3BLKXKFO41OF7LDzh8Z77EjeUmAU/I13qP03lvMb63VTsuwFpkIRL8+2l
	nOmmR8/4w/s4WVJCQMQPZCUfidO9CfPg0d+x21H1RaUDycGj7cav3Nk71P12Sywhy6/cdJVKCphW8
	+7wjsirS8GVebqTHZRtHV0cuzR0NQoMSwMZQK9IVlup0AnPZyHkn2YuN5+oGmqhl+6Knox6ahoeqN
	GOa46WndxcVPaYXSd3TxQBTHnCJpC2rnLP0G9sYISick3U2fS2SkSRnHjFtKuVInMPen4plQvqKE4
	SWQaCJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXonS-0000000AAZr-0osI;
	Thu, 11 Jun 2026 23:26:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXonQ-0000000AAYt-0D3A;
	Thu, 11 Jun 2026 23:26:49 +0000
X-UUID: 0188f1f265ed11f1acbe4559397dec65-20260611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lu0ccYQsRw99cS5wqcElRVz4QHqtm7tew269NO2xzmI=;
	b=PvHma8e+E4hIujnSbgehEMcWVGVrplr/11X2hbG8pHWW7SxxA5zTZylM/O4uzROWW0CvmSWVhclKl4xtmTBLaQYLYXe9Vxeg+s69GyDV2I8F6XrbYqWOzsCZcbnvLr1HY4S5rktZfqFHgRiD8W4KFiNvgijLIbbwgn0P+ZfZR3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:5ec8423f-71fb-4d53-bb85-aae0e61c1888,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:5dd2f8a4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0188f1f265ed11f1acbe4559397dec65-20260611
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1412093326; Thu, 11 Jun 2026 16:26:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 07:26:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 07:26:40 +0800
From: <ed.tsai@mediatek.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH v2 0/3] ufs: Add callback for vendor-specific RTT capability
Date: Fri, 12 Jun 2026 07:26:29 +0800
Message-ID: <20260611232632.2324422-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_162648_105021_2DC4DCB8 
X-CRM114-Status: GOOD (  10.90  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

The first patch adds the get_hba_nortt() callback to the UFS core layer,
allowing vendor drivers to provide dynamic, platform-specific RTT
capability handling.

The second patch implements this callback in the MediaTek UFS driver,
distinguishing between legacy platforms (which require the RTT to be
limited to 2) and newer MT6995 B0+ platforms (which can use the value
from the capability register directly).

The third patch removes the max_num_rtt field from ufs_hba_variant_ops
as it is now replaced by the get_hba_nortt() callback.

Changes in v2:
- Keep max_num_rtt field in patch 1 to maintain bisectability
- Split removal of max_num_rtt into a separate patch (patch 3)

Ed Tsai (3):
  ufs: core: Add get_hba_nortt callback for vendor-specific RTT
    capability
  ufs: mediatek: Implement get_hba_nortt callback for RTT capability
  ufs: core: Remove max_num_rtt field from ufs_hba_variant_ops

 drivers/ufs/core/ufshcd.c       |  9 +++++----
 drivers/ufs/host/ufs-mediatek.c | 12 +++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  4 ++--
 include/ufs/ufshcd.h            |  4 +++-
 4 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.45.2


